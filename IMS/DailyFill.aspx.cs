using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace IMS
{
    public partial class DailyFill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Literal700.Text = DAL.DailyMode.Generate_DailyReport_KeyWord(Session["DatabaseName"].ToString());
            Session["PID"] = Session["ProjectCode"];
            Session["DailyID"] = "";
            /*SqlDataSource10.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource11.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource12.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource13.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource14.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource15.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource16.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());*/
            Sql_DDL6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_GV_Activity.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());

            //Sql_DDL6.SelectCommand = "select concat(WIName,'_版本',Version) as WIText, concat(WIID,'?',WIName,'?',Version,'?',EBudget_WBS.Unit) as WIID from Progress_WIINF join EBudget_WBS on EBudget_WBS.EWID=Progress_WIINF.WBSID WHERE Lock=1 and ProjectID='" + Session["ProjectCode"].ToString() + "'";
            Sql_DDL6.SelectCommand = "select WIName as WIText, concat(WIID,'?',WIName,'?',Version,'?',EBudget_WBS.Unit,'?',EWID) as WIID from Progress_WIINF join EBudget_WBS on EBudget_WBS.EWID=Progress_WIINF.WBSID WHERE Lock=1 and ProjectID='" + Session["ProjectCode"].ToString() + "'";
            Sql_GV_Activity.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                TB_Date.Text = DateTime.Now.ToString("yyyy/MM/dd");    //日期選擇用
                TB_PicDate.Text = DateTime.Now.ToString("yyyy/MM/dd"); //拍照用
                DAL.Temp.cc = -1;
            }
            DateTime dtDate;
            if (DateTime.TryParse(TB_Date.Text, out dtDate))
            {
                if (DAL.DailyMode.Report_Date_Check(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text)))
                {
                    Pnl_No.Visible = false;
                    Pnl_Yes.Visible = true;
                    EnabledTrue();
                    Session["DailyID"] = DAL.DailyMode.Get_DailyID_By_ProjectID_ReportDate(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text));
                    main_page_presave();
                    main_page_load();
                    Panel10.Visible = true;
                    Panel31.Visible = true;
                    SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                    SqlDataSource8.SelectCommand = "select Daily_SampleID, ItemName from Daily_TestSampling where DailyID=" + Session["DailyID"] + "and Daily_SampleID not in (select Daily_SampleID from Daily_TestReport where DailyID=" + Session["DailyID"] + ")";
                    Panel6.Visible = true;

                }
                else
                {
                    Pnl_No.Visible = true;
                    Pnl_Yes.Visible = false;
                    EnabledFalse();
                    Panel10.Visible = false;
                    Panel31.Visible = false;
                }
                Sql_GV_Activity.SelectCommand = "SELECT * FROM Daily_Activity WHERE DailyID='" + Session["DailyID"].ToString() + "'";

                //DropDownList17.Enabled = false;
            }
            else
            {
                Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
            }
        }

        public void main_page_presave()
        {
            // base information
            ViewState["M1"] = DropDownList13.SelectedValue;
            ViewState["M2"] = DropDownList14.SelectedValue;
            ViewState["M3"] = DropDownList15.SelectedValue;
            ViewState["M4"] = DropDownList16.SelectedValue;
            ViewState["M5"] = TextBox55.Text;
            ViewState["M6"] = TextBox56.Text;
            // report_record
            ViewState["R1"] = TB_Note1.Text;
            ViewState["R2"] = TB_Note2.Text;
            ViewState["R3"] = TB_Note3.Text;
            ViewState["R4"] = TB_Note4.Text;
            ViewState["R5"] = TB_Note5.Text;
            ViewState["R6"] = TB_Note6.Text;
            ViewState["R7"] = TB_Note7.Text;
            ViewState["R8"] = TB_Note8.Text;
            ViewState["R9"] = TB_Note9.Text;
            ViewState["R10"] = TB_Note10.Text;

        }
        public void main_page_load()
        {
            decimal BP = 0.000M;
            decimal RP = 0.000M;
            bool DAM = false;
            bool DPM = false;
            string WAM = "";
            string WPM = "";
            bool load_part1 = DAL.DailyMode.Get_Report_Data_By_DailyID(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), out WAM, out WPM, out DAM, out DPM, out BP, out RP);
            DropDownList13.SelectedValue = WAM;
            DropDownList15.SelectedValue = WPM;
            if (DAM)
            {
                DropDownList14.SelectedValue = "1";
            }
            else
            {
                DropDownList14.SelectedValue = "0";
            }
            //DropDownList14.SelectedValue = DAM.ToString();
            if (DPM)
            {
                DropDownList16.SelectedValue = "1";
            }
            else
            {
                DropDownList16.SelectedValue = "0";
            }
            TextBox55.Text = BP.ToString();
            TextBox56.Text = RP.ToString();

            string[] Report_Type = new string[10];
            string[] Report_Content = new string[10];

            bool load_part2 = DAL.DailyMode.Get_Report_TextBoxs_By_DailyID(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), out Report_Type, out Report_Content);
            for (int i = 0; i < Report_Type.Length; i++)
            {
                if (Report_Type[i] == "工地施作記事")
                {
                    TB_Note1.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "重要事項紀錄")
                {
                    TB_Note2.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "業主指示事項")
                {
                    TB_Note3.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "監造指示事項")
                {
                    TB_Note4.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "勞工安全查核事項")
                {
                    TB_Note5.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "施工取樣試驗紀錄")
                {
                    TB_Note6.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "通知分包廠商辦理事項")
                {
                    TB_Note7.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "施工品質查核")
                {
                    TB_Note8.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "備註")
                {
                    TB_Note9.Text = Report_Content[i];
                    //break;
                }
                if (Report_Type[i] == "其他資訊")
                {
                    TB_Note10.Text = Report_Content[i];
                    //break;
                }
            }

        }
        protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList10.SelectedValue.ToString() == "-請選擇-")
            {
                Response.Write("<script language=javascript>alert('尚未選擇資源項目！')</script>");
            }
            else
            {
                string aa1 = DAL.DailyMode.Report_Data_Check3(Session["DatabaseName"].ToString(), "Pro_Resource", "Unit", DropDownList10.SelectedValue.ToString());
                int aa2 = DAL.DailyMode.Report_Data_Check2(Session["DatabaseName"].ToString(), "Pro_Resource", "PriceID", DropDownList10.SelectedValue.ToString());
                bool bb = DAL.DailyMode.TestSampling_Add_Data(Session["DatabaseName"].ToString(), Session["DailyID"].ToString(), aa2.ToString(), DropDownList10.SelectedValue, aa1.ToString());
                GVgetData();
            }
        }
        /*protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.SelectCommand = "select UW_Content from Daily_UsualWord WHERE UW_Type='" + DropDownList5.SelectedValue + "'";
            DropDownList17.Enabled = true;
            switch (DropDownList5.SelectedIndex)
            {
                case 0:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 1:
                    Pnl_Note1.Visible = true;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 2:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = true;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 3:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = true;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 4:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = true;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 5:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = true;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 6:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = true;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 7:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = true;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 8:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = true;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = false;
                    break;
                case 9:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = true;
                    Pnl_Note10.Visible = false;
                    break;
                case 10:
                    Pnl_Note1.Visible = false;
                    Pnl_Note2.Visible = false;
                    Pnl_Note3.Visible = false;
                    Pnl_Note4.Visible = false;
                    Pnl_Note5.Visible = false;
                    Pnl_Note6.Visible = false;
                    Pnl_Note7.Visible = false;
                    Pnl_Note8.Visible = false;
                    Pnl_Note9.Visible = false;
                    Pnl_Note10.Visible = true;
                    break;
            }
        }*/
        protected void LinkButton78_Click(object sender, EventArgs e)
        {
            if ((Pnl_L.Visible == true))
            {
                Pnl_L.Visible = false;
            }
            else
            {
                Pnl_L.Visible = true;
            }
        }
        protected void LinkButton79_Click(object sender, EventArgs e)
        {
            if ((Pnl_E.Visible == true))
            {
                Pnl_E.Visible = false;
            }
            else
            {
                Pnl_E.Visible = true;
            }
        }
        protected void LinkButton80_Click(object sender, EventArgs e)
        {
            if ((Pnl_M.Visible == true))
            {
                Pnl_M.Visible = false;
            }
            else
            {
                Pnl_M.Visible = true;
            }
        }

        protected void Button32_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                if (TextBox13.Text == "" && DropDownList7.SelectedValue == "" && TextBox15.Text == "" && TB_PicDate.Text == "" && TextBox14.Text == "" && DropDownList8.SelectedValue == "" && DropDownList9.SelectedValue == "") //&& TextBox54.Text=="" 
                {
                    Response.Write("<script language=javascript>alert('有資料尚未輸入！')</script>");
                }
                else
                {
                    String fileName;
                    String savePath = Server.MapPath("~/Uploads/");
                    String saveResult;
                    String FileNameAll;
                    FileNameAll = "";
                    foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
                    {
                        fileName = postedFile.FileName;
                        FileNameAll = FileNameAll + fileName + ",";
                        saveResult = savePath + fileName;
                        postedFile.SaveAs(saveResult);
                    }
                    HttpCookie cookie = Request.Cookies["bb"];
                    bool load_part1 = DAL.DailyMode.Up_WorkPice(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), FileNameAll, TextBox13.Text, DropDownList7.SelectedValue, int.Parse(Server.UrlDecode(cookie.Value)), TextBox15.Text, TB_PicDate.Text, TextBox14.Text, DropDownList8.SelectedValue, DropDownList9.SelectedValue);
                    SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                    SqlDataSource2.SelectCommand = "select * from  Daily_WorkPic WHERE DailyID='" + Session["DailyID"] + "'";
                    this.GridView1.DataBind();
                    if (load_part1)
                    {
                        Response.Write("<script language=javascript>alert('檔案上傳成功！')</script>");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('檔案上傳失敗！')</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('請先挑選檔案之後，再來上傳')</script>");
            }
        }

        void EnabledFalse()
        {
            //Panel1.Enabled = false;
            Pnl_1Top.Enabled = false;
            Pnl_AllNote.Enabled = false;
            Panel2.Enabled = false;
            Panel3.Enabled = false;
            Panel4.Enabled = false;
            Panel5.Enabled = false;
            Panel6.Enabled = false;
            //DropDownList13.SelectedValue = "-請選擇-";
            //DropDownList14.SelectedValue = "-請選擇-";
            //DropDownList15.SelectedValue = "-請選擇-";
            //DropDownList16.SelectedValue = "-請選擇-";
            TextBox55.Text = "";
            TextBox56.Text = "";
            TB_Note1.Text = "";
            TB_Note2.Text = "";
            TB_Note3.Text = "";
            TB_Note4.Text = "";
            TB_Note5.Text = "";
            TB_Note6.Text = "";
            TB_Note7.Text = "";
            TB_Note8.Text = "";
            TB_Note9.Text = "";
            TB_Note10.Text = "";
        }
        void EnabledTrue()
        {
            //Panel1.Enabled = true;
            Pnl_1Top.Enabled = true;
            Pnl_AllNote.Enabled = true;
            Panel2.Enabled = true;
            Panel3.Enabled = true;
            Panel4.Enabled = true;
            Panel5.Enabled = true;
            Panel6.Enabled = true;
        }
        protected void TB_Date_TextChanged(object sender, EventArgs e)
        {
            DateTime dtDate;
            if (DateTime.TryParse(TB_Date.Text, out dtDate))
            {
                GV_Activity.DataBind();
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "select * from  Daily_WorkPic WHERE DailyID='" + Session["DailyID"] + "'";
                GridView1.DataBind();
                GVgetData();

                DropDownList11.Items.Clear();
                DropDownList11.Items.Add("-請選擇-");
                DropDownList25.Items.Clear();
                DropDownList1.Items.Clear();
                DropDownList2.Items.Clear();
                SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource8.SelectCommand = "select Daily_SampleID, ItemName from Daily_TestSampling where DailyID=" + Session["DailyID"] + "and Daily_SampleID not in (select Daily_SampleID from Daily_TestReport where DailyID=" + Session["DailyID"] + ")";
                GridView4_GVgetData();
                Panel6.Visible = true;
                GridView5_getData();
                GridView2_getData();
                GridView7_getData();
            }
            else
            {
                Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
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

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {

            decimal BP = decimal.Parse(ViewState["M5"].ToString());
            decimal RP = decimal.Parse(ViewState["M6"].ToString());
            bool DAM = false;
            bool DPM = false;
            if (ViewState["M2"].ToString() == "1")
            {
                DAM = true;
            }
            else if (ViewState["M2"].ToString() == "0")
            {
                DAM = false;
            }
            if (ViewState["M4"].ToString() == "1")
            {
                DPM = true;
            }
            else if (ViewState["M4"].ToString() == "0")
            {
                DPM = false;
            }
            DAL.DailyMode.Update_Report_Data(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), ViewState["M1"].ToString(), ViewState["M3"].ToString(), DAM, DPM, BP, RP);

            string[] RecordType = new string[10] { "工地施作記事", "重要事項紀錄", "業主指示事項", "監造指示事項", "勞工安全查核事項", "施工取樣試驗紀錄", "通知分包廠商辦理事項", "施工品質查核", "備註", "其他資訊" };
            string[] RecordContent = new string[10];
            RecordContent[0] = ViewState["R1"].ToString();
            RecordContent[1] = ViewState["R2"].ToString();
            RecordContent[2] = ViewState["R3"].ToString();
            RecordContent[3] = ViewState["R4"].ToString();
            RecordContent[4] = ViewState["R5"].ToString();
            RecordContent[5] = ViewState["R6"].ToString();
            RecordContent[6] = ViewState["R7"].ToString();
            RecordContent[7] = ViewState["R8"].ToString();
            RecordContent[8] = ViewState["R9"].ToString();
            RecordContent[9] = ViewState["R10"].ToString();
            DAL.DailyMode.Update_Report_TextBoxs(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), RecordType, RecordContent);

            main_page_load();
        }

        protected void DDL_Save_Click(object sender, EventArgs e)
        {
            //int EWID = 0;
            decimal BudgetNumber = 0.000M;
            decimal DoneNumber = 0.000M;
            decimal DailyNumber = 0.000M;
            if (DropDownList6.SelectedValue != "0")
            {
                string[] DDL_INF = DropDownList6.SelectedValue.Split('?');
                int UID = DAL.DailyMode.Insert_Activity_Check(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), int.Parse(DDL_INF[0]));
                if (UID != 0)
                {
                    // update
                    //DAL.DailyMode.Update_Activity(Session["DatabaseName"].ToString(), UID, int.Parse(Session["DailyID"].ToString()), EWID, int.Parse(DDL_INF[0]), DDL_INF[1], int.Parse(DDL_INF[2]), DDL_INF[3], BudgetNumber, DoneNumber, DailyNumber);
                    // it should be not insert
                    Response.Write("<script>alert('該項目已存在！無法新增');</script>");
                }
                else
                {
                    // insert
                    /*try
                    {
                        string connectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                        using (SqlConnection conn =
                            new SqlConnection(connectionString))
                        {
                            conn.Open();

                            using (SqlCommand cmd = new SqlCommand("SELECT EBudget_WBS.LastENumber FROM EBudget_WBS INNER JOIN Daily_Activity ON EBudget_WBS.EWID = Daily_Activity.EWID WHERE " , conn))
                            {
                                using (var reader = cmd.ExecuteReader())
                                {
                                    while (reader.Read())
                                    {
                                        BudgetNumber= reader.GetString(0);
                                    }
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (SqlException ex)
                    {
                        Console.Write(ex.ToString());
                        //Display Error message
                    }*/


                DAL.DailyMode.Insert_Activity(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), int.Parse(DDL_INF[4]), int.Parse(DDL_INF[0]), DDL_INF[1], int.Parse(DDL_INF[2]), DDL_INF[3], BudgetNumber, DoneNumber, DailyNumber);
                }
            }
            GV_Activity.DataBind();
        }

        public string Show_Amount(object sender1, object sender2)
        {
            string result = "";
            int WIID = Convert.ToInt32(sender1);
            int Version = Convert.ToInt32(sender2);
            decimal xx = DAL.DailyMode.Get_ENumber_times_Amount_By_WIID_Version(Session["DatabaseName"].ToString(), WIID, Version);
            result = xx.ToString("F3");
            return result;
        }

        public string Show_DoneAmount(object sender1, object sender2)
        {
            string result = "";
            int WIID = Convert.ToInt32(sender1);
            int Version = Convert.ToInt32(sender2);
            DateTime dt = DateTime.Parse(TB_Date.Text);
            decimal xx = DAL.DailyMode.Get_DoneNumber_By_WIID_Version_ReportDate(Session["DatabaseName"].ToString(), WIID, Version, dt);
            result = xx.ToString("F3");
            return result;
        }
