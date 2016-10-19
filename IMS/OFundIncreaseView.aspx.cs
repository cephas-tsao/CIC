using System;

namespace IMS
{
    public partial class OFundIncreaseView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
        }
    }
}