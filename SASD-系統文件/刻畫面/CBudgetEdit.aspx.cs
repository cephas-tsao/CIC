using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CBudgetEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton21_Click(object sender, ImageClickEventArgs e)    
    {
        OpenNewWindow("BudgetAnalysisV.aspx", ImageButton21.ID);
    }
    protected void ImageButton214_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("CTotalPriceAdjest.aspx", "A");
    }
    protected void ImageButton178_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("CBudgetLayerSet.aspx", IBtn_LayerSet.ID);
    }
    protected void ImageButton175_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("CBudgetImport.aspx", IBtn_LayerSet.ID);
    }
    protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
    {
        if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg"))
        {
            IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
            IBtn_Lock.ToolTip = "預算已鎖定(點選解除鎖定)";
            IBtn_Import.Visible = false;
            IBtn_LayerSet.Visible = false;
            IBtn_AddNewItem.Visible = false;
            IBtn_PriceFill.Visible = false;
            IBtn_Caculate.Visible = false;
            IBtn_Reload.Visible = false;
            IBtn_Save.Visible = false;
        }
        else if ((IBtn_Lock.ImageUrl == "~/img/Lock.jpg"))
        {
            IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
            IBtn_Lock.ToolTip = "預算尚未鎖定(點選鎖定預算)";
            IBtn_Import.Visible = true;
            IBtn_LayerSet.Visible = true;
            IBtn_AddNewItem.Visible = true;
            IBtn_PriceFill.Visible = true;
            IBtn_Caculate.Visible = true;
            IBtn_Reload.Visible = true;
            IBtn_Save.Visible = true;
        }
    }
}