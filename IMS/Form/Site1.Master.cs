using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Form
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                SqlDataSource1.ConnectionString = "";
                SqlDataSource1.SelectCommand = "";
            }
            else
            {
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
                LoginCompany.Text = Session["CompanyName"].ToString();
                LoginName.Text = Session["Name"].ToString();
                if ((Ddl_Project.SelectedValue == "") & (Session["ProjectCode"] != null))
                {
                    Ddl_Project.DataBind();
                    ListItem LI = new ListItem();
                    LI.Text = "--請選擇--";
                    LI.Value = "0";

                    Ddl_Project.Items.Insert(0, LI);
                    Ddl_Project.SelectedValue = Session["ProjectCode"].ToString();
                }
                if ((Ddl_Project.SelectedValue == "") & (Session["ProjectCode"] == null))
                {
                    Ddl_Project.DataSourceID = "SqlDataSource1";
                    Ddl_Project.DataTextField = "CodeName";
                    Ddl_Project.DataValueField = "PID";
                    Ddl_Project.DataBind();
                    ListItem LI = new ListItem();
                    LI.Text = "--請選擇--";
                    LI.Value = "0";

                    Ddl_Project.Items.Insert(0, LI);
                    Ddl_Project.SelectedIndex = 0;
                }
                //makemenu();
                show_Module();
            }

            

        }

        protected void Btn_logout_Click(object sender, EventArgs e)
        {
            Session["CompanyName"] = null;
            Session["UserName"] = null;
            Session["DatabaseName"] = null;
            Session["ProjectCode"] = null;
            Session["Name"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Ddl_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ProjectCode"] = Ddl_Project.SelectedValue;
            Response.Redirect("Main.aspx");
        }

        public void show_Module()
        {
            string access = DAL.Login.get_module_access(Session["DatabaseName"].ToString(), Session["UserName"].ToString(),Session["CompanyID"].ToString());
            string[] access_list = Utility.str_process.str2array(access);
            string tmp="";
            if (access_list.Length > 0)
            {
                foreach (string str in access_list)
                {
                    tmp = "Module" + str;
                    FindControl(tmp).Visible = true;
                }
            }
        }

        protected void TB_Search_TextChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
            Ddl_Project.DataBind();
            ListItem LI = new ListItem();
            LI.Text = "--請選擇--";
            LI.Value = "0";

            Ddl_Project.Items.Insert(0, LI);
            Ddl_Project.SelectedIndex = 0;
        }

        protected void IB_ProjectSearch_Click(object sender, ImageClickEventArgs e)
        {
            if (search_area.Visible)
            {
                search_area.Visible = false;
            }
            else
            {
                search_area.Visible = true;
            }
        }

        protected void Btn_Search_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
            Ddl_Project.DataBind();
            ListItem LI = new ListItem();
            LI.Text = "--請選擇--";
            LI.Value = "0";

            Ddl_Project.Items.Insert(0, LI);
            Ddl_Project.SelectedIndex = 0;
        }
        
    }
   
}