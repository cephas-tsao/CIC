using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 採發3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Material.Visible == true))
        {
            Pnl_Material.Visible = false;
        }
        else {
            Pnl_Material.Visible = true;
        }
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
    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        if ((CheckBox7.Checked == true))
        { 
            TextBox6.Visible = true;
            TextBox6.Text = "";
        }
        else {
            TextBox6.Visible = false;
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_attach.Visible == true))
        {
            Pnl_attach.Visible = false;
        }
        else
        {
            Pnl_attach.Visible = true;
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
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if ((Pnl_firm.Visible == true))
        {
            Pnl_firm.Visible = false;
        }
        else
        {
            Pnl_firm.Visible = true;
        }
    }
    protected void DDL_Op3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_Op3.SelectedIndex == 2))
        {
            TextBox87.Visible = true;
            TextBox87.Text = "";
        }
        else {
            TextBox87.Visible = false;
        }
    }
    protected void Button38_Click(object sender, EventArgs e)
    {
        Pnl_IAdd.Visible = true;
    }
}