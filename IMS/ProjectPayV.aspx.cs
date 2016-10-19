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
    public partial class ProjectPayV : System.Web.UI.Page
    {
        string _TableName = "ProjectM2";      
        string SQLString = "Pid,PrepayPercentage,EstAcceptNum,EstAcceptUnit,EstAcceptDate1,EstAcceptDate2,RetentionPercentage,PriceSubsidyNY,OtherPayment";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadContent();
        }
        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        Session["ProjectCode"] = row["pid"].ToString();
                        PriceSubsidyNY.Text = (row["PriceSubsidyNY"].ToString() =="0")?"是":(row["PriceSubsidyNY"].ToString() =="1")?"否":"";
                        PrepayPercentage.Text = row["PrepayPercentage"].ToString();
                        EstAcceptNum.Text = row["EstAcceptNum"].ToString();
                        EstAcceptUnit.Text = row["EstAcceptUnit"].ToString();
                        EstAcceptDate1.Text =(row["EstAcceptDate1"].ToString() !="")? Convert.ToDateTime(row["EstAcceptDate1"].ToString()).ToString("yyyy/MM/dd"):"";
                        EstAcceptDate2.Text = (row["EstAcceptDate2"].ToString() != "") ? Convert.ToDateTime(row["EstAcceptDate2"].ToString()).ToString("yyyy/MM/dd") : "";
                        RetentionPercentage.Text = row["RetentionPercentage"].ToString();
                        OtherPayment.Text = row["OtherPayment"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}