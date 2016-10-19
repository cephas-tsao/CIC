using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 日報4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button33_Click(object sender, EventArgs e)
    {
        Pnl_Pic.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Search.Visible == true))
        {
            Pnl_Search.Visible = false;
        }
        else {
            Pnl_Search.Visible = true;
        }
    }
    protected void Button34_Click(object sender, EventArgs e)
    {
        Pnl_Result.Visible = true;
    }
    protected void Button23_Click(object sender, EventArgs e)
    {
        OpenNewWindow("DailyPicConItemLink.aspx", "PID");
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=no,scrollbars=yes,resizable=yes,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
}