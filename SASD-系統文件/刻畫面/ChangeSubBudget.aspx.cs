using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeSubBudget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_main.Visible == true))
        {
            Pnl_main.Visible = false;
        }
        else
        {
            Pnl_main.Visible = true;
        }
    }
    protected void LinkButton36_Click(object sender, EventArgs e)
    {
        if ((Pnl_Material.Visible == true))
        {
            Pnl_Material.Visible = false;
        }
        else
        {
            Pnl_Material.Visible = true;
        }
    }
    protected void Button42_Click(object sender, EventArgs e)
    {
        Pnl_SubContract.Visible = true;
    }
}