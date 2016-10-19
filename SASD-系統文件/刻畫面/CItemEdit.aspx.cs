using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CItemEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((DropDownList29.SelectedValue == "workitem"))
        { Button1.Enabled = true; }
        else
        { Button1.Enabled = false; }
    }

    protected void DropDownList29_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList29.SelectedValue == "workitem"))
        { Button1.Enabled = true; }
        else
        { Button1.Enabled = false; }
    }
}