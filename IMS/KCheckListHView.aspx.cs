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
    public partial class KCheckListHView : System.Web.UI.Page
    {
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = Session["KCheckListTimeId"].ToString();
            Label2.Text = Session["KCheckListDateTime"].ToString();
            //String aaaa=System.DateTime.Now.ToString("yyyy/MM/dd");
            //String aaaa = System.Datetime.Now.ToString("yyyy/MM/dd");
            //TextBox1.Text = Label2.Text;

            //String KCheckListId = Session["KCheckListId"].ToString();
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

            //查自主檢查表ID跟名稱
            String select1 = "select * from KCheckListTime where  KCheckListTimeId = '" + Label1.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //int KCheckListProjectid = (int)reader["KCheckListProject"];
                //ProjectidLabel.Text = KCheckListProjectid.ToString();

                //int KCheckListEngineeringListid = (int)reader["KCheckListEngineeringList"];
                //EngineeringidLabel.Text = KCheckListEngineeringListid.ToString();
                EngineeringidLabel.Text = reader.GetString(1);
                EngineeringNameLabel.Text = reader.GetString(4);
                DateTime.Text= reader.GetString(2);
                personLabel1.Text = reader.GetString(3);
                LocationLabel.Text = reader.GetString(5);
            }
            reader.Close();
            //查自主檢查表ID


            //查自主檢查表位置
            //String selectEngineering = "select * from KCheckList where  KCheckListId = '" + KCheckListIdLabel.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            //SqlCommand cmdEngineering = new SqlCommand(selectEngineering, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            //reader = cmdEngineering.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                       //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            //while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            //{
                //EngineeringLabel.Text = reader.GetString(1);
                //LocationTextBox2.Text = reader.GetString(1);
           // }
            //reader.Close();
            //查自主檢查表名稱


            /**
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
            **/

            i = 1;

            TableRow row;
            TableCell cell;
            TableCell cell1;
            TableCell cell2;
            TableCell cell3;
            TableCell cell4;

            String selectKEngineeringListItem1 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem1 = new SqlCommand(selectKEngineeringListItem1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem1.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);
                String grade = reader.GetString(8);
                String remark = reader.GetString(10);
                String person = reader.GetString(7);
                int? projectid = null;
                projectid = (int)reader["KCheckListItemStId"];
                String itemstid = projectid.ToString();


                Label itemstidLabel = new Label();
                itemstidLabel.ID = "itemstidlabl" + i;
                itemstidLabel.Text = itemstid;
                itemstidLabel.Visible = false;
                this.Form.Controls.Add(itemstidLabel);




                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                Label gradeLabel = new Label();
                gradeLabel.ID = "gradelabl" + i;
                gradeLabel.Text = grade;

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;

                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                //remarkLabel.Visible = false;
                //this.Form.Controls.Add(remarkLabel);



                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();
                

              
               
                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();

                cell1.Width = 150;

                cell.Text = itemname;
                cell2.Controls.Add(remarkLabel);
                cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                row.Cells.Add(cell3);
                //row.Cells.Add(cell4);
                
                row.Cells.Add(cell2);

                Table1.Rows.Add(row);
                i = i + 1;

            }

            reader.Close();



            String selectKEngineeringListItem2 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem2 = new SqlCommand(selectKEngineeringListItem2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem2.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);
                String grade = reader.GetString(8);
                String remark = reader.GetString(10);
                String person = reader.GetString(7);


                int? projectid = null;
                projectid = (int)reader["KCheckListItemStId"];
                String itemstid = projectid.ToString();


                Label itemstidLabel = new Label();
                itemstidLabel.ID = "itemstidlabl" + i;
                itemstidLabel.Text = itemstid;
                itemstidLabel.Visible = false;
                this.Form.Controls.Add(itemstidLabel);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                Label gradeLabel = new Label();
                gradeLabel.ID = "gradelabl" + i;
                gradeLabel.Text = grade;

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;

                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                //remarkLabel.Visible = false;
                //this.Form.Controls.Add(remarkLabel);

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);

             


                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell1.Width = 150;

                cell.Text = itemname;
               
                cell2.Controls.Add(remarkLabel);
                cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                row.Cells.Add(cell3);
                //row.Cells.Add(cell4);
                
                row.Cells.Add(cell2);

                Table2.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();




            String selectKEngineeringListItem3 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem3 = new SqlCommand(selectKEngineeringListItem3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem3.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);
                String grade = reader.GetString(8);
                String remark = reader.GetString(10);
                String person = reader.GetString(7);

                int? projectid = null;
                projectid = (int)reader["KCheckListItemStId"];
                String itemstid = projectid.ToString();


                Label itemstidLabel = new Label();
                itemstidLabel.ID = "itemstidlabl" + i;
                itemstidLabel.Text = itemstid;
                itemstidLabel.Visible = false;
                this.Form.Controls.Add(itemstidLabel);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                Label gradeLabel = new Label();
                gradeLabel.ID = "gradelabl" + i;
                gradeLabel.Text = grade;

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;

                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                //remarkLabel.Visible = false;
                //this.Form.Controls.Add(remarkLabel);

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);



              
               

                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell1.Width = 150;

                cell.Text = itemname;
                
                cell2.Controls.Add(remarkLabel);
                cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                row.Cells.Add(cell3);
                //row.Cells.Add(cell4);
                
                row.Cells.Add(cell2);

                Table3.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();



            connStr.Close();
        }

        
    }
}