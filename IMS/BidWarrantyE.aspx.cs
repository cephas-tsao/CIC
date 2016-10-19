using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace IMS
{
    public partial class BidWarrantyE : System.Web.UI.Page
    {
        string _TableName = "BidM3";
        string _TableNameadd = "BidM_Warranty";
        string ErrorString = "";
        string SQLString = "bid,WarrantyPercentage,OtherWarranty";
        string SQLString_Add = "bid,WarrantyItem,WarrantyYear";
       
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Recovery_Click(this, null);

               
            }
            BidWarranty.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        }

        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            ErrorString += (WarrantyPercentage.Text) == string.Empty ? "保固百分比請填入!!\\n" : "";
            //ErrorString += (OtherWarranty.Text) == string.Empty ? "其他保固規定請填入!!\\n" : "";
          



            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                    Response.Redirect("BidDurationE.aspx");
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
                DataTableDr["WarrantyPercentage"] = WarrantyPercentage.Text;
                DataTableDr["OtherWarranty"] = OtherWarranty.Text;
            

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                Response.Redirect("BidDurationE.aspx");
            }
            return DataTableBox;
        }

        //取得建入資料
        protected DataTable GetDataBox_add()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString_Add.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["bid"] != null)
            {
                DataTableDr["bid"] = Session["bid"].ToString();
                DataTableDr["WarrantyItem"] = WarrantyItem.Text;
                DataTableDr["WarrantyYear"] = WarrantyYear.Text;


                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                Response.Redirect("BidDurationE.aspx");
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


                        WarrantyPercentage.Text = row["WarrantyPercentage"].ToString();
                        OtherWarranty.Text = row["OtherWarranty"].ToString();
                    
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
      
        protected void add_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
           
            //檢查標題文字
            ErrorString += (WarrantyItem.Text) == string.Empty ? "階段名稱請填入!!\\n" : "";
           // ErrorString += (WarrantyYear.Text) == string.Empty ? "開工期限天數請填入!!\\n" : "";
          


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
                    WarrantyItem.Text = "";
                    WarrantyYear.Text = "";
                }
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;



                TextBox TxWarrantyItem = (TextBox)e.Item.FindControl("TxWarrantyItem");
                TextBox TxWarrantyYear = (TextBox)e.Item.FindControl("TxWarrantyYear");
                TextBox LtWarrantyID = (TextBox)e.Item.FindControl("LtWarrantyID");


                TxWarrantyItem.Text = vsDr["WarrantyItem"].ToString();
                TxWarrantyYear.Text = vsDr["WarrantyYear"].ToString();
                LtWarrantyID.Text = vsDr["WarrantyID"].ToString();

            }
        }

   
     
        //取得修改資料
        protected DataTable GetEditDataBox()
        {
            //後台功能必需要有的欄位名稱
            string InString = "WarrantyID,BID,WarrantyItem,WarrantyYear";
          

            using (DataTable DataTableBox = new DataTable())
            {
                #region 編輯輸入資料
                InString = string.Format(InString);

                string[] InStringArray = InString.Split(',');

                foreach (string DataName in InStringArray)
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                DataRow DataTableDr = DataTableBox.NewRow();

                #region 內容設定
                
                DataTableBox.Rows.Add(DataTableDr);
                #endregion
                #endregion

                return DataTableBox;
            }
        }

       
        protected void CheckLength(string str)
    {
          int limit = 2;//長度限制40

        if (str.Length > limit)
        {
            //return str.Substring(0, limit) + "...";
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('超過字元長度');", true);
            
        }

        else
        {
            
        }
    }

      protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
      {
          string s = "";
          s = e.NewValues[1].ToString();
         //驗証整字為2位數，小數點為2位數
          bool flag = Regex.IsMatch(s.Trim(), @"^\d{1,2}(?:\.\d{1,2})?$");
          if(flag)
        
          {
              ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資料更新成功');", true);
          }
          else
          {
             ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('超過字元長度');", true);
              e.Cancel = true;
          }

      }
   

        //public void OpenNewWindow(string url)
        //{

        //    string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=950";
        //    ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        //}

       
    }
}