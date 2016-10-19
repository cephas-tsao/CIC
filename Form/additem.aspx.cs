using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class additem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string projectname;
        Application.Lock();
        projectname = Application["projectname"].ToString();
        Application.UnLock();

        Label1.Text = projectname;
        
       
    }
    protected void addnewitembtn_Click(object sender, EventArgs e)
    {
       // projectDropDownList.Text
        SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
        SqlDataReader readerid;   //宣告一個DataReader

        connStr.Open(); //開啟資料庫的連結
        String selectid = "select projectid from project where projectname= '" + Label1.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmdid = new SqlCommand(selectid, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readerid = cmdid.ExecuteReader();
        readerid.Read();

         

        
                int? projectid = null ;
                projectid = (int)readerid["projectid"]; //讀取reader中的projectid，取出來，並轉成int
                String idstring = "";
                idstring= readerid["projectid"].ToString();
                readerid.Close();//reader用完要關，不然無法執行下一個SQL語法
              Label2.Text = idstring;
    
                    String item = "INSERT INTO items(itemname,phasee,projectid) Values('" + itemname.Text + "','" + phaseDropDownList.Text + "','" + projectid + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                    SqlCommand cmditem = new SqlCommand(item, connStr);
                    cmditem.ExecuteNonQuery();

                    Application["project"] = Label1.Text;
                    Server.Transfer("listitem.aspx");

    }
}