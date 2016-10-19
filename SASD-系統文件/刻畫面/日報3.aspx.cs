using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 日報3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DDL_Year.SelectedValue = DateTime.Now.ToString("yyyy");
    }
}