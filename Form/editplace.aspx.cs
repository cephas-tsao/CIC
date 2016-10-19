using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class edititem : System.Web.UI.Page
{
    int aa = 0;
    int cc = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        String cplaceidd;
        Application.Lock();
        cplaceidd = Application["cplaceid"].ToString();
        String cplaceid = cplaceidd.Replace("b", "");
        //int[,] ia = (int[,])Application["ia"];
        Application.UnLock();
       // Label1.Text = projectname;


        TableRow row;
        TableRow row2;
        TableRow row3;
        TableCell cell;
        TableCell cell2;
        TableCell cell3;
        TableCell cell4;
        TableCell cell5;
        TableCell cell6;
        TableCell cell7;
        TableCell cell8;
        TableCell cell9;
        TableCell cell10;
        TableCell cell11;
        TableCell cell12;
        TableCell cell13;
       
                SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                SqlDataReader reader;   //宣告一個DataReader

                connStr.Open(); //開啟資料庫的連結
                String select = "select * from checkplace where cplaceid ='" + cplaceid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
              
                while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {
                    String cplacename = reader.GetString(1);

                     Label Label = new Label();
                     Label.ID = "labl0";
                     Label.Visible = false;

                     int id = (int)reader["cplaceid"];
                     Label.Text = id.ToString();
                     this.Form.Controls.Add(Label);

               
               
                Table table = new Table();
                table.ID = "table"+aa ;
               // table.BorderStyle=;
                table.BorderColor = System.Drawing.Color.Red; 
                table.BorderWidth=1;
              
                row = new TableRow();           
                cell = new TableCell();
                cell2 = new TableCell();
                TextBox TextBox = new TextBox();
                TextBox.ID = "TetBox";
                TextBox.Text = cplacename;
                cell.Text = "工地名稱：";
                cell2.Controls.Add(TextBox);
                row.Cells.Add(cell);
                row.Cells.Add(cell2);
                table.Rows.Add(row);

             //CheckBox checkbox = new CheckBox();
             //checkbox.ID = "checkbox";

                row2 = new TableRow();
                cell3 = new TableCell();
                cell4 = new TableCell();
                cell5 = new TableCell();
                cell6 = new TableCell();
                cell7 = new TableCell();
                cell8 = new TableCell();
                cell9 = new TableCell();
                cell10 = new TableCell();
                cell11 = new TableCell();
                cell3.Text = "地址："; 
                
                TextBox TextBox1 = new TextBox();
                TextBox1.ID = "TetBox1";
                TextBox1.Text = reader.GetString(2);
                cell4.Controls.Add(TextBox1);

                cell5.Text = "區";
              
                TextBox TextBox2 = new TextBox();
                TextBox2.ID = "TetBox2";
                TextBox2.Text = reader.GetString(3);
                cell6.Controls.Add(TextBox2);

                cell7.Text = "棟";

                TextBox TextBox3 = new TextBox();
                TextBox3.ID = "TetBox3";
                TextBox3.Text = reader.GetString(4);
                cell8.Controls.Add(TextBox3);

                cell9.Text = "樓";

                TextBox TextBox4 = new TextBox();
                TextBox4.ID = "TetBox4";
                TextBox4.Text = reader.GetString(5);
                cell10.Controls.Add(TextBox4);

                cell11.Text = "戶";
                    
                    
                row2.Cells.Add(cell3);
                row2.Cells.Add(cell4);
                row2.Cells.Add(cell5);
                row2.Cells.Add(cell6);
                row2.Cells.Add(cell7);
                row2.Cells.Add(cell8);
                row2.Cells.Add(cell9);
                row2.Cells.Add(cell10);
                row2.Cells.Add(cell11);
                    
                   
                    
                table.Rows.Add(row2);


                row3 = new TableRow();
                cell12 = new TableCell();
                cell13 = new TableCell();

                cell12.Text = "工程名稱：";

                int projectid = (int)reader["projectcplaceid"];
                SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                connStrr.Open();
                SqlDataReader readeraa;
                //String selectaa = "select * from project where projectid ='" + projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                String selectaa = "select * from project where projectid ='" + projectid + "'";
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                readeraa = cmdaa.ExecuteReader();
                //String projectcplacename;
                while (readeraa.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {
                    cell13.Text = readeraa.GetString(1);
                }
                readeraa.Close();
                connStrr.Close();


                row3.Cells.Add(cell12);
                row3.Cells.Add(cell13);
                table.Rows.Add(row3);   
                    
                    this.Panel1.Controls.Add(table);
                
                
                
                
                }

                reader.Close();

                aa = aa + 1;
                cc = cc + 1;
                
                //Response.Write(ia[y, 1]);
                //Response.Write("<br />");
           
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Label cplaceidd = FindControl("labl0") as Label;
        TextBox cplacename = FindControl("TetBox") as TextBox;
        TextBox p1 = FindControl("TetBox1") as TextBox;
        TextBox p2 = FindControl("TetBox2") as TextBox;
        TextBox p3 = FindControl("TetBox3") as TextBox;
        TextBox p4 = FindControl("TetBox4") as TextBox;

       // DropDownList phase = FindControl("DropDownList0") as DropDownList;
        
        
            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());

            
           
            connStr.Open(); //開啟資料庫的連結
            String selectaa = "UPDATE checkplace SET cplacename ='" + cplacename.Text + "',p1 ='" + p1.Text + "',p2 ='" + p2.Text + "',p3 ='" + p3.Text + "',p4 ='" + p4.Text + "' WHERE cplaceid = '" + cplaceidd.Text + "'";
            //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
            SqlCommand cmdaa = new SqlCommand(selectaa, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            cmdaa.ExecuteNonQuery();
            connStr.Close();
        

        //Application["project"] = Label1.Text;
        Server.Transfer("listplace.aspx");    

        //Label2.Text = phase.Text;
    }
}