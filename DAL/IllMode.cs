using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class IllMode
    {
        public static string savePath(string dbname)
        {
            string output = @"D:\Temp2\" + dbname + @"\IllustratedDoc\";
            return output;
        }
        public static int Insert_IllDoc(string dbname, string PCCNumber, string DocNumber, string DocName, string OldDocName ,string NewDocName, string ProjectCode, string DocType, string DocRelated, string Remark, string Username)
        {
            int UpdateID = 0;
            //bool result = false;
            int UID = DAL.SystemManage.Get_UserID_by_UserName(Username);
            string nowtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('IllustratedDoc'),IDENT_INCR('IllustratedDoc'), MAX(IllustratedDocID) from IllustratedDoc", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(2))
                                {
                                    if ((reader.GetSqlDecimal(0).ToString() == "1") | (reader.GetSqlDecimal(0).ToString() == "0"))
                                    {
                                        UpdateID = 1;
                                    }
                                }
                                else
                                {
                                    if (reader.GetInt32(2) == 0)
                                    {
                                        UpdateID = 1;
                                    }
                                    else
                                    {
                                        UpdateID = int.Parse(reader.GetSqlDecimal(0).ToString()) + int.Parse(reader.GetSqlDecimal(1).ToString());
                                    }
                                }
                            }
                        }
                    }

                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO IllustratedDoc([IllustratedDocFileName],[IllustratedDocName],[NewDocName],[IllustratedDocNumber],[PCCNumber],[UploadDateTime],[UploadUserID],[ProjectID],[IllustratedDocVersion],[TheNewest],[Remark],[Type],[RelatedDocID],[ReferenceID]) VALUES " +
                            "('" + OldDocName + "','" + DocName + "','" + NewDocName + "','" + DocNumber + "','" + PCCNumber + "','" + nowtime + "'," + UID + "," + ProjectCode + ",1,1,'" + Remark + "','" + DocType + "','" + DocRelated + "'," + UpdateID + ")", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows == 0)
                        {
                            UpdateID = -1;
                        }
                    }
                    conn.Close();
                    return UpdateID;
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }
            return UpdateID;
        }

        public static bool UpdateNewDocName_IllDoc(string dbname, int Ill_ID, string NewDocName)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Update IllustratedDoc Set NewDocName='" + NewDocName + "' Where IllustratedDocID =" + Ill_ID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }
            return result;
        }

        public static string Get_Username_by_UserID(int UID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information"); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [Username] from UserDB where UID=" + UID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                }
                                else
                                {
                                    result = reader.GetString(0);
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }
            return result;
        }

        public static string Get_IllustratedDocName_by_IllustratedDocID(string dbname, int IID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select IllustratedDocName from IllustratedDoc where IllustratedDocID = " + IID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result = reader.GetString(0);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }

            return result;
        }

        public static string[] Get_IllustratedNewDocName_by_IllustratedDocID(string dbname, int IID)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select NewDocName, IllustratedDocFileName from IllustratedDoc where IllustratedDocID = " + IID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] = reader.GetString(0);
                                result[1] = reader.GetString(1);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }

            return result;
        }

        public static bool Update_IllDoc_Status(string dbname, int Ill_ID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Update IllustratedDoc Set TheNewest=0 Where IllustratedDocID =" + Ill_ID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }
            return result;
        }

        public static string[] Get_OldInformation_by_IllustratedDocID(string dbname, int IID)
        {
            string[] result = new string[8];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select IllustratedDocFileName,IllustratedDocName,IllustratedDocNumber,PCCNumber,IllustratedDocVersion,Type,RelatedDocID,ReferenceID from IllustratedDoc where IllustratedDocID = " + IID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] = reader.GetString(0);
                                result[1] = reader.GetString(1);
                                result[2] = reader.GetString(2);
                                result[3] = reader.GetString(3);
                                result[4] = reader.GetInt32(4).ToString();
                                result[5] = reader.GetString(5);
                                result[6] = reader.GetString(6);
                                result[7] = reader.GetInt32(7).ToString();
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }

            return result;
        }

        public static int Update_IllDoc(string dbname, string PCCNumber, string DocNumber, string DocName, string OldDocName, string NewDocName, string ProjectCode, string DocType, string DocRelated, string Remark, string Username, int ReferenceID, int UpdateVersion)
        {
            int UpdateID = 0;
            //bool result = false;
            int UID = DAL.SystemManage.Get_UserID_by_UserName(Username);
            string nowtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('IllustratedDoc'),IDENT_INCR('IllustratedDoc'), MAX(IllustratedDocID) from IllustratedDoc", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(2))
                                {
                                    if ((reader.GetSqlDecimal(0).ToString() == "1") | (reader.GetSqlDecimal(0).ToString() == "0"))
                                    {
                                        UpdateID = 1;
                                    }
                                }
                                else
                                {
                                    if (reader.GetInt32(2) == 0)
                                    {
                                        UpdateID = 1;
                                    }
                                    else
                                    {
                                        UpdateID = int.Parse(reader.GetSqlDecimal(0).ToString()) + int.Parse(reader.GetSqlDecimal(1).ToString());
                                    }
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO IllustratedDoc([IllustratedDocFileName],[IllustratedDocName],[NewDocName],[IllustratedDocNumber],[PCCNumber],[UploadDateTime],[UploadUserID],[ProjectCode],[IllustratedDocVersion],[TheNewest],[Remark],[Type],[RelatedDocID],[ReferenceID]) VALUES " +
                            "('" + OldDocName + "','" + DocName + "','" + NewDocName + "','" + DocNumber + "','" + PCCNumber + "','" + nowtime + "'," + UID + ",'" + ProjectCode + "'," + (UpdateVersion+1) + ",1,'" + Remark + "','" + DocType + "','" + DocRelated + "'," + ReferenceID + ")", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows == 0)
                        {
                            UpdateID = -1;
                        }
                    }
                    conn.Close();
                    return UpdateID;
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                Console.Write(ex.ToString());
            }
            return UpdateID;
        }
    }
}
