using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Form
{
    public partial class checklisthistory : System.Web.UI.Page
    {
        String projectcplaceiddd;
        int i;





        protected void Page_Load(object sender, EventArgs e)
        {



            //Calendar1.TodaysDate = DateTime.Now;
            //String aaaa = Calendar1.TodaysDate.ToString("d");
            //TextBox1.Text="請選擇";
            Button1.Click += new EventHandler(Button1_Click);
            //Button1.Visible = false;
            Label5.Text = Server.HtmlEncode(Request.Cookies["userName"].Value);

            //String cplaceidd;
            Application.Lock();
            String cplaceid = Application["cplaceid"].ToString();
            //string cplaceid = cplaceidd.Replace("a", "");
            //int[,] ia = (int[,])Application["ia"];
            //String cplaceprojectid = Application["cplaceprojectid"].ToString();
            Application.UnLock();

            //String cplaceprojectidd = Session["cplaceprojectid"].ToString();
            //String cplaceid = Session["cplaceid"].ToString();
            //Session.Remove("cplaceprojectid");
            // Session.Remove("cplaceid"); 

            // String cplaceid = "1";
            Label6.Text = cplaceid;
            //Label7.Text = cplaceiddd;

            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結



            String select2 = "select * from checkplace where cplaceid ='" + cplaceid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd2 = new SqlCommand(select2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd2.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectcplaceidd = (int)reader["projectcplaceid"];
                projectcplaceiddd = projectcplaceidd.ToString();
                Label2.Text = projectcplaceiddd.ToString();
                Label1.Text = reader.GetString(1);
            }
            reader.Close();

            Label2.Visible = false;

            String select = "select * from project where projectid ='" + projectcplaceiddd + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = (int)reader["projectid"];

                Label4.Text = reader.GetString(1);

            }

            reader.Close();

            String selectt1 = "select * from checkplacetime where checkplaceid='" + cplaceid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1t = new SqlCommand(selectt1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1t.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {

                int checkplacetimeid = (int)reader["checkplacetimeid"];

                DropDownList1.Items.Add(new ListItem(reader.GetString(2) + "---" + reader.GetString(3), checkplacetimeid.ToString()));


            }
            reader.Close();








            connStr.Close();


        }
        protected void Button4_Click(object sender, EventArgs e)//回首頁
        {
            //Server.Transfer("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String checkplacetimeid = DropDownList1.SelectedValue;
            Application["checkplacetimeid"] = checkplacetimeid;
            Server.Transfer("checklisthistory2.aspx");



            /**
               RadioButtonList radioList1 = FindControl("radio2") as RadioButtonList;
               // RadioButtonList radioList1 = FindControl("radio"+d) as RadioButtonList;
               // CheckBox checkbox1 = FindControl("checkbox1") as CheckBox;
               if (radioList1.SelectedValue == "1")
               {
                   Label3.Text = "1";
               }
               else if (radioList1.SelectedValue == "2") { Label3.Text = "2"; }
               else if (radioList1.SelectedValue == "3") { Label3.Text = "3"; }
        **/
        }
    }
}