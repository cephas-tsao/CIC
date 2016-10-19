using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 採發1_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "13";
        if (!IsPostBack)
        {
            RadioButtonList2.SelectedIndex = 1;
        }
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
        Pnl_SourcePack.Visible = false;
        Pnl_SourcePack1.Visible = false;
    }
    
    protected void ImageButton84_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_ItemPack.Visible = true;
        Pnl_Analysis.Visible = false;
    }
    protected void ImageButton115_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_SourceList.Visible = false;
        Pnl_SourcePack.Visible = false;
        Pnl_SourcePack1.Visible = true;
    }
    protected void ImageButton136_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_SourceList.Visible = false;
        Pnl_SourcePack.Visible = true;
        Pnl_SourcePack1.Visible = false;
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList8.Items.Clear();
        DropDownList8.Items.Add("-請選擇部門人員-");
    }
}