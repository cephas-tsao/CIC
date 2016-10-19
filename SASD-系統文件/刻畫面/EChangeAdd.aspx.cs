using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EChangeAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        OpenNewWindow("ProResourceLink.aspx", Button17.ID);
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_CAdd.Visible == false))
        {
            Pnl_CAdd.Visible = true;
        }
        else
        {
            Pnl_CAdd.Visible = false;
        }
    }
}