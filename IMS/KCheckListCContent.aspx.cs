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
    public partial class KCheckListCContent : System.Web.UI.Page
    {
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["KCheckListTimeId"].ToString();
            Label2.Text = Session["KCheckListDateTime"].ToString();
            //String aaaa=System.DateTime.Now.ToString("yyyy/MM/dd");
            //String aaaa = System.Datetime.Now.ToString("yyyy/MM/dd");
            TextBox1.Text = Label2.Text;
            Label13.Text = Label2.Text;
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
                KCheckListIdLabel.Text = reader.GetString(1);
                EngineeringLabel.Text = reader.GetString(4);

                LocationTextBox2.Text = reader.GetString(5);//位置
                Label12.Text = reader.GetString(5);//位置
            }
            reader.Close();
            //查自主檢查表ID


            //查自主檢查表位置
            String selectEngineering = "select * from KCheckList where  KCheckListId = '" + KCheckListIdLabel.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdEngineering = new SqlCommand(selectEngineering, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdEngineering.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                       //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //EngineeringLabel.Text = reader.GetString(1);
                //LocationTextBox2.Text = reader.GetString(1);
            }
            reader.Close();
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

            String selectKEngineeringListItem1 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and  CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
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
                gradeLabel.Visible = false;
                this.Form.Controls.Add(gradeLabel);

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;
                personLabel.Visible = false;
                this.Form.Controls.Add(personLabel);

                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                remarkLabel.Visible = false;
                this.Form.Controls.Add(remarkLabel);



                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();
                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.Text = remark;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                if (grade == "合格")
                {
                    radioList.Items.FindByValue("合格").Selected = true;
                }
                else if (grade == "不合格")
                {
                    radioList.Items.FindByValue("不合格").Selected = true;
                }
                else if (grade == "未檢查")

                {
                    radioList.Items.FindByValue("未檢查").Selected = true;
                }



                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();

                cell1.Width = 150;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);
                cell2.Controls.Add(textbox);
                //cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                //row.Cells.Add(cell3);

                //row.Cells.Add(cell4);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);

                Table1.Rows.Add(row);
                i = i + 1;

            }

            reader.Close();



            String selectKEngineeringListItem2 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and  CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
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
                gradeLabel.Visible = false;
                this.Form.Controls.Add(gradeLabel);

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;
                personLabel.Visible = false;
                this.Form.Controls.Add(personLabel);

                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                remarkLabel.Visible = false;
                this.Form.Controls.Add(remarkLabel);

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);



                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.Text = remark;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                if (grade == "合格")
                {
                    radioList.Items.FindByValue("合格").Selected = true;
                }
                else if (grade == "不合格")
                {
                    radioList.Items.FindByValue("不合格").Selected = true;
                }
                else if (grade == "未檢查")

                {
                    radioList.Items.FindByValue("未檢查").Selected = true;
                }




                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell1.Width = 150;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);
                cell2.Controls.Add(textbox);
                //cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                //row.Cells.Add(cell3);
                //row.Cells.Add(cell4);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);

                Table2.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();




            String selectKEngineeringListItem3 = "select * from KCheckListItem INNER JOIN KCheckListItemSt ON KCheckListItem.KCheckListItemId=KCheckListItemSt.KCheckListItem where DateTime='" + Label2.Text + "' and  CheckListTime='" + Label1.Text + "' and KCheckListItemPhase='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
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
                gradeLabel.Visible = false;
                this.Form.Controls.Add(gradeLabel);

                Label personLabel = new Label();
                personLabel.ID = "personlabl" + i;
                personLabel.Text = person;
                personLabel.Visible = false;
                this.Form.Controls.Add(personLabel);


                Label remarkLabel = new Label();
                remarkLabel.ID = "remarklabl" + i;
                remarkLabel.Text = remark;
                remarkLabel.Visible = false;
                this.Form.Controls.Add(remarkLabel);

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.Text = remark;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                if (grade == "合格")
                {
                    radioList.Items.FindByValue("合格").Selected = true;
                }
               else if (grade == "不合格")
                {
                    radioList.Items.FindByValue("不合格").Selected = true;
                }else if (grade == "未檢查")

                {
                    radioList.Items.FindByValue("未檢查").Selected = true;
                }


                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell1.Width = 150;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);
                cell2.Controls.Add(textbox);
                //cell3.Controls.Add(gradeLabel);
                //cell4.Controls.Add(personLabel);

                row.Cells.Add(cell);
                //row.Cells.Add(cell3);
                //row.Cells.Add(cell4);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);

                Table3.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();



            connStr.Close();
        }
        protected void SaveAction(object sender, EventArgs e)
        {
            String DBName = Session["DatabaseName"].ToString();
            String Projectid = Session["ProjectCode"].ToString(); //專案ID
                                                                  //KCheckListIdLabel.Text  檢查表ID
                                                                  // Label2.Text 日期
                                                                  //personLabel.Text 目前人的名字

            Label14.Text = Request.Form["LocationTextBox2"].Trim();
            Label15.Text = Request.Form["TextBox1"].Trim(); 
            String a= "x";
            String b="x";
            String x = "x";
            String z = "z";
           

            SqlConnection connStrr = new SqlConnection(Utility.DBconnection.connect_string(DBName));

            connStrr.Open();


            String selectaaab = "UPDATE KCheckListTime SET  DateTime='" + Request.Form["TextBox1"].Trim() + "' ,Location='" + Request.Form["LocationTextBox2"].Trim() + "' WHERE  KCheckListTimeId = '" + Label1.Text + "'";
            //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
            SqlCommand cmdaaab = new SqlCommand(selectaaab, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            cmdaaab.ExecuteNonQuery();




            for (int d = 1; d < i; d++)
            {
                String gradeSQL;
                String personSQL;
                String remarkSQL;

                RadioButtonList gradee = FindControl("radio" + d) as RadioButtonList; //完成度
                String gradeee = gradee.SelectedValue;

                Label KCheckListItemidd = FindControl("labl" + d) as Label; //檢查項目ID
                TextBox textboxx = FindControl("textboxxx" + d) as TextBox; //備註

                Label itemstidd = FindControl("itemstidlabl" + d) as Label; //項目ID

                Label beforegrade = FindControl("gradelabl" + d) as Label; //之前完成度
                Label beforeperson = FindControl("personlabl" + d) as Label; //之前檢查人員
                Label beforeremark = FindControl("remarklabl" + d) as Label; //之前備註

                Label6.Text = Label6.Text+ KCheckListItemidd.Text;
                Label7.Text = Label7.Text+textboxx.Text;
                Label8.Text = Label8.Text+gradeee;
                Label9.Text = Label9.Text + beforegrade.Text;
                Label10.Text = Label10.Text + beforeperson.Text;
                Label11.Text = Label11.Text + beforeremark.Text;



               
                if (gradee.SelectedValue == beforegrade.Text|| gradee.SelectedValue == "")
                {
                    
                   
                }
                else {
                    gradeSQL = gradee.SelectedValue;

                    String selectaa = "UPDATE KCheckListItemSt SET  Grade='" + gradeSQL + "' WHERE KCheckListItem = '" + KCheckListItemidd.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemStId='" + itemstidd.Text + "' ";
                    //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                    SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                    cmdaa.ExecuteNonQuery();

                }
               
               if (textboxx.Text == beforeremark.Text)
               {
                                     
               }
               else {
                   remarkSQL = textboxx.Text;
                   String selectaa = "UPDATE KCheckListItemSt SET  Remark='" + remarkSQL + "' WHERE KCheckListItem = '" + KCheckListItemidd.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemStId='" + itemstidd.Text + "'";
                   //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                   SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                   cmdaa.ExecuteNonQuery();

               }
               if (gradee.SelectedValue == beforegrade.Text || textboxx.Text == beforeremark.Text|| gradee.SelectedValue == null)
               {
                  // personSQL = personLabel.Text;
               }

               else { personSQL = personLabel.Text;
                   String selectaa = "UPDATE KCheckListItemSt SET  Person='" + personSQL + "' WHERE KCheckListItem = '" + KCheckListItemidd.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemStId='" + itemstidd.Text + "'";
                   //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                   SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                   cmdaa.ExecuteNonQuery();
               }



                String selectaac = "UPDATE KCheckListItemSt SET  DateTime='" + Label15.Text + "' WHERE KCheckListItem = '" + KCheckListItemidd.Text + "' and CheckListTime = '" + Label1.Text + "' and KCheckListItemStId='" + itemstidd.Text + "' ";
                //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                SqlCommand cmdaac = new SqlCommand(selectaac, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdaac.ExecuteNonQuery();




                /**
                String selectaa = "UPDATE KCheckListItemSt SET DateTime='" + Request.Form["TextBox1"].Trim() + "'  and Person='" + personSQL + "' and Grade='" + gradeSQL + "' and Remark='" + remarkSQL + "' WHERE KCheckListItem = '" + KCheckListItemidd.Text + "' and CheckList = '" + KCheckListIdLabel.Text + "'";
                //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdaa.ExecuteNonQuery();
                **/



            }




            connStrr.Close();

            Session["KCheckListDateTime"] = Label15.Text;


            Response.AddHeader("Refresh", "0");




        }
        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>window.close();</" + "script>");
        }



    }
}