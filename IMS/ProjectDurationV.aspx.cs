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
    public partial class ProjectDurationV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["ProjectCode"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            DurationPunish.ConnectionString = datasource;
            DurationPunish.SelectCommand = "SELECT * FROM [ProjectM_DurationPunish] where pid=" + Session["ProjectCode"].ToString();
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
                string _TableName = "ProjectM2";               
                string SQLString = "Pid,StartDeadlinetype,StartDeadline,CompletionEscDeadline,DelayEscDeadline";

                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        StartDeadlinetype.Text = (row["StartDeadlinetype"].ToString()) == "0" ? "業主通知後" : (row["StartDeadlinetype"].ToString()) == "1" ? "建照取得後": (row["StartDeadlinetype"].ToString()) == "2" ? "西元(YYYY/MM/DD)" : (row["StartDeadlinetype"].ToString()) == "3" ? "合約簽訂後":"";
                        StartDeadline.Text = row["StartDeadline"].ToString();
                        CompletionEscDeadline.Text = row["CompletionEscDeadline"].ToString();
                        DelayEscDeadline.Text = row["DelayEscDeadline"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        
        
        }
    }
}