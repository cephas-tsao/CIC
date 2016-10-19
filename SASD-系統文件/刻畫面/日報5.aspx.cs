using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 日報5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button34_Click(object sender, EventArgs e)
    {
        Pnl_Result.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Search.Visible == true))
        {
            Pnl_Search.Visible = false;
        }
        else
        {
            Pnl_Search.Visible = true;
        }
    }
    protected void Button36_Click(object sender, EventArgs e)
    {
        Pnl_Detail.Visible = true;
    }
}