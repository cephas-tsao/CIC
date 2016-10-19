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
    public class CBudgetDisp
    {
        
        public static DataTable LoadContentData_CB(string database, string Pid, string Edition)
        {
            DataTable DataTableBox = null;
            //DataTable addvalue = Add_edition(database, Pid, Edition);
            DataTable dtResult = new DataTable();
            string SQLSelect = "";
            string newEdiditon = Edition.Substring(0, Edition.Length - 1);
            //foreach (string DataName in newEdiditon.Split(','))
            //{
            //    SQLSelect += "ChNumber" + DataName + ",Response" + DataName + ",Reason" + DataName + ",";
            //}
            try
            {
                DataTableBox = new DataTable();

                //string SQLString = "select a.*,b.*," + SQLSelect + "c.PID from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID left join CBudget_Change_Detail c on a.cwid=c.cwid where a.Pid=" + Pid + " order by a.order_Num";
                string SQLString = "select a.*,b.*,c.* from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID left join CBudget_Change_Detail c on a.cwid=c.cwid where a.Pid=" + Pid + " order by a.order_Num";
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        //SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                     
                       // Set Key
                        //DataColumn[] keys = new DataColumn[] { DataTableBox.Columns[0] };
                        //DataTableBox.PrimaryKey = keys;
                        //DataTableBox.PrimaryKey = new DataColumn[] { DataTableBox.Columns[0] };

                        DataTableBox.PrimaryKey = new DataColumn[] { DataTableBox.Columns["CWID"] }; 

                        //DataTableBox.Columns.Add("CEdition1", typeof(String));
                        //DataTableBox.Columns.Add("ChNumber" + Edition + "", typeof(String));
                        //DataTableBox.Columns.Add("Response" + Edition + "", typeof(String));
                        //DataTableBox.Columns.Add("Reason" + Edition + "", typeof(String));
                        
                   
                    }
                    //foreach (DataRow row in DataTableBox.Rows)
                    //{
                    //    DataRow rowsToUpdate = addvalue.AsEnumerable().FirstOrDefault(r => r.Field<string>("table_name") == row.Field<string>("table_name"));
                    //    row.SetField("table_name", rowsToUpdate.Field<string>("table_name_new"));
                    //}   
                   
                    //for (int j = 0; j < DataTableBox.Rows.Count; j++)
                    //{

                        //DataTableBox.Rows[j].SetField(columnName, value);
                    //DataRow dr = DataTableBox.AsEnumerable()
                    //       .SingleOrDefault(r => r.Field<int>("CWID") == 5);

                    //DataRow drFind = DataTableBox.Rows.Find(shiftRow.Field<string>("ast_num"));
                    //if (drFind == null)
                    //{
                    //    DataTableBox.ImportRow(shiftRow); // 資料不存在，才加入(移動資料)。 
                    //} 

                    //for (int i = 0; i < addvalue.Rows.Count; i++)
                    //{
                    //    DataRow vsDr = addvalue.Rows[i];
                    //    string ChNumber = vsDr["ChNumber" + Edition + ""].ToString() != "" ? vsDr["ChNumber" + Edition + ""].ToString() : "0";
                    //    string Response = vsDr["Response" + Edition + ""].ToString();
                    //    string Reason = vsDr["Reason" + Edition + ""].ToString();

                    //    for (int j = 0; j < DataTableBox.Rows.Count; j++)
                    //    {
                    //        if (addvalue.Rows[i]["CWID"].ToString() == DataTableBox.Rows[j]["CWID"].ToString())
                    //        {
                    //            DataTableBox.Rows[j]["ChNumber" + Edition + ""] = ChNumber;
                    //            DataTableBox.Rows[j]["Response" + Edition + ""] = Response;
                    //            DataTableBox.Rows[j]["Reason" + Edition + ""] = Reason;
                    //            break;
                    //        }
                    //    }
                    //}
                    //}
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
        public static DataTable Add_edition(string database, string Pid, string Edition)
        {
            DataTable DataTableBox = null;

            try
            {
                DataTableBox = new DataTable();
               // string SQLUpdate = "UPDATE CBudget_WBS SET a.ChNumber = b.ChNumber FROM CBudget_WBS a INNER JOIN CBudget_Change_Detail b ON a.CWID = b.CWID";
               // string SQLString = "select a.*,b.CWID from CBudget_Change_Detail a  left join CBudget_WBS b on a.CWID=b.CWID where a.Pid=" + Pid + " and a.CEdition=" + Edition + " ";
                //string SQLString1 = "select * from CBudget_Change_Detail where Pid=" + Pid + " and CEdition=" + Edition + " ";
                string edition = "ChNumber" + Edition + ",Response" + Edition + ",Reason" + Edition + "";
                string SQLString1 = "select CWID," + edition + " from CBudget_Change_Detail where Pid=" + Pid + "";

                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString1, L_Conn))
                    {
                        //SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                     
                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }

        //Transfer Bid to CWBS
        public static bool Transfer_PriceIDtoWBS(string dbname,string Bid)
        {
            bool AddResult = false;
            string[] input = Get_CBudget_WBS_Information(dbname, Bid);
            string[] input1 = Get_Pro_Resource_Information(dbname, Bid);
            string[] temp_UID = input[0].Split(',');
            string[] temp_WBS_PriceID = input[1].Split(',');
            string[] temp_Pro_PriceID = input1[0].Split(',');
            string[] temp_id = input1[1].Split(',');
            int[] UID = new int[temp_UID.Length];
            int[] PriceID = new int[temp_WBS_PriceID.Length];
            //string[] ItemName = new string[temp_UID.Length];
            //decimal[] Number = new decimal[temp_SortNum.Length];
            for (int i = 0; i < UID.Length; i++)
            {
                int.TryParse(temp_UID[i], out UID[i]);
                int.TryParse(temp_WBS_PriceID[i], out PriceID[i]);
                //int.TryParse(temp_SortNum[i], out SortNum[i]);
                //decimal.TryParse(temp_Number[i], out Number[i]);
            }
           
            List<string> ItemName = new List<string>();
            for (int i = 0; i < PriceID.Length; i++)
            {
                //if (PriceID[i] != 0)
                //{

                    int PID = PriceID[i];
                    string SQLSelect="Select * from Bid_Library where PriceID="+PID;
                    string Iname = WebModel.SItemName(dbname, SQLSelect, "ItemName");
                    ItemName.Insert(i, Iname);

                //}


            }
            decimal[] result = new decimal[UID.Length];
            List<int> code_result = new List<int>();
            List<int> code_UperUid = new List<int>();
            List<decimal> code_Number = new List<decimal>();
            List<decimal> code_Layer = new List<decimal>();
            List<bool> code_show = new List<bool>();

            return AddResult;
        }

        public static string[] Get_CBudget_WBS_Information(string dbname, string Bid)
        {
            //string temp = "";
            string[] result = new string[4];
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            string Select_string = "Select CWID,PriceID from CBudget_WBS where bid=" + Bid;
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
        public static string[] Get_Pro_Resource_Information(string dbname, string Bid)
        {
          
            string[] result = new string[4];
            
            int[] UpperWID = new int[3];
            string Select_string = "Select PriceID,Temp_id from Pro_Resource where bid=" + Bid;
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

        public static bool  update_EWBS_Upperwid(string dbname, string Pid)
        {
            bool AddResult = false;
            string[] input = Get_EBudget_WBS_Information(dbname, Pid);
            //string[] input1 = Get_Pro_Resource_Information(dbname, Pid);
            string[] temp_EWID = input[0].Split(',');
            string[] temp_CWID = input[1].Split(',');
            string[] temp_UpperWID = input[2].Split(',');
            //string[] temp_id = input1[1].Split(',');
            int[] EWID = new int[temp_EWID.Length];
            int[] CWID = new int[temp_CWID.Length];
            int[] UpperWID = new int[temp_UpperWID.Length];
            //decimal[] Number = new decimal[temp_SortNum.Length];
            for (int i = 0; i < EWID.Length; i++)
            {
                int.TryParse(temp_EWID[i], out EWID[i]);
                int.TryParse(temp_CWID[i], out CWID[i]);
                int.TryParse(temp_UpperWID[i], out UpperWID[i]);
                //decimal.TryParse(temp_Number[i], out Number[i]);
            }


            for (int i = 0; i < EWID.Length; i++)
            {
                int CID = CWID[i];
                for (int j = 0; j < UpperWID.Length; j++)
               {
                   if (CID == UpperWID[j] )
                   {
                       string SQLSelect = "update EBudget_WBS set UpperWID=" + EWID[i] + " where EWID=" + EWID[j];
                       bool result1 = WebModel.SQLAction(dbname, SQLSelect);

                   }
               }

                AddResult = true;
            }
          
            return AddResult;
        }

        public static string[] Get_EBudget_WBS_Information(string dbname, string Pid)
        {
            //string temp = "";
            string[] result = new string[4];
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            string Select_string = "Select EWID,CWID,UpperWID from EBudget_WBS where Pid=" + Pid;
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
