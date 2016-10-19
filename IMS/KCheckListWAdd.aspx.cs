using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;
using DAL;

namespace IMS
{
    public partial class KCheckListWAdd : System.Web.UI.Page
    {
        string ErrorString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Projectid = Session["ProjectCode"].ToString();

            String Name = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
            SqlDataReader reader;   //宣告一個DataReader
            if (!IsPostBack) //首次開網頁
            {
                connStr.Open();

                String select1 = "select * from KEngineeringList ";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                 //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

                while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {

                    int KEngineeringListId = (int)reader["KEngineeringListId"];

                    ListBox1.Items.Add(new ListItem(reader.GetString(1), KEngineeringListId.ToString()));


                }
                reader.Close();
                connStr.Close();
            }
        }

        protected void SaveAction(object sender, EventArgs e)
        {

            ErrorString += (ListBox1.SelectedItem.Text) == string.Empty ? "請選擇自主檢查表!!\\n" : "";

            if (ErrorString == "")
            {
                //確認資料庫是否有資料
                if (datacheck(ListBox1.SelectedItem.Text.ToString(), TextBox1.Text) == false)
                {
                    String Projectid = Session["ProjectCode"].ToString();

                    String CheckListName = TextBox1.Text;

                    String KEngineeringListName = ListBox1.SelectedItem.Text;
                    String KEngineeringListId = ListBox1.SelectedItem.Value;

                    if (KEngineeringListName == CheckListName) {
                    }
                    else 
                    {
                        if (CheckListName=="") { } else { KEngineeringListName = CheckListName; }
                        
                    }



                    String Name = Session["DatabaseName"].ToString();
                    SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
                   

                    connStr.Open(); //新增進KCheckList
                    String select = "INSERT INTO KCheckList(KCheckListProject,KCheckListEngineeringList) Values('" + Projectid + "','" + KEngineeringListName + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmd = new SqlCommand(select, connStr);
                    cmd.ExecuteNonQuery();
                    connStr.Close();

                    connStr.Open(); //搜尋剛新增的KCheckListId
                    SqlDataReader Idreader;
                    String selectID = "select * from KCheckList where  KCheckListProject= '" + Projectid + "'  and KCheckListEngineeringList='" + KEngineeringListName + "'";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmdId = new SqlCommand(selectID, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                    Idreader = cmdId.ExecuteReader();

                    int? KCheckListid = null;

                    while (Idreader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                    {
                        KCheckListid = (int)Idreader["KCheckListId"];
                        //Label1.Text = Idreader.GetString(0);

                    }
                    connStr.Close();

                    connStr.Open(); //開啟資料庫的連結
                    SqlDataReader Itemreader;
                    String selectItem = "select * from KEngineeringListItem where KEngineeringListId='" + KEngineeringListId + "'";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmdItem = new SqlCommand(selectItem, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                    Itemreader = cmdItem.ExecuteReader();

                    while (Itemreader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                    {

                        String ItemName = Itemreader.GetString(1);
                        String PhaseName = Itemreader.GetString(2);

                        SqlConnection PrivateconnStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
                        PrivateconnStr.Open();
                        String KCheckItem = "INSERT INTO KCheckListItem(KCheckListItemName,KCheckListItemPhase,KCheckListId) Values('" + ItemName + "','" + PhaseName + "','" + KCheckListid + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                        SqlCommand Privatecmd = new SqlCommand(KCheckItem, PrivateconnStr);
                        Privatecmd.ExecuteNonQuery();
                        PrivateconnStr.Close();


                    }

                        connStr.Close();


                    /**
                    connStr.Open(); //開啟資料庫的連結
                    String select = "INSERT INTO KCheckList(KCheckListProject,Location,KCheckListEngineeringList) Values('" + Projectid + "','" + Location + "','" + KEngineeringListName + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmd = new SqlCommand(select, connStr);
                    cmd.ExecuteNonQuery();
                    connStr.Close();
                    **/




                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('新增完成');", true);
                    ListBox1.Items.Clear();


                    Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");
                    //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                    //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close();opener.location.reload();</script>");
                    //Application["projectname"] = project;
                }
                else
                {


                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同自主檢查表');", true);

                }


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
            }

        }

        public bool datacheck(string data, string data2)
        {

            String Projectid = Session["ProjectCode"].ToString();
            int i = 0;
            String name;
            string database = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));
            SqlDataReader reader;   //宣告一個DataReader
            SqlDataReader reader2;
            connStr.Open();

            String select1 = "select * from KCheckList where KCheckListEngineeringList ='" + data + "' and KCheckListProject='" + Projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                name = reader.GetString(3);
                i = i + 1;
            }
            reader.Close();

            String select2 = "select * from KCheckList where KCheckListEngineeringList ='" + data2 + "' and KCheckListProject='" + Projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd2 = new SqlCommand(select2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader2 = cmd2.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                name = reader2.GetString(3);
                i = i + 1;
            }
            reader2.Close();

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
            Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");
            
            //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text= ListBox1.SelectedItem.Text;


        }
    }
}