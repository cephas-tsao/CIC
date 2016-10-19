using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class SuperUserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Lbl_Error.Visible = false;
            Page.Form.DefaultButton = Btn_submit.UniqueID;
        }

        protected void Btn_reset_Click(object sender, EventArgs e)
        {
            TB_Name.Text = "";
            TB_Password.Text = "";
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
                    Response.Redirect("SuperSystemManage.aspx");
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
            //string[] Login_Inf = DAL.Login.login_datacheck(TB_Name.Text);
            string Login_Inf = DAL.SuperUserLogin.login_datacheck(TB_Name.Text);
            string[] Company_Inf = new string[2];
            if (Login_Inf == TB_Password.Text)
            {
                Session["UserName"] = TB_Name.Text;
                Session["Name"] = TB_Name.Text;

                return 1;
            }
            else
            {
                return 0;
            }

        }
    }
}