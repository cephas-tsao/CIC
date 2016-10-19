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
    public class PriceAnalysis
    {
        public static bool ItemName_exist_Check(string dbname, string ItemName, string Unit)
        {
            // true = exist
            bool result = true;
            string select_string = "SELECT Count(*) FROM PrivateResource WHERE ItemName = '" + ItemName + "' and Unit = '" + Unit + "'";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.GetInt32(0) == 0)
                                    result = false;
                            }
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

        public static bool Insert_Simple(string dbname, string PriceName, decimal Price, string Unit, string Code)
        {
            string db_conn = DBconnection.connect_string(dbname);
            bool result = false;
            string Complex = "0";
            string insert_string = "INSERT INTO PriceAnalysis (PriceName, Complex, Price, Unit, Code) VALUES ('";
            insert_string += PriceName + "'," + Complex + ",'" + Price.ToString() + "','" + Unit + "','" + Code + "')";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(insert_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0) result = true;
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

        public static bool Insert_Simple2(string dbname, string ItemName, decimal Price, string Unit, string Code, string ItemKind, string Remark)
        {
            string db_conn = DBconnection.connect_string(dbname);
            bool result = false;
            if (ItemName_exist_Check(dbname, ItemName, Unit))
            {
                return result;
            }
            string Complex = "0";
            string insert_string = "INSERT INTO PrivateResource (ItemName, Complex, Price, Unit, Code, ItemKind, Notes) VALUES ('";
            insert_string += ItemName + "'," + Complex + ",'" + Price.ToString() + "','" + Unit + "','" + Code + "','" + ItemKind + "','" + Remark + "')";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(insert_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0) result = true;
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

        public static bool Insert_PrivateResource(string dbname, string ItemName, string Unit, string Code, string ItemKind, string Remark)
        {
            string db_conn = DBconnection.connect_string(dbname);
            bool result = false;
            if (ItemName_exist_Check(dbname, ItemName, Unit))
            {
                return result;
            }
            string Complex = "1";
            string insert_string = "INSERT INTO PrivateResource (ItemName, Complex, Unit, Code, ItemKind, Notes) VALUES ('";
            insert_string += ItemName + "'," + Complex + ",'" + Unit + "','" + Code + "','" + ItemKind + "','" + Remark + "')";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(insert_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0) result = true;
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
        public static bool Insert_Complex(string dbname, string PriceName, string Unit, string Code, string ReferenceID, string ReferenceNumber)
        {
            string db_conn = DBconnection.connect_string(dbname);
            bool result = false;
            string Complex = "1";
            string insert_string = "INSERT INTO PriceAnalysis (PriceName, Complex, Unit, Code, ReferenceID, ReferenceNumber) VALUES ('";
            insert_string += PriceName + "'," + Complex + ",'" + Unit + "','" + Code + "','" + ReferenceID + "','" + ReferenceNumber + "')";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(insert_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0) result = true;
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

        public static bool Insert_Complex2(string dbname, string ItemName, string Unit, decimal AnaNumber, string Code, string ItemKind, string Remark, string ReferenceID, string ReferenceNumber)
        {
            string db_conn = DBconnection.connect_string(dbname);
            bool result = false;
            if (ItemName_exist_Check(dbname, ItemName, Unit))
            {
                return result;
            }
            string Complex = "1";
            string insert_string = "INSERT INTO PrivateResource (ItemName, Complex, Unit, AnaNumber, Code, Notes, ItemKind) VALUES ('";
            insert_string += ItemName + "'," + Complex + ",'" + Unit + "','" + AnaNumber.ToString() + "','" + Code + "','" + Remark + "','" + ItemKind + "')";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(insert_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0) result = true;
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
            int PID = 0;
            string[] KidID = ReferenceID.Split(',');
            string[] WorkNum = ReferenceNumber.Split(',');
            decimal[] WorkRate = new decimal[WorkNum.Length];
            for (int i = 0; i < WorkRate.Length; i++)
            {
                WorkRate[i] = decimal.Parse(WorkNum[i]) / AnaNumber;
            }
            int count = 0;

            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT PriceID FROM PrivateResource WHERE ItemName='" + ItemName + "' and Unit ='" + Unit + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                PID = reader.GetInt32(0);
                            }
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

            try
            {
                using (SqlConnection conn =
                    new SqlConnection(db_conn))
                {
                    conn.Open();
                    for (int j = 0; j < KidID.Length; j++)
                    {
                        count++;
                        using (SqlCommand cmd2 =
                            new SqlCommand("INSERT INTO PrivateAnalysis ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES (" + count.ToString() + "," + PID + "," + KidID[j] + ",'" + WorkRate[j] + "')", conn))
                        {
                            int rows = cmd2.ExecuteNonQuery();
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

        public static bool UpdatePrice(string dbname, int PID, string PriceName, string Unit, string ReferenceID, string ReferenceNumber, decimal AnaNum)
        {
            bool result = false;
            //decimal AnaNum = 1.000M;
            string update_string = "UPDATE Pro_Resource SET ItemName ='" + PriceName + "', Unit = '" + Unit + "', AnaNumber='" + AnaNum.ToString() + "' Where PriceID=" + PID.ToString();
            string[] KID = ReferenceID.Split(',');
            string[] KNum = ReferenceNumber.Split(',');
            int[] KidID = new int[KID.Length];
            decimal[] RefNum = new decimal[KNum.Length];
            for (int i = 0; i < KidID.Length; i++)
            {
                KidID[i] = int.Parse(KID[i]);
                RefNum[i] = decimal.Parse(KNum[i]);
            }
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(update_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd2 =
                        new SqlCommand("DELETE FROM Pro_Analysis WHERE ParentID = " + PID, conn))
                    {
                        int rows = cmd2.ExecuteNonQuery();
                    }
                    for (int i = 0; i < KidID.Length; i++)
                    {
                        using (SqlCommand cmd3 =
                            new SqlCommand("INSERT INTO Pro_Analysis ([ParentID],[SortNum],[KidID],[WorkRate]) VALUES ('" + PID.ToString() + "','" + (i+1).ToString() + "','" + KidID[i].ToString() + "','" + (RefNum[i]).ToString() + "')", conn))
                        {
                            int rows = cmd3.ExecuteNonQuery();
                            if (rows > 0)
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
        public static bool UpdatePrivatePrice(string dbname, int PID, string PriceName, string Unit, string ReferenceID, string ReferenceNumber, decimal AnaNum)
        {
            bool result = false;
            //decimal AnaNum = 1.000M;
            string update_string = "UPDATE PrivateResource SET ItemName ='" + PriceName + "', Unit = '" + Unit + "', AnaNumber='" + AnaNum.ToString() + "' Where PriceID=" + PID.ToString();
            string[] KID = ReferenceID.Split(',');
            string[] KNum = ReferenceNumber.Split(',');
            int[] KidID = new int[KID.Length];
            decimal[] RefNum = new decimal[KNum.Length];
            for (int i = 0; i < KidID.Length; i++)
            {
                KidID[i] = int.Parse(KID[i]);
                RefNum[i] = decimal.Parse(KNum[i]);
            }
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(update_string, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd2 =
                        new SqlCommand("DELETE FROM PrivateAnalysis WHERE ParentID = " + PID, conn))
                    {
                        int rows = cmd2.ExecuteNonQuery();
                    }
                    for (int i = 0; i < KidID.Length; i++)
                    {
                        using (SqlCommand cmd3 =
                            new SqlCommand("INSERT INTO PrivateAnalysis ([ParentID],[SortNum],[KidID],[WorkRate]) VALUES ('" + PID.ToString() + "','" + (i + 1).ToString() + "','" + KidID[i].ToString() + "','" + (RefNum[i]).ToString() + "')", conn))
                        {
                            int rows = cmd3.ExecuteNonQuery();
                            if (rows > 0)
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
        public double CalcPriceByPID(string dbname, int PID)
        {
            double price = 0.0;

            string select_string = "SELECT * FROM PriceAnalysis WHERE PriceID=" + PID.ToString();
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return price;
                                }
                                else
                                {
                                    //reader.GetString(2)
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
                //Log exception
                //Display Error message
            }
            return price;
        }

        public string[] SelectByPID(string dbname, int PID)
        {
            string[] outp = new string[6];
            decimal AnalysisNum = 0.000M;
            string select_string = "SELECT ItemName, Complex, Unit, AnaNumber from Pro_Resource where PriceID=" + PID.ToString();
            string select_string2 = "SELECT KidID, WorkRate from Pro_Analysis where ParentID=" + PID.ToString();
            bool check = false;
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
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
                                    outp[0] = reader.GetString(0);
                                    if (reader.IsDBNull(1))
                                    {
                                        outp[1] = "0";
                                    }
                                    else
                                    {
                                        outp[1] = reader.GetInt32(1).ToString();
                                    }
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] = "";
                                    }
                                    else
                                    {
                                        outp[2] = reader.GetString(2);
                                    }
                                    if (reader.IsDBNull(3))
                                    {
                                        outp[5] = "0";
                                        AnalysisNum = 0;
                                    }
                                    else
                                    {
                                        outp[5] = reader.GetDecimal(3).ToString();
                                        AnalysisNum = reader.GetDecimal(3);
                                    }
                                  
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd2 =
                        new SqlCommand(select_string2, conn))
                    {
                        using (var reader = cmd2.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                }
                                else
                                {
                                    outp[3] += reader.GetInt32(0).ToString() + "," ;
                                    outp[4] += reader.GetDecimal(1).ToString() + "," ;
                                    check = true;
                                }
                            }
                            if (check)
                            {
                                outp[3] = outp[3].Substring(0, outp[3].Length - 1);
                                outp[4] = outp[4].Substring(0, outp[4].Length - 1);
                            }
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


            return outp;
        }
        public string[] SelectByID(string dbname, int PID)
        {
            string[] outp = new string[6];
            decimal AnalysisNum = 0.000M;
            string select_string = "SELECT ItemName, Complex, Unit, AnaNumber from PrivateResource where PriceID=" + PID.ToString();
            string select_string2 = "SELECT KidID, WorkRate from PrivateAnalysis where ParentID=" + PID.ToString();
            bool check = false;
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
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
                                    outp[0] = reader.GetString(0);
                                    if (reader.IsDBNull(1))
                                    {
                                        outp[1] = "0";
                                    }
                                    else
                                    {
                                        outp[1] = reader.GetInt32(1).ToString();
                                    }
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] = "";
                                    }
                                    else
                                    {
                                        outp[2] = reader.GetString(2);
                                    }
                                    if (reader.IsDBNull(3))
                                    {
                                        outp[5] = "0";
                                        AnalysisNum = 0;
                                    }
                                    else
                                    {
                                        outp[5] = reader.GetDecimal(3).ToString();
                                        AnalysisNum = reader.GetDecimal(3);
                                    }

                                }
                            }
                        }
                    }
                    using (SqlCommand cmd2 =
                        new SqlCommand(select_string2, conn))
                    {
                        using (var reader = cmd2.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                }
                                else
                                {
                                    outp[3] += reader.GetInt32(0).ToString() + ",";
                                    outp[4] += reader.GetDecimal(1).ToString() + ",";
                                    check = true;
                                }
                            }
                            if (check)
                            {
                                outp[3] = outp[3].Substring(0, outp[3].Length - 1);
                                outp[4] = outp[4].Substring(0, outp[4].Length - 1);
                            }
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


            return outp;
        }

        public string[] GetPricet(string dbname, int PID)
        {
            //decimal[] AllPrice ;
            string[] outp = new string[4];
            string select_string = "SELECT PriceName, AnaNumber, Price from PrivateResource where PriceID=" + PID.ToString();
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
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
                                    outp[0] = reader.GetString(0);
                                    //outp[1] = reader.GetInt32(1).ToString();
                                    if (reader.IsDBNull(1))
                                    {
                                        outp[1] = "0";
                                       
                                    }
                                    else
                                    {
                                        outp[1] = reader.GetInt32(1).ToString();
                                      
                                    }
                                    if (reader.IsDBNull(2))
                                    {
                                        outp[2] = "0";

                                    }
                                    else
                                    {
                                        outp[2] = reader.GetInt32(2).ToString();

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
                //Log exception
                //Display Error message
            }
            //if (outp[1] == "0")
            //{
               // AllPrice = decimal.Parse(outp[2]);
            //}
            //else
            //{
            //string[] PPID = Utility.str_process.str2array(outp[3]);
            //string[] PNum = Utility.str_process.str2array(outp[4]);
            //    for (int i = 0; i < PPID.Length; i++)
            //    {
            //        AllPrice += decimal.Parse(PNum[i]) * Price_Output(dbname, int.Parse(PPID[i]));
            //    }
            //}
            //AllPrice = outp[2];
            return outp;
        }
        public decimal Price_Output(string dbname, int PID)
        {
            decimal AllPrice = 0;
            string[] outp = new string[5];
            string select_string = "SELECT PriceName, Complex, Price, ReferenceID, ReferenceNumber from PriceAnalysis where PriceID=" + PID.ToString();
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
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
                                    outp[0] = reader.GetString(0);
                                    outp[1] = reader.GetInt32(1).ToString();
                                    if (outp[1] == "0")
                                    {
                                        outp[2] = reader.GetSqlDecimal(2).ToString();
                                        outp[3] = "";
                                        outp[4] = "";
                                    }
                                    else
                                    {
                                        outp[2] = "";
                                        outp[3] = reader.GetString(3);
                                        outp[4] = reader.GetString(4);
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
                //Log exception
                //Display Error message
            }
            if (outp[1] == "0")
            {
                AllPrice = decimal.Parse(outp[2]);
            }
            else
            {
                string[] PPID = Utility.str_process.str2array(outp[3]);
                string[] PNum = Utility.str_process.str2array(outp[4]);
                for (int i = 0; i < PPID.Length; i++)
                {
                    AllPrice += decimal.Parse(PNum[i]) * Price_Output(dbname, int.Parse(PPID[i]));
                }
            }
            return AllPrice;
        }

        //PriceAnalysis.aspx公有雲select
        public static string[] Get_Public_Resource(string dbname)
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
                        new SqlCommand("select PriceID,ItemName,Unit,Complex,Code,ItemKind from PublicResource" , conn))
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
                                    outp[0] += reader.GetInt32(0).ToString()+",";
                                    outp[1] += reader.GetString(1) + "|";
                                    outp[2] += reader.GetString(2) + ",";
                                    outp[3] += reader.GetInt32(3).ToString() + ",";
                                    //outp[4] = reader.GetString(4);
                                    outp[5] += reader.GetString(5) + ",";
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

        //PriceAnalysis.aspx私有雲select
        public static string[] Get_Private_Resource(string dbname)
        {
            string[] outp = new string[7];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select PriceID,ItemName,Unit,Complex,Code,ItemKind,PublicID from PrivateResource", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + ",";
                                    outp[1] += reader.GetString(1) + "|";
                                    outp[2] += reader.GetString(2) + ",";
                                    outp[3] += reader.GetInt32(3).ToString() + ",";
                                    //outp[4] = reader.GetString(4);
                                    outp[5] += reader.GetString(5) + ",";
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + ",";
                                       
                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + ",";
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
        public static string[] Get_PublicResource_Search(string dbname,string keyword)
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
                        new SqlCommand("select PriceID,ItemName,Unit,Complex,Code,ItemKind from PublicResource where ItemName like '%" + keyword + "%' ", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + ",";
                                    outp[1] += reader.GetString(1) + "|";
                                    outp[2] += reader.GetString(2) + ",";
                                    outp[3] += reader.GetInt32(3).ToString() + ",";
                                    //outp[4] = reader.GetString(4);
                                    outp[5] += reader.GetString(5) + ",";
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
            string[] outp = new string[7];
            // string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname); //"Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select PriceID,ItemName,Unit,Complex,Code,ItemKind,PublicID from PrivateResource where ItemName like '%" + keyword + "%' ", conn))
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
                                    outp[0] += reader.GetInt32(0).ToString() + ",";
                                    outp[1] += reader.GetString(1) + "|";
                                    outp[2] += reader.GetString(2) + ",";
                                    outp[3] += reader.GetInt32(3).ToString() + ",";
                                    //outp[4] = reader.GetString(4);
                                    outp[5] += reader.GetString(5) + ",";
                                    if (reader.IsDBNull(6))
                                    {
                                        outp[6] += "0" + ",";

                                    }
                                    else
                                    {
                                        outp[6] += reader.GetInt32(6).ToString() + ",";
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
        public static bool checkPublicID(string dbname,string ID)
        {
            bool result = false;
            //decimal AnaNum = 1.000M;
            string SQLString = "select PublicID from PrivateResource where PublicID=" + ID;
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

        //Bid_Library計算Amount
        public static string[] Bid_Library_Amount(string dbname,  string Bid)
        {
            decimal AllPrice = 0;
            string[] outp = new string[4];
            string select_string = "SELECT PriceID, CNumber, BNumber from Bid_WBS where Bid="+Bid+"";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    outp[0] += "0,";
                                }
                                else
                                {
                                    outp[0] += reader.GetInt32(0).ToString() + ",";
                                }
                                    //outp[1] = reader.GetInt32(1).ToString();
                                    if (reader.IsDBNull(1))
                                    {
                                        outp[1] +="0,";
                                        
                                    }
                                    else
                                    {
                                        outp[1] += reader.GetSqlDecimal(1).ToString()+",";
                                        
                                    }
                                    if (reader.IsDBNull(2))
                                    {

                                        outp[2] += "0,";

                                    }
                                    else
                                    {
                                        outp[2] += reader.GetSqlDecimal(2).ToString()+",";
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
                //Log exception
                //Display Error message
            }
            //if (outp[0] != "0" )
            //{
            //    //AllPrice = decimal.Parse(outp[2]);
            //    outp[3] +=(decimal.Parse(outp[1]) * decimal.Parse(outp[2])).ToString();
            //}
           
            return outp;
        }
        
        public static string Bid_WBS_PriceID(string dbname, string Bid)
        {
            
            string outp="";
            string select_string = "SELECT PriceID from Bid_WBS where Bid=" + Bid + "";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    outp += "0,";
                                }
                                else
                                {
                                    outp += reader.GetInt32(0).ToString()+",";
                                  
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
             
            }
        

            return outp;
        }
        //BID-Update Price
        public static bool Resource_Update_Price(string dbname, int Wid)
        {
            bool AddResult = false;
            string[] input = Get_Analysis_Information(dbname);
            string[] temp_WID = input[0].Split(',');
            string[] temp_UpperWID = input[1].Split(',');
            string[] temp_SortNum = input[2].Split(',');
            string[] temp_Number = input[3].Split(',');
            int[] WID = new int[temp_WID.Length];
            int[] UpperWID = new int[temp_UpperWID.Length];
            int[] SortNum = new int[temp_SortNum.Length];
            decimal[] Number = new decimal[temp_SortNum.Length];
            for (int i = 0; i < WID.Length; i++)
            {
                int.TryParse(temp_WID[i], out WID[i]);
                int.TryParse(temp_UpperWID[i], out UpperWID[i]);
                int.TryParse(temp_SortNum[i], out SortNum[i]);
                decimal.TryParse(temp_Number[i], out Number[i]);
            }
            decimal[] result = new decimal[WID.Length];
            List<int> code_result = new List<int>();
            List<int> code_UperUid = new List<int>();          
            List<decimal> code_Number = new List<decimal>();
            List<decimal> code_Layer = new List<decimal>();
            List<bool> code_show = new List<bool>();
          
            //for (int i = 0; i < WID.Length; i++)
            //{
            //    if (UpperWID[i] == 0)
            //    {
            code_result.Add(Wid);
            code_UperUid.Add(Wid);
            code_Number.Add(Wid);
            code_Layer.Add(1);
            code_show.Add(true);
            //    }
            //}
            int count = 0;
            int nowWID = 0;
            int insert_count = 0;
            int inert_Layer = 0;
            while (count < code_result.Count)
            {
                nowWID = code_result[count];
                //nowWID = code_UperUid[count];
                inert_Layer = inert_Layer + 1;
                insert_count = count + 1;
                for (int i = 0; i < WID.Length; i++)
                {
                    if (nowWID == UpperWID[i])
                    {
                        code_show[count] = false;
                        code_result.Insert(insert_count, WID[i]);
                        code_UperUid.Insert(insert_count, UpperWID[i]);
                        code_Number.Insert(insert_count, Number[i]);                      
                        code_show.Insert(insert_count, true);
                        if (code_show[count] == false)
                        {
                            code_Layer.Insert(insert_count, inert_Layer);

                        }
                        insert_count++;
                    }
                }
                count++;
            }
            List<int> FinalResult = new List<int>();
            List<int> FinalResultUper = new List<int>();
            List<decimal> FinalResultNum = new List<decimal>();
            List<decimal> FinalResultAmount = new List<decimal>();
            decimal AddAmount = 0;
            decimal AddCAmount = 0;

            decimal MaxLayer = code_Layer.Max();
            decimal MinLayer = code_Layer.Min();
            for (int i = 0; i < code_show.Count; i++)
            {

               
                if (code_show[i])
                {
                    for (decimal j =MinLayer; j <= MaxLayer; j++)
                    {
                        int PID = code_result[i];
                        int UperUid = code_UperUid[i];
                        decimal workrate = code_Number[i];
                        decimal layer = code_Layer.Max();
                        if (PID==j)
                        {
                        string SelectSQL = "Select * from Bid_Library where PriceID=" + UperUid;
                        string SelectSQL1 = "Select * from Bid_Library where PriceID=" + PID;
                        string Amount = WebModel.SItemName(dbname, SelectSQL, "Amount");
                        string Price = WebModel.SItemName(dbname, SelectSQL, "Price");
                        }
                        //string SAmount = WebModel.SItemName(dbname, SelectSQL1, "Amount");
                        //string SCAmount = WebModel.SItemName(dbname, SelectSQL1, "CAmount");
                        //string AnaNumber = WebModel.SItemName(dbname, SelectSQL, "AnaNumber");
                        //SAmount = SAmount != "" ? SAmount : "0";
                        //SCAmount = SCAmount != "" ? SCAmount : "0";
                        //if (AnaNumber != "" && AnaNumber != "0")
                        //{
                        //    AddAmount = (decimal.Parse(Amount) * workrate) / decimal.Parse(AnaNumber);
                        //    AddCAmount = (decimal.Parse(CAmount) * workrate) / decimal.Parse(AnaNumber);
                        //}
                        //decimal TotalAmount = decimal.Parse(SAmount) + AddAmount;
                        //decimal TotalCAmount = decimal.Parse(SCAmount) + AddCAmount;
                        //string UpdateSQL = "Update Bid_Library set Amount=" + TotalAmount + ",CAmount=" + TotalCAmount + " where PriceID=" + PID;
                        //AddResult = WebModel.SQLAction(dbname, UpdateSQL);

                        FinalResult.Add(code_result[i]);
                        FinalResultUper.Add(code_UperUid[i]);
                        FinalResultNum.Add(code_Number[i]);
                        FinalResultAmount.Add(AddAmount);
                    }
                }
            }

            int[] result1 = code_result.ToArray();
            int[] result2 = code_UperUid.ToArray();
            //decimal[] result3 = code_Number.ToArray();
            //result = FinalResult.Distinct().ToArray();
            if (result.Length > 1)
            {

            }
            return AddResult;
        }
        //BID-Update Amount,CAmount
        public static bool Sort_Resource(string dbname, int Wid,string UID,string Bid,string num,string Cnum)
        {
            bool AddResult = false;
            string[] input = Get_Analysis_Information(dbname);
            //string[] input1 = Get_WBS_Information(dbname, Bid);
            string[] temp_WID = input[0].Split(',');
            string[] temp_UpperWID = input[1].Split(',');
            string[] temp_SortNum = input[2].Split(',');
            string[] temp_Number = input[3].Split(',');

           
            int[] WID = new int[temp_WID.Length];
            int[] UpperWID = new int[temp_UpperWID.Length];
            int[] SortNum = new int[temp_SortNum.Length];
            decimal[] Number = new decimal[temp_SortNum.Length];

          
            for (int i = 0; i < WID.Length; i++)
            {
                int.TryParse(temp_WID[i], out WID[i]);
                int.TryParse(temp_UpperWID[i], out UpperWID[i]);
                int.TryParse(temp_SortNum[i], out SortNum[i]);
                decimal.TryParse(temp_Number[i], out Number[i]);
             
            }
         
            decimal[] result = new decimal[WID.Length];
            List<int> code_result = new List<int>();
            List<int> code_UperUid = new List<int>();
            List<decimal> code_Number = new List<decimal>();
            List<bool> code_show = new List<bool>();
            List<decimal> code_Amount = new List<decimal>();
            List<decimal> code_Layer = new List<decimal>();
            List<int> code_Upper = new List<int>();
            List<decimal> code_WBSNumber = new List<decimal>();
            //List<decimal> code_WBSNumber = new List<decimal>();
            List<decimal> code_WBSCNumber = new List<decimal>();
           
           
            code_result.Add(Wid);
            code_UperUid.Add(0);
            code_Number.Add(1);
            code_Layer.Add(0);
            code_WBSNumber.Add(decimal.Parse(num));
            code_WBSCNumber.Add(decimal.Parse(Cnum));
            //code_WBSNumber.Add(0);
            code_show.Add(true);
            //    }
            //}
            int count = 0;
            int nowWID = 0;
            int insert_count = 0;
            
            while (count < code_result.Count)
            {
                nowWID = code_result[count];
               
              
                insert_count = count + 1;
                for (int i = 0; i < WID.Length; i++)
                {
                    if (nowWID == UpperWID[i])
                    {
                        code_show[count] = false;
                        code_result.Insert(insert_count, WID[i]);
                        code_UperUid.Insert(insert_count, UpperWID[i]);
                        code_Number.Insert(insert_count, Number[i]);
                      
                        code_show.Insert(insert_count, true);
                   
                       
                        insert_count++;
                    }
                   
                }
                count++;
            }

            int inert_Layer = 0;
            int insert_count1 = 0;
            int id  = 0;
            //int count1 = 0;

            code_Upper.Add(0);
            if (code_UperUid.Count >=2 )
            {
                id = code_UperUid[1];
            }
               for (int i = 0; i < code_show.Count; i++)
                {
                    if (id == code_UperUid[i])
                    {
                        inert_Layer = 1;

                    }
                    if (!code_show[i])
                    {
                        
                        code_Layer.Insert(insert_count1, inert_Layer);
                        insert_count1++;
                        inert_Layer = inert_Layer + 1;
                    }
                    else
                    {
                     
                        code_Layer.Insert(insert_count1, inert_Layer);
                        insert_count1++;
                      
                    }
                   

                }

            List<int> FinalResult = new List<int>();
            List<int> FinalResultUper = new List<int>();
            List<decimal> FinalResultNum = new List<decimal>();
            List<decimal> FinalResultAmount = new List<decimal>();
            decimal AddAmount = 0;
            decimal AddCAmount = 0;
       
            for (int i = 0; i < code_show.Count; i++)
            {
               
                    int PID = code_result[i];
                    int UperUid = code_UperUid[i];
                    decimal workrate = code_Number[i];
                               
                    decimal TotalAmount = 0;
                    decimal TotalCAmount = 0;
                 
                        string SelectSQL = "Select * from Bid_Library where PriceID=" + UperUid;
                        string SelectSQL1 = "Select * from Bid_Library where PriceID=" + PID;
                        string SelectSQL4 = "Select * from Bid_WBS where UID=" + UID;
                        string Temp_Amount = "";
                        string Temp_CAmount="";
                        string AnaNumber = "";
                       decimal o = code_Layer[i] != 0?code_Layer[i]:1;
                       
                        if (!code_show[i])
                        {
                         
                         
                            if (o == 1)
                            {
                               
                                Temp_Amount = code_WBSNumber[0].ToString();
                                Temp_CAmount = WebModel.SItemName(dbname, SelectSQL4, "CNumber");
                                //code_WBSNumber.Insert(i, decimal.Parse(Temp_Amount));
                            }
                            else if (o>=2)
                            {
                                for (int j = 0; j < code_result.Count; j++)
                                {
                                    if (UperUid == code_result[j])
                                    {
                                        Temp_Amount = code_WBSNumber[j].ToString();
                                        Temp_CAmount=code_WBSCNumber[j].ToString();
                                       
                                    }
                                }
                             
                            }
                          
                        }
                        else
                        {
                            for (int j = 0; j < code_result.Count; j++)
                            {
                                if (UperUid == code_result[j])
                                {

                                    if ((o - 1) == code_Layer[j])
                                    {
                                        Temp_Amount = code_WBSNumber[j].ToString();
                                        Temp_CAmount = code_WBSCNumber[j].ToString();

                                    }
                                }
                            }


                        }
                        string Amount = WebModel.SItemName(dbname, SelectSQL4, "Number");
                        string CAmount = WebModel.SItemName(dbname, SelectSQL4, "CNumber");
                        if (UperUid == 0)
                        {                              
                                //AnaNumber = WebModel.SItemName(dbname, SelectSQL1, "AnaNumber");
                            AnaNumber ="1";
                        }
                        else
                        {
                                AnaNumber = WebModel.SItemName(dbname, SelectSQL, "AnaNumber");
                        }
                      
                        Temp_Amount = Temp_Amount != "" ? Temp_Amount : "0";
                        Temp_CAmount = Temp_CAmount != "" ? Temp_CAmount : "0";
                        Amount = Amount != "" ? Amount : "0";
                        CAmount = CAmount != "" ? CAmount : "0";
                        workrate = workrate != 0 ? workrate : 0;
                        if (AnaNumber != "" && decimal.Parse(AnaNumber) != 0)
                        {
                            AddAmount = (decimal.Parse(Temp_Amount) * workrate) / decimal.Parse(AnaNumber);
                            AddCAmount = (decimal.Parse(Temp_CAmount) * workrate) / decimal.Parse(AnaNumber);
                            string SelectSQL2 = "Update Bid_Library set Temp_Amount=" + AddAmount + " where PriceID=" + PID;
                            string SelectSQL3 = "Update Bid_Library set Temp_CAmount=" + AddCAmount + " where PriceID=" + PID;
                            AddResult = WebModel.SQLAction(dbname, SelectSQL2);
                            AddResult = WebModel.SQLAction(dbname, SelectSQL3);
                          
                        }
                        
                            code_WBSNumber.Insert(i, (AddAmount));
                            code_WBSCNumber.Insert(i, (AddCAmount));
                      
                //加本身priceid數量
                        string ONum = "Select * from Bid_Library where PriceID=" + PID;
                        string OAmount = WebModel.SItemName(dbname, ONum, "Amount");
                        string OCAmount = WebModel.SItemName(dbname, ONum, "CAmount");

                        if (UperUid == 0)
                        {
                            TotalAmount = decimal.Parse(Amount) + decimal.Parse(OAmount) ;
                             TotalCAmount = decimal.Parse(CAmount)+decimal.Parse(OCAmount);

                        }
                        else
                        {
                            TotalAmount = AddAmount + decimal.Parse(OAmount);
                            TotalCAmount = AddCAmount + decimal.Parse(OCAmount);
                        }

                        string UpdateSQL = "Update Bid_Library set Amount=" + TotalAmount + ",CAmount=" + TotalCAmount + " where PriceID=" + PID;
                        string UpdateSQL1 = "Update Bid_Library set Temp_Amount=" + TotalAmount + ",Temp_CAmount=" + TotalCAmount + " where PriceID=" + PID;
                        AddResult = WebModel.SQLAction(dbname, UpdateSQL);
                        AddResult = WebModel.SQLAction(dbname, UpdateSQL1);
                  
                    FinalResult.Add(code_result[i]);
                    FinalResultUper.Add(code_UperUid[i]);
                    FinalResultNum.Add(code_Number[i]);
                    FinalResultAmount.Add(AddAmount);
               
            }
          
            int[] result1 = code_result.ToArray();
            int[] result2 = code_UperUid.ToArray();
            decimal[] result3 = code_Number.ToArray();
       
            if (result.Length > 1)
            {

            }
            return AddResult;
        }
        public static string[] Get_Analysis_Information(string dbname)
        {
            //string temp = "";
            string[] result = new string[4];
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            string Select_string = "Select KidID,ParentID,SortNum,Number,Number,CNumber from Bid_AnaRelation ";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(Select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] += reader.GetInt32(0).ToString() + ",";
                                if (reader.IsDBNull(1))
                                {
                                    result[1] += "0,";
                                }
                                else
                                {
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
                                if (reader.IsDBNull(2))
                                {
                                    result[2] += "0,";
                                }
                                else
                                {
                                    result[2] += reader.GetInt32(2).ToString() + ",";
                                }
                                if (reader.IsDBNull(3))
                                {
                                    result[3] += "0,";
                                }
                                else
                                {
                                    result[3] += reader.GetDecimal(3).ToString() + ",";
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

            }

            return result;
        }
        public static string[] Get_WBS_Information(string dbname,string bid)
        {
            //string temp = "";
            string[] result = new string[4];
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            string Select_string = "Select PriceID,Number,CNumber from Bid_WBS where bid="+bid;
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(Select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] += reader.GetInt32(0).ToString() + ",";
                                if (reader.IsDBNull(1))
                                {
                                    result[1] += "0,";
                                }
                                else
                                {
                                    result[1] += reader.GetDecimal(1).ToString() + ",";
                                }
                                if (reader.IsDBNull(2))
                                {
                                    result[2] += "0,";
                                }
                                else
                                {
                                    result[2] += reader.GetDecimal(2).ToString() + ",";
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

            }

            return result;
        }
    }
}
