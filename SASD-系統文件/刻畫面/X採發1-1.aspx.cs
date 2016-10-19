using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class X採發1_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ProjectCode"] = "104CIC001";
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if ((CheckBox1.Checked == true))
        {
            CheckBox7.Checked = true;
            CheckBox8.Checked = true;
            CheckBox7.Enabled = false;
            CheckBox8.Enabled = false;
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox9.Enabled = false;
            TextBox10.Enabled = false;
        }
        else {
            CheckBox7.Checked = false;
            CheckBox8.Checked = false;
            CheckBox7.Enabled = true;
            CheckBox8.Enabled = true;
            TextBox9.Enabled = true;
            TextBox10.Enabled = true;
        }

    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 0)) {
            Pnl_WBS.Visible = true;
            Pnl_Resource.Visible = false;
        }
        else if ((RadioButtonList2.SelectedIndex == 1)) {
            Pnl_WBS.Visible = false;
            Pnl_Resource.Visible = true;
        }
    }
    protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_Analysis.Visible = true;
        Pnl_ItemPack.Visible = false;
    }
    protected void ImageButton52_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_SourceList.Visible = true;
    }
    protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    {
        if ((CheckBox10.Checked == true))
        {
            CheckBox11.Enabled = false;
            CheckBox11.Checked = true;
            CheckBox14.Enabled = false;
            CheckBox14.Checked = true;
            TextBox18.Text = "200";
            TextBox18.Enabled = false;
            TextBox21.Text = "81.25";
            TextBox21.Enabled = false;
        }
        else
        {
            CheckBox11.Enabled = true;
            CheckBox11.Checked = false;
            CheckBox14.Enabled = true;
            CheckBox14.Checked = false;
            TextBox18.Text = "";
            TextBox18.Enabled = true;
            TextBox21.Text = "";
            TextBox21.Enabled = true;
        }
    }
    protected void ImageButton84_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_ItemPack.Visible = true;
        Pnl_Analysis.Visible = false;
    }
}