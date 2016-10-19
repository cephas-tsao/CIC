using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace IMS
{
    public partial class SystemManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlData_User.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
                Sql_DDL_Module.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "select * from USER_Information.dbo.UserDB where CompanyID = ( select CompanyID from USER_Information.dbo.UserDB where Username = '" + Session["Username"].ToString() + "'and CompanyID='" + Session["CompanyID"].ToString() + "')";
                SqlDataSource3.SelectCommand = "select * from ProjectM0";
                SqlData_User.SelectCommand = "SELECT * FROM [UserDB] WHERE ([CompanyID] = " + DAL.SystemManage.Get_CompanyID_by_CompanyName(Session["CompanyName"].ToString()).ToString() + ")";
                Sql_DDL_Module.SelectCommand = "select PageID, PageName from  PublicDB.[dbo].PageList";

                lbl_Company.Text = Session["CompanyName"].ToString();
                lbl_Company2.Text = Session["CompanyName"].ToString();
                lbl_Company3.Text = Session["CompanyName"].ToString();
                if (!IsPostBack)
                {
                    DDL_Project.DataBind();
                    DDL_Project2.DataBind();
                    DDL_UserSelect.DataBind();
                    DDL_Module.DataBind();
                    List_Show();
                }
                Module_Access_Show();
                //Module_User_Show();
            }
        }

        protected void TB_NewUser_TextChanged(object sender, EventArgs e)
        {
            if (DAL.SystemManage.Check_UserName(TB_NewUser.Text))
            {
                Lbl_Error2.Text = "此用者名稱已存在";
                Lbl_Error2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Lbl_Error2.Text = "可使用";
                Lbl_Error2.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void Btn_NewUser_Click(object sender, EventArgs e)
        {
            if (DAL.SystemManage.Check_UserName(TB_NewUser.Text))
            {
                Lbl_NU.Text = "此使用者已存在";
            }
            else
            {
                if (TB_NewUser.Text != "" && TB_Password.Text != "")
                {
                    bool result = DAL.SystemManage.Insert_User(TB_NewUser.Text, TB_Password.Text, Session["CompanyName"].ToString(), TB_Name.Text, TB_Email.Text, TB_Phone1.Text, "0");
                    //Insert_User(TB_NewUser.Text);
                    if (result)
                    {
                        Response.Write("<script>alert('使用者已新增');location.href='SystemManage.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('使用者新增失敗');location.href='SystemManage.aspx';</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('請輸入帳號及密碼!!!');location.href='SystemManage.aspx';</script>");
                }
            }
        }

        //public void Module_Access_Show()
        //{
        //    PH_Access.Controls.Clear();
        //    int fun_count = 0;
        //    int project_count = 0;
        //    int UID = int.Parse(DDL_User.SelectedValue);
        //    string access = DAL.SystemManage.Get_Module_Access(UID, Session["DatabaseName"].ToString());
        //    string[] accesslist = access.Split(',');
        //    string[] modulename = Utility.Unitlist.ModuleList();
        //    //string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code(Session["DatabaseName"].ToString());
        //    string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(Session["DatabaseName"].ToString());
        //    string[] project_code = projectcode_name[0].Split(',');
        //    string[] project_name = projectcode_name[1].Split(',');
        //    //string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(Session["DatabaseName"].ToString(), UID);
        //    string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID_New(Session["DatabaseName"].ToString(), UID);
        //    string[] PPAlist = {""};
        //    if (PPA[0] != null)
        //    {
        //        string[] PPAparta = PPA[1].Split(',');
        //        string[] PPApartb = PPA[0].Split(',');
        //        PPAlist = new string[PPAparta.Length];
        //        for (int i = 0; i < PPAparta.Length; i++)
        //        {
        //            PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
        //        }
        //    }

        //    string[] page_id = new string[2];
        //    string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), "Main");
        //    string[] main_list = main_page[0].Split(',');
        //    string[] main_id = main_page[1].Split(',');
        //    int main_search = -1;

        //    PH_Access.Controls.Add(new LiteralControl("<table><tr><td>模組名稱</td><td>頁面名稱</td><td>專案名稱</td></tr>"));
        //    foreach (string i in modulename)
        //    {
        //        CheckBox CB = new CheckBox();

        //        CB.ID = "CB" + fun_count.ToString();
        //        CB.Text = i;
        //        if (Array.IndexOf(accesslist, fun_count.ToString()) != -1)
        //        {
        //            CB.Checked = true;
        //        }
        //        PH_Access.Controls.Add(new LiteralControl("<tr><td>"));
        //        PH_Access.Controls.Add(CB);

        //        //page = DAL.SystemManage.Get_Page_by_Module(Session["DatabaseName"].ToString(), i);
        //        page_id = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), i);
        //        if (page_id[0] == "")
        //        {
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>----</td><td>"));
        //            main_search = Array.IndexOf(main_list, i);
        //            if (main_search >= 0)
        //            {
        //                project_count = 0;
        //                foreach (string k in project_name)
        //                {
        //                    CheckBox CBP = new CheckBox();
        //                    CBP.ID = "CBP" + fun_count.ToString() + "_" + main_id[main_search] + "_" + project_code[project_count];
        //                    CBP.Text = k;
        //                    if (Array.IndexOf(PPAlist, main_id[main_search] + "_" + project_code[project_count]) != -1)
        //                    {
        //                        CBP.Checked = true;
        //                    }
        //                    PH_Access.Controls.Add(CBP);
        //                    project_count++;
        //                }
        //            }
        //            PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //        }
        //        else
        //        {
        //            string[] pagelist = page_id[0].Split(',');
        //            string[] idlist = page_id[1].Split(',');
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //            PH_Access.Controls.Add(new LiteralControl(pagelist[0]));
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //            //---
        //            project_count = 0;
        //            foreach (string k in project_name)
        //            {
        //                CheckBox CBP = new CheckBox();
        //                CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[0] + "_" + project_code[project_count];
        //                CBP.Text = k;
        //                if (Array.IndexOf(PPAlist, idlist[0] + "_" + project_code[project_count]) != -1)
        //                {
        //                    CBP.Checked = true;
        //                }
        //                PH_Access.Controls.Add(CBP);
        //                project_count++;
        //            }
        //            PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //            for (int j = 1; j < pagelist.Length; j++)
        //            {
        //                PH_Access.Controls.Add(new LiteralControl("<tr><td></td><td>"));
        //                PH_Access.Controls.Add(new LiteralControl(pagelist[j]));
        //                PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //                project_count = 0;
        //                foreach (string k in project_name)
        //                {
        //                    CheckBox CBP = new CheckBox();
        //                    CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[j] + "_" + project_code[project_count];
        //                    CBP.Text = k;
        //                    if (Array.IndexOf(PPAlist, idlist[j] + "_" + project_code[project_count]) != -1)
        //                    {
        //                        CBP.Checked = true;
        //                    }
        //                    PH_Access.Controls.Add(CBP);
        //                    project_count++;
        //                }
        //                PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //            }
        //        }
        //        fun_count = fun_count + 1;
        //    }
        //    PH_Access.Controls.Add(new LiteralControl("</table>"));
        //}

        //protected void DDL_User_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Module_Access_Show();
        //}

        //protected void Btn_LicenseUpdate_Click(object sender, EventArgs e)
        //{
        //    string access = "";
        //    string page_project_access = "";
        //    string[] modulename = Utility.Unitlist.ModuleList();
        //    //string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code(Session["DatabaseName"].ToString());
        //    string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(Session["DatabaseName"].ToString());
        //    string[] project_code = projectcode_name[0].Split(',');
        //    string[] project_name = projectcode_name[1].Split(',');
        //    int UID = int.Parse(DDL_User.SelectedValue);
        //    string[] page = new string[2];
        //    string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(Session["DatabaseName"].ToString(), UID);
        //    string[] PPAparta = PPA[1].Split(',');
        //    string[] PPApartb = PPA[0].Split(',');
        //    string[] PPAlist = new string[PPAparta.Length];
        //    for (int i = 0; i < PPAparta.Length; i++)
        //    {
        //        PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
        //    }
        //    string[] page_id = new string[2];
        //    string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), "Main");
        //    string[] main_list = main_page[0].Split(',');
        //    string[] main_id = main_page[1].Split(',');
        //    int main_search = -1;

        //    CheckBox CB = new CheckBox();
        //    CheckBox CBP = new CheckBox();
        //    for (int i = 0; i < modulename.Length; i++)
        //    {
        //        CB = (CheckBox)PH_Access.FindControl("CB"+i.ToString());
        //        if (CB.Checked)
        //        {
        //            access += CB.ID.Substring(2) + ",";
        //        }
        //        page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), modulename[i]);

        //        if (page[0] == "")
        //        {
        //            main_search = Array.IndexOf(main_list, modulename[i]);
        //            if (main_search >= 0)
        //            {
        //                for (int j = 0; j < project_code.Length; j++)
        //                {
        //                    CBP = (CheckBox)PH_Access.FindControl("CBP" + i.ToString() + "_" + main_id[main_search] + "_" + project_code[j]);
        //                    if (CBP != null)
        //                    {
        //                        if (CBP.Checked)
        //                        {
        //                            page_project_access += main_id[main_search] + "," + project_code[j] + ",";
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //        else
        //        {
        //            string[] pagelist = page[0].Split(',');
        //            string[] idlist = page[1].Split(',');
        //            for (int k = 0; k < idlist.Length; k++)
        //            {
        //                for (int j = 0; j < project_code.Length; j++)
        //                {
        //                    CBP = (CheckBox)PH_Access.FindControl("CBP" + i.ToString() + "_" + idlist[k] + "_" + project_code[j]);
        //                    if (CBP != null)
        //                    {
        //                        if (CBP.Checked)
        //                        {
        //                            page_project_access += idlist[k] + "," + project_code[j] + ",";
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    if (access.Length != 0)
        //    {
        //        access = access.Substring(0, access.Length - 1);
        //    }
        //    if (page_project_access.Length != 0)
        //    {
        //        page_project_access = page_project_access.Substring(0, page_project_access.Length - 1);
        //    }
        //    bool result = DAL.SystemManage.Update_Module_Access(Session["DatabaseName"].ToString(), UID, access);
        //    //bool result2 = DAL.SystemManage.Update_UPP_Access(Session["DatabaseName"].ToString(), UID, page_project_access);
        //    bool result2 = DAL.SystemManage.Update_UPP_Access_New(Session["DatabaseName"].ToString(), UID, page_project_access);
        //    result = result & result2;
        //    if (result)
        //    {
        //        Response.Write("<script>alert('更新成功');location.href='SystemManage.aspx';</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('更新失敗');location.href='SystemManage.aspx';</script>");
        //    }
        //}

        //public void Module_Access_Show_by_ProjectName(string ProjectName)
        //{
        //    PH_Access.Controls.Clear();
        //    int fun_count = 0;
        //    int project_count = 0;
        //    int UID = int.Parse(DDL_User.SelectedValue);
        //    string access = DAL.SystemManage.Get_Module_Access(UID, Session["DatabaseName"].ToString());
        //    string[] accesslist = access.Split(',');
        //    string[] modulename = Utility.Unitlist.ModuleList();
        //    string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(Session["DatabaseName"].ToString());
        //    string[] project_code = projectcode_name[0].Split(',');
        //    string[] project_name = projectcode_name[1].Split(',');
        //    //string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(Session["DatabaseName"].ToString(), UID);
        //    string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID_New(Session["DatabaseName"].ToString(), UID);
        //    string[] PPAlist = { "" };
        //    if (PPA[0] != null)
        //    {
        //        string[] PPAparta = PPA[1].Split(',');
        //        string[] PPApartb = PPA[0].Split(',');
        //        PPAlist = new string[PPAparta.Length];
        //        for (int i = 0; i < PPAparta.Length; i++)
        //        {
        //            PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
        //        }
        //    }

        //    string[] page_id = new string[2];
        //    string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), "Main");
        //    string[] main_list = main_page[0].Split(',');
        //    string[] main_id = main_page[1].Split(',');
        //    int main_search = -1;

        //    PH_Access.Controls.Add(new LiteralControl("<table><tr><td>模組名稱</td><td>頁面名稱</td><td>專案名稱</td></tr>"));
        //    foreach (string i in modulename)
        //    {
        //        CheckBox CB = new CheckBox();

        //        CB.ID = "CB" + fun_count.ToString();
        //        CB.Text = i;
        //        if (Array.IndexOf(accesslist, fun_count.ToString()) != -1)
        //        {
        //            CB.Checked = true;
        //        }
        //        PH_Access.Controls.Add(new LiteralControl("<tr><td>"));
        //        PH_Access.Controls.Add(CB);

        //        //page = DAL.SystemManage.Get_Page_by_Module(Session["DatabaseName"].ToString(), i);
        //        page_id = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), i);
        //        if (page_id[0] == "")
        //        {
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>----</td><td>"));
        //            main_search = Array.IndexOf(main_list, i);
        //            if (main_search >= 0)
        //            {
        //                project_count = 0;
        //                foreach (string k in project_name)
        //                {
        //                    CheckBox CBP = new CheckBox();
        //                    CBP.ID = "CBP" + fun_count.ToString() + "_" + main_id[main_search] + "_" + project_code[project_count];
        //                    CBP.Text = k;
        //                    if (Array.IndexOf(PPAlist, main_id[main_search] + "_" + project_code[project_count]) != -1)
        //                    {
        //                        CBP.Checked = true;
        //                    }
        //                    if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
        //                    {
        //                        CBP.Visible = false;
        //                    }
        //                    PH_Access.Controls.Add(CBP);
        //                    project_count++;
        //                }
        //            }
        //            PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //        }
        //        else
        //        {
        //            string[] pagelist = page_id[0].Split(',');
        //            string[] idlist = page_id[1].Split(',');
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //            PH_Access.Controls.Add(new LiteralControl(pagelist[0]));
        //            PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //            //---
        //            project_count = 0;
        //            foreach (string k in project_name)
        //            {
        //                CheckBox CBP = new CheckBox();
        //                CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[0] + "_" + project_code[project_count];
        //                CBP.Text = k;
        //                if (Array.IndexOf(PPAlist, idlist[0] + "_" + project_code[project_count]) != -1)
        //                {
        //                    CBP.Checked = true;
        //                }
        //                if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
        //                {
        //                    CBP.Visible = false;
        //                }
        //                PH_Access.Controls.Add(CBP);
        //                project_count++;
        //            }
        //            PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //            for (int j = 1; j < pagelist.Length; j++)
        //            {
        //                PH_Access.Controls.Add(new LiteralControl("<tr><td></td><td>"));
        //                PH_Access.Controls.Add(new LiteralControl(pagelist[j]));
        //                PH_Access.Controls.Add(new LiteralControl("</td><td>"));
        //                project_count = 0;
        //                foreach (string k in project_name)
        //                {
        //                    CheckBox CBP = new CheckBox();
        //                    CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[j] + "_" + project_code[project_count];
        //                    CBP.Text = k;
        //                    if (Array.IndexOf(PPAlist, idlist[j] + "_" + project_code[project_count]) != -1)
        //                    {
        //                        CBP.Checked = true;
        //                    }
        //                    if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
        //                    {
        //                        CBP.Visible = false;
        //                    }
        //                    PH_Access.Controls.Add(CBP);
        //                    project_count++;
        //                }
        //                PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
        //            }
        //        }
        //        fun_count = fun_count + 1;
        //    }
        //    PH_Access.Controls.Add(new LiteralControl("</table>"));
        //}

        //protected void Btn_Project_Search_Click(object sender, EventArgs e)
        //{
        //    Module_Access_Show_by_ProjectName(TB_Project_Search.Text);
        //}

        protected void DDL_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            Module_Access_Show();
        }

        protected void Btn_LicenseUpdate_Click(object sender, EventArgs e)
        {
            string access = "";
            string page_project_access = "";
            int UID = 0;
            int PID = 0;
            //string[] modulename = Utility.Unitlist.ModuleList();
            string[] modulename = Utility.Unitlist.ModuleListNew();
            string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(Session["DatabaseName"].ToString());
            if (projectcode_name[0] != null && projectcode_name[1] != null)
            {
            string[] project_code = projectcode_name[0].Split(',');
            string[] project_name = projectcode_name[1].Split(',');
            }
            if (DDL_UserSelect.SelectedValue != "")
            {
                 UID = int.Parse(DDL_UserSelect.SelectedValue);
            }
            if (DDL_Project.SelectedValue !="")
            {
               PID = int.Parse(DDL_Project.SelectedValue);
            }
            string[] page = new string[2];

            CheckBox CB = new CheckBox();
            CheckBox CBP = new CheckBox();
            for (int i = 0; i < modulename.Length; i++)
            {
                CB = (CheckBox)PH_Access.FindControl("CB" + i.ToString());
                if (CB.Checked)
                {
                    access += CB.ID.Substring(2) + ",";
                }
                page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), modulename[i]);

                if (page[0] == "")
                {

                }
                else
                {
                    string[] pagelist = page[0].Split(',');
                    string[] idlist = page[1].Split(',');
                    for (int k = 0; k < idlist.Length; k++)
                    {

                        CBP = (CheckBox)PH_Access.FindControl("CBP" + i.ToString() + "_" + idlist[k] + "_" + PID.ToString());
                        if (CBP != null)
                        {
                            if (CBP.Checked)
                            {
                                page_project_access += idlist[k] + ",";
                            }
                        }

                    }
                }
            }

            if (access.Length != 0)
            {
                access = access.Substring(0, access.Length - 1);
            }
            if (page_project_access.Length != 0)
            {
                page_project_access = page_project_access.Substring(0, page_project_access.Length - 1);
            }
            bool result = DAL.SystemManage.Update_Module_Access(Session["DatabaseName"].ToString(), UID, access);

            bool result2 = DAL.SystemManage.Update_UPP_Access_New2(Session["DatabaseName"].ToString(), UID, PID, page_project_access);
            result = result & result2;
            if (result)
            {
                Response.Write("<script>alert('更新成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('更新失敗');</script>");
            }
        }

        public void Module_Access_Show()
        {
            PH_Access.Controls.Clear();
            int fun_count = 0;
            int UID = 0;
            int PID = 0;
            if (DDL_UserSelect.SelectedValue !="")
            {
             UID = int.Parse(DDL_UserSelect.SelectedValue);
            }
            if (DDL_Project.SelectedValue !="")
            {
             PID = int.Parse(DDL_Project.SelectedValue);
            }
            string page_access = DAL.SystemManage.Get_PageID_Access_by_UserID_and_ProjectID(Session["DatabaseName"].ToString(), UID, PID);
            string access = DAL.SystemManage.Get_Module_Access(UID, Session["DatabaseName"].ToString());
            string[] accesslist = access.Split(',');
            //string[] modulename = Utility.Unitlist.ModuleList();
            string[] modulename = Utility.Unitlist.ModuleListNew();
            
            string[] page_id = new string[2];
            string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), "Main");
            string[] main_list = main_page[0].Split(',');
            string[] main_id = main_page[1].Split(',');

            PH_Access.Controls.Add(new LiteralControl("<table><tr><td>模組名稱</td><td>頁面名稱</td></tr>"));
            foreach (string i in modulename)
            {
                CheckBox CB = new CheckBox();

                CB.ID = "CB" + fun_count.ToString();
                CB.Text = i;
                if (Array.IndexOf(accesslist, fun_count.ToString()) != -1)
                {
                    CB.Checked = true;
                }
                PH_Access.Controls.Add(new LiteralControl("<tr><td>"));
                PH_Access.Controls.Add(CB);


                page_id = DAL.SystemManage.Get_Page_ID_by_Module(Session["DatabaseName"].ToString(), i);
                if (page_id[0] == "")
                {
                    PH_Access.Controls.Add(new LiteralControl("</td><td>----</td></tr>"));
                }
                else
                {
                    string[] pagelist = page_id[0].Split(',');
                    string[] idlist = page_id[1].Split(',');
                    CheckBox CBP = new CheckBox();
                    CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[0] + "_" + DDL_Project.SelectedValue;
                    CBP.Text = pagelist[0];

                    if (Array.IndexOf(page_access.Split(','), idlist[0]) != -1)
                    {
                        CBP.Checked = true;
                    }

                    PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                    PH_Access.Controls.Add(CBP);
                    PH_Access.Controls.Add(new LiteralControl("</td></tr>"));

                    for (int j = 1; j < pagelist.Length; j++)
                    {
                        PH_Access.Controls.Add(new LiteralControl("<tr><td></td><td>"));
                        CheckBox CBPP = new CheckBox();
                        CBPP.ID = "CBP" + fun_count.ToString() + "_" + idlist[j] + "_" + DDL_Project.SelectedValue;
                        CBPP.Text = pagelist[j];
                        if (Array.IndexOf(page_access.Split(','), idlist[j]) != -1)
                        {
                            CBPP.Checked = true;
                        }
                        PH_Access.Controls.Add(CBPP);
                        PH_Access.Controls.Add(new LiteralControl("</td></tr>"));

                    }
                }
                fun_count = fun_count + 1;
            }
            PH_Access.Controls.Add(new LiteralControl("</table>"));

        }

        protected void DDL_UserSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            Module_Access_Show();
        }

        public void Module_User_Show()
        {
            PH_Module_User.Controls.Clear();
            int user_count = 0;
            int PageID = int.Parse(DDL_Module.SelectedValue);
            int PID = int.Parse(DDL_Project.SelectedValue);
            string userlist;
            int CID = DAL.SystemManage.Get_CompanyID_by_CompanyName(Session["CompanyName"].ToString());
            string UIDs = DAL.SystemManage.Get_UserIDs_by_CompanyID(CID, out userlist);
            string UPaccess = DAL.SystemManage.Get_UserID_Access_by_PageID_and_ProjectID(Session["DatabaseName"].ToString(), PageID, PID);
            string[] Utemp = UIDs.Split(',');
            int[] UIDarray = new int[Utemp.Length];
            string[] UserNameList = userlist.Split(',');
            for (int i = 0; i < Utemp.Length; i++)
            {
                UIDarray[i] = int.Parse(Utemp[i]);
            }


            PH_Module_User.Controls.Add(new LiteralControl("<table><tr><td>使用者名稱</td></tr>"));
            foreach (string ii in UserNameList)
            {
                PH_Module_User.Controls.Add(new LiteralControl("<tr><td>"));
                CheckBox tempCB = new CheckBox();
                tempCB.ID = "UIDsCB_" + UIDarray[user_count].ToString();
                tempCB.Text = ii;
                if (Array.IndexOf(UPaccess.Split(','), UIDarray[user_count].ToString()) != -1)
                {
                    tempCB.Checked = true;
                }
                else
                {
                    tempCB.Checked = false;
                }

                PH_Module_User.Controls.Add(tempCB);
                PH_Module_User.Controls.Add(new LiteralControl("</td></tr>"));
                user_count++;
            }

            PH_Module_User.Controls.Add(new LiteralControl("</table>"));

        }

        protected void DDL_Module_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Module_User_Show();
            List_Show();
        }

        protected void Btn_LicenseUpdate2_Click(object sender, EventArgs e)
        {
            //int user_count = 0;
            int PageID = int.Parse(DDL_Module.SelectedValue);
            int PID = int.Parse(DDL_Project.SelectedValue);
            string userlist;
            int CID = DAL.SystemManage.Get_CompanyID_by_CompanyName(Session["CompanyName"].ToString());
            string UIDs = DAL.SystemManage.Get_UserIDs_by_CompanyID(CID, out userlist);
            string[] Utemp = UIDs.Split(',');
            int[] UIDarray = new int[Utemp.Length];
            string[] UserNameList = userlist.Split(',');
            string UIDaccess = "";
            for (int i = 0; i < Utemp.Length; i++)
            {
                UIDarray[i] = int.Parse(Utemp[i]);
            }
            for (int k = 0; k < UserNameList.Length; k++)
            {
                CheckBox CB_temp = (CheckBox)PH_Module_User.FindControl("UIDsCB_" + UIDarray[k].ToString());
                if (CB_temp.Checked == true)
                {
                    UIDaccess += UIDarray[k].ToString() + ",";
                }
            }
            if (UIDaccess.Length > 0)
            {
                UIDaccess = UIDaccess.Substring(0, UIDaccess.Length - 1);
            }
            bool result = DAL.SystemManage.Update_UPP_Access_New3(Session["DatabaseName"].ToString(), PageID, PID, UIDaccess);

            if (result)
            {
                Response.Write("<script>alert('更新成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('更新失敗');</script>");
            }

        }

        protected void DDL_Project2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Module_User_Show();
            List_Show();
        }

        public void List_Show()
        {
            LB_Access.Items.Clear();
            LB_Unaccess.Items.Clear();
            int user_count = 0;
            int PageID = 0;
            int PID = 0;
            if (DDL_Module.SelectedValue !="")
            {
              PageID = int.Parse(DDL_Module.SelectedValue);
            }
            if (DDL_Project2.SelectedValue != "")
            {
                PID = int.Parse(DDL_Project2.SelectedValue);
            }
            string userlist;
            int CID = DAL.SystemManage.Get_CompanyID_by_CompanyName(Session["CompanyName"].ToString());
            string UIDs = DAL.SystemManage.Get_UserIDs_by_CompanyID(CID, out userlist);
            string UPaccess = DAL.SystemManage.Get_UserID_Access_by_PageID_and_ProjectID(Session["DatabaseName"].ToString(), PageID, PID);
            string[] Utemp = UIDs.Split(',');
            int[] UIDarray = new int[Utemp.Length];
            string[] UserNameList = userlist.Split(',');
            for (int i = 0; i < Utemp.Length; i++)
            {
                UIDarray[i] = int.Parse(Utemp[i]);
            }

            foreach (string ii in UserNameList)
            {
                ListItem LI = new ListItem();
                LI.Text = ii;
                LI.Value = UIDarray[user_count].ToString();
                if (Array.IndexOf(UPaccess.Split(','), UIDarray[user_count].ToString()) != -1)
                {
                    LB_Access.Items.Add(LI);
                }
                else
                {
                    LB_Unaccess.Items.Add(LI);
                }
                user_count++;
            }
        }

        protected void Btn_AllToAccess_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Unaccess.Items.Count;
            for (int i = Mv_times-1; i >= 0; i--)
            {
                ListItem LI = new ListItem();
                LI.Text = LB_Unaccess.Items[i].Text;
                LI.Value = LB_Unaccess.Items[i].Value;
                LB_Access.Items.Add(LI);
                LB_Unaccess.Items.Remove(LI);
            }
        }

        protected void Btn_OneToUnaccess_Click(object sender, EventArgs e)
        {
            if (LB_Access.SelectedItem != null)
            {
                LB_Unaccess.Items.Add(LB_Access.SelectedItem);
                LB_Access.Items.Remove(LB_Access.SelectedItem);
            }
        }

        protected void Btn_AllToUnaccess_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Access.Items.Count;
            for (int i = Mv_times-1; i >= 0; i--)
            {
                ListItem LI = new ListItem();
                LI.Text = LB_Access.Items[i].Text;
                LI.Value = LB_Access.Items[i].Value;
                LB_Unaccess.Items.Add(LI);
                LB_Access.Items.Remove(LI);
            }
        }

        protected void Btn_OneToAccess_Click(object sender, EventArgs e)
        {
            if (LB_Unaccess.SelectedItem != null)
            {
                LB_Access.Items.Add(LB_Unaccess.SelectedItem);
                LB_Unaccess.Items.Remove(LB_Unaccess.SelectedItem);
            }
        }

        protected void Btn_Allsave_Click(object sender, EventArgs e)
        {
            int PageID = int.Parse(DDL_Module.SelectedValue);
            int PID = int.Parse(DDL_Project2.SelectedValue);
            string UIDaccess = "";
            int AccessNum = LB_Access.Items.Count;
            for (int i = 0; i < AccessNum; i++)
            {
                UIDaccess += LB_Access.Items[i].Value + ",";
            }
            if (AccessNum > 0)
            {
                UIDaccess = UIDaccess.Substring(0, UIDaccess.Length - 1);
            }
            bool result = DAL.SystemManage.Update_UPP_Access_New3(Session["DatabaseName"].ToString(), PageID, PID, UIDaccess);

            if (result)
            {
                Response.Write("<script>alert('更新成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('更新失敗');</script>");
            }
        }

    }
}