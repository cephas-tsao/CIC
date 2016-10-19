using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 執預2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
        IBtn_Lock.ToolTip = "原執行預算已鎖定";
    }

    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
}