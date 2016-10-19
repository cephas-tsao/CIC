using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Form
{
    public partial class Default : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {

            Response.Cookies["userName"].Value = "patrick";
            Response.Cookies["userName"].Expires = DateTime.Now.AddDays(1);

            Label1.Text = Server.HtmlEncode(Request.Cookies["userName"].Value);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //Server.Transfer("test.aspx");
            //Application["projectname"] = DropDownList1.Text;
            Server.Transfer("listplace.aspx");
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("listproject.aspx");
        }
    }
  
}