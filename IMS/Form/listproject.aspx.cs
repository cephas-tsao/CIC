using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;




namespace IMS.Form
{
    public partial class listproject : System.Web.UI.Page
    {
       int i = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button3.Attributes.Add("onclick ", "return confirm( '確定要刪除嗎');");

            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
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

            String select1 = "select * from project ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = (int)reader["projectid"];
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
        }
        protected void Button4_Click(object sender, EventArgs e)//回首頁
        {
            Server.Transfer("Default.aspx");
        }
        protected void Button1_Click(object sender, EventArgs e)//新增工程
        {
            Server.Transfer("addproject.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)//刪除工程
        {
            int a = 1;

            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            SqlDataReader readera;   //宣告一個DataReader
            connStr.Open();
            String selecta = "select projectid from project";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmda = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            readera = cmda.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = readera.GetInt32(0);

                CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
                if (checkbox.Checked == true)
                {
                    SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                    connStrr.Open();
                    String selectaa = "delete from project where projectid ='" + projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                    cmdaa.ExecuteNonQuery();
                    connStrr.Close();
                }
                else
                {

                }

                a = a + 1;

            }
            readera.Close();
            connStr.Close();
            Server.Transfer("listproject.aspx");
        }


        protected void Button2_Click(object sender, EventArgs e)//編輯工程
        {
            const int sizex = 2;
            int[,] ia = new int[i, sizex];
            int a = 1;

            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            SqlDataReader readera;   //宣告一個DataReader
            connStr.Open();
            String selecta = "select projectid from project";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmda = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            readera = cmda.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = readera.GetInt32(0);
                ia[a, 1] = projectid;

                CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
                if (checkbox != null)
                {
                    if (checkbox.Checked == true)
                    {
                        ia[a, 0] = 1;
                    }
                    else
                    {
                        ia[a, 0] = 0;
                    }

                    a = a + 1;

                }
            }
            readera.Close();
            connStr.Close();

            Application["ia"] = ia;

            Server.Transfer("editproject.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)//編輯工程項目
        {
            const int sizex = 3;
            String[,] ia = new String[i, sizex];
            int a = 1;
            int b = 0; //驗證勾選幾個
            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            SqlDataReader readera;   //宣告一個DataReader
            connStr.Open();
            String selecta = "select * from project";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmda = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            readera = cmda.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int projectid = readera.GetInt32(0);
                ia[a, 1] = projectid.ToString();

                String projectname = readera.GetString(1);
                ia[a, 2] = projectname;

                CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
                if (checkbox.Checked == true)
                {
                    ia[a, 0] = "1";
                    b = b + 1;
                }
                else
                {
                    ia[a, 0] = "0";
                }

                a = a + 1;

            }
            readera.Close();
            connStr.Close();

            if (b == 0)
            {
                Response.Write("<script>alert('無勾選工程，請重新勾選')</script>");
            }
            else if (b > 1)
            {
                Response.Write("<script>alert('請勿勾選兩個工程以上，請重新勾選一個工程')</script>");
            }
            else if (b == 1)
            {

                for (int y = 0; y < (ia.Length / ia.Rank); y++)  //ia.Length 為長度 總共有40個資料   
                {

                    if (ia[y, 0] == "1")
                    {
                        Application["project"] = ia[y, 2];
                        Server.Transfer("listitem.aspx");
                    }
                }
            }



            //Application["projectname"] = Label1.Text;
            //Server.Transfer("listitem.aspx");
        }
    }
 
}