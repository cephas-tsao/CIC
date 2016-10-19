using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BidBudgetEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    public void OpenNewWindow1(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=800";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton197_Click(object sender, ImageClickEventArgs e)
    {
        Session["AddNew"] = "1";
        OpenNewWindow("AddNewItem.aspx", "1");
    }
    protected void ImageButton196_Click(object sender, ImageClickEventArgs e)
    {
        if ((ImageButton196.ToolTip == "顯示缺漏項(目前隱藏)"))
        {
            ImageButton196.ImageUrl = "~/img/See.png";
            ImageButton196.ToolTip = "隱藏缺漏項(目前顯示)";
            Page.RegisterStartupScript("Show", "<script language=JavaScript>show_tr();</script>");
        }
        else
        {
            ImageButton196.ImageUrl = "~/img/UnSee.png";
            ImageButton196.ToolTip = "顯示缺漏項(目前隱藏)";
            Page.RegisterStartupScript("Hide", "<script language=JavaScript>hide_tr();</script>");
        }
    }
    protected void ImageButton214_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow1("BidSum.aspx", "A");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisQEdit.aspx", ImageButton7.ID);
    }
}