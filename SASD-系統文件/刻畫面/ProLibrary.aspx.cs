using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProLibrary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Add.Visible == true))
        {
            Pnl_Add.Visible = false;
        }
        else if ((Pnl_Add.Visible == false))
        {
            Pnl_Add.Visible = true;
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if ((Pnl_Import.Visible == true))
        {
            Pnl_Import.Visible = false;
        }
        else if ((Pnl_Import.Visible == false))
        {
            Pnl_Import.Visible = true;
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_Search.Visible == true))
        {
            Pnl_Search.Visible = false;
        }
        else if ((Pnl_Search.Visible == false))
        {
            Pnl_Search.Visible = true;
        }
    }
    
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Pnl_Edit.Visible = true;
    }
}