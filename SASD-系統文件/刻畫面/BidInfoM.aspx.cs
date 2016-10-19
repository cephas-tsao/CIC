using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BidInfoM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LBtn_1_Click(object sender, EventArgs e)
    {
        if ((Pnl_1.Visible == true))
        { Pnl_1.Visible=false;}
        else
        {Pnl_1.Visible=true;}
    }
    protected void LBtn_2_Click(object sender, EventArgs e)
    {
        if ((Pnl_2.Visible == true))
        { Pnl_2.Visible = false; }
        else
        { Pnl_2.Visible = true; }
    }
    protected void LBtn_3_Click(object sender, EventArgs e)
    {
        if ((Pnl_3.Visible == true))
        { Pnl_3.Visible = false; }
        else
        { Pnl_3.Visible = true; }
    }
    protected void LBtn_4_Click(object sender, EventArgs e)
    {
        if ((Pnl_4.Visible == true))
        { Pnl_4.Visible = false; }
        else
        { Pnl_4.Visible = true; }
    }
}