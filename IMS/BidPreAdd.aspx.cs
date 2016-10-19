using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using DAL;
using System.Data.SqlClient;

namespace IMS
{
    public partial class BidPreAdd : System.Web.UI.Page
    {
        string _TableName = "Bid_PreData";
        string SQLString1 = "UID,ForecastName,status";
        string SQLString = "";
        string ErrorString = "";
        string Add__TableName = "BidM0";
        string Add_SQLString = "BID,BidName,NickName,Status,ProjectCode"; 
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string DataName in Unitlist.GetBid().Split(','))
            {
                DropDownList2.Items.Add(new ListItem(DataName));
            }
            LoadContent();
        }

        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["UID"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData(database, _TableName, Session["UID"].ToString(), SQLString1);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {


                        TxBidName.Text = row["ForecastName"].ToString();

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
            ErrorString += (DropDownList2.SelectedItem) == null ? "標案狀態請選擇!!\\n" : "";
            ErrorString += (TxBidName.Text) == string.Empty ? "標案名稱請填入!!\\n" : "";
        
        
            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["UID"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(Session["UID"].ToString()) == false)
                    {
                        //因資料庫uid為自動增量，故不使用webmodel
                        //WebModel.SaveAction_BID(database, Add__TableName, GetDataBox());
                        SQLString = "insert into " + Add__TableName + " (BidName,NickName,Status) values(@BidName,@NickName,@Status)";
                        //SQLString1 = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID ";

                        string data = Utility.DBconnection.connect_string(database);
                        using (SqlConnection L_Conn = new SqlConnection(data))
                        {
                            using (SqlCommand SQLAction = new SqlCommand(SQLString, L_Conn))
                            {

                                SQLAction.Parameters.Add("@BidName", System.Data.SqlDbType.VarChar).Value = TxBidName.Text;
                                SQLAction.Parameters.Add("@NickName", System.Data.SqlDbType.VarChar).Value = TxNickName.Text;
                                SQLAction.Parameters.AddWithValue("@Status", System.Data.SqlDbType.VarChar).Value = DropDownList2.SelectedItem.Value;
                                SQLAction.CommandType = CommandType.Text;
                                L_Conn.Open();
                                SQLAction.ExecuteNonQuery();
                            }
                        }
                        WebModel.EditAction(database, _TableName, Session["uid"].ToString(), GetDataBox_add());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    }
                    else
                    {
                        //WebModel.EditAction_bid(database, Add__TableName, Session["bid"].ToString(), GetDataBox());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資料庫已有此案');", true);
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

            foreach (string DataName in Add_SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定

                DataTableDr["bid"] = Session["bid"].ToString();
                DataTableDr["Status"] = DropDownList2.SelectedItem.Text;

                DataTableDr["BidName"] = TxBidName.Text;
                DataTableDr["NickName"] = TxNickName.Text;
              

                DataTableBox.Rows.Add(DataTableDr);
            #endregion

            return DataTableBox;
        }

        //取得建入資料
        protected DataTable GetDataBox_add()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString1.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定

            DataTableDr["uid"] = Session["uid"].ToString();
            DataTableDr["Status"] = "1";

           

            DataTableBox.Rows.Add(DataTableDr);
            #endregion

            return DataTableBox;
        }
        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from " + Add__TableName + " a ";
            #region 搜尋條件
            string SelectString = "";
            SelectString = (TxBidName.Text != "") ? "BidName like @SelectKey and " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                    SelectList.Parameters.AddWithValue("@SelectKey", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxBidName.Text)) + "%");

                    SelectList.CommandType = CommandType.Text;
                    L_Conn.Open();
                    SqlDataReader SelectList_read = SelectList.ExecuteReader();
                    DataTableBox = new DataTable();
                    DataTableBox.Load(SelectList_read);
                }
            }
            #endregion
         
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                 foreach (DataRow row in DataTableBox.Rows)
                    {
                       
                        Session["bid"] = row["bid"].ToString();
                    }
            
                return true;
            }
            else
            {

                return false;
            }

        }

    }
}