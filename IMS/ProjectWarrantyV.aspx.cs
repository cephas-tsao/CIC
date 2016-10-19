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
    public partial class ProjectWarrantyV : System.Web.UI.Page
    {
        string _TableName = "ProjectM2";
        string SQLString = "Pid,WarrantyPercentage,OtherWarranty";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["ProjectCode"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Warranty.ConnectionString = datasource;
            Warranty.SelectCommand = "SELECT * FROM [ProjectM_Warranty] where pid=" + Session["ProjectCode"].ToString();
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


                        WarrantyPercentage.Text = row["WarrantyPercentage"].ToString();
                        OtherWarranty.Text = row["OtherWarranty"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}