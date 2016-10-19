using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 計價4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TB_Date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        Session["PID"] = "1";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Insert.Visible == true))
        {
            Pnl_Insert.Visible = false;
        }
        else { Pnl_Insert.Visible = true; }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_View.Visible == true))
        {
            Pnl_View.Visible = false;
        }
        else { Pnl_View.Visible = true; }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Pnl_1.Visible = true;
        Session["SCID"] = DropDownList1.SelectedValue;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Pnl_Update.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        double x = Convert.ToDouble(TB_Price.Text)*0.05;
        TB_Tax.Text = Convert.ToString(x);
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        double x = Convert.ToDouble(TB_Price.Text) + Convert.ToDouble(TB_Tax.Text);
        TB_SumPrice.Text = Convert.ToString(x);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        double x = Convert.ToDouble(TB_Price0.Text) * 0.05;
        TB_Tax0.Text = Convert.ToString(x);
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        double x = Convert.ToDouble(TB_Price0.Text) + Convert.ToDouble(TB_Tax0.Text);
        TB_SumPrice0.Text = Convert.ToString(x);
    }
}