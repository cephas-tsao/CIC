using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class X投預1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox3.Text = "TEST";
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonList1.SelectedIndex)
        {
            case 0:
                Pnl_Build.Visible = true;
                Pnl_ExcelDIY.Visible = false;
                Pnl_XML.Visible = false;
                break;
            case 1:
                Pnl_Build.Visible = false;
                Pnl_ExcelDIY.Visible = true;
                Pnl_XML.Visible = false;
                break;
            case 2:
                Pnl_Build.Visible = false;
                Pnl_ExcelDIY.Visible = false;
                Pnl_XML.Visible = true;
                break;
        }
    }
    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    { 
        if ((RadioButtonList3.SelectedIndex == 1)) {
            DropDownList2.Enabled = true;
        }
        else {
            DropDownList2.Enabled = false;
        }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((RadioButtonList2.SelectedIndex == 1))
        {
            DropDownList5.Enabled = true;
        }
        else
        {
            DropDownList5.Enabled = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((Button1.Text == "階層及編號設定鎖定"))
        {
            Button1.Text = "已鎖定";
            Pnl_WBS.Visible = true;
            Pnl_LayerSet.Enabled=false;
        }
    }
    protected void DropDownList16_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList16.SelectedValue == "2"))
        { 
            Pnl_NewItem.Visible = true;
            DropDownList32.Enabled = true;
            TextBox3.Enabled = true;
        }
        else if ((DropDownList16.SelectedValue == "1")) { 
            Pnl_NewItem.Visible = false;
            DropDownList32.Enabled = false;
            TextBox3.Enabled = true;
        }
        else
        {
            Pnl_NewItem.Visible = false;
            DropDownList32.Enabled = false;
            TextBox3.Enabled =false;
        }
    }
    protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = TextBox21.Text;
        string y = DropDownList32.SelectedValue;
        string z = x;
        if ((x == ""))
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            { z = y+x; }
        }
        else
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            {
                if ((y != x.Substring(0, 1)))
                {
                    if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                    { z = y + x.Substring(1, x.Length - 1); }
                    else { z = y + x; }
                }

            }
            else if ((DropDownList32.SelectedValue == "X"))
            {
                if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                { z = x.Substring(1, x.Length - 1); }
                else { z = x; }
            }
        }
        TextBox21.Text = z;
        if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
        {
            DropDownList31.SelectedValue = "0";
            DropDownList31.Enabled = false;
        }
        else 
        {
            DropDownList31.SelectedIndex = 0;
            DropDownList31.Enabled = true;
        }
    }
    protected void DropDownList31_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList31.SelectedValue == "1"))
        {
            Button24.Enabled = true;
        }
        else { Button24.Enabled = false; }
    }
    protected void Button24_Click(object sender, EventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx","A");
    }

    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx", ImageButton7.ID);
    }

    public void OpenNewWindow(string url,string Tgr)
    {

        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx", ImageButton8.ID);
    }

}