using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CBudgetLayerSet : System.Web.UI.Page
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
}