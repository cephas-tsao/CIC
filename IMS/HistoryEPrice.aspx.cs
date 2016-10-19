using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class HistoryEPrice : System.Web.UI.Page
    {
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {
                // Response.Redirect("Main.aspx");
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);

            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (PriceID != "")
            {
                SqlDataSource1.SelectCommand = "Select * From Pro_Resource a left join RFQ_Material b on a.PriceID=b.Pro_PriceID left join ProjectM0 c on a.PID=c.PID left join FirmM d on b.FirmID=d.UID left join RFQ e on b.RFQ_Code=e.RFQ_Code and b.FirmID=e.FirmID where a.PriceID=" + PriceID;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
          
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label LbPriceID = (Label)e.Item.FindControl("LbPriceID");
                Label LbProjectNo = (Label)e.Item.FindControl("LbProjectNo");
                Label LbProjectName = (Label)e.Item.FindControl("LbProjectName");
                Label LbRecode = (Label)e.Item.FindControl("LbRecode");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbFirm = (Label)e.Item.FindControl("LbFirm");
                Label LbQuatation = (Label)e.Item.FindControl("LbQuatation");
                Label LbDuration = (Label)e.Item.FindControl("LbDuration");              



                LbPriceID.Text = vsDr["PriceID"].ToString();
                LbProjectNo.Text = vsDr["ProjectCode"].ToString();
                LbProjectName.Text = vsDr["ProjectName"].ToString();
                LbRecode.Text = vsDr["Code"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbFirm.Text = vsDr["Name"].ToString();             
                LbQuatation.Text = vsDr["UnitPrice"].ToString() != "" ? decimal.Parse(vsDr["UnitPrice"].ToString()).ToString("N0"): "";
                LbDuration.Text = vsDr["ExpiretionDate"].ToString();
               
            }
        }
    }
}