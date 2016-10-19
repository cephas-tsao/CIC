using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 投預1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button19_Click(object sender, EventArgs e)
    {
        if ((Button19.Text == "顯示缺漏項"))
        {
            Page.RegisterStartupScript("Show", "<script language=JavaScript>show_tr();</script>");
            Button19.Text = "隱藏缺漏項";
        }
        else if ((Button19.Text == "隱藏缺漏項"))
        {
            Page.RegisterStartupScript("Hide", "<script language=JavaScript>hide_tr();</script>");
            Button19.Text = "顯示缺漏項";
        }
    }
    protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["BID"] = DDL_BidSelect.SelectedValue;
        Pnl_ALL.Visible = true;
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisV.aspx", ImageButton7.ID);
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
}