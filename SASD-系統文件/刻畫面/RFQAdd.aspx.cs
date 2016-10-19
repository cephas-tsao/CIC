using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["BID"] = 9;
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList8.Items.Clear();
        DropDownList8.Items.Add("-請選擇部門人員-");
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        Pnl_OtherItem.Visible = true;
        Pnl_OtherBid.Visible = false;
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        Pnl_OtherBid.Visible = true;
        Pnl_OtherItem.Visible = false;
    }
    protected void Button25_Click(object sender, EventArgs e)
    {
        Pnl_OtherItem.Visible = false;
    }
    protected void Button28_Click(object sender, EventArgs e)
    {
        Pnl_OtherBid.Visible = false;
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
}