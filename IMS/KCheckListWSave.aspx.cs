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
    public partial class KCheckListWSave : System.Web.UI.Page
    {
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            String aaaa = DateTime.Now.ToString("yyyy/MM/dd");
            TextBox1.Text = aaaa;

            String KCheckListId= Session["KCheckListId"].ToString();
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

            //查位置跟自主檢查表ID
            String select1 = "select * from KCheckList where  KCheckListId = '"+ KCheckListId + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //int KCheckListProjectid = (int)reader["KCheckListProject"];
                //ProjectidLabel.Text = KCheckListProjectid.ToString();

                //int KCheckListEngineeringListid = (int)reader["KCheckListEngineeringList"];
                //EngineeringidLabel.Text = KCheckListEngineeringListid.ToString();
                EngineeringidLabel.Text = reader.GetString(3);
                EngineeringLabel.Text= reader.GetString(3);

                //LocationLabel.Text = reader.GetString(1);
            }
            reader.Close();
            //查位置跟自主檢查表ID

            /**
            //查自主檢查表名稱
            String selectEngineering = "select * from KCheckList where  KCheckListId = '" + EngineeringidLabel.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdEngineering = new SqlCommand(selectEngineering, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdEngineering.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                EngineeringLabel.Text = reader.GetString(1);
            }
            reader.Close();
            //查自主檢查表名稱
            **/

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

            String selectKEngineeringListItem1 = "select * from KCheckListItem where KCheckListId ='" + KCheckListId + "' and KCheckListItemPhase='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem1 = new SqlCommand(selectKEngineeringListItem1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem1.ExecuteReader(); 
                                          
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();
                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                
                cell2 = new TableCell();
                cell1.Width = 400;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);                
                cell2.Controls.Add(textbox);

                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);

                Table1.Rows.Add(row);
                i = i + 1;

            }

            reader.Close();

           

            String selectKEngineeringListItem2 = "select * from KCheckListItem where KCheckListId ='" + KCheckListId + "' and KCheckListItemPhase='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem2 = new SqlCommand(selectKEngineeringListItem2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem2.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();
                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell1.Width = 400;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);
                cell2.Controls.Add(textbox);

                row.Cells.Add(cell);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);

                Table2.Rows.Add(row);
                i = i + 1;

            }
            reader.Close();

            String selectKEngineeringListItem3 = "select * from KCheckListItem where KCheckListId ='" + KCheckListId + "' and KCheckListItemPhase='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdKEngineeringListItem3 = new SqlCommand(selectKEngineeringListItem3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdKEngineeringListItem3.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                //for(i=0;i<=reader.FieldCount-1;i++){
                //CheckBox radio = new CheckBox();
                RadioButtonList radioList = new RadioButtonList();

                radioList.ID = "radio" + i;

                TextBox textbox = new TextBox();
                textbox.ID = "textboxxx" + i;
                textbox.CssClass = "TBmiddle";

                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("合格", "合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("不合格", "不合格"));
                radioList.Items.Add(new System.Web.UI.WebControls.ListItem("未檢查", "未檢查"));

                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();

                cell2 = new TableCell();
                cell1.Width = 400;

                cell.Text = itemname;
                cell1.Controls.Add(radioList);
                cell2.Controls.Add(textbox);

                row.Cells.Add(cell);
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

            String KCheckListIdd = Session["KCheckListId"].ToString();

            if (datacheck(KCheckListIdd,Request.Form["TextBox1"].Trim(), personLabel.Text, EngineeringidLabel.Text, TextBox2.Text) == false)
            {

                

                String DBName = Session["DatabaseName"].ToString();
                SqlConnection connStrr = new SqlConnection(Utility.DBconnection.connect_string(DBName));

                SqlDataReader reader;
                connStrr.Open();


                String checkplacetimeperson = "INSERT INTO KCheckListTime(CheckList,DateTime,Person,CheckListEngineering,Location) Values('" + KCheckListIdd + "','" + Request.Form["TextBox1"].Trim() + "','" + personLabel.Text + "','" + EngineeringidLabel.Text + "','" + TextBox2.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdcheckplacetimeperson = new SqlCommand(checkplacetimeperson, connStrr);
                cmdcheckplacetimeperson.ExecuteNonQuery();

                String selectKCheckListTimeId = "select* from KCheckListTime where CheckList = '" + KCheckListIdd + "' and DateTime = '" + Request.Form["TextBox1"].Trim() + "' and CheckListEngineering = '" + EngineeringidLabel.Text + "' and Location = '" + TextBox2.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdKCheckListTimeId = new SqlCommand(selectKCheckListTimeId, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                reader = cmdKCheckListTimeId.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                       //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

                while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {
                    int KCheckListTimeIdd = (int)reader["KCheckListTimeId"];
                    KCheckListTimeId.Text = KCheckListTimeIdd.ToString();

                    //KCheckListTimeId.Text = reader.GetString(0);
                }
                reader.Close();




                for (int d = 1; d < i; d++)
                {
                    RadioButtonList gradee = FindControl("radio" + d) as RadioButtonList;
                    Label KCheckListItemidd = FindControl("labl" + d) as Label;
                    TextBox textboxx = FindControl("textboxxx" + d) as TextBox;

                    String gradeee = gradee.SelectedValue;
                    //if (gradeee == "") { }
                    //else {
                    //Request.Form["TextBox1"].Trim();
                    String citem = "INSERT INTO KCheckListItemSt(KCheckListItem,DateTime,Person,Grade,CheckListTime,Remark) Values('" + KCheckListItemidd.Text + "','" + Request.Form["TextBox1"].Trim() + "','" + personLabel.Text + "','" + gradee.SelectedValue + "','" + KCheckListTimeId.Text + "','" + textboxx.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmdcitem = new SqlCommand(citem, connStrr);
                    cmdcitem.ExecuteNonQuery();

                    /**
                        if (gradeee == "不合格" || gradeee == "未檢查")
                        {
                            String checkmiss = "INSERT INTO KCheckListLost(KCheckListItem,DateTime,Person,CheckList,Remark,Status) Values('" + KCheckListItemidd.Text + "','" + Request.Form["TextBox1"].Trim() + "','" + personLabel.Text + "','" + KCheckListIdd + "','" + textboxx.Text + "','" + gradee.SelectedValue + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                            SqlCommand cmdcheckmiss = new SqlCommand(checkmiss, connStrr);
                            cmdcheckmiss.ExecuteNonQuery();
                        }
                        else {

                        }
                **/
                    //};
                    // String gradeee = gradee.SelectedValue;

                    //   Response.Write(chitemidd.Text+gradeee);


                }






                connStrr.Close();


                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('填報完成，請自行關閉頁面');", true);
                Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");
                //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close();opener.location.reload();</script>");


            }

            else
                {


                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同檢查紀錄');", true);

            }



           



        }


        public bool datacheck(string data, string data2, string data3, string data4, string data5)
        {

            String Projectid = Session["ProjectCode"].ToString();
            int i = 0;
            String name;
            string database = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));
            SqlDataReader reader2;   //宣告一個DataReader
            //SqlDataReader reader2;
            connStr.Open();

            String select1 = "select * from KCheckListTime where CheckList = '" + data + "' and DateTime = '" + data2 + "' and CheckListEngineering = '" + data4 + "' and Location = '" + data5 + "'";   //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader2 = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                name = reader2.GetString(4);
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
        }

        /**
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Request.Form["TextBox1"].Trim();
            DropDownList b = sender as DropDownList;
            //b.SelectedValue
            if (b.SelectedValue == "施工前")
            {
                Table1.Visible = true;
                Table2.Visible = false;
                Table3.Visible = false;
            }
            else if (b.SelectedValue == "施工中")
            {
                Table1.Visible = false;
                Table2.Visible = true;
                Table3.Visible = false;
            }
            else if (b.SelectedValue == "施工後")
            {
                Table1.Visible = false;
                Table2.Visible = false;
                Table3.Visible = true;
            }
        }
        **/
    }
}