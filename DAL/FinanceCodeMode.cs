using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DAL
{
    public class FinanceCodeMode
    {
        public static bool Pnl_Resource_Search(string dbname, int PID)
        {
            bool result = false;
            Temp.j = 1;
            for (int i = 0; i < 20; i++)
            {
                for (int j = 0; j < 200; j++)
                {
                    Temp2.count[i, j] = " ";
                }
            }
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    Temp2.i = 1;
                    using (SqlCommand cmd = new SqlCommand("select Code, ItemName, Unit, PriceID from Pro_Resource where PID=" + PID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp2.count[0, Temp2.i] = reader.GetString(0);
                                if (!reader.IsDBNull(1))
                                    Temp2.count[1, Temp2.i] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp2.count[2, Temp2.i] = reader.GetString(2);
                                if (!reader.IsDBNull(3))
                                    Temp2.count[3, Temp2.i] = reader.GetInt32(3).ToString();
                                Temp2.i = Temp2.i + 1;
                            }
                            result = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
        public static int EWID_Search(string dbname, int PID, string ItemName)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select EWID from EBudget_WBS where PID=" + PID + " and ItemName='" + ItemName + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetInt32(0);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
        public static bool FI_Mapping_Check(string dbname, int EWID, int PriceID)
        {
            bool result = false;
            int Temp = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select FIID from FI_Mapping where PriceID=" + PriceID + " and EWID=" + EWID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp = reader.GetInt32(0);
                                if (Temp != 0)
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
            }
            return result;
        }
        public static bool FI_Mapping_Insert(string dbname, int PID, int EWID, int PriceID, string FI_Code)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("insert into FI_Mapping([PID],[EWID],[PriceID],[FI_Code]) values (" + PID + "," + EWID + "," + PriceID + ",'" + FI_Code + "')", conn))
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

            }
            return result;
        }
        public static bool FI_Mapping_Update(string dbname, int PID, int EWID, int PriceID, string FI_Code)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("update FI_Mapping set [FI_Code]='" + FI_Code + "' where PriceID=" + PriceID + " and PID=" + PID + " and EWID=" + EWID, conn))
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

            }
            return result;
        }
        public static string FI_Code_Search(string dbname, int PID, int EWID, int PriceID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select FI_Code from FI_Mapping where PID=" + PID + " and PriceID=" + PriceID + " and EWID=" + EWID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetString(0);
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
        public static bool Pnl_WBS_Search(string dbname, int PID)
        {
            bool result = false;
            Temp.j = 1;
            for (int i = 0; i < 20; i++)
            {
                for (int j = 0; j < 200; j++)
                {
                    Temp2.count[i, j] = " ";
                }
            }
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    Temp2.i = 1;
                    using (SqlCommand cmd = new SqlCommand("select LayerCode, ItemName, Unit, PriceID, ItemOrder from EBudget_WBS where PID=" + PID + " order by order_Num", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp2.count[0, Temp2.i] = reader.GetString(0);
                                if (!reader.IsDBNull(1))
                                    Temp2.count[1, Temp2.i] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp2.count[2, Temp2.i] = reader.GetString(2);
                                if (!reader.IsDBNull(3))
                                    Temp2.count[3, Temp2.i] = reader.GetInt32(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp2.count[4, Temp2.i] = reader.GetString(4);
                                Temp2.i = Temp2.i + 1;
                            }
                            result = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
    }

    public class Temp2
    {
        public static int i;
        public static int j;
        public static int CN;
        public static int Check_Button_Type;
        public static string[,] count = new string[20, 2000];
        public static string[,] count2 = new string[20, 2000];
    }
}
