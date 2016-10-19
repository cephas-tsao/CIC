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
    public partial class UpdateBidItemOrder : System.Web.UI.Page
    {
         protected string asaction = string.Empty;
        int Uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction =SystemSet.GetString(base.Request["action"], string.Empty);
          
            if (this.asaction == "addsave")
            {
                
                //string SQLString = "Select MAX(UID) as uid from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string SQLString = "Select * from Bid_WBS where Bid=" + Session["Bid"].ToString() + "";
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Uid = int.Parse(row["UID"].ToString());
                        main(Uid);
                    }
                }
              
             
               
            }
        }
        public void main(int UID1)
        {

            string SQLString = "Select * from Bid_WBS where Bid=" + Session["Bid"].ToString() + "";
            string OrderItem = "select  Bid_WBS.UID,LayerOrder.OrderName as OrderName from Bid_WBSLayer join Bid_WBS on Bid_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + " and Bid_WBS.BID= "+ Session["Bid"].ToString() +"order by Bid_WBS.UID";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, OrderItem);

            int[] WID = new int[DataTableBox.Rows.Count];
            int[] UpperUID = new int[DataTableBox.Rows.Count];
            int[] sortnumber = new int[DataTableBox.Rows.Count];
            string[] ItemOrder = new string[DataTableBox1.Rows.Count];
            int[] UID = new int[DataTableBox1.Rows.Count];

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox.Rows)
                {
                    WID[count] = int.Parse(row["UID"].ToString());
                    sortnumber[count] = int.Parse(row["SortNum"].ToString());

                    if (row["UpperUID"].ToString() == "")
                    {
                        UpperUID[count] = 0;
                    }
                    else
                    {
                        UpperUID[count] = int.Parse(row["UpperUID"].ToString());
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
                     UID[count]=int.Parse(row["UID"].ToString());
                     count++;
                 }
                
            }

            string[] result = WebModel.gen_WBOrderCode(WID, UpperUID, ItemOrder);
            string result1 = "";
            for (int k = 0; k < ItemOrder.Length; k++)
            {
                if (UID1 == WID[k])
                {
                    result1 = result[k];
                    //result1 = ItemOrder[k];
                    break;
                }
            }
            //string SQLLayerCode = "update Budget_WBS set ItemOrder='" + result1 + "' where WID = " + UID1 + "";
            //string SQLLayerCode = "update Budget_WBS set Budget_WBS.ItemOrder = OrderName from Bid_WBSLayer join Budget_WBS on Budget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Budget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() +" and WID = " + UID1 +"";
            string SQLLayerCode = "update Bid_WBS set ItemOrder='" + result1 + "' where UID = " + UID1 + "";
            WebModel.SQLAction(database, SQLLayerCode);

        }

  
    
    }
}