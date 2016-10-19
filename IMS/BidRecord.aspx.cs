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
    public partial class BidRecord : System.Web.UI.Page
    {
        string ErrorString = "";
        string _TableName = "BidRecord";
        string SQLString = "BID,Result,GetFirm,AwardPrice,UpsetPrice,BidStaff,BidPrice,FirstDiscountPrice,LastDiscountPrice,Notes";
        bool flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {

                SqlDataSource1.SelectCommand = "Select * from BidM0 a Left join BidAssess b on a.bid = b.bid";
                DropDownList3.DataSource = SqlDataSource1;
                DropDownList3.DataBind();

                DropDownList4.Items.Add(new ListItem("-請選擇-", "0"));
                DropDownList4.Items.Add(new ListItem("得標", "1"));
                DropDownList4.Items.Add(new ListItem("未得標", "2"));
                DropDownList4.Items.Add(new ListItem("流標", "3"));
                DropDownList4.Items.Add(new ListItem("廢標", "4"));
                DropDownList4.Items.Add(new ListItem("重新招標", "5"));
                //DropDownList4.SelectedValue = "0";
                //TxGetFirm.Text = "";
                //TxAwardPrice.Text = "";
                //TxUpsetPrice.Text = "";
                
                //TxBidStaff.Text = "";
                //TxBidPrice.Text = "";
                //TxFirstDiscountPrice.Text = "";
                //TxLastDiscountPrice.Text = "";
                //TxNotes.Text = "";
                if (Session["DDLValue"] != null)
                {
                    DropDownList4.SelectedValue = Session["DDLValue"].ToString();
                   
                }
               
            }
            Session["bid"] = DropDownList3.SelectedItem.Value;
            if (Session["Newbid"] != null)
            {

                DropDownList3.SelectedValue = Session["Newbid"].ToString();
                DropDownList3_SelectedIndexChanged(this, null);
                flag = true;
              
            }
          
          
        }
        protected void LoadContent()
        {
            
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from BidM0 a Left join BidM2 b on a.bid= b.bid left join BidRecord c on a.bid =c.bid where a.bid=" + Session["bid"].ToString() + "";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Session["bid"] = row["Bid"].ToString();
                        LbBidName.Text = row["BidName"].ToString();
                        LbStatus.Text = row["Status"].ToString();
                        LbOwnerName.Text = row["OwnerName"].ToString();

                        //datatable(ProjectM1)

                        LbBudgetAmount.Text = row["BudgetAmount"].ToString() != "" ? Convert.ToDecimal(row["BudgetAmount"]).ToString("N0") : "";
                        LbEngCountry.Text = row["EngCountry"].ToString();
                        LbJointBidNY.Text = (row["JointBidNY"].ToString() == "1")? "是":(row["JointBidNY"].ToString() =="0")?"否":"";
                        LbAwardingType.Text = row["AwardingType"].ToString();
                        LbOpenBidTime.Text = row["OpenBidTime"].ToString();
                        LbOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        LbOwnerContactTel.Text = row["OwnerContactTel"].ToString();

                        //BidRecord
                        DropDownList4.SelectedItem.Text = row["Result"].ToString() !="" ?row["Result"].ToString():"";
                        TxGetFirm.Text = row["GetFirm"].ToString();
                        TxAwardPrice.Text = row["AwardPrice"].ToString();
                        TxUpsetPrice.Text = row["UpsetPrice"].ToString();
                        TxBidStaff.Text = row["BidStaff"].ToString();
                        TxBidPrice.Text = row["BidPrice"].ToString();
                        TxFirstDiscountPrice.Text = row["FirstDiscountPrice"].ToString();
                        TxLastDiscountPrice.Text = row["LastDiscountPrice"].ToString();
                        TxNotes.Text = row["Notes"].ToString();

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

            ErrorString += (DropDownList4.SelectedItem.Value) == "0" ? "決標結果請選擇!!\\n" : "";
            ErrorString += (TxGetFirm.Text) == "" ? "得標廠商請填入!!\\n" : "";
            ErrorString += (TxAwardPrice.Text) == "" ? "得標金額請填入!!\\n" : "";
            ErrorString += (TxUpsetPrice.Text) == "" ? "底價金額請填入!!\\n" : "";
          

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
                       bool result= WebModel.EditAction_bid(database, _TableName, Session["bid"].ToString(), GetDataBox());
                       if (result)
                        {
                              ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改失敗');", true);
                        }
                      

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
                DataTableDr["BID"] = Session["bid"].ToString();
                DataTableDr["Result"] = DropDownList4.SelectedItem.Text;
                DataTableDr["GetFirm"] = TxGetFirm.Text;
                DataTableDr["AwardPrice"] =TxAwardPrice.Text!=""? decimal.Parse(TxAwardPrice.Text):0;
                DataTableDr["UpsetPrice"] =TxUpsetPrice.Text!=""? decimal.Parse(TxUpsetPrice.Text):0;
                DataTableDr["BidStaff"] = TxBidStaff.Text;
                DataTableDr["BidPrice"] = TxBidPrice.Text !=""?decimal.Parse(TxBidPrice.Text):0;
                DataTableDr["FirstDiscountPrice"] = TxFirstDiscountPrice.Text !=""?decimal.Parse(TxFirstDiscountPrice.Text):0;
                DataTableDr["LastDiscountPrice"] =TxLastDiscountPrice.Text !=""? decimal.Parse(TxLastDiscountPrice.Text):0;
                DataTableDr["Notes"] = TxNotes.Text;
              


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
            else if (Session["Bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        //DropDownList4.SelectedValue = "0";
                        Session["Bid"] = row["BID"].ToString();

                        DropDownList4.SelectedItem.Text = row["Result"].ToString().Trim() != "" ? row["Result"].ToString().Trim() : "-請選擇-";
                        TxGetFirm.Text = row["GetFirm"].ToString();
                        TxAwardPrice.Text =row["AwardPrice"].ToString()!=""?Convert.ToInt32(row["AwardPrice"]).ToString("N0"):"";
                        TxUpsetPrice.Text = row["UpsetPrice"].ToString() !=""?Convert.ToInt32(row["UpsetPrice"]).ToString("N0"):"";
                      
                        TxBidStaff.Text = row["BidStaff"].ToString();
                        TxBidPrice.Text = row["BidPrice"].ToString() !=""? Convert.ToInt32(row["BidPrice"]).ToString("N0"):"";
                        TxFirstDiscountPrice.Text =row["FirstDiscountPrice"].ToString() !=""? Convert.ToInt32(row["FirstDiscountPrice"]).ToString("N0"):"";
                        TxLastDiscountPrice.Text =row["LastDiscountPrice"].ToString()!=""? Convert.ToInt32(row["LastDiscountPrice"]).ToString("N0"):"";
                        TxNotes.Text = row["Notes"].ToString();
                        //TxBidPrice.Text = (int.Parse(row["NoReason"].ToString()) == 1 ? "未依招標文件規定投標" : int.Parse(row["NoReason"].ToString()) == 2 ? "押標金未繳或不符合規定" : int.Parse(row["NoReason"].ToString()) == 3 ? "資格文件未附或不符合規定" : int.Parse(row["NoReason"].ToString()) == 4 ? "規格文件未附或不符合規定" : int.Parse(row["NoReason"].ToString()) == 5 ? "價格文件未附或不符合規定" : "");
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
     
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

          
            int ID_class = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Select")
            {
                //Session["uid"] = ID_class;
                string UID = ((Label)GridView1.Rows[ID_class].FindControl("UID")).Text.Trim();
                Session["uid"] = UID;

                OpenNewWindow("BidFirmEdit.aspx?uid=" + UID);
              

                //SqlDataSource2.UpdateCommand = "Update ProjectM_JV SET JVItem='" + JVItem + "', JVPrice='" + JVPrice + "', FID=" + DDL.SelectedValue + " FROM ProjectM_JV  where JVID=@JVID";
               //SqlDataSource2.UpdateCommand = "UPDATE [BidRecord_FirmList] SET  [CheckNY] = " + DDL.SelectedValue + ", [GetNY] = " + DDL1.SelectedValue + ", [BidPrice] = '" + TxBidPrice + "', [NoReason] = '" + TxNoReason + "', [LowReason] =  '" + TxLowReason + "' WHERE [UID] = @UID";
            }
           
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=1000";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));
           

        }
        protected void zzz_Click(object sender, EventArgs e)
        {
            Response.Redirect("BidRecord.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Label3 = (Label)e.Row.FindControl("Label3");
                Label3.Text = Convert.ToDecimal(Label3.Text).ToString("N0");
                Label type = (Label)e.Row.FindControl("LbNoReason"); 
                 if (type.Text == "0")
                {

                    type.Text = "請選擇";
                }
               else if (type.Text == "1")
                {

                    type.Text = "未依招標文件規定投標";
                }

                else if (type.Text == "2")
                {

                    type.Text = "押標金未繳或不符合規定";
                }

                else if (type.Text == "3")
                {

                    type.Text = "資格文件未附或不符合規定";
                }               
                else if (type.Text == "4")
                {

                    type.Text = "規格文件未附或不符合規定";
                }
                else if (type.Text == "5")
                {

                    type.Text = "價格文件未附或不符合規定";
                }
                else if (type.Text == "6")
                {

                    type.Text = "投標文件為空白文件、無關文件或標封內空無一物";
                }
                else if (type.Text == "7")
                {

                    type.Text = "借用或冒用他人名義或證件，或以偽造、變造之文件投標";
                }
                else if (type.Text == "8")
                {

                    type.Text = "偽造、變造投標文件";
                }
                else if (type.Text == "9")
                {

                    type.Text = "政府採購法第50條第1項第5款：投標文件內容由同一人或同一廠商繕寫或備具者";
                }
                else if (type.Text == "10")
                {

                    type.Text = "政府採購法第50條第1項第5款：押標金由同一人或同一廠商繳納或申請退還者";
                }
                else if (type.Text == "11")
                {

                    type.Text = "政府採購法第50條第1項第5款：投標標封或通知機關信函號碼連號，顯係同一人或同一廠商所為者";
                }
                else if (type.Text == "12")
                {

                    type.Text = "政府採購法第50條第1項第5款：廠商地址、電話號碼、傳真機號碼、聯絡人或電子郵件網址相同者";
                }
                else if (type.Text == "13")
                {

                    type.Text = "屬採購法第103條第1項不得參加投標或作為決標對象之情形";
                }
                else if (type.Text == "14")
                {

                    type.Text = "違反採購法施行細則第33條之情形";
                }
                else if (type.Text == "15")
                {

                    type.Text = "屬採購法施行細則第38條第1項規定之情形";
                }
                else if (type.Text == "16")
                {

                    type.Text = "其他";
                }
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList4.SelectedValue = "0";
            //TxGetFirm.Text = "";
            //TxAwardPrice.Text = "";
            //TxUpsetPrice.Text = "";
            Session["DDLValue"] = DropDownList4.SelectedValue;    
            //TxBidStaff.Text = "";
            //TxBidPrice.Text = "";
            //TxFirstDiscountPrice.Text = "";
            //TxLastDiscountPrice.Text = "";
            //TxNotes.Text = "";
            //Recovery_Click(this, null);
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadContent();
            Session["DDLValue"] = DropDownList4.SelectedValue;
            SqlDataSource2.SelectCommand = "SELECT * FROM [BidRecord_FirmList] WHERE [BID] = " + Session["Bid"].ToString();
            if (Session["Newbid"] != null)
            {
                SqlDataSource2.SelectCommand = "SELECT * FROM [BidRecord_FirmList] WHERE [BID] = " + Session["Newbid"].ToString();
               
            }
            if (flag)
            {
                Session["Newbid"] = null;
            }
        }

      
    }
}