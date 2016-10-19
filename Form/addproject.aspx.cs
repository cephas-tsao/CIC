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

    }
    protected void addprojectbtn_Click(object sender, EventArgs e)
    {




        if (projectname.Text == "")
        {
            Label1.Text = "請勿空白";
        }
        else
        {

            String project = projectname.Text;


            SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());

            connStr.Open(); //開啟資料庫的連結
            String select = "INSERT INTO project(projectname) Values('" + project + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd = new SqlCommand(select, connStr);
            cmd.ExecuteNonQuery();

            //Application["projectname"] = project;
            Server.Transfer("listproject.aspx");

        }
    
    }
   
}