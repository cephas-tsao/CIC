using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FirmData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["FirmID"] = "13";
    }
    protected void Button38_Click(object sender, EventArgs e)
    {
        Pnl_Ckeck.Visible = true;
    }
}