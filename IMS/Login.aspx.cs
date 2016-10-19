using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Net;

namespace IMS
{
    public partial class login : System.Web.UI.Page
    {
        protected string CID = (SystemSet.GetRequestSet("CID") != "") ? SystemSet.GetRequestSet("CID") : "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Lbl_Error.Visible = false;
            Page.Form.DefaultButton = Btn_submit.UniqueID;

            if (!IsPostBack)
            {
               

            }
        }
        protected void Btn_submit_Click(object sender, EventArgs e)
        {
            int checkPW0 = TB_Password.Text.ToString().IndexOf("'");
            int checkPW1 = TB_Password.Text.ToString().IndexOf("@");
            int checkPW2 = TB_Password.Text.ToString().IndexOf("\"");
            if (((checkPW0 > -1) || (checkPW1 > -1)) || (checkPW2 > -1))
            {
                Lbl_Error.Visible = true;
                Lbl_Error.Text = "密碼不允許使用特殊字元";
            }
            else
            {
                int status = login_success();
                if (status == 1)
                {
                    Response.Redirect("Main.aspx");
                }
                else if (status == 0)
                {
                    Lbl_Error.Visible = true;
                    Lbl_Error.Text = "此帳號不存在或密碼錯誤";
                }
                else if (status == -1)
                {
                    Lbl_Error.Visible = true;
                    Lbl_Error.Text = "此帳號目前被禁用";
                }
            }
        }

        public int login_success()
        {
               if (CID == "")
                {
                    CID = "TC";
                }
            string[] Login_Inf = DAL.Login.login_datacheck(TB_Name.Text,CID);
            string[] Company_Inf = new string[2];
            if (Login_Inf[0] == TB_Password.Text)
            {
                Session["UserName"] = TB_Name.Text;
                Session["Name"] = Login_Inf[3];
                
                if (Login_Inf[2] == "0")
                {
                    return -1;
                }
                Company_Inf = DAL.Login.Company_Information("1", int.Parse(Login_Inf[1]));
                Session["CompanyID"] = Login_Inf[1];
                Session["CompanyName"] = Company_Inf[0];
                Session["DatabaseName"] = Company_Inf[1];
                Session["LoginAccess"] = DAL.Login.Get_UserPageAccess_by_UID(Session["DatabaseName"].ToString(), Utility.Access_check.get_UID_by_username(Session["UserName"].ToString(), Session["CompanyID"].ToString()));
                Session["ProjectCode"] = "";
                ViewState["CID"] = CID;
                Response.Cookies["Url"].Value = CID;
                Session["CID"] = CID;
                string SQL = "Update SidePage set situation=1";
                bool result = WebModel.SQLAction(Session["DatabaseName"].ToString(), SQL);
                string IPaddress=Request.UserHostAddress;
                string HostName=Dns.GetHostName();
                HttpBrowserCapabilities BC=Request.Browser;
                string Browser=BC.Type+","+BC.Version+","+BC.Platform;
                string history = "Insert into [UserHistory] ([CID],[Company],[UserName],[IP],[HostName],[browser],[LoginTime]) VALUES('" + Session["CompanyID"].ToString() + "','" + Session["CompanyName"].ToString() + "','" + Session["UserName"].ToString() + "','" + IPaddress + "','" + HostName+"','" + Browser + "','"+DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")+"')";
                bool RESULT=WebModel.SQLAction("USER_Information",history);
                return 1;
            }
            else
            {
                return 0;
            }

        }

        protected void Btn_reset_Click(object sender, EventArgs e)
        {
            TB_Name.Text = "";
            TB_Password.Text = "";
        }

       
    }
}