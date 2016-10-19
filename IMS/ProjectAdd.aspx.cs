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
    public partial class ProjectAdd1 : System.Web.UI.Page
    {
       
        string _TableName = "ProjectM0";
        string ErrorString = "";
        string SQLString = "ProjectCode,ProjectName,ProjectNickname,ProjectStatus,Note,FromBid,CodeName";

        protected void Page_Load(object sender, EventArgs e)
        {
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }

        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字
         
            ErrorString += (TxProjectCode.Text) == string.Empty ? "專案(工程)編號請填入!!\\n" : "";
            ErrorString += (TxProjectName.Text) == string.Empty ? "專案(工程)名稱請填入!!\\n" : "";
            ErrorString += (TxProjectNickname.Text) == string.Empty ? "專案(工程)簡稱請填入!!\\n" : "";



            //確認是否全選
            if (ErrorString == "")
            {
               

                        WebModel.SaveAction_pro(database, _TableName, GetDataBox(), Session["ProjectCode"].ToString());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                   

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
          

                DataTableDr["FromBid"] = Session["bid"];
                DataTableDr["ProjectCode"] = TxProjectCode.Text;
                DataTableDr["ProjectName"] = TxProjectName.Text;
                DataTableDr["ProjectNickname"] = TxProjectNickname.Text;
                DataTableDr["Note"] = TxNote.Text;
                DataTableDr["CodeName"] = TxProjectCode.Text + "-" + TxProjectName.Text;
                Session["ProjectCode"] = TxProjectCode.Text;
                DataTableBox.Rows.Add(DataTableDr);
            #endregion
                      
            return DataTableBox;
        }      
    }
}