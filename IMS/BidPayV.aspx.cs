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
    public partial class BidPayV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                LoadData();

            }
                     
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
                    Session["bid"] = row["bid"].ToString();
                    TxPriceSubsidyNY.Text = (row["PriceSubsidyNY"].ToString() == "0") ? "是" : (row["PriceSubsidyNY"].ToString() == "1") ? "否" :"";
                    TxPrepayPercentage.Text = row["PrepayPercentage"].ToString() != "" ? row["PrepayPercentage"].ToString() + "%" : "";
                    TxEstAcceptNum.Text = row["EstAcceptNum"].ToString() != "" ? row["EstAcceptNum"].ToString() + "次/" : "";
                    TxEstAcceptUnit.Text = row["EstAcceptUnit"].ToString();
                    TxEstAcceptDate1.Text = row["EstAcceptDate1"].ToString();
                    TxEstAcceptDate2.Text = row["EstAcceptDate2"].ToString();
                    TxRetentionPercentage.Text = row["RetentionPercentage"].ToString() !=""?row["RetentionPercentage"].ToString()+"<span class=\"auto-style9\">%</span>":"";
                    TxOtherPayment.Text = row["OtherPayment"].ToString();

                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }

       
    }
}