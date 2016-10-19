using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace DAL
{
   public class CBLayerCodeSort
    {
        public static bool Update_order_num(string dbname, string PID)
        {
            bool result = false;
            int[] input = Sort_LayerCode(dbname, PID);
            int count = 0;
            string update_string = "Update CBudget_WBS SET order_Num = ";
            try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    for (int i = 0; i < input.Length; i++)
                    {
                        count++;
                        update_string = "Update CBudget_WBS SET order_Num ='" + count.ToString() + "' WHERE CWID='" + input[i].ToString() + "'";
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

        public static int[] Sort_LayerCode(string dbname, string PID)
        {
          
            string[] input = Get_Information(dbname, PID);
            int[] result= new int[1];
            if (input[1] !=null)
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

        public static string[] Get_Information(string dbname, string PID)
        {
            string[] result = new string[3];
            string select_string = "select CWID, UpperWID, SortNum from CBudget_WBS where PID='" + PID + "' order by SortNum";
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
                                if (reader.IsDBNull(2))
                                {
                                    result[2] += "0,";
                                }
                                else
                                {
                                    result[2] += reader.GetInt32(2).ToString() + ",";
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

        public static bool Update_SortNum(DataTable DBTableContent)
        {
            bool result=false;
            string SQLString_1 = "";
            string[] result1 = new string[2];
            for (int i = 0; i < DBTableContent.Rows.Count; i++)
            {
                result1[0] += DBTableContent.Rows[i]["LayerNum"] + ",";
                result1[1] += DBTableContent.Rows[i]["SortNum"] + ",";

            }
            if (result1[0] != null)
            {
                if (result1[0].Length > 0)
                {
                    for (int i = 0; i < result1.Length; i++)
                    {
                        result1[i] = result1[i].Substring(0, result1[i].Length - 1);
                    }
                }
            }
            return result;
        }
        public static bool Update_SortNum1(string dbname, string PID)
        {
            bool result1 = false;
            string[] input = Get_SortInformation(dbname, PID);
            int[] result= new int[1];
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
                int[] result2 = new int[WID.Length];
                //List<int> code_result = new List<int>();
                //List<int> sort_result = new List<int>();
              
                int count = 0;
                int nowWID = 0;
             
                int sort = 1;
                while (count < UpperWID.Count())
                {
                    //nowWID = code_result[count];
                    nowWID = UpperWID[count];
                    
                    for (int i = 0; i < WID.Length; i++)
                    {
                        
                        if (UpperWID[i] == nowWID)
                        {
                                              
                            //code_result.Insert(insert_count, WID[i]);
                            result2[i]=sort;
                            //insert_count++;
                            sort++;
                        }
                    }
                    count++;
                    sort = 1;
                }
                for (int i = 0; i < WID.Length; i++)
                {
                    int wid = WID[i];
                    int sortnum = result2[i];
                    string updatesort = "Update CBudget_WBS set SortNum=" + sortnum + " where CWID=" + wid;
                    result1 = WebModel.SQLAction(dbname, updatesort);

                }
             
                //result = code_result.ToArray();
            }          
            
            
            return result1;
        }
        static string[] Get_SortInformation(string dbname, string PID)
        {
            
           
            string[] result = new string[3];
            string select_string = "select CWID, UpperWID, SortNum from CBudget_WBS where PID='" + PID + "' order by CWID";
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
                                if (reader.IsDBNull(2))
                                {
                                    result[2] += "0,";
                                }
                                else
                                {
                                    result[2] += reader.GetInt32(2).ToString() + ",";
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
        public static string Get_Order(string dbname, string PID, string UID, string UpperUID, string order_Num, string SortNum)
        {
            string result = "";
            string SQLSearchUID = "";
            string SearchUID = "";
           
            SQLSearchUID = "Select CWID from CBudget_WBS where CWID=" + UpperUID;
            SearchUID = WebModel.SItemName(dbname, SQLSearchUID, "CWID");
           
            if (SearchUID == "")
            {
                result = SortNum;

            }
            else
            {
                string SQLSrarchorder_Num = "Select order_Num from CBudget_WBS where CWID=" + SearchUID;
                string Srarchorder_Num = WebModel.SItemName(dbname, SQLSrarchorder_Num, "order_Num");
                result = Srarchorder_Num;
            }
            return result;
        }
    }
}
