using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BidSum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 1))
        {
            RadioButtonList3.Enabled = true;
            TextBox97.Enabled = true;
        }
        else
        {
            RadioButtonList3.Enabled = false;
            TextBox97.Enabled = false;
        }
    }
}