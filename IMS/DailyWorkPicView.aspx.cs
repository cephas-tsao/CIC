using System;
using System.Web;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class DailyWorkPicView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
        }
        protected void Button33_Click(object sender, EventArgs e)
        {
            Pnl_Pic.Visible = true;
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Search.Visible == true))
            {
                Pnl_Search.Visible = false;
            }
            else
            {
                Pnl_Search.Visible = true;
            }
        }
        protected void Button34_Click(object sender, EventArgs e)
        {
            Pnl_Result.Visible = true;
            string Search_Condition = "";
            string Determine_Condition = "";
            DateTime dtDate;
            if (!(TextBox1.Text == "") || !(TextBox2.Text == ""))
            {
                if ((DateTime.TryParse(TextBox1.Text, out dtDate)) && (DateTime.TryParse(TextBox2.Text, out dtDate)))
                {
                    DateTime dt1 = Convert.ToDateTime(TextBox1.Text);
                    DateTime dt2 = Convert.ToDateTime(TextBox2.Text);
                    if (DateTime.Compare(dt1, dt2) < 0)
                    {
                        Search_Condition += "(Daily_Main.Date BETWEEN '" + TextBox1.Text + "' AND '" + TextBox2.Text + "') AND (Daily_Main.DailyID=Daily_WorkPic.DailyID)";
                        Determine_Condition = DDL_Op2.SelectedValue;
                    }
                    else
                    {
                        Response.Write("<script>alert('日報時間範圍有問題！');</script>");
                    }
                }
                else
                {
                    Pnl_Result.Visible = false;
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (!(TextBox4.Text == "") || !(TextBox5.Text == ""))
            {
                if ((DateTime.TryParse(TextBox4.Text, out dtDate)) && (DateTime.TryParse(TextBox5.Text, out dtDate)))
                {
                    DateTime dt1 = Convert.ToDateTime(TextBox4.Text);
                    DateTime dt2 = Convert.ToDateTime(TextBox5.Text);
                    if (DateTime.Compare(dt1, dt2) < 0)
                    {
                        Search_Condition += " " + Determine_Condition + " (Daily_WorkPic.PicDate BETWEEN '" + TextBox4.Text + "' AND '" + TextBox5.Text + "')";
                        Determine_Condition = DDL_Op3.SelectedValue;
                    }
                    else
                    {
                        Response.Write("<script>alert('日報時間範圍有問題！');</script>");
                    }
                }
                else
                {
                    Pnl_Result.Visible = false;
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (!(TextBox3.Text == ""))
            {
                if (Determine_Condition == "NOT")
                {
                    if (!(Search_Condition == ""))
                    {
                        Search_Condition += " Daily_WorkPic.PicTitle NOT LIKE";
                    }
                    else
                    {
                        Search_Condition += " AND Daily_WorkPic.PicTitle NOT LIKE";
                    }
                }
                else
                {
                    Search_Condition += " " + Determine_Condition + " Daily_WorkPic.PicTitle LIKE";
                }
                string kk = " '%" + TextBox3.Text + "%'";
                Search_Condition += kk;
                Determine_Condition = DDL_Op4.SelectedValue;
            }
            if (!(TextBox6.Text == ""))
            {
                if (Determine_Condition == "NOT")
                {
                    if (!(Search_Condition == ""))
                    {
                        Search_Condition += " Daily_WorkPic.PicLocation NOT LIKE";
                    }
                    else
                    {
                        Search_Condition += " AND Daily_WorkPic.PicLocation NOT LIKE";
                    }
                }
                else
                {
                    Search_Condition += " " + Determine_Condition + " Daily_WorkPic.PicLocation LIKE";
                }
                string kk = " '%" + TextBox6.Text + "%'";
                Search_Condition += kk;
                Determine_Condition = DDL_Op6.SelectedValue;
            }
            if (!(DropDownList7.SelectedValue == "-請選擇-"))
            {
                Search_Condition += " " + Determine_Condition + " Daily_WorkPic.PicType='" + DropDownList7.SelectedValue + "'";
                Determine_Condition = DDL_Op5.SelectedValue;
            }            
            if (!(DropDownList8.SelectedValue == "-請選擇-"))
            {
                Search_Condition += " " + Determine_Condition + " Daily_WorkPic.PicPeriod='" + DropDownList8.SelectedValue + "'";
                Determine_Condition = DDL_Op7.SelectedValue;
            }
            if (!(TextBox7.Text == ""))
            {
                HttpCookie cookie = Request.Cookies["bb"];
                Search_Condition += " " + Determine_Condition + " Daily_WorkPic.CWID=" + Convert.ToInt16(Server.UrlDecode(cookie.Value));
                Determine_Condition = DDL_Op8.SelectedValue; ;
            }
            if (!(DropDownList9.SelectedValue == "-請選擇-"))
            {
                Search_Condition += " " + Determine_Condition + " Daily_WorkPic.SC_Code='" + DropDownList9.SelectedValue + "'";
                Determine_Condition = DDL_Op9.SelectedValue;
            }
            if (!(TextBox8.Text == ""))
            {
                Search_Condition += " " + Determine_Condition + " Daily_WorkPic.PicNote='" + TextBox8.Text+"'";
            }
            if (!(Search_Condition == ""))
            {
                SqlDataSource2.SelectCommand = "select Daily_WorkPic.PicTitle, Daily_WorkPic.PicLocation, Daily_WorkPic.PicDate, Daily_WorkPic.PicType, Daily_WorkPic.PicPeriod from Daily_Main, Daily_WorkPic where Daily_Main.PID=" + Session["ProjectCode"] + " and " + Search_Condition;
                GridView1.DataBind();
            }
        }

        protected void Button23_Click(object sender, EventArgs e)
        {
            OpenNewWindow("DailyPicConItemLink.aspx", "PID");
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=no,scrollbars=yes,resizable=yes,height=700,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }

        protected void Button35_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            DropDownList7.SelectedValue = "0";
            DropDownList8.SelectedValue = "0";
            DropDownList9.SelectedValue = "0";
        }

        protected void Button36_Click(object sender, EventArgs e)
        {
            Pnl_Result.Visible = true;
            SqlDataSource2.SelectCommand = "select * from Daily_WorkPic";
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#e4c0d6'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DAL.Temp.cc != -1)
            {
                if ((DAL.Temp.cc % 2) == 0)
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#EFF3FB");
                }
                else
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                }
            }
            GridView1.Rows[GridView1.SelectedIndex].BackColor = System.Drawing.ColorTranslator.FromHtml("#c0d6e4");
            DAL.Temp.cc = GridView1.SelectedIndex;
            DAL.Temp3.cc = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);

            string[] kkk = new string[10];
            int j = 0;
            Pnl_Pic.Visible = true;
            string kk = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicPath", DAL.Temp3.cc);
            string[] kk_Array = kk.Split(',');
            foreach (string i in kk_Array)
            {
                kkk[j] = i.ToString();
                j = j + 1;
            }
            Label1.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicTitle", DAL.Temp3.cc);
            Label3.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicLocation", DAL.Temp3.cc);
            Label4.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicType", DAL.Temp3.cc);
            Label5.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicPeriod", DAL.Temp3.cc);
            Label6.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "CWID", DAL.Temp3.cc);
            Label2.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicDate", DAL.Temp3.cc);
            Label7.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "SC_Code", DAL.Temp3.cc);
            Label8.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicNote", DAL.Temp3.cc);
            string tempName = "Uploads/";
            string tempName1 = tempName + kkk[0];
            string TmpStr = "";
            TmpStr = @"<div>";
            TmpStr += @"<img src=" + tempName1 + @" alt="""" class=""bigpic"" width=""500"" />";
            TmpStr += @"<div>";
            for (int k = 0; k < j - 1; k++)
            {
                tempName1 = tempName + kk_Array[k];
                TmpStr += @"<a href=""javascript:void(0)"" onClick=""$('.bigpic').attr('src',$(this).find('img').attr('src'))""><img src=" + tempName1 + @" alt="""" width=""64"" height=""64""/></a>";
            }
            TmpStr += @"</div>";
            TmpStr += @"</div>";
            Literal1.Text = TmpStr.ToString();
        }

        protected void Self_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["aa"];
            TextBox7.Text = Server.UrlDecode(cookie.Value);
        }
    }
}