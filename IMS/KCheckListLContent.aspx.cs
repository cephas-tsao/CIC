using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace IMS
{
    public partial class KCheckListLContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["KCheckListLostId"].ToString();

            String DBName = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結

            String select1 = "SELECT * FROM  KCheckListLostUpload where KCheckListLostId ='" + Label1.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            TableRow row;
            TableCell cell;
            TableCell cell1;
            TableCell cell2;
            TableCell cell3;
            TableCell cell4;

            int i = 1;
            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {


                Label labell = new Label();
                labell.ID = "labll" + i;
                String time = reader.GetString(2);
                labell.Text = time;

                String upload = reader.GetString(3);
                String remark = reader.GetString(4);
                String phasee = reader.GetString(5);

                System.Web.UI.WebControls.Image image = new System.Web.UI.WebControls.Image();
                image.ImageUrl =Server.MapPath("~UploadFile/" + Session["DatabaseName"].ToString() + @"/BidResourceFile/" + upload);
                    //Server.MapPath("~Content/photos/people/"+updatedStaff.Photo);

                cell = new TableCell();
                row = new TableRow();
                cell1 = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell4 = new TableCell();


                cell1.Controls.Add(image);


                cell.Text = time;
                //cell1.Text = upload;

                //cell1.Text = gradeee;
                cell2.Text = i.ToString();
                cell3.Text = remark;
                cell4.Text = phasee;
                //cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell2);
                row.Cells.Add(cell4);
                row.Cells.Add(cell);
                row.Cells.Add(cell3);
                row.Cells.Add(cell1);

                Table1.Rows.Add(row);
                i = i + 1;

            }


            connStr.Close();


        }
    }
}