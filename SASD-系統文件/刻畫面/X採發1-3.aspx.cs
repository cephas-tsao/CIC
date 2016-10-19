using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class X採發1_3 : System.Web.UI.Page
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
        else
        {
            CheckBox7.Checked = false;
            CheckBox8.Checked = false;
            CheckBox7.Enabled = true;
            CheckBox8.Enabled = true;
            TextBox9.Enabled = true;
            TextBox10.Enabled = true;
        }

    }
    protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
    {
        if ((CheckBox9.Checked == true))
        {
            Panel1.Visible = true;
            CheckBox1.Checked = true;
            CheckBox1.Enabled = false;
            CheckBox2.Checked = true;
            CheckBox2.Enabled = false;
            CheckBox3.Checked = true;
            CheckBox3.Enabled = false;
            CheckBox4.Checked = true;
            CheckBox4.Enabled = false;
            CheckBox5.Checked = true;
            CheckBox5.Enabled = false;
            CheckBox6.Checked = true;
            CheckBox6.Enabled = false;
            CheckBox7.Checked = true;
            CheckBox7.Enabled = false;
            CheckBox8.Checked = true;
            CheckBox8.Enabled = false;
            TextBox8.Text = "";
            TextBox8.Enabled = false;
            TextBox9.Text = "";
            TextBox9.Enabled = false;
            TextBox10.Text = "";
            TextBox10.Enabled = false;
            TextBox11.Text = "";
            TextBox11.Enabled = false;
            TextBox12.Text = "";
            TextBox12.Enabled = false;
            TextBox13.Text = "";
            TextBox13.Enabled = false;
            TextBox14.Text = "";
            TextBox14.Enabled = false;
            TextBox15.Text = "";
            TextBox15.Enabled = false;
        }
        else
        {
            Panel1.Visible = false;
            CheckBox1.Checked = false;
            CheckBox1.Enabled = true;
            CheckBox2.Checked = false;
            CheckBox2.Enabled = true;
            CheckBox3.Checked = false;
            CheckBox3.Enabled = true;
            CheckBox4.Checked = false;
            CheckBox4.Enabled = true;
            CheckBox5.Checked = false;
            CheckBox5.Enabled = true;
            CheckBox6.Checked = false;
            CheckBox6.Enabled = true;
            CheckBox7.Checked = false;
            CheckBox7.Enabled = true;
            CheckBox8.Checked = false;
            CheckBox8.Enabled = true;
            TextBox8.Enabled = true;
            TextBox9.Enabled = true;
            TextBox10.Enabled = true;
            TextBox11.Enabled = true;
            TextBox12.Enabled = true;
            TextBox13.Enabled = true;
            TextBox14.Enabled = true;
            TextBox15.Enabled = true;
        }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 0))
        {
            Pnl_WBS.Visible = true;
            Pnl_Resource.Visible = false;
        }
        else if ((RadioButtonList2.SelectedIndex == 1))
        {
            Pnl_WBS.Visible = false;
            Pnl_Resource.Visible = true;
        }
    }
    protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_Analysis.Visible = true;
        Pnl_Analysis2.Visible = false;
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
    protected void ImageButton31_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_Analysis.Visible = false;
        Pnl_Analysis2.Visible = true;
    }
    protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    {
        if ((CheckBox15.Checked == true))
        {
            Panel2.Visible = true;
            CheckBox16.Checked = true;
            CheckBox16.Enabled = false;
            CheckBox19.Checked = true;
            CheckBox19.Enabled = false;
            CheckBox20.Checked = true;
            CheckBox20.Enabled = false;
            CheckBox21.Checked = true;
            CheckBox21.Enabled = false;
            CheckBox23.Checked = true;
            CheckBox23.Enabled = false;
            TextBox23.Text = "";
            TextBox23.Enabled = false;
            TextBox26.Text = "";
            TextBox26.Enabled = false;
            TextBox27.Text = "";
            TextBox27.Enabled = false;
            TextBox28.Text = "";
            TextBox28.Enabled = false;
            TextBox30.Text = "";
            TextBox30.Enabled = false;
        }
        else {
            Panel2.Visible = false;
            CheckBox16.Checked = false;
            CheckBox16.Enabled = true;
            CheckBox19.Checked = false;
            CheckBox19.Enabled = true;
            CheckBox20.Checked = false;
            CheckBox20.Enabled = true;
            CheckBox21.Checked = false;
            CheckBox21.Enabled = true;
            CheckBox23.Checked = false;
            CheckBox23.Enabled = true;
            TextBox23.Enabled = true;
            TextBox26.Enabled = true;
            TextBox27.Enabled = true;
            TextBox28.Enabled = true;
            TextBox30.Enabled = true;
        }
    }
}