using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 竣工3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "13";
    }
    protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList4.SelectedIndex == 1))
        {
            TB_ResultNO.Visible = true;
        }
        else {
            TB_ResultNO.Visible = false;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if ((Pnl_Add.Visible == true))
        {
            Pnl_Add.Visible = false;
        }
        else {
            Pnl_Add.Visible = true;
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if ((Pnl_View.Visible == true))
        {
            Pnl_View.Visible = false;
        }
        else {
            Pnl_View.Visible = true;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Pnl_Detail.Visible = true;
        if ((RadioButtonList8.SelectedIndex == 1))
        {
            TB_ResultNO2.Visible = true;
        }
        else
        {
            TB_ResultNO2.Visible = false;
        }
    }
    protected void RadioButtonList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList8.SelectedIndex == 1))
        {
            TB_ResultNO2.Visible = true;
        }
        else
        {
            TB_ResultNO2.Visible = false;
        }
    }
}