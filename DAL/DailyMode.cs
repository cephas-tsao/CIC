using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DAL
{
    public class DailyMode
    {
        public static bool Check_Report_Base(string dbname, int ProjectID, string Report_Date)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select count(*) from Report_Base Where ProjectID=" + ProjectID + " and ReportDate='" + Report_Date + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.GetInt32(0) != 0)
                                    result = true;
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

            return result;
        }
        public static bool Insert_Report_Base(string dbname, int ProjectID, string Report_Date, string Morning_Weather, string Afternoon_Weather, int UserID, bool Mwork, bool Awork)
        {
            bool result = false;
            string nowdate = DateTime.Now.ToString("yyyy/MM/dd");
            string b1 = "0";
            string b2 = "0";
            if (Mwork)
            {
                b1 = "1";
            }
            if (Awork)
            {
                b2 = "1";
            }

            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Report_Base([ProjectID],[ReportDate],[MorningWeather],[AfternoonWeather],[DataDate],[ReporterID],[MorningWork],[AfternoonWork]) VALUES (" + ProjectID.ToString() + ",'" + Report_Date + "','" + Morning_Weather + "','" + Afternoon_Weather + "','" + nowdate + "'," + UserID.ToString() + "," + b1 + "," + b2 + ")", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static bool Insert_Report_Record(string dbname, int ReportID, string RecordType, string Content)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Report_Record WHERE ReportID='" + ReportID + "' and RecordType='" + RecordType + "'", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Report_Record([ReportID],[RecordType],[RecordContent]) VALUES (" + ReportID.ToString() + ",'" + RecordType + "','" + Content + "')", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static string Get_Report_Record(string dbname, int ReportID, string RecordType)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select RecordContent from Report_Record Where ReportID=" + ReportID + " and RecordType='" + RecordType + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static string Get_UsualWord_List(string dbname, string Type)
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
                        new SqlCommand("select distinct * from UsualWord where Type='" + Type + "'", conn))
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
                                    result += "<option>" + reader.GetString(2) + "</option>";
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
            //    result.Substring(0, result.Length - 1);
            //}
            return result;
        }

        public static string Get_UsualWord_List2(string dbname, string Type)
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
                        new SqlCommand("select distinct * from UsualWord where Type='" + Type + "'", conn))
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
                                    result += "\"" + reader.GetString(2) + "\",";
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

        public static bool Insert_Report_MaterialIn(string dbname, int ReportID, int FirmID, int ResourceID, string Amount, string Price)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Report_MaterialIN([ReportID],[FirmID],[ResourceID],[Amount],[Price]) VALUES (" + ReportID.ToString() + "," + FirmID.ToString() + "," + ResourceID.ToString() + "," + Amount + "," + Price + ")", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static string Get_Unit_By_ResourceID(string dbname, int ResourceID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select Unit from Bid_Library where PriceID=" + ResourceID.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static string Get_FirmName_By_FirmID(string dbname, int FirmID)
        {
            string FirmName = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select Name from FirmM Where UID=" + FirmID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    FirmName = reader.GetString(0);
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

            return FirmName;
        }

        public static string Get_ResourceName_By_ResourceID(string dbname, int ResourceID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ItemName from Bid_Library where PriceID=" + ResourceID.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static bool Insert_Report_Progress(string dbname, int ReportID, int ProgressID, int NowProgress)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Report_Progress WHERE ReportID='" + ReportID.ToString() + "' and ProgressID=" + ProgressID.ToString(), conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Report_Progress([ReportID],[ProgressID],[CompleteProgress]) VALUES (" + ReportID.ToString() + "," + ProgressID.ToString() + "," + NowProgress.ToString() + ")", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static string Get_WBSName_By_ProgressID(string dbname, int ProgressID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select WBSName from Report_3in1 where ProgressID=" + ProgressID.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static string Get_WIName_By_ProgressID(string dbname, int ProgressID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select WIName from Report_3in1 where ProgressID=" + ProgressID.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static double Get_SummaryDays_By_ReportID_ProgressID(string dbname, int ReportID, int ProgressID)
        {
            double result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select MorningWork, AfternoonWork from Report_3in1 where ProgressID=" + ProgressID.ToString() + " and ReportID in (select ReportID from Report_Base Where DataDate<=(select DataDate from Report_Base Where ReportID=" + ReportID.ToString() + "))", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    if (reader.GetBoolean(0))
                                    {
                                        result = result + 0.5;
                                    }
                                    if (reader.GetBoolean(1))
                                    {
                                        result = result + 0.5;
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
            return result;
        }

        public static decimal Get_RemainResource_By_ResourceID(string dbname, int ReportID, int ResourceID)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select sum(Amount) from Report_MaterialIN Where ResourceID=" + ResourceID + " and ReportID=" + ReportID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result = reader.GetDecimal(0);
                                }
                                else
                                {
                                    result = 0;
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("select sum(Amount) from Report_MaterialOut Where ResourceID=" + ResourceID + " and ReportID=" + ReportID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result = result - reader.GetDecimal(0);
                                }
                                else
                                {
                                    result = result - 0;
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
            return result;
        }

        public static bool Insert_Report_MaterialOut(string dbname, int ReportID, int ResourceID, string Amount)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Report_MaterialOut([ReportID],[ResourceID],[Amount]) VALUES (" + ReportID.ToString() + "," + ResourceID.ToString() + "," + Amount + ")", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }

        public static decimal Get_TotalMaterialIn_By_ResourceID_ProjectID_Day(string dbname, int ResourceID, int ProjectID, string date)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select sum(Amount) from CICIMS.dbo.Report_MaterialIN WHERE ResourceID=" + ResourceID.ToString() + " and ReportID in (SELECT ReportID FROM Report_Base WHERE ProjectID=" + ProjectID.ToString() + " and Reportdate<'" + date + "')", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result = reader.GetDecimal(0);
                                }
                                else
                                {
                                    result = 0;
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

            return result;
        }

        public static decimal Get_TotalMaterialOut_By_ResourceID_ProjectID_Day(string dbname, int ResourceID, int ProjectID, string date)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select sum(Amount) from CICIMS.dbo.Report_MaterialOut WHERE ResourceID=" + ResourceID.ToString() + " and ReportID in (SELECT ReportID FROM Report_Base WHERE ProjectID=" + ProjectID.ToString() + " and Reportdate<'" + date + "')", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result = reader.GetDecimal(0);
                                }
                                else
                                {
                                    result = 0;
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

            return result;
        }

        /// old
        ///
        /// new & stupid

        public static bool Report_Date_Check(string dbname, int ProjectID, DateTime ReportDate)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select count(*) from Daily_Main where PID='" + ProjectID.ToString() + "' and Date='" + ReportDate.ToShortDateString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    if (reader.GetInt32(0) > 0)
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static bool Report_Data_FirstInsert(string dbname, int ProjectID, DateTime ReportDate)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("Insert into Daily_Main([PID],[Date]) VALUES (" + ProjectID.ToString() + ",'" + ReportDate.ToShortDateString() + "')", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static int Get_DailyID_By_ProjectID_ReportDate(string dbname, int ProjectID, DateTime ReportDate)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select DailyID from Daily_Main where PID='" + ProjectID.ToString() + "' and Date='" + ReportDate.ToShortDateString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static bool Update_Report_Data(string dbname, int DailyID, string WAM, string WPM, bool DAM, bool DPM, decimal BProg, decimal RProg)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Update Daily_Main Set WeatherAM='" + WAM + "',WeatherPM='" + WPM + "', DurationAM='" + DAM.ToString() + "', DurationPM='" + DPM.ToString() + "', BookProgress='" + BProg.ToString() + "', RealProgress='" + RProg.ToString() + "' where DailyID=" + DailyID.ToString(), conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static bool Update_Report_TextBoxs(string dbname, int DailyID, string[] RecordType, string[] RecordContent)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd0 = new SqlCommand("DELETE FROM Daily_Record WHERE DailyID='" + DailyID.ToString() + "'", conn))
                    {
                        int rows = cmd0.ExecuteNonQuery();
                    }

                    for (int i = 0; i < RecordType.Length; i++)
                    {
                        using (SqlCommand cmd =
                            new SqlCommand("INSERT INTO Daily_Record([DailyID],[RecordType],[RecordContent])  Values ('" + DailyID.ToString() + "','" + RecordType[i] + "','" + RecordContent[i] + "')", conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows > 0)
                            {
                                result = true;
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

            return result;
        }

        public static bool Get_Report_Data_By_DailyID(string dbname, int DailyID, out string WAM, out string WPM, out bool DAM, out bool DPM, out decimal BProg, out decimal RProg)
        {
            bool result = false;
            WAM = "";
            WPM = "";
            DAM = false;
            DPM = false;
            BProg = 0.000M;
            RProg = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select WeatherAM, WeatherPM, DurationAM, DurationPM, BookProgress, RealProgress from Daily_Main where DailyID='" + DailyID.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    WAM = reader.GetString(0);
                                }
                                else
                                {
                                    WAM = "0";
                                }
                                if (!reader.IsDBNull(1))
                                {
                                    WPM = reader.GetString(1);
                                }
                                else
                                {
                                    WPM = "0";
                                }
                                if (!reader.IsDBNull(2))
                                {
                                    DAM = reader.GetBoolean(2);
                                }
                                else
                                {
                                    DAM = false;
                                }
                                if (!reader.IsDBNull(3))
                                {
                                    DPM = reader.GetBoolean(3);
                                }
                                else
                                {
                                    DPM = false;
                                }
                                if (!reader.IsDBNull(4))
                                {
                                    BProg = reader.GetDecimal(4);
                                }
                                else
                                {
                                    BProg = 0.000M;
                                }
                                if (!reader.IsDBNull(5))
                                {
                                    RProg = reader.GetDecimal(5);
                                }
                                else
                                {
                                    RProg = 0.000M;
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

            return result;
        }

        public static bool Get_Report_TextBoxs_By_DailyID(string dbname, int DailyID, out string[] RecordType, out string[] RecordContent)
        {
            bool result = false;
            RecordType = new string[10];
            RecordContent = new string[10];
            int count = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select RecordType,RecordContent from daily_Record where DailyID='" + DailyID.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                RecordType[count] = reader.GetString(0);
                                RecordContent[count] = reader.GetString(1);
                                count++;
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
            return result;
        }

        public static int Insert_Activity_Check(string dbname, int DailyID,  int WIID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select UID from Daily_Activity where DailyID='" + DailyID.ToString() + "' and WIID='" + WIID , conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static bool Insert_Activity(string dbname, int DailyID, int EWID, int WIID, string WIName, int Version, string Unit, decimal BudgetNumber, decimal DoneNumber, decimal DailyNumber)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO Daily_Activity([DailyID],[EWID],[WIID],[WIName],[Version],[Unit],[BudgetNumber],[DoneNumber],[DailyNumber])  Values ('" + DailyID.ToString() + "','" + EWID.ToString() + "','" + WIID.ToString() + "','" + WIName + "','" + Version.ToString() + "','" + Unit + "','" + BudgetNumber.ToString() + "','" + DoneNumber.ToString() + "','" + DailyNumber.ToString() + "')", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static bool Update_Activity(string dbname, int UID, int DailyID, int EWID, int WIID, string WIName, int Version, string Unit, decimal BudgetNumber, decimal DoneNumber, decimal DailyNumber)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("UPDATE Daily_Activity SET [DailyID]='" + DailyID.ToString() + "',[EWID]='" + EWID.ToString() + "',[WIID]='" +
                            WIID.ToString() + "',[WIName]='" + WIName + "',[Version]='" + Version.ToString() + "',[Unit]='" + Unit + "',[BudgetNumber]='" +
                            BudgetNumber.ToString() + "',[DoneNumber]='" + DoneNumber.ToString() + "',[DailyNumber]='" + DailyNumber.ToString() + "'", conn))
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
                Console.Write(ex.ToString());
                //Display Error message
            }

            return result;
        }

        public static decimal Get_ENumber_times_Amount_By_WIID_Version(string dbname, int WIID, int Version)
        {
            decimal result = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select (ENumber*Amount) as Result from EBudget_WBS join Progress_WIINF on Progress_WIINF.WBSID=EBudget_WBS.EWID where WIID='" + WIID.ToString() + "' and Version='" + Version.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }
            return result;
        }

        public static decimal Get_DoneNumber_By_WIID_Version_ReportDate(string dbname, int WIID, int Version, DateTime ReportDate)
        {
            decimal result = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select sum(DailyNumber) as SumDailyNumber from daily_Main join Daily_Activity on daily_main.DailyID=Daily_Activity.DailyID where Date<'" + ReportDate.ToShortDateString() + "' and WIID='" + WIID.ToString() + "' and Version='" + Version.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }

            return result;
        }

        public static string Insert_Labor_Check(string dbname, int temp)
        {
            string result="";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select ItemName from Pro_Resource where PriceID=" + temp + "", conn))
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
        public static string Insert_Labor_Check1(string dbname, int temp)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select Unit from Pro_Resource where PriceID=" + temp + "", conn))
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
        public static decimal Insert_Labor_Check2(string dbname, int temp)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select CAmount from Pro_Resource where PriceID=" + temp + "", conn))
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
        public static decimal Insert_Labor_Check3(string dbname, int temp)
        {
            decimal result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select EAmount from Pro_Resource where PriceID=" + temp + "", conn))
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
        public static bool Insert_Labor(string dbname, int DailyID, int PriceID, string ItemName, string Unit, decimal CAmount, decimal EAmount)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO Daily_Labor([DailyID],[PriceID],[ItemName],[Unit],[CAmount],[EAmount])  Values (" + DailyID.ToString() + "," + PriceID.ToString() + ",'" + ItemName + "','" + Unit + "'," + CAmount + "," + EAmount + ")", conn))
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
        public static bool Insert_Equipment(string dbname, int DailyID, int PriceID, string ItemName, string Unit, decimal CAmount, decimal EAmount)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO Daily_Equipment([DailyID],[PriceID],[ItemName],[Unit],[CAmount],[EAmount])  Values (" + DailyID.ToString() + "," + PriceID.ToString() + ",'" + ItemName + "','" + Unit + "'," + CAmount + "," + EAmount + ")", conn))
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
        public static bool Update_Labor(string dbname, int UID, int DailyID, int PriceID, string ItemName, string Unit, decimal DailyNumber, int NY)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("UPDATE Daily_Labor SET [DailyID]='" + DailyID.ToString() + "',[PriceID]='" + PriceID.ToString() +
                            "',[ItemName]='" + ItemName + "',[Unit]='" + Unit + "',[DailyNumber]='" +
                            DailyNumber.ToString() + "',[ValucationNY]='" + NY.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }

            return result;
        }

        public static int Get_Labor_NY_By_DailyID_PriceID(string dbname, int DailyID, int PriceID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ValucationNY from daily_Labor where DailyID='" + DailyID.ToString() + "' and PriceID='" + PriceID.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }

            return result;
        }

        public static decimal Get_Resource_ENumber_By_PriceID(string dbname, int PriceID)
        {
            decimal result = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select EAmount from Pro_Resource where PriceID='" + PriceID.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }

            return result;
        }

        public static decimal Get_Resource_CNumber_By_PriceID(string dbname, int PriceID)
        {
            decimal result = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select CAmount from Pro_Resource where PriceID='" + PriceID.ToString() + "'", conn))
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
                //Log exception
                //Display Error message
            }

            return result;
        }
        public static bool Up_WorkPice(string dbname, int DailyID, string PicPath, string PicTitle, string PicType, int CWID, string PicNote, string PicDate, string PicLocation, string PicPeriod, string SC_Code)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = 
                        new SqlCommand("INSERT INTO Daily_WorkPic([DailyID],[PicPath],[PicTitle],[PicType],[CWID],[PicNote],[PicDate],[PicLocation],[PicPeriod],[SC_Code]) Values (" + DailyID + ",'" + PicPath + "','" + PicTitle + "','" + PicType + "', " + CWID + ",'" + PicNote + "','" + PicDate + "','" + PicLocation + "','" + PicPeriod + "','" + SC_Code + "')", conn))
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
        public static bool Report_Data_FirstDelete(string dbname, string PicTitle)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Daily_WorkPic WHERE PicTitle='" + PicTitle + "'", conn))
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
        public static string Report_Data_Check(string dbname, string Temp, int UID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from Daily_WorkPic where UID=" + UID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Temp == "CWID")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetInt32(0).ToString();
                                }
                                else if (Temp == "PicDate")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDateTime(0).ToString("yyyy/MM/dd");
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
        public static int Report_Data_Check2(string dbname, string DataTale, string Temp, string PicTitle)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from " + DataTale + " where ItemName='" + PicTitle + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetInt32(0);
                            }
                        }
                        conn.Close();
                    }
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
        public static string Report_Data_Check3(string dbname, string DataTale, string Temp, string PicTitle)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Temp + " from " + DataTale + " where ItemName='" + PicTitle + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
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
        public static bool TestSampling_Add_Data(string dbname, string aa1, string aa2, string ItemName, string Unit)
        {
            int DailyID = Convert.ToInt16(aa1);
            int PriceID = Convert.ToInt16(aa2);
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Daily_TestSampling([DailyID],[PriceID],[ItemName],[Unit]) Values (" + DailyID + "," + PriceID + ",'" + ItemName + "','" + Unit + "')", conn))
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
        public static string DataBase_Search(string dbname, string Search_Column, string Search_Table, string Condition_Column, string Condition, string Condition_Type, string reader_Type)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    if (Condition_Type == "1")
                    {
                        SqlCommand cmd = new SqlCommand("select " + Search_Column + " from " + Search_Table + " where " + Condition_Column + "=" + Condition, conn);
                        SqlDataReader reader  = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            if (!reader.IsDBNull(0))
                                if (reader_Type == "1")
                                {
                                    result = reader.GetInt16(0).ToString();
                                }
                                else if (reader_Type == "2")
                                {
                                    result = reader.GetDecimal(0).ToString();
                                }
                                else if (reader_Type == "3")
                                {
                                    result = reader.GetString(0);
                                }
                                else if (reader_Type == "4")
                                {
                                    result = reader.GetBoolean(0).ToString();
                                }
                        }
                    }
                    else if (Condition_Type == "2")
                    {
                        SqlCommand cmd = new SqlCommand("select " + Search_Column + " from " + Search_Table + " where " + Condition_Column + "='" + Condition + "'", conn);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            if (!reader.IsDBNull(0))
                                if (reader_Type == "1")
                                {
                                    result = reader.GetInt32(0).ToString();
                                }
                                else if (reader_Type == "2")
                                {
                                    result = reader.GetDecimal(0).ToString();
                                }
                                else if (reader_Type == "3")
                                {
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
        public static string DataBase_Search2(string dbname, string Search_Column, string Search_Table, string Condition_Column1, string Condition1, string Condition_Column2, string Condition2)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Search_Column + " from " + Search_Table + " where " + Condition_Column1 + "=" + Convert.ToInt16(Condition1) + " and " + Condition_Column2 + "='" + Condition2 + "'", conn))
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
        public static bool Daily_Labor_Search2(string dbname, string Search_Table, string Condition_Column1, string Condition1)
        {
            bool result = false;
            Temp.j = 1;
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 20; j++)
                {
                    Temp.count3[i, j] = " ";
                }
            }
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select  UID, ItemName, Unit, CAmount, EAmount, DailyNumber, ValucationNY  from " + Search_Table + " where " + Condition_Column1 + "=" + Convert.ToInt16(Condition1), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                if (!reader.IsDBNull(1))
                                    Temp.count3[1, Temp.j] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp.count3[2, Temp.j] = reader.GetString(2);
                                if (!reader.IsDBNull(3))
                                    Temp.count3[3, Temp.j] = reader.GetDecimal(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp.count3[6, Temp.j] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp.count3[7, Temp.j] = reader.GetInt32(6).ToString();
                                Temp.j = Temp.j + 1;
                            }
                        }
                        conn.Close();
                    }
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
                        using (SqlCommand cmd = new SqlCommand("select sum(DailyNumber) from " + Search_Table + " where " + Condition_Column1 + "<" + Convert.ToInt16(Condition1) + " and ItemName='" + Temp.count3[1, k] +"'", conn))
                        {                                                                                      
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[5, k] = reader.GetDecimal(0).ToString();
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
            return result;
        }
        public static bool Daily_Material_Search(string dbname, string Search_Table, string Condition_Column1, string Condition1)
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
                    using (SqlCommand cmd = new SqlCommand("select  UID, ItemName, Unit, CAmount, EAmount, DailyInNumber, DailyOutNumber, ValucationNY  from " + Search_Table + " where " + Condition_Column1 + "=" + Convert.ToInt16(Condition1), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                if (!reader.IsDBNull(1))
                                    Temp.count3[1, Temp.j] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp.count3[2, Temp.j] = reader.GetString(2);
                                if (!reader.IsDBNull(3))
                                    Temp.count3[3, Temp.j] = reader.GetDecimal(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp.count3[7, Temp.j] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp.count3[8, Temp.j] = reader.GetDecimal(6).ToString();
                                if (!reader.IsDBNull(7))
                                    Temp.count3[9, Temp.j] = reader.GetInt32(7).ToString();
                                Temp.j = Temp.j + 1;
                            }
                        }
                        conn.Close();
                    }
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
                        using (SqlCommand cmd = new SqlCommand("select sum(DailyInNumber), sum(DailyOutNumber) from " + Search_Table + " where " + Condition_Column1 + "<" + Convert.ToInt16(Condition1) + " and ItemName='" + Temp.count3[1, k] + "'", conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                    {
                                        Temp.count3[5, k] = reader.GetDecimal(0).ToString();
                                    }
                                    else
                                    {
                                        Temp.count3[5, k] = "0";
                                    }
                                    if (!reader.IsDBNull(1))
                                    {
                                        Temp.count3[6, k] = reader.GetDecimal(1).ToString();
                                    }
                                    else 
                                    {
                                        Temp.count3[6, k] = "0";
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
            }
            return result;
        }
        public static int Get_Data(string dbname, string Search_Data)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select DailyID from Daily_Main where Date='" + Search_Data + "'", conn))
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
        public static string Weather_Search(string dbname, string Date, string Weather)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Weather + " from Daily_Main Where Date='" + Date + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
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
        public static bool TestReport_Add_Data(string dbname, string DailyID, string Daily_SampleID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Daily_TestReport([DailyID],[Daily_SampleID]) Values (" + DailyID + "," + Daily_SampleID + ")", conn))
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
        public static bool Daily_TestReport_Search(string dbname, string Condition)
        {
            bool result = false;
            Temp.j = 1;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select Daily_TestSampling.ItemName, Daily_TestSampling.Unit, Daily_TestSampling.SNumber, Daily_TestSampling.SUnit, Daily_TestSampling.Notes, Daily_TestReport.Daily_ReportID, Daily_TestReport.RegularNumber, Daily_TestReport.TestMan, Daily_TestReport.RealReportDate, Daily_TestReport.LabName, Daily_TestReport.TestReportPath from Daily_TestReport INNER JOIN Daily_TestSampling ON Daily_TestReport.Daily_SampleID = Daily_TestSampling.Daily_SampleID  where Daily_TestReport.DailyID =" + Convert.ToInt16(Condition), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp.count3[0, Temp.j] = reader.GetString(0);
                                if (!reader.IsDBNull(1))
                                    Temp.count3[1, Temp.j] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp.count3[2, Temp.j] = reader.GetDecimal(2).ToString();
                                if (!reader.IsDBNull(3))
                                    Temp.count3[3, Temp.j] = reader.GetString(3);
                                if (!reader.IsDBNull(4))
                                    Temp.count3[4, Temp.j] = reader.GetString(4);
                                if (!reader.IsDBNull(5))
                                    Temp.count3[5, Temp.j] = reader.GetInt32(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp.count3[6, Temp.j] = reader.GetDecimal(6).ToString();
                                if (!reader.IsDBNull(7))
                                    Temp.count3[7, Temp.j] = reader.GetString(7);
                                if (!reader.IsDBNull(8))
                                    Temp.count3[8, Temp.j] = reader.GetDateTime(8).ToString("yyyy-mm-dd");
                                if (!reader.IsDBNull(9))
                                    Temp.count3[9, Temp.j] = reader.GetString(9);
                                if (!reader.IsDBNull(10))
                                    Temp.count3[10, Temp.j] = reader.GetString(10);
                                Temp.j = Temp.j + 1;
                            }
                        }
                        conn.Close();
                    }
                }
            }
            catch (SqlException ex)
            {
            }
            return result;
        }
        public static bool Daily_Equipment_Search2(string dbname, string Search_Table, string Condition_Column1, string Condition1)
        {
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 20; j++)
                {
                    Temp.count3[i, j] = " ";
                }
            }
            bool result = false;
            Temp.j = 1;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select  UID, ItemName, Unit, CAmount, EAmount, DailyNumber, ValucationNY  from " + Search_Table + " where " + Condition_Column1 + "=" + Convert.ToInt16(Condition1), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                if (!reader.IsDBNull(1))
                                    Temp.count3[1, Temp.j] = reader.GetString(1);
                                if (!reader.IsDBNull(2))
                                    Temp.count3[2, Temp.j] = reader.GetString(2);
                                if (!reader.IsDBNull(3))
                                    Temp.count3[3, Temp.j] = reader.GetDecimal(3).ToString();
                                if (!reader.IsDBNull(4))
                                    Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                if (!reader.IsDBNull(5))
                                    Temp.count3[6, Temp.j] = reader.GetDecimal(5).ToString();
                                if (!reader.IsDBNull(6))
                                    Temp.count3[7, Temp.j] = reader.GetInt32(6).ToString();
                                Temp.j = Temp.j + 1;
                            }
                        }
                        conn.Close();
                    }
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
                        using (SqlCommand cmd = new SqlCommand("select sum(DailyNumber) from " + Search_Table + " where " + Condition_Column1 + "<" + Convert.ToInt16(Condition1) + " and ItemName='" + Temp.count3[1, k] + "'", conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[5, k] = reader.GetDecimal(0).ToString();
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
            return result;
        }
        public static bool Insert_Material(string dbname, int DailyID, int PriceID, string ItemName, string Unit, decimal CAmount, decimal EAmount)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO Daily_Material([DailyID],[PriceID],[ItemName],[Unit],[CAmount],[EAmount])  Values (" + DailyID.ToString() + "," + PriceID.ToString() + ",'" + ItemName + "','" + Unit + "'," + CAmount + "," + EAmount + ")", conn))
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
        public static bool Up_TestReport(string dbname, int Daily_ReportID, string TestReportPath)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE Daily_TestReport SET [TestReportPath]='" + TestReportPath + "' WHERE [Daily_ReportID]=" + Daily_ReportID, conn))
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
        public static bool Daily_TestReport_File_Check(string dbname, int Daily_ReportID)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select TestReportPath from Daily_TestReport where Daily_ReportID = " + Daily_ReportID, conn))
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
        public static bool DailyTestView_Search(string dbname, string Condition1, string Condition2)
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
            if (Condition2 == "")
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string RR;
                        if (Condition1 == "")
                        {
                            RR = "select Daily_SampleID, ItemName, TestType, Location, SNumber from Daily_TestSampling";
                        }
                        else
                        {
                            RR = "select Daily_TestSampling.Daily_SampleID, Daily_TestSampling.ItemName, Daily_TestSampling.TestType, Daily_TestSampling.Location, Daily_TestSampling.SNumber from Daily_Main, Daily_TestSampling where " + Condition1;
                        }
                        using (SqlCommand cmd = new SqlCommand(RR, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                    if (!reader.IsDBNull(1))
                                        Temp.count3[1, Temp.j] = reader.GetString(1);
                                    if (!reader.IsDBNull(2))
                                        Temp.count3[2, Temp.j] = reader.GetString(2);
                                    if (!reader.IsDBNull(3))
                                        Temp.count3[3, Temp.j] = reader.GetString(3);
                                    if (!reader.IsDBNull(4))
                                        Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                    Temp.j = Temp.j + 1;
                                }
                            }
                            conn.Close();
                        }
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
                            string RR;
                            RR = "select RegularNumber, LabName from Daily_TestReport where Daily_SampleID = " + Convert.ToInt16(Temp.count3[0, k]);
                            using (SqlCommand cmd = new SqlCommand(RR, conn))
                            {
                                using (var reader = cmd.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        if (!reader.IsDBNull(0))
                                            Temp.count3[5, k] = reader.GetDecimal(0).ToString();
                                        if (!reader.IsDBNull(1))
                                            Temp.count3[6, k] = reader.GetString(1);
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
            else
            {
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string RR;
                        if (Condition1 == "")
                        {
                            RR = "select Daily_TestSampling.Daily_SampleID, Daily_TestSampling.ItemName, Daily_TestSampling.TestType, Daily_TestSampling.Location, Daily_TestSampling.SNumber, Daily_TestReport.RegularNumber, Daily_TestReport.LabName from Daily_TestSampling, Daily_TestReport where Daily_TestSampling.Daily_SampleID=Daily_TestReport.Daily_SampleID AND " + Condition2;
                        }
                        else
                        {
                            RR = "select Daily_TestSampling.Daily_SampleID, Daily_TestSampling.ItemName, Daily_TestSampling.TestType, Daily_TestSampling.Location, Daily_TestSampling.SNumber, Daily_TestReport.RegularNumber, Daily_TestReport.LabName from Daily_Main, Daily_TestSampling, Daily_TestReport where Daily_Main.DailyID=Daily_TestSampling.DailyID and Daily_TestSampling.Daily_SampleID=Daily_TestReport.Daily_SampleID AND " + Condition1 + " AND " + Condition2;
                        }
                        using (SqlCommand cmd = new SqlCommand(RR, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                    if (!reader.IsDBNull(1))
                                        Temp.count3[1, Temp.j] = reader.GetString(1);
                                    if (!reader.IsDBNull(2))
                                        Temp.count3[2, Temp.j] = reader.GetString(2);
                                    if (!reader.IsDBNull(3))
                                        Temp.count3[3, Temp.j] = reader.GetString(3);
                                    if (!reader.IsDBNull(4))
                                        Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                    if (!reader.IsDBNull(5))
                                        Temp.count3[5, Temp.j] = reader.GetDecimal(5).ToString();
                                    if (!reader.IsDBNull(6))
                                        Temp.count3[6, Temp.j] = reader.GetString(6);
                                    Temp.j = Temp.j + 1;
                                }
                            }
                            conn.Close();
                        }
                    }
                }
                catch (SqlException ex)
                {
                }
            }
            return result;
        }
        public static bool Report_Data_Check(string dbname, int Daily_SampleID)
        {
            bool result = false;
            int cc;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select Daily_ReportID from Daily_TestReport where Daily_SampleID=" + Daily_SampleID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    cc = reader.GetInt32(0);
                                result = true;
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
        public static bool Data_Add(string dbname, string WorkPicType, string Data)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =new SqlCommand("INSERT INTO WorkPicType([WP_Type]) Values ('" + Data + "')", conn))
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
        public static bool Data_Add2(string dbname, string UW_Type, string UW_Content)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Daily_UsualWord([UW_Type],[UW_Content]) Values ('" + UW_Type + "','" + UW_Content + "')", conn))
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
        public static string Report_Data_Search(string dbname, int Daily_SampleID, string Search_Item)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Search_Item + " from Daily_TestSampling where Daily_SampleID=" + Daily_SampleID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Search_Item == "SNumber" || Search_Item == "Pnumber")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDecimal(0).ToString();
                                }
                                else if (Search_Item == "MaterailInDate" || Search_Item == "BookReportDate")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDateTime(0).ToString("yyyy/mm/dd");
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
        public static string Report_Data_Search2(string dbname, int Daily_SampleID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select Date from Daily_Main where Daily_SampleID=" + Daily_SampleID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    result = reader.GetDateTime(0).ToString("yyyy/mm/dd");
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
        public static string Report_Data_Search3(string dbname, int Daily_SampleID, string Search_Item)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select " + Search_Item + " from Daily_TestReport where Daily_SampleID=" + Daily_SampleID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Search_Item == "RegularNumber")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDecimal(0).ToString();
                                }
                                else if (Search_Item == "RealReportDate")
                                {
                                    if (!reader.IsDBNull(0))
                                        result = reader.GetDateTime(0).ToString("yyyy-mm-dd");
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
        public static bool DailyTestView_Search2(string dbname)
        {
            bool result = false;
            string RR;
            for (int i = 0; i < 15; i++)
            {
                for (int j = 0; j < 20; j++)
                {
                    Temp.count3[i, j] = " ";
                }
            }
            if (!(Temp.Search_Condition == ""))
            {
                RR = "select Daily_TestSampling.Daily_SampleID, Daily_TestSampling.ItemName, Daily_TestSampling.TestType, Daily_TestSampling.Location, Daily_TestSampling.SNumber, Daily_TestReport.RegularNumber, Daily_TestReport.LabName";
                RR += " from Daily_TestSampling, Daily_TestReport where " + Temp.Search_Condition;
                Temp.j = 1;
                try
                {
                    string connectionString = Utility.DBconnection.connect_string(dbname);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(RR, conn))
                        {
                            using (var reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    if (!reader.IsDBNull(0))
                                        Temp.count3[0, Temp.j] = reader.GetInt32(0).ToString();
                                    if (!reader.IsDBNull(1))
                                        Temp.count3[1, Temp.j] = reader.GetString(1);
                                    if (!reader.IsDBNull(2))
                                        Temp.count3[2, Temp.j] = reader.GetString(2);
                                    if (!reader.IsDBNull(3))
                                        Temp.count3[3, Temp.j] = reader.GetString(3);
                                    if (!reader.IsDBNull(4))
                                        Temp.count3[4, Temp.j] = reader.GetDecimal(4).ToString();
                                    if (!reader.IsDBNull(5))
                                        Temp.count3[5, Temp.j] = reader.GetDecimal(5).ToString();
                                    if (!reader.IsDBNull(6))
                                        Temp.count3[6, Temp.j] = reader.GetString(6);
                                    Temp.j = Temp.j + 1;
                                }
                            }
                            conn.Close();
                        }
                    }
                }
                catch (SqlException ex)
                {
                }
            }
            return result;
        }
        public static string PID_Name_Search(string dbname, int PID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("select CodeName from ProjectM0 where PID=" + PID, conn))
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

        public static string Generate_DailyReport_KeyWord(string dbname)
        {
            string Output_Html = @"<pre class=""brush: js; script"" style=""display:none"">
		                            $(""#ContentPlaceHolder1_TB_Note1, #ContentPlaceHolder1_TB_Note2, #ContentPlaceHolder1_TB_Note3, #ContentPlaceHolder1_TB_Note4, #ContentPlaceHolder1_TB_Note5, #ContentPlaceHolder1_TB_Note6, #ContentPlaceHolder1_TB_Note7, #ContentPlaceHolder1_TB_Note8, #ContentPlaceHolder1_TB_Note9, #ContentPlaceHolder1_TB_Note10"").textcomplete([
                                        {";
            DailyReport_KeyWord_Search(dbname);
            Output_Html += @"words: [";
            for (int i = 1; i < (Temp.i - 1); i++)
            {
                Output_Html += @"'" + Temp.Count_Value[i, 0] + @"', ";
            }
            Output_Html += @"'" + Temp.Count_Value[(Temp.i - 1), 0] + @"'";
            Output_Html += @"],";
            Output_Html += @"match: /([\u4e00-\u9fa5_a-zA-Z0-9]{2,})$/,
				            search: function(term, callback) {
                                callback($.map(this.words, function(word) {
                                    return word.indexOf(term) === 0 ? word : null;
                                }));
                            },
				            index: 1,
				            replace: function(word) {
                                return word + ' ';
                            }
                        }
		            ]);
                </pre> ";
            return Output_Html;
        }

        public static bool DailyReport_KeyWord_Search(string dbname)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    Temp.i = 1;
                    string SQL_Condition = "select UW_Content from Daily_UsualWord";
                    using (SqlCommand cmd = new SqlCommand(SQL_Condition, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                    Temp.Count_Value[Temp.i, 0] = reader.GetString(0);
                                result = true;
                                Temp.i = Temp.i + 1;
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

    public class Temp
    {
        public static int i;
        public static int j;
        public static int cc;
        public static int ccc;
        public static string Choose_ItemName_1;
        public static string Choose_ItemName_2;
        public static string Search_Condition;
        public static string Condition1;
        public static string Condition2;
        public static string Type_File;
        public static string[,] count1 = new string[2,1000];
        public static int[,] count2 = new int[2, 1000];
        public static string[,] count3 = new string[15, 200];
        public static string[,] Count_Value = new string[2000, 2000];
        public static string[,] Temp_Value = new string[2000, 2000];
    }
}