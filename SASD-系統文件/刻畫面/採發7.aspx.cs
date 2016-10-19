using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 採發7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
        Warranty();
    }
    
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_main.Visible == true))
        {
            Pnl_main.Visible = false;
        }
        else
        {
            Pnl_main.Visible = true;
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_pay.Visible == true))
        {
            Pnl_pay.Visible = false;
        }
        else
        {
            Pnl_pay.Visible = true;
        }
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList9.SelectedItem.Text == "其他"))
        {
            TextBox84.Visible = true;
            TextBox84.Text = "";
        }
        else
        {
            TextBox84.Visible = false;
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if ((Pnl_file.Visible == true))
        {
            Pnl_file.Visible = false;
        }
        else
        {
            Pnl_file.Visible = true;
        }
    }
    protected void Button42_Click(object sender, EventArgs e)
    {
        Pnl_Contract.Visible = true;
    }

    protected void DropDownList9_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if ((DropDownList9.SelectedIndex == 1))
        {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
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
        else
        {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請先選擇合約種類-", ""));
        }
    }
    void Warranty()
    {
        DDL_Warranty.Items.Clear();
        DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
        DDL_Warranty.Items.Add(new ListItem("合約規定完工日期"));
        DDL_Warranty.Items.Add(new ListItem("合約規定完工日曆天數"));
        DDL_Warranty.Items.Add(new ListItem("合約規定完工工作天數"));
        DDL_Warranty.Items.Add(new ListItem("工地通知起算日曆天數"));
        DDL_Warranty.Items.Add(new ListItem("協商完工期限"));
        DDL_Warranty.Items.Add(new ListItem("縣市政府特殊條款"));
        DDL_Warranty.SelectedIndex = 2;
    }

}