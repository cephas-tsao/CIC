using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
  public  class SubContract
    {
        public static DataTable LoadContentData_CB(string database, string SCID, string Edition)
        {
            DataTable DataTableBox = null;
            string newEdiditon = "";
            if (Edition !="")
            {
             newEdiditon = Edition.Substring(0, Edition.Length - 1);
            }
            DataTable dtResult = new DataTable();
            //string SQLSelect = "";
            
          
            try
            {
                DataTableBox = new DataTable();

                string SQLString = "select * from SubContract_Item  where SCID=" + SCID + " order by SC_MID";
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

                        //DataTableBox.PrimaryKey = new DataColumn[] { DataTableBox.Columns["CWID"] };
                        foreach (string DataName in newEdiditon.Split(','))
                        {
                            DataTableBox.Columns.Add("ChNumber" + DataName + "", typeof(String));
                            DataTableBox.Columns.Add("Note" + DataName + "", typeof(String));
                        }
                        //DataTableBox.Columns.Add("Edition", typeof(String));
              
                        ////DataTableBox.Columns.Add("Reason" + Edition + "", typeof(String));


                    }
                    foreach (string DataName in newEdiditon.Split(','))
                    {
                        DataTable addvalue = Add_edition(database, SCID, DataName);
                    for (int i = 0; i < addvalue.Rows.Count; i++)
                    {
                        DataRow vsDr = addvalue.Rows[i];
                      
                            string ChNumber = vsDr["ChNumber"].ToString() != "" ? vsDr["ChNumber"].ToString() : "0";
                            string Note = vsDr["Note"].ToString();
                            //string Reason = vsDr["Reason" + Edition + ""].ToString();

                            for (int j = 0; j < DataTableBox.Rows.Count; j++)
                            {
                                if (addvalue.Rows[i]["SC_MID"].ToString() == DataTableBox.Rows[j]["SC_MID"].ToString())
                                {
                                    DataTableBox.Rows[j]["ChNumber" + DataName + ""] = ChNumber;
                                    DataTableBox.Rows[j]["Note" + DataName + ""] = Note;
                                    //DataTableBox.Rows[j]["Reason" + Edition + ""] = Reason;
                                    break;
                                }
                            }
                        }
                    }
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
        public static DataTable Add_edition(string database, string SCID, string Edition)
        {
            DataTable DataTableBox = null;

            try
            {
                DataTableBox = new DataTable();
                // string SQLUpdate = "UPDATE CBudget_WBS SET a.ChNumber = b.ChNumber FROM CBudget_WBS a INNER JOIN CBudget_Change_Detail b ON a.CWID = b.CWID";
                // string SQLString = "select a.*,b.CWID from CBudget_Change_Detail a  left join CBudget_WBS b on a.CWID=b.CWID where a.Pid=" + Pid + " and a.CEdition=" + Edition + " ";
                string SQLString1 = "select * from SubContract_Change where SCID=" + SCID + " and  Edition in (" + Edition + " )";
                //string edition = "ChNumber" + Edition + ",Response" + Edition + ",Reason" + Edition + "";
                //string SQLString1 = "select CWID," + edition + " from CBudget_Change_Detail where Pid=" + Pid + "";

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
    }
}
