using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class BidWarrantyV : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                LoadData();

            }
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.ConnectionString = datasource;
            SqlDataSource1.SelectCommand = "Select * from BidM_Warranty where BID=" + Session["bid"].ToString() + "";
            Repeater1.DataBind();
        }
        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null || Session["bid"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            string SQLString = "select * from BidM3 where Bid=" + Session["bid"].ToString() + "";
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
               
                foreach (DataRow row in DataTableBox.Rows)
                {
                    TxWarrantyPercentage.Text = row["WarrantyPercentage"].ToString() !=""?row["WarrantyPercentage"].ToString()+"<span class=\"auto-style8\">%</span>":"";
                    TxOtherWarranty.Text = row["OtherWarranty"].ToString();
                    

                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                

                Literal LtWarrantyItem = (Literal)e.Item.FindControl("LtWarrantyItem");
                Literal LtWarrantyYear = (Literal)e.Item.FindControl("LtWarrantyYear");
               
                LtWarrantyItem.Text = vsDr["WarrantyItem"].ToString();
                LtWarrantyYear.Text = vsDr["WarrantyYear"].ToString();
             
                Session["bid"] = vsDr["BID"].ToString();



            }
        }
    }
}