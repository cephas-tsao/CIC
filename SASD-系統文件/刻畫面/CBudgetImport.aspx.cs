using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CBudgetImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Pnl_XML.Visible = true;
        Pnl_EXCEL.Visible = true;
        Panel1.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_XML.Visible == false))
        {
            Pnl_XML.Visible = true;
            Pnl_EXCEL.Visible = false;
        }
        else
        {
            Pnl_XML.Visible = false;
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        if ((Pnl_EXCEL.Visible == false))
        {
            Pnl_EXCEL.Visible = true;
            Pnl_XML.Visible = false;
        }
        else {
            Pnl_EXCEL.Visible = false;
        }

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Panel1.Visible == false))
        {
            Panel1.Visible = true;
            Panel1.Visible = false;
        }
        else
        {
            Panel1.Visible = false;
        }
    }
}