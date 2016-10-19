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
    public partial class checklisthistory2 : System.Web.UI.Page
    {
        String projectcplaceiddd;
        String checkplaceidd;
        String cplaceid;
        String gradeee;

        int i;





        protected void Page_Load(object sender, EventArgs e)
        {
            //Calendar1.TodaysDate = DateTime.Now;
            //String aaaa = Calendar1.TodaysDate.ToString("d");
            //TextBox1.Text="請選擇";
            Button1.Click += new EventHandler(Button1_Click);
            //Button1.Visible = false;
            Label5.Text = Server.HtmlEncode(Request.Cookies["userName"].Value);

            String checkplacetimeid;
            Application.Lock();
            checkplacetimeid = Application["checkplacetimeid"].ToString();
            Application.UnLock();
            Label6.Text = checkplacetimeid;


            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結

            String selectt = "select * from checkplacetime where checkplacetimeid ='" + checkplacetimeid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd2t = new SqlCommand(selectt, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd2t.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //int checkplaceid = ;
                cplaceid = (string)reader["checkplaceid"];
                Label7.Text = (string)reader["checktime"];
                Label9.Text = (string)reader["person"];
                Label10.Text = (string)reader["person"];
                Label8.Text = cplaceid;
                //Label2.Text = projectcplaceiddd.ToString();
                //Label1.Text = reader.GetString(1);
            }
            reader.Close();


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

            TableHeaderCell header = new TableHeaderCell();
            header.RowSpan = 1;
            header.ColumnSpan = 3;
            header.Text = "施工前";
            header.Font.Bold = true;
            header.HorizontalAlign = HorizontalAlign.Center;
            header.VerticalAlign = VerticalAlign.Middle;
            // Add the header to a new row.
            TableRow headerRow = new TableRow();
            headerRow.Cells.Add(header);

            // Add the header row to the table.
            Table1.Rows.AddAt(1, headerRow);



            i = 1;


            TableRow row;
            TableCell cell;
            TableCell cell1;
            TableCell cell2;
            TableCell cell3;

            String select1 = "SELECT * FROM  chitemst INNER JOIN items ON chitemst.checkitemid = items.itemid where cplaceid ='" + Label8.Text + "' and phasee='施工前' and person='" + Label9.Text + "' and datetime='" + Label7.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
            //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(10);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int itemid = (int)reader["itemid"];
                Label.Text = itemid.ToString();
                this.Form.Controls.Add(Label);


                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(4);
                labell.Text = gradee;


                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                //cell3 = new TableCell();
                cell1.Width = 200;

                cell.Text = itemname;
                // cell1.Controls.Add(radioList);



                cell1.Controls.Add(labell);

                //cell1.Text = gradeee;
                cell2.Text = i.ToString();
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell2);
                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell3);

                Table1.Rows.Add(row);
                i = i + 1;

            }






            reader.Close();

            TableHeaderCell header1 = new TableHeaderCell();
            header1.RowSpan = 1;
            header1.ColumnSpan = 3;
            header1.Text = "施工中";
            header1.Font.Bold = true;
            header1.HorizontalAlign = HorizontalAlign.Center;
            header1.VerticalAlign = VerticalAlign.Middle;
            // Add the header to a new row.
            TableRow headerRow1 = new TableRow();
            headerRow1.Cells.Add(header1);

            // Add the header row to the table.
            Table1.Rows.AddAt(i + 1, headerRow1);

            String select3 = "SELECT * FROM  chitemst INNER JOIN items ON chitemst.checkitemid = items.itemid where cplaceid ='" + Label8.Text + "' and phasee='施工中' and person='" + Label9.Text + "' and datetime='" + Label7.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd3 = new SqlCommand(select3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd3.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(10);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int itemid = (int)reader["itemid"];
                Label.Text = itemid.ToString();
                this.Form.Controls.Add(Label);

                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(4);
                labell.Text = gradee;
                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();


                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                //cell3 = new TableCell();
                cell1.Width = 200;

                cell.Text = itemname;
                cell1.Controls.Add(labell);
                cell2.Text = i.ToString();
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell2);
                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell3);

                Table1.Rows.Add(row);
                i = i + 1;

            }

            reader.Close();

            TableHeaderCell header3 = new TableHeaderCell();
            header3.RowSpan = 1;
            header3.ColumnSpan = 3;
            header3.Text = "施工後";
            header3.Font.Bold = true;
            header3.HorizontalAlign = HorizontalAlign.Center;
            header3.VerticalAlign = VerticalAlign.Middle;
            // Add the header to a new row.
            TableRow headerRow3 = new TableRow();
            headerRow3.Cells.Add(header3);

            // Add the header row to the table.
            Table1.Rows.AddAt(i + 2, headerRow3);

            String select4 = "SELECT * FROM  chitemst INNER JOIN items ON chitemst.checkitemid = items.itemid where cplaceid ='" + Label8.Text + "' and phasee='施工後' and person='" + Label9.Text + "' and datetime='" + Label7.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd4 = new SqlCommand(select4, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd4.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(10);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int itemid = (int)reader["itemid"];
                Label.Text = itemid.ToString();
                this.Form.Controls.Add(Label);

                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(4);
                labell.Text = gradee;
                //for(i=0;i<=reader.FieldCount-1;i++){


                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                //cell3 = new TableCell();
                cell1.Width = 200;

                cell.Text = itemname;
                cell1.Controls.Add(labell);
                cell2.Text = i.ToString();
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell2);
                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell3);

                Table1.Rows.Add(row);
                i = i + 1;

            }



            connStr.Close();




        }
        protected void Button4_Click(object sender, EventArgs e)//回首頁
        {
            Server.Transfer("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
            //SqlDataReader readerid;   //宣告一個DataReader

            connStrr.Open();

            for (int d = 1; d < i; d++)
            {
                RadioButtonList gradee = FindControl("radio" + d) as RadioButtonList;
                Label chitemidd = FindControl("labl" + d) as Label;
                // '" + chitemidd.Text + "'
                //String citem = "INSERT INTO chitemst(checkitemid,datetime,person,grade) Values(1,1,1,1)";

                //String citem = "INSERT INTO chitemst(checkitemid,datetime,person,grade,cplaceid) Values('" + chitemidd.Text + "','" + TextBox1.Text + "','" + Label5.Text + "','" + gradee.SelectedValue + "','" + Label6.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                //SqlCommand cmdcitem = new SqlCommand(citem, connStrr);
                //cmdcitem.ExecuteNonQuery();

            }

            //String checkplacetimeperson = "INSERT INTO checkplacetime(checkplaceid,checktime,person,projectcplaceid) Values('" + Label6.Text + "','" + TextBox1.Text + "','" + Label5.Text + "','" + Label2.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
            //SqlCommand cmdcheckplacetimeperson = new SqlCommand(checkplacetimeperson, connStrr);
            //cmdcheckplacetimeperson.ExecuteNonQuery();


            connStrr.Close();

            Server.Transfer("listplace.aspx");


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