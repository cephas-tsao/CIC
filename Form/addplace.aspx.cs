using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class add : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
        SqlDataReader reader;   //宣告一個DataReader

        connStr.Open();
        
        String select1 = "select * from project ";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            
            int projectid = (int)reader["projectid"];

            ListBox1.Items.Add(new ListItem(reader.GetString(1), projectid.ToString()));
    

        }
        reader.Close();
        connStr.Close();
    }
    protected void addprojectbtn_Click(object sender, EventArgs e)
    {


        

        
        if (placename.Text == "")
        {
            Label1.Text = "請勿空白";
        }
        else
        {

            String placenamee = placename.Text;
            String p11 = p1.Text;
            String p22 = p2.Text;
            String p33 = p3.Text;
            String p44 = p4.Text;
            String projectid = ListBox1.SelectedValue;
        
            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());

            connStr.Open(); //開啟資料庫的連結
            String select = "INSERT INTO checkplace(cplacename,p1,p2,p3,p4,projectcplaceid) Values('" + placenamee + "','" + p11 + "','" + p22 + "','" + p33 + "','" + p44 + "','" + projectid + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd = new SqlCommand(select, connStr);
            cmd.ExecuteNonQuery();

            //Application["projectname"] = project;
            Server.Transfer("listplace.aspx");

        }
    
    }
   
}