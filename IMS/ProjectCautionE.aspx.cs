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
    public partial class ProjectCautionE : System.Web.UI.Page
    {
        string _TableName = "ProjectM2";
        string ErrorString = "";
        string SQLString = "Pid,ContractCaution1,ContractCaution2,ContractCaution3,ContractCaution4";

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

            //ErrorString += (ContractCaution1.Text) == string.Empty ? "契約終止請填入!!\\n" : "";
            //ErrorString += (ContractCaution2.Text) == string.Empty ? "變更設計請填入!!\\n" : "";
            //ErrorString += (ContractCaution3.Text) == string.Empty ? "爭議處理請填入!!\\n" : "";
            //ErrorString += (ContractCaution4.Text) == string.Empty ? "其他請填入!!\\n" : "";


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
                DataTableDr["pid"] = Session["ProjectCode"].ToString();

                DataTableDr["ContractCaution1"] = ContractCaution1.Text;
                DataTableDr["ContractCaution2"] = ContractCaution2.Text;
                DataTableDr["ContractCaution3"] = ContractCaution3.Text;
                DataTableDr["ContractCaution4"] = ContractCaution4.Text;


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

                        ContractCaution1.Text = row["ContractCaution1"].ToString();
                        ContractCaution2.Text = row["ContractCaution2"].ToString();
                        ContractCaution3.Text = row["ContractCaution3"].ToString();
                        ContractCaution4.Text = row["ContractCaution4"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}