using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS.Ajax
{
    public partial class AddBWLayerCode : System.Web.UI.Page
    {
       
        protected string asaction = string.Empty;
        int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction =SystemSet.GetString(base.Request["action"], string.Empty);
          
            if (this.asaction == "addsave")
            {
                
                //string SQLString = "Select MAX(UID) as uid from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string SQLString = "Select * from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        uid = int.Parse(row["CWID"].ToString());
                        main(uid);
                    }
                }
              
             
               
            }
        }
        public void main(int UID1)
        {

            string SQLString = "Select * from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            int[] UID = new int[DataTableBox.Rows.Count];
            int[] UpperUID = new int[DataTableBox.Rows.Count];
            int[] sortnumber = new int[DataTableBox.Rows.Count];

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox.Rows)
                {
                    UID[count] = int.Parse(row["CWID"].ToString());
                    sortnumber[count] = int.Parse(row["SortNum"].ToString());
                    if (row["UpperWID"].ToString() == "")
                    {
                        UpperUID[count] = 0;
                    }
                    else
                    {
                        UpperUID[count] = int.Parse(row["UpperWID"].ToString());
                    }
                    //UpperUID[count]=(row["UpperUID"]==null)?0:int.Parse(row["UpperUID"].ToString());
                    count++;
                }
            }

           
            string[] result = WebModel.gen_LayerCode(UID, UpperUID, sortnumber);
            string result1 = "";
            for (int k = 0; k < UID.Length; k++)
            {
                if (UID1 == UID[k])
                {
                    result1 = result[k];
                    break;
                }
            }
            string SQLLayerCode = "update CBudget_WBS set LayerCode='" + result1 + "' where CWID = " + UID1 + "";
        
            WebModel.SQLAction(database, SQLLayerCode);

        }

  
    }
}