using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;
using Excel = Microsoft.Office.Interop.Excel;
using System.Drawing;

namespace IMS
{
    public partial class DailyTestView1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
        }

        protected void Button34_Click(object sender, EventArgs e)
        {
            Pnl_Result.Visible = true;
            string Search_Condition1 = "";
            string Search_Condition2 = "";
            string Determine_Condition1 = "";
            string Determine_Condition2 = "";
            DAL.Temp.Condition1 = "";
            DAL.Temp.Condition2 = "";
            DateTime dtDate;
            if (!(TextBox1.Text == "") || !(TextBox2.Text == ""))
            {
                if ((DateTime.TryParse(TextBox1.Text, out dtDate)) && (DateTime.TryParse(TextBox2.Text, out dtDate)))
                {
                    DateTime dt1 = Convert.ToDateTime(TextBox1.Text);
                    DateTime dt2 = Convert.ToDateTime(TextBox2.Text);
                    if (DateTime.Compare(dt1, dt2) < 0)
                    {
                        Search_Condition1 += "(Daily_Main.Date BETWEEN '" + TextBox1.Text + "' AND '" + TextBox2.Text + "') AND (Daily_Main.DailyID=Daily_TestSampling.DailyID)";
                        Determine_Condition1 = DDL_Op2.SelectedValue;
                    }
                    else
                    {
                        Response.Write("<script>alert('取樣時間範圍有問題！');</script>");
                    }
                }
                else
                {
                    Pnl_Result.Visible = false;
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (!(TextBox12.Text == "") || !(TextBox13.Text == ""))
            {
                if ((DateTime.TryParse(TextBox12.Text, out dtDate)) && (DateTime.TryParse(TextBox13.Text, out dtDate)))
                {
                    DateTime dt1 = Convert.ToDateTime(TextBox12.Text);
                    DateTime dt2 = Convert.ToDateTime(TextBox13.Text);
                    if (DateTime.Compare(dt1, dt2) < 0)
                    {
                        Search_Condition2 += " " + Determine_Condition2 + " (Daily_TestReport.RealReportDate BETWEEN '" + TextBox12.Text + "' AND '" + TextBox13.Text + "')";
                        Determine_Condition2 = DDL_Op3.SelectedValue;
                    }
                    else
                    {
                        Response.Write("<script>alert('取報告日期範圍有問題！');</script>");
                    }
                }
                else
                {
                    Pnl_Result.Visible = false;
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (!(TextBox4.Text == ""))
            {
                if (Determine_Condition1 == "NOT")
                {
                    if (!(Search_Condition1 == ""))
                    {
                        Search_Condition1 += " Daily_TestSampling.ItemName NOT LIKE";
                    }
                    else
                    {
                        Search_Condition1 += " AND Daily_TestSampling.ItemName NOT LIKE";
                    }
                }
                else
                {
                    Search_Condition1 += " " + Determine_Condition1 + " Daily_TestSampling.ItemName LIKE";
                }
                string kk = " '%" + TextBox4.Text + "%'";
                Search_Condition1 += kk;
                Determine_Condition1 = DDL_Op5.SelectedValue;
            }
            if (!(DropDownList12.SelectedValue == "0"))
            {
                Search_Condition1 += " " + Determine_Condition1 + " Daily_TestSampling.TestType='" + DropDownList12.SelectedValue + "'";
                Determine_Condition1 = DDL_Op7.SelectedValue;
            }
            if (!(TextBox10.Text == ""))
            {
                if (Determine_Condition1 == "NOT")
                {
                    if (!(Search_Condition1 == ""))
                    {
                        Search_Condition1 += " Daily_TestSampling.FirmName NOT LIKE";
                    }
                    else
                    {
                        Search_Condition1 += " AND Daily_TestSampling.FirmName NOT LIKE";
                    }
                }
                else
                {
                    Search_Condition1 += " " + Determine_Condition1 + " Daily_TestSampling.FirmName LIKE";
                }
                string kk = " '%" + TextBox10.Text + "%'";
                Search_Condition1 += kk;
                Determine_Condition1 = DDL_Op8.SelectedValue;
            }
            if (!(TextBox11.Text == ""))
            {
                if (Determine_Condition1 == "NOT")
                {
                    if (!(Search_Condition1 == ""))
                    {
                        Search_Condition1 += " Daily_TestSampling.LabName NOT LIKE";
                    }
                    else
                    {
                        Search_Condition2 += " AND Daily_TestSampling.LabName NOT LIKE";
                    }
                }
                else
                {
                    Search_Condition1 += " " + Determine_Condition1 + " Daily_TestSampling.LabName LIKE";
                }
                string kk = " '%" + TextBox11.Text + "%'";
                Search_Condition1 += kk;
                Determine_Condition1 = DDL_Op9.SelectedValue;
            }
            if (!(RadioButtonList1.SelectedValue == ""))
            {
                if (RadioButtonList1.SelectedValue == "是")
                {
                    Search_Condition2 += " " + Determine_Condition2 + " (NOT (Daily_TestReport.TestReportPath IS NULL))";
                    Determine_Condition2 = DDL_Op10.SelectedValue;
                }
                else if (RadioButtonList1.SelectedValue == "否")
                {
                    Search_Condition2 += " " + Determine_Condition2 + " Daily_TestReport.TestReportPath IS NULL";
                    Determine_Condition2 = DDL_Op10.SelectedValue;
                }
            }
            if (!(RadioButtonList2.SelectedValue == ""))
            {
                if (RadioButtonList2.SelectedValue == "是")
                {
                    Search_Condition2 += " " + Determine_Condition2 + " Daily_TestReport.RegularNumber=Daily_TestSampling.PNumber";
                    Determine_Condition2 = DDL_Op10.SelectedValue;
                }
                else if (RadioButtonList2.SelectedValue == "否")
                {
                    Search_Condition2 += " " + Determine_Condition2 + " (NOT (Daily_TestReport.RegularNumber=Daily_TestSampling.PNumber))";
                    Determine_Condition2 = DDL_Op10.SelectedValue;
                }
            }
            if (!(Search_Condition1 == "") || !(Search_Condition2 == ""))
            {
                DAL.Temp.Condition1 = Search_Condition1;
                DAL.Temp.Condition2 = Search_Condition2;
                GridView1_getData();
            }
            Pnl_Detail.Visible = false;
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

        protected void Button35_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox10.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox11.Text = "";
            DropDownList12.SelectedIndex = 0;
        }

        protected void Button37_Click(object sender, EventArgs e)
        {
            Pnl_Result.Visible = true;
            GridView1.Visible = true;
            DAL.Temp.Condition1 = "";
            DAL.Temp.Condition2 = "";
            DAL.Temp.Search_Condition = "";
            GridView1_getData();
        }

        private void GridView1_getData()
        {
            DAL.Temp.j = 0;
            DAL.DailyMode.DailyTestView_Search(Session["DatabaseName"].ToString(), DAL.Temp.Condition1, DAL.Temp.Condition2);
            DataTable dt = new DataTable();
            dt.Columns.Add("Daily_SampleID");
            dt.Columns.Add("ItemName");
            dt.Columns.Add("TestType");
            dt.Columns.Add("Location");
            dt.Columns.Add("SNumber");
            dt.Columns.Add("RegularNumber");
            dt.Columns.Add("LabName");
            for (int j = 1; j < DAL.Temp.j; j++)
            {
                DataRow row = dt.NewRow();
                row["Daily_SampleID"] = DAL.Temp.count3[0, j];
                row["ItemName"] = DAL.Temp.count3[1, j];
                row["TestType"] = DAL.Temp.count3[2, j];
                row["Location"] = DAL.Temp.count3[3, j];
                row["SNumber"] = DAL.Temp.count3[4, j];
                row["RegularNumber"] = DAL.Temp.count3[5, j];
                row["LabName"] = DAL.Temp.count3[6, j];
                dt.Rows.Add(row);
            }
            GridView1.DataSource = dt;
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

            Pnl_Detail.Visible = true;
            bool GG = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            Label1.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ItemName");
            Label2.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Unit");
            Label3.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SNumber");
            Label4.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Pnumber");
            Label5.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Standard");
            Label6.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Notes");
            Label7.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Location");
            Label8.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SamplingMan");
            Label9.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "MaterailInDate");
            Label10.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "BookReportDate");
            Label11.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TestType");
            Label12.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FirmName");
            Label13.Text = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "LabName");
            Label14.Text = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            Label20.Text = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            Button1.Visible = true;
            if (GG == false)
            {
                Panel2.Visible = false;
            }
            else
            {
                Label15.Text = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                Label16.Text = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RealReportDate");
                Label17.Text = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TestMan");
                Label18.Text = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RegularNumber");
                Label19.Text = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "LabName");
                DAL.Temp.Type_File = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TestReportPath");
                if (DAL.Temp.Type_File == null || DAL.Temp.Type_File == "" || DAL.Temp.Type_File == " ")
                {
                    Button1.Visible = false;
                }
                Panel2.Visible = true;
            }
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            string TestReportPath;
            if (DAL.Temp.Type_File == null || DAL.Temp.Type_File == "" || DAL.Temp.Type_File == " ")
            {
                TestReportPath = "0";
            }
            else
            {
                TestReportPath = DAL.Temp.Type_File;
            }
            string fileUrlPath = "Uploads/" + DAL.Temp.Type_File;
            if (TestReportPath != "0")
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

        protected void ImageButton133_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Save_Excel();
        }

        void Save_Excel()
        {
            DAL.Temp.Condition1 = "";
            DAL.Temp.Condition2 = "";
            GridView1_getData();

            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;
            Excel.Range wRange;
            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            excelApp.Workbooks.Add(Type.Missing);
            wBook = excelApp.Workbooks[1];
            wSheet = (Excel._Worksheet)wBook.Worksheets[1];
            wSheet.Name = "施工檢驗資訊";
            wSheet.Activate();

            try
            {
                for (int i = 1; i < DAL.Temp.j; i++)
                {
                    DAL.Temp3.cc = Convert.ToInt32(DAL.Temp.count3[0, i]);

                    wRange = wSheet.Range[wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 4]];
                    wRange.Select();
                    wRange.Merge(0);
                    excelApp.Cells[1, (i - 1) * 4 + (i - 1) + 1] = "施工檢驗取樣資訊";
                    wRange.Font.Color = ColorTranslator.ToOle(Color.White);
                    wRange.Interior.Color = ColorTranslator.ToOle(Color.Black);
                    wRange.Font.Size = 12;
                    wRange.Font.Name = "微軟正黑體";
                    wRange.Font.Bold = true;
                    wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                    wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                    wRange.Borders.Color = ColorTranslator.ToOle(Color.Black);
                    wRange.Borders.LineStyle = 1;
                    wRange.Borders.Weight = 2;

                    wRange = wSheet.Range[wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 1]];
                    wRange.ColumnWidth = 15;
                    wRange = wSheet.Range[wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 2], wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 2]];
                    wRange.ColumnWidth = 30;
                    wRange = wSheet.Range[wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 3], wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 3]];
                    wRange.ColumnWidth = 15;
                    wRange = wSheet.Range[wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 4], wSheet.Cells[1, (i - 1) * 4 + (i - 1) + 4]];
                    wRange.ColumnWidth = 30;
                    excelApp.Cells[2, (i - 1) * 4 + (i - 1) + 1] = "登載日報日期";
                    excelApp.Cells[3, (i - 1) * 4 + (i - 1) + 1] = "項目名稱";
                    excelApp.Cells[4, (i - 1) * 4 + (i - 1) + 1] = "取樣數量";
                    excelApp.Cells[5, (i - 1) * 4 + (i - 1) + 1] = "材料進場日期";
                    excelApp.Cells[6, (i - 1) * 4 + (i - 1) + 1] = "檢驗標準";
                    excelApp.Cells[7, (i - 1) * 4 + (i - 1) + 1] = "代表數量";
                    excelApp.Cells[8, (i - 1) * 4 + (i - 1) + 1] = "預定取報告日期";
                    excelApp.Cells[2, (i - 1) * 4 + (i - 1) + 3] = "單位";
                    excelApp.Cells[3, (i - 1) * 4 + (i - 1) + 3] = "取樣日期";
                    excelApp.Cells[4, (i - 1) * 4 + (i - 1) + 3] = "分包(供料)廠商";
                    excelApp.Cells[5, (i - 1) * 4 + (i - 1) + 3] = "取樣人員";
                    excelApp.Cells[6, (i - 1) * 4 + (i - 1) + 3] = "取樣地點";
                    excelApp.Cells[7, (i - 1) * 4 + (i - 1) + 3] = "試驗類別";
                    excelApp.Cells[8, (i - 1) * 4 + (i - 1) + 3] = "檢驗單位/實驗室";
                    excelApp.Cells[9, (i - 1) * 4 + (i - 1) + 1] = "備註";
                    wRange = wSheet.Range[wSheet.Cells[9, (i - 1) * 4 + (i - 1) + 2], wSheet.Cells[9, (i - 1) * 4 + (i - 1) + 4]];
                    wRange.Merge(0);

                    bool GG = DAL.DailyMode.Report_Data_Check(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                    excelApp.Cells[3, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ItemName");
                    excelApp.Cells[2, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Unit");
                    excelApp.Cells[4, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SNumber");
                    excelApp.Cells[7, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Pnumber");
                    excelApp.Cells[6, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Standard");
                    excelApp.Cells[9, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Notes");
                    excelApp.Cells[6, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Location");
                    excelApp.Cells[5, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SamplingMan");
                    excelApp.Cells[5, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "MaterailInDate");
                    excelApp.Cells[8, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "BookReportDate");
                    excelApp.Cells[7, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TestType");
                    excelApp.Cells[4, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FirmName");
                    excelApp.Cells[8, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "LabName");
                    excelApp.Cells[2, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                    excelApp.Cells[3, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);

                    wRange = wSheet.Range[wSheet.Cells[2, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[8, (i - 1) * 4 + (i - 1) + 1]];
                    wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                    wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                    wRange.WrapText = true;
                    wRange = wSheet.Range[wSheet.Cells[9, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[9, (i - 1) * 4 + (i - 1) + 1]];
                    wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                    wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                    wRange.WrapText = true;
                    wRange = wSheet.Range[wSheet.Cells[2, (i - 1) * 4 + (i - 1) + 3], wSheet.Cells[8, (i - 1) * 4 + (i - 1) + 3]];
                    wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                    wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                    wRange.WrapText = true;
                    wRange = wSheet.Range[wSheet.Cells[2, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[9, (i - 1) * 4 + (i - 1) + 4]];
                    wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                    wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                    wRange.Borders.LineStyle = 1;
                    wRange.Borders.Weight = 2;
                    wRange.Font.Size = 10;
                    wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                    wRange.Font.Name = "微軟正黑體";

                    if (GG == false)
                    {

                    }
                    else
                    {
                        wRange = wSheet.Range[wSheet.Cells[10, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[10, (i - 1) * 4 + (i - 1) + 4]];
                        wRange.Select();
                        wRange.Merge(0);
                        excelApp.Cells[10, (i - 1) * 4 + (i - 1) + 1] = "檢試驗報告紀錄資訊";
                        wRange.Font.Color = ColorTranslator.ToOle(Color.White);
                        wRange.Interior.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Font.Size = 12;
                        wRange.Font.Name = "微軟正黑體";
                        wRange.Font.Bold = true;
                        wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                        wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                        wRange.Borders.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Borders.LineStyle = 1;
                        wRange.Borders.Weight = 2;

                        excelApp.Cells[11, (i - 1) * 4 + (i - 1) + 1] = "登載日報日期";
                        excelApp.Cells[12, (i - 1) * 4 + (i - 1) + 1] = "實際取報告日期";
                        excelApp.Cells[13, (i - 1) * 4 + (i - 1) + 1] = "合格數量";
                        excelApp.Cells[11, (i - 1) * 4 + (i - 1) + 3] = "檢驗單位/實驗室";
                        excelApp.Cells[12, (i - 1) * 4 + (i - 1) + 3] = "會驗人員";

                        excelApp.Cells[11, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                        excelApp.Cells[12, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RealReportDate");
                        excelApp.Cells[12, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TestMan");
                        excelApp.Cells[13, (i - 1) * 4 + (i - 1) + 2] = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RegularNumber");
                        excelApp.Cells[11, (i - 1) * 4 + (i - 1) + 4] = DAL.DailyMode.Report_Data_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "LabName");

                        wRange = wSheet.Range[wSheet.Cells[11, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[13, (i - 1) * 4 + (i - 1) + 1]];
                        wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                        wRange.WrapText = true;
                        wRange = wSheet.Range[wSheet.Cells[11, (i - 1) * 4 + (i - 1) + 3], wSheet.Cells[12, (i - 1) * 4 + (i - 1) + 3]];
                        wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                        wRange.WrapText = true;

                        wRange = wSheet.Range[wSheet.Cells[11, (i - 1) * 4 + (i - 1) + 1], wSheet.Cells[13, (i - 1) * 4 + (i - 1) + 4]];
                        wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                        wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                        wRange.Borders.LineStyle = 1;
                        wRange.Borders.Weight = 2;
                        wRange.Font.Size = 10;
                        wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                        wRange.Font.Name = "微軟正黑體";
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("產生報表時出錯！" + Environment.NewLine + ex.Message);
            }
        }
    }
}