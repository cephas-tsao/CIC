using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;

namespace DAL
{
    public class SystemManage
    {
        public static bool Check_UserName(string UserName)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information"); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [Username] from UserDB where Username='" + UserName + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    return true;
                                }
                            }
                        }
                    }

                    conn.Close();
                    return false;
                }
            }
            catch (SqlException ex)
            {
                return false;
                throw ex;
                //Display Error message
            }

        }

        public static bool Insert_User(string Username, string Password, string CompanyName, string Nickname, string Email, string Tel,string admin)
        {
            int CompanyID = Get_CompanyID_by_CompanyName(CompanyName);
            bool result = false;
            if (CompanyID != 0)
            {

                try
                {
                    string connectionString = Utility.DBconnection.connect_string("USER_Information");
                    using (SqlConnection conn =
                        new SqlConnection(connectionString))
                    {
                        conn.Open();

                        using (SqlCommand cmd =
                            new SqlCommand("Insert into UserDB([Username],[Password],[CompanyID],[Status],[Name],[Email],[Tel],[admin]) VALUES ('" + Username + "','" + Password + "','" + CompanyID.ToString() + "','1','" + Nickname + "','" + Email + "','" + Tel + "','" + admin + "')", conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows != 0)
                            {
                                result = true;
                            }
                        }
                        conn.Close();
                        return result;
                    }
                }
                catch (SqlException ex)
                {
                    throw ex;
                    //Display Error message
                }
                return result;
            }
            else
            {
                return result;
            }

        }

        public static int Get_CompanyID_by_CompanyName(string CompanyName)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information"); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [CompanyID] from CompanyDB where CompanyName='" + CompanyName + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    result = reader.GetInt32(0);
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }

            return result;
        }

        public static int Get_UserID_by_UserName(string UserName)
        {
            int UID = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information"); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [UID] from UserDB where Username='" + UserName + "'", conn))
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
                                    UID = reader.GetInt32(0);
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            return UID;
        }

        public static string Get_Module_Access(int UID, string dbname)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [ModuleID] from ModuleAccess where UserID='" + UID + "'", conn))
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
                                    result += reader.GetInt32(0).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static bool Update_Module_Access(string dbname, int UID, string access)
        {
            bool result = false;
            string[] accesslist = access.Split(',');
            bool insert_status = true;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd =
                        new SqlCommand("DELETE FROM ModuleAccess WHERE UserID=" + UID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    foreach (string k in accesslist)
                    {
                        using (SqlCommand cmd_insert =
                            new SqlCommand("INSERT INTO ModuleAccess(UserID,ModuleID) VALUES(" + UID + "," + k + ")", conn))
                        {
                            int rows = cmd_insert.ExecuteNonQuery();
                            if (rows >= 1)
                            {
                                insert_status = insert_status & true;
                            }
                        }
                    }
                    result = insert_status;

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

        public static string Get_Page_by_Module(string dbname, string Modulename)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [PageName] from [PublicDB].[dbo].PageList where UpperModel='" + Modulename + "'", conn))
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
                                    result += reader.GetString(0) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static string[] Get_ProjectName_Code_New(string dbname)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select PID,ProjectName from ProjectM0", conn))
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
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetString(1) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    result[0] = result[0].Substring(0, result[0].Length - 1);
                    result[1] = result[1].Substring(0, result[1].Length - 1);
                }
            }
            return result;
        }

        public static string[] Get_ProjectName_Code(string dbname)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ProjectCode,ProjectName from ProjectM0", conn))
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
                                    result[0] += reader.GetString(0) + ",";
                                    result[1] += reader.GetString(1) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    result[0] = result[0].Substring(0, result[0].Length - 1);
                    result[1] = result[1].Substring(0, result[1].Length - 1);
                }
            }
            return result;
        }

        public static string[] Get_Page_ID_by_Module(string dbname, string Modulename)
        {
            string[] result = new string[2];
            //string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [PageName],[PageID] from [PublicDB].[dbo].PageList where UpperModel='" + Modulename + "'", conn))
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
                                    result[0] += reader.GetString(0) + ",";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result[0] == null)
            {
                result[0] = "";
                result[1] = "0";
            }

            if (result[0].Length > 0)
            {
                result[0] = result[0].Substring(0, result[0].Length - 1);
                result[1] = result[1].Substring(0, result[1].Length - 1);
            }

            return result;
        }

        public static string[] Get_ProjectCodePageID_Access_by_UserID(string dbname, int UID)
        {
            string[] result = new string[2];
            result[0] = "";
            result[1] = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ProjectID,PageID from UserProjectPageAccess Where UserID=" + UID.ToString(), conn))
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
                                    result[0] += reader.GetString(0) + ",";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    result[0] = result[0].Substring(0, result[0].Length - 1);
                    result[1] = result[1].Substring(0, result[1].Length - 1);
                }
            }
            return result;
        }

        public static string[] Get_ProjectCodePageID_Access_by_UserID_New(string dbname, int UID)
        {
            string[] result = new string[2];
            result[0] = "";
            result[1] = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ProjectID,PageID from UserProjectPageAccess Where UserID=" + UID.ToString(), conn))
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
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    result[0] = result[0].Substring(0, result[0].Length - 1);
                    result[1] = result[1].Substring(0, result[1].Length - 1);
                }
            }
            return result;
        }

        public static bool Update_UPP_Access(string dbname, int UID, string access)
        {
            bool result = false;
            string[] access_list = access.Split(',');
            string[] accesslist = new string[access_list.Length / 2];
            for (int i = 0; i < accesslist.Length; i++)
            {
                accesslist[i] = "'" + access_list[2 * i + 1] + "'," + access_list[2 * i];
            }
            bool insert_status = true;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd =
                        new SqlCommand("DELETE FROM UserProjectPageAccess WHERE UserID=" + UID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    foreach (string k in accesslist)
                    {
                        using (SqlCommand cmd_insert =
                            new SqlCommand("INSERT INTO UserProjectPageAccess([UserID],[ProjectCode],[PageID]) VALUES(" + UID + "," + k + ")", conn))
                        {
                            int rows = cmd_insert.ExecuteNonQuery();
                            if (rows >= 1)
                            {
                                insert_status = insert_status & true;
                            }
                        }
                    }
                    result = insert_status;

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

        public static bool Update_UPP_Access_New(string dbname, int UID, string access2)
        {
            bool result = false;
            string[] access_list = access2.Split(',');
            string[] accesslist = new string[access_list.Length / 2];
            for (int i = 0; i < accesslist.Length; i++)
            {
                accesslist[i] = "'" + access_list[2 * i + 1] + "'," + access_list[2 * i];
            }
            bool insert_status = true;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd =
                        new SqlCommand("DELETE FROM UserProjectPageAccess WHERE UserID=" + UID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    foreach (string k in accesslist)
                    {
                        using (SqlCommand cmd_insert =
                            new SqlCommand("INSERT INTO UserProjectPageAccess([UserID],[ProjectID],[PageID]) VALUES(" + UID + "," + k + ")", conn))
                        {
                            int rows = cmd_insert.ExecuteNonQuery();
                            if (rows >= 1)
                            {
                                insert_status = insert_status & true;
                            }
                        }
                    }
                    result = insert_status;

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

        public static string Get_PageID_Access_by_UserID_and_ProjectID(string dbname, int UID, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select PageID from UserProjectPageAccess Where UserID=" + UID.ToString() + " and ProjectID=" + PID.ToString(), conn))
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
                                    result += reader.GetInt32(0).ToString() + ",";
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


            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static bool Update_UPP_Access_New2(string dbname, int UID, int PID, string access2)
        {
            bool result = false;
            string[] accesslist = access2.Split(',');

            bool insert_status = true;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd =
                        new SqlCommand("DELETE FROM UserProjectPageAccess WHERE UserID=" + UID + " and ProjectID=" + PID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    foreach (string k in accesslist)
                    {
                        using (SqlCommand cmd_insert =
                            new SqlCommand("INSERT INTO UserProjectPageAccess([UserID],[ProjectID],[PageID]) VALUES(" + UID + "," + PID + "," + k + ")", conn))
                        {
                            int rows = cmd_insert.ExecuteNonQuery();
                            if (rows >= 1)
                            {
                                insert_status = insert_status & true;
                            }
                        }
                    }
                    result = insert_status;

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
        //
        public static string Get_UserID_Access_by_PageID_and_ProjectID(string dbname, int PageID, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select UserID from UserProjectPageAccess Where PageID=" + PageID.ToString() + " and ProjectID=" + PID.ToString(), conn))
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
                                    result += reader.GetInt32(0).ToString() + ",";
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


            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static bool Update_UPP_Access_New3(string dbname, int PageID, int PID, string UserIDs)
        {
            bool result = false;
            string[] Userlist = UserIDs.Split(',');

            bool insert_status = true;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd =
                        new SqlCommand("DELETE FROM UserProjectPageAccess WHERE PageID=" + PageID + " and ProjectID=" + PID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    foreach (string k in Userlist)
                    {
                        using (SqlCommand cmd_insert =
                            new SqlCommand("INSERT INTO UserProjectPageAccess([UserID],[ProjectID],[PageID]) VALUES(" + k + "," + PID + "," + PageID + ")", conn))
                        {
                            int rows = cmd_insert.ExecuteNonQuery();
                            if (rows >= 1)
                            {
                                insert_status = insert_status & true;
                            }
                        }
                    }
                    result = insert_status;

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

        public static string Get_UserName_by_UserID(int UID)
        {
            string Username = "";
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
                                    Username = reader.GetString(0);
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
            return Username;
        }

        public static string Get_UserIDs_by_CompanyID(int CompanyID, out string username)
        {
            string result = "";
            username = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information"); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select UID,Username from UserDB where CompanyID=" + CompanyID.ToString(), conn))
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
                                    result += reader.GetInt32(0).ToString() + ",";
                                    username += reader.GetString(1) + ",";
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
            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
                username = username.Substring(0, username.Length - 1);
            }
            return result;
        }
    }
}
