using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IMS
{
    public partial class KEngineeringListItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Name = Session["DatabaseName"].ToString();
            String ID=Session["KEngineeringListId"].ToString();

            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open();
            String select1 = "select * from KEngineeringList where  KEngineeringListId='"+ ID+ "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String KEngineeringListName= reader.GetString(1);
                Label6.Text = KEngineeringListName;
            }
            reader.Close();
            connStr.Close();


            //String DBName = "Private_Com1";
            SqlAll.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlAll.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='"+ ID + "' and KEngineeringListItemPhase='施工前'";

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='" + ID + "' and KEngineeringListItemPhase='施工中'";

            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='" + ID + "' and KEngineeringListItemPhase='施工後'";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Delete")
            {
                //SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";
                SqlAll.DeleteCommand = "delete from [KEngineeringListItem] where [KEngineeringListItemId] = @KEngineeringListItemId";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView1.DataBind();
            }
            if (e.CommandName == "Update")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;

                //TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                //LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlAll.UpdateCommand = "UPDATE [KEngineeringListItem] SET [KEngineeringListItemName] = @KEngineeringListItemName,[KEngineeringListItemStandard] = @KEngineeringListItemStandard WHERE [KEngineeringListItemId] = @KEngineeringListItemId";
            }
         
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView2.PageSize;
            if (e.CommandName == "Delete")
            {
                //SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";
                SqlDataSource1.DeleteCommand = "delete from [KEngineeringListItem] where [KEngineeringListItemId] = @KEngineeringListItemId";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView2.DataBind();
            }
            if (e.CommandName == "Update")
            {
                int UID = (int)GridView2.DataKeys[ID_class].Value;

                //TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                //LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlDataSource1.UpdateCommand = "UPDATE [KEngineeringListItem] SET [KEngineeringListItemName] = @KEngineeringListItemName,[KEngineeringListItemStandard] = @KEngineeringListItemStandard   WHERE [KEngineeringListItemId] = @KEngineeringListItemId";
            }

        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView3.PageSize;
            if (e.CommandName == "Delete")
            {
                //SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";
                SqlDataSource2.DeleteCommand = "delete from [KEngineeringListItem] where [KEngineeringListItemId] = @KEngineeringListItemId";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView3.DataBind();
            }
            if (e.CommandName == "Update")
            {
                int UID = (int)GridView3.DataKeys[ID_class].Value;

                //TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                //LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlDataSource2.UpdateCommand = "UPDATE [KEngineeringListItem] SET [KEngineeringListItemName] = @KEngineeringListItemName,[KEngineeringListItemStandard] = @KEngineeringListItemStandard   WHERE [KEngineeringListItemId] = @KEngineeringListItemId";
            }

        }



        protected void SaveAction(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            //檢查工程名稱空格

            String ID = Session["KEngineeringListId"].ToString();

            //確認資料庫是否有資料
            if (datacheck(NewKEngineeringListItemName.Text.ToString()) == false)
                {

                    String SQLKEngineeringName = NewKEngineeringListItemName.Text;

                    SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));

                    connStr.Open(); //開啟資料庫的連結
                    String select = "INSERT INTO KEngineeringListItem(KEngineeringListItemName,KEngineeringListItemPhase,KEngineeringListId,KEngineeringListItemStandard) Values('" + SQLKEngineeringName + "','"+phaseDropDownList.Text+ "','" + ID + "','"+ NewKEngineeringListItemStandard.Text+ "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmd = new SqlCommand(select, connStr);
                    cmd.ExecuteNonQuery();
                    connStr.Close();

                    //Application["projectname"] = project;
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('新增完成');", true);

                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
            }
                else
                {


                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同檢查項目');", true);

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

            String select1 = "select * from KEngineeringListItem where KEngineeringListItemName = '" + NewKEngineeringListItemName.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (PlaceHolder2.Visible == false)
            {

                PlaceHolder2.Visible = true;
            }
            else
            {
                PlaceHolder2.Visible = false;
            }
           
        }
    }
}