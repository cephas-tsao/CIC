using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubBargain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }
    //protected void Button40_Click(object sender, EventArgs e)
    //{
    //    Pnl_Bargain.Visible = true;
    //}
    //protected void Button41_Click(object sender, EventArgs e)
    //{

    //}
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Price.Visible == true))
        {
            Pnl_Price.Visible = false;
        }
        else
        {
            Pnl_Price.Visible = true;
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_Contract.Visible == true))
        {
            Pnl_Contract.Visible = false;
        }
        else
        {
            Pnl_Contract.Visible = true;
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList1.SelectedIndex == 0)) {
            TB_Bargain.Text = "";
            TB_Bargain.Visible = true;
            LB_Unit.Text = "元";
            LB_Unit.Visible = true;
        }
        else if ((RadioButtonList1.SelectedIndex == 1))
        {
            TB_Bargain.Text = "";
            TB_Bargain.Visible = true;
            LB_Unit.Text = "%";
            LB_Unit.Visible = true;
        }
        else {
            TB_Bargain.Visible = false;
            LB_Unit.Visible = false;
        }
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList9.SelectedIndex == 1)) {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請選擇-",""));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工日期"));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工工作天數"));
            DDL_Warranty.Items.Add(new ListItem("工地通知起算日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("協商完工期限"));
            DDL_Warranty.Items.Add(new ListItem("縣市政府特殊條款"));
        }
        else if ((DropDownList9.SelectedIndex == 2))
        {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
            DDL_Warranty.Items.Add(new ListItem("合約規定交貨日期"));
            DDL_Warranty.Items.Add(new ListItem("合約規定交貨日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("工地通知交貨起算日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("協商交貨期限"));
            DDL_Warranty.Items.Add(new ListItem("另定"));
        }
        else {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請先選擇合約種類-", ""));
        }
        
    }
    protected void Button44_Click(object sender, EventArgs e)
    {
        OpenNewWindow("BargainTable.aspx", "A");
    }
    protected void Button45_Click(object sender, EventArgs e)
    {
        Pnl_Bargain.Visible = true;
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,resize=yes,scrollbar=yes,location=center,height=800,width=2000";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void DDL_Op3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_Op3.SelectedIndex == 2))
        {
            TextBox87.Visible = true;
            TextBox87.Text = "";
        }
        else
        {
            TextBox87.Visible = false;
        }
    }
}