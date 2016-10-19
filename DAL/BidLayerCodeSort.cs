using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace DAL
{
  public  class BidLayerCodeSort
    {
        public static bool Update_order_num(string dbname, string BID)
        {
            bool result = false;
            int[] input = Sort_LayerCode(dbname, BID);
            int count = 0;
            string update_string = "Update Bid_WBS SET order_Num = ";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    for (int i = 0; i < input.Length; i++)
                    {
                        count++;
                        update_string = "Update Bid_WBS SET order_Num ='" + count.ToString() + "' WHERE UID='" + input[i].ToString() + "'";
                        using (SqlCommand cmd =
                            new SqlCommand(update_string, conn))
                        {
                            int rows = cmd.ExecuteNonQuery();
                            if (rows > 0) result = true;
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

        public static int[] Sort_LayerCode(string dbname, string BID)
        {

            string[] input = Get_Information(dbname, BID);
            int[] result = new int[1];
            if (input[1] != null)
            {
                string[] temp_WID = input[0].Split(',');
                string[] temp_UpperWID = input[1].Split(',');
                string[] temp_SortNum = input[2].Split(',');
                int[] WID = new int[temp_WID.Length];
                int[] UpperWID = new int[temp_UpperWID.Length];
                int[] SortNum = new int[temp_SortNum.Length];
                for (int i = 0; i < WID.Length; i++)
                {
                    int.TryParse(temp_WID[i], out WID[i]);
                    int.TryParse(temp_UpperWID[i], out UpperWID[i]);
                    int.TryParse(temp_SortNum[i], out SortNum[i]);
                }
                result = new int[WID.Length];
                List<int> code_result = new List<int>();
                for (int i = 0; i < WID.Length; i++)
                {
                    if (UpperWID[i] == 0)
                    {
                        code_result.Add(WID[i]);
                    }
                }
                int count = 0;
                int nowWID = 0;
                int insert_count = 0;
                while (count < code_result.Count)
                {
                    nowWID = code_result[count];
                    insert_count = count + 1;
                    for (int i = 0; i < WID.Length; i++)
                    {
                        if (UpperWID[i] == nowWID)
                        {
                            code_result.Insert(insert_count, WID[i]);
                            insert_count++;
                        }
                    }
                    count++;
                }
                result = code_result.ToArray();

            }
            return result;
        }

        public static string[] Get_Information(string dbname, string BID)
        {
            string[] result = new string[3];
            string select_string = "select UID, UpperUID, SortNum from Bid_WBS where BID='" + BID + "' order by SortNum";
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
                                result[0] += reader.GetInt32(0).ToString() + ",";
                                if (reader.IsDBNull(1))
                                {
                                    result[1] += "0,";
                                }
                                else
                                {
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                }
                                result[2] += reader.GetInt32(2).ToString() + ",";
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
        public static string Get_Order(string dbname, string BID, string UID, string UpperUID, string order_Num, string SortNum)
        {
            string result = "";

            //string SelectUID = "Select uid from Bid_WBS where UpperUID=" + UpperUID + " and BID=" + BID;
            //string UID = WebModel.SItemName(dbname, SelectUID, "UID");
            //string SelectOrder_Num="Select order_Num from Bid_WBS where UID="+UID;         
            //string  order_Num = WebModel.SItemName(dbname, SelectOrder_Num, "order_Num");
            //string SQLUpperUID = "Select UpperUID from Bid_WBS where UID=" + UID;
            //string UpperUID = WebModel.SItemName(dbname, SQLUpperUID, "UpperUID");
            string SQLSearchUID = "Select UID from Bid_WBS where UID=" + UpperUID;
            string SearchUID = WebModel.SItemName(dbname, SQLSearchUID, "UID");
            if (SearchUID == "")
            {
                result = SortNum;

            }
            else
            {
                string SQLSrarchorder_Num = "Select order_Num from Bid_WBS where UID=" + SearchUID;
                string Srarchorder_Num = WebModel.SItemName(dbname, SQLSrarchorder_Num, "order_Num");
                result = Srarchorder_Num;
            }
            return result;
        }
    }
}
