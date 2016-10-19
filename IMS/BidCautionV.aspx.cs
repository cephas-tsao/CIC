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
    public partial class BidCautionV : System.Web.UI.Page
    {
        string _TableName = "BidM3";        
        string SQLString = "bid,ContractCaution1,ContractCaution2,ContractCaution3,ContractCaution4";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadContent();
        }

        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["bid"] = row["bid"].ToString();

                        ContractCaution1.Text = row["ContractCaution1"].ToString();
                        ContractCaution2.Text = row["ContractCaution2"].ToString();
                        ContractCaution3.Text = row["ContractCaution3"].ToString();
                        ContractCaution4.Text = row["ContractCaution4"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        
        
        }
    }
}