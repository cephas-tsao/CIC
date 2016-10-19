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
    public partial class BidRecordV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
             SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
             SqlDataSource1.SelectCommand = "SELECT * FROM [BidRecord_FirmList] WHERE [BID] =" + Session["bid"].ToString();
             LoadContent();
        }

        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null) || (Session["Bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from BidM0 a Left join BidM2 b on a.bid= b.bid Left join BidRecord c on a.bid = c.bid where a.bid=" + Session["bid"].ToString() + "";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        
                        LbBidName.Text = row["BidName"].ToString();                   
                        LbOwnerName.Text = row["OwnerName"].ToString();


                        LbBudgetAmount.Text = row["BudgetAmount"].ToString()!=""?Convert.ToDecimal(row["BudgetAmount"]).ToString("N0"):"0";
                        LbEngLocation.Text = row["EngLocation"].ToString();
                        LbJointBidNY.Text = (row["JointBidNY"].ToString() == "1") ? "是" : (row["JointBidNY"].ToString() == "0") ? "否" : "";
                        LbAwardingType.Text = row["AwardingType"].ToString();
                        LbOpenBidTime.Text = row["OpenBidTime"].ToString();
                        LbOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        LbOwnerContactTel.Text = row["OwnerContactTel"].ToString();
                        LbResult.Text = row["Result"].ToString();
                        LbGetFirm.Text = row["GetFirm"].ToString();
                        LbAwardPrice.Text = row["AwardPrice"].ToString() !=""?Convert.ToDecimal(row["AwardPrice"]).ToString("N0"):"";
                        LbUpsetPrice.Text = row["UpsetPrice"].ToString() !=""?Convert.ToDecimal(row["UpsetPrice"]).ToString("N0"):"";
                        LbBidRatio.Text = row["BidRatio"].ToString();
                        LbBidStaff.Text = row["BidStaff"].ToString();
                        LbBidPrice.Text = row["BidPrice"].ToString()!=""?Convert.ToDecimal(row["BidPrice"]).ToString("N0"):"0";
                        LbFirstDiscountPrice.Text = row["FirstDiscountPrice"].ToString()!=""?Convert.ToDecimal(row["FirstDiscountPrice"]).ToString("N0"):"0";
                        LbLastDiscountPrice.Text = row["LastDiscountPrice"].ToString()!=""?Convert.ToDecimal(row["LastDiscountPrice"]).ToString("N0"):"0";
                        LbNotes.Text = row["Notes"].ToString();
                      
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

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
    }
}