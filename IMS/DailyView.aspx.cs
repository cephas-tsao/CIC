using System;
using System.Data;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class DailyView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["DailyID"] = "";
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView2.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView3.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView4.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView5.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView6.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView7.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                TB_Date.Text = DateTime.Now.ToString("yyyy/MM/dd");
                DAL.Temp.cc = -1;
            }
            DateTime dtDate;
            if (DateTime.TryParse(TB_Date.Text, out dtDate))
            {
                if (DAL.DailyMode.Report_Date_Check(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text)))
                {
                    Pnl_No.Visible = true;
                    Pnl_Yes.Visible = true;
                    Panel7.Visible = true;
                    Panel4.Visible = true;
                    EnabledTrue();
                    Session["DailyID"] = DAL.DailyMode.Get_DailyID_By_ProjectID_ReportDate(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text));
                    Panel4.Enabled = true;
                }
                else
                {
                    Panel4.Visible = false;
                    Panel7.Visible = false;
                    Pnl_No.Visible = true;
                    Pnl_Yes.Visible = false;
                    EnabledFalse();
                }
            }
            else
            {
                Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            TB_Note1.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note2.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note3.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note4.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note5.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note6.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note7.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note8.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note9.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
            TB_Note10.Text = DAL.DailyMode.DataBase_Search2(Session["DatabaseName"].ToString(), "RecordContent", "Daily_Record", "DailyID", Session["DailyID"].ToString(), "RecordType", DropDownList5.SelectedValue);
        }
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
                if (DAL.DailyMode.Report_Date_Check(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), DateTime.Parse(TB_Date.Text)))
                {
                    Panel7.Visible = true;
                    Pnl_Yes.Visible = false;
                    EnabledFalse();
                    Pnl_No.Visible = false;
                    Label7.Visible = false;
                    Panel4.Visible = true;
                    Daily_Main_Data_Search();
                }
                else
                {
                    Panel4.Visible = false;
                    Panel7.Visible = false;
                    Pnl_No.Visible = true;
                    Pnl_Yes.Visible = false;
                    Pnl_Pic.Visible = false;
                    Label7.Visible = true;
                    EnabledFalse();
                }
                GridView4.DataBind();    
                GridView5_getData();
                GridView6_getData();
                GridView7_getData();
            }
            else
            {
                Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
            }
        }
        protected void Daily_Main_Data_Search()
        {
            Label1.Text = DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "WeatherAM", "Daily_Main", "DailyID", Session["DailyID"].ToString(), "1", "3");
            Label2.Text = DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "WeatherPM", "Daily_Main", "DailyID", Session["DailyID"].ToString(), "1", "3");
            if (DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "DurationAM", "Daily_Main", "DailyID", Session["DailyID"].ToString(), "1", "4") == "0")
            {
                Label3.Text = "否";
            }
            else
            {
                Label3.Text = "是";
            }
            if (DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "DurationPM", "Daily_Main", "DailyID", Session["DailyID"].ToString(),  "1", "4") == "0")
            {
                Label4.Text = "否";
            }
            else
            {
                Label4.Text = "是";
            }
            Label5.Text = DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "BookProgress", "Daily_Main", "DailyID", Session["DailyID"].ToString(), "1", "2");
            Label6.Text = DAL.DailyMode.DataBase_Search(Session["DatabaseName"].ToString(), "RealProgress", "Daily_Main", "DailyID", Session["DailyID"].ToString(), "1", "2");
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
        private void GridView6_getData()
        {
            if (Session["DailyID"].ToString() != "")
            {
                GridView6.Visible = true;
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
                GridView6.DataSource = dt;
                GridView6.DataBind();
            }
            else
            {
                GridView6.Visible = false;
            }
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
            Label8.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicTitle", DAL.Temp3.cc);
            Label10.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicLocation", DAL.Temp3.cc);
            Label11.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicType", DAL.Temp3.cc);
            Label12.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicPeriod", DAL.Temp3.cc);
            Label13.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "CWID", DAL.Temp3.cc);
            Label9.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicDate", DAL.Temp3.cc);
            Label14.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "SC_Code", DAL.Temp3.cc);
            Label15.Text = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), "PicNote", DAL.Temp3.cc);
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
    }
}