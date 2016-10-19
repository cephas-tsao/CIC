using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using Utility;

namespace IMS
{
    public partial class KCheckListLostUploadImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["KCheckListLostUploadId"].ToString();
            String DBName = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結

            String select1 = "SELECT * FROM  KCheckListLostUpload where KCheckListLostUploadId ='" + Label1.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {

                String upload = reader.GetString(3);

                System.Web.UI.WebControls.Image image = new System.Web.UI.WebControls.Image();

                //以下為專案用的路徑
                Image1.ImageUrl = @"~/Uploads/" + upload;


                //以下為上傳到網站的路徑
                //Image1.ImageUrl = @"UploadFile/" + Session["DatabaseName"].ToString() + @"/BidResourceFile/" + upload;



            }


        }
        }
}