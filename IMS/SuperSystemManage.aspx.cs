using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Diagnostics;
using System.Text;
using DAL;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Net;
//using System.IO.Directory;
namespace IMS
{
    public partial class SuperSystemManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string("USER_Information");
            if (!IsPostBack)
            {
                DDL_Company.SelectedIndex = 0;
                ListItem LI = new ListItem();

                LI.Text = "--請選擇--";
                LI.Value = "0";
                DDL_Company.Items.Insert(0, LI);
            }
            if (DDL_Company.SelectedValue != "")
            {
               
                SqlDataSource3.SelectCommand = "SELECT * FROM [USER_Information].[dbo].[UserDB] WHERE CompanyID=" + DDL_Company.SelectedValue;
            }
           

        }

        public bool Check_CompanyNo()
        {
            bool result = false;
            try
            {
                //string connectionString = "Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [SerialNo] from CompanyDB where SerialNo='" + TB_SNO.Text + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    return true;
                                }
                            }
                        }
                    }

                    conn.Close();
                    return false;
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                return false;
                //Log exception
                //Display Error message
            }

        }
        public bool Check_BCName()
        {
            bool result = false;
            try
            {
                //string connectionString = "Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [BCName] from CompanyDB where BCName='" + TB_BCName.Text + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    return true;
                                }
                            }
                        }
                    }

                    conn.Close();
                    return false;
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                return false;
                //Log exception
                //Display Error message
            }

        }
        public bool Check_DatabaseName()
        {
            bool result = false;
            try
            {
                //string connectionString = "Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [DatabaseName] from CompanyDB where DatabaseName='" + TB_DatabaseName.Text + "'", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    return true;
                                }
                            }
                        }
                    }

                    conn.Close();
                    return false;
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                return false;
                //Log exception
                //Display Error message
            }

        }

        protected void Btn_NewUser_Click(object sender, EventArgs e)
        {
            string insert = "";
            if (DAL.SystemManage.Check_UserName(TB_NewUser.Text))
            {
                Lbl_NU.Text = "此使用者已存在";
            }
            else
            {
                bool result = DAL.SystemManage.Insert_User(TB_NewUser.Text, TB_Password.Text, DDL_CompanyAll.SelectedItem.Text, TB_Name.Text, TB_Email.Text, TB_Phone1.Text, ddl_admin.SelectedValue);
                if (result)
                {
                    //新增ModuleAccess(模組權限)
                    int uid = WebModel.MaxID("USER_Information", "UserDB")-1;
                    string SQLSelect="Select * from [USER_Information].[dbo].[CompanyDB] where CompanyName='"+DDL_CompanyAll.SelectedItem.Text+"'";
                    string dbname = WebModel.SItemName("USER_Information", SQLSelect, "DatabaseName");
                    if (ddl_admin.SelectedValue == "1")
                    {
                        insert = "Insert into [" + dbname + "].[dbo].ModuleAccess  ([ModuleID],[UserID]) VALUES (19,'" + uid + "')";
                    }
                    else
                    {
                        insert = "Insert into [" + dbname + "].[dbo].ModuleAccess  ([ModuleID],[UserID]) VALUES (1,'" + uid + "')";
                    }
                    bool result1 = WebModel.SQLAction(dbname, insert);
                    string SQLSelectName = "Select * from [USER_Information].[dbo].[CompanyDB] where CompanyID=" + DDL_CompanyAll.SelectedValue;
                    string DbNmae = WebModel.SItemName("USER_Information", SQLSelectName, "DatabaseName");
                    if (TB_Email.Text != "")
                    {
                      
                        Gmail_SMTP(TB_Email.Text, "營建資訊雲系統開通通知", TB_Name.Text + "您好：您的『營建資訊雲系統』已經生效，帳號為『" + TB_NewUser.Text + "』，密碼為『" + TB_Password.Text + "』，輸入網址為http://140.118.5.112/login.aspx?CID=" + DbNmae + "。");

                    }
                    if (TB_Phone1.Text != "")
                    {
                        SMS_Click(TB_Phone1.Text, TB_Name.Text, TB_NewUser.Text, TB_Password.Text, DbNmae);

                    }
                    Response.Write("<script>alert('使用者已新增');location.href='SuperSystemManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('使用者新增失敗');location.href='SuperSystemManage.aspx';</script>");
                }
            }
        }
        public static bool CreatFolder(string database)
        {
            bool result = false;
            var dir = @"C:\Public\UploadFile\" + database;  // folder location

            if (!Directory.Exists(dir))
            {// if it doesn't exist, create
                Directory.CreateDirectory(dir);
            }
           
            result = true;
            return result;
        }
        public static bool Gmail_SMTP(string ToEmail, string Subject, string Body)
        {
            bool result = false;
            System.Net.Mail.SmtpClient MySmtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            MySmtp.Credentials = new System.Net.NetworkCredential("cephas0503@gmail.com", "cephas6253");
            MySmtp.EnableSsl = true;
            MySmtp.Send("cephas0503@gmail.com", ToEmail, Subject, Body);
            result = true;
            return result;
        }
        public static bool SMS_Click(string TB_Phone1,string TB_Name, string TB_NewUser,string TB_Password,string DbNmae)
        {
            bool result = false;
            string url = "";
            //url = "username=s8722447";
            //url = url + "&password=27330004";
            url = url + "&mobile=" + TB_Phone1;
            url = url + "&message=親愛的" + TB_Name + "您好：您的『營建資訊雲系統』已經生效，帳號為" + TB_NewUser + "，密碼為" + TB_Password + "";//輸入網址為http://140.118.5.112/login.aspx?CID=" + DbNmae + "";//您好：您的『營建資訊雲系統』已經生效，帳號為" + TB_NewUser + "，密碼為" + TB_Password + "，
            System.Net.WebClient wc = new System.Net.WebClient();
            //Stream st = wc.OpenRead("http://api.twsms.com/send_sms.php?username=s8722447&password=27330004&type=now&mo=Y&encoding=big5&mobile=" + TB_Phone1 + "&message=您好：您的『營建資訊雲系統』已經生效，帳號為『" + TB_NewUser + "』，密碼為『" + TB_Password + "』，輸入網址為http://140.118.5.112/login.aspx?CID=" + DbNmae + "");
            Stream st = wc.OpenRead("http://api.twsms.com/send_sms.php?username=s8722447&password=27330004&type=now&mo=Y&encoding=big5" + url);
            StreamReader sr = new StreamReader(st);
            string resp = sr.ReadToEnd();
            sr.Close();
            st.Close();
            //MessageBox.Show("發送完成：" + resp);
            result = true;
            return result;
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

        protected void TB_SNO_TextChanged(object sender, EventArgs e)
        {
            if (Check_CompanyNo())
            {
                Lbl_Error1.Text = "公司統編已存在";
                Lbl_Error1.Visible = true;
                Lbl_Error1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Lbl_Error1.Text = "可使用";
                Lbl_Error1.ForeColor = System.Drawing.Color.Green;
            }
        }

        public void Insert_Company(string CompanyName, string SerialNo, string Contact, string TeleNum, string FaxNum, string Address, string DatabaseName,string BCName)
        {
            try
            {
                //string connectionString = "Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Insert into CompanyDB([CompanyName],[DatabaseName],[SerialNo],[Address],[TeleNumber],[Contact],[FaxNumber],[CreatTime],[BCName]) VALUES ('" + CompanyName + "','" + DatabaseName + "','" + SerialNo + "','" + Address + "','" + TeleNum + "','" + Contact + "','" + FaxNum + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "','" + BCName + "')", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows != 0)
                        {
                            Lbl_NC.Text = "公司：" + CompanyName + "新增成功";
                        }
                        else
                        {
                            Lbl_NC.Text = "公司" + CompanyName + "新增失敗，請再確認是否輸入正確";
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                //Log exception
                //Display Error message
            }

        }

        public string ExeCommand(string commandText)
        {
            Process p = new Process();
            p.StartInfo.FileName = "cmd.exe";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.CreateNoWindow = true;
            string strOutput = null;
            try
            {
                p.Start();
                p.StandardInput.WriteLine(commandText);
                p.StandardInput.WriteLine("exit");
                strOutput = p.StandardOutput.ReadToEnd();
                p.WaitForExit();
                p.Close();
            }
            catch (Exception e)
            {
                strOutput = e.Message;
            }
            return strOutput;
        }

        protected void Btn_NewCompany_Click(object sender, EventArgs e)
        {
            if ((!Check_CompanyNo()) && (TB_NewCompany.Text != "") && (!Check_DatabaseName() && (!Check_BCName())))
            {
                bool flag = false;
                string str6 = "140.118.5.112";
                string str9 = TB_DatabaseName.Text;
                string str10 = "CICIMS";
                string str12 = "ntustCIC419";
                string str = base.Server.MapPath("~/db/");

                string str3 = str + "script.sql";
                string str4 = str + "script1.sql";
                string connectionString = string.Format("Data Source={0};Initial Catalog={1};User ID={2};Password={3}", new object[] { str6, str9, str10, str12 });
                Insert_Company(TB_NewCompany.Text, TB_SNO.Text, TB_Contact.Text, TB_TeleNum.Text, TB_FaxNum.Text, TB_Address.Text, TB_DatabaseName.Text, TB_BCName.Text);
                CreatFolder(str9);
                Response.Write("<script>alert('公司已新增');</script>");
                bool result = DAL.SuperSystemManage.Create_Company_Database(TB_DatabaseName.Text);
                //string writeinfile = "CREATE DATABASE " + TB_DatabaseName.Text + ";\r\n";
                //string filename = "D:\\create_db.sql";
                //string filename = base.Server.MapPath("~/db/script.sql");
                //DAL.SuperSystemManage.StreamWriterTextFile_Fn(writeinfile, filename);
                //string str4 = base.Server.MapPath("~/db/script.sql");
                //string runsql = "sqlcmd -U CICIMS -P ntustCIC419 -S tcp:WANG-PC\\SQLEXPRESS -i ~/db/script.sql";
                //Response.Write("<script>alert('建立資料庫中');</script>");
                //string result = ExeCommand(runsql);
                //Response.Write("<script>alert('資料庫建立完成');alert('建立資料表中');</script>");
                //writeinfile = "USE [" + TB_DatabaseName.Text + "]\r\n";
                //writeinfile += DAL.SuperSystemManage.StreamReadTextFile_Fn("~/db/script.sql");
                //DAL.SuperSystemManage.StreamWriterTextFile_Fn(writeinfile, filename);
                //result = ExeCommand(runsql);
                //Response.Write("<script>alert('資料表建立完成');location.href='SuperSystemManage.aspx';</script>");

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string str11 = string.Empty;
                    try
                    {
                        str11 = "資料庫連接失敗";
                        connection.Open();
                        str11 = "當前資料庫没有權限";
                        SqlCommand command = new SqlCommand("IF EXISTS (SELECT name FROM sysobjects WHERE name = 'a' AND type = 'U')DROP table a;create table a(id int not null default 0);drop table a;", connection);

                        command.ExecuteNonQuery();
                        Response.Write("<script>alert('資料表建立完成');location.href='SuperSystemManage.aspx';</script>");
                        string str13 = File.ReadAllText(str3, Encoding.UTF8);
                        string[] separator = new string[] { "\r\n;" };
                        string[] strArray2 = str13.Split(separator, StringSplitOptions.RemoveEmptyEntries);
                        str11 = "資料庫安装失敗";
                        for (int i = 0; i < strArray2.Length; i++)
                        {
                            command = new SqlCommand(strArray2[i], connection);
                            str12 = strArray2[i];
                            command.ExecuteNonQuery();
                        }
                        flag = true;
                    }

                    catch (Exception exception)
                    {
                        Response.Write("<script>alert('" + str11 + "<br>" + exception.Message + "');location.href='SuperSystemManage.aspx';</script>");
                    }
                }
             
            }
            else
            {

                Response.Write("<script>alert('請輸入公司統編、公司名稱、公司簡稱、資料庫名稱!!');location.href='SuperSystemManage.aspx';</script>");
            }
        }

        protected void GV_Rent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Row_ID = Convert.ToInt32(e.CommandArgument);
            string CompanyID = GV_Rent.DataKeys[Row_ID].Value.ToString();

            if (e.CommandName == "Query")
            {
                //Response.Write("<script>window.open('history_show.aspx');</script>");
                Response.Write("<script>window.open('history_show.aspx?ID=" + CompanyID + "');</script>");
            }
            else if (e.CommandName == "Pay")
            {
                //Response.Write("<script>window.open('license_pay.aspx');</script>");
                Response.Write("<script>window.open('license_pay.aspx?ID=" + CompanyID + "');</script>");
            }
        }

        protected void DDL_Company_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDL_User.DataBind();
        }

        protected void DDL_User_SelectedIndexChanged(object sender, EventArgs e)
        {
            Module_Access_Show();
        }

        protected void Btn_Project_Search_Click(object sender, EventArgs e)
        {
            Module_Access_Show_by_ProjectName(TB_Project_Search.Text);
        }

        public void Module_Access_Show_by_ProjectName(string ProjectName)
        {
            PH_Access.Controls.Clear();
            int fun_count = 0;
            int project_count = 0;
            int UID = 0;
            if (DDL_User.SelectedValue !="")
            {
            UID = int.Parse(DDL_User.SelectedValue);
            }
            string dbname = DAL.SuperSystemManage.Get_dbname_by_CompanyID(int.Parse(DDL_Company.SelectedValue));
            string access = DAL.SystemManage.Get_Module_Access(UID, dbname);
            string[] accesslist = access.Split(',');
            string[] modulename = Utility.Unitlist.ModuleList();
            string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code(dbname);
            string[] project_code = new string[1];
            string[] project_name = new string[1];
            if (projectcode_name[0] != null && projectcode_name[1] != null)
            {
             project_code = projectcode_name[0].Split(',');
             project_name = projectcode_name[1].Split(',');
            }
            string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(dbname, UID);
            string[] PPAlist = { "" };
            if (PPA[0] != null)
            {
                string[] PPAparta = PPA[1].Split(',');
                string[] PPApartb = PPA[0].Split(',');
                PPAlist = new string[PPAparta.Length];
                for (int i = 0; i < PPAparta.Length; i++)
                {
                    PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
                }
            }

            string[] page_id = new string[2];
            string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(dbname, "Main");
            string[] main_list = main_page[0].Split(',');
            string[] main_id = main_page[1].Split(',');
            int main_search = -1;

            PH_Access.Controls.Add(new LiteralControl("<table><tr><td>模組名稱</td><td>頁面名稱</td><td>專案名稱</td></tr>"));
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

                //page = DAL.SystemManage.Get_Page_by_Module(Session["DatabaseName"].ToString(), i);
                page_id = DAL.SystemManage.Get_Page_ID_by_Module(dbname, i);
                if (page_id[0] == "")
                {
                    PH_Access.Controls.Add(new LiteralControl("</td><td>----</td><td>"));
                    main_search = Array.IndexOf(main_list, i);
                    if (main_search >= 0)
                    {
                        project_count = 0;
                        foreach (string k in project_name)
                        {
                            CheckBox CBP = new CheckBox();
                            CBP.ID = "CBP" + fun_count.ToString() + "_" + main_id[main_search] + "_" + project_code[project_count];
                            CBP.Text = k;
                            if (Array.IndexOf(PPAlist, main_id[main_search] + "_" + project_code[project_count]) != -1)
                            {
                                CBP.Checked = true;
                            }
                            if (ProjectName !="")
                            {
                            if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
                            {
                                CBP.Visible = false;
                            }
                            }
                            PH_Access.Controls.Add(CBP);
                            project_count++;
                        }
                    }
                    PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                }
                else
                {
                    string[] pagelist = page_id[0].Split(',');
                    string[] idlist = page_id[1].Split(',');
                    PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                    PH_Access.Controls.Add(new LiteralControl(pagelist[0]));
                    PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                    //---
                    project_count = 0;
                    foreach (string k in project_name)
                    {
                        CheckBox CBP = new CheckBox();
                        CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[0] + "_" + project_code[project_count];
                        CBP.Text = k;
                        if (Array.IndexOf(PPAlist, idlist[0] + "_" + project_code[project_count]) != -1)
                        {
                            CBP.Checked = true;
                        }
                        if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
                        {
                            CBP.Visible = false;
                        }
                        PH_Access.Controls.Add(CBP);
                        project_count++;
                    }
                    PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                    for (int j = 1; j < pagelist.Length; j++)
                    {
                        PH_Access.Controls.Add(new LiteralControl("<tr><td></td><td>"));
                        PH_Access.Controls.Add(new LiteralControl(pagelist[j]));
                        PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                        project_count = 0;
                        foreach (string k in project_name)
                        {
                            CheckBox CBP = new CheckBox();
                            CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[j] + "_" + project_code[project_count];
                            CBP.Text = k;
                            if (Array.IndexOf(PPAlist, idlist[j] + "_" + project_code[project_count]) != -1)
                            {
                                CBP.Checked = true;
                            }
                            if (k.IndexOf(ProjectName, StringComparison.OrdinalIgnoreCase) < 0)
                            {
                                CBP.Visible = false;
                            }
                            PH_Access.Controls.Add(CBP);
                            project_count++;
                        }
                        PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                    }
                }
                fun_count = fun_count + 1;
            }
            PH_Access.Controls.Add(new LiteralControl("</table>"));
        }

        public void Module_Access_Show()
        {
            PH_Access.Controls.Clear();
            int fun_count = 0;
            int project_count = 0;
            int UID = int.Parse(DDL_User.SelectedValue);
            string dbname = DAL.SuperSystemManage.Get_dbname_by_CompanyID(int.Parse(DDL_Company.SelectedValue));
            string access = DAL.SystemManage.Get_Module_Access(UID, dbname);
            string[] accesslist = access.Split(',');
            string[] modulename = Utility.Unitlist.ModuleList();
            //string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code(Session["DatabaseName"].ToString());
            
            string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(dbname);
            string[] project_code=new string[1];
            string[] project_name = new string[1];
            if (projectcode_name[0] != null && projectcode_name[1] !=null)
            {
             project_code = projectcode_name[0].Split(',');
             project_name = projectcode_name[1].Split(',');
            }
            //string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(Session["DatabaseName"].ToString(), UID);
            string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID_New(dbname, UID);
            string[] PPAlist = { "" };
            if (PPA[0] != null)
            {
                string[] PPAparta = PPA[1].Split(',');
                string[] PPApartb = PPA[0].Split(',');
                PPAlist = new string[PPAparta.Length];
                for (int i = 0; i < PPAparta.Length; i++)
                {
                    PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
                }
            }

            string[] page_id = new string[2];
            string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(dbname, "Main");
            string[] main_list = main_page[0].Split(',');
            string[] main_id = main_page[1].Split(',');
            int main_search = -1;

            PH_Access.Controls.Add(new LiteralControl("<table><tr><td>模組名稱</td><td>頁面名稱</td><td>專案名稱</td></tr>"));
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

                //page = DAL.SystemManage.Get_Page_by_Module(Session["DatabaseName"].ToString(), i);
                page_id = DAL.SystemManage.Get_Page_ID_by_Module(dbname, i);
                if (page_id[0] == "")
                {
                    PH_Access.Controls.Add(new LiteralControl("</td><td>----</td><td>"));
                    main_search = Array.IndexOf(main_list, i);
                    if (main_search >= 0)
                    {
                        project_count = 0;
                        foreach (string k in project_name)
                        {
                            CheckBox CBP = new CheckBox();
                            CBP.ID = "CBP" + fun_count.ToString() + "_" + main_id[main_search] + "_" + project_code[project_count];
                            CBP.Text = k;
                            if (Array.IndexOf(PPAlist, main_id[main_search] + "_" + project_code[project_count]) != -1)
                            {
                                CBP.Checked = true;
                            }
                            PH_Access.Controls.Add(CBP);
                            project_count++;
                        }
                    }
                    PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                }
                else
                {
                    string[] pagelist = page_id[0].Split(',');
                    string[] idlist = page_id[1].Split(',');
                    PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                    PH_Access.Controls.Add(new LiteralControl(pagelist[0]));
                    PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                    //---
                    project_count = 0;
                    foreach (string k in project_name)
                    {
                        CheckBox CBP = new CheckBox();
                        CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[0] + "_" + project_code[project_count];
                        CBP.Text = k;
                        if (Array.IndexOf(PPAlist, idlist[0] + "_" + project_code[project_count]) != -1)
                        {
                            CBP.Checked = true;
                        }
                        PH_Access.Controls.Add(CBP);
                        project_count++;
                    }
                    PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                    for (int j = 1; j < pagelist.Length; j++)
                    {
                        PH_Access.Controls.Add(new LiteralControl("<tr><td></td><td>"));
                        PH_Access.Controls.Add(new LiteralControl(pagelist[j]));
                        PH_Access.Controls.Add(new LiteralControl("</td><td>"));
                        project_count = 0;
                        foreach (string k in project_name)
                        {
                            CheckBox CBP = new CheckBox();
                            CBP.ID = "CBP" + fun_count.ToString() + "_" + idlist[j] + "_" + project_code[project_count];
                            CBP.Text = k;
                            if (Array.IndexOf(PPAlist, idlist[j] + "_" + project_code[project_count]) != -1)
                            {
                                CBP.Checked = true;
                            }
                            PH_Access.Controls.Add(CBP);
                            project_count++;
                        }
                        PH_Access.Controls.Add(new LiteralControl("</td></tr>"));
                    }
                }
                fun_count = fun_count + 1;
            }
            PH_Access.Controls.Add(new LiteralControl("</table>"));
        }

        protected void Btn_LicenseUpdate_Click(object sender, EventArgs e)
        {
            string access = "";
            string page_project_access = "";
            string[] modulename = Utility.Unitlist.ModuleList();
            string dbname = DAL.SuperSystemManage.Get_dbname_by_CompanyID(int.Parse(DDL_Company.SelectedValue));
            string[] projectcode_name = DAL.SystemManage.Get_ProjectName_Code_New(dbname);
            string[] project_code = projectcode_name[0].Split(',');
            string[] project_name = projectcode_name[1].Split(',');
            int UID = int.Parse(DDL_User.SelectedValue);
            string[] page = new string[2];
            string[] PPA = DAL.SystemManage.Get_ProjectCodePageID_Access_by_UserID(dbname, UID);
            string[] PPAparta = PPA[1].Split(',');
            string[] PPApartb = PPA[0].Split(',');
            string[] PPAlist = new string[PPAparta.Length];
            for (int i = 0; i < PPAparta.Length; i++)
            {
                PPAlist[i] = PPAparta[i] + "_" + PPApartb[i];
            }
            string[] page_id = new string[2];
            string[] main_page = DAL.SystemManage.Get_Page_ID_by_Module(dbname, "Main");
            string[] main_list = main_page[0].Split(',');
            string[] main_id = main_page[1].Split(',');
            int main_search = -1;

            CheckBox CB = new CheckBox();
            CheckBox CBP = new CheckBox();
            for (int i = 0; i < modulename.Length; i++)
            {
                CB = (CheckBox)PH_Access.FindControl("CB" + i.ToString());
                if (CB.Checked)
                {
                    access += CB.ID.Substring(2) + ",";
                }
                page = DAL.SystemManage.Get_Page_ID_by_Module(dbname, modulename[i]);

                if (page[0] == "")
                {
                    main_search = Array.IndexOf(main_list, modulename[i]);
                    if (main_search >= 0)
                    {
                        for (int j = 0; j < project_code.Length; j++)
                        {
                            CBP = (CheckBox)PH_Access.FindControl("CBP" + i.ToString() + "_" + main_id[main_search] + "_" + project_code[j]);
                            if (CBP != null)
                            {
                                if (CBP.Checked)
                                {
                                    page_project_access += main_id[main_search] + "," + project_code[j] + ",";
                                }
                            }
                        }
                    }
                }
                else
                {
                    string[] pagelist = page[0].Split(',');
                    string[] idlist = page[1].Split(',');
                    for (int k = 0; k < idlist.Length; k++)
                    {
                        for (int j = 0; j < project_code.Length; j++)
                        {
                            CBP = (CheckBox)PH_Access.FindControl("CBP" + i.ToString() + "_" + idlist[k] + "_" + project_code[j]);
                            if (CBP != null)
                            {
                                if (CBP.Checked)
                                {
                                    page_project_access += idlist[k] + "," + project_code[j] + ",";
                                }
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
            bool result = DAL.SystemManage.Update_Module_Access(dbname, UID, access);
            //bool result2 = DAL.SystemManage.Update_UPP_Access(Session["DatabaseName"].ToString(), UID, page_project_access);
            bool result2 = DAL.SystemManage.Update_UPP_Access_New(dbname, UID, page_project_access);
            result = result & result2;
            if (result)
            {
                Response.Write("<script>alert('更新成功');location.href='SystemManage.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('更新失敗');location.href='SystemManage.aspx';</script>");
            }
        }

        protected void TB_DatabaseName_TextChanged(object sender, EventArgs e)
        {
            if (Check_DatabaseName())
            {
                Lbl_Error3.Text = "資料庫代碼已存在，請重新命名";
                Lbl_Error3.Visible = true;
                Lbl_Error3.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Lbl_Error3.Text = "可使用";
                Lbl_Error3.Visible = true;
                Lbl_Error3.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void TB_BCName_TextChanged(object sender, EventArgs e)
        {
            if (Check_BCName())
            {
                Lbl_Error4.Text = "公司簡稱已存在，請重新命名";
                Lbl_Error4.Visible = true;
                Lbl_Error4.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Lbl_Error4.Text = "可使用";
                Lbl_Error4.Visible = true;
                Lbl_Error4.ForeColor = System.Drawing.Color.Green;
            }
        }

       
    }
}