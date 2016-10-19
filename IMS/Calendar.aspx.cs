using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Reflection;

namespace IMS
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string Targer = Request.QueryString["ClientID"].ToString().Trim();
            StringBuilder Tagstr = new StringBuilder();
            Tagstr.Append("window.opener.document.getElementById('" + Targer + "').value='" + this.Calendar1.SelectedDate.ToString("yyyy/MM/dd") + "';");
            Tagstr.Append("window.close();");
            ClientScript.RegisterStartupScript(this.GetType(), "ReturnValue", Tagstr.ToString(), true);
        }
    }
}