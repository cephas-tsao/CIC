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
    public partial class BidInfo5 : System.Web.UI.Page
    {
        string _TableName = "BidM5";
        string ErrorString = "";
        string SQLString = "bid,GetBidDate,WorkManDep,WorkManName,BookEstimateEndDate,PriBidMeetTime,SendBidDate,ReturnIlluDate,EstimateCosts,ProposalPrice,ProposalProfit,ApprovedPrice,ApprovedProfit";
        string _TableNameadd = "Bid_Joint";
        string add_SQLString = "bid,FID,JBItem,JBPrice";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());          
            SqlDataSource5.ConnectionString = datasource;
            SqlDataSource5.SelectCommand = "SELECT * from FirmM";
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            this.EstimateCosts.Attributes.Add("onblur", "javascript:funBlur();");        
            this.ApprovedPrice.Attributes.Add("onblur", "javascript:funBlur();");
            this.ProposalPrice.Attributes.Add("onblur", "javascript:funBlur();");
        
            if (Session["bid"] == null)
            {
                Session["bid"] = "";
            }
           
            SqlDataSource4.ConnectionString = datasource;
            SqlDataSource4.SelectCommand = "SELECT Bid_Joint.Fid,Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID where Bid_Joint.bid= " + DropDownList3.SelectedValue;//Session["Bid"].ToString() + "";
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;

            if (!IsPostBack)
            {
               // CreateDropDownList(); //建立下拉選項
            
                SqlDataSource1.ConnectionString = datasource;
                SqlDataSource1.SelectCommand = "Select * from BidM0 ";
                DropDownList3.DataSourceID = "SqlDataSource1";
                DropDownList3.DataBind();

            

                //SqlDataSource2.ConnectionString = datasource;
                //SqlDataSource2.SelectCommand = "Select * from DepartmentList ";
                //DLWorkManDep.DataSourceID = "SqlDataSource2";
                //DLWorkManDep.DataBind();

                //SqlDataSource3.ConnectionString = datasource;
                //SqlDataSource3.SelectCommand = "Select * from StaffInfo";
                //DLWorkManName.DataSourceID = "SqlDataSource3";
                //DLWorkManName.DataBind();

                

                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DropDownList3.Items.Insert(0, LI);
                DropDownList3.SelectedIndex = 0;
                DLWorkManDep.Items.Insert(0, LI);
                DLWorkManDep.SelectedIndex = 0;
                DLWorkManName.Items.Insert(0, LI);
                DLWorkManName.SelectedIndex = 0;
                DropDownList9.Items.Insert(0, LI);
                DropDownList9.SelectedIndex = 0;
            }
           
        }
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DLWorkManName.Items.Clear();
            DLWorkManName.Items.Add("-請選擇部門人員-");
        }
        #region 選擇標案-repeater
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;



                Literal ltName = (Literal)e.Item.FindControl("ltName");
                Literal LtStatus = (Literal)e.Item.FindControl("LtStatus");
                Literal bid = (Literal)e.Item.FindControl("bid");

                ltName.Text = vsDr["BidName"].ToString();
                LtStatus.Text = vsDr["Status"].ToString();
                bid.Text = vsDr["bid"].ToString();
                Session["bid"] = vsDr["BID"].ToString();
                Session["bidname"] = vsDr["BidName"].ToString();
                //GridView1.DataBind();

               
            }
            if (datacheck(Session["bid"].ToString()) == false)
            {

                DLWorkManDep.SelectedIndex = 0;
                DLWorkManName.SelectedIndex = 0;
                GetBidDate.Text = "";
                BookEstimateEndDate.Text = "";
                PriBidMeetTime.Text = "";
                SendBidDate.Text = "";               
                ReturnIlluDate.Text = "";
                EstimateCosts.Text = "";
                ProposalPrice.Text = "";             
                ProposalProfit.Text = "";
                ApprovedPrice.Text = "";              
                ApprovedProfit.Text = "";
                         
            }
            else
            {
                
                Recovery_Click(this, null);
               
            }
            //共同投標廠商明細
            GridView1.DataSourceID = "SqlDataSource4";
            SqlDataSource4.SelectCommand = "SELECT Bid_Joint.FID,Bid_Joint.bid,Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID where Bid_Joint.bid= " + Session["Bid"].ToString() + "";
                 
            GridView1.DataBind();
        }
        #endregion

        //儲存資料
         protected void SaveAction(object sender, EventArgs e)
         {

             string database = Session["DatabaseName"].ToString();
             //檢查標題文字
             ErrorString += (DLWorkManDep.SelectedIndex) == 0 ? "作業部門請選擇!!\\n" : "";
             ErrorString += (DLWorkManName.SelectedIndex) == 0 ? "作業負責人請選擇!!\\n" : "";
             ErrorString += (GetBidDate.Text) == string.Empty ? "完成領標日期請填入!!\\n" : "";
             ErrorString += (BookEstimateEndDate.Text) == string.Empty ? "預定估算完成日期請填入!!\\n" : "";
             ErrorString += (PriBidMeetTime.Text) == string.Empty ? "標前會議時間請填入!!\\n" : "";
             ErrorString += (SendBidDate.Text) == string.Empty ? "寄送標單日期請填入!!\\n" : "";
             ErrorString += (ReturnIlluDate.Text) == string.Empty ? "退圖日期請填入!!\\n" : "";
             ErrorString += (EstimateCosts.Text) == string.Empty ? "估算成本請填入!!\\n" : "";
             ErrorString += (ProposalPrice.Text) == string.Empty ? "建議標價請填入!!\\n" : "";
             ErrorString += (ProposalProfit.Text) == string.Empty ? "建議利潤請填入!!\\n" : "";
             ErrorString += (ApprovedPrice.Text) == string.Empty ? "核定標價請填入!!\\n" : "";
             ErrorString += (ApprovedProfit.Text) == string.Empty ? "核定利潤請填入!!\\n" : "";

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
                 DataTableDr["bid"] = Session["bid"].ToString();
                 DataTableDr["WorkManDep"] = DLWorkManDep.SelectedItem.Value;
                 DataTableDr["WorkManName"] = DLWorkManName.SelectedItem.Value;
                 DataTableDr["GetBidDate"] = GetBidDate.Text;
                 DataTableDr["BookEstimateEndDate"] = BookEstimateEndDate.Text;
                 DataTableDr["PriBidMeetTime"] = PriBidMeetTime.Text;
                 DataTableDr["SendBidDate"] = SendBidDate.Text;
                 DataTableDr["ReturnIlluDate"] = ReturnIlluDate.Text;
                 DataTableDr["EstimateCosts"] = EstimateCosts.Text;
                 DataTableDr["ProposalPrice"] = ProposalPrice.Text;
                 DataTableDr["ProposalProfit"] = ProposalProfit.Text;
                 DataTableDr["ApprovedPrice"] = ApprovedPrice.Text;
                 DataTableDr["ApprovedProfit"] = ApprovedProfit.Text;


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
             else
             {
                 string database = Session["DatabaseName"].ToString();
                 DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["bid"].ToString(), SQLString);
                 if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                 {
                     foreach (DataRow row in DataTableBox.Rows)
                     {

                         DLWorkManDep.SelectedItem.Text = row["WorkManDep"].ToString();
                         DLWorkManName.SelectedItem.Text = row["WorkManName"].ToString();
                         GetBidDate.Text = row["GetBidDate"].ToString();
                         BookEstimateEndDate.Text = row["BookEstimateEndDate"].ToString();
                         PriBidMeetTime.Text = row["PriBidMeetTime"].ToString();
                         SendBidDate.Text = row["SendBidDate"].ToString();
                         ReturnIlluDate.Text = row["ReturnIlluDate"].ToString();
                         EstimateCosts.Text = row["EstimateCosts"].ToString() !=""? Convert.ToDecimal(row["EstimateCosts"]).ToString("N0"):"";
                         ProposalPrice.Text =row["ProposalPrice"].ToString()!=""? Convert.ToDecimal(row["ProposalPrice"]).ToString("N0"):"";
                         ProposalProfit.Text = row["ProposalProfit"].ToString()!=""?Convert.ToDecimal(row["ProposalProfit"]).ToString("N0"):"";
                         ApprovedPrice.Text =row["ApprovedPrice"].ToString()!=""? Convert.ToDecimal(row["ApprovedPrice"]).ToString("N0"):"";
                         ApprovedProfit.Text =row["ApprovedProfit"].ToString()!=""?Convert.ToDecimal(row["ApprovedProfit"]).ToString("N0"):"";

                     }
                     DataTableBox.Dispose(); //釋放Table資源
                 }
             }
         }

         protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
         {
            
             Session["bid"] = DropDownList3.SelectedValue;
           
             sqlEmployees.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
         
             sqlEmployees.SelectCommand = "Select * from BidM0 where BID='" + Session["bid"].ToString() + "'";
          
             Repeater1.DataSourceID = sqlEmployees.ID;
          
         }

         protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
         {
             int ID_class = Convert.ToInt32(e.CommandArgument);
             if (e.CommandName == "Update")
             {
                 string JBItem = ((TextBox)GridView1.Rows[ID_class].FindControl("JBItem")).Text.Trim();
                 string JBPrice = Convert.ToDecimal(((TextBox)GridView1.Rows[ID_class].FindControl("JBPrice")).Text).ToString("N0").Trim();
                 
                 DropDownList DDL = (DropDownList)GridView1.Rows[ID_class].FindControl("Name");
              
                 GridView1.DataSourceID = "SqlDataSource4";

                 SqlDataSource4.UpdateCommand = "Update Bid_Joint SET JBItem='" + JBItem + "', JBPrice='" + JBPrice + "', FID=" + DDL.SelectedValue + " FROM Bid_Joint  where JBID=@JBID";
          
             }
             if (e.CommandName == "delete")
             {
                 SqlDataSource4.DeleteCommand = "delete Bid_Joint WHERE [JBID] = @JBID";
             }
         }
         #region 新增投標廠商明細
         protected void add_Click(object sender, EventArgs e)
         {
             string database = Session["DatabaseName"].ToString();

             //檢查標題文字
             ErrorString += (TxJBItem.Text) == string.Empty ? "共同投標項目請填入!!\\n" : "";
             ErrorString += (TxJBPrice.Text) == string.Empty ? "共同投標金額請填入!!\\n" : "";



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

                     WebModel.SaveAction_BID(database, _TableNameadd, GetDataBox_add());

                     ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                     GridView1.DataBind();
                     TxJBItem.Text = "";
                     TxJBPrice.Text = "";
                 }
             }
             else
             {

                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

             }
         }

         //取得建入資料
         protected DataTable GetDataBox_add()
         {

             DataTable DataTableBox = new DataTable();

             foreach (string DataName in add_SQLString.Split(','))
             {
                 DataTableBox.Columns.Add(DataName, typeof(string));
             }


             //後台功能，必需要有的欄位名稱               

             DataRow DataTableDr = DataTableBox.NewRow();

             #region 內容設定
             if (Session["bid"] != null)
             {
                 DataTableDr["bid"] = Session["bid"].ToString();
                 DataTableDr["FID"] = DropDownList9.SelectedItem.Value;                 
                 DataTableDr["JBItem"] = TxJBItem.Text;
                 DataTableDr["JBPrice"] = TxJBPrice.Text;
              


                 DataTableBox.Rows.Add(DataTableDr);
             #endregion


             }
             else
             {
                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
             }
             return DataTableBox;
         }
        #endregion

         protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
         {
             if (e.Row.RowType == DataControlRowType.DataRow)
             {

                 Label JBPrice = (Label)e.Row.FindControl("JBPrice");
                 JBPrice.Text = Convert.ToDecimal(JBPrice.Text).ToString("N0");
             }
             
         }

        #region 使用textchanged方式偵測值並加總
        //protected void EstimateCosts_TextChanged(object sender, EventArgs e)
         //{
         //    ddd.Value = EstimateCosts.Text;


         //    int str = 0;
         //    int str4 = 0;
         //    if (ProposalPrice.Text != "" && EstimateCosts.Text != "")
         //    {
         //        int str1 = Convert.ToInt32(ProposalPrice.Text);
         //        int str2 = Convert.ToInt32(EstimateCosts.Text);
         //        str = str1 - str2;
         //        ProposalProfit.Text = str.ToString();
         //    }
         //    if (ApprovedPrice.Text != "" && EstimateCosts.Text != "")
         //    {
         //        int str2 = Convert.ToInt32(EstimateCosts.Text);
         //        int str3 = Convert.ToInt32(ApprovedPrice.Text);
         //        str4 = str3 - str2;
         //        ApprovedProfit.Text = str4.ToString();
         //    }
        //}
        #endregion
    }
}