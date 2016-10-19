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
   public class EBudgetDisp
    {
        public static DataTable LoadContentData_CB(string database, string Pid, string Edition,string Ewid)
        {
            DataTable DataTableBox = null;
            //DataTable addvalue = Add_edition(database, Pid, Edition);
            DataTable dtResult = new DataTable();
             string SQLSelect="";
             string newEdiditon = Edition.Substring(0,Edition.Length-1);
             //foreach (string DataName in newEdiditon.Split(','))
             //{
             //    SQLSelect += "ChNumber" + DataName + ",Response" + DataName + ",Reason" + DataName + ",";
             //}

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = "select * from EBudget_WBS a left join Pro_Resource c on a.PriceID=c.PriceID where a.Pid=" + Pid + " order by a.order_Num";

                //string SQLString = "select a.*,b.*," + SQLSelect + "c.PID from EBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID left join EBudget_Change_Detail c on a.Ewid=c.Ewid where a.Pid=" + Pid + " order by a.order_Num";
                string SQLString = "select a.*,b.*,c.* from EBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID left join EBudget_Change_Detail c on a.Ewid=c.Ewid where a.Pid=" + Pid + " and a.EWID="+Ewid+" order by a.order_Num";
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


                        //DataTableBox.Columns.Add("CEdition1", typeof(String));
                        //DataTableBox.Columns.Add("ChNumber", typeof(String));
                        //DataTableBox.Columns.Add("Response", typeof(String));
                        //DataTableBox.Columns.Add("Reason", typeof(String));


                    }
                    //for (int j = 0; j < DataTableBox.Rows.Count; j++)
                    //{

                    //    for (int i = 0; i < addvalue.Rows.Count; i++)
                    //    {
                    //        DataRow vsDr = addvalue.Rows[i];
                    //        string ChNumber = vsDr["ChNumber"].ToString() != "" ? vsDr["ChNumber"].ToString() : "0";
                    //        string Response = vsDr["Response"].ToString();
                    //        string Reason = vsDr["Reason"].ToString();
                    //        if (DataTableBox.Rows[j]["EWID"].ToString() == addvalue.Rows[i]["EWID"].ToString())
                    //        {
                    //            DataTableBox.Rows[j]["ChNumber"] = ChNumber;
                    //            //DataTableBox.Rows[j]["Response"] = Response;
                    //            //DataTableBox.Rows[j]["Reason"] = Reason;

                    //        }
                    //    }
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
                //string SQLString1 = "select a.*,b.EWID from EBudget_Change_Detail a  left join EBudget_WBS b on a.EWID=b.CWID where a.Pid=" + Pid + " and a.CEdition=" + Edition + " ";
                string SQLString1 = "select * from EBudget_Change_Detail where Pid=" + Pid + " and EEdition=" + Edition + " ";
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

        public static string[] check_Enum(string dbname, int UID)
        {
            string temp = "";
            //string[] result;
            string[] input = getUpperWID_by_UID(dbname, UID);
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            string Select_string = "Select EWID,PID,UpperWID from EBudget_WBS where EWID=" + UID;
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
                                temp += reader.GetInt32(0).ToString() + ",";
                                int UpperID = reader.GetInt32(2);
                                string[] newupperID = getUpperWID_by_UID(dbname, UpperID);

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

            return input;
        }
        //public static int getUpperWID_by_UID(string dbname,int nowUID, int[] UID, int[] UpperUID)
        public static string[] getUpperWID_by_UID(string dbname, int nowUID)
        {
            //string[] result1;
            string temp = "";
            //int[] result = 0;
            string Select_string = "Select EWID,PID,UpperWID from EBudget_WBS where UpperWID=" + nowUID;
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

                                temp += reader.GetInt32(0).ToString() + ",";

                                //for (int i = 0; i < UID.Length; i++)
                                // {
                                //     if (nowUID == UID[i])
                                //     {
                                //         result = UpperUID[i];
                                //         break;
                                //     }
                                // }

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

            if (temp.Length > 0)
            {
                temp = temp.Substring(0, temp.Length - 1);
            }
            else
            {
                temp = "";
            }
            string[] result1 = temp.Split(',');
            string[] nextresult;
            for (int i = 0; i < result1.Length; i++)
            {
                nextresult = getUpperWID_by_UID(dbname, int.Parse(result1[i]));
            }
            return result1;
        }
        public static string Get_Order(string dbname, string PID, string UID, string UpperUID, string order_Num, string SortNum)
        {
            string result = "";
            string SQLSearchUID = "";
            string SearchUID = "";

            SQLSearchUID = "Select EWID from EBudget_WBS where EWID=" + UpperUID;
            SearchUID = WebModel.SItemName(dbname, SQLSearchUID, "EWID");

            if (SearchUID == "")
            {
                result = SortNum;

            }
            else
            {
                string SQLSrarchorder_Num = "Select order_Num from EBudget_WBS where EWID=" + SearchUID;
                string Srarchorder_Num = WebModel.SItemName(dbname, SQLSrarchorder_Num, "order_Num");
                result = Srarchorder_Num;
            }
            return result;
        }
    }
}