/*
        protected void Btn_Note1_Click(object sender, EventArgs e)
        {
            TB_Note1.Text += DropDownList17.Text;
        }

        protected void Btn_Note2_Click(object sender, EventArgs e)
        {
            TB_Note2.Text += DropDownList18.Text;
        }

        protected void Btn_Note3_Click(object sender, EventArgs e)
        {
            TB_Note3.Text += DropDownList19.Text;
        }

        protected void Btn_Note4_Click(object sender, EventArgs e)
        {
            TB_Note4.Text += DropDownList20.Text;
        }

        protected void Btn_Note5_Click(object sender, EventArgs e)
        {
            TB_Note5.Text += DropDownList21.Text;
        }

        protected void Btn_Note6_Click(object sender, EventArgs e)
        {
            TB_Note6.Text += DropDownList22.Text;
        }

        protected void Btn_Note7_Click(object sender, EventArgs e)
        {
            TB_Note7.Text += DropDownList23.Text;
        }

        protected void Btn_Note8_Click(object sender, EventArgs e)
        {
            TB_Note8.Text += DropDownList24.Text;
        }
*/
        //protected void Labor_Insert_Click(object sender, EventArgs e)
        //{
        //if (DDL_Labor.SelectedValue != " ")
        //{
        //DAL.DailyMode.Insert_Labor(Session["DatabaseName"].ToString(), int.Parse(Session["DailyID"].ToString()), DDL_Labor.SelectedValue);
        //}
        //GV_Labor.DataBind();
        //}

        public string Show_CAmount(object sender1)
        {
            string result = "";
            int PriceID = Convert.ToInt32(sender1);
            decimal xx = DAL.DailyMode.Get_Resource_CNumber_By_PriceID(Session["DatabaseName"].ToString(), PriceID);
            result = xx.ToString("F3");
            return result;
        }

        public string Show_EAmount(object sender1)
        {
            string result = "";
            int PriceID = Convert.ToInt32(sender1);
            decimal xx = DAL.DailyMode.Get_Resource_ENumber_By_PriceID(Session["DatabaseName"].ToString(), PriceID);
            result = xx.ToString("F3");
            return result;
        }

        public string Show_DoneLabor(object sender1)
        {
            string result = "";
            decimal xx = 0.000M;
            result = xx.ToString("F3");
            return result;
        }

        public string Show_LaborNY(object sender1, object sender2)
        {
            string result = "";
            int DailyID = Convert.ToInt32(sender1);
            int PriceID = Convert.ToInt32(sender2);

            int xx = DAL.DailyMode.Get_Labor_NY_By_DailyID_PriceID(Session["DatabaseName"].ToString(), DailyID, PriceID);
            //decimal xx = DAL.DailyMode.Get_DoneNumber_By_WIID_Version_ReportDate(Session["DatabaseName"].ToString(), WIID, Version, dt);
            if (xx == 1)
            {
                result = "是";
            }
            else if (xx == 2)
            {
                result = "否";
            }
            return result;
        }
        protected void TB_Note7_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList25_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TB_Note7_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void Labor_Insert_Click(object sender, EventArgs e)
        {
            if (DropDownList25.SelectedValue != "-請選擇-")
            {
                string ItemName = DAL.DailyMode.Insert_Labor_Check(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList25.SelectedValue));
                string unit = DAL.DailyMode.Insert_Labor_Check1(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList25.SelectedValue));
                decimal CAmount = DAL.DailyMode.Insert_Labor_Check2(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList25.SelectedValue));
                decimal EAmount = DAL.DailyMode.Insert_Labor_Check3(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList25.SelectedValue));
                bool aa = DAL.DailyMode.Insert_Labor(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["DailyID"]), Convert.ToInt16(DropDownList25.SelectedValue), ItemName, unit, CAmount, EAmount);
            }
            GridView5_getData();
            DropDownList25.Items.Clear();
            SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource9.SelectCommand = "SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind= '人力') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Equipment WHERE DailyID=" + Session["DailyID"] + "))";
            DropDownList25.DataBind();
        }
        //點擊編輯按鈕
        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            GVgetData();
        }
        private void GVgetData()
        {
            GridView3.DataSource = getData();
            GridView3.DataBind();
        }
        //點擊取消按鈕
        protected void GridView3_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView3.EditIndex = -1;
            GVgetData();
        }
        //點擊更新按鈕
        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String updateString = "UPDATE Daily_TestSampling SET SNumber=@SNumber, SUnit=@SUnit, PNumber=@PNumber, PUnit=@PUnit, Standard=@Standard, Notes=@Notes, Location=@Location, SamplingMan=@SamplingMan, MaterailInDate=@MaterailInDate, BookReportDate=@BookReportDate,  TestType=@TestType, FirmName=@FirmName, LabName=@LabName WHERE Daily_SampleID=@Daily_SampleID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(updateString, cn);
            cmd.Parameters.Add("@Daily_SampleID", SqlDbType.Int);
            cmd.Parameters.Add("@SNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@SUnit", SqlDbType.NVarChar);
            cmd.Parameters.Add("@PNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@PUnit", SqlDbType.NVarChar);
            cmd.Parameters.Add("@Standard", SqlDbType.NVarChar);
            cmd.Parameters.Add("@Notes", SqlDbType.NVarChar);
            cmd.Parameters.Add("@Location", SqlDbType.NVarChar);
            cmd.Parameters.Add("@SamplingMan", SqlDbType.NVarChar);
            cmd.Parameters.Add("@MaterailInDate", SqlDbType.NVarChar);
            cmd.Parameters.Add("@BookReportDate", SqlDbType.NVarChar);
            cmd.Parameters.Add("@TestType", SqlDbType.NVarChar);
            cmd.Parameters.Add("@FirmName", SqlDbType.NVarChar);
            cmd.Parameters.Add("@LabName", SqlDbType.NVarChar);
            cmd.Parameters["@Daily_SampleID"].Value = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value);
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name1")).Text == "")
            {
                cmd.Parameters["@SNumber"].Value = 0;
            }
            else
            { 
                cmd.Parameters["@SNumber"].Value = Convert.ToDecimal(((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name1")).Text);
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name2")).Text == "")
            {
                cmd.Parameters["@SUnit"].Value = " ";
            }
            else
            {
                cmd.Parameters["@SUnit"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name2")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name3")).Text == "")
            {
                cmd.Parameters["@PNumber"].Value=0;
            }
            else
            {
                cmd.Parameters["@PNumber"].Value = Convert.ToDecimal(((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name3")).Text);
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name4")).Text == "")
            {
                cmd.Parameters["@PUnit"].Value = " ";
            }
            else
            {
                cmd.Parameters["@PUnit"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name4")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name5")).Text == "")
            {
                cmd.Parameters["@Standard"].Value = " ";
            }
            else
            {
                cmd.Parameters["@Standard"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name5")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name6")).Text == "")
            {
                cmd.Parameters["@Notes"].Value = " ";
            }
            else
            {
                cmd.Parameters["@Notes"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name6")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name7")).Text == "")
            {
                cmd.Parameters["@Location"].Value = " ";
            }
            else
            {
                cmd.Parameters["@Location"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name7")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name8")).Text == "")
            {
                cmd.Parameters["@SamplingMan"].Value = " ";
            }
            else
            {
                cmd.Parameters["@SamplingMan"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name8")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name9")).Text == "")
            {
                cmd.Parameters["@MaterailInDate"].Value = " ";
            }
            else
            {
                cmd.Parameters["@MaterailInDate"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name9")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name10")).Text == "")
            {
                cmd.Parameters["@BookReportDate"].Value = " ";
            }
            else
            {
                cmd.Parameters["@BookReportDate"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name10")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name10")).Text == "")
            {
                cmd.Parameters["@BookReportDate"].Value = " ";
            }
            else
            {
                cmd.Parameters["@BookReportDate"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name10")).Text;
            }
            if (((DropDownList)GridView3.Rows[e.RowIndex].FindControl("lb_Nmae11")).SelectedValue.ToString() == "")
            {
                cmd.Parameters["@TestType"].Value = " ";
            }
            else
            {
                cmd.Parameters["@TestType"].Value = ((DropDownList)GridView3.Rows[e.RowIndex].FindControl("lb_Nmae11")).SelectedValue.ToString();
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name12")).Text == "")
            {
                cmd.Parameters["@FirmName"].Value = " ";
            }
            else
            {
                cmd.Parameters["@FirmName"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name12")).Text;
            }
            if (((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name13")).Text == "")
            {
                cmd.Parameters["@LabName"].Value = " ";
            }
            else
            {
                cmd.Parameters["@LabName"].Value = ((TextBox)GridView3.Rows[e.RowIndex].FindControl("tbx_Name13")).Text;
            }
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView3.EditIndex = -1;
            GVgetData();
        }
        //點擊刪除按鈕
        protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String deleteString = "DELETE FROM Daily_TestSampling WHERE Daily_SampleID=@Daily_SampleID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(deleteString, cn);
            cmd.Parameters.Add("@Daily_SampleID", SqlDbType.Int);
            cmd.Parameters["@Daily_SampleID"].Value = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GVgetData();
        }
        private DataSet getData()
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            SqlConnection cn = new SqlConnection(connStr);
            String selectString = "SELECT * FROM Daily_TestSampling WHERE DailyID='" + Session["DailyID"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(selectString, cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            cn.Open();
            da.Fill(ds);
            cn.Close();
            return ds;
        }

        protected void TB_Note10_TextChanged(object sender, EventArgs e)
        {

        }
        protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool bb = DAL.DailyMode.TestReport_Add_Data(Session["DatabaseName"].ToString(), Session["DailyID"].ToString(), DropDownList11.SelectedValue);
            GridView4_GVgetData();
            DropDownList11.Items.Clear();
            DropDownList11.DataBind();
        }
        //點擊編輯按鈕
        protected void GridView4_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView4.EditIndex = e.NewEditIndex;
            GridView4_GVgetData();
        }
        private void GridView4_GVgetData()
        {
            if (Session["DailyID"].ToString() != "")
            {
                GridView4.Visible = true;
                DAL.Temp.j = 0;
                DAL.DailyMode.Daily_TestReport_Search(Session["DatabaseName"].ToString(), Session["DailyID"].ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("ItemName");
                dt.Columns.Add("Unit");
                dt.Columns.Add("SNumber");
                dt.Columns.Add("SUnit");
                dt.Columns.Add("Notes");
                dt.Columns.Add("Daily_ReportID");
                dt.Columns.Add("RegularNumber");
                dt.Columns.Add("TestMan");
                dt.Columns.Add("RealReportDate");
                dt.Columns.Add("LabName");
                dt.Columns.Add("TestReportPath");
                for (int j = 1; j < DAL.Temp.j; j++)
                {
                    DataRow row = dt.NewRow();
                    row["ItemName"] = DAL.Temp.count3[0, j];
                    row["Unit"] = DAL.Temp.count3[1, j];
                    row["SNumber"] = DAL.Temp.count3[2, j];
                    row["SUnit"] = DAL.Temp.count3[3, j];
                    row["Notes"] = DAL.Temp.count3[4, j];
                    row["Daily_ReportID"] = DAL.Temp.count3[5, j];
                    row["RegularNumber"] = DAL.Temp.count3[6, j];
                    row["TestMan"] = DAL.Temp.count3[7, j];
                    row["RealReportDate"] = DAL.Temp.count3[8, j];
                    row["LabName"] = DAL.Temp.count3[9, j];
                    if (DAL.Temp.count3[10, j] == null || DAL.Temp.count3[10, j] == " ")
                    {
                        row["TestReportPath"] = "0";
                    }
                    else
                    {
                        row["TestReportPath"] = DAL.Temp.count3[10, j];
                    }
                    dt.Rows.Add(row);
                }
                GridView4.DataSource = dt;
                GridView4.DataBind();
            }
            else
            {
                GridView4.Visible = false;
            }
        }
        //點擊取消按鈕
        protected void GridView4_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView4.EditIndex = -1;
            GridView4_GVgetData();
        }
        //點擊更新按鈕
        protected void GridView4_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String updateString = "UPDATE Daily_TestReport SET RegularNumber=@RegularNumber, TestMan=@TestMan, RealReportDate=@RealReportDate, LabName=@LabName WHERE Daily_ReportID=@Daily_ReportID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(updateString, cn);
            cmd.Parameters.Add("@Daily_ReportID", SqlDbType.Int);
            cmd.Parameters.Add("@RegularNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@TestMan", SqlDbType.NVarChar);
            cmd.Parameters.Add("@RealReportDate", SqlDbType.NVarChar);
            cmd.Parameters.Add("@LabName", SqlDbType.NVarChar);
            cmd.Parameters["@Daily_ReportID"].Value = Convert.ToInt32(GridView4.DataKeys[e.RowIndex].Value);
            if (((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name41")).Text == "")
            {
                cmd.Parameters["@RegularNumber"].Value = 0;
            }
            else
            {
                cmd.Parameters["@RegularNumber"].Value =  Convert.ToDecimal(((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name41")).Text);
            }
            if (((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name42")).Text == "")
            {
                cmd.Parameters["@RealReportDate"].Value = " ";
            }
            else
            {
                cmd.Parameters["@RealReportDate"].Value = ((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name42")).Text;
            }
            if (((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name43")).Text == "")
            {
                cmd.Parameters["@LabName"].Value = " ";
            }
            else
            {
                cmd.Parameters["@LabName"].Value = ((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name43")).Text;
            }
            if (((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name44")).Text == "")
            {
                cmd.Parameters["@TestMan"].Value = " ";
            }
            else
            {
                cmd.Parameters["@TestMan"].Value = ((TextBox)GridView4.Rows[e.RowIndex].FindControl("tbx_Name44")).Text;
            }
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView4.EditIndex = -1;
            GridView4_GVgetData();
        }
        //點擊刪除按鈕
        protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView4_GVgetData();
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String deleteString = "DELETE FROM Daily_TestReport WHERE Daily_ReportID=@Daily_ReportID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(deleteString, cn);
            cmd.Parameters.Add("@Daily_ReportID", SqlDbType.Int);
            cmd.Parameters["@Daily_ReportID"].Value = Convert.ToInt32(GridView4.DataKeys[e.RowIndex].Value);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView4_GVgetData();
            DropDownList11.Items.Clear();
            DropDownList11.DataBind();
        }
        private void GridView5_getData()
        {
            if (Session["DailyID"].ToString() != "")
            {
                GridView5.Visible = true;
                DAL.Temp.j = 0;
                DAL.DailyMode.Daily_Labor_Search2(Session["DatabaseName"].ToString(), "Daily_Labor", "DailyID", Session["DailyID"].ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("UID");
                dt.Columns.Add("ItemName");
                dt.Columns.Add("Unit");
                dt.Columns.Add("CAmount");
                dt.Columns.Add("EAmount");
                dt.Columns.Add("Summation_DailyNumber");
                dt.Columns.Add("DailyNumber");
                dt.Columns.Add("ValucationNY");
                for (int j = 1; j < DAL.Temp.j; j++)
                {
                    DataRow row = dt.NewRow();
                    row["UID"] = DAL.Temp.count3[0, j];
                    row["ItemName"] = DAL.Temp.count3[1, j];
                    row["Unit"] = DAL.Temp.count3[2, j];
                    row["CAmount"] = DAL.Temp.count3[3, j];
                    row["EAmount"] = DAL.Temp.count3[4, j];
                    row["Summation_DailyNumber"] = DAL.Temp.count3[5, j];
                    row["DailyNumber"] = DAL.Temp.count3[6, j];
                    row["ValucationNY"] = DAL.Temp.count3[7, j];
                    dt.Rows.Add(row);
                }
                GridView5.DataSource = dt;
                GridView5.DataBind();
            }
            else
            {
                GridView5.Visible = false;
            }
        }
        //點擊編輯按鈕
        protected void GridView5_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView5.EditIndex = e.NewEditIndex;
            GridView5_GVgetData();
        }
        private void GridView5_GVgetData()
        {
            GridView5_getData();
            GridView5.DataBind();
        }
        //點擊取消按鈕
        protected void GridView5_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView5.EditIndex = -1;
            GridView5_GVgetData();
        }
        //點擊更新按鈕
        protected void GridView5_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String updateString = "UPDATE Daily_Labor SET DailyNumber=@DailyNumber, ValucationNY=@ValucationNY WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(updateString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters.Add("@DailyNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@ValucationNY", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView5.DataKeys[e.RowIndex].Value);
            cmd.Parameters["@DailyNumber"].Value = Convert.ToDecimal(((TextBox)GridView5.Rows[e.RowIndex].FindControl("T_DailyNumber")).Text);
            if (((CheckBox)GridView5.Rows[e.RowIndex].FindControl("C_ValucationNY")).Checked == true)
            {
                cmd.Parameters["@ValucationNY"].Value = 1;
            }
            else
            {
                cmd.Parameters["@ValucationNY"].Value = 0;
            }
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView5.EditIndex = -1;
            GridView5_getData();
        }
        //點擊刪除按鈕
        protected void GridView5_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String deleteString = "DELETE FROM Daily_Labor WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(deleteString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView5.DataKeys[e.RowIndex].Value);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView5_GVgetData();
            DropDownList25.Items.Clear();
            DropDownList25.DataBind();
        }

        protected void Btn_Note10_Click(object sender, EventArgs e)
        {
            if (DropDownList25.SelectedValue != "-請選擇-")
            {
                string ItemName = DAL.DailyMode.Insert_Labor_Check(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList1.SelectedValue));
                string unit = DAL.DailyMode.Insert_Labor_Check1(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList1.SelectedValue));
                decimal CAmount = DAL.DailyMode.Insert_Labor_Check2(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList1.SelectedValue));
                decimal EAmount = DAL.DailyMode.Insert_Labor_Check3(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList1.SelectedValue));
                bool aa = DAL.DailyMode.Insert_Equipment(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["DailyID"]), Convert.ToInt16(DropDownList1.SelectedValue), ItemName, unit, CAmount, EAmount);
            }
            GridView2_getData();
            DropDownList2.Items.Clear();
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.SelectCommand = "SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind= '機具') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Equipment WHERE DailyID=" + Session["DailyID"] + "))";
            DropDownList2.DataBind();
        }

        private void GridView2_getData()
        {
            if (Session["DailyID"].ToString() != "")
            {
                GridView2.Visible = true;
                DAL.Temp.j = 0;
                DAL.DailyMode.Daily_Equipment_Search2(Session["DatabaseName"].ToString(), "Daily_Equipment", "DailyID", Session["DailyID"].ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("UID");
                dt.Columns.Add("ItemName");
                dt.Columns.Add("Unit");
                dt.Columns.Add("CAmount");
                dt.Columns.Add("EAmount");
                dt.Columns.Add("Summation_DailyNumber");
                dt.Columns.Add("DailyNumber");
                dt.Columns.Add("ValucationNY");
                for (int j = 1; j < DAL.Temp.j; j++)
                {
                    DataRow row = dt.NewRow();
                    row["UID"] = DAL.Temp.count3[0, j];
                    row["ItemName"] = DAL.Temp.count3[1, j];
                    row["Unit"] = DAL.Temp.count3[2, j];
                    row["CAmount"] = DAL.Temp.count3[3, j];
                    row["EAmount"] = DAL.Temp.count3[4, j];
                    row["Summation_DailyNumber"] = DAL.Temp.count3[5, j];
                    row["DailyNumber"] = DAL.Temp.count3[6, j];
                    row["ValucationNY"] = DAL.Temp.count3[7, j];
                    dt.Rows.Add(row);
                }
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else
            {
                GridView2.Visible = false;
            }
        }
        //點擊編輯按鈕
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridView2_GVgetData();
        }
        private void GridView2_GVgetData()
        {
            GridView2_getData();
            GridView2.DataBind();
        }
        //點擊取消按鈕
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            GridView2_GVgetData();
        }
        //點擊更新按鈕
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String updateString = "UPDATE Daily_Equipment SET DailyNumber=@DailyNumber, ValucationNY=@ValucationNY WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(updateString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters.Add("@DailyNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@ValucationNY", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value);
            cmd.Parameters["@DailyNumber"].Value = Convert.ToDecimal(((TextBox)GridView2.Rows[e.RowIndex].FindControl("T_DailyNumber")).Text);
            if (((CheckBox)GridView2.Rows[e.RowIndex].FindControl("C_ValucationNY")).Checked == true)
            {
                cmd.Parameters["@ValucationNY"].Value = 1;
            }
            else
            {
                cmd.Parameters["@ValucationNY"].Value = 0;
            }
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView2.EditIndex = -1;
            GridView2_getData();
        }
        //點擊刪除按鈕
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String deleteString = "DELETE FROM Daily_Equipment WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(deleteString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView2_GVgetData();
            DropDownList1.Items.Clear();
            DropDownList1.DataBind();
        }

        protected void Btn_Note11_Click(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedValue != "-請選擇-")
            {
                string ItemName = DAL.DailyMode.Insert_Labor_Check(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList2.SelectedValue));
                string unit = DAL.DailyMode.Insert_Labor_Check1(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList2.SelectedValue));
                decimal CAmount = DAL.DailyMode.Insert_Labor_Check2(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList2.SelectedValue));
                decimal EAmount = DAL.DailyMode.Insert_Labor_Check3(Session["DatabaseName"].ToString(), Convert.ToInt16(DropDownList2.SelectedValue));
                bool aa = DAL.DailyMode.Insert_Material(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["DailyID"]), Convert.ToInt16(DropDownList2.SelectedValue), ItemName, unit, CAmount, EAmount);
            }
            GridView7_getData();
            DropDownList2.Items.Clear();
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.SelectCommand = "SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind= '材料') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Equipment WHERE DailyID=" + Session["DailyID"] + "))";
            DropDownList2.DataBind();
        }

        private void GridView7_getData()
        {
            if (Session["DailyID"].ToString() != "")
            {
                GridView7.Visible = true;
                DAL.Temp.j = 0;
                DAL.DailyMode.Daily_Material_Search(Session["DatabaseName"].ToString(), "Daily_Material", "DailyID", Session["DailyID"].ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("UID");
                dt.Columns.Add("ItemName");
                dt.Columns.Add("Unit");
                dt.Columns.Add("CAmount");
                dt.Columns.Add("EAmount");
                dt.Columns.Add("Summation_DailyInNumber");
                dt.Columns.Add("Summation_DailyOutNumber");
                dt.Columns.Add("DailyNumber");
                dt.Columns.Add("DailyInNumber");
                dt.Columns.Add("DailyOutNumber");
                dt.Columns.Add("ValucationNY");
                for (int j = 1; j < DAL.Temp.j; j++)
                {
                    DataRow row = dt.NewRow();
                    row["UID"] = DAL.Temp.count3[0, j];
                    row["ItemName"] = DAL.Temp.count3[1, j];
                    row["Unit"] = DAL.Temp.count3[2, j];
                    row["CAmount"] = DAL.Temp.count3[3, j];
                    row["EAmount"] = DAL.Temp.count3[4, j];
                    row["Summation_DailyInNumber"] = DAL.Temp.count3[5, j];
                    row["Summation_DailyOutNumber"] = DAL.Temp.count3[6, j];
                    row["DailyNumber"] = (Convert.ToDecimal(DAL.Temp.count3[5, j]) - Convert.ToDecimal(DAL.Temp.count3[6, j])).ToString();
                    row["DailyInNumber"] = DAL.Temp.count3[7, j];
                    row["DailyOutNumber"] = DAL.Temp.count3[8, j];
                    row["ValucationNY"] = DAL.Temp.count3[9, j];
                    dt.Rows.Add(row);
                }
                GridView7.DataSource = dt;
                GridView7.DataBind();
            }
            else
            {
                GridView7.Visible = false;
            }
        }
        //點擊編輯按鈕
        protected void GridView7_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView7.EditIndex = e.NewEditIndex;
            GridView7_GVgetData();
        }
        private void GridView7_GVgetData()
        {
            GridView7_getData();
            GridView7.DataBind();
        }
        //點擊取消按鈕
        protected void GridView7_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView7.EditIndex = -1;
            GridView7_GVgetData();
        }
        //點擊更新按鈕
        protected void GridView7_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String updateString = "UPDATE Daily_Material SET DailyInNumber=@DailyInNumber, DailyOutNumber=@DailyOutNumber, ValucationNY=@ValucationNY WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(updateString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters.Add("@DailyInNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@DailyOutNumber", SqlDbType.Decimal);
            cmd.Parameters.Add("@ValucationNY", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView7.DataKeys[e.RowIndex].Value);
            cmd.Parameters["@DailyInNumber"].Value = Convert.ToDecimal(((TextBox)GridView7.Rows[e.RowIndex].FindControl("T_DailyInNumber")).Text);
            cmd.Parameters["@DailyOutNumber"].Value = Convert.ToDecimal(((TextBox)GridView7.Rows[e.RowIndex].FindControl("T_DailyOutNumber")).Text);
            if (((CheckBox)GridView7.Rows[e.RowIndex].FindControl("C_ValucationNY")).Checked == true)
            {
                cmd.Parameters["@ValucationNY"].Value = 1;
            }
            else
            {
                cmd.Parameters["@ValucationNY"].Value = 0;
            }
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView7.EditIndex = -1;
            GridView7_getData();
        }
        //點擊刪除按鈕
        protected void GridView7_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string datasource = "140.118.5.148"; ;
            string database_userid = "CICIMS";
            string database_password = "ntustCIC419";
            string dbname = Session["DatabaseName"].ToString();
            string connStr = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            String deleteString = "DELETE FROM Daily_Material WHERE UID=@UID";
            SqlConnection cn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(deleteString, cn);
            cmd.Parameters.Add("@UID", SqlDbType.Int);
            cmd.Parameters["@UID"].Value = Convert.ToInt32(GridView7.DataKeys[e.RowIndex].Value);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView7_GVgetData();
            DropDownList2.Items.Clear();
            DropDownList2.DataBind();
        }

        protected void GridView7_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button55_Click(object sender, EventArgs e)
        {
            Button lbtn = (Button)sender;
            bool YY = DAL.DailyMode.Daily_TestReport_File_Check(Session["DatabaseName"].ToString(), Convert.ToInt32(lbtn.CommandArgument));
            //Response.Write("<script>  javaScriptMyCheck();  </script> ");
            //Button myBtn = FindControl("LinkButton1") as Button;
            //myBtn.Attributes.Add("onclick", "return confirm('您確定要刪除資料嗎？')");

            int temp = 0;
            for (int i = 0; i < 100; i++)
            {
                if (Convert.ToInt32(GridView4.DataKeys[i].Value) == Convert.ToInt32(lbtn.CommandArgument))
                {
                    temp = i;
                    break;
                }
            }
            FileUpload FU = (FileUpload)GridView4.Rows[temp].Cells[10].FindControl("FileUpload3");
            if (FU.HasFile)
            {
                String fileName = FU.FileName;
                String savePath = Server.MapPath("~/Uploads/");
                String saveResult = savePath + fileName;
                FU.SaveAs(saveResult);
                bool load_part1 = DAL.DailyMode.Up_TestReport(Session["DatabaseName"].ToString(), Convert.ToInt32(lbtn.CommandArgument), fileName);
                GridView4_GVgetData();
                if (load_part1)
                {
                    Response.Write("<script language=javascript>alert('檔案上傳成功！')</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('檔案上傳失敗！')</script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('請先挑選檔案之後，再來上傳')</script>");
            }
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Button lbtn = (Button)sender;
            string fileUrlPath = "Uploads/" + lbtn.CommandArgument;
            if (lbtn.CommandArgument != "")
            {
                System.Net.WebClient wc = new System.Net.WebClient(); //呼叫 webclient 方式做檔案下載
                byte[] xfile = null;
                string docupath = Request.PhysicalApplicationPath;
                xfile = wc.DownloadData(docupath + fileUrlPath);
                string xfileName = System.IO.Path.GetFileName(docupath + fileUrlPath);
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + HttpContext.Current.Server.UrlEncode(xfileName));
                HttpContext.Current.Response.ContentType = "application/octet-stream"; //二進位方式
                HttpContext.Current.Response.BinaryWrite(xfile); //內容轉出作檔案下載
                HttpContext.Current.Response.End();
            }
            else
            {
                Response.Write("<script language=javascript>alert('此試驗並無上傳報告！')</script>");
            }
        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

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
            Label3.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicTitle", DAL.Temp3.cc);
            Label5.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicLocation", DAL.Temp3.cc);
            Label6.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicType", DAL.Temp3.cc);
            Label7.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicPeriod", DAL.Temp3.cc);
            Label8.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "CWID", DAL.Temp3.cc);
            Label4.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicDate", DAL.Temp3.cc);
            Label9.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "SC_Code", DAL.Temp3.cc);
            Label10.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicNote", DAL.Temp3.cc);
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
            TextBox54.Text = Server.UrlDecode(cookie.Value);
        }

        protected void Button34_Click(object sender, EventArgs e)
        {
            // Insert data
            bool result = DAL.DailyMode.Report_Data_FirstInsert(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text));
            if (result)
            {
                Pnl_Yes.Visible = true;
                Pnl_No.Visible = false;
                EnabledTrue();
                Session["DailyID"] = DAL.DailyMode.Get_DailyID_By_ProjectID_ReportDate(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text));
                main_page_load();
            }
        }


    }
}
