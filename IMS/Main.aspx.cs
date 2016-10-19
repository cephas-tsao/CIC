using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            //if (Session["ProjectCode"] != null)
            //{
            //    ProjectName.Text = Session["ProjectCode"].ToString();
            //}
            else
            {
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
                //LoginCompany.Text = Session["CompanyName"].ToString();
                //LoginName.Text = Session["Name"].ToString();
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
            }
            if (!IsPostBack)
            {
                int UID = DAL.SystemManage.Get_UserID_by_UserName(Session["UserName"].ToString());
                Lbaccount.Text = Session["UserName"].ToString();
                LbCom.Text = Session["CompanyName"].ToString();
                string SQLSelect = "Select * from [USER_Information].[dbo].[CompanyDB] where CompanyID=" + Session["CompanyID"].ToString();
                string SQLSelect1 = "Select * from [USER_Information].[dbo].[UserDB] where UID=" + UID;
                string SQLSelect2 = "Select * from [USER_Information].[dbo].[CompanyTransaction] where CompanyID=" + Session["CompanyID"].ToString();
                string database = Session["DatabaseName"].ToString();
                LbName.Text = WebModel.SItemName(database, SQLSelect1, "Name");
                LbTel.Text = WebModel.SItemName(database, SQLSelect, "TeleNumber");
                LbEmail.Text = WebModel.SItemName(database, SQLSelect1, "Email");
               string ad= WebModel.SItemName(database, SQLSelect1, "Admin");
               LbAdmin.Text = ad == "1" ? "是" : "否";
                string TrialStart =WebModel.SItemName(database, SQLSelect2, "TrialStart")!=""?DateTime.Parse(WebModel.SItemName(database, SQLSelect2, "TrialStart")).ToShortDateString():"";
                string TrialEnd =WebModel.SItemName(database, SQLSelect2, "TrialEnd")!=""? DateTime.Parse(WebModel.SItemName(database, SQLSelect2, "TrialEnd")).ToShortDateString():"";
                string LicenseStart =WebModel.SItemName(database, SQLSelect2, "LicenseStart")!=""? DateTime.Parse(WebModel.SItemName(database, SQLSelect2, "LicenseStart")).ToShortDateString():"";
                string LicenseEnd = WebModel.SItemName(database, SQLSelect2, "LicenseEnd")!=""?DateTime.Parse(WebModel.SItemName(database, SQLSelect2, "LicenseEnd")).ToShortDateString():"";
               if (LicenseEnd != "")
               {
                   if (DateTime.Now > DateTime.Parse(LicenseEnd))
                   {
                       LbDeadLine.Text = LicenseEnd + "(已經逾期)";
                   }
                   else
                   {
                       LbDeadLine.Text = LicenseStart + "~" + LicenseEnd;
                   }

               }
                   else if(TrialEnd!="")
                   {
                       if (DateTime.Now > DateTime.Parse(TrialEnd))
                       {
                           LbDeadLine.Text ="試用期間："+ LicenseEnd + "(已經逾期)";
                       }
                       else
                       {
                           LbDeadLine.Text = "試用期間：" + TrialStart + "~" + TrialEnd;
                       }
                   }
             
            }
            if (Session["ProjectName"] !=null)
            {
            LbProjectName.Text = Session["ProjectName"].ToString();
            }
            
            //if (Session["LoginAccess"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    Lbl_Access.Text = Session["LoginAccess"].ToString();
            //}
            //string temp = Request.FilePath;

            //bool result = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), "13");
            //Lbl_Access.Text = temp.Substring(1);
            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //int[] result = DAL.LayerCodeSort.Sort_LayerCode();
            //for (int i = 0; i < result.Length; i++)
            //{
            //    ProjectResource.Text += result[i].ToString() + ",";
                //Response.Write(result[i].ToString()+",");
            //}
            //ProjectResource.Text = ProjectResource.Text.Substring(0, ProjectResource.Text.Length - 1);
            //Response.Write("<br/>");
        }
        protected void TB_Search_TextChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from ProjectM0 where CodeName like '%" + TB_Search.Text + "%' and PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "'))";
            Ddl_Project.DataBind();
            ListItem LI = new ListItem();
            LI.Text = "--請選擇--";
            LI.Value = "0";

            Ddl_Project.Items.Insert(0, LI);
            Ddl_Project.SelectedIndex = 0;
        }
        protected void Ddl_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ProjectCode"] = Ddl_Project.SelectedValue;
           Session["ProjectName"]=  Ddl_Project.SelectedItem.Text;
            Response.Redirect("Main.aspx");
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
        public string[] gen_LayerCode(int[] UID, int[] UpperUID, int[] sortnumber)
        {
            string[] result = new string[UID.Length];
            int[] nowUID = new int[UID.Length];
            for (int i = 0; i < UID.Length; i++)
            {
                result[i] = sortnumber[i].ToString();
                nowUID[i] = UpperUID[i];
            }
            while (sum_UID(nowUID)>0)
            {
                for (int i = 0; i < nowUID.Length; i++)
                {
                    if (nowUID[i] == null)
                        continue;
                    if (nowUID[i] == 0)
                        continue;
                    for (int j = 0; j < UpperUID.Length; j++)
                    {
                        if (nowUID[i] == UpperUID[j])
                        {
                            result[i] = getsortnumber_by_UID(nowUID[i], UID, sortnumber).ToString() + ";" + result[i];
                            nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);
                            break;
                        }
                    }
                }
            }

            return result;
        }

        public int getsortnumber_by_UID(int nowUID, int[] UID, int[] sortnumber)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = sortnumber[i];
                    break;
                }
            }

            return result;
        }

        public int getUpperUID_by_UID(int nowUID, int[] UID, int[] UpperUID)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = UpperUID[i];
                    break;
                }
            }
            return result;
        }

        public int sum_UID(int[] UID)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (UID[i] == null)
                {
                    UID[i] = 0;
                }
                result += UID[i];
            }
            return result;
        }

    }
}