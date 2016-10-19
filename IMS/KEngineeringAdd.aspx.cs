using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IMS
{
    public partial class KEngineeringAdd : System.Web.UI.Page
    {
        string ErrorString = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }




        }
        protected void SaveAction(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            //檢查工程名稱空格
            ErrorString += (KEngineeringName.Text) == string.Empty ? "請輸入工程名稱!!\\n" : "";

            if (ErrorString == "")
            {
                //確認資料庫是否有資料
                if (datacheck(KEngineeringName.Text.ToString()) == false)
                {

                    String SQLKEngineeringName = KEngineeringName.Text;

                    SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));

                    connStr.Open(); //開啟資料庫的連結
                    String select = "INSERT INTO KEngineeringList(KEngineeringListName) Values('" + SQLKEngineeringName + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmd = new SqlCommand(select, connStr);
                    cmd.ExecuteNonQuery();
                    connStr.Close();

                    //Application["projectname"] = project;
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('新增完成，請自行關閉頁面');", true);
                    Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");

                    //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");

                }
                else
                {


                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同工程');", true);

                }


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
            }

        }

        public bool datacheck(string data)
        {
            int i = 0;
            String name;
            string database = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open();

            String select1 = "select * from KEngineeringList where KEngineeringListName = '" + KEngineeringName.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                name = reader.GetString(1);
                i = i + 1;
            }
            connStr.Close();
            /**
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from KEngineeringList";
            #region 搜尋條件
            string SelectString = "";
            SelectString = (KEngineeringName.Text != "") ? "KEngineeringListName like @SelectKey and " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                    SelectList.Parameters.AddWithValue("@SelectKey", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(KEngineeringName.Text)) + "%");

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
            **/
            if (i != 0)
            {

                return true;
            }
            else
            {

                return false;
            }

        }




        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>window.close();</" + "script>");
        }
    }
}