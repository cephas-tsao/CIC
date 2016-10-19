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
    public class WordLibrary
    {
        public static bool datacheck(string dbname, string data)
        {
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("select count(content) from usualword where content='" + data + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.GetInt32(0) != 0)
                                {
                                    conn.Close();
                                    return true;
                                }
                                else
                                {
                                    conn.Close();
                                    return false;
                                }
                            }
                            conn.Close();
                            return false;
                        }
                        //int rows = cmd.ExecuteNonQuery();

                        //rows number of record got inserted
                    }
                }
            }
            catch (SqlException ex)
            {
                return false;
                throw ex;
                //Log exception
                //Display Error message
            }
        }

        public static bool datainsert(string dbname, string Type, string Content)
        {
            bool result = false;
            int sortnumber = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT MAX(Sortnumber) from UsualWord", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                sortnumber = reader.GetInt32(0) + 1;
                            }
                        }
                    }
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO UsualWord([Type],[ConTent],[Sortnumber]) VALUES('" + Type + "','" + Content + "'," + sortnumber.ToString() + ")", conn))
                    {
                        //cmd.Parameters.AddWithValue("@ConTent", "hi_test");

                        int rows = cmd.ExecuteNonQuery();

                        //rows number of record got inserted
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
        //wordLibrary.aspx公有雲select
        public static string[] Get_Public_Resource(string dbname)
        {
            string[] outp = new string[5];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ID,Type,Content,Sortnumber,UnitID from UsualWord", conn))
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
                                        outp[4] += reader.GetString(4).ToString() + "|";
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

        //PriceAnalysis.aspx私有雲select
        public static string[] Get_Private_Resource(string dbname)
        {
            string[] outp = new string[6];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ID,Type,Content,Sortnumber,UnitID,PublicID from UsualWord", conn))
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
                                    //outp[2] += reader.GetInt32(2) + "|";
                                    //outp[3] += reader.GetString(3).ToString();
                                    //outp[4] = reader.GetInt32(0).ToString();
                                    //outp[5] += reader.GetString(5) + ",";
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
                                        outp[4] += reader.GetString(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
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

        //PriceAnalysis.aspx公有雲search
        public static string[] Get_PublicResource_Search(string dbname, string keyword)
        {
            string[] outp = new string[5];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ID,Type,Content,Sortnumber,UnitID from UsualWord where Content like '%" + keyword + "%' ", conn))
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
                                        outp[4] += reader.GetString(4).ToString() + "|";
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

        //PriceAnalysis.aspx私有雲search
        public static string[] Get_PrivateResource_Search(string dbname, string keyword)
        {
            string[] outp = new string[6];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select ID,Type,Content,Sortnumber,UnitID,PublicID from UsualWord where Content like '%" + keyword + "%' ", conn))
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
                                        outp[4] += reader.GetString(4).ToString() + "|";
                                    }
                                    if (reader.IsDBNull(5))
                                    {
                                        outp[5] += "0" + "|";

                                    }
                                    else
                                    {
                                        outp[5] += reader.GetInt32(5).ToString() + "|";
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
            string SQLString = "select PublicID from UsualWord where PublicID=" + ID;
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
                        //DataTableBox = new DataTable();
                        //DataTableBox.Load(SelectList_read);
                        //for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        //{
                        //    string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
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
