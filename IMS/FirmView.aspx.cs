using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class FirmView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Search.Visible == true))
            { Pnl_Search.Visible = false; }
            else { Pnl_Search.Visible = true; }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Pnl_View.Visible = true;
            //Session["FirmID"] = "13";
        }
        protected void Button38_Click(object sender, EventArgs e)
        {
            Pnl_Ckeck.Visible = true;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFirmName.Text));
            string KeyWord1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSpecialty.Text));

            #region 搜尋條件


            string x = "select * from FirmM where ";
            string xx = "依 ";
            int[] SelectCondition = new int[5];
            for (int i = 0; i < 5; i++)
            {
                SelectCondition[i] = 0;
            }
            if (KeyWord.Trim() != "")
            {
                SelectCondition[1] = 1;
            }
            if (DDL_Select2.SelectedValue.ToString() != "0")
            {
                SelectCondition[2] = 1;
            }
            if (KeyWord1.Trim() != "")
            {
                //if (TB_Select32.Text.Trim() != "")
                //{
                //    SelectCondition[3] = 2;
                //}
                //else
                //{
                    SelectCondition[3] = 1;
                //}
            }
           
            if (DDL_Select4.SelectedValue.ToString() != "0")
            {
                SelectCondition[4] = 1;
            }
            for (int i = 1; i < 5; i++)
            {
                if (SelectCondition[i] != 0)
                {
                    if (SelectCondition[0] != 0)
                    {
                        DropDownList myDDL = (DropDownList)Pnl_Search.FindControl("DDL_Op" + SelectCondition[0].ToString());
                        //MsgBox(myDDL.ID);
                        x += myDDL.SelectedValue + " ";
                        xx += myDDL.SelectedItem.Text + " ";
                    }
                    switch (i)
                    {
                        case 1:
                            x += "Name like '%" + KeyWord.Trim() + "%' ";
                            xx += "[廠商名稱]=(關鍵字)" + KeyWord.Trim() + " ";
                            break;
                        case 2:
                            x += "Type ='" + DDL_Select2.SelectedValue.ToString() + "' ";
                            xx += "[廠商類型]=" + DDL_Select2.SelectedValue.ToString() + " ";
                            break;
                        case 3:
                            x += "SupportItem like '%" + KeyWord1.Trim() + "%' ";
                            xx += "[廠商專長/供給材料]=(關鍵字)" + KeyWord1.Trim() + " ";
                            //if (SelectCondition[i] == 2)
                            //{
                            //    //x += DDL_Op3in.SelectedValue.ToString() + " ";
                            //    //xx += DDL_Op3in.SelectedItem.Text + " ";
                            //    x += "SupportItem like '%" + TB_Select32.Text.Trim() + "%' ";
                            //    xx += "(關鍵字)" + TB_Select32.Text.Trim() + " ";
                            //}
                            break;
                        case 4:
                            x += "Location ='" + DDL_Select4.SelectedValue.ToString() + "' ";
                            xx += "[所在縣市]=" + DDL_Select4.SelectedValue.ToString() + " ";
                            break;
                    }
                    SelectCondition[0] = i;
                }
            }
            //if (SelectCondition[0] == 0)
            //{
            //    MsgBox("請至少輸入一種搜尋條件!");
            //}
            xx += "之搜尋結果";
            //LB_Status.Text = xx;
            //SqlDataSourceSelect.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (SelectCondition[0] != 0)
            {
                SqlDataSource6.SelectCommand = x;
            }
            else
            {
                SqlDataSource6.SelectCommand = "select * from FirmM ";
            }
         
            //GridView0.DataSourceID = "SqlDataSourceSelect";
            GridView4.DataBind();
       

            #endregion
        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView4.PageSize;
            string database = Session["DatabaseName"].ToString();

            if (e.CommandName == "select")
            {
                Pnl_View.Visible = true;
                string UID = ((Label)GridView4.Rows[ID_class].FindControl("UID")).Text.Trim();
                LbFirmName.Text = ((Label)GridView4.Rows[ID_class].FindControl("Name")).Text.Trim();
                LbType.Text = ((Label)GridView4.Rows[ID_class].FindControl("Type")).Text.Trim();
                LbSupportItem.Text = ((Label)GridView4.Rows[ID_class].FindControl("SupportItem")).Text.Trim();
                LbCounty.Text = ((Label)GridView4.Rows[ID_class].FindControl("Location")).Text.Trim();
                //LbBudgetPrice.Text = ((Label)GridView1.Rows[ID_class].FindControl("BudgetPrice")).Text.Trim();
                string SQLselect = "Select * from FirmM where UID=" + UID;
                string SQLselect1 = "Select * from Firm_Assess where FirmID=" + UID;
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLselect);
                DataTable Dtvs1 = WebModel.LoadSetContentData(database, SQLselect1);
                if (Dtvs != null && Dtvs.Rows.Count >0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
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
                LbItem1.Text =  "";
                LbItem2.Text =  "";
                LbItem3.Text =  "";
                LbItem4.Text =  "";
                LbItem5.Text =  "";
                LbItem6.Text =  "";

                LbItemNote1.Text = "";
                LbItemNote2.Text = "";
                LbItemNote3.Text = "";
                LbItemNote4.Text = "";
                LbItemNote5.Text = "";
                LbItemNote6.Text = "";
                LbTotalScore.Text = "";
                LbFirstResult.Text = "";
                LbFirstRater.Text = "";
                LbFirstDate.Text = "";
                LbFirstNote.Text = "";
                LbSecondResult.Text = "";
                LbSecondRater.Text = "";
                LbSecondDate.Text = "";
                LbSecondNote.Text = "";
                if (Dtvs1 != null && Dtvs1.Rows.Count >0)
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
                SqlDataSource1.SelectCommand = "SELECT SubContract_Main.SCID,ProjectM0.ProjectCode AS 專案編號, ProjectM0.ProjectName AS 專案名稱, ProjectM0.ProjectStatus AS 專案狀態, SubContract_Main.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總金額, SubContract_Main.LastTotalPrice AS 末次追加減後總金額, SubContract_Main.ContractType AS 分包合約種類, MAX(FFund_Main.FF_Edition) AS 已計價次數, SUM(FFund_Main.Item12) AS 已計價金額, Firm_Check.FirstResult, Firm_Check.SecondResult FROM Firm_Check RIGHT OUTER JOIN SubContract_Main ON Firm_Check.SCID = SubContract_Main.SCID LEFT OUTER JOIN ProjectM0 ON SubContract_Main.PID = ProjectM0.PID LEFT OUTER JOIN FFund_Main ON SubContract_Main.SCID = FFund_Main.SCID WHERE SubContract_Main.FirmID = " + UID + "  GROUP BY SubContract_Main.SCID,FFund_Main.SCID, ProjectM0.ProjectCode, ProjectM0.ProjectName, ProjectM0.ProjectStatus, SubContract_Main.SC_Code, SubContract_Main.SC_Name, SubContract_Main.TotalPrice, SubContract_Main.LastTotalPrice, SubContract_Main.ContractType, Firm_Check.FirstResult, Firm_Check.SecondResult   ORDER BY FFund_Main.SCID DESC";
                //SqlDataSource4.SelectCommand = "SELECT * FROM [SubContract_File] WHERE SCID=" + LbSCID.Text;
            }
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
               int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView4.PageSize;
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

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxFirmName.Text = "";
            DDL_Select2.SelectedValue = "0";
            TxSpecialty.Text = "";
            DDL_Select4.SelectedValue = "0";

        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            GridView4.DataBind();
        }
    }
}