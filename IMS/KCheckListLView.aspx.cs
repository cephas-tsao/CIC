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
    public partial class KCheckListLView : System.Web.UI.Page
    {
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["KCheckListTimeId"].ToString();
            Label2.Text = Session["KCheckListDateTime"].ToString();
            String DBName = Session["DatabaseName"].ToString();
            String Projectid = Session["ProjectCode"].ToString();

            String Name = Session["Name"].ToString();
            personLabel.Text = Name;

            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結

            //查專案名稱
            String selectproject = "select* from ProjectM0 where PID = '" + Projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdproject = new SqlCommand(selectproject, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdproject.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                   //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                ProjectLabel.Text = reader.GetString(7);
            }
            reader.Close();
            //查專案名稱

            String selecta = "select * from KCheckListTime where  KCheckListTimeId = '" + Label1.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1a = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1a.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //int KCheckListProjectid = (int)reader["KCheckListProject"];
                //ProjectidLabel.Text = KCheckListProjectid.ToString();

                //int KCheckListEngineeringListid = (int)reader["KCheckListEngineeringList"];
                //EngineeringidLabel.Text = KCheckListEngineeringListid.ToString();
                EngineeringidLabel.Text = reader.GetString(1);
                EngineeringNameLabel.Text = reader.GetString(4);
                DateTime.Text = reader.GetString(2);
                personLabel1.Text = reader.GetString(3);
                LocationLabel.Text = reader.GetString(5);
            }
            reader.Close();




            TableHeaderCell header = new TableHeaderCell();
            header.RowSpan = 1;
            header.ColumnSpan = 4;
            header.Text = "施工前";
            header.Font.Bold = true;
            header.CssClass = "Table0";
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
            TableCell cell3;//狀態
            TableCell cell4;//時間
           
            TableCell cell6;//改善內容
            TableCell cell7;

            String select1 = "select* from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId = KCheckListItemSt.KCheckListItem where DateTime = '" + Label2.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemPhase = '施工前' and Grade='不合格'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(8);
                labell.Text = gradee;

                Label labbel = new Label();
                labbel.ID = "labblll" + i;
                labbel.Text = reader.GetString(2);


                String remark = reader.GetString(10);
                //String Person = reader.GetString(3);

                int KCheckListItemStId = (int)reader["KCheckListItemStId"];
                //String checkmissid = reader.GetString(0);
                Button bb = new Button();  //改善內容按鈕---------
                bb.ID = KCheckListItemStId.ToString();
                bb.Text = "改善追蹤";
                bb.CssClass = "BtnLargeMediumm";
                bb.Click += new EventHandler(bb_Click); //---------改善內容按鈕


                /**
                Button bbb = new Button();  //上傳按鈕---------
                bbb.ID = KCheckListLostId.ToString() + "a";
                bbb.Text = "改善文件上傳";
                bbb.CssClass = "BtnLargeMediumm";
                bbb.Click += new EventHandler(bbb_Click); //---------上傳按鈕
    */
                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                //cell5 = new TableCell();
                cell6 = new TableCell();
                cell7 = new TableCell();


                cell.Text = itemname;
                // cell1.Controls.Add(radioList);



                cell1.Controls.Add(labell);

                //cell1.Text = gradeee;
                //cell2.Text = Person;
                cell3.Text = remark;
                //cell4.Controls.Add(labbel);
                cell6.Controls.Add(bb);
                //cell7.Controls.Add(bbb);
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
               
                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell2);
                //row.Cells.Add(cell4);
                //row.Cells.Add(cell5);
                row.Cells.Add(cell3);
                row.Cells.Add(cell6);
                //row.Cells.Add(cell7);

                Table1.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();

            
            TableHeaderCell header1 = new TableHeaderCell();
            header1.RowSpan = 1;
            header1.ColumnSpan = 4;
            header1.Text = "施工中";
            header1.Font.Bold = true;
            header1.CssClass = "Table0";
            header1.HorizontalAlign = HorizontalAlign.Center;
            header1.VerticalAlign = VerticalAlign.Middle;
            // Add the header to a new row.
            TableRow headerRow1 = new TableRow();
            headerRow1.Cells.Add(header1);

            // Add the header row to the table.
            Table1.Rows.AddAt(i + 1, headerRow1);

            String select2 = "select* from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId = KCheckListItemSt.KCheckListItem where DateTime = '" + Label2.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemPhase = '施工中' and Grade='不合格'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd2 = new SqlCommand(select2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd2.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(8);
                labell.Text = gradee;

                Label labbel = new Label();
                labbel.ID = "labblll" + i;
                labbel.Text = reader.GetString(2);


                String remark = reader.GetString(10);
                //String Person = reader.GetString(3);

                int KCheckListItemStId = (int)reader["KCheckListItemStId"];
                //String checkmissid = reader.GetString(0);
                Button bb = new Button();  //改善內容按鈕---------
                bb.ID = KCheckListItemStId.ToString();
                bb.Text = "改善追蹤";
                bb.CssClass = "BtnLargeMediumm";
                bb.Click += new EventHandler(bb_Click); //---------改善內容按鈕


                /**
                Button bbb = new Button();  //上傳按鈕---------
                bbb.ID = KCheckListLostId.ToString() + "a";
                bbb.Text = "改善文件上傳";
                bbb.CssClass = "BtnLargeMediumm";
                bbb.Click += new EventHandler(bbb_Click); //---------上傳按鈕
    */
                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                //cell5 = new TableCell();
                cell6 = new TableCell();
                cell7 = new TableCell();


                cell.Text = itemname;
                // cell1.Controls.Add(radioList);



                cell1.Controls.Add(labell);

                //cell1.Text = gradeee;
                //cell2.Text = Person;
                cell3.Text = remark;
                //cell4.Controls.Add(labbel);
                cell6.Controls.Add(bb);
                //cell7.Controls.Add(bbb);
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();

                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell2);
                //row.Cells.Add(cell4);
                //row.Cells.Add(cell5);
                row.Cells.Add(cell3);
                row.Cells.Add(cell6);
                //row.Cells.Add(cell7);

                Table1.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();





            TableHeaderCell header3 = new TableHeaderCell();
            header3.RowSpan = 1;
            header3.ColumnSpan = 4;
            header3.Text = "施工後";
            header3.Font.Bold = true;
            header3.CssClass = "Table0";
            header3.HorizontalAlign = HorizontalAlign.Center;
            header3.VerticalAlign = VerticalAlign.Middle;
            // Add the header to a new row.
            TableRow headerRow3 = new TableRow();
            headerRow3.Cells.Add(header3);

            // Add the header row to the table.
            Table1.Rows.AddAt(i + 2, headerRow3);

            String select3 = "select* from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId = KCheckListItemSt.KCheckListItem where DateTime = '" + Label2.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemPhase = '施工後' and Grade='不合格'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd3 = new SqlCommand(select3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd3.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                Label labell = new Label();
                labell.ID = "labll" + i;
                String gradee = reader.GetString(8);
                labell.Text = gradee;

                Label labbel = new Label();
                labbel.ID = "labblll" + i;
                labbel.Text = reader.GetString(2);


                String remark = reader.GetString(10);
                //String Person = reader.GetString(3);

                int KCheckListItemStId = (int)reader["KCheckListItemStId"];
                //String checkmissid = reader.GetString(0);
                Button bb = new Button();  //改善內容按鈕---------
                bb.ID = KCheckListItemStId.ToString();
                bb.Text = "改善追蹤";
                bb.CssClass = "BtnLargeMediumm";
                bb.Click += new EventHandler(bb_Click); //---------改善內容按鈕


                /**
                Button bbb = new Button();  //上傳按鈕---------
                bbb.ID = KCheckListLostId.ToString() + "a";
                bbb.Text = "改善文件上傳";
                bbb.CssClass = "BtnLargeMediumm";
                bbb.Click += new EventHandler(bbb_Click); //---------上傳按鈕
    */
                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                //cell5 = new TableCell();
                cell6 = new TableCell();
                cell7 = new TableCell();


                cell.Text = itemname;
                // cell1.Controls.Add(radioList);



                cell1.Controls.Add(labell);

                //cell1.Text = gradeee;
                //cell2.Text = Person;
                cell3.Text = remark;
                //cell4.Controls.Add(labbel);
                cell6.Controls.Add(bb);
                //cell7.Controls.Add(bbb);
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();

                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                //row.Cells.Add(cell2);
                //row.Cells.Add(cell4);
                //row.Cells.Add(cell5);
                row.Cells.Add(cell3);
                row.Cells.Add(cell6);
                //row.Cells.Add(cell7);

                Table1.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();





        }
        void bb_Click(object sender, EventArgs e) //檢核按鈕
        {
            Button b = sender as Button;
            String KCheckListItemStId = b.ID;

            Session["KCheckListItemStId"]  = KCheckListItemStId;
            //Server.Transfer("checkmisscontent.aspx");
            this.Page.Controls.Add(new LiteralControl("<script>var w = window.open('KCheckListLContent.aspx','_blank','menubar=no,status=no,scrollbars=no,top=0,left=0,toolbar=no,width=800,height=600'); w.focus();</script>"));
            // Label1.Text = b.ID;
        }

        /**
        void bbb_Click(object sender, EventArgs e) //上傳按鈕
        {
            Button bb = sender as Button;
            String checkmisss = bb.ID;
            String checkmiss = checkmisss.Replace("a", "");
            Session["KCheckListLostId"] = checkmiss;
            //Server.Transfer("checkmisscontent.aspx");
            this.Page.Controls.Add(new LiteralControl("<script>var w = window.open('KCheckListLUpload.aspx','_blank','menubar=no,status=no,scrollbars=no,top=0,left=0,toolbar=no,width=800,height=600'); w.focus();</script>"));
            // Label1.Text = b.ID;
        }
    **/
    }


}