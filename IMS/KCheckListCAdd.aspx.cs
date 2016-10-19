using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;
using DAL;

namespace IMS
{
    public partial class KCheckListCAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Projectid = Session["ProjectCode"].ToString();

            String Name = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(Name));
            SqlDataReader reader;   //宣告一個DataReader
           
                connStr.Open();

                String select1 = "select * from KCheckList ";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                 //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

                while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {

                    int KCheckListId = (int)reader["KCheckListId"];

                    ListBox1.Items.Add(new ListItem(reader.GetString(3), KCheckListId.ToString()));


                }
                reader.Close();
                connStr.Close();
            
        }
        protected void SaveAction(object sender, EventArgs e)
        {
            String KCheckListName = ListBox1.SelectedItem.Text;
            String KCheckListId = ListBox1.SelectedItem.Value;
            Session["KCheckListId"] = KCheckListId;
            Response.Redirect("KCheckListWSave.aspx");


        }

        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");

            //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        }

    }
    }