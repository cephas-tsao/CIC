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
    public partial class ProjectPayE : System.Web.UI.Page
    {
        string _TableName = "ProjectM2";
        string ErrorString = "";
        string SQLString = "Pid,PrepayPercentage,EstAcceptNum,EstAcceptUnit,EstAcceptDate1,EstAcceptDate2,RetentionPercentage,PriceSubsidyNY,OtherPayment";
        protected void Page_Load(object sender, EventArgs e)
        {
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
            //ErrorString += (PriceSubsidyNY.SelectedIndex) == -1 ? "物價補貼請選擇!!\\n" : "";
            //ErrorString += (PrepayPercentage.Text) == string.Empty ? "預付款百分比請填入!!\\n" : "";
            //ErrorString += (EstAcceptNum.Text) == string.Empty ? "估驗頻率請填入!!\\n" : "";
            //ErrorString += (EstAcceptUnit.Text) == string.Empty ? "估驗頻率/(次)請填入!!\\n" : "";
            //ErrorString += (EstAcceptDate1.Text) == string.Empty ? "估驗日期1請填入!!\\n" : "";
            //ErrorString += (EstAcceptDate2.Text) == string.Empty ? "估驗日期2請填入!!\\n" : "";
            //ErrorString += (RetentionPercentage.Text) == string.Empty ? "保留款百分比請填入!!\\n" : "";
            //ErrorString += (OtherPayment.Text) == string.Empty ? "其他付款規定請填入!!\\n" : "";

            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["ProjectCode"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(Session["ProjectCode"].ToString()) == false)
                    {

                        WebModel.SaveAction_pro(database, _TableName, GetDataBox(), Session["ProjectCode"].ToString());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    }
                    else
                    {
                        WebModel.EditAction_pro(database, _TableName, Session["ProjectCode"].ToString(), GetDataBox());
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
                DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                DataTableDr["PriceSubsidyNY"] = PriceSubsidyNY.SelectedItem.Value;
                DataTableDr["PrepayPercentage"] = PrepayPercentage.Text;
                DataTableDr["EstAcceptNum"] = EstAcceptNum.Text;
                DataTableDr["EstAcceptUnit"] = EstAcceptUnit.Text;
                DataTableDr["EstAcceptDate1"] = EstAcceptDate1.Text;
                DataTableDr["EstAcceptDate2"] = EstAcceptDate2.Text;
                DataTableDr["RetentionPercentage"] = RetentionPercentage.Text;
                DataTableDr["OtherPayment"] = OtherPayment.Text;

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
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
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
                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["ProjectCode"] = row["pid"].ToString();
                        PriceSubsidyNY.SelectedValue = row["PriceSubsidyNY"].ToString();
                        PrepayPercentage.Text = row["PrepayPercentage"].ToString();
                        EstAcceptNum.Text = row["EstAcceptNum"].ToString();
                        EstAcceptUnit.Text = row["EstAcceptUnit"].ToString();
                        EstAcceptDate1.Text = row["EstAcceptDate1"].ToString();
                        EstAcceptDate2.Text = row["EstAcceptDate2"].ToString();
                        RetentionPercentage.Text = row["RetentionPercentage"].ToString();
                        OtherPayment.Text = row["OtherPayment"].ToString();
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}