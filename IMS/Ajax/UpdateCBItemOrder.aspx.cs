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
    public partial class UpdateCBItemOrder : System.Web.UI.Page
    {
        protected string asaction = string.Empty;
        int wid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction = SystemSet.GetString(base.Request["action"], string.Empty);

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
                        wid = int.Parse(row["CWID"].ToString());
                        main(wid);
                    }
                }



            }
        }
        public void main(int UID1)
        {

            string SQLString = "Select * from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
            string OrderItem = "select  CBudget_WBS.CWID,LayerOrder.OrderName as OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + " and CBudget_WBS.PID= " + Session["ProjectCode"].ToString() + "order by CBudget_WBS.CWID";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, OrderItem);

            int[] WID = new int[DataTableBox.Rows.Count];
            int[] UpperUID = new int[DataTableBox.Rows.Count];
            int[] sortnumber = new int[DataTableBox.Rows.Count];
            string[] ItemOrder = new string[DataTableBox1.Rows.Count];

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox.Rows)
                {
                    WID[count] = int.Parse(row["CWID"].ToString());
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
            if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox1.Rows)
                {
                    ItemOrder[count] = row["OrderName"].ToString();

                    count++;
                }

            }

            string[] result = WebModel.gen_WBOrderCode(WID, UpperUID, ItemOrder);
            string result1 = "";
            for (int k = 0; k < WID.Length; k++)
            {
                if (UID1 == WID[k])
                {
                    result1 = result[k];
                    break;
                }
            }
            //string SQLLayerCode = "update Budget_WBS set ItemOrder='" + result1 + "' where WID = " + UID1 + "";
            //string SQLLayerCode = "update Budget_WBS set Budget_WBS.ItemOrder = OrderName from Bid_WBSLayer join Budget_WBS on Budget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Budget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() +" and WID = " + UID1 +"";
            string SQLLayerCode = "update CBudget_WBS set ItemOrder='" + result1 + "' where CWID = " + UID1 + "";
            WebModel.SQLAction(database, SQLLayerCode);

        }

    }
}