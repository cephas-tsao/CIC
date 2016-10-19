using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using Utility;

namespace DAL
{
    public class Login
    {
        static string dbname = "USER_Information";

        public static string[] login_datacheck(string username,string CID)
        {
            string[] output = new string[4];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select a.[Password],a.[CompanyID],a.[Status],a.[Name],b.[BCName] from UserDB a left join CompanyDB b on a.CompanyID=b.CompanyID Where a.Username='" + username + "' and b.BCName='" + CID + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return output;
                                }
                                else
                                {
                                    output[0] = reader.GetString(0);
                                    output[1] = reader.GetInt32(1).ToString();
                                    output[2] = reader.GetString(2);
                                    output[3] = reader.GetString(3);
                                    if (reader.IsDBNull(3))
                                    {
                                        output[3] = username;
                                    }
                                    else
                                    {
                                        output[3] = reader.GetString(3);
                                    }

                                }
                            }
                        }
                    }


                    conn.Close();
                    return output;
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                return output;
                throw ex;
                //Display Error message
            }

        }

        public static string[] Company_Information(string status, int CID)
        {
            string[] output = new string[2];
            if (status == "1")
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn =
                        new SqlConnection(connectionString))
                    {
                        conn.Open();

                        using (SqlCommand cmd =
                            new SqlCommand("select * from CompanyDB Where CompanyID='" + CID.ToString() + "'", conn))
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
                                        output[0] = reader.GetString(1);
                                        output[1] = reader.GetString(2);
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
                
            }
            return output;
        }

        public static string get_menu(string access, string dbname, string UpperID)
        {
            string menulist = "";
            string selectstring = "select * from " + dbname + ".dbo.FunctionList where FunctionID in (";
            string selectstring_back = ") and Status=1 and UpperID=" + UpperID;
            string[] functionlist = access.Split(',');
            foreach (string i in functionlist)
            {
                selectstring += i + ",";
            }
            selectstring = selectstring.Substring(0, selectstring.Length - 1);
            selectstring += selectstring_back;

            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(selectstring, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return menulist;
                                }
                                else
                                {
                                    menulist += reader.GetString(2) + "," + reader.GetString(3) + ",";
                                    //menulist += reader.GetString(2) + ",http://localhost:61200/" + reader.GetString(3) + ",";
                                    //menulist += reader.GetString(2) + ",http://140.118.105.234:8088/" + reader.GetString(3) + ",";
                                    //menulist += reader.GetString(2) + ",http://140.118.5.166:8088/" + reader.GetString(3) + ",";
                                    //return menulist;
                                }
                            }
                        }
                    }

                    conn.Close();
                    menulist = menulist.Substring(0, menulist.Length - 1);
                    return menulist;
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                return menulist;
                //Log exception
                //Display Error message
            }
        }

        public static string get_access(string dbname, string username, string PID)
        {
            string access = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select FunctionID from UserProjectAssign where ProjectID='" + PID + "' and UserID = (select USER_Information.dbo.UserDB.UID from USER_Information.dbo.UserDB where Username='" + username + "')", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return access;
                                }
                                else
                                {
                                    access += reader.GetInt32(0).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    if (access.Length > 0)
                    {
                        access = access.Substring(0, access.Length - 1);
                    }
                    return access;
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                return access;
                //Log exception
                //Display Error message
            }
        }

        public static string get_module_access(string dbname, string username,string CompanyID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ModuleID from ModuleAccess where UserID = (select USER_Information.dbo.UserDB.UID from USER_Information.dbo.UserDB where Username='" + username + "' and CompanyID='" + CompanyID + "')", conn))
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
                                    result += reader.GetInt32(0).ToString() + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    if (result.Length > 0)
                    {
                        result = result.Substring(0, result.Length - 1);
                    }
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

        public static string Get_UserProjectPageAccess_by_UID_PID(string dbname, int UID, string ProjectCode)
        {
            string result = "";

            return result;
        }

        public static string Get_UserPageAccess_by_UID(string dbname, int UID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select UserProjectPageAccess.ProjectID,PageList.PageURL from UserProjectPageAccess join PageList on UserProjectPageAccess.PageID=PageList.PageID where UserProjectPageAccess.UserID=" + UID, conn))
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
                                    result += reader.GetInt32(0).ToString() + "," + reader.GetString(1) + ";";
                                }
                            }
                        }
                    }

                    conn.Close();
                    if (result.Length > 0)
                    {
                        result = result.Substring(0, result.Length - 1);
                    }
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
