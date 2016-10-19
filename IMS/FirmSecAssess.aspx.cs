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
    public partial class FirmSecAssess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "SELECT FirmM.Name, FirmM.UID, Firm_Assess.FirmID FROM FirmM INNER JOIN Firm_Assess ON FirmM.UID = Firm_Assess.FirmID WHERE (Firm_Assess.FirstResult IS NOT NULL)";
            LtAssessor.Text = Session["UserName"].ToString();
            Ltdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            RadioButtonList2.SelectedIndex = -1;
            RadioButtonList3.SelectedIndex = -1;
            RadioButtonList4.SelectedIndex = -1;
            RadioButtonList5.SelectedIndex = -1;
            RadioButtonList6.SelectedIndex = -1;
            LtResult.Text = "";
            Literal4.Text = "";

            string SQLSelect = "SELECT * from FirmM a left join Firm_Assess b on a.UID=b.FirmID where a.UID=" + DropDownList1.SelectedValue;
            string database = Session["DatabaseName"].ToString();
            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
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
                    Literal4.Text = row["TotalScore"].ToString()+"分";
                    Literal1.Text = row["FirstRater"].ToString();
                    Literal2.Text = row["FirstDate"].ToString();
                    LtResult.Text = row["FirstResult"].ToString();
                    TextBox8.Text = row["FirstNote"].ToString();
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

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            LtAssessor.Text = Session["UserName"].ToString();
            Ltdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            string Nots = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox7.Text));
            string Update = "Update Firm_Assess Set SecondResult='" + RadioButtonList13.SelectedValue + "' ,SecondNote='" + Nots + "' ,SecondRater='" + LtAssessor.Text + "',SecondDate='" + Ltdate.Text + "' where FirmID=" + DropDownList1.SelectedValue;
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
            RadioButtonList13.SelectedIndex = -1;
            TextBox7.Text = "";

        }

        protected void checkBtn_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect="Select * from Firm_Assess where FirmID="+DropDownList1.SelectedValue;
          string Result=  WebModel.SItemName(database, SQLSelect, "SecondResult");
          if (Result == "")
          {
              BtnSave_Click(this,null);

          }
          else
          {
              Page.ClientScript.RegisterStartupScript(typeof(string), "checkBtn", "var retValue=confirm('已有此廠商之遴選評估資料，是否覆蓋???');" + "if (retValue) {document.getElementById('" + BtnSave.ClientID + "').click();};", true);

          }
        }
       
    }
}