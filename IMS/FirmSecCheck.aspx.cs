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
    public partial class FirmSecCheck : System.Web.UI.Page
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

            string SQLSelect1 = "SELECT * from FirmM a left join Firm_Check b on a.UID=b.SCID where b.SCID=" + DDL_SCID.SelectedValue;

            DataTable Dtvs2 = WebModel.LoadSetContentData(database, SQLSelect1);
            if (Dtvs2 != null && Dtvs2.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs2.Rows)
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
                    RadioButtonList1.SelectedValue = row["Item1"].ToString();
                    RadioButtonList2.SelectedValue = row["Item2"].ToString();
                    RadioButtonList3.SelectedValue = row["Item3"].ToString();
                    RadioButtonList4.SelectedValue = row["Item4"].ToString();
                    RadioButtonList5.SelectedValue = row["Item5"].ToString();
                    RadioButtonList6.SelectedValue = row["Item6"].ToString();
                    TextBox1.Text = row["ItemNote1"].ToString();
                    TextBox2.Text = row["ItemNote2"].ToString();
                    TextBox3.Text = row["ItemNote3"].ToString();
                    TextBox4.Text = row["ItemNote4"].ToString();
                    TextBox5.Text = row["ItemNote5"].ToString();
                    TextBox6.Text = row["ItemNote6"].ToString();
                    Literal4.Text = row["TotalScore"].ToString() + "分";
                    Literal1.Text = row["FirstRater"].ToString();
                    Literal2.Text = row["FirstDate"].ToString();
                    LtResult.Text = row["FirstResult"].ToString();
                    TextBox8.Text = row["FirstNote"].ToString();
                }



            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DDL_PID_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDL_SCID.Items.Clear();
            DDL_SCID.Items.Add("-請選擇-");
            SqlDataSource2.SelectCommand = "SELECT * FROM SubContract_Main LEFT OUTER JOIN Firm_Check ON SubContract_Main.SCID = Firm_Check.SCID WHERE  ( NULLIF(Firm_Check.SecondResult, '') IS NULL) AND SubContract_Main.PID = " + DDL_PID.SelectedValue;
            DDL_SCID.DataBind();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            LtAssessor.Text = Session["UserName"].ToString();
            Ltdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            string Nots = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox7.Text));
            string Update = "Update Firm_Check Set SecondResult='" + RadioButtonList13.SelectedValue + "' ,SecondNote='" + Nots + "' ,SecondRater='" + LtAssessor.Text + "',SecondDate='" + Ltdate.Text + "' where SCID=" + DDL_SCID.SelectedValue;
            bool result = WebModel.SQLAction(database, Update);
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔成功');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);

            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {

        }
        protected void checkBtn_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from Firm_Check where SCID=" + DDL_SCID.SelectedValue;
            string Result = WebModel.SItemName(database, SQLSelect, "SecondResult");
            if (Result == "")
            {
                BtnSave_Click(this, null);

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(typeof(string), "checkBtn", "var retValue=confirm('已有此廠商之遴選評估資料，是否覆蓋???');" + "if (retValue) {document.getElementById('" + BtnSave.ClientID + "').click();};", true);

            }
        }
    }
}