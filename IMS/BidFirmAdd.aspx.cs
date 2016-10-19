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
    public partial class BidFirmAdd : System.Web.UI.Page
    {
        string ErrorString = "";
        string _TableName = "BidRecord_FirmList";
        string SQLString = "BID,CheckNY,GetNY,NoReason,NoReason1,LowReason,FirmName,BidPrice,TB_Other";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            //ErrorString += (DDL_CheckNY.SelectedIndex) == 0 ? "是否合格請選擇!!\\n" : "";
            //ErrorString += (DDL_GetNY.SelectedIndex) == 0 ? "是否得標請選擇!!\\n" : "";
            //ErrorString += (DDL_Check.SelectedIndex) == 0 ? "不合格/未得標原因請選擇!!\\n" : "";
            //ErrorString += (DDL_Get.SelectedIndex) == 0 ? "不合格/未得標原因請選擇!!\\n" : "";
            ErrorString += (TxFirmName.Text) == "" ? "得標廠商請填入!!\\n" : "";
            ErrorString += (TxBidPrice.Text) == "" ? "得標金額請填入!!\\n" : "";


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
                    //if (datacheck(Session["Bid"].ToString()) == false)
                    //{

                  string result= WebModel.SaveAction(database, _TableName, GetDataBox());
                  if (result != "0")
                  {
                      DDL_CheckNY.SelectedIndex = 0;
                      DDL_GetNY.SelectedIndex = 0;
                      DDL_Check.SelectedIndex = 0;
                      DDL_Get.SelectedIndex = 0;
                      TxFirmName.Text = "";
                      TxBidPrice.Text = "";
                      TB_Lowest.Text = "";
                      ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                      Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_zzz').click();self.close()</script>");

                  }
                  else
                  {
                      ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                  }

                   
                    //}
                    //else
                    //{
                    //    WebModel.EditAction(database, _TableName, Session["bid"].ToString(), GetDataBox());
                    //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);

                    //}
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
                DataTableDr["BID"] = Session["bid"].ToString();
                DataTableDr["CheckNY"] = DDL_CheckNY.SelectedItem.Value;
                DataTableDr["GetNY"] = DDL_GetNY.SelectedItem.Value;
                DataTableDr["NoReason"] = DDL_Check.SelectedItem.Value;
                DataTableDr["NoReason1"] = DDL_Get.SelectedItem.Value;
                DataTableDr["LowReason"] = TB_Lowest.Text;
                DataTableDr["FirmName"] = TxFirmName.Text;
                DataTableDr["BidPrice"] = TxBidPrice.Text;
                DataTableDr["TB_Other"] = TB_Other.Text;

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
        protected void DDL_CheckNY_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_CheckNY.SelectedIndex == 1))
            {
                DDL_Check.Visible = false;
                DDL_Get.Visible = true;
                TB_Other.Visible = false;
                DDL_GetNY.Enabled = true;
            }
            else if ((DDL_CheckNY.SelectedIndex == 2))
            {
                DDL_Check.Visible = true;
                DDL_Get.Visible = false;
                TB_Other.Visible = false;
                DDL_GetNY.Enabled = false;
            }
        }

        protected void DDL_Check_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_Check.SelectedIndex == 16))
            {
                TB_Other.Visible = true;
                TB_Other.Text = "";
            }
            else
            {
                TB_Other.Visible = false;
            }
        }

        protected void DDL_Get_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_Get.SelectedIndex == 3))
            {
                TB_Other.Visible = true;
                TB_Other.Text = "";
            }
            else
            {
                TB_Other.Visible = false;
            }
        }

        protected void DDL_GetNY_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_GetNY.SelectedIndex == 1))
            {
                DDL_Check.Visible = false;
                DDL_Get.Visible = false;
                TB_Other.Visible = false;
            }
            else if ((DDL_GetNY.SelectedIndex == 2))
            {
                DDL_Check.Visible = false;
                DDL_Get.Visible = true;
                TB_Other.Visible = false;
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            DDL_CheckNY.SelectedIndex = 0;
            DDL_GetNY.SelectedIndex = 0;
            DDL_Check.SelectedIndex = 0 ;
            DDL_Get.SelectedIndex = 0 ;
            TxFirmName.Text = "" ;
            TxBidPrice.Text = "" ;
            TB_Lowest.Text = "";
        }
    }
}