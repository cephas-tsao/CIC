using System.Data.SqlClient;

namespace DAL
{
    public class CompletionMode
    {
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
                    using (SqlCommand cmd = new SqlCommand("select CBudget_WBS.ItemOrder, CBudget_WBS.ItemName, CBudget_WBS.Unit, Pro_Resource.PriceID, CBudget_WBS.LastCNumber, Pro_Resource.CPrice, CBudget_WBS.ComNumber, CBudget_WBS.ComNotes, CBudget_WBS.LayerCode, Pro_Resource.Complex, CBudget_WBS.CWID, CBudget_WBS.ComNumber from CBudget_WBS, Pro_Resource where CBudget_WBS.PID=" + PID + " and CBudget_WBS.PriceID=Pro_Resource.PriceID", conn))
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
                                    Temp2.count[4, Temp2.i] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp2.count[5, Temp2.i] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp2.count[6, Temp2.i] = reader.GetDecimal(6).ToString();
                                if (!reader.IsDBNull(7))
                                    Temp2.count[7, Temp2.i] = reader.GetString(7);
                                if (!reader.IsDBNull(8))
                                    Temp2.count[8, Temp2.i] = reader.GetString(8);
                                if (!reader.IsDBNull(9))
                                    Temp2.count[9, Temp2.i] = reader.GetInt32(9).ToString();
                                if (!reader.IsDBNull(10))
                                    Temp2.count[10, Temp2.i] = reader.GetInt32(10).ToString();
                                if (!reader.IsDBNull(11))
                                    Temp2.count[11, Temp2.i] = reader.GetDecimal(11).ToString();
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

        public static bool CompletionFill_Update(string dbname, int PID, int CWID, decimal ComNumber, string ComNotes)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("update CBudget_WBS set [ComNumber]=" + ComNumber + ", [ComNotes]=" + ComNotes + " where CWID=" + CWID + " and PID=" + PID, conn))
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

        public static bool AcceptanceM_Insert(string dbname, int PID, string Type, string AllPart, int Batch, string Date, string Location, string Code, string FirmName, string TargetNumber, string PurchaseLevel, string DeadlineDate, string CompletionDate, string OverNY, decimal ContractPrice, int ChangeCount, string Process, string Result, string ResultNOT, string ImproveDate, string Notes)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("insert into AcceptanceRecord([PID],[Type],[AllPart],[Batch],[Date],[Location],[Code],[FirmName],[TargetNumber],[PurchaseLevel],[DeadlineDate],[CompletionDate],[OverNY],[ContractPrice],[ChangeCount],[Process],[Result],[ResultNOT],[ImproveDate],[Notes]) values (" + PID + ",'" + Type + "','" + AllPart + "'," + Batch + ",'" + Date + "','" + Location + "','" + Code + "','" + FirmName + "','" + TargetNumber + "','" + PurchaseLevel + "','" + DeadlineDate + "','" + CompletionDate + "','" +  OverNY  + "'," +  ContractPrice  + "," + ChangeCount + ",'" + Process + "','" + Result + "','" + ResultNOT + "','" + ImproveDate + "','" + Notes + "')", conn))
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

        public static string AcceptanceM_Search(string dbname, int AcceptID, string Temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from AcceptanceRecord where AcceptID=" + AcceptID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "Batch" || Temp == "ChangeCount")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
                                }
                                else if (Temp == "ContractPrice")
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

        public static bool Delete_AcceptanceM(string dbname, int AcceptID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM AcceptanceRecord WHERE AcceptID=" + AcceptID, conn))
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

        public static bool Update_AcceptanceM(string dbname, int AcceptID, string Type, string AllPart, int Batch, string Date, string Location, string Code, string FirmName, string TargetNumber, string PurchaseLevel, string DeadlineDate, string CompletionDate, string OverNY, decimal ContractPrice, int ChangeCount, string Process, string Result, string ResultNOT, string ImproveDate, string Notes)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string aa = "Update AcceptanceRecord Set Type='" + Type + "',AllPart='" + AllPart + "',Batch=" + Batch + ",Date='" + Date + "',Location='" + Location + "',Code='" + Code + "',FirmName='" + FirmName + "',TargetNumber='" + TargetNumber + "',PurchaseLevel='" + PurchaseLevel + "',DeadlineDate='" + DeadlineDate + "',CompletionDate='" + CompletionDate + "',OverNY='" + OverNY + "', ContractPrice=" + ContractPrice + ",ChangeCount=" + ChangeCount + "',Process='" + Process + "',Result='" + Result + "',ResultNOT='" + ResultNOT + "',ImproveDate='" + ImproveDate + "',Notes='" + Notes + "' where AcceptID = " + AcceptID;
                    using (SqlCommand cmd =
                        new SqlCommand("Update AcceptanceRecord Set Type='" + Type + "',AllPart='" + AllPart + "',Batch=" + Batch + ",Date='" + Date + "',Location='" + Location + "',Code='" + Code + "',FirmName='" + FirmName + "',TargetNumber='" + TargetNumber + "',PurchaseLevel='" + PurchaseLevel + "',DeadlineDate='" + DeadlineDate + "',CompletionDate='" + CompletionDate + "',OverNY='" + OverNY + "', ContractPrice=" + ContractPrice + ",ChangeCount=" + ChangeCount + ",Process='" + Process + "',Result='" + Result + "',ResultNOT='" + ResultNOT + "',ImproveDate='" + ImproveDate + "',Notes='" + Notes + "' where AcceptID = " + AcceptID, conn))
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

        public static string AcceptanceM_ProjectCode(string dbname, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select ProjectCode from ProjectM0 where PID=" + PID, conn))
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

        public static string AcceptanceM_BookFinishDate(string dbname, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select BookFinishDate from ProjectM1 where PID=" + PID, conn))
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

        public static string AcceptanceM_AdjestTotalPrice(string dbname, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select AdjestTotalPrice From CBudget_Change Where PID = " + PID + " And CEdition = (Select MAX(CEdition) From CBudget_Change Where PID = " + PID + ")", conn))
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

        public static string AcceptanceM_OContractPrice(string dbname, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Select OContrctPrice From ProjectM2 Where PID = " + PID, conn))
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
    }
}
