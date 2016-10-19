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
    public partial class BidAssessV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if(Session["Bid"]==null && Session["Bid"]=="")
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇標案');", true);

            }
            LoadContent();
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLstring = "Select * from BidM0 a left join BidAssess b on a.bid=b.bid where a.bid="+Session["Bid"].ToString();
            DataTable datatablebox = WebModel.LoadSetContentData(database, SQLstring);
           
            foreach (DataRow row in datatablebox.Rows)
            {
                LbBidName.Text = row["BidName"].ToString();
                LbCondition1.Text = row["Condition1"].ToString() =="1"?"本公司專長":row["Condition1"].ToString() =="2"?"足以勝任":row["Condition1"].ToString() =="3"?"需外聘專家":row["Condition1"].ToString() =="4"?"無此技術能力":"";
                LbConditionNote1.Text = row["ConditionNote1"].ToString();
                LbCondition2.Text = row["Condition2"].ToString() =="1"?"現有資源足以應付":row["Condition2"].ToString() =="2"?"需招募人才":row["Condition2"].ToString() =="3"?"需添購設備":"";
                LbConditionNote2.Text = row["ConditionNote2"].ToString();
                LbCondition3.Text = row["Condition3"].ToString() == "1" ? "規範合理圖說清楚" : row["Condition3"].ToString() == "2" ? "規範合理圖說模糊" : row["Condition3"].ToString() == "3" ? "有難以接受者" : "";
                LbConditionNote3.Text = row["ConditionNote3"].ToString();
                LbCondition4.Text = row["Condition4"].ToString() == "1" ? "現場狀況極佳" : row["Condition4"].ToString() == "2" ? "現場狀況尚可" : row["Condition4"].ToString() == "3" ? "施工條件差，需克服" : "";
                LbConditionNote4.Text = row["ConditionNote4"].ToString();
                LbCondition5.Text = row["Condition5"].ToString() == "1" ? "時間緊迫" : row["Condition5"].ToString() == "2" ? "時間合理" : row["Condition5"].ToString() == "3" ? "與其它案件衝突" : "";
                LbConditionNote5.Text = row["ConditionNote5"].ToString();
                LbCondition6.Text = row["Condition6"].ToString() == "1" ? "特殊規定可以克服" : row["Condition6"].ToString() == "2" ? "特殊規定需再商議" : row["Condition6"].ToString() == "3" ? "無特殊規定" : "";
                LbConditionNote6.Text = row["ConditionNote6"].ToString();
                LbContract1.Text = row["Contract1"].ToString()=="1"?"合理":row["Contract1"].ToString()=="2"?"不合理":"";
                LbContractNote1.Text = row["ContractNote1"].ToString();
                LbContract2.Text = row["Contract2"].ToString() == "1" ? "合理" : row["Contract2"].ToString() == "2" ? "不合理" : "";
                LbContractNote2.Text = row["ContractNote2"].ToString();
                LbContract3.Text = row["Contract3"].ToString() == "1" ? "合理" : row["Contract3"].ToString() == "2" ? "不合理" : "";
                LbContractNote3.Text = row["ContractNote3"].ToString();
                LbContract4.Text = row["Contract4"].ToString() == "1" ? "合理" : row["Contract4"].ToString() == "2" ? "不合理" : "";
                LbContractNote4.Text = row["ContractNote4"].ToString();
                LbContract5.Text = row["Contract5"].ToString() == "1" ? "合理" : row["Contract5"].ToString() == "2" ? "不合理" : "";
                LbContractNote5.Text = row["ContractNote5"].ToString();
                LbContract6.Text = row["Contract6"].ToString() == "1" ? "合理" : row["Contract6"].ToString() == "2" ? "不合理" : "";
                LbContractNote6.Text = row["ContractNote6"].ToString();
                LbContract7.Text = row["Contract7"].ToString() == "1" ? "合理" : row["Contract7"].ToString() == "2" ? "不合理" : "";
                LbContractNote7.Text = row["ContractNote7"].ToString();
                LbContract8.Text = row["Contract8"].ToString() == "1" ? "合理" : row["Contract8"].ToString() == "2" ? "不合理" : "";
                LbContractNote8.Text = row["ContractNote8"].ToString();
                LbContract9.Text = row["Contract9"].ToString() == "1" ? "合理" : row["Contract9"].ToString() == "2" ? "不合理" : "";
                LbContractNote9.Text = row["ContractNote9"].ToString();
                LbPreMan.Text = row["PreMan"].ToString();
                LbPreSuggestion.Text = row["PreSuggestion"].ToString();
                LbPreResultNote.Text = row["PreResultNote"].ToString();
                LbReMan.Text = row["ReMan"].ToString();
                LbResult.Text = row["Result"].ToString();
                LbResultNote.Text = row["ResultNote"].ToString();


            }


        }
    }
}