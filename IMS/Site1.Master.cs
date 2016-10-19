using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
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
                //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
                LoginCompany.Text = Session["CompanyName"].ToString();
                LoginName.Text = Session["Name"].ToString();
                //if ((Ddl_Project.SelectedValue == "") & (Session["ProjectCode"] != null))
                //{
                //    Ddl_Project.DataBind();
                //    ListItem LI = new ListItem();
                //    LI.Text = "--請選擇--";
                //    LI.Value = "0";

                //    Ddl_Project.Items.Insert(0, LI);
                //    Ddl_Project.SelectedValue = Session["ProjectCode"].ToString();
                //}
                //if ((Ddl_Project.SelectedValue == "") & (Session["ProjectCode"] == null))
                //{
                //    Ddl_Project.DataSourceID = "SqlDataSource1";
                //    Ddl_Project.DataTextField = "CodeName";
                //    Ddl_Project.DataValueField = "PID";
                //    Ddl_Project.DataBind();
                //    ListItem LI = new ListItem();
                //    LI.Text = "--請選擇--";
                //    LI.Value = "0";

                //    Ddl_Project.Items.Insert(0, LI);
                //    Ddl_Project.SelectedIndex = 0;
                //}
                //makemenu();
                show_Module();
                
            }

            //select.Text = Resources.Resource.zh_En.Select;
            if (!IsPostBack)
            {
                //ViewState["CID"] = CID;
                //if (Request.Cookies["open"] != null || Request.Cookies["close"] != null)
                //{
                //    Response.Cookies["open"].Expires = DateTime.Now.AddDays(-1);
                //    Response.Cookies["close"].Expires = DateTime.Now.AddDays(-1);
                //}
               
            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string("PublicDB");
            SqlDataSource2.SelectCommand = "Select * from menu where used=1 ORDER BY ordernum Asc";
        }

        protected void Btn_logout_Click(object sender, EventArgs e)
        {
            Session["CompanyName"] = null;
            Session["UserName"] = null;
            Session["DatabaseName"] = null;
            Session["ProjectCode"] = null;
            Session["Name"] = null;
            //Response.Redirect("Login.aspx?cid=" + ViewState["CID"].ToString());
            //if (ViewState["CID"] != null || ViewState["CID"].ToString() != "")
            //{
            //    Response.Redirect("Login.aspx?cid=" + ViewState["CID"].ToString());
            //}
            if (Request.Cookies["Url"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx?cid=" + Request.Cookies["Url"].Value);
            }


        }

        //protected void Ddl_Project_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Session["ProjectCode"] = Ddl_Project.SelectedValue;
        //    Response.Redirect("Main.aspx");
        //}

        public void show_Module()
        {
            string access = DAL.Login.get_module_access(Session["DatabaseName"].ToString(), Session["UserName"].ToString(), Session["CompanyID"].ToString());
            string[] access_list = Utility.str_process.str2array(access);
            string tmp = "";
            if (access_list.Length > 0)
            {
                foreach (string str in access_list)
                {
                    tmp = "Module" + str;
                    if (FindControl(tmp) != null)
                    {
                        FindControl(tmp).Visible = true;
                    }
                }
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;



                Literal Literal1 = (Literal)e.Item.FindControl("Literal1");
                string menu1 = vsDr["Menu"].ToString().Substring(0, 2);
                string menu2 = vsDr["Menu"].ToString().Substring(2);

                Literal1.Text = @"<a class='hidden-phone hidden-tablet hidden-print' href='" + vsDr["Link"].ToString() + "' id='" + vsDr["Module"].ToString() + "' runat='server'> <i class='" + vsDr["Mark"].ToString() + "'></i><br/>" + menu1 + "<br/>" + menu2 + "</a> <a class='hidden-desktop' href='" + vsDr["Link"].ToString() + "'>" + vsDr["Menu"].ToString() + "</a>";
                 
            }
        }
    }
}