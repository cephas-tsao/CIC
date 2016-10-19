using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class editproject : System.Web.UI.Page
    {
        int aa = 0;
        int cc = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            //string projectname;
            Application.Lock();
            //projectname = Application["project"].ToString();
            int[,] ia = (int[,])Application["ia"];
            Application.UnLock();
            // Label1.Text = projectname;


            TableRow row;
            TableRow row2;
            TableCell cell;
            TableCell cell2;
            TableCell cell3;
            TableCell cell4;


            for (int y = 0; y < (ia.Length / ia.Rank); y++)  //ia.Length 為長度 總共有40個資料   
            {

                if (ia[y, 0] == 1)
                {
                    SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                    SqlDataReader reader;   //宣告一個DataReader

                    connStr.Open(); //開啟資料庫的連結
                    String select = "select * from project where projectid ='" + ia[y, 1] + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                    reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                    //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

                    while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                    {
                        String projectname = reader.GetString(1);

                        Label Label = new Label();
                        Label.ID = "labl" + cc;
                        Label.Visible = false;

                        int id = (int)reader["projectid"];
                        Label.Text = id.ToString();
                        this.Form.Controls.Add(Label);



                        Table table = new Table();
                        table.ID = "table" + y;
                        // table.BorderStyle=;
                        table.BorderColor = System.Drawing.Color.Red;
                        table.BorderWidth = 1;

                        row2 = new TableRow();

                        cell3 = new TableCell();
                        cell4 = new TableCell();


                        TextBox TextBox = new TextBox();
                        TextBox.ID = "TetBox" + cc;
                        TextBox.Text = projectname;
                        cell3.Text = "工程名稱：";
                        cell4.Controls.Add(TextBox);
                        row2.Cells.Add(cell3);
                        row2.Cells.Add(cell4);
                        table.Rows.Add(row2);

                        //CheckBox checkbox = new CheckBox();
                        //checkbox.ID = "checkbox";
                        this.Panel1.Controls.Add(table);




                    }

                    reader.Close();

                    aa = aa + 1;
                    cc = cc + 1;

                    //Response.Write(ia[y, 1]);
                    //Response.Write("<br />");
                }
                else
                {

                }



            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            //Label labelid = FindControl("label0") as Label;
            // DropDownList phase = FindControl("DropDownList0") as DropDownList;

            for (int b = 0; b < aa; b++)
            {
                Label labelid = FindControl("labl" + b) as Label;
                TextBox projectname = FindControl("TetBox" + b) as TextBox;
                SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());



                connStr.Open(); //開啟資料庫的連結
                String selectaa = "UPDATE project SET projectname ='" + projectname.Text + "' WHERE projectid = '" + labelid.Text + "'";
                //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
                SqlCommand cmdaa = new SqlCommand(selectaa, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdaa.ExecuteNonQuery();
                connStr.Close();
            }

            //Application["project"] = Label1.Text;
            Server.Transfer("listproject.aspx");

            //Label2.Text = phase.Text;
        }
    }
}