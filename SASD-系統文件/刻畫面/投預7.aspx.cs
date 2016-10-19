using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 投預7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Pnl_Detail.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Pnl_Firm.Visible = true;
        Pnl_Detail.Visible = false;
    }
}