using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 包商2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Search.Visible == true))
        { Pnl_Search.Visible = false; }
        else { Pnl_Search.Visible = true; }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_Insert.Visible == true))
        { Pnl_Insert.Visible = false; }
        else { Pnl_Insert.Visible = true; }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Pnl_Edit.Visible = true;
    }
}