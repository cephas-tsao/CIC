using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using Utility;
using System.Data.SqlClient;

namespace IMS
{
    public partial class BidAdd : System.Web.UI.Page
    {
        string ErrorString = "";
        string _TableName = "BidM0";
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string DataName in Unitlist.GetBid().Split(','))
            {
                DropDownList2.Items.Add(new ListItem(DataName));
            }
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
           

            //檢查標題文字
          

                ErrorString += (DropDownList2.SelectedItem) == null ? "請輸入標案名稱!!\\n" : "";
                ErrorString += (TextName.Text) == string.Empty ? "請輸入標案狀態!!\\n" : "";
          

            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                string SQLString = "";
                    //確認資料庫是否有資料
                if (datacheck(TextName.Text.ToString()) == false)
                    {

                        SQLString = "insert into " + _TableName + " (BidName,NickName,Status) values(@BidName,@NickName,@Status)";
                       

                             string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SQLAction = new SqlCommand(SQLString, L_Conn))
                    {
                        
                        SQLAction.Parameters.Add("@BidName", System.Data.SqlDbType.VarChar).Value = TextName.Text;
                        SQLAction.Parameters.Add("@NickName", System.Data.SqlDbType.VarChar).Value = TxNickName.Text;
                        SQLAction.Parameters.AddWithValue("@Status", System.Data.SqlDbType.VarChar).Value = DropDownList2.SelectedItem.Value;
                        SQLAction.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SQLAction.ExecuteNonQuery();
                    }
                }
                    
                    //WebModel.SaveAction_Bid(database, _TableName, GetDataBox());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                    }
                else
                {
                   
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同專案名稱');", true);
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
            string InString = "BidName,NickName,Status,ProjectCode";


            foreach (string DataName in InString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
           
                                  
                    DataTableDr["BidName"] = TextName.Text;
                    DataTableDr["NickName"] = TxNickName.Text;
                    DataTableDr["Status"] = DropDownList2.SelectedItem.Value;
                   
              
                DataTableBox.Rows.Add(DataTableDr);
            #endregion
           
            return DataTableBox;
        }
      
        
        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from " + _TableName + " a ";
            #region 搜尋條件
            string SelectString = "";
            SelectString = (TextName.Text != "") ? "BidName like @SelectKey and " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                    SelectList.Parameters.AddWithValue("@SelectKey", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextName.Text)) + "%");

                    SelectList.CommandType = CommandType.Text;
                    L_Conn.Open();
                    SqlDataReader SelectList_read = SelectList.ExecuteReader();
                    DataTableBox = new DataTable();
                    DataTableBox.Load(SelectList_read);
                }
            }
            #endregion         
                //DataTable WebModel =new DataTable;

               // DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                  
                    return true;
                }
                else
                {

                    return false;
                }

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        }
    }
}