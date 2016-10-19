using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 合預1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_XML.Visible == false))
        {
            Pnl_XML.Visible = true;
            Pnl_Bid.Visible = false;
        }
        else
        {
            Pnl_XML.Visible = false;
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if ((Pnl_Bid.Visible == false))
        {
            Pnl_Bid.Visible = true;
            Pnl_XML.Visible = false;
        }
        else {
            Pnl_Bid.Visible = false;
        }

    }
}