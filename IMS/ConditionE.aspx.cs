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
    public partial class ConditionE : System.Web.UI.Page
    {
        string _TableName = "BidAssess";
        string ErrorString = "";
        string SQLString = "Bid,Condition1,Condition2,Condition3,Condition4,Condition5,Condition6,ConditionNote1,ConditionNote2,ConditionNote3,ConditionNote4,ConditionNote5,ConditionNote6";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["ProjectCode"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
               
                Recovery_Click(this, null);
            }
        }

        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            ErrorString += (RadioButtonList1.SelectedIndex) == -1 ? "施工技術能力請選擇!!\\n" : "";
            ErrorString += (RadioButtonList2.SelectedIndex) == -1 ? "人力機具負荷請選擇!!\\n" : "";
            ErrorString += (RadioButtonList3.SelectedIndex) == -1 ? "規範圖說請選擇!!\\n" : "";
            ErrorString += (RadioButtonList4.SelectedIndex) == -1 ? "工址現況請選擇!!\\n" : "";
            ErrorString += (RadioButtonList5.SelectedIndex) == -1 ? "估算時間請選擇!!\\n" : "";
            ErrorString += (RadioButtonList6.SelectedIndex) == -1 ? "特殊限制約定請選擇!!\\n" : "";
        


            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(Session["Bid"].ToString()) == false)
                    {

                        WebModel.SaveAction_BID(database, _TableName, GetDataBox());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    }
                    else
                    {
                        WebModel.EditAction_bid(database, _TableName, Session["bid"].ToString(), GetDataBox());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                    }
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["Bid"] = Session["bid"].ToString();
                DataTableDr["ConditionNote1"] = TxAbility.Text;
                DataTableDr["ConditionNote2"] = TxLabor.Text;
                DataTableDr["ConditionNote3"] = TxRule.Text;
                DataTableDr["ConditionNote4"] = TxPosition.Text;
                DataTableDr["ConditionNote5"] = TxTime.Text;
                DataTableDr["ConditionNote6"] = TxRestrict.Text;
                DataTableDr["Condition1"] = RadioButtonList1.SelectedItem.Value;
                DataTableDr["Condition2"] = RadioButtonList2.SelectedItem.Value;
                DataTableDr["Condition3"] = RadioButtonList3.SelectedItem.Value;
                DataTableDr["Condition4"] = RadioButtonList4.SelectedItem.Value;
                DataTableDr["Condition5"] = RadioButtonList5.SelectedItem.Value;
                DataTableDr["Condition6"] = RadioButtonList6.SelectedItem.Value;
            

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
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
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
        protected void Recovery_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["Bid"] = row["Bid"].ToString();
                        RadioButtonList1.SelectedIndex = (row["Condition1"].ToString() != "") ? int.Parse(row["Condition1"].ToString()) : -1;
                        RadioButtonList2.SelectedIndex = (row["Condition2"].ToString() != "") ?int.Parse(row["Condition2"].ToString()):-1;
                        RadioButtonList3.SelectedIndex = (row["Condition3"].ToString() != "") ?int.Parse(row["Condition3"].ToString()):-1;
                        RadioButtonList4.SelectedIndex = (row["Condition4"].ToString() != "") ?int.Parse(row["Condition4"].ToString()):-1;
                        RadioButtonList5.SelectedIndex = (row["Condition5"].ToString() != "") ?int.Parse(row["Condition5"].ToString()):-1;
                        RadioButtonList6.SelectedIndex = (row["Condition6"].ToString() != "") ?int.Parse(row["Condition6"].ToString()):-1;
                        TxAbility.Text = row["ConditionNote1"].ToString();
                        TxLabor.Text = row["ConditionNote2"].ToString();
                        TxRule.Text = row["ConditionNote3"].ToString();
                        TxPosition.Text = row["ConditionNote4"].ToString();
                        TxTime.Text = row["ConditionNote5"].ToString();
                        TxRestrict.Text = row["ConditionNote6"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}