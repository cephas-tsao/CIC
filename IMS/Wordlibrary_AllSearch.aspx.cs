using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS
{
    public partial class Wordlibrary_AllSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Sql_Query1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Query7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            LBQuery1.Visible = false;
            LBQuery2.Visible = false;
            LBQuery3.Visible = false;
            LBQuery4.Visible = false;
            LBQuery5.Visible = false;
            LBQuery6.Visible = false;
            LBQuery7.Visible = false;
        }

        protected void btn_seach_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            Sql_Query1.SelectCommand = "SELECT * FROM [UsualWord] Where Type='日報工作內容' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query2.SelectCommand = "SELECT * FROM [UsualWord] Where Type='施工記事' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query3.SelectCommand = "SELECT * FROM [UsualWord] Where Type='合約備註' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query4.SelectCommand = "SELECT * FROM [UsualWord] Where Type='業主建築師指示' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query5.SelectCommand = "SELECT * FROM [UsualWord] Where Type='人力機具' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query6.SelectCommand = "SELECT * FROM [UsualWord] Where Type='材料' and Content like '%" + TB_Query_Word.Text + "%'";
            Sql_Query7.SelectCommand = "SELECT * FROM [UsualWord] Where Type='工作項目' and Content like '%" + TB_Query_Word.Text + "%'";

            DataTable result1 = WebModel.LoadSetContentData(database, Sql_Query1.SelectCommand);
            DataTable result2 = WebModel.LoadSetContentData(database, Sql_Query2.SelectCommand);
            DataTable result3 = WebModel.LoadSetContentData(database, Sql_Query3.SelectCommand);
            DataTable result4 = WebModel.LoadSetContentData(database, Sql_Query4.SelectCommand);
            DataTable result5 = WebModel.LoadSetContentData(database, Sql_Query5.SelectCommand);
            DataTable result6 = WebModel.LoadSetContentData(database, Sql_Query6.SelectCommand);
            DataTable result7 = WebModel.LoadSetContentData(database, Sql_Query7.SelectCommand);
            if (result1 != null && result1.Rows.Count >0)
            {
                Gv_Query1.DataBind();
                Gv_Query1.Visible = true;
                LBQuery1.Visible = true;
                table1.Visible = true;
            }
            if (result2 != null && result2.Rows.Count > 0)
            {
                Gv_Query2.DataBind();
                Gv_Query2.Visible = true;
                LBQuery2.Visible = true;
                table2.Visible = true;

            }
            if (result3 != null && result3.Rows.Count > 0)
            {
                Gv_Query3.DataBind();
                Gv_Query3.Visible = true;
                LBQuery3.Visible = true;
                table3.Visible = true;
            }
            if (result4 != null && result4.Rows.Count > 0)
           {
               Gv_Query4.DataBind();
               Gv_Query4.Visible = true;
               LBQuery4.Visible = true;
               table4.Visible = true;

           }
            if (result5 != null && result5.Rows.Count > 0)
           {
               Gv_Query5.DataBind();
               Gv_Query5.Visible = true;
               LBQuery5.Visible = true;
               table5.Visible = true;

           }
            if (result6 != null && result6.Rows.Count > 0)
          {
              Gv_Query6.DataBind();
              Gv_Query6.Visible = true;
              LBQuery6.Visible = true;
              table6.Visible = true;

          }
            if (result7 != null && result7.Rows.Count > 0)
            {
                Gv_Query7.DataBind();
                Gv_Query7.Visible = true;
                LBQuery7.Visible = true;
                table7.Visible = true;

            }
          
          
         
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("WordLibrary.aspx");
        }
    }
}