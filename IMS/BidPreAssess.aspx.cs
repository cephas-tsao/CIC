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
    public partial class BidPreAssess : System.Web.UI.Page
    {
       
        string ErrorString = "";
        string _TableName = "BidAssess";
        string SQLString = "BID,ConditionStatus,ContractStatus,PreOver,PreMan,PreSuggestion,PreResultNote";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select * from BidM0";
            if (DropDownList1.SelectedValue != "")
            {
                Session["bid"] = DropDownList1.SelectedItem.Value;
            }
            if(! IsPostBack)
            {
                DropDownList1.DataSource = SqlDataSource1;
                DropDownList1.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DropDownList1.Items.Insert(0, LI);
                DropDownList1.SelectedIndex = 0;
                Recovery_Click(this, null);
            }
            LoadContent();
          
        }
        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null ))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from BidM0 a Left join BidM3 b on a.bid= b.bid Left join BidM2 c on a.bid =c.bid Left join BidM4 d on a.bid=d.bid Left join  BidAssess e on a.bid=e.bid where a.bid ='" + Session["bid"].ToString() + "'";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Session["bid"] = row["Bid"].ToString();
                        LtOwnerName.Text = row["OwnerName"].ToString();
                        LtArchitectName.Text = row["ArchitectName"].ToString();
                        LtCountry.Text = row["EngCountry"].ToString();

                        //datatable(ProjectM1)
                      
                        LtDuration.Text = row["Duration"].ToString();
                        LtIlluFee.Text = row["IlluFee"].ToString()!=""?Convert.ToDecimal(row["IlluFee"]).ToString("N0"):"";
                        LtIlluBond.Text = row["IlluBond"].ToString()!=""?Convert.ToDecimal(row["IlluBond"]).ToString("N0"):"";
                        LtPerformanceBond.Text = row["PerformanceBond"].ToString()!=""?Convert.ToDecimal(row["PerformanceBond"]).ToString("N0"):"";
                        LtBidBond.Text = row["BidBond"].ToString()!=""?Convert.ToDecimal(row["BidBond"]).ToString("N0"):"";
                        LtUpFloorNum.Text = row["UpFloorNum"].ToString();
                        LtBiddingEndDate.Text = (row["BiddingEndDate"].ToString() != "") ? Convert.ToDateTime(row["BiddingEndDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        LtUpFloorArea.Text = row["UpFloorArea"].ToString();
                        LtFoundationType.Text = row["FoundationType"].ToString();
                        LtRetaining.Text = row["Retaining"].ToString();
                        LtStartDeadline.Text = row["StartDeadline"].ToString();
                        LtPriceSubsidyNY.Text = (row["PriceSubsidyNY"].ToString() == "0") ? "是" : (row["PriceSubsidyNY"].ToString() == "1") ? "否" : "";                       
                        LtOpenBidTime.Text = (row["OpenBidTime"].ToString() != "") ? Convert.ToDateTime(row["OpenBidTime"].ToString()).ToString("yyyy/MM/dd") : "";

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

            ErrorString += (RadioButtonList1.SelectedIndex) == -1 ? "評估建議請選擇!!\\n" : "";
            ErrorString += (TxPreResultNote.Text) == "" ? "建議說明請填入!!\\n" : "";
          
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
                DataTableDr["BID"] = Session["bid"].ToString();
                DataTableDr["PreOver"] = 1;
                DataTableDr["PreMan"] = Session["Name"].ToString();
                DataTableDr["PreResultNote"] = TxPreResultNote.Text;               
                DataTableDr["PreSuggestion"] = RadioButtonList1.SelectedItem.Value;
             

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
        public bool datacheck_TempSave(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
                int s = -1;
                string p = "";
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["Bid"] = row["BID"].ToString();
                         s =int.Parse(row["PreSuggestion"].ToString());

                         p = row["PreResultNote"].ToString();

                       

                    }
                    if (s != -1 || p!="")
                    {
                        return true;
                    }
                    else
                    {

                        return false;
                    }
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
            else if (Session["Bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["Bid"] = row["BID"].ToString();
                        RadioButtonList1.SelectedIndex = (row["PreSuggestion"].ToString() != "") ? int.Parse(row["PreSuggestion"].ToString()) : -1;

                        TxPreResultNote.Text = row["PreResultNote"].ToString();
                       


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        public void OpenNewWindow(string url, string height, string width, string newWindow)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), newWindow, string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
       
        protected void Access_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ConditionE.aspx", "600", "750", "newWindow1");
        }

        protected void Article_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ContractE.aspx", "900", "750", "newWindow2");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxPreResultNote.Text = "";
            RadioButtonList1.SelectedIndex = -1;
            Recovery_Click(this, null);

            if (Session["temp_bid"] != null)
            {
                if (datacheck_TempSave(Session["temp_bid"].ToString()) == true)
                {
                    //Recovery_Click(this, null);
                }
                else if (Session["temp_bid"].ToString() == Session["Bid"].ToString())
                {
                    if (Session["TxPreResultNote"] != null || Session["RadioButtonList1"] != null)
                    {
                        TxPreResultNote.Text = (Session["TxPreResultNote"].ToString() != null) ? Session["TxPreResultNote"].ToString() : "";
                        RadioButtonList1.SelectedIndex = (Session["RadioButtonList1"].ToString() != null) ? int.Parse(Session["RadioButtonList1"].ToString()) : -1;

                    }
                }
               
            }
        }

        protected void Temp_save_Click(object sender, EventArgs e)
        {
            if (TxPreResultNote.Text != "" || RadioButtonList1.SelectedIndex != -1)
            {
                Session["temp_bid"] = Session["Bid"].ToString();
                Session["TxPreResultNote"] = TxPreResultNote.Text;
                Session["RadioButtonList1"] = RadioButtonList1.SelectedIndex;
               
            }
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已暫存、但未儲存於資料庫');", true);
        }
    }
}