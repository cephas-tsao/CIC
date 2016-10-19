using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IMS
{
    public partial class KEngineeringList : System.Web.UI.Page
    {
        int i = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Name = Session["DatabaseName"].ToString();

            //String DBName = "Private_Com1";
            SqlAll.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlAll.SelectCommand = "select * from KEngineeringList ";

            //GridView1.Visible = false;


            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(DBName);
            //SqlDataSource1.SelectCommand = "select * from KEngineeringList ";


            /** 留著用
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結
                            // String select = "select * from project ";  //宣告SQL語法的字串，這邊可依照自行需求修改
                            // SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                            //reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
                            // while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                            //  {
                            //      int projectid = (int)reader["projectid"];
                            //      Label2.Text = projectid.ToString();
                            //  }

            //  reader.Close();


            TableRow row;
            TableCell cell;
            TableCell cell2;
            TableCell cell3;

            String select1 = "select * from KEngineeringList ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = (int)reader["KEngineeringListId"];
                String projectname = reader.GetString(1);

                CheckBox checkbox = new CheckBox();
                checkbox.ID = "checkbox" + i;

                row = new TableRow();

                cell = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell.Text = projectname;

                cell2.Text = i.ToString();
                cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell3);
                row.Cells.Add(cell2);
                row.Cells.Add(cell);


                Table1.Rows.Add(row);
                i = i + 1;
                // aa = aa + 1;


            }

            reader.Close();
            connStr.Close();
    **/
        }

        

       

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Delete")
            {
                //SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";


                //SqlAll.DeleteCommand = "delete from [KEngineeringListItem] where [KEngineeringListId] = @KEngineeringListId";
              
                SqlAll.DeleteCommand = "delete from [KEngineeringList] where [KEngineeringListId] = @KEngineeringListId";


                //SqlAll.DeleteCommand = "delete from [KEngineeringList] INNER JOIN [KEngineeringListItem] ON [KEngineeringList].[KEngineeringListId] = [KEngineeringListItem].[KEngineeringListId]  where [KEngineeringList].[KEngineeringListId] = @KEngineeringListId";
                //INNER JOIN KEngineeringList ON KCheckList.KCheckListEngineeringList = KEngineeringList.KEngineeringListId
                //String Kid= "@KEngineeringListId";

                 String dataName = Session["DatabaseName"].ToString();
                SqlConnection connStrr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
                connStrr.Open();
                String selectaa = "delete from [KEngineeringListItem] where [KEngineeringListId] =@KEngineeringListId";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                //cmdaa.Parameters.Add("@KEngineeringListId", System.Data.SqlDbType.VarChar).Value = "KEngineeringListId";
                cmdaa.Parameters.Add("@KEngineeringListId", SqlDbType.Int);
                cmdaa.Parameters["@KEngineeringListId"].Value = Convert.ToInt32(GridView1.DataKeys[ID_class].Value);
                cmdaa.ExecuteNonQuery();
                connStrr.Close();
               



                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView1.DataBind();
            }
            if (e.CommandName == "Update")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;

                //TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                //LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlAll.UpdateCommand = "UPDATE [KEngineeringList] SET [KEngineeringListName] = @KEngineeringListName  WHERE [KEngineeringListId] = @KEngineeringListId";
            }



            /**
            if (e.CommandName == "MyCommand2")
            {
                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["KEngineeringListId"] = ID;
                OpenNewWindow("KEngineeringEdit.aspx", "700", "900");
            }

            if (e.CommandName == "MyCommand3")
            {
                string IDD = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                
                SqlConnection connStrr = new SqlConnection(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                connStrr.Open();
                String selectaa = "delete from KEngineeringList where KEngineeringListId ='" + IDD + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdaa.ExecuteNonQuery();
                connStrr.Close();

                Response.Redirect(Request.Url.ToString());
                //Session["KEngineeringListId"] = ID+"b";
                //OpenNewWindow("KEngineeringListItem.aspx", "700", "900");
            }
    **/

            if (e.CommandName == "access")
            {
                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["KEngineeringListId"] = ID;
                OpenNewWindow("KEngineeringListItem.aspx", "700", "900");
            }

        }
        public void OpenNewWindow(string url, string height, string width)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
           
        }

        protected void Reload_Click(object sender, ImageClickEventArgs e)
        {
            Response.AddHeader("Refresh", "0");
        }

       
    }
}