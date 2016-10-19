using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BidJointE : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LBtn_Add_Click(object sender, EventArgs e)
    {
        if ((Panel1.Visible == true))
        { Panel1.Visible = false; }
        else { Panel1.Visible = true; }
    }
}