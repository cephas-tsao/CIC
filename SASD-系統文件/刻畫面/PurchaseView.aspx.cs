using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PurchaseView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_attach.Visible == true))
        {
            Pnl_attach.Visible = false;
        }
        else
        {
            Pnl_attach.Visible = true;
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if ((Pnl_file.Visible == true))
        {
            Pnl_file.Visible = false;
        }
        else
        {
            Pnl_file.Visible = true;
        }
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
    protected void LinkButton34_Click(object sender, EventArgs e)
    {
        if ((Pnl_pay.Visible == true))
        {
            Pnl_pay.Visible = false;
        }
        else
        {
            Pnl_pay.Visible = true;
        }
    }
    protected void LinkButton35_Click(object sender, EventArgs e)
    {
        if ((Pnl_file0.Visible == true))
        {
            Pnl_file0.Visible = false;
        }
        else
        {
            Pnl_file0.Visible = true;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_InviteQ.Visible == true))
        {
            Pnl_InviteQ.Visible = false;
        }
        else
        {
            Pnl_InviteQ.Visible = true;
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
    protected void Button44_Click(object sender, EventArgs e)
    {
        MultiView.Visible = true;
    }
    protected void Button42_Click(object sender, EventArgs e)
    {
        Pnl_Detail.Visible = true;
    }
}