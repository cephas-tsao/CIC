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
    public partial class ContractV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null && Session["bid"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            string SQLString = "Select * from BidM0 a Left join  BidAssess e on a.bid=e.bid where a.bid ='" + Session["bid"].ToString() + "'";
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {

                foreach (DataRow row in DataTableBox.Rows)
                {
                    Session["bid"] = row["bid"].ToString();

                    LbContract1.Text = row["Contract1"].ToString();
                    LbContractNote1.Text = row["ContractNote1"].ToString();
                    LbContract2.Text = row["Contract1"].ToString();
                    LbContractNote2.Text = row["ContractNote2"].ToString();
                    LbContract3.Text = row["Contract1"].ToString();
                    LbContractNote3.Text = row["ContractNote3"].ToString();
                    LbContract4.Text = row["Contract1"].ToString();
                    LbContractNote4.Text = row["ContractNote4"].ToString();
                    LbContract5.Text = row["Contract1"].ToString();
                    LbContractNote5.Text = row["ContractNote5"].ToString();
                    LbContract6.Text = row["Contract1"].ToString();
                    LbContractNote6.Text = row["ContractNote6"].ToString();
                    LbContract7.Text = row["Contract7"].ToString();
                    LbContractNote7.Text = row["ContractNote7"].ToString(); 
                    LbContract8.Text = row["Contract8"].ToString();
                    LbContractNote8.Text = row["ContractNote8"].ToString();
                    LbContract9.Text = row["Contract9"].ToString();
                    LbContractNote9.Text = row["ContractNote9"].ToString();

                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }

        protected void BtnPunish_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>window.open('BidDurationV.aspx', 'window', config='height=560,width=1000')</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidDurationV.aspx', 'window','height=500,width=1200');</script>"));
      
        }

        protected void BtnWarrany_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidWarrantyV.aspx', 'window','height=400,width=800');</script>"));
        }

        protected void BtnPay_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidPayV.aspx', 'window','height=300,width=900');</script>"));
        }
    }
}