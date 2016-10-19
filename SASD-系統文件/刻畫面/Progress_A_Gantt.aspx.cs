using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Progress_A_Gantt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
           if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
           if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
           {

               Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");

           }
           else
           {

           }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        Image1.Visible = true;
        Image2.Visible = true;
    }
}