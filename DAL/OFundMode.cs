using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DAL
{
    public class OFundMode
    {
        public static bool Insert_OFundDebitM(string dbname, int PID, string Type, string Subject, string Date, decimal Price, decimal Tax, decimal SumPrice, string Recorder, string Documents, string IncreaseDebit)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Insert into OFund_Modify ([PID],[Type],[Subject],[Date],[Price],[Tax],[SumPrice],[Recorder],[Documents],[IncreaseDebit]) VALUES (" + PID + ",'" + Type + "','" + Subject + "','" + Date + "'," + Price + "," + Tax + "," + SumPrice + ",'" + Recorder + "','" + Documents + "','" + IncreaseDebit + "')", conn))
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

        public static string OFund_ID_Search(string dbname, int OF_MID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from OFund_Modify where OF_MID=" + OF_MID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "Price" || Temp == "Tax" || Temp == "SumPrice")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = Convert.ToInt32(reader.GetDecimal(0)).ToString();
                                }
                                else if (Temp == "Date")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDateTime(0).ToString("yyyy-MM-dd");
                                }
                                else
                                {
                                    if (!reader.IsDBNull(0))
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
            }
            return result;
        }

        public static bool Update_OFundDebitM(string dbname, int OF_MID, string Type, string Subject, string Date, decimal Price, decimal Tax, decimal SumPrice, string Documents)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string DD = "Update OFund_Modify Set Type='" + Type + "',Subject='" + Subject + "', Date='" + Date.ToString() + "', Price=" + Price + ", Tax=" + Tax + ", SumPrice=" + SumPrice + ", Documents='" + Documents + "' where OF_MID=" + OF_MID;
                    using (SqlCommand cmd =
                        new SqlCommand("Update OFund_Modify Set Type='" + Type + "',Subject='" + Subject + "', Date='" + Date.ToString() + "', Price=" + Price + ", Tax=" + Tax + ", SumPrice=" + SumPrice + ", Documents='" + Documents + "' where OF_MID=" + OF_MID, conn))
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

        public static bool Delete_OFundDebitM(string dbname, int OF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM OFund_Modify WHERE OF_MID=" + OF_MID, conn))
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

        public static string OFundView_Search(string dbname, int OFID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from OFund_Main where OFID=" + OFID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "OF_Edition")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
                                }
                                else if (Temp == "StartDate" || Temp == "EndDate" || Temp == "FundDate" || Temp == "PayDate")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDateTime(0).ToString("yyyy-MM-dd");
                                }
                                else
                                {
                                    if (!reader.IsDBNull(0))
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
            }
            return result;
        }

        public static string OFundView_Search2(string dbname, int PID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select " + Temp + " From ProjectM2 Where PID=" + PID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0).ToString();
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

        public static string OFundView_Search2_5(string dbname, int PID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select " + Temp + " From ProjectM1 Where PID=" + PID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0).ToString();
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

        public static string OFundView_Search3(string dbname, int PID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string AA = "Select " + Temp + " From CBudget_Change Where PID=" + PID + " And CEdition Is Max";
                    using (SqlCommand cmd = new SqlCommand("Select " + Temp + " From CBudget_Change Where  CEdition = (Select Max(CEdition) From CBudget_Change Where PID = " + PID + " )", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "CEdition")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
                                }
                                else if (Temp == "AdjestTotalPrice")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDecimal(0).ToString();
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

        public static string OFundView_Search4(string dbname, int OFID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select sum(" + Temp + ") from OFund_Main where OFID<" + OFID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0).ToString();
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

        public static string OFundView_Search5(string dbname, int OFID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from OFund_Main where OFID=" + OFID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0).ToString();
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

        public static bool OFund_Search2(string dbname, int OFID, string Temp)
        {
            bool result = false;
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
                    using (SqlCommand cmd = new SqlCommand("Select Subject, Type, Date, Documents, Price, Tax, SumPrice  From OFund_Modify Where BelongOFID=" + OFID + " And IncreaseDebit='" + Temp + "'", conn))
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
                                    Temp2.count[2, Temp2.i] = reader.GetDateTime(2).ToString();
                                if (!reader.IsDBNull(3))
                                    Temp2.count[3, Temp2.i] = reader.GetString(3);
                                if (!reader.IsDBNull(4))
                                    Temp2.count[4, Temp2.i] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp2.count[5, Temp2.i] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp2.count[6, Temp2.i] = reader.GetDecimal(6).ToString();
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

        public static int Edition_Search(string dbname, int PID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select Max(OF_Edition) From OFund_Main Where PID=" + PID, conn))
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
            result = result + 1;
            return result;
        }

        public static bool Insert_OFundEdit_1(string dbname, int PID, int OF_Edition)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Insert into OFund_Main ([PID],[OF_Edition]) VALUES (" + PID + "," + OF_Edition + ")", conn))
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

        public static int OFID_Search(string dbname, int PID, int Edition)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select OFID From OFund_Main Where PID=" + PID + " And OF_Edition=" + Edition, conn))
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

        public static bool Insert_OFundEdit_2(string dbname, int OFID, int CWID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string AA = "Insert Into OFund_Item(OFID, CWID) Values (" + OFID + "," + CWID + ")";
                    using (SqlCommand cmd = new SqlCommand("Insert Into OFund_Item(OFID, CWID) Values (" + OFID + "," + CWID + ")", conn))
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

        public static bool CWID_Search(string dbname, int PID)
        {
            bool result = false;
            for (int i = 0; i < 20; i++)
            {
                for (int j = 0; j < 1000; j++)
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
                    using (SqlCommand cmd = new SqlCommand("Select CWID From CBudget_WBS Where PID=" + PID + " And ItemKind='workitem'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp2.count[0, Temp2.i] = reader.GetInt32(0).ToString();
                                Temp2.i = Temp2.i + 1;
                            }
                        }
                    }
                    result = true;
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }

        public static bool Insert_OFundEdit_2(string dbname, int OFID)
        {
            bool result = false;
            for (int i = 1; i < Temp2.i; i++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("Insert into OFund_Item ([OFID],[CWID]) VALUES (" + OFID + "," + Convert.ToInt32(Temp2.count[0, i]) + ")", conn))
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
            }
            return result;
        }

        public static int Update_OFund_Main(string dbname, int OFID, string Temp, string Value)
        {
            int result = 0;
            string aa = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    if (Temp == "OF_Code" || Temp == "StartDate" || Temp == "FundDate" || Temp == "EndDate" || Temp == "PayDate" || Temp == "Note")
                    {
                        aa = "Update OFund_Main Set " + Temp + "='" + Value + "' where OFID=" + OFID;
                    }
                    else
                    {
                        aa = "Update OFund_Main Set " + Temp + "=" + Convert.ToDecimal(Value) + " where OFID=" + OFID;
                    }
                    using (SqlCommand cmd = new SqlCommand(aa, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result = 1;
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

        public static bool Delete_OFund_Main_and_Item(string dbname, int OFID)
        {
            bool result = false;
            bool result_2 = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM OFund_Main WHERE OFID=" + OFID, conn))
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
            result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM OFund_Item WHERE OFID=" + OFID, conn))
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
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Modify Set BelongOFID = 0 Where BelongOFID =" + OFID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result_2 = true;
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Modify Set ApprovalOFID = 0 Where ApprovalOFID =" + OFID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result_2 = true;
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

        public static bool OFund_Search3(string dbname, int PID, string Temp)
        {
            bool result = false;
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
                    using (SqlCommand cmd = new SqlCommand("Select Subject, Type, Date, Price, Tax, SumPrice, Recorder, BelongOFID, OF_MID, Documents From OFund_Modify Where PID=" + PID + " And IncreaseDebit='" + Temp + "'", conn))
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
                                    Temp2.count[2, Temp2.i] = reader.GetDateTime(2).ToString("yyyy/MM/dd");
                                if (!reader.IsDBNull(3))
                                    Temp2.count[3, Temp2.i] = reader.GetDecimal(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp2.count[4, Temp2.i] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp2.count[5, Temp2.i] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp2.count[6, Temp2.i] = reader.GetString(6);
                                if (!reader.IsDBNull(7))
                                    Temp2.count[7, Temp2.i] = reader.GetInt32(7).ToString();
                                if (!reader.IsDBNull(8))
                                    Temp2.count[8, Temp2.i] = reader.GetInt32(8).ToString();
                                if (!reader.IsDBNull(9))
                                    Temp2.count[9, Temp2.i] = reader.GetString(9);
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

        public static bool Update_OFundDebitAssign(string dbname, int OFID, int OF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Modify Set BelongOFID=" + OFID + " where OF_MID=" + OF_MID, conn))
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

        public static bool OFund_Search4(string dbname, int OFID, string Temp)
        {
            bool result = false;
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
                    using (SqlCommand cmd = new SqlCommand("Select Subject, Type, Date, Price, Tax, SumPrice, Recorder, BelongOFID, OF_MID, Documents, ApprovalOFID From OFund_Modify Where BelongOFID=" + OFID + " And IncreaseDebit='" + Temp + "'", conn))
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
                                    Temp2.count[2, Temp2.i] = reader.GetDateTime(2).ToString("yyyy/MM/dd");
                                if (!reader.IsDBNull(3))
                                    Temp2.count[3, Temp2.i] = reader.GetDecimal(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp2.count[4, Temp2.i] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp2.count[5, Temp2.i] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp2.count[6, Temp2.i] = reader.GetString(6);
                                if (!reader.IsDBNull(7))
                                    Temp2.count[7, Temp2.i] = reader.GetInt32(7).ToString();
                                if (!reader.IsDBNull(8))
                                    Temp2.count[8, Temp2.i] = reader.GetInt32(8).ToString();
                                if (!reader.IsDBNull(9))
                                    Temp2.count[9, Temp2.i] = reader.GetString(9);
                                if (!reader.IsDBNull(10))
                                    Temp2.count[10, Temp2.i] = reader.GetInt32(10).ToString();
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

        public static bool Update_OFundDebitAssign_2(string dbname, int OFID, int OF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Modify Set ApprovalOFID=" + OFID + " where OF_MID=" + OF_MID, conn))
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

        public static decimal SumPrice_Search(string dbname, int OFID, string Temp)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select Sum(SumPrice) From OFund_Modify Where ApprovalOFID=" + OFID + " And IncreaseDebit ='" + Temp + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0);
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

        public static bool Update_OFundDebitAssign_3(string dbname, int OFID, decimal SUM_SumPrice, string Temp)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Main Set " + Temp + "= " + SUM_SumPrice + " where OFID=" + OFID, conn))
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

        public static bool OFundItem_Search(string dbname, int PID, int OF_Edition)
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
                    using (SqlCommand cmd = new SqlCommand("select LayerCode, ItemOrder, ItemName, Unit, LastCNumber, PriceID, CWID from CBudget_WBS where PID=" + PID, conn))
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
                                    Temp2.count[3, Temp2.i] = reader.GetString(3);
                                if (!reader.IsDBNull(4))
                                    Temp2.count[4, Temp2.i] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp2.count[5, Temp2.i] = reader.GetInt32(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp2.count[7, Temp2.i] = reader.GetInt32(6).ToString();
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
            Temp2.j = 1;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    Temp2.j = 1;
                    using (SqlCommand cmd = new SqlCommand("Select SUM(Daily_Activity.DailyNumber), EBudget_WBS.CWID From Daily_Activity Inner Join Daily_Main On Daily_Activity.DailyID = Daily_Main.DailyID Inner Join EBudget_WBS On Daily_Activity.EWID = EBudget_WBS.EWID Where Daily_Main.PID =" + PID + " GROUP BY EBudget_WBS.CWID", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp2.count2[0, Temp2.j] = reader.GetSqlDecimal(0).ToString();
                                if (!reader.IsDBNull(1))
                                    Temp2.count2[1, Temp2.j] = reader.GetInt32(1).ToString();
                                Temp2.j = Temp2.j + 1;
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
            for (int i = 1; i < Temp2.i; i++)
            {
                for (int j = 1; j < Temp2.j; j++)
                {
                    if (Temp2.count[7, i] == Temp2.count2[1, j])
                    {
                        Temp2.count[15, i] = Temp2.count2[0, j];
                    }
                }
            }
            for (int i = 1; i < Temp2.i; i++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("select CPrice from Pro_Resource where PriceID=" + Temp2.count[5, i], conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp2.count[6, i] = reader.GetDecimal(0).ToString();
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
            }
            for (int i = 1; i < Temp2.i; i++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("select ONumber, OPrice, ANumber, APrice, Note, OF_IID from OFund_Item where CWID=" + Temp2.count[7, i] + " and OFID=" + DAL.Temp3.cc, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp2.count[8, i] = reader.GetDecimal(0).ToString();
                                    if (!reader.IsDBNull(1))
                                        Temp2.count[9, i] = reader.GetDecimal(1).ToString();
                                    if (!reader.IsDBNull(2))
                                        Temp2.count[10, i] = reader.GetDecimal(2).ToString();
                                    if (!reader.IsDBNull(3))
                                        Temp2.count[11, i] = reader.GetDecimal(3).ToString();
                                    if (!reader.IsDBNull(4))
                                        Temp2.count[12, i] = reader.GetString(4);
                                    if (!reader.IsDBNull(5))
                                        Temp2.count[16, i] = reader.GetInt32(5).ToString();
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
            }
            Temp2.j = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select OFID From OFund_Main Where PID=" + PID + " and OF_Edition<" + OF_Edition, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Temp2.j = Temp2.j + 1;
                                if (!reader.IsDBNull(0))
                                    Temp2.count2[0, Temp2.j] = reader.GetInt32(0).ToString();
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            for (int i = 1; i < Temp2.i; i++)
            {
                Temp2.count[13, i] = "0.00";
                Temp2.count[14, i] = "0.00";
                for (int j = 1; j <= Temp2.j; j++)
                {
                    try
                    {
                        string connectionString = Utility.DBconnection.connect_string(dbname);
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            conn.Open();
                            using (SqlCommand cmd = new SqlCommand("Select ANumber, APrice from OFund_Item where CWID=" + Temp2.count[7, i] + " and OFID=" + Temp2.count2[0, j], conn))
                            {
                                using (var reader = cmd.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        if (!reader.IsDBNull(0))
                                            Temp2.count[13, i] = (Convert.ToDecimal(Temp2.count[13, i]) + reader.GetDecimal(0)).ToString();
                                        if (!reader.IsDBNull(1))
                                            Temp2.count[14, i] = (Convert.ToDecimal(Temp2.count[14, i]) + reader.GetDecimal(1)).ToString();
                                    }
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (SqlException ex)
                    {
                    }
                }
            }
            return result;
        }

        public static int OFundItemEdit_Update_1(string dbname, int OF_IID, decimal ONumber, decimal OPrice, decimal ANumber, decimal APrice, string Note)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("update OFund_Item set [ONumber]=" + ONumber + ", [OPrice]=" + OPrice + ", [ANumber]=" + ANumber + ", [APrice]=" + APrice + ", [Note]='" + Note + "' where OF_IID=" + OF_IID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result = 1;
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

        public static int OFundItemEdit_Update_2(string dbname, int OFID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string aa = "Update OFund_Main Set [OItem1] = (Select Sum(OPrice) From OFund_Item Where OFID = " + OFID + "), [AItem1] = (Select Sum(APrice) From OFund_Item Where OFID = " + OFID + ") Where OFID = " + OFID;
                    using (SqlCommand cmd = new SqlCommand("Update OFund_Main Set [OItem1] = (Select Sum(OPrice) From OFund_Item Where OFID = " + OFID + "), [AItem1] = (Select Sum(APrice) From OFund_Item Where OFID = " + OFID + ") Where OFID = " + OFID, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            result = 1;
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

        public static bool Insert_OFundDebitM_2(string dbname, int PID, string Type, string Subject, string Date, decimal Price, decimal Tax, decimal SumPrice, string Recorder, string Documents, string IncreaseDebit, int BelongOFID, int ApprovalOFID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Insert into OFund_Modify ([PID],[Type],[Subject],[Date],[Price],[Tax],[SumPrice],[Recorder],[Documents],[IncreaseDebit],[BelongOFID],[ApprovalOFID]) VALUES (" + PID + ",'" + Type + "','" + Subject + "','" + Date + "'," + Price + "," + Tax + "," + SumPrice + ",'" + Recorder + "','" + Documents + "','" + IncreaseDebit + "', '" + BelongOFID + "', '" + ApprovalOFID + "')", conn))
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

        public static decimal SumPrice_Search_11(string dbname, int OFID, string Temp)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select Sum(SumPrice) From OFund_Modify Where BelongOFID=" + OFID + " And IncreaseDebit ='" + Temp + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDecimal(0);
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
        
    }
    
}
