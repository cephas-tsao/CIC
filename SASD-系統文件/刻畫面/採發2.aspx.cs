using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 採發2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList8.Items.Clear();
        DropDownList8.Items.Add("-請選擇部門人員-");
    }
    protected void Function1()
    {
        //DropDownList7.SelectedValue = "採購部";
        //DropDownList7.SelectedIndex = 1;
        //DropDownList8.SelectedValue = "陳小華";
    }
    
    protected void Button38_Click(object sender, EventArgs e)
    {
        Pnl_SC.Visible = true;
        Function1();
    }
}