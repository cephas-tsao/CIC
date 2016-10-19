using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class ContractE : System.Web.UI.Page
    {
        string _TableName = "BidAssess";
        string ErrorString = "";
        string SQLString = "Bid,Contract1,Contract2,Contract3,Contract4,Contract5,Contract6,Contract7,Contract8,Contract9,ContractNote1,ContractNote2,ContractNote3,ContractNote4,ContractNote5,ContractNote6,ContractNote7,ContractNote8,ContractNote9";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["bid"] == null)))
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

            ErrorString += (RadioButtonList1.SelectedIndex) == -1 ? "開工期限合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList2.SelectedIndex) == -1 ? "工期合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList3.SelectedIndex) == -1 ? "工期階段管制合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList4.SelectedIndex) == -1 ? "保固合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList5.SelectedIndex) == -1 ? "承攬方式合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList6.SelectedIndex) == -1 ? "付款辦法合理性請選擇!!\\n" : "";
            ErrorString += (RadioButtonList7.SelectedIndex) == -1 ? "物價補貼請選擇!!\\n" : "";
            ErrorString += (RadioButtonList8.SelectedIndex) == -1 ? "對我不利條文請選擇!!\\n" : "";
            ErrorString += (RadioButtonList9.SelectedIndex) == -1 ? "合約條款適法性請選擇!!\\n" : "";



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
            if (Session["bid"] != null)
            {
                DataTableDr["Bid"] = Session["bid"].ToString();
                DataTableDr["ContractNote1"] = TxOpendate.Text;
                DataTableDr["ContractNote2"] = TxDuration.Text;
                DataTableDr["ContractNote3"] = TxControl.Text;
                DataTableDr["ContractNote4"] = TxWarranty.Text;
                DataTableDr["ContractNote5"] = TxForwarder.Text;
                DataTableDr["ContractNote6"] = TxPay.Text;
                DataTableDr["ContractNote7"] = TxStock.Text;
                DataTableDr["ContractNote8"] = TxArticle.Text;
                DataTableDr["ContractNote9"] = TxContract.Text;
                DataTableDr["Contract1"] = RadioButtonList1.SelectedItem.Value;
                DataTableDr["Contract2"] = RadioButtonList2.SelectedItem.Value;
                DataTableDr["Contract3"] = RadioButtonList3.SelectedItem.Value;
                DataTableDr["Contract4"] = RadioButtonList4.SelectedItem.Value;
                DataTableDr["Contract5"] = RadioButtonList5.SelectedItem.Value;
                DataTableDr["Contract6"] = RadioButtonList6.SelectedItem.Value;
                DataTableDr["Contract7"] = RadioButtonList7.SelectedItem.Value;
                DataTableDr["Contract8"] = RadioButtonList8.SelectedItem.Value;
                DataTableDr["Contract9"] = RadioButtonList9.SelectedItem.Value;


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
                        RadioButtonList1.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract1"].ToString()) :-1;                        
                        RadioButtonList2.SelectedIndex = (row["Contract2"].ToString()!="")?int.Parse(row["Contract2"].ToString()) :-1;
                        RadioButtonList3.SelectedIndex = (row["Contract3"].ToString()!="")?int.Parse(row["Contract3"].ToString()):-1;
                        RadioButtonList4.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract4"].ToString()):-1;
                        RadioButtonList5.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract5"].ToString()):-1;
                        RadioButtonList6.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract6"].ToString()):-1;
                        RadioButtonList7.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract7"].ToString()):-1;
                        RadioButtonList8.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract8"].ToString()):-1;
                        RadioButtonList9.SelectedIndex = (row["Contract1"].ToString()!="")?int.Parse(row["Contract9"].ToString()):-1;
                        TxOpendate.Text = row["ContractNote1"].ToString();
                        TxDuration.Text = row["ContractNote2"].ToString();
                        TxControl.Text = row["ContractNote3"].ToString();
                        TxWarranty.Text = row["ContractNote4"].ToString();
                        TxForwarder.Text = row["ContractNote5"].ToString();
                        TxPay.Text = row["ContractNote6"].ToString();
                        TxStock.Text = row["ContractNote7"].ToString();
                        TxArticle.Text = row["ContractNote8"].ToString();
                        TxContract.Text = row["ContractNote9"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        //public void OpenNewWindow(string url, string height, string width)
        //{

        //    string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=" + height + ",width=" + width + "";
        //    ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        //}
        //protected void DurationPunish_Click(object sender, EventArgs e)
        //{
        //    OpenNewWindow("BidDurationV.aspx","400","400");
        //}

        //protected void Warranty_Click(object sender, EventArgs e)
        //{
        //    OpenNewWindow("BidWarrantyV.aspx", "400", "400");
        //}
    }
}