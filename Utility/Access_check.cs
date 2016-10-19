using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Utility
{
    public class Access_check
    {
        public static bool project_access_check(string dbname, string username, string functionname, string ProjectID,string CompanyID)
        {
            bool result = false;
            int UID = get_UID_by_username(username, CompanyID);
            int FID = get_FID_by_functionname(dbname, functionname);
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [UID] from UserProjectAssign Where UserID=" + UID + " and ProjectID='" + ProjectID + "' and FunctionID=" + FID, conn))
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
                                    result = true;
                                }
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }


            return result;
        }

        public static bool check_common_access_by_Session(string access_session, string nowURL)
        {
            bool result = false;
            if (access_session.IndexOf(nowURL) != -1)
            {
                result = true;
            }
            return result;
        }

        public static bool check_project_access_by_Session(string access_session, string nowURL, string ProjectCode)
        {
            bool result = false;
            if (ProjectCode == "")
            {
                return result;
            }
            string checkaccess = ProjectCode + "," + nowURL;
            if (access_session.IndexOf(checkaccess) != -1)
            {
                result = true;
            }
            return result;
        }

        public static bool common_access_check(string dbname, string username, string functionname,string CompanyID)
        {
            bool result = false;
            int UID = get_UID_by_username(username, CompanyID);
            int FID = get_FID_by_functionname(dbname, functionname);
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [UID] from UserProjectAssign Where UserID=" + UID + " and FunctionID=" + FID, conn))
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
                                    result = true;
                                }
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }


            return result;
        }

        public static int get_UID_by_username(string username,string CompanyID)
        {
            string dbname = "USER_Information";
            int UID = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [UID] from UserDB Where Username='" + username + "' AND CompanyID='" + CompanyID + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return UID;
                                }
                                else
                                {
                                    UID = reader.GetInt32(0);
                                }
                            }
                        }
                    }


                    conn.Close();
                    return UID;
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                return UID;
                //Log exception
                //Display Error message
            }

        }

        public static int get_FID_by_functionname(string dbname, string functionname)
        {
            int FID = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [FunctionID] from FunctionList Where FunctionName='" + functionname + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return FID;
                                }
                                else
                                {
                                    FID = reader.GetInt32(0);
                                }
                            }
                        }
                    }


                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }

            return FID;
        }

    }
}
