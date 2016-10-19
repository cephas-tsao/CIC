using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 投管1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_HideSelect_Click(object sender, EventArgs e)
    {
        if ((Btn_HideSelect.Text == "隱藏搜尋面板"))
        {
            Btn_HideSelect.Text = "顯示搜尋面板";
            Pnl_Select.Visible = false;
        }
        else if ((Btn_HideSelect.Text == "顯示搜尋面板")) 
        {
            Btn_HideSelect.Text = "隱藏搜尋面板";
            Pnl_Select.Visible = true;
        }
    }
    protected void DDL_Op5_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_Op5.SelectedValue == "Between"))
        {
            TB_Select4.Visible = true;
        }
        else {
            TB_Select4.Visible = false;
        }
    }

    protected void Btn_All_Click(object sender, EventArgs e)
    {
        LB_Title.Text = "標案總覽";
        GridView1.DataSourceID = "SqlAll";
        GridView1.DataBind();
    }
    protected void Btn_SelectGO_Click(object sender, EventArgs e)
    {
        /*string x = "SELECT BidM0.BID, BidM0.BidName AS 標案名稱, BidM0.Status AS 標案狀態, BidM2.EngLocation AS 工程所在地, " +
                            "BidM2.OwnerName AS 業主名稱, BidM2.OpenBidTime AS 開標時間, BidM2.BudgetAmount AS 預算金額, " +
                            "BidM4.EngType AS 工程區分, BidM4.EngClass AS 工程分類, BidM5.ApprovedPrice AS 核定標價, " +
                            "BidAssess.Result AS 標案評估, BidRecord.Result AS 決標紀錄 " +
                 "FROM BidM0 FULL OUTER JOIN " +
                            "BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN " +
                            "BidM2 ON BidM0.BID = BidM2.BID FULL OUTER JOIN " +
                            "BidM4 ON BidM0.BID = BidM4.BID FULL OUTER JOIN " +
                            "BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN " +
                            "BidRecord ON BidM0.BID = BidRecord.BID " +
                 "WHERE ";*/
        string x = SqlSelect.SelectCommand + " WHERE ";
        string xx = "依 ";
        string Key1 = TB_Select1.Text.Trim();
        string Key2 = TB_Select2.Text.Trim();
        string Status = DDL_Select1.SelectedValue;
        string City = DDL_Select3.SelectedValue;
        try
        {
            int Price1 = Convert.ToInt32(TB_Select3.Text.Trim());
        }
        catch { }
        try
        {
            int Price2 = Convert.ToInt32(TB_Select4.Text.Trim());
        }
        catch { }
        string Op1 = DDL_Op1.SelectedValue;
        string Op2 = DDL_Op2.SelectedValue;
        string Op3 = DDL_Op3.SelectedValue;
        string OpKey = DDL_Op4.SelectedValue;
        string OpPrice = DDL_Op5.SelectedValue;
        string Op1T =DDL_Op1.SelectedItem.Text;
        string Op2T =DDL_Op2.SelectedItem.Text;
        string Op3T =DDL_Op3.SelectedItem.Text;
        string OpKeyT =DDL_Op4.SelectedItem.Text;
        string OpPriceT =DDL_Op5.SelectedItem.Text;
        //僅寫好關鍵字判斷部分，需重寫
        if ((Key1 != "")){
            if((Key2!="")){
                x = x + "BidM0.BidName like '%" + Key1 + "%' " + OpKey + " BidM0.BidName like '%" + Key2 +"%'";
                xx = xx + "標案名稱=(關鍵字)" + Key1 + " " + OpKeyT + " 標案名稱=(關鍵字)" + Key2;
            }
            else{
                x = x + "BidM0.BidName like '%" + Key1 +"%'" ;
                xx = xx + "標案名稱=(關鍵字)" + Key1;
            }
        }
        else { 
            if((Key2!="")){
                x = x + "BidM0.BidName like '%" + Key2 +"%'";
                xx = xx + "標案名稱=(關鍵字)" + Key2;
            }
        }
        //////////////////////////////////////////////////////////
        xx = xx + " 之搜尋結果";
        LB_Title.Text = xx;
        //SqlSelect.ConnectionString = "Data Source=140.118.105.228\SQLEXPRESS;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
        SqlSelect.SelectCommand = x;
        GridView1.DataSourceID = "SqlSelect";
        GridView1.DataBind();
    }
}