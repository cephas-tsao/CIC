using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EReallocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Radio_Ref_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((Radio_Ref.SelectedValue == "Private"))
        {
            Pnl_Execute.Visible = false;
            Pnl_Private.Visible = true;
        }
        else if ((Radio_Ref.SelectedValue == "Execute"))
        {
            Pnl_Execute.Visible = true;
            Pnl_Private.Visible = false;
        }
    }
}