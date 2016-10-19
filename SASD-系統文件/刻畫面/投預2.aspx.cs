using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 投預2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["BID"] = "";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Add.Visible == true))
        {
            Pnl_Add.Visible = false;
        }
        else if ((Pnl_Add.Visible==false)) {
            Pnl_Add.Visible = true;
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_Import.Visible==true))
        {
            Pnl_Import.Visible = false;
        }
        else if ((Pnl_Import.Visible == false))
        {
            Pnl_Import.Visible = true;
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_Search.Visible == true))
        {
            Pnl_Search.Visible = false;
        }
        else if ((Pnl_Search.Visible == false))
        {
            Pnl_Search.Visible = true;
        }
    }
    protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = TextBox21.Text;
        string y = DropDownList32.SelectedValue;
        string z = x;
        if ((x == ""))
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            { z = y + x; }
        }
        else
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            {
                if ((y != x.Substring(0, 1)))
                {
                    if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                    { z = y + x.Substring(1, x.Length - 1); }
                    else { z = y + x; }
                }

            }
            else if ((DropDownList32.SelectedValue == "X"))
            {
                if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                { z = x.Substring(1, x.Length - 1); }
                else { z = x; }
            }
        }
        TextBox21.Text = z;
        if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
        {
            DropDownList31.SelectedValue = "0";
            DropDownList31.Enabled = false;
        }
        else
        {
            DropDownList31.SelectedIndex = 0;
            DropDownList31.Enabled = true;
        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["BID"] = DropDownList3.SelectedValue;
    }
}