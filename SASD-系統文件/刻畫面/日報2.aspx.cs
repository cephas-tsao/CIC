using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 日報2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "13";
        if (!IsPostBack){
        TB_Date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        TB_PicDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
        Pnl_No.Visible = true;
        Pnl_Yes.Visible = false;
        EnabledFalse();
        }
    }
    /*protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList5.SelectedIndex) { 
            case 0:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 1:
                Pnl_Note1.Visible = true;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 2:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = true;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 3:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = true;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 4:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = true;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 5:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = true;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 6:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = true;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 7:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = true;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 8:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = true;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = false;
                break;
            case 9:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = true;
                Pnl_Note10.Visible = false;
                break;
            case 10:
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                Pnl_Note3.Visible = false;
                Pnl_Note4.Visible = false;
                Pnl_Note5.Visible = false;
                Pnl_Note6.Visible = false;
                Pnl_Note7.Visible = false;
                Pnl_Note8.Visible = false;
                Pnl_Note9.Visible = false;
                Pnl_Note10.Visible = true;
                break;
        }
    }*/
    protected void LinkButton78_Click(object sender, EventArgs e)
    {
        if ((Pnl_L.Visible == true))
        {
            Pnl_L.Visible = false;
        }
        else {
            Pnl_L.Visible = true;
        }
    }
    protected void LinkButton79_Click(object sender, EventArgs e)
    {
        if ((Pnl_E.Visible == true))
        {
            Pnl_E.Visible = false;
        }
        else
        {
            Pnl_E.Visible = true;
        }
    }
    protected void LinkButton80_Click(object sender, EventArgs e)
    {
        if ((Pnl_M.Visible == true))
        {
            Pnl_M.Visible = false;
        }
        else
        {
            Pnl_M.Visible = true;
        }
    }
    protected void Button33_Click(object sender, EventArgs e)
    {
        Pnl_Pic.Visible = true;
    }
    protected void Button34_Click(object sender, EventArgs e)
    {
        Pnl_Yes.Visible = true;
        Pnl_No.Visible = false;
        EnabledTrue();
    }
    void EnabledFalse()
    {
        //Panel1.Enabled = false;
        Pnl_1Top.Enabled = false;
        //Pnl_AllNote.Enabled = false;
        Panel2.Enabled = false;
        Panel3.Enabled = false;
        Panel4.Enabled = false;
        Panel5.Enabled = false;
        Panel6.Enabled = false;
    }
    void EnabledTrue()
    {
        //Panel1.Enabled = true;
        Pnl_1Top.Enabled = true;
        //Pnl_AllNote.Enabled = true;
        Panel2.Enabled = true;
        Panel3.Enabled = true;
        Panel4.Enabled = true;
        Panel5.Enabled = true;
        Panel6.Enabled = true;
    }
    protected void TB_Date_TextChanged(object sender, EventArgs e)
    {
        Pnl_No.Visible = true;
        Pnl_Yes.Visible = false;
        EnabledFalse();
    }
    protected void Button23_Click(object sender, EventArgs e)
    {
        OpenNewWindow("DailyPicConItemLink.aspx","PID" );
    }
    public void OpenNewWindow(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=no,scrollbars=yes,resizable=yes,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
}