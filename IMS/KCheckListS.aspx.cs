using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;
using DAL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace IMS
{
    public partial class KCheckListS : System.Web.UI.Page
    {
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
            else
            {

                String Name = Session["DatabaseName"].ToString();
                String Projectid = Session["ProjectCode"].ToString();


                //String DBName = "Private_Com1";
                SqlCheckList.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlCheckList.SelectCommand = "SELECT * FROM KCheckList INNER JOIN KEngineeringList ON KCheckList.KCheckListEngineeringList = KEngineeringList.KEngineeringListId where  KCheckList.KCheckListProject ='" + Projectid + "'";

            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            ID_class = ID_class % GridView1.PageSize;

            if (e.CommandName == "Statistics")
            {

                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["KCheckListId"] = ID;
                OpenNewWindow("KCheckListSView.aspx", "700", "900");

            }



        }
        public void OpenNewWindow(string url, string height, string width)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
    }
}