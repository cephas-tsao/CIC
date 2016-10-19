using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;


namespace IMS.Form
{
    public partial class listplace : System.Web.UI.Page
    {
        int i = 1;
        String projectcplacename;

        void bb_Click(object sender, EventArgs e) //檢核按鈕
        {
            Button b = sender as Button;
            String cplaceiddd = b.ID;

            Application["cplaceid"] = cplaceiddd;
            Server.Transfer("checklist.aspx");
            // Label1.Text = b.ID;
        }

        void bbb_Click(object sender, EventArgs e) //歷史紀錄按鈕
        {
            Button bb = sender as Button;
            String cplaceidddd = bb.ID;
            String cplaceid = cplaceidddd.Replace("a", "");
            Label ecplacprojectidd = FindControl("labeel" + cplaceid) as Label;
            Label cplaceiddd = FindControl("labeeel" + cplaceid) as Label;

            //Label2.Text = ecplacprojectidd.Text;

            //Session["cplaceprojectid"] = ecplacprojectidd.Text;
            //Session["cplaceid"] = cplaceiddd.Text;
            //Response.Redirect("checklisthistory.aspx"); 


            //Application["cplaceprojectid"] = cplaceprojectidd.Text;
            Application["cplaceid"] = cplaceiddd.Text;
            Server.Transfer("checklisthistory.aspx");

            // Label1.Text = b.ID;
        }

        void bbbb_Click(object sender, EventArgs e) //修改按鈕
        {
            Button bbb = sender as Button;
            String cplaceiddd = bbb.ID;

            Application["cplaceid"] = cplaceiddd;
            Server.Transfer("editplace.aspx");
        }

        void bbbbb_Click(object sender, EventArgs e) //刪除按鈕
        {
            Button bbbb = sender as Button;
            String s = bbbb.ID;
            //string[] sArray = s.Split('c');
            String s_msg = s.Replace("c", "");
            SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            connStrr.Open();
            String selectaa = "delete from checkplace where cplaceid ='" + s_msg + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            cmdaa.ExecuteNonQuery();
            connStrr.Close();
            // Label1.Text = b.ID;
            Server.Transfer("listplace.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {




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
            TableCell cell4;
            TableCell cell5;
            TableCell cell6;
            TableCell cell7;
            TableCell cell8;

            String select1 = "select * from checkplace ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                int cplaceid = (int)reader["cplaceid"];
                String cplacename = reader.GetString(1);
                String p1p2p3p4 = reader.GetString(2) + "區 " + reader.GetString(3) + "棟 " + reader.GetString(4) + "樓 " + reader.GetString(5) + "戶";
                int projectid = (int)reader["projectcplaceid"];
                String projectidd = projectid.ToString();

                SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                connStrr.Open();
                SqlDataReader readeraa;
                //String selectaa = "select * from project where projectid ='" + projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                String selectaa = "select * from project where projectid ='" + projectidd + "'";
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                readeraa = cmdaa.ExecuteReader();
                while (readeraa.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {
                    projectcplacename = readeraa.GetString(1);
                }
                readeraa.Close();
                connStrr.Close();

                Button bb = new Button();  //檢核按鈕---------
                bb.ID = cplaceid.ToString();
                bb.Text = "檢核";
                bb.Click += new EventHandler(bb_Click); //---------檢核按鈕


                Label Labeel = new Label(); // projectidd
                Labeel.ID = "labeel" + i;
                Labeel.Text = projectidd;
                Labeel.Visible = false;
                this.Form.Controls.Add(Labeel);

                Label Labeeel = new Label(); // projectidd
                Labeeel.ID = "labeeel" + i;
                Labeeel.Text = cplaceid.ToString();
                Labeeel.Visible = false;
                this.Form.Controls.Add(Labeeel);




                Button bbb = new Button();  //歷史按鈕---------
                bbb.ID = i.ToString() + "a";
                bbb.Text = "歷史紀錄";
                bbb.Click += new EventHandler(bbb_Click); //---------歷史按鈕

                Button bbbb = new Button();  //修改按鈕---------
                bbbb.ID = cplaceid.ToString() + "b";
                bbbb.Text = "修改";
                bbbb.Click += new EventHandler(bbbb_Click); //---------修改按鈕

                Button bbbbb = new Button();  //刪除按鈕---------
                bbbbb.ID = cplaceid.ToString() + "c";
                bbbbb.Text = "刪除";
                bbbbb.Click += new EventHandler(bbbbb_Click); //---------刪除按鈕
                bbbbb.Attributes.Add("onclick ", "return confirm( '確定要刪除嗎');");
                row = new TableRow();

                cell = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell5 = new TableCell();
                cell6 = new TableCell();
                cell7 = new TableCell();
                cell8 = new TableCell();

                cell.Text = i.ToString();
                cell2.Text = cplacename;
                cell3.Text = projectcplacename;
                cell4.Text = p1p2p3p4;
                cell5.Controls.Add(bb);
                cell6.Controls.Add(bbb);
                cell7.Controls.Add(bbbb);
                cell8.Controls.Add(bbbbb);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                row.Cells.Add(cell6);
                row.Cells.Add(cell7);
                row.Cells.Add(cell8);
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
            Server.Transfer("addplace.aspx");
        }   
   
    }
}