using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Ajax
{
    public partial class AddEBLayerCode : System.Web.UI.Page
    {
        protected string asaction = string.Empty;
        int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction = SystemSet.GetString(base.Request["action"], string.Empty);

            if (this.asaction == "addsave")
            {

                //string SQLString = "Select MAX(UID) as uid from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string SQLString = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        uid = int.Parse(row["EWID"].ToString());
                        main(uid);
                    }
                }
            }
            if (this.asaction == "Delete")
            {
                string uid = base.Request["uid"];
                string database = Session["DatabaseName"].ToString();
            
                string SQLString = "Delete EBudget_WBS where EWID=" + uid + "";
                bool result = WebModel.SQLAction(database, SQLString);

            }
        }
        public void main(int UID1)
        {

            string SQLString = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
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
                    UID[count] = int.Parse(row["EWID"].ToString());
                    sortnumber[count] = row["SortNum"].ToString() !=""?int.Parse(row["SortNum"].ToString()):0;
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
            string SQLLayerCode = "update EBudget_WBS set LayerCode='" + result1 + "' where EWID = " + UID1 + "";

            WebModel.SQLAction(database, SQLLayerCode);

        }


    }
}