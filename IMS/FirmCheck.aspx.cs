using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class FirmCheck1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            LtAssessor.Text = Session["UserName"].ToString();
            Ltdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pnl_Main.Visible = true;

             string database = Session["DatabaseName"].ToString();
            //string SQLSub="Select * from SubContract_Main where SCID="+DDL_SCID.SelectedValue;
            string SQLSelect = "SELECT * FROM SubContract_Main a LEFT OUTER JOIN Firm_Check b ON a.SCID = b.SCID  where a.SCID=" + DDL_SCID.SelectedValue;
            string FirmID = WebModel.SItemName(database, SQLSelect, "FirmID");
            string SQLFirm = "Select * from FirmM where UID=" + FirmID;
            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLFirm);
            DataTable Dtvs1 = WebModel.LoadSetContentData(database, SQLSelect);
            if (Dtvs != null && Dtvs.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs.Rows)
                {
                    LbFirmName.Text = row["Name"].ToString();
                    LbType.Text = row["Type"].ToString();
                    LbOwner.Text = row["Owner"].ToString();
                    LbOwnerMobile.Text = row["OwnerMobile"].ToString();
                    LbEIN.Text = row["EIN"].ToString();
                    LbLocation.Text = row["Location"].ToString();
                    LbCapital.Text = row["Capital"].ToString();
                    LbStaff.Text = row["StaffAmount"].ToString();
                    LbFax1.Text = row["Fax1"].ToString();
                    LbFax2.Text = row["Fax2"].ToString();
                    LbRAddress.Text = row["RegisteredAddress"].ToString();
                    LbTel1.Text = row["Tel1"].ToString();
                    LbTel2.Text = row["Tel2"].ToString();
                    LbCAddress.Text = row["ContectAddress"].ToString();
                    LbEmail.Text = row["Email"].ToString();
                    LbNotes.Text = row["Notes"].ToString();
                    LbSupportItem.Text = row["SupportItem"].ToString();
                    LbGetFirm.Text = row["Name"].ToString();
                }
            }
            if (Dtvs1 != null && Dtvs1.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs1.Rows)
                {
                    LbSCode.Text = row["SC_Code"].ToString();
                    LbSubName.Text = row["SC_Name"].ToString();
                    LbSubTotal.Text = row["TotalPrice"].ToString();
                    LbCCTotal.Text = row["LastTotalPrice"].ToString();
                  
                    LbCType.Text = row["ContractType"].ToString();
                    LbBITime.Text = row["BookInTime"].ToString();                 
                    LbGWay.Text = row["GuaranteeWay"].ToString();
                    LbSubmitPercent.Text = row["SubmitPercent"].ToString();
                    LbWarrantyYear.Text = row["WarrantyYear"].ToString();
                    LbPDTime.Text = row["LastEdition"].ToString();
                    LbRequestNum.Text = row["RequestNum"].ToString() + "次/月";
                    LbRequestDate.Text = row["RequestDate"].ToString();
                    LbPayDate.Text = row["PayDate"].ToString();
                    LbNote.Text = row["ContractNote"].ToString();
                    LbDurationRule.Text = row["DurationRule"].ToString();
                    LbPunishType.Text = row["PunishType"].ToString();
                    LbScope.Text = row["Scope"].ToString();


                }

            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string radionListValue1 = "0";
            string radionListValue2 = "0";
            string radionListValue3 = "0";
            string radionListValue4 = "0";
            string radionListValue5 = "0";
            string radionListValue6 = "0";


            if (RadioButtonList1.SelectedItem != null)
            {
                radionListValue1 = RadioButtonList1.SelectedItem.Value;

            }
            if (RadioButtonList2.SelectedItem != null)
            {
                radionListValue2 = RadioButtonList2.SelectedItem.Value;

            }
            if (RadioButtonList3.SelectedItem != null)
            {
                radionListValue3 = RadioButtonList3.SelectedItem.Value;

            }
            if (RadioButtonList4.SelectedItem != null)
            {
                radionListValue4 = RadioButtonList4.SelectedItem.Value;

            }
            if (RadioButtonList5.SelectedItem != null)
            {
                radionListValue5 = RadioButtonList5.SelectedItem.Value;

            }
            if (RadioButtonList6.SelectedItem != null)
            {
                radionListValue6 = RadioButtonList6.SelectedItem.Value;

            }
            int score = Convert.ToInt32(radionListValue1) + Convert.ToInt32(radionListValue2) + Convert.ToInt32(radionListValue3) + Convert.ToInt32(radionListValue4) + Convert.ToInt32(radionListValue5) + Convert.ToInt32(radionListValue6);
            Literal4.Text = Convert.ToString(score);

            HtmlControl show = FindControl("show") as HtmlControl;

            if (score >= 70)
            {
                LtResult.Text = "合格";
                this.show.Style.Add("color", "blue");

            }
            else if (score < 70)
            {
                LtResult.Text = "不合格";
                this.show.Style.Add("color", "red;");
            }
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();
            string InString = "FirmID,Item1,ItemNote1,Item2,ItemNote2,Item3,ItemNote3,Item4,ItemNote4,Item5,ItemNote5,Item6,ItemNote6,TotalScore,FirstResult,FirstRater,FirstDate,FirstNote,SecondResult,SecondRater,SecondDate,SecondNote";

            foreach (string DataName in InString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (DDL_SCID.SelectedValue != "")
            {
                DataTableDr["FirmID"] = DDL_SCID.SelectedValue;
                DataTableDr["Item1"] = RadioButtonList1.SelectedItem.Value;
                DataTableDr["Item2"] = RadioButtonList2.SelectedItem.Value;
                DataTableDr["Item3"] = RadioButtonList3.SelectedItem.Value;
                DataTableDr["Item4"] = RadioButtonList4.SelectedItem.Value;
                DataTableDr["Item5"] = RadioButtonList5.SelectedItem.Value;
                DataTableDr["Item6"] = RadioButtonList6.SelectedItem.Value;
                DataTableDr["ItemNote1"] = TextBox1.Text;
                DataTableDr["ItemNote2"] = TextBox2.Text;
                DataTableDr["ItemNote3"] = TextBox3.Text;
                DataTableDr["ItemNote4"] = TextBox4.Text;
                DataTableDr["ItemNote5"] = TextBox5.Text;
                DataTableDr["ItemNote6"] = TextBox6.Text;

                DataTableDr["FirstDate"] = DateTime.Now.ToString("yyyy-MM-dd");
                DataTableDr["TotalScore"] = Literal4.Text.ToString();
                DataTableDr["FirstResult"] = LtResult.Text.ToString();
                DataTableDr["FirstRater"] = Session["UserName"].ToString();
                DataTableDr["FirstNote"] = TextBox7.Text.ToString();

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }

        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (DDL_SCID.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {
                string SQLString = "Select * from Firm_Check where SCID=" + DDL_SCID.SelectedValue;
                //DataTable WebModel =new DataTable;

                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    return true;
                }
                else
                {

                    return false;
                }

            }
            return false;

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ErrorString = "";
            string _TableName = "Firm_Check";
            //檢查標題文字
            ErrorString += (RadioButtonList1.SelectedItem) == null ? "資本額請填入評分!!\\n" : "";
            ErrorString += (RadioButtonList2.SelectedItem) == null ? "員工數請填入評分!!\\n" : "";
            ErrorString += (RadioButtonList3.SelectedItem) == null ? "專業能力請填入評分!!\\n" : "";
            ErrorString += (RadioButtonList4.SelectedItem) == null ? "設備(施工/工廠)請填入評分!!\\n" : "";
            ErrorString += (RadioButtonList5.SelectedItem) == null ? "品管措施請填入評分!!\\n" : "";
            ErrorString += (RadioButtonList6.SelectedItem) == null ? "報價請填入評分!!\\n" : "";


            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (DDL_SCID.SelectedValue == "")
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(DDL_SCID.SelectedValue) == false)
                    {


                        string result1 = WebModel.SaveAction(database, _TableName, GetDataBox());
                        if (result1 == "1")
                        {

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }
                    }
                    else
                    {


                        bool result = WebModel.EditAction_Anyid(database, _TableName, DDL_SCID.SelectedValue, "SCID", GetDataBox());
                        //Response.Write
                        if (result)
                        {

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }
                    }
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }
        protected void checkBtn_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from Firm_Check where SCID=" + DDL_SCID.SelectedValue;
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {

                Page.ClientScript.RegisterStartupScript(typeof(string), "checkBtn", "var retValue=confirm('已有此廠商之遴選評估資料，是否覆蓋???');" + "if (retValue) {document.getElementById('" + BtnSave.ClientID + "').click();};", true);
            }
            else
            {
                  BtnSave_Click(this, null);

            }
        }
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            RadioButtonList2.SelectedIndex = -1;
            RadioButtonList3.SelectedIndex = -1;
            RadioButtonList4.SelectedIndex = -1;
            RadioButtonList5.SelectedIndex = -1;
            RadioButtonList6.SelectedIndex = -1;
            LtResult.Text = "";
            Literal4.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }

        protected void DDL_PID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDL_SCID.Items.Clear();
            DDL_SCID.Items.Add("-請選擇-");
            SqlDataSource2.SelectCommand = "SELECT * FROM SubContract_Main LEFT OUTER JOIN Firm_Check ON SubContract_Main.SCID = Firm_Check.SCID WHERE  ( NULLIF(Firm_Check.SecondResult, '') IS NULL) AND SubContract_Main.PID = " + DDL_PID.SelectedValue;
            DDL_SCID.DataBind();
        }
    }
}