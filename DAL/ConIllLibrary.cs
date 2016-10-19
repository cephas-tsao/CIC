using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using Utility;

namespace DAL
{
    public class ConIllLibrary
    {

        public static string savePath(string dbname)
        {
            string output = @"C:\SVN_CCIM\trunk\IMS\UploadFile\" + dbname + @"\ConstructionLibrary\";
            //string output = @"D:\asp.net\SVN_IMS\IMS\UploadFile\" + dbname + @"\ConstructionLibrary\";
            return output;
        }

        public static string Get_ElementFileName_by_ElementID(string dbname, int EID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ElementFileName from ConstructionElement where ElementID = " + EID, conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static int Insert_ConIllLibrary(string dbname, string Filename, string Elementname, string Username, string Remark, string Type,string ImgName)
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

                    using (SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('ConstructionElement'),IDENT_INCR('ConstructionElement'), MAX(ElementID) from ConstructionElement", conn))
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
                        new SqlCommand("Insert Into ConstructionElement([ElementFileName],[ElementName],[ElementVersion],[UploadDatetime],[UploadPerson],[ReferenceID],[TheNewest],[Remark],[Type],[ImgName]) VALUES ('" + Filename + "','" + Elementname + "',0,'" + nowtime + "'," + UID + "," + UpdateID + ",1,'" + Remark + "','" + Type + "','" + ImgName + "')", conn))
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

        public static bool Update_ConIllLibrary_Status(string dbname, int Element_ID)
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
                        new SqlCommand("Update ConstructionElement Set TheNewest=0 Where ElementID =" + Element_ID, conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static string[] Get_OldInformation_by_Insert_ConIllLibraryID(string dbname, int Element_ID)
        {
            string[] result = new string[5];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ElementFileName,ReferenceID,ElementName,ElementVersion,Type from ConstructionElement where ElementID = " + Element_ID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] = reader.GetString(0);
                                result[1] = reader.GetInt32(1).ToString();
                                result[2] = reader.GetString(2);
                                result[3] = reader.GetInt32(3).ToString();
                                result[4] = reader.GetString(4);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static int Update_ConIllLibrary(string dbname, string Username, string Filename, string Elementname, int ElementVersion, int ReferenceID, string Type, string Remark)
        {
            //bool result = false;
            int UID = DAL.SystemManage.Get_UserID_by_UserName(Username);
            string nowtime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            int UpdateID = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('ConstructionElement'),IDENT_INCR('ConstructionElement'), MAX(ElementID) from ConstructionElement", conn))
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
                        new SqlCommand("Insert Into ConstructionElement([ElementFileName],[ElementName],[ElementVersion],[UploadDatetime],[UploadPerson],[ReferenceID],[TheNewest],[Remark],[Type]) VALUES ('" + Filename + "','" + Elementname + "'," + (ElementVersion+1).ToString() + ",'" + nowtime + "'," + UID + "," + ReferenceID.ToString() + ",1,'" + Remark + "','" + Type + "')", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows <= 0)
                        {
                            UpdateID = -1;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }
            return UpdateID;
        }
        //ConIllLibrary.aspx公有雲select
        public static string[] Get_Public_Resource(string dbname)
        {
            string[] outp = new string[10];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ElementID,ElementFileName,ElementName,ElementVersion,UploadDatetime,UploadPerson,ReferenceID,TheNewest,Remark,Type from ConstructionElement", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + "|";
                                    outp[1] += reader.GetString(1) + "|";
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[2] += reader.GetString(2).ToString() + "|";
                                    }

                                    if (reader.IsDBNull(3))
                                    {
                                        outp[3] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[3] += reader.GetInt32(3).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(4))
                                    {
                                        outp[4] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[4] += reader.GetDateTime(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(7))
                                    {
                                        outp[7] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[7] += reader.GetBoolean(7).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(8))
                                    {
                                        outp[8] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[8] += reader.GetString(8).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(9))
                                    {
                                        outp[9] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[9] += reader.GetString(9).ToString() + "|";
                                    }
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }


            //if (result.Length > 0)
            //{
            //    result = result.Substring(0, result.Length - 1);
            //}
            return outp;
        }

        //ConIllLibrary.aspx私有雲select
        public static string[] Get_Private_Resource(string dbname)
        {
            string[] outp = new string[11];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ElementID,ElementFileName,ElementName,ElementVersion,UploadDatetime,UploadPerson,ReferenceID,TheNewest,Remark,Type,PublicID from ConstructionElement", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + "|";
                                    outp[1] += reader.GetString(1) + "|";
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[2] += reader.GetString(2).ToString() + "|";
                                    }

                                    if (reader.IsDBNull(3))
                                    {
                                        outp[3] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[3] += reader.GetInt32(3).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(4))
                                    {
                                        outp[4] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[4] += reader.GetDateTime(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(7))
                                    {
                                        outp[7] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[7] += reader.GetBoolean(7).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(8))
                                    {
                                        outp[8] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[8] += reader.GetString(8).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(9))
                                    {
                                        outp[9] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[9] += reader.GetString(9).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(10))
                                    {
                                        outp[10] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[10] += reader.GetInt32(10).ToString() + "|";
                                    }
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }


            //if (result.Length > 0)
            //{
            //    result = result.Substring(0, result.Length - 1);
            //}
            return outp;
        }

        //ConIllLibrary.aspx公有雲search
        public static string[] Get_PublicResource_Search(string dbname, string keyword)
        {
            string[] outp = new string[10];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ElementID,ElementFileName,ElementName,ElementVersion,UploadDatetime,UploadPerson,ReferenceID,TheNewest,Remark,Type from ConstructionElement where ElementName like '%" + keyword + "%' ", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + "|";
                                    outp[1] += reader.GetString(1) + "|";
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[2] += reader.GetString(2).ToString() + "|";
                                    }

                                    if (reader.IsDBNull(3))
                                    {
                                        outp[3] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[3] += reader.GetInt32(3).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(4))
                                    {
                                        outp[4] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[4] += reader.GetDateTime(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(7))
                                    {
                                        outp[7] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[7] += reader.GetBoolean(7).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(8))
                                    {
                                        outp[8] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[8] += reader.GetString(8).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(9))
                                    {
                                        outp[9] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[9] += reader.GetString(9).ToString() + "|";
                                    }
                                    //result += reader.GetInt32(0).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }


            //if (result.Length > 0)
            //{
            //    result = result.Substring(0, result.Length - 1);
            //}
            return outp;
        }

        //ConIllLibrary.aspx私有雲search
        public static string[] Get_PrivateResource_Search(string dbname, string keyword)
        {
            string[] outp = new string[11];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ElementID,ElementFileName,ElementName,ElementVersion,UploadDatetime,UploadPerson,ReferenceID,TheNewest,Remark,Type,PublicID from ConstructionElement where ElementName like '%" + keyword + "%' ", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + "|";
                                    outp[1] += reader.GetString(1) + "|";
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[2] += reader.GetString(2).ToString() + "|";
                                    }

                                    if (reader.IsDBNull(3))
                                    {
                                        outp[3] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[3] += reader.GetInt32(3).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(4))
                                    {
                                        outp[4] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[4] += reader.GetDateTime(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(7))
                                    {
                                        outp[7] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[7] += reader.GetBoolean(7).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(8))
                                    {
                                        outp[8] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[8] += reader.GetString(8).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(9))
                                    {
                                        outp[9] += "" + "|";

                                    }
                                    else
                                    {
                                        outp[9] += reader.GetString(9).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(10))
                                    {
                                        outp[10] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[10] += reader.GetInt32(10).ToString() + "|";
                                    }
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }


            return outp;
        }
        public static bool checkPublicID(string dbname, string ID)
        {
            bool result = false;
            //decimal AnaNum = 1.000M;
            string SQLString = "select PublicID from ConstructionElement where PublicID=" + ID;
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();
                    using (SqlCommand SelectList = new SqlCommand(SQLString, conn))
                    {
                        //conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                       
                        if (SelectList_read.HasRows)
                        {

                            result = false;
                        }
                        else
                        {

                            result = true;
                        }


                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }
            return result;



        }
    }
}
