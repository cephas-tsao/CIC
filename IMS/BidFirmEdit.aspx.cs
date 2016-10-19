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
    public partial class BidFirmEdit : System.Web.UI.Page
    {
      string ErrorString="";
      string _TableName = "BidRecord_FirmList";
      string SQLString = "UID,BID,CheckNY,GetNY,NoReason,NoReason1,LowReason,FirmName,BidPrice,TB_Other";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadContent();
              
            }
          
        }
        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["uid"] != null)
            {
               
                string database = Session["DatabaseName"].ToString();
               
                //string SQLString = "Select a.UID,a.BID,a.FirmName,a.CheckNY,a.GetNY,a.NoReason,a.NoReason1,a.LowReason,a.BidPrice from BidRecord_FirmList a where a.uid=(Select * from BidRecord_FirmList where bid=" + Session["bid"].ToString() + ")";
                string SQLString = "Select * from (Select * from BidRecord_FirmList where bid =" + Session["bid"].ToString() + ") BidRecord_FirmList where uid=" + Session["uid"].ToString() + "";
                //string SQLString = "Select a.UID,a.BID,a.FirmName,a.CheckNY,a.GetNY,a.NoReason,a.NoReason1,a.LowReason,a.BidPrice from BidRecord_FirmList a  where uid=" + uid + "";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                       
                        Session["bid"] = row["Bid"].ToString();
                      
                      
                          
                            DDL_CheckNY.SelectedIndex = (row["CheckNY"].ToString() != "") ? int.Parse(row["CheckNY"].ToString()) : 0;
                            DDL_GetNY.SelectedIndex = (row["GetNY"].ToString() != "") ? int.Parse(row["GetNY"].ToString()) : 0;
                            if (DDL_CheckNY.SelectedIndex == 2)
                             {
                                 DDL_Check.Visible = true;
                                DDL_Check.SelectedIndex = (row["NoReason"].ToString() != "") ? int.Parse(row["NoReason"].ToString()) : 0;
                            }
                            else if (DDL_GetNY.SelectedIndex == 2)
                            {
                                DDL_Get.Visible = true;
                                DDL_Get.SelectedIndex = (row["NoReason1"].ToString() != "") ? int.Parse(row["NoReason1"].ToString()) : 0;
                            }
                           
                            TB_Lowest.Text = row["LowReason"].ToString();
                            TxFirmName.Text = row["FirmName"].ToString();
                            TxBidPrice.Text =Convert.ToDecimal(row["BidPrice"]).ToString("N0");

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }

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
                if (Session["bid"] == null && Session["uid"] ==null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    //if (datacheck(Session["Bid"].ToString()) == false)
                    //{

                     bool result=  WebModel.EditAction(database, _TableName,Session["uid"].ToString(),GetDataBox());
                     if (result)
                     {
                         Session["Newbid"] = Session["bid"].ToString();
                         ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                         Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_zzz').click();self.close()</script>");
                     }
                     else
                     {
                         ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔朱敗');", true);
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
            if (Session["bid"] != null && Session["uid"] != null)
            {
                DataTableDr["UID"] = Session["uid"].ToString();
                DataTableDr["BID"] = Session["bid"].ToString();
                DataTableDr["CheckNY"] = DDL_CheckNY.SelectedItem.Value;
                DataTableDr["GetNY"] = DDL_GetNY.SelectedItem.Value;
                if (DDL_GetNY.SelectedValue == "1")
                {
                    DataTableDr["NoReason"] = "";
                    DataTableDr["NoReason1"] = "";
                }
                else
                {
                    DataTableDr["NoReason"] = DDL_Check.SelectedItem.Value;
                    DataTableDr["NoReason1"] = DDL_Get.SelectedItem.Value;
                }
                DataTableDr["LowReason"] = TB_Lowest.Text;
                DataTableDr["FirmName"] = TxFirmName.Text;
                DataTableDr["BidPrice"] = TxBidPrice.Text !=""?decimal.Parse(TxBidPrice.Text):0;
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
        protected void Recovery_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["uid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                //string SQLString = "Select max(uid) from BidM0 a Left join BidRecord_FirmList b on a.bid= b.bid where a.bid=" + Session["bid"].ToString() + "";
                string SQLString = "Select a.UID,a.BID,a.FirmName,a.CheckNY,a.GetNY,a.NoReason,a.NoReason1,a.LowReason,a.BidPrice from BidRecord_FirmList a  where uid=" + Session["uid"].ToString() + ")";
                DataTable DataTableBox = WebModel.LoadSetContentData(database,SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        
                        Session["Bid"] = row["BID"].ToString();
                        DDL_CheckNY.SelectedIndex = (row["CheckNY"].ToString() != "") ? int.Parse(row["CheckNY"].ToString()) : 0;
                        DDL_GetNY.SelectedIndex = (row["GetNY"].ToString() != "") ? int.Parse(row["GetNY"].ToString()) : 0;
                        if (DDL_CheckNY.SelectedIndex == 2)
                        {
                            DDL_Check.Visible = true;
                            DDL_Check.SelectedIndex = (row["NoReason"].ToString() != "") ? int.Parse(row["NoReason"].ToString()) : 0;
                        }
                        else if (DDL_GetNY.SelectedIndex == 2)
                        {
                            DDL_Get.Visible = true;
                            DDL_Get.SelectedIndex = (row["NoReason1"].ToString() != "") ? int.Parse(row["NoReason1"].ToString()) : 0;
                        }
                        TB_Lowest.Text = row["LowReason"].ToString();
                        TxFirmName.Text = row["FirmName"].ToString();
                        TxBidPrice.Text = row["BidPrice"].ToString();
                       
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
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
    }
}