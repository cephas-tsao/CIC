using System;

namespace IMS
{
    public partial class FFundIncreaseView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            GridView2.Attributes.Add("style", "font-family:Microsoft JhengHei;");
        }
    }
}