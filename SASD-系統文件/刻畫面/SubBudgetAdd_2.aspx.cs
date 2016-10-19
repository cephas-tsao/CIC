using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubBudgetAdd_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "13";
    }


    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 0))
        {
            Pnl_WBS.Visible = true;
            Pnl_Resource.Visible = false;
        }
        else if ((RadioButtonList2.SelectedIndex == 1))
        {
            Pnl_WBS.Visible = false;
            Pnl_Resource.Visible = true;
        }
    }

    protected void ImageButton52_Click(object sender, ImageClickEventArgs e)
    {
        Pnl_Source.Visible = true;
        if ((RadioButtonList3.SelectedValue == "All"))
        {
            Pnl_List.Visible = false;
        }
        else if ((RadioButtonList3.SelectedValue == "Part"))
        {
            Pnl_List.Visible = true;
        }
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList8.Items.Clear();
        DropDownList8.Items.Add("-請選擇部門人員-");
    }

    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList3.SelectedValue == "All"))
        {
            Pnl_List.Visible = false;
        }
        else if ((RadioButtonList3.SelectedValue == "Part"))
        {
            Pnl_List.Visible = true;
        }
    }
}
