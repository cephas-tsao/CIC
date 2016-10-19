using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExeBudgetEdit_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
        IBtn_Lock.ToolTip = "尚未鎖定，點選即可鎖定";
    }

    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
    {
        if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg")) {
            IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
            IBtn_Lock.ToolTip = "執行預算已鎖定";
            IBtn_AddItem.Visible = false;
            IBtn_PriceFill.Visible = false;
            IBtn_Reload.Visible = false;
            IBtn_Save.Visible = false;
        }
    }
}