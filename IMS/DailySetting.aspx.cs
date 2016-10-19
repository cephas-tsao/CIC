using System;

namespace IMS
{
    public partial class DailySetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                GridView1.Visible = true;
                GridView2.Visible = true;
                GridView3.Visible = true;
                GridView4.Visible = true;
                GridView5.Visible = true;
                GridView6.Visible = true;
                GridView7.Visible = true;
                GridView8.Visible = true;
                GridView9.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            bool load_part1=false;
            if (TextBox7.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView2.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add(Session["DatabaseName"].ToString(), "WorkPicType", TextBox7.Text);
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From WorkPicType";
                GridView2.DataBind();
                TextBox7.Text = "";
            }
            GridView2.DataBind();
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox8.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView2.Visible = true;
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From WorkPicType Where WP_Type Like '%" + TextBox8.Text + "%'";
                GridView2.DataBind();
                TextBox8.Text = "";
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select * From WorkPicType";
            GridView2.DataBind();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox9.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView9.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "工地施作記事", TextBox9.Text);
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "Select * From Daily_UsualWord where UW_Type='工地施作記事'";
                GridView9.DataBind();
                TextBox9.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (TextBox10.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView9.Visible = true;
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "Select * From Daily_UsualWord where UW_Type='工地施作記事' and UW_Content Like '%" + TextBox10.Text + "%'";
                GridView9.DataBind();
                TextBox10.Text = "";
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            GridView9.Visible = true;
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = "Select * From Daily_UsualWord where UW_Type='工地施作記事'";
            GridView9.DataBind();
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox11.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView1.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "重要事項紀錄", TextBox11.Text);
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.SelectCommand = "Select * From Daily_UsualWord where UW_Type='重要事項紀錄'";
                GridView1.DataBind();
                TextBox11.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            if (TextBox12.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView1.Visible = true;
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.SelectCommand = "Select * From Daily_UsualWord where UW_Type='重要事項紀錄' and UW_Content Like '%" + TextBox12.Text + "%'";
                GridView1.DataBind();
                TextBox12.Text = "";
            }
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.SelectCommand = "Select * From Daily_UsualWord where UW_Type='重要事項紀錄'";
            GridView1.DataBind();
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox13.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView3.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "業主指示事項", TextBox13.Text);
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.SelectCommand = "Select * From Daily_UsualWord where UW_Type='業主指示事項'";
                GridView3.DataBind();
                TextBox13.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            if (TextBox14.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView3.Visible = true;
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.SelectCommand = "Select * From Daily_UsualWord where UW_Type='業主指示事項' and UW_Content Like '%" + TextBox14.Text + "%'";
                GridView3.DataBind();
                TextBox14.Text = "";
            }
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.SelectCommand = "Select * From Daily_UsualWord where UW_Type='業主指示事項'";
            GridView3.DataBind();
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox15.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView4.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "監造指示事項", TextBox15.Text);
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.SelectCommand = "Select * From Daily_UsualWord where UW_Type='監造指示事項'";
                GridView4.DataBind();
                TextBox15.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button19_Click(object sender, EventArgs e)
        {
            if (TextBox16.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView4.Visible = true;
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.SelectCommand = "Select * From Daily_UsualWord where UW_Type='監造指示事項' and UW_Content Like '%" + TextBox16.Text + "%'";
                GridView4.DataBind();
                TextBox16.Text = "";
            }
        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            GridView4.Visible = true;
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.SelectCommand = "Select * From Daily_UsualWord where UW_Type='監造指示事項'";
            GridView4.DataBind();
        }

        protected void Button21_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox17.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView5.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "勞工安全查核事項", TextBox17.Text);
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.SelectCommand = "Select * From Daily_UsualWord where UW_Type='勞工安全查核事項'";
                GridView5.DataBind();
                TextBox17.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button22_Click(object sender, EventArgs e)
        {
            if (TextBox18.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView5.Visible = true;
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.SelectCommand = "Select * From Daily_UsualWord where UW_Type='勞工安全查核事項' and UW_Content Like '%" + TextBox18.Text + "%'";
                GridView5.DataBind();
                TextBox18.Text = "";
            }
        }

        protected void Button23_Click(object sender, EventArgs e)
        {
            GridView5.Visible = true;
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.SelectCommand = "Select * From Daily_UsualWord where UW_Type='勞工安全查核事項'";
            GridView5.DataBind();
        }

        protected void Button24_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox19.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView6.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "施工取樣試驗記錄", TextBox19.Text);
                SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource7.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工取樣試驗記錄'";
                GridView6.DataBind();
                TextBox19.Text = "";
            }
            GridView3.DataBind();
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button25_Click(object sender, EventArgs e)
        {
            if (TextBox20.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView6.Visible = true;
                SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource7.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工取樣試驗記錄' and UW_Content Like '%" + TextBox20.Text + "%'";
                GridView6.DataBind();
                TextBox20.Text = "";
            }
        }

        protected void Button26_Click(object sender, EventArgs e)
        {
            GridView6.Visible = true;
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工取樣試驗記錄'";
            GridView6.DataBind();
        }

        protected void Button27_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox21.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView7.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "通知分包廠商辦理", TextBox21.Text);
                SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource8.SelectCommand = "Select * From Daily_UsualWord where UW_Type='通知分包廠商辦理'";
                GridView7.DataBind();
                TextBox21.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button28_Click(object sender, EventArgs e)
        {
            if (TextBox22.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView7.Visible = true;
                SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource8.SelectCommand = "Select * From Daily_UsualWord where UW_Type='通知分包廠商辦理' and UW_Content Like '%" + TextBox22.Text + "%'";
                GridView7.DataBind();
                TextBox22.Text = "";
            }
        }

        protected void Button29_Click(object sender, EventArgs e)
        {
            GridView7.Visible = true;
            SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource8.SelectCommand = "Select * From Daily_UsualWord where UW_Type='通知分包廠商辦理'";
            GridView7.DataBind();
        }

        protected void Button30_Click(object sender, EventArgs e)
        {
            bool load_part1 = false;
            if (TextBox23.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView8.Visible = true;
                load_part1 = DAL.DailyMode.Data_Add2(Session["DatabaseName"].ToString(), "施工品質查核", TextBox23.Text);
                SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource9.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工品質查核'";
                GridView8.DataBind();
                TextBox23.Text = "";
            }
            if (load_part1)
            {
                Response.Write("<script language=javascript>alert('資料新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料新增失敗！')</script>");
            }
        }

        protected void Button31_Click(object sender, EventArgs e)
        {
            if (TextBox24.Text == "")
            {
                Response.Write("<script language=javascript>alert('資料尚未輸入！')</script>");
            }
            else
            {
                GridView8.Visible = true;
                SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource9.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工品質查核' and UW_Content Like '%" + TextBox24.Text + "%'";
                GridView8.DataBind();
                TextBox24.Text = "";
            }
        }

        protected void Button32_Click(object sender, EventArgs e)
        {
            GridView8.Visible = true;
            SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource9.SelectCommand = "Select * From Daily_UsualWord where UW_Type='施工品質查核'";
            GridView8.DataBind();
        }
    }
}