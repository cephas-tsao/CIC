using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS
{
    public partial class FirmData : System.Web.UI.Page
    {
        string UID = SystemSet.GetRequestSet("UID");
        protected void Page_Load(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "SELECT SubContract_Main.SCID,ProjectM0.ProjectCode AS 專案編號, ProjectM0.ProjectName AS 專案名稱, ProjectM0.ProjectStatus AS 專案狀態, SubContract_Main.SC_Code AS 分包合約編號, "+
            "SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總金額, SubContract_Main.LastTotalPrice AS 末次追加減後總金額, SubContract_Main.ContractType AS 分包合約種類, MAX(FFund_Main.FF_Edition) AS 已計價次數,"+
            "SUM(FFund_Main.Item12) AS 已計價金額, Firm_Check.FirstResult, Firm_Check.SecondResult FROM Firm_Check RIGHT OUTER JOIN SubContract_Main ON Firm_Check.SCID = SubContract_Main.SCID LEFT OUTER JOIN ProjectM0 ON "+
            "SubContract_Main.PID = ProjectM0.PID LEFT OUTER JOIN FFund_Main ON SubContract_Main.SCID = FFund_Main.SCID WHERE SubContract_Main.FirmID = " + UID + "  GROUP BY SubContract_Main.SCID,FFund_Main.SCID, ProjectM0.ProjectCode, "+
            "ProjectM0.ProjectName, ProjectM0.ProjectStatus, SubContract_Main.SC_Code, SubContract_Main.SC_Name, SubContract_Main.TotalPrice, SubContract_Main.LastTotalPrice, SubContract_Main.ContractType, Firm_Check.FirstResult, "+
            "Firm_Check.SecondResult   ORDER BY FFund_Main.SCID DESC";
        if(!IsPostBack)
        {
            string SQLselect = "Select * from FirmM where UID=" + UID;
            string SQLselect1 = "Select * from Firm_Assess where FirmID=" + UID;
            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLselect);
            DataTable Dtvs1 = WebModel.LoadSetContentData(database, SQLselect1);
            if (Dtvs != null && Dtvs.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs.Rows)
                {
                    LbFirmName.Text = row["Name"].ToString();
                    LbType.Text = row["Type"].ToString();
                    LbSupportItem.Text = row["SupportItem"].ToString();
                    LbNo.Text = row["EIN"].ToString();
                    LbName.Text = row["Owner"].ToString();
                    LbRphone.Text = row["OwnerMobile"].ToString();
                    LbCapital.Text = row["Capital"].ToString();
                    LbStaff.Text = row["StaffAmount"].ToString();
                    LbPhone1.Text = row["Tel1"].ToString();
                    LbPhone2.Text = row["Tel2"].ToString();
                    LbFax1.Text = row["Fax1"].ToString();
                    LbFax2.Text = row["Fax2"].ToString();
                    LbEmail.Text = row["Email"].ToString();
                    LbAddress.Text = row["ContectAddress"].ToString();
                    LbNotes.Text = row["Notes"].ToString();
                    LbCAddress.Text = row["RegisteredAddress"].ToString();


                }
            }

            if (Dtvs1 != null && Dtvs1.Rows.Count > 0)
            {

                foreach (DataRow row in Dtvs1.Rows)
                {
                    LbItem1.Text = row["Item1"].ToString() == "16" ? ">20萬" : row["Item1"].ToString() == "12" ? "19萬~10萬" : row["Item1"].ToString() == "10" ? "9萬~5萬" : row["Item1"].ToString() == "6" ? "5萬以下" : "";
                    LbItem2.Text = row["Item2"].ToString() == "16" ? ">50人" : row["Item2"].ToString() == "12" ? "49人~20人" : row["Item2"].ToString() == "10" ? "19人~5人" : row["Item2"].ToString() == "6" ? "5人以下" : "";
                    LbItem3.Text = row["Item3"].ToString() == "16" ? "特殊工法" : row["Item3"].ToString() == "12" ? "獨到功夫" : row["Item3"].ToString() == "10" ? "特別見解" : row["Item3"].ToString() == "6" ? "尚可" : "";
                    LbItem4.Text = row["Item4"].ToString() == "16" ? "充分" : row["Item4"].ToString() == "12" ? "齊全" : row["Item4"].ToString() == "10" ? "尚可" : row["Item4"].ToString() == "6" ? "欠佳" : "";
                    LbItem5.Text = row["Item5"].ToString() == "16" ? "制度良好" : row["Item5"].ToString() == "12" ? "執行認真" : row["Item5"].ToString() == "10" ? "尚可" : row["Item5"].ToString() == "6" ? "欠佳" : "";
                    LbItem6.Text = row["Item6"].ToString() == "16" ? "有競爭力" : row["Item6"].ToString() == "12" ? "合理" : row["Item6"].ToString() == "10" ? "有折扣" : row["Item6"].ToString() == "6" ? "太高" : "";

                    LbItemNote1.Text = row["ItemNote1"].ToString();
                    LbItemNote2.Text = row["ItemNote2"].ToString();
                    LbItemNote3.Text = row["ItemNote3"].ToString();
                    LbItemNote4.Text = row["ItemNote4"].ToString();
                    LbItemNote5.Text = row["ItemNote5"].ToString();
                    LbItemNote6.Text = row["ItemNote6"].ToString();
                    LbTotalScore.Text = row["TotalScore"].ToString();
                    LbFirstResult.Text = row["FirstResult"].ToString();
                    LbFirstRater.Text = row["FirstRater"].ToString();
                    LbFirstDate.Text = row["FirstDate"].ToString();
                    LbFirstNote.Text = row["FirstNote"].ToString();
                    LbSecondResult.Text = row["SecondResult"].ToString();
                    LbSecondRater.Text = row["SecondRater"].ToString();
                    LbSecondDate.Text = row["SecondDate"].ToString();
                    LbSecondNote.Text = row["SecondNote"].ToString();

                }
            }

        }
        }
        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView5.PageSize;
            string database = Session["DatabaseName"].ToString();

            if (e.CommandName == "select")
            {
                Pnl_Ckeck.Visible = true;
                string SCID = ((Label)GridView5.Rows[ID_class].FindControl("SCID")).Text.Trim();

                string SQLSelect = "Select * from Firm_Check where SCID=" + SCID;
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                LbAItem1.Text = "";
                LbAItem2.Text = "";
                LbAItem3.Text = "";
                LbAItem4.Text = "";
                LbAItem5.Text = "";
                LbAItem6.Text = "";

                LbAItemNote1.Text = "";
                LbAItemNote2.Text = "";
                LbAItemNote3.Text = "";
                LbAItemNote4.Text = "";
                LbAItemNote5.Text = "";
                LbAItemNote6.Text = "";
                LbATotalScore.Text = "";
                LbAFirstResult.Text = "";
                LbAFirstRater.Text = "";
                LbAFirstDate.Text = "";
                LbAFirstNote.Text = "";
                LbASecondResult.Text = "";
                LbASecondRater.Text = "";
                LbASecondDate.Text = "";
                LbASecondNote.Text = "";
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        LbAItem1.Text = row["Item1"].ToString() == "16" ? "優" : row["Item1"].ToString() == "12" ? "良" : row["Item1"].ToString() == "8" ? "可" : row["Item1"].ToString() == "4" ? "差" : row["Item1"].ToString() == "0" ? "劣" : "";
                        LbAItem2.Text = row["Item2"].ToString() == "16" ? "優" : row["Item2"].ToString() == "12" ? "良" : row["Item2"].ToString() == "8" ? "可" : row["Item2"].ToString() == "4" ? "差" : row["Item2"].ToString() == "0" ? "劣" : "";
                        LbAItem3.Text = row["Item3"].ToString() == "16" ? "優" : row["Item3"].ToString() == "12" ? "良" : row["Item3"].ToString() == "8" ? "可" : row["Item3"].ToString() == "4" ? "差" : row["Item3"].ToString() == "0" ? "劣" : "";
                        LbAItem4.Text = row["Item4"].ToString() == "16" ? "優" : row["Item4"].ToString() == "12" ? "良" : row["Item4"].ToString() == "8" ? "可" : row["Item4"].ToString() == "4" ? "差" : row["Item4"].ToString() == "0" ? "劣" : "";
                        LbAItem5.Text = row["Item5"].ToString() == "16" ? "優" : row["Item5"].ToString() == "12" ? "良" : row["Item5"].ToString() == "8" ? "可" : row["Item5"].ToString() == "4" ? "差" : row["Item5"].ToString() == "0" ? "劣" : "";
                        LbAItem6.Text = row["Item6"].ToString() == "16" ? "優" : row["Item6"].ToString() == "12" ? "良" : row["Item6"].ToString() == "8" ? "可" : row["Item6"].ToString() == "4" ? "差" : row["Item6"].ToString() == "0" ? "劣" : "";

                        LbAItemNote1.Text = row["ItemNote1"].ToString();
                        LbAItemNote2.Text = row["ItemNote2"].ToString();
                        LbAItemNote3.Text = row["ItemNote3"].ToString();
                        LbAItemNote4.Text = row["ItemNote4"].ToString();
                        LbAItemNote5.Text = row["ItemNote5"].ToString();
                        LbAItemNote6.Text = row["ItemNote6"].ToString();
                        LbATotalScore.Text = row["TotalScore"].ToString();
                        LbAFirstResult.Text = row["FirstResult"].ToString();
                        LbAFirstRater.Text = row["FirstRater"].ToString();
                        LbAFirstDate.Text = row["FirstDate"].ToString();
                        LbAFirstNote.Text = row["FirstNote"].ToString();
                        LbASecondResult.Text = row["SecondResult"].ToString();
                        LbASecondRater.Text = row["SecondRater"].ToString();
                        LbASecondDate.Text = row["SecondDate"].ToString();
                        LbASecondNote.Text = row["SecondNote"].ToString();

                    }



                }




            }
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label 分包合約總金額 = (Label)e.Row.FindControl("分包合約總金額");
                Label 末次追加減後總金額 = (Label)e.Row.FindControl("末次追加減後總金額");
                Label 已計價金額 = (Label)e.Row.FindControl("已計價金額");


                分包合約總金額.Text = 分包合約總金額.Text != "" ? decimal.Parse(分包合約總金額.Text).ToString("N0") : "";
                末次追加減後總金額.Text = 末次追加減後總金額.Text != "" ? decimal.Parse(末次追加減後總金額.Text).ToString("N0") : "";
                已計價金額.Text = 已計價金額.Text != "" ? decimal.Parse(已計價金額.Text).ToString("N0") : "";

            }
        }
    }

}