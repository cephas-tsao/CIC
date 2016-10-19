using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 合預2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Note1.Visible == false))
        { Pnl_Note1.Visible = true; }
        else { Pnl_Note1.Visible = false; }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_Note2.Visible == false))
        { Pnl_Note2.Visible = true; }
        else { Pnl_Note2.Visible = false; }
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void Section1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Layer.Visible == false))
        { Pnl_Layer.Visible = true; }
        else { Pnl_Layer.Visible = false; }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((Button1.Text == "階層及編號設定並鎖定"))
        {
            Button1.Text = "解除鎖定";
            Pnl_LayerSet.Enabled = false;
            Section1.Text = "階層及編號設定(已鎖定)";
            Pnl_Note1.Visible = false;
            Pnl_Note2.Visible = false;
        }
        else if ((Button1.Text == "解除鎖定"))
        {
            Button1.Text = "修正階層及編號設定";
            Pnl_LayerSet.Enabled = true;
            Section1.Text = "階層及編號設定(修正中)";
        }
        else if ((Button1.Text == "修正階層及編號設定"))
        {
            Button1.Text = "解除鎖定";
            Pnl_LayerSet.Enabled = false;
            Section1.Text = "階層及編號設定(已鎖定)";
            Pnl_Note1.Visible = false;
            Pnl_Note2.Visible = false;
        }
    }
    protected void Section2_Click(object sender, EventArgs e)
    {
        if ((Pnl_AddItem.Visible == false))
        { Pnl_AddItem.Visible = true; }
        else { Pnl_AddItem.Visible = false; }
    }
    protected void Section4_Click(object sender, EventArgs e)
    {
        if ((Pnl_WBS.Visible == false))
        { Pnl_WBS.Visible = true; }
        else { Pnl_WBS.Visible = false; }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 1))
        {
            DropDownList5.Enabled = true;
        }
        else
        {
            DropDownList5.Enabled = false;
        }
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        OpenNewWindow("ProResourceLink.aspx", Button17.ID);
    }
    protected void ImageButton21_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("BudgetAnalysisEdit.aspx", ImageButton21.ID);
    }
    protected void Button23_Click(object sender, EventArgs e)
    {
        OpenNewWindow("CTotalPriceAdjest.aspx", "A");
    }
}