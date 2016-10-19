using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AnalysisQEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisQEdit.aspx", ImageButton8.ID);
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton197_Click(object sender, ImageClickEventArgs e)
    {
        Session["AddNew"] = "2";
        OpenNewWindow("AddNewItem.aspx", "1");
    }
}