using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;

namespace DAL
{
    public class SuperUserLogin
    {
        static string dbname = "USER_Information";

        public static string login_datacheck(string username)
        {
            string output = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [Password] from Superuser Where Username='" + username + "'", conn))
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
                                    output = reader.GetString(0);
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
    }
}
