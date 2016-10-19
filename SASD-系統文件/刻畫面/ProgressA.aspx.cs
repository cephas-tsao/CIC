using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProgressA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void IBtn_Draw_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script>window.open('Progress_A_Gantt.aspx','甘特圖',config='height=800,width=800,scrollbars=yes');</script>");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int Version = 5;
        int MaxVersion = 5;
        Pnl_Main.Visible = true;
        LB_Version.Visible = true;
        //LB_Version.Text = Version;
        Btn_DailyReload.Text = "載入日報資訊並更新至第" + Version + "版";
        Btn_DailyReloadNew.Text = "載入日報資訊並另存至第" + (MaxVersion + 1) + "版";
        Btn_Insert.Text = "新增至第" + Version + "版";
        Btn_InsertNew.Text = "另存至第" + (MaxVersion + 1) + "版";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        LB_Cal01.Visible = true;
        LB_Cal02.Visible = true;
        LB_CalAns.Visible = true;
        LB_CalAns.Text = "35.6";
    }
}