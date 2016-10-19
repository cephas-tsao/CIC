using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace IMS
{
    public partial class WordLibrary: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Sql_test1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_test7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                Unit_DDL.DataSource = Utility.Unitlist.UnitList();
                Unit_DDL.DataBind();
                Unit_DDL1.DataSource = Utility.Unitlist.UnitList();
                Unit_DDL1.DataBind();
                List_Show();
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
                GridView5.DataBind();
                GridView6.DataBind();
                GridView7.DataBind();
            }
            //Sql_test1.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type1.Text + "' and Content like '%" + TB_UsualWord1.Text + "%' and UnitID is null ORDER BY Sortnumber ASC";
            //Sql_test5.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type2.Text + "' and Content like '%" + TB_UsualWord2.Text + "%' and UnitID is not null ORDER BY Sortnumber ASC";
            
        }

        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.RowIndex % 2 == 0)
                {
                    //偶數列
                    //e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#ccffff'");
                    //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#66ffff'");
                }
                else
                {
                    //奇數列
                    //e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#ccffff'");
                    //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#66ffff'");
                }

            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            int NowKey = (int)GridView1.DataKeys[ID_class].Value;
            int lastvalue = (int)GridView1.DataKeys.Count;
            if (e.CommandName == "RowUp")
            {
                if (ID_class == 0)
                {
                    Response.Write("<script>alert('第一筆資料無法上移');</script>");
                }
                else
                {
                    try
                    {
                        int UpsideKey = (int)GridView1.DataKeys[ID_class - 1].Value;
                        try
                        {
                            SqlConnection conn = new SqlConnection(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                            conn.Open(); //打開連接
                            string UpsideStrsql = "SELECT Sortnumber FROM UsualWord WHERE ID = " + UpsideKey; //SQL 查詢語句
                            SqlCommand Upsidecmd = new SqlCommand(UpsideStrsql, conn); //初始化Command 對象
                            string UpsideOrder = Upsidecmd.ExecuteScalar().ToString();

                            string NowKeyStrsql = "SELECT Sortnumber FROM UsualWord WHERE ID = " + NowKey; //SQL 查詢語句
                            SqlCommand NowCmd = new SqlCommand(NowKeyStrsql, conn); //初始化Command 對象
                            string NowOrder = NowCmd.ExecuteScalar().ToString();

                            string UpdateUpsideSql = "UPDATE UsualWord SET Sortnumber = " + NowOrder + " WHERE ID = " + UpsideKey;
                            SqlCommand UpdateUpsideCmd = new SqlCommand(UpdateUpsideSql, conn); //初始化Command 對象
                            UpdateUpsideCmd.ExecuteNonQuery();

                            string UpdateNowSql = "UPDATE UsualWord SET Sortnumber = " + UpsideOrder + " WHERE ID = " + NowKey;
                            SqlCommand UpdateNowCmd = new SqlCommand(UpdateNowSql, conn); //初始化Command 對象
                            UpdateNowCmd.ExecuteNonQuery();

                            conn.Close();
                            conn.Dispose();
                            GridView1.DataBind();

                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                            Response.End();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                        Response.End();
                    }

                }
            }
            else if (e.CommandName == "RowDown")
            {
                if (ID_class == lastvalue - 1)
                {
                    Response.Write("<script>alert('最後一筆資料無法下移');</script>");
                }
                else
                {
                    try
                    {
                        int DownKey = (int)GridView1.DataKeys[ID_class + 1].Value;
                        try
                        {
                            SqlConnection conn = new SqlConnection(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                            conn.Open(); //打開連接
                            string DownStrsql = "SELECT Sortnumber FROM UsualWord WHERE ID = " + DownKey; //SQL 查詢語句
                            SqlCommand DownCmd = new SqlCommand(DownStrsql, conn); //初始化Command 對象
                            string DownOrder = DownCmd.ExecuteScalar().ToString();

                            string NowKeyStrsql = "SELECT Sortnumber FROM UsualWord WHERE ID = " + NowKey; //SQL 查詢語句
                            SqlCommand NowCmd = new SqlCommand(NowKeyStrsql, conn); //初始化Command 對象
                            string NowOrder = NowCmd.ExecuteScalar().ToString();

                            string UpdateDownSql = "UPDATE UsualWord SET Sortnumber = " + NowOrder + " WHERE ID = " + DownKey;
                            SqlCommand UpdateDownCmd = new SqlCommand(UpdateDownSql, conn); //初始化Command 對象
                            UpdateDownCmd.ExecuteNonQuery();

                            string UpdateNowSql = "UPDATE UsualWord SET Sortnumber = " + DownOrder + " WHERE ID = " + NowKey;
                            SqlCommand UpdateNowCmd = new SqlCommand(UpdateNowSql, conn); //初始化Command 對象
                            UpdateNowCmd.ExecuteNonQuery();

                            conn.Close();
                            conn.Dispose();
                            GridView1.DataBind();

                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                            Response.End();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                        Response.End();
                    }
                }
            }
        }

        protected void WordAdd_btn_Click(object sender, EventArgs e)
        {
            if ((lbl_type1.Text == "") && (WordAdd_txt.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type1.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {

                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert(lbl_type1.Text, WordAdd_txt.Text);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                    
                }
            }
        }


        public void datainsert(string lbl_type, string WordAdd)
        {
            int sortnumber = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT MAX(Sortnumber) from UsualWord", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                sortnumber = reader.GetInt32(0) + 1;
                            }
                        }
                    }
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO UsualWord([Type],[ConTent],[Sortnumber]) VALUES('" + lbl_type + "','" + WordAdd + "'," + sortnumber.ToString() + ")", conn))
                    {
                        //cmd.Parameters.AddWithValue("@ConTent", "hi_test");

                        int rows = cmd.ExecuteNonQuery();

                        //rows number of record got inserted
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

        public int getmaxsortnumber()
        {
            int sortnumber = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT MAX(Sortnumber) from UsualWord", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                sortnumber = reader.GetInt32(0);

                            }
                            conn.Close();
                            return sortnumber;
                        }
                    }

                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
                return 0;
                //Log exception
                //Display Error message
            }
        }

        public void datainsert2(string lbl_type, string WordAdd_txt, string Unit)
        {
            int sortnumber = 0;
            try
            {
                string connectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT MAX(Sortnumber) from UsualWord", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                sortnumber = reader.GetInt32(0) + 1;
                            }
                        }
                    }
                    using (SqlCommand cmd =
                        new SqlCommand("INSERT INTO UsualWord([Type],[ConTent],[Sortnumber],[UnitID]) VALUES('" + lbl_type + "','" + WordAdd_txt + "'," + sortnumber.ToString() + ",'" + Unit + "')", conn))
                    {
                        //cmd.Parameters.AddWithValue("@ConTent", "hi_test");

                        int rows = cmd.ExecuteNonQuery();

                        //rows number of record got inserted
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

        protected void WordAdd_btn2_Click(object sender, EventArgs e)
        {
            if ((lbl_type2.Text == "") && (WordAdd_txt2.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type2.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt2.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt2.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert(lbl_type2.Text, WordAdd_txt2.Text);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }

        protected void tabs_1_Click(object sender, EventArgs e)
        {
            lbl_type1.Text = "日報工作內容";
            lbl_type11.Text = "日報工作內容)";
            //tabs_A.Attributes.Add("style", "display:''");
            //tabs_B.Attributes.Add("style", "display:none");
            Sql_test1.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type1.Text + "'  ORDER BY Sortnumber ASC";
            //GridView1.DataBind();
        }

        protected void tabs_2_Click(object sender, EventArgs e)
        {
            lbl_type2.Text = "施工記事";
            lbl_type12.Text = "施工記事)";
            //tabs_A.Attributes.Add("style", "display:''");
            //tabs_B.Attributes.Add("style", "display:none");
            Sql_test2.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type2.Text + "'  ORDER BY Sortnumber ASC";
            //GridView2.DataBind();
        }

        protected void tabs_3_Click(object sender, EventArgs e)
        {
            lbl_type3.Text = "合約備註";
            lbl_type13.Text = "合約備註)";
            //tabs_A.Attributes.Add("style", "display:''");
            //tabs_B.Attributes.Add("style", "display:none");
            Sql_test3.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type3.Text + "'  ORDER BY Sortnumber ASC";
            //GridView3.DataBind();
        }

        protected void tabs_4_Click(object sender, EventArgs e)
        {
            lbl_type4.Text = "業主建築師指示";
            lbl_type14.Text = "業主建築師指示)";
            //tabs_A.Attributes.Add("style", "display:''");
            //tabs_B.Attributes.Add("style", "display:none");
            Sql_test4.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type4.Text + "'  ORDER BY Sortnumber ASC";
            //GridView4.DataBind();
        }

        protected void tabs_5_Click(object sender, EventArgs e)
        {
            lbl_type5.Text = "人力機具";
            lbl_type15.Text = "人力機具)";
            //tabs_A.Attributes.Add("style", "display:none");
            //tabs_B.Attributes.Add("style", "display:''");
            Sql_test5.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type='" + lbl_type5.Text + "'  ORDER BY Sortnumber ASC";
            //GridView5.DataBind();
        }

        protected void tabs_6_Click(object sender, EventArgs e)
        {
            lbl_type6.Text = "材料";
            lbl_type16.Text = "材料)";
            //tabs_A.Attributes.Add("style", "display:none");
            //tabs_B.Attributes.Add("style", "display:''");
            Sql_test6.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type='" + lbl_type6.Text + "'  ORDER BY Sortnumber ASC";
            //GridView6.DataBind();
        }

        protected void tabs_7_Click(object sender, EventArgs e)
        {
            lbl_type7.Text = "工作項目";
            lbl_type17.Text = "工作項目)";
            //tabs_A.Attributes.Add("style", "display:none");
            //tabs_B.Attributes.Add("style", "display:''");
            Sql_test7.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type='" + lbl_type7.Text + "'  ORDER BY Sortnumber ASC";
            //GridView7.DataBind();
        }

        protected void btn_select1_Click(object sender, EventArgs e)
        {
            Sql_test1.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type1.Text + "' and Content like '%" + TB_UsualWord1.Text + "%' ORDER BY Sortnumber ASC";
            GridView1.DataBind();
        }


        protected void tabs_8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wordlibrary_AllSearch.aspx");
        }

        protected void btn_select2_Click(object sender, EventArgs e)
        {
            Sql_test2.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type2.Text + "' and Content like '%" + TB_UsualWord2.Text + "%' ORDER BY Sortnumber ASC";
            GridView2.DataBind();
        }

        protected void btn_select3_Click(object sender, EventArgs e)
        {
            Sql_test3.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type3.Text + "' and Content like '%" + TB_UsualWord3.Text + "%' ORDER BY Sortnumber ASC";
            GridView3.DataBind();
        }

        protected void btn_select4_Click(object sender, EventArgs e)
        {
            Sql_test4.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type4.Text + "' and Content like '%" + TB_UsualWord4.Text + "%' ORDER BY Sortnumber ASC";
            GridView4.DataBind();
        }

        protected void btn_select5_Click(object sender, EventArgs e)
        {
            Sql_test5.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type5.Text + "' and Content like '%" + TB_UsualWord5.Text + "%' ORDER BY Sortnumber ASC";
            GridView5.DataBind();
        }

        protected void btn_select6_Click(object sender, EventArgs e)
        {
            Sql_test6.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type='" + lbl_type6.Text + "' and Content like '%" + TB_UsualWord6.Text + "%' and UnitID is not null ORDER BY Sortnumber ASC";
            GridView6.DataBind();
        }
        protected void btn_select7_Click(object sender, EventArgs e)
        {
            Sql_test7.SelectCommand = "SELECT * FROM [UsualWord] WHERE Type = '" + lbl_type7.Text + "' and Content like '%" + TB_UsualWord7.Text + "%' and UnitID is not null ORDER BY Sortnumber ASC";
            GridView7.DataBind();
        }

       

        protected void WordAdd_btn3_Click(object sender, EventArgs e)
        {
            if ((lbl_type3.Text == "") && (WordAdd_txt3.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type3.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt3.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt3.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert(lbl_type3.Text, WordAdd_txt3.Text);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }

        protected void WordAdd_btn4_Click(object sender, EventArgs e)
        {
            if ((lbl_type4.Text == "") && (WordAdd_txt4.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type4.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt4.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt4.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert(lbl_type4.Text, WordAdd_txt4.Text);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }

        protected void WordAdd_btn5_Click(object sender, EventArgs e)
        {
            if ((lbl_type5.Text == "") && (WordAdd_txt5.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type5.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt5.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt5.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert(lbl_type5.Text, WordAdd_txt5.Text);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }

        protected void WordAdd_btn6_Click(object sender, EventArgs e)
        {
            if ((lbl_type6.Text == "") && (WordAdd_txt6.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type6.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt6.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt6.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert2(lbl_type6.Text, WordAdd_txt6.Text, Unit_DDL.SelectedValue);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }

        protected void WordAdd_btn7_Click(object sender, EventArgs e)
        {
            if ((lbl_type7.Text == "") && (WordAdd_txt7.Text == ""))
            {
                Response.Write("<script>alert('請選擇分類並輸入常用詞');</script>");
            }
            else if (lbl_type7.Text == "")
            {
                Response.Write("<script>alert('請選擇分類');</script>");
            }
            else if (WordAdd_txt7.Text == "")
            {
                Response.Write("<script>alert('常用詞不允許輸入空值');</script>");
            }
            else
            {
                if (DAL.WordLibrary.datacheck(Session["DatabaseName"].ToString(), WordAdd_txt7.Text))
                {
                    Response.Write("<script>alert('此常用詞已建檔');</script>");
                }
                else
                {
                    datainsert2(lbl_type7.Text, WordAdd_txt7.Text, Unit_DDL1.SelectedValue);
                    Response.Write("<script>alert('新增成功');location.href='WordLibrary.aspx';</script>");
                    //Response.Redirect("WordLibrary.aspx");
                }
            }
        }
        public void List_Show()
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;


            string[] Public = DAL.WordLibrary.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));

            string[] ID = Public[0].Split('|');
            string[] Type = Public[1].Split('|');
            string[] Content = Public[2].Split('|');
            string[] Sortnumber = Public[3].Split('|');
            string[] UnitID = Public[4].Split('|');

            string[] Private = DAL.WordLibrary.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] ID1 = Private[0]!=null?Private[0].Split('|'):null;
            string[] Type1 =Private[1]!=null? Private[1].Split('|'):null;
            string[] Content1 = Private[2]!=null?Private[2].Split('|'):null;
            string[] Sortnumber1 =Private[3]!=null? Private[3].Split('|'):null;
            string[] UnitID1 = Private[4]!=null?Private[4].Split('|'):null;
            string[] PublicId = Private[5] !=null?Private[5].Split('|'):null;
            foreach (string item in Content)
            {
                bool flag = false;
                ListItem LI = new ListItem();
                LI.Text = Type[user_count].ToString() + "-" + item;
                LI.Value = ID[user_count].ToString() + " | " + Type[user_count].ToString() + " | " + Sortnumber[user_count].ToString() + " | " + UnitID[user_count].ToString();
                //使用for迴圈撈出陣列值
                if (PublicId != null)
                {
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                            if (nowPublicId == int.Parse(ID[user_count]))
                            {
                                LB_Private.Items.Add(LI);
                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                }
                if (!flag)
                {
                    LB_Public.Items.Add(LI);
                    user_count++;

                }

              
               
            }
        }

        protected void Btn_OneToPrivate_Click(object sender, EventArgs e)
        {
            int[] indices = LB_Public.GetSelectedIndices();

            if (LB_Public.SelectedItem != null)
            {
                foreach (int i in LB_Public.GetSelectedIndices())
                {
                    LB_Private.Items.Add(LB_Public.Items[i]);

                }

                for (int i = indices.Length - 1; i >= 0; i--)
                {


                    LB_Public.Items.RemoveAt(indices[i]);

                }


            }
        }

        protected void Btn_AllToPrivate_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Public.Items.Count;

            for (int i = Mv_times - 1; i >= 0; i--)
            {



                ListItem LI = new ListItem();
                LI.Text = LB_Public.Items[i].Text;
                LI.Value = LB_Public.Items[i].Value;
                string lid = LI.Value.Split('|')[0];

                LB_Private.Items.Add(LI);
                LB_Public.Items.Remove(LI);

            }
        }

        protected void Btn_OneToPublic_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;
            int[] indices = LB_Private.GetSelectedIndices();
            if (LB_Private.SelectedItem != null)
            {
                foreach (int i in LB_Private.GetSelectedIndices())
                {
                    LB_Public.Items.Add(LB_Private.Items[i]);

                }

                for (int i = indices.Length - 1; i >= 0; i--)
                {


                    LB_Private.Items.RemoveAt(indices[i]);

                }
                //for (int i = indices.Length - 1; i >= 0; i--)
                //{
                //    LB_Private.Items.RemoveAt(indices[i]);
                //    LB_Public.Items.Add(LB_Public.Items[i]);
                //}
            }
        }

        protected void Btn_AllToPublic_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;

            for (int i = Mv_times - 1; i >= 0; i--)
            {



                ListItem LI = new ListItem();
                LI.Text = LB_Private.Items[i].Text;
                LI.Value = LB_Private.Items[i].Value;

                LB_Public.Items.Add(LI);
                LB_Private.Items.Remove(LI);

            }
        }

        protected void Btn_Allsave_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;
            string database = Session["DatabaseName"].ToString();
            bool result = false;
            
            for (int i = Mv_times - 1; i >= 0; i--)
            {

                ListItem LI = new ListItem();
                LI.Text = LB_Private.Items[i].Text;
                LI.Value = LB_Private.Items[i].Value;
                string Content = LI.Text.Split('-')[1];
                string ID = LI.Value.Split('|')[0];
                string Type = LI.Value.Split('|')[1].Trim();
                string Sortnumber = LI.Value.Split('|')[2];
                string UnitID = LI.Value.Split('|')[3];
                //string clound = LI.Value.Split('|')[4];
                if (DAL.WordLibrary.checkPublicID(database, ID))
                {
                    string Insert = "insert into [UsualWord] ([Type],[Content],[Sortnumber],[UnitID],[PublicID]) VALUES('" + Type + "','" + Content + "','" + Sortnumber + "','" + UnitID + "','" + ID + "')";
                    result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert);
                    //NextID = WebModel.MaxID(database, "PrivateResource") - 1;
                }
               

            }
            if (result)
            {

                Response.Write("<script>alert('新增成功');</script>");

            }
            else
            {
                Response.Write("<script>alert('新增失敗');</script>");
            }
        }

        protected void BtnPrivateS_Click(object sender, EventArgs e)
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;
            //int PageID = 0;
            //int PID = 0;

            string keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox1.Text));

            string[] Public = DAL.WordLibrary.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            if (Public[0] != null)
            {
                string[] ID = Public[0].Split('|');
                string[] Type = Public[1].Split('|');
                string[] Content = Public[2].Split('|');
                string[] Sortnumber = Public[3].Split('|');
                string[] UnitID = Public[4].Split('|');

                string[] Private = DAL.WordLibrary.Get_PrivateResource_Search(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()), keyword);
                string[] ID1 = Private[0].Split('|');
                string[] Type1 = Private[1].Split('|');
                string[] Content1 = Private[2].Split('|');
                string[] Sortnumber1 = Private[3].Split('|');
                string[] UnitID1 = Private[4].Split('|');
                string[] PublicId = Private[5].Split('|');

                foreach (string item in Content)
                {
                    bool flag = false;
                    ListItem LI = new ListItem();
                    LI.Text = Type[user_count].ToString() + "-" + Content[user_count].ToString();
                    LI.Value = ID[user_count].ToString() + " | " + Type[user_count].ToString() + " | " + Sortnumber[user_count].ToString() + " | " + UnitID[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                            if (nowPublicId == int.Parse(ID[user_count]))
                            {
                                LB_Private.Items.Add(LI);

                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                    if (!flag)
                    {
                        LB_Public.Items.Add(LI);
                        user_count++;

                    }

                }
            }
            else
            {
                Response.Write("<script>alert('無此項目');</script>");

            }
        }

        protected void BtnPublicS_Click(object sender, EventArgs e)
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;

            string keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox2.Text));

            string[] Public = DAL.WordLibrary.Get_PublicResource_Search(Utility.DBconnection.connect_string("PublicDB"), keyword);
            //string[] Public1 = DAL.PriceAnalysis.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            string[] Private = DAL.WordLibrary.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] PublicId = Private[5].Split('|');
            if (Private[0] != null)
            {
                string[] ID1 = Private[0].Split('|');
                string[] Type1 = Private[1].Split('|');
                string[] Content1 = Private[2].Split('|');
                string[] Sortnumber1 = Private[3].Split('|');
                string[] UnitID1 = Private[4].Split('|');
                string[] PublicId1 = Private[5].Split('|');


                //foreach (string item1 in ItemName1)
                //{
                //bool flag = false;


                //使用for迴圈撈出陣列值
                for (int id = 0; id < ID1.Length; id++)
                {
                    ListItem LI1 = new ListItem();
                    LI1.Text = Type1[id].ToString() + "-" + Content1[id].ToString();
                    LI1.Value = ID1[id].ToString() + " | " + Type1[id].ToString() + " | " + Sortnumber1[id].ToString() + " | " + UnitID1[id].ToString() + " | " + PublicId1[id].ToString();

                    if (PublicId1[id] != "0" && PublicId1[id] != "")
                    {


                        LB_Private.Items.Add(LI1);
                        //LB_Private.Items.Add(new ListItem(LI1.Text, LI1.Value));
                    }

                }


            }
            if (Public[0] != null)
            {
                string[] ID = Public[0].Split('|');
                string[] Type = Public[1].Split('|');
                string[] Content = Public[2].Split('|');
                string[] Sortnumber = Public[3].Split('|');
                string[] UnitID = Public[4].Split('|');
                user_count = 0;


                foreach (string item in Content)
                {
                    bool flag = false;

                    ListItem LI = new ListItem();
                    LI.Text = Type[user_count].ToString() + "-" + item ;
                    LI.Value = ID[user_count].ToString() + " | " + Type[user_count].ToString() + " | " + Sortnumber[user_count].ToString() + " | " + UnitID[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                            if (int.Parse(ID[user_count]) == nowPublicId)
                            {
                                //LB_Public.Items.Add(LI);

                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                    if (!flag)
                    {
                        LB_Public.Items.Add(LI);
                        user_count++;

                    }
                  
                }

            }
            else
            {
                Response.Write("<script>alert('無此項目');</script>");

            }


        }
        //public string ShowGV_Unit(object o)
        //{
        //    string unit = "";
        //    string oo = Convert.ToString(o);
        //    string[] allunit = Utility.Unitlist.UnitList();
        //    unit = allunit[int.Parse(oo)];
        //    return unit;
        //}
    }
}