using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DAL
{
    public class ProgressMode
    {

        public static bool Clear_Result_By_ProjectID(string dbname, string ProjectID, string version)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM progress_WIINF WHERE ProjectID='" + ProjectID + "' and Version=" + version, conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                            result = true;
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

        public static int Get_Result_Number_New(string dbname, string ProjectID, int version)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select count(*) from Progress_WIINF where ProjectID=" + ProjectID + " and Version=" + version.ToString(), conn))
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
                //Log exception
                //Display Error message
            }
            return result;
        }

        public static string[] Get_WBS_ItemInformation(string dbname, string ProjectID)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ItemName,EWID,ItemOrder from EBudget_WBS Where PID=" + ProjectID + " and ActivityUseNY=1", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(1))
                                {
                                    result[0] += reader.GetString(2) + " " + reader.GetString(0) + "?";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
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
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    for (int i = 0; i < result.Length; i++)
                    {
                        result[i] = result[i].Substring(0, result[i].Length - 1);
                    }
                }
            }
            return result;
        }

        //public static bool Write_Progress_FirstPart(string dbname, string ProjectID, string[] WBSID, string[] WBSName, string[] WIID, string[] WIName, int[] Duration, string[] Prework, int[] ES, int[] EE, int[] LS, int[] LE, bool[] CP, decimal[] PP, int version)
        public static bool Write_Progress_FirstPart(string dbname, string ProjectID, string[] WBSID, string[] WBSName, string[] WIID, string[] WIName, int[] Duration, string[] Prework, int[] ES, int[] EE, int[] LS, int[] LE, bool[] CP, decimal[] PP, int version, string[] FTime,DateTime[] SD,DateTime[] ED)
        {
            bool result = true;
            int num = WIID.Length;
            string insert_cp = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Progress_WIINF WHERE ProjectID='" + ProjectID + "' and Version=" + version.ToString(), conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    for (int i = 0; i < num; i++)
                    {
                        if (CP[i])
                        {
                            insert_cp = "1";
                        }
                        else
                        {
                            insert_cp = "0";
                        }
                        using (SqlCommand cmd =
                            new SqlCommand("INSERT INTO Progress_WIINF([WBSID],[WBSName],[WIID],[WIName],[Duration],[PreworkID],[ES],[EE],[LS],[LE],[CP],[ProjectID],[Amount],[Version],[FTime],[StartDate],[EndDate],[Lock]) VALUES ('" +
                                WBSID[i] + "','" + WBSName[i] + "','" + WIID[i] + "','" + WIName[i] + "'," + Duration[i].ToString() + ",'" + Prework[i] + "'," + ES[i].ToString() + "," + EE[i].ToString() +
                                "," + LS[i].ToString() + "," + LE[i].ToString() + "," + insert_cp + "," + ProjectID + "," + PP[i].ToString() + "," + version.ToString() + ",'" + FTime[i] + "','" + SD[i].ToShortDateString() + "','" + ED[i].ToShortDateString() + "',0)", conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows == 0)
                            {
                                result = false;
                                return result;
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

        //public static bool Get_Progress_Data(string dbname, string ProjectID, out string[] output, int version)
        public static bool Get_Progress_Data(string dbname, string ProjectID, out string[] output, int version)
        {
            bool result = false;
            //output = new string[12];
            output = new string[13];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [WBSID],[WBSName],[WIID],[WIName],[Duration],[PreWorkID],[ES],[EE],[LS],[LE],[CP],[Amount],[FTime] from Progress_WIINF WHERE ProjectID = " + ProjectID + " and Version=" + version.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetInt32(0).ToString() + ",";
                                output[1] += reader.GetString(1) + ",";
                                output[2] += reader.GetInt32(2).ToString() + ",";
                                output[3] += reader.GetString(3) + ",";
                                output[4] += reader.GetInt32(4).ToString() + ",";
                                output[5] += reader.GetString(5) + ";";
                                output[6] += reader.GetInt32(6).ToString() + ",";
                                output[7] += reader.GetInt32(7).ToString() + ",";
                                output[8] += reader.GetInt32(8).ToString() + ",";
                                output[9] += reader.GetInt32(9).ToString() + ",";
                                output[10] += reader.GetBoolean(10).ToString() + ",";
                                output[11] += reader.GetDecimal(11).ToString() + ",";
                                output[12] += reader.GetString(12) + ";";
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
            if (output[0] != null)
            {
                if (output[0].Length > 0)
                {
                    result = true;
                    for (int i = 0; i < output.Length; i++)
                    {
                        output[i] = output[i].Substring(0, output[i].Length - 1);
                    }
                }
            }

            return result;
        }

        public static bool Get_Progress_AllData(string dbname, string ProjectID, out string[] output, int version)
        {
            bool result = false;
            output = new string[10];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [WIID],[WIName],[Duration],[ES],[EE],[LS],[LE],[CP],[StartDate],[EndDate] from Progress_WIINF WHERE ProjectID = " + ProjectID + " and Version=" + version.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetInt32(0).ToString() + ",";
                                output[1] += reader.GetString(1) + ",";
                                if (reader.IsDBNull(2))
                                {

                                    output[2] += ",";
                                }
                                else
                                {
                                    output[2] += reader.GetInt32(2).ToString() + ",";

                                }
                                if (reader.IsDBNull(3))
                                {

                                    output[3] += ",";
                                }
                                else
                                {
                                    output[3] += reader.GetInt32(3).ToString() + ",";

                                }
                                if (reader.IsDBNull(4))
                                {

                                    output[4] += ",";
                                }
                                else
                                {
                                    output[4] += reader.GetInt32(4).ToString() + ",";

                                }
                                if (reader.IsDBNull(5))
                                {

                                    output[5] += ",";
                                }
                                else
                                {
                                    output[5] += reader.GetInt32(5).ToString() + ",";

                                }
                                if (reader.IsDBNull(6))
                                {

                                    output[6] += ",";
                                }
                                else
                                {
                                    output[6] += reader.GetInt32(6).ToString() + ",";

                                }
                                if (reader.IsDBNull(7))
                                {

                                    output[7] += ",";
                                }
                                else
                                {
                                    output[7] += reader.GetBoolean(7).ToString() + ",";

                                }
                                //output[4] += reader.GetInt32(4).ToString() + ",";
                                //output[5] += reader.GetInt32(5).ToString() + ",";
                                //output[6] += reader.GetInt32(6).ToString() + ",";
                                //output[7] += reader.GetBoolean(7).ToString() + ",";
                                if (reader.IsDBNull(8))
                                {
                                    output[8] += ",";
                                }
                                else
                                {
                                    output[8] += reader.GetDateTime(8).ToString("yyyy/MM/dd") + ",";
                                }
                                if (reader.IsDBNull(9))
                                {
                                    output[9] += ",";
                                }
                                else
                                {
                                    output[9] += reader.GetDateTime(9).ToString("yyyy/MM/dd") + ",";
                                }
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
            if (output[0] != null)
            {
                if (output[0].Length > 0)
                {
                    result = true;
                    for (int i = 0; i < output.Length; i++)
                    {
                        output[i] = output[i].Substring(0, output[i].Length - 1);
                    }
                }
            }

            return result;
        }

        public static bool Update_Progress_Date(string dbname, string ProjectID, int[] WIID, string[] StartDate, string[] EndDate, int version)
        {
            bool result = true;
            int num = WIID.Length;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    for (int i = 0; i < num; i++)
                    {
                        using (SqlCommand cmd =
                            new SqlCommand("Update Progress_WIINF SET StartDate='" + StartDate[i] + "',EndDate='" + EndDate[i] + "' Where ProjectID=" + ProjectID + " and WIID=" + WIID[i].ToString() + " and Version=" + version.ToString(), conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows == 0)
                            {
                                result = false;
                                return result;
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

        public static int Get_MaxProgressVersion(string dbname, string ProjectID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select MAX(Version) from Progress_WIINF where ProjectID=" + ProjectID, conn))
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
                //Log exception
                //Display Error message
            }
            return result;
        }

        //public static decimal Get_Price_By_PriceID(string dbname, int PriceID)
        //{
        //    decimal result = 0.000M;
        //    int ComplexCheck = 0;
        //    try
        //    {
        //        string connectionString = Utility.DBconnection.connect_string(dbname);
        //        using (SqlConnection conn =
        //            new SqlConnection(connectionString))
        //        {
        //            conn.Open();

        //            using (SqlCommand cmd = new SqlCommand("select Complex,CPrice,CAmount from Pro_Resource where PriceID=" + PriceID, conn))
        //            {
        //                using (var reader = cmd.ExecuteReader())
        //                {
        //                    while (reader.Read())
        //                    {
        //                        if (!reader.IsDBNull(0))
        //                        {
        //                            ComplexCheck = reader.GetInt32(0);
        //                            if (ComplexCheck != 1)
        //                            {
        //                                decimal temp1 = 0.000M;
        //                                decimal temp2 = 0.000M;
        //                                if (reader.IsDBNull(1))
        //                                {
        //                                    temp1 = 0.000M;
        //                                }
        //                                else
        //                                {
        //                                    temp1 = reader.GetDecimal(1);
        //                                }
        //                                if (reader.IsDBNull(2))
        //                                {
        //                                    temp2 = 0.000M;
        //                                }
        //                                else
        //                                {
        //                                    temp2 = reader.GetDecimal(2);
        //                                }
        //                                result = temp1 * temp2;
        //                            }
        //                            else
        //                            {
        //                                using (SqlCommand cmd2 = new SqlCommand("select KidID from Pro_Analysis where PriceID=" + PriceID, conn))
        //                                {
        //                                    using (var reader2 = cmd2.ExecuteReader())
        //                                    {
        //                                        while (reader2.Read())
        //                                        {
        //                                            if (!reader2.IsDBNull(0))
        //                                            {
        //                                                result += Get_Price_By_PriceID(dbname, reader2.GetInt32(0));
        //                                            }
        //                                        }
        //                                    }
        //                                }
        //                                decimal temp2 = 0.000M;
        //                                if (reader.IsDBNull(2))
        //                                {
        //                                    temp2 = 0.000M;
        //                                }
        //                                else
        //                                {
        //                                    temp2 = reader.GetDecimal(2);
        //                                }
        //                                result = result * temp2;
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //            conn.Close();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        //Log exception
        //        //Display Error message
        //    }

        //    return result;
        //}

        public static decimal Get_Price_By_WBSID(string dbname, int ProjectID, int WBSID)
        {
            decimal result = 0.000M;
            int PriceID = 0;
            decimal ENum = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select PriceID, LastENumber from EBudget_WBS where EWID='" + WBSID.ToString() + "' and PID='" + ProjectID.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    PriceID = reader.GetInt32(0);
                                }
                                else
                                {
                                    PriceID = 0;
                                }
                                if (!reader.IsDBNull(1))
                                {
                                    ENum = reader.GetDecimal(1);
                                }
                                else
                                {
                                    ENum = 0.000M;
                                }
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

            result = Cal_Price_By_PriceID_Num(dbname, PriceID, ENum);

            return result;
        }

        public static decimal Cal_Price_By_PriceID_Num(string dbname, int PriceID, decimal Amount)
        {
            decimal result = 0.000M;
            bool complex = false;
            decimal AnaNum = 1.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select Complex, EPrice, AnaNumber from Pro_Resource where PriceID='" + PriceID.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    complex = false;
                                }
                                else
                                {
                                    if (reader.GetInt32(0) == 1)
                                    {
                                        complex = true;
                                    }
                                    else
                                    {
                                        complex = false;
                                    }
                                }
                                if (!complex)
                                {
                                    // simple
                                    if (reader.IsDBNull(1))
                                    {
                                        result = 0.000M;
                                    }
                                    else
                                    {
                                        result = reader.GetDecimal(1) * Amount;
                                    }
                                }
                                else
                                {
                                    decimal Multi_Price = 0.000M;
                                    if (reader.IsDBNull(2))
                                    {
                                        AnaNum = 1.000M;
                                    }
                                    else
                                    {
                                        AnaNum = reader.GetDecimal(2);
                                    }

                                    // complex
                                    Multi_Price = Calc_Relation_Price(dbname, PriceID);
                                    result = Multi_Price / AnaNum * Amount;
                                }
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

        public static decimal Calc_Relation_Price(string dbname, int PriceID)
        {
            decimal result = 0.000M;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd2 = new SqlCommand("Select KidID, WorkRate from Pro_Analysis where ParentID ='" + PriceID.ToString() + "'", conn))
                    {
                        using (var reader2 = cmd2.ExecuteReader())
                        {
                            while (reader2.Read())
                            {
                                decimal temp_num = 0.000M;
                                if (reader2.IsDBNull(1))
                                {
                                    temp_num = 0.000M;
                                }
                                else
                                {
                                    temp_num = reader2.GetDecimal(1);
                                }
                                result += Cal_Price_By_PriceID_Num(dbname, reader2.GetInt32(0), temp_num);
                            }
                        }
                    }

                }
            }
            catch (SqlException ex)
            {
                //Log exception
                //Display Error message
            }

            return result;
        }

        // New
        // 
        // Old
        public static int Get_Result_Number(string dbname, string ProjectID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select count(*) from ProgressResult where ProjectCode=" + ProjectID, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(1))
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
                //Log exception
                //Display Error message
            }
            return result;
        }
        public static string[] Get_All_Layer_Item(string dbname, string tablename)
        {
            string[] result = new string[4];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select LayerCode,ItemOrder,Item,UID from " + tablename, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(1))
                                {
                                    result[0] += reader.GetString(0) + ",";
                                    result[1] += reader.GetString(1) + ",";
                                    result[2] += reader.GetString(2) + ",";
                                    result[3] += reader.GetInt32(3).ToString() + ",";
                                }
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
            if (result[0].Length > 0)
            {
                for (int i = 0; i < result.Length; i++)
                {
                    result[i] = result[i].Substring(0, result[i].Length - 1);
                }
            }

            return result;
        }


        public static string LayerItem_Resort(string LayerCode, string ItemOrder, string Item)
        {
            string result = "";
            string[] allLayerCode = LayerCode.Split(',');
            string[] allItemOrder = ItemOrder.Split(',');
            string[] allItem = Item.Split(',');
            string[] NewItemOrder = new string[allItemOrder.Length];
            for (int i = 0; i < allLayerCode.Length; i++)
            {
                if (allLayerCode[i].Length <= 2)
                {
                    NewItemOrder[i] = allItemOrder[i];
                }
                else if (allLayerCode[i].Length <= 4)
                {
                    string temp = allLayerCode[i].Substring(0, 2);
                    string temp2 = "";
                    for (int j = 0; j < i; j++)
                    {
                        if (allLayerCode[j].Equals(temp))
                        {
                            temp2 = NewItemOrder[j];
                        }
                    }
                    NewItemOrder[i] = temp2 + "." + allItemOrder[i];
                }
                else
                {
                    string temp = allLayerCode[i].Substring(0, 4);
                    string temp2 = "";
                    for (int j = 0; j < i; j++)
                    {
                        if (allLayerCode[j].Equals(temp))
                        {
                            temp2 = NewItemOrder[j];
                        }
                    }
                    NewItemOrder[i] = temp2 + "." + allItemOrder[i];
                }
                result += NewItemOrder[i] + " " + allItem[i] + ",";
            }

            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static bool Write_Progress_Result(string dbname, string ProjectCode, string[] LayerCode, string[] ItemOrder, string[] Item, int[] Duration, string[] Prework_LayerCode, int[] ES, int[] EE, int[] LS, int[] LE, bool[] CP, string[] IID)
        {
            bool result = true;
            int num = LayerCode.Length;
            string insert_cp = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM ProgressResult WHERE ProjectCode='" + ProjectCode + "'", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                    }
                    for (int i = 0; i < num; i++)
                    {
                        if (CP[i])
                        {
                            insert_cp = "1";
                        }
                        else
                        {
                            insert_cp = "0";
                        }
                        using (SqlCommand cmd =
                            new SqlCommand("INSERT INTO ProgressResult([LayerCode],[LayerOrder],[ActivitiesName],[Duration],[PreworkCode],[ES],[EE],[LS],[LE],[CP],[ProjectCode],[LayerID]) VALUES ('" +
                                LayerCode[i] + "','" + ItemOrder[i] + "','" + Item[i] + "'," + Duration[i].ToString() + ",'" + Prework_LayerCode[i] + "'," + ES[i].ToString() + "," + EE[i].ToString() +
                                "," + LS[i].ToString() + "," + LE[i].ToString() + "," + insert_cp + "," + ProjectCode + "," + IID[i] + ")", conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows == 0)
                            {
                                result = false;
                                return result;
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

        public static bool Get_Progress_Result(string dbname, string ProjectCode, out string[] output)
        {
            bool result = false;
            output = new string[10];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [LayerCode],[LayerOrder],[ActivitiesName],[Duration],[PreworkCode],[ES],[EE],[LS],[LE],[CP] from ProgressResult WHERE ProjectCode = " + ProjectCode, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetString(0) + ",";
                                output[1] += reader.GetString(1) + ",";
                                output[2] += reader.GetString(2) + ",";
                                output[3] += reader.GetInt32(3).ToString() + ",";
                                output[4] += reader.GetString(4) + ";";
                                output[5] += reader.GetInt32(5).ToString() + ",";
                                output[6] += reader.GetInt32(6).ToString() + ",";
                                output[7] += reader.GetInt32(7).ToString() + ",";
                                output[8] += reader.GetInt32(8).ToString() + ",";
                                output[9] += reader.GetBoolean(9).ToString() + ",";
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
            if (output[0].Length > 0)
            {
                result = true;
                for (int i = 0; i < output.Length; i++)
                {
                    output[i] = output[i].Substring(0, output[i].Length - 1);
                }
            }

            return result;
        }

        public static bool Get_progress_For_Table(string dbname, string ProjectID, out string[] output, int ver)
        {
            bool result = false;
            output = new string[9];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [WIID],[WIName],[Duration],[ES],[EE],[LS],[LE],[WBSID],[Amount] from Progress_WIINF WHERE ProjectID = " + ProjectID + " and Version=" + ver.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetInt32(0).ToString() + ",";
                                output[1] += reader.GetString(1) + "?";
                                output[2] += reader.GetInt32(2).ToString() + ",";
                                output[3] += reader.GetInt32(3).ToString() + ",";
                                output[4] += reader.GetInt32(4).ToString() + ",";
                                output[5] += reader.GetInt32(5).ToString() + ",";
                                output[6] += reader.GetInt32(6).ToString() + ",";
                                output[7] += reader.GetInt32(7).ToString() + ",";
                                output[8] += reader.GetDecimal(8).ToString() + ",";
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
            if (output[0] != null)
            {
                if (output[0].Length > 0)
                {
                    result = true;
                    for (int i = 0; i < output.Length; i++)
                    {
                        output[i] = output[i].Substring(0, output[i].Length - 1);
                    }
                }
            }
            else
            {
                for (int i = 0; i < output.Length; i++)
                {
                    output[i] = "";
                }
            }

            return result;
        }

        public static bool Get_Progress_For_Gantt(string dbname, string ProjectID, out string[] output, int ver)
        {
            bool result = false;
            output = new string[7];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [WIID],[WIName],[Duration],[StartDate],[EndDate],[PreWorkID],[ProgressID] from Progress_WIINF WHERE ProjectID = " + ProjectID + " and Version=" + ver.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetInt32(0).ToString() + ",";
                                output[1] += reader.GetString(1) + ",";
                                output[2] += reader.GetInt32(2).ToString() + ",";
                                if (reader.IsDBNull(3))
                                {
                                    output[3] += ",";
                                }
                                else
                                {
                                    output[3] += reader.GetDateTime(3).ToString("yyyy/MM/dd") + ",";
                                }
                                if (reader.IsDBNull(4))
                                {
                                    output[4] += ",";
                                }
                                else
                                {
                                    output[4] += reader.GetDateTime(4).ToString("yyyy/MM/dd") + ",";
                                }
                                if (reader.IsDBNull(5))
                                {
                                    output[5] += ";";
                                }
                                else
                                {
                                    output[5] += reader.GetString(5) + ";";
                                }
                                output[6] += reader.GetInt32(6) + ",";
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
            if (output[0] != null)
            {
                if (output[0].Length > 0)
                {
                    result = true;
                    for (int i = 0; i < output.Length; i++)
                    {
                        output[i] = output[i].Substring(0, output[i].Length - 1);
                    }
                }
            }
            else
            {
                for (int i = 0; i < output.Length; i++)
                {
                    output[i] = "";
                }
            }
            return result;
        }
        public static bool Get_Progress_For_Gantt_Check(string dbname, string ProjectID, out string[] output, int ver)
        {
            bool result = false;
            output = new string[7];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select [WIID],[WIName],[Duration],[StartDate],[EndDate],[PreWorkID],[ProgressID] from Progress_WIINF WHERE ProjectID = " + ProjectID + " and Version=" + ver.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                output[0] += reader.GetInt32(0).ToString() + ",";
                                output[1] += reader.GetString(1) + ",";
                                output[2] += reader.GetInt32(2).ToString() + ",";
                                if (reader.IsDBNull(3))
                                {
                                    output[3] += ",";
                                    result = false;
                                    break;
                                }
                                else
                                {
                                    output[3] += reader.GetDateTime(3).ToString("yyyy/MM/dd") + ",";
                                }
                                if (reader.IsDBNull(4))
                                {
                                    output[4] += ",";
                                    result = false;
                                    break;

                                }
                                else
                                {
                                    output[4] += reader.GetDateTime(4).ToString("yyyy/MM/dd") + ",";
                                }
                                if (reader.IsDBNull(5))
                                {
                                    output[5] += ";";
                                }
                                else
                                {
                                    output[5] += reader.GetString(5) + ";";
                                }
                                output[6] += reader.GetInt32(6) + ",";
                                result = true;
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

                    using (SqlCommand cmd = new SqlCommand("select WIName from Progress_WIINF where ProgressID=" + ProgressID.ToString(), conn))
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
                //Log exception
                //Display Error message
            }
            return result;
        }

        public static DateTime[] Get_ProgressRealDate_By_ProgID_Version(string dbname, int ProjectID, int Version)
        {
            DateTime[] result = new DateTime[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select max(workdate),min(workdate) from Progress_Real where ProjectID=" + ProjectID.ToString() + " and Version=" + Version.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                
                                result[0] = reader.GetDateTime(0);
                                result[1] = reader.GetDateTime(1);
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

        public static DateTime[] Get_ProgressWIINF_By_ProgID_Version(string dbname, int ProjectID, int Version)
        {
            DateTime[] result = new DateTime[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select max(EndDate),min(StartDate) from Progress_WIINF where ProjectID=" + ProjectID.ToString() + " and Version=" + Version.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    result[0] = DateTime.Now;
                                }
                                else
                                {
                                    result[0] = reader.GetDateTime(0);
                                }
                                if (reader.IsDBNull(1))
                                {
                                    result[1] = DateTime.Now;
                                }
                                else
                                {
                                    result[1] = reader.GetDateTime(1);
                                }
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

        public static string[] Get_Progress_Real_Information(string dbname, int ProjectID, int Version)
        {
            string[] result = new string[3];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select ProgressID,WorkDate,CompleteAmount from Progress_Real where ProjectID=" + ProjectID.ToString() + " and Version=" + Version.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result[0] += reader.GetInt32(0).ToString() + ",";
                                result[1] += reader.GetDateTime(1).ToShortDateString() + ",";
                                result[2] += reader.GetInt32(2).ToString() + ",";
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
            if (result[0].Length > 0)
            {
                for (int i = 0; i < 3; i++)
                {
                    result[i] = result[i].Substring(0, result[i].Length - 1);
                }
            }
            return result;
        }

        public static int Get_WBSID_By_ProgID(string dbname, int ProgID)
        {
            int result = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select WBSID from Progress_WIINF where ProgressID='" + ProgID.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
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

        public static bool Lock_ProgressData(string dbname, string ProjectID, int Version)
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
                        new SqlCommand("Update Progress_WIINF SET Lock=1 WHERE ProjectID='" + ProjectID + "' and Version='" + Version.ToString() + "'", conn))
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

        public static bool Check_Lock_By_ProjectID_Version(string dbname, int ProjectID, int Version)
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
                        new SqlCommand("select distinct Lock from Progress_WIINF where ProjectID='" + ProjectID.ToString() + "' and Version='" + Version.ToString() + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.GetBoolean(0))
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
                //Log exception
                //Display Error message
            }

            return result;
        }

        public static bool InsertNewActualProgress(string dbname, int ProjectID, int Version, int ProgressID, string Workdate, int Amount)
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
                        new SqlCommand("INSERT INTO Progress_Real([ProgressID],[WorkDate],[CompleteAmount],[Version],[ProjectID]) VALUES ('" + ProgressID.ToString() + "','" + Workdate + "','" + Amount.ToString() + "','" + Version.ToString() + "','" + ProjectID.ToString() + "')", conn))
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

        public static bool InsertNewActualProgress_By_ProjectID(string dbname, int ProjectID)
        {
            bool result = false;
            string daily_IDs = "";
            string daily_date = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Select DailyID,Date from Daily_Main Where PID='" + ProjectID.ToString() + "'", conn))
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (!reader.IsDBNull(0))
                            {
                                daily_IDs += reader.GetInt32(0) + ",";
                                daily_date += reader.GetDateTime(1).ToShortDateString() + ",";
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
            if (daily_IDs.Length > 0)
            {
                daily_IDs = daily_IDs.Substring(0, daily_IDs.Length - 1);
                daily_date = daily_date.Substring(0, daily_date.Length - 1);
            }
            string[] DIDs = daily_IDs.Split(',');
            string[] DDate = daily_date.Split(',');
            //Clear_Progress_Real_By_ProjectID(dbname, ProjectID);
            for (int i = 0; i < DIDs.Length; i++)
            {
                int[] ProgID;
                decimal[] Amount;
                Get_ProgressID_By_DailyID(dbname, DIDs[i], out ProgID, out Amount);
                for(int j =0;j<ProgID.Length;j++)
                {
                    result = InsertNewActualProgress(dbname, ProjectID, 1, ProgID[j], DDate[i], Convert.ToInt32(Math.Round(Convert.ToDouble(Amount[j]))));
                }
            }
            return result;
        }

        public static bool Clear_Progress_Real_By_ProjectID(string dbname, int ProjectID)
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
                        new SqlCommand("Delete From Progress_Real WHERE ProjectID='" + ProjectID + "'", conn))
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

        public static bool Get_ProgressID_By_DailyID(string dbname, string DailyID, out int[] ProgID, out decimal[] Amount)
        {
            bool result=false;
            string temp1 = "";
            string temp2 = "";
            string temp3 = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Select WIID,Version,DailyNumber from Daily_Activity Where DailyID='" + DailyID + "'", conn))
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (!reader.IsDBNull(0))
                            {
                                temp1 += reader.GetInt32(0) + ",";
                                temp2 += reader.GetInt32(1) + ",";
                                temp3 += reader.GetDecimal(2) + ",";
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
            if (temp1.Length > 0)
            {
                temp1 = temp1.Substring(0, temp1.Length - 1);
                temp2 = temp2.Substring(0, temp2.Length - 1);
                temp3 = temp3.Substring(0, temp3.Length - 1);
            }

            string[] WI1 = temp1.Split(',');
            string[] WIV = temp2.Split(',');
            string[] Am3 = temp3.Split(',');
            ProgID = new int[WI1.Length];
            Amount = new decimal[WI1.Length];
            for (int i = 0; i < Amount.Length; i++)
            {
                Amount[i] = decimal.Parse(Am3[i]);
            }
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    for (int i = 0; i < WI1.Length; i++)
                    {
                        using (SqlCommand cmd =
                            new SqlCommand("Select ProgressID, LastENumber from Progress_WIINF join EBudget_WBS on Progress_WIINF.WBSID=EBudget_WBS.EWID Where WIID='" + WI1[i] + "' and Version='" + WIV[i] + "'", conn))
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    ProgID[i] = reader.GetInt32(0);
                                    if (reader.GetDecimal(1) == 0.000M)
                                    {
                                        Amount[i] = 0.000M;
                                    }
                                    else
                                    {
                                        Amount[i] = Amount[i] / reader.GetDecimal(1) * 100;
                                    }
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
                //Log exception
                //Display Error message
            }


            return result;
        }


    }
}
