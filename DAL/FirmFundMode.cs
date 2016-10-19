using System;
using System.Data.SqlClient;

namespace DAL
{
    public class FirmFundMode
    {
        public static bool Insert_FFundDebit(string dbname, int PID, int SCID, string Type, string Subject, string Date, decimal Price, decimal Tax, decimal SumPrice, string Recorder, string IncreaseDebit, int RelationFF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Insert into FFund_Modify ([PID],[SCID],[Type],[Subject],[Date],[Price],[Tax],[SumPrice],[Recorder],[IncreaseDebit],[RelationFF_MID]) VALUES (" + PID + "," + SCID + ",'" + Type + "','" + Subject + "','" + Date + "'," + Price + "," + Tax + "," + SumPrice + ",'" + Recorder + "','" + IncreaseDebit + "'," + RelationFF_MID + ")", conn))
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

        public static bool Update_FFundDebit(string dbname, int FF_MID, string Type, string Subject, string Date, decimal Price, decimal Tax, decimal SumPrice, int RelationFF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string cmd2 = "Update FFund_Modify Set Type='" + Type + "',Subject='" + Subject + "', Date='" + Date.ToString() + "', Price=" + Price + ", Tax=" + Tax + ", SumPrice=" + SumPrice + " where FF_MID=" + FF_MID;
                    using (SqlCommand cmd =
                        new SqlCommand("Update FFund_Modify Set Type='" + Type + "',Subject='" + Subject + "', Date='" + Date.ToString() + "', Price=" + Price + ", Tax=" + Tax + ", SumPrice=" + SumPrice + ", RelationFF_MID=" + RelationFF_MID + " where FF_MID=" + FF_MID, conn))
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

        public static string FFD_ID_Search(string dbname, int FF_MID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from FFund_Modify where FF_MID=" + FF_MID, conn))
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
                                else if (Temp == "SCID" || Temp == "RelationFF_MID" || Temp == "BelongFFID")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
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

        public static bool Delete_FFundDebit(string dbname, int FF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM FFund_Modify WHERE FF_MID=" + FF_MID, conn))
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

        public static string FFundView_Search(string dbname, int FFID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from FFund_Main where FFID=" + FFID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "FF_Edition")
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

        public static string FFundView_Search2(string dbname, int SCID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from SubContract_Main where SCID = " + SCID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "FundCheckDay")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
                                }
                                else if (Temp == "RetentionPercent" || Temp == "PrepayPercent" || Temp == "LastTotalPrice" || Temp == "TaxPercent" || Temp == "FundCash" || Temp == "FundCheck")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDecimal(0).ToString();
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

        public static string FFundView_Search3(string dbname, int FFID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from FFund_Main where FFID=" + FFID, conn))
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

        public static string FFundView_Search4(string dbname, int SCID, string Temp, int FF_Edition)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select sum(" + Temp + ") from FFund_Main where SCID=" + SCID + " and FF_Edition<" + FF_Edition, conn))
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

        public static bool FFundItem_Search(string dbname, int FFID)
        {
            bool result = false;
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 20; j++)
                {
                    Temp.count3[i, j] = " ";
                }
            }
            Temp.j = 1;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select SC_MID, ComplexNumber, ComplexPrice, Note, FF_IID from FFund_Item where FFID=" + FFID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                        Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                if (!reader.IsDBNull(1))
                                        Temp.count3[8, Temp.j] = reader.GetDecimal(1).ToString();
                                if (!reader.IsDBNull(2))
                                        Temp.count3[9, Temp.j] = reader.GetDecimal(2).ToString();
                                if (!reader.IsDBNull(3))
                                        Temp.count3[10, Temp.j] = reader.GetString(3);
                                if (!reader.IsDBNull(4))
                                    Temp.count3[11, Temp.j] = reader.GetInt32(4).ToString();
                                Temp.j = Temp.j + 1;
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
            }
            for (int k = 1; k < Temp.j; k++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("select ItemName, Unit, LastSCNumber, UnitPrice, LastComplexPrice from SubContract_Item where SC_MID=" + Convert.ToInt32(Temp.count3[0, k]), conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[1, k] = reader.GetString(0);
                                    if (!reader.IsDBNull(1))
                                        Temp.count3[2, k] = reader.GetString(1);
                                    if (!reader.IsDBNull(2))
                                        Temp.count3[3, k] = reader.GetDecimal(2).ToString();
                                    if (!reader.IsDBNull(3))
                                        Temp.count3[4, k] = reader.GetDecimal(3).ToString();
                                    if (!reader.IsDBNull(4))
                                        Temp.count3[5, k] = reader.GetDecimal(4).ToString();
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
            for (int k = 1; k < Temp.j; k++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("select sum(ComplexNumber) from FFund_Item where SC_MID=" + Convert.ToInt32(Temp.count3[0, k]) + " and FFID<" + FFID, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[6, k] = reader.GetDecimal(0).ToString();
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
            for (int k = 1; k < Temp.j; k++)
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("select sum(ComplexPrice) from FFund_Item where SC_MID=" + Convert.ToInt32(Temp.count3[0, k]) + " and FFID<" + FFID, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[7, k] = reader.GetDecimal(0).ToString();
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
            }
            return result;
        }

        public static bool Insert_FFundEdit_1(string dbname, int PID, int SCID, int FF_Edition)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Insert into FFund_Main ([PID],[SCID],[FF_Edition]) VALUES (" + PID + "," + SCID + "," + FF_Edition + ")", conn))
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

        public static bool FFund_Search2(string dbname, int FFID, string Temp)
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
                    using (SqlCommand cmd = new SqlCommand("Select Subject, Type, Date, Price, Tax, SumPrice  From FFund_Modify Where BelongFFID=" + FFID + " And IncreaseDebit='" + Temp + "'", conn))
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
        public static string FFundView_Search50(string dbname, int SCID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from SubContract_Main where SCID=" + SCID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "SC_Name")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetString(0);
                                }
                                if (Temp == "TotalPrice")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDecimal(0).ToString();
                                }
                                if (Temp == "FirmID") 
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
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

        public static string FFundView_Search51(string dbname, int UID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select Name from FirmM where UID=" + UID, conn))
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
        public static bool FFund_Search3(string dbname, int SCID, string Temp)
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
                    using (SqlCommand cmd = new SqlCommand("Select Subject, Type, Date, Price, Tax, SumPrice, Recorder, BelongFFID, FF_MID From FFund_Modify Where SCID=" + SCID + " And IncreaseDebit='" + Temp + "'", conn))
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
        public static int Edition_Search(string dbname, int PID, int SCID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select Max(FF_Edition) From FFund_Main Where PID=" + PID + " and SCID=" + SCID, conn))
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
        public static bool Delete_FFund_Main_and_Item(string dbname, int FFID)
        {
            bool result = false;
            bool result_2 = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM FFund_Main WHERE FFID=" + FFID, conn))
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
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM FFund_Item WHERE FFID=" + FFID, conn))
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
                    using (SqlCommand cmd = new SqlCommand("Update Set BelongFFID=0 From FFund_Modify Where BelongFFID=" + FFID, conn))
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
        public static int FFID_Search(string dbname, int SCID, int Edition)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select FFID From FFund_Main Where SCID=" + SCID + " And FF_Edition=" + Edition, conn))
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

        public static int Update_FFund_Main(string dbname, int FFID, string Temp, string Value)
        {
            int result = 0;
            string aa = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    if (Temp == "FF_Code" || Temp == "StartDate" || Temp == "FundDate" || Temp == "EndDate" || Temp == "PayDate" || Temp == "Note")
                    {
                        aa = "Update FFund_Main Set " + Temp + "='" + Value + "' where FFID=" + FFID;
                    }
                    else
                    {
                        aa = "Update FFund_Main Set " + Temp + "=" + Convert.ToDecimal(Value) + " where FFID=" + FFID;
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
        public static bool Update_FFundDebitAssign(string dbname, int FFID, int FF_MID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update FFund_Modify Set BelongFFID=" + FFID + " where FF_MID=" + FF_MID, conn))
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
        public static int FFundItemEdit_Update_1(string dbname, int FF_IID, decimal ComplexNumber, decimal ComplexPrice, string Note)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("update FFund_Item set [ComplexNumber]=" + ComplexNumber + ", [ComplexPrice]=" + ComplexPrice + ", [Note]='" + Note + "' where FF_IID=" + FF_IID, conn))
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
        public static int FFundItemEdit_Update_2(string dbname, int FFID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string aa = "update FFund_Main set [Item1]=(Select Sum(ComplexPrice) From FFund_Item Where FFID=" + FFID + ") where FFID=" + FFID;
                    using (SqlCommand cmd = new SqlCommand("update FFund_Main set [Item1]=(Select Sum(ComplexPrice) From FFund_Item Where FFID=" + FFID + ") where FFID=" + FFID, conn))
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

        public static decimal SumPrice_Search_11(string dbname, int FFID, string Temp)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select Sum(SumPrice) From FFund_Modify Where BelongFFID=" + FFID + " And IncreaseDebit ='" + Temp + "'", conn))
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

        public static bool Update_FFundDebitAssign_3(string dbname, int FFID, decimal SUM_SumPrice, string Temp)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Update FFund_Main Set " + Temp + "= " + SUM_SumPrice + " where FFID=" + FFID, conn))
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

        public static bool SC_MID_Search(string dbname, int SCID)
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
                    using (SqlCommand cmd = new SqlCommand("Select SC_MID From SubContract_Item Where SCID=" + SCID, conn))
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

        public static bool Insert_FFundEdit_2(string dbname, int FFID)
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
                        using (SqlCommand cmd = new SqlCommand("Insert into FFund_Item ([FFID],[SC_MID]) VALUES (" + FFID + "," + Convert.ToInt32(Temp2.count[0, i]) + ")", conn))
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

        public static bool SC_Name_Search(string dbname, int PID)
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
                    using (SqlCommand cmd = new SqlCommand("SELECT SC_Name, SCID FROM SubContract_Main WHERE PID=" + PID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp2.count[0, Temp2.i] = reader.GetString(0);
                                if (!reader.IsDBNull(1))
                                    Temp2.count[1, Temp2.i] = reader.GetInt32(1).ToString();
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

        public static int Search_FF_MID(string dbname, int PID)
        {
            int result=0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT MAX(FF_MID) FROM FFund_Modify WHERE PID=" + PID, conn))
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

        public static int Search_RelationFF_MID(string dbname, int FF_MID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT RelationFF_MID FROM FFund_Modify WHERE FF_MID=" + FF_MID, conn))
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

        public static int Search_RelationFF_MID_2(string dbname, int RelationFF_MID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT FF_MID FROM FFund_Modify WHERE RelationFF_MID=" + RelationFF_MID, conn))
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
    }

    public class Temp3
    {
        public static int cc;
    }
}
