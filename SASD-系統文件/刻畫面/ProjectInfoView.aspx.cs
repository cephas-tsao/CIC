using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectInfoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }
    protected void LBtn_1_Click(object sender, EventArgs e)
    {
        if ((Pnl_1.Visible == true))
        { Pnl_1.Visible = false; }
        else
        { Pnl_1.Visible = true; }
    }
    protected void LBtn_2_Click(object sender, EventArgs e)
    {
        if ((Pnl_2.Visible == true))
        { Pnl_2.Visible = false; }
        else
        { Pnl_2.Visible = true; }
    }

    protected void ImageButton178_Click(object sender, ImageClickEventArgs e)
    {
        GridView1.DataSourceID = "";
    }
    protected void ImageButton179_Click(object sender, ImageClickEventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
    }
}