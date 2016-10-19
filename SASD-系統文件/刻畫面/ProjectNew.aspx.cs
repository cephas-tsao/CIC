using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList1.SelectedValue == "1"))
        { 
            Pnl_1.Visible = true;
            Pnl_2.Visible = false;
        }
        else if((RadioButtonList1.SelectedValue == "2"))
        {
            Pnl_1.Visible = false;
            Pnl_2.Visible = true;
        }
    }
}