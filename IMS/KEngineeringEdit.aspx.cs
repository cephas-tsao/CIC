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
    public partial class KEngineeringEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");

            }

            if (!Page.IsPostBack)
            {

                String dataName = Session["DatabaseName"].ToString();
                String KEngineeringListId = Session["KEngineeringListId"].ToString();

                SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
                SqlDataReader reader;   //宣告一個DataReader

                connStr.Open();
                String select = "select * from KEngineeringList where KEngineeringListId ='" + KEngineeringListId + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

                while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                {
                    String KEngineeringListname = reader.GetString(1);
                    KEngineeringName.Text = KEngineeringListname;
                }
                reader.Close();
                connStr.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String dataName = Session["DatabaseName"].ToString();
            String KEngineeringListId = Session["KEngineeringListId"].ToString();
            String name=KEngineeringName.Text;
            Label1.Text = name+","+dataName+","+KEngineeringListId;
            
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
            connStr.Open(); //開啟資料庫的連結
            String selectaa = "UPDATE KEngineeringList SET KEngineeringListName ='" + name + "' WHERE KEngineeringListId = " + KEngineeringListId + "";
            //String selectaa = "UPDATE items SET phasee ='" + phasee.Text + "',itemname ='" + itemname.Text + "' WHERE itemid = '" + labelid.Text + "'";
            SqlCommand cmdaa = new SqlCommand(selectaa, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            cmdaa.ExecuteNonQuery();
            connStr.Close();
           
            /**
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.UpdateCommand = "Update KEngineeringList SET KEngineeringListName ='" + name + "' WHERE KEngineeringListId = " + KEngineeringListId + "";
    **/
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成，請自行關閉頁面');", true);
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close();opener.location.reload();</script>");
     

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>window.close();</" + "script>");
        }
    }
}