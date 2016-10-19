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
    public partial class BidReAssess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {

              
                SqlDataSource1.SelectCommand = "Select * from BidM0 a Left join BidAssess b on a.bid = b.bid where b.PreOver=1" ;
               
                DropDownList3.DataSource = SqlDataSource1;
                DropDownList3.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";
               
                DropDownList3.Items.Insert(0, LI);
                DropDownList3.SelectedIndex = 0;
              
            }
           
        }

        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null && Session["bid"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            string SQLString = "Select * from BidM0 a Left join BidM3 b on a.bid= b.bid Left join BidM2 c on a.bid =c.bid Left join BidM4 d on a.bid=d.bid Left join  BidAssess e on a.bid=e.bid where a.bid ='" + Session["bid"].ToString() + "'";
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {

                foreach (DataRow row in DataTableBox.Rows)
                {
                    Session["bid"] = row["bid"].ToString();
                   
                    LbOwnerName.Text = row["OwnerName"].ToString();
                    LbArchitectName.Text = row["ArchitectName"].ToString();
                    LbEngCountry.Text = row["EngCountry"].ToString();
                    LbDuration.Text = row["Duration"].ToString();
                    LbBiddingEndDate.Text = row["BiddingEndDate"].ToString();
                    LbOpenBidTime.Text = row["OpenBidTime"].ToString();
                    LbIlluFee.Text = row["IlluFee"].ToString()!=""?Convert.ToDecimal(row["IlluFee"]).ToString("N0"):"";
                    LbIlluBond.Text = row["IlluBond"].ToString()!=""?Convert.ToDecimal(row["IlluBond"]).ToString("N0"):"";
                    LbPerformanceBond.Text = row["PerformanceBond"].ToString()!=""?Convert.ToDecimal(row["PerformanceBond"]).ToString("N0"):"";
                    LbBidBond.Text =row["BidBond"].ToString()!=""?Convert.ToDecimal(row["BidBond"]).ToString("N0"):"";
                    LbUpFloorNum.Text = row["UpFloorNum"].ToString();
                    LbUpFloorArea.Text = row["UpFloorArea"].ToString();
                    LbFoundationType.Text = row["FoundationType"].ToString();
                    LbRetaining.Text = row["Retaining"].ToString();
                    LbStartDeadline.Text = row["StartDeadline"].ToString();
                    LbPriceSubsidyNY.Text = (row["PriceSubsidyNY"].ToString() == "0") ? "是" : (row["PriceSubsidyNY"].ToString() == "1" )? "否" : "";
                    LbPreMan.Text = row["PreMan"].ToString();
                    LbPreSuggestion.Text = (row["PreSuggestion"].ToString() == "0") ? "參與競標" : "不參與競標";
                    LbPreResultNote.Text = row["PreResultNote"].ToString();
                    RadioButtonList1.SelectedIndex = (row["TempResult"].ToString() == null || row["TempResult"].ToString() == "") ? -1 : int.Parse(row["TempResult"].ToString());
                    TxResultNote.Text = row["ResultNote"].ToString();
                   

                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["bid"] = DropDownList3.SelectedItem.Value;
            if (Session["Bid"] != null)
            {
                LoadData();
            }
        }

        protected void Temp_result_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLUpdate = "Update [BidAssess] set [ReMan]='" + Session["UserName"].ToString() + "',[ResultNote]='" + TxResultNote.Text + "',[TempResult]='" + RadioButtonList1.SelectedValue + "' where bid="+Session["bid"].ToString();
            bool result = WebModel.SQLAction(database, SQLUpdate);
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 暫存成功');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 暫存失敗');", true);
            }
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLUpdate = "Update [BidAssess] set [ReMan]='" + Session["UserName"].ToString() + "',[ResultNote]='" + TxResultNote.Text + "',[Result]='" + RadioButtonList1.SelectedValue + "' where bid=" + Session["bid"].ToString();
            bool result = WebModel.SQLAction(database, SQLUpdate);
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 更新成功');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 更新失敗');", true);
            }
        }

    }
}