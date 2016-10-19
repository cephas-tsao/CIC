using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeExeBudgetPEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton41_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("RFQAdd.aspx", "A");
    }
    protected void ImageButton39_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("RFQQuery.aspx", "A");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        OpenNewWindow("HistoryEPrice.aspx", "A");
    }
}