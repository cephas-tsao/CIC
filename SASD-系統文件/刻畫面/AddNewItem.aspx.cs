using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNewItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["AddNew"] == "1"))
        {
            Pnl_WBS.Visible = true;
            Pnl_Analysis.Visible = false;
        }
        else if ((Session["AddNew"] == "2"))
        {
            Pnl_WBS.Visible = false;
            Pnl_Analysis.Visible = true;
        }
    }
    
}