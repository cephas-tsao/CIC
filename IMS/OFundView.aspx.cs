using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Net;

namespace IMS
{
    public partial class OFundView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            DisableTextBox(Pnl_2);
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
        }

        public static void DisableTextBox(Control control)
        {
            foreach (Control subControl in control.Controls)
            {
                if (subControl is TextBox)
                    (subControl as TextBox).Enabled = false;
                else if (subControl is CheckBox)
                    (subControl as CheckBox).Enabled = false;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Pnl_1.Visible = true;
        }
        public void OpenNewWindowA(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        public void OpenNewWindowB(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1000";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            OpenNewWindowA("OFundItemView.aspx", "A");
            Session["Edition"] = TextBox6.Text;
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundDebitView.aspx", "A");
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundIncreaseView.aspx", "A");
        }

        protected void ImageButton131_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 1;
            Save_Excel();
        }

        protected void Show_Date()
        {
            TextBox1.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OF_Code");
            TextBox6.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OF_Edition");
            TextBox2.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "StartDate");
            TextBox4.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "EndDate");
            TextBox3.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FundDate");
            TextBox5.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PayDate");
            TextBox32.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Note");

            Label1.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "OContrctPrice");
            Label2.Text = DAL.OFundMode.OFundView_Search3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "CEdition");
            Label3.Text = DAL.OFundMode.OFundView_Search3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "AdjestTotalPrice");
            Label4.Text = DAL.OFundMode.OFundView_Search2_5(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "PerformanceBond");
            Label5.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "PrepayPercentage") + "%";
            Label6.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "RetentionPercentage") + "%";

            Label7.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem1");
            Label8.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem2");
            Label9.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem3");
            Label10.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem4");
            Label11.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem5");
            Label12.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem6");
            Label13.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem7");
            Label14.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem8");
            Label15.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem9");
            Label16.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem10");
            Label17.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem11");
            Label18.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem12");
            Label19.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem13");
            Label20.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem14");

            TextBox8.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem1");
            TextBox20.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem2");
            TextBox21.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem3");
            TextBox33.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem4");
            TextBox7.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem5");
            TextBox34.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem6");
            TextBox35.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem7");
            TextBox24.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem8");
            TextBox25.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem9");
            TextBox26.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem10");
            TextBox27.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem11");
            TextBox28.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem12");
            TextBox29.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem13");
            TextBox30.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem14");

            TextBox37.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem1");
            TextBox38.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem2");
            TextBox39.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem3");
            TextBox40.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem4");
            TextBox41.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem5");
            TextBox42.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem6");
            TextBox43.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem7");
            TextBox44.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem8");
            TextBox45.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem9");
            TextBox46.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem10");
            TextBox47.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem11");
            TextBox48.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem12");
            TextBox49.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem13");
            TextBox50.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem14");

            if (Label7.Text == "" || Label7.Text == " ")
            {
                Label7.Text = "0.00";
            }
            if (Label8.Text == "" || Label8.Text == " ")
            {
                Label8.Text = "0.00";
            }
            if (Label9.Text == "" || Label9.Text == " ")
            {
                Label9.Text = "0.00";
            }
            if (Label10.Text == "" || Label10.Text == " ")
            {
                Label10.Text = "0.00";
            }
            if (Label11.Text == "" || Label11.Text == " ")
            {
                Label11.Text = "0.00";
            }
            if (Label12.Text == "" || Label12.Text == " ")
            {
                Label12.Text = "0.00";
            }
            if (Label13.Text == "" || Label13.Text == " ")
            {
                Label13.Text = "0.00";
            }
            if (Label14.Text == "" || Label14.Text == " ")
            {
                Label14.Text = "0.00";
            }
            if (Label15.Text == "" || Label15.Text == " ")
            {
                Label15.Text = "0.00";
            }
            if (Label16.Text == "" || Label16.Text == " ")
            {
                Label16.Text = "0.00";
            }
            if (Label17.Text == "" || Label17.Text == " ")
            {
                Label17.Text = "0.00";
            }
            if (Label18.Text == "" || Label18.Text == " ")
            {
                Label18.Text = "0.00";
            }
            if (Label19.Text == "" || Label19.Text == " ")
            {
                Label19.Text = "0.00";
            }
            if (Label20.Text == "" || Label20.Text == " ")
            {
                Label20.Text = "0.00";
            }
            if (TextBox37.Text == "" || TextBox37.Text == " ")
            {
                TextBox37.Text = "0.00";
            }
            if (TextBox38.Text == "" || TextBox38.Text == " ")
            {
                TextBox38.Text = "0.00";
            }
            if (TextBox39.Text == "" || TextBox39.Text == " ")
            {
                TextBox39.Text = "0.00";
            }
            if (TextBox40.Text == "" || TextBox40.Text == " ")
            {
                TextBox40.Text = "0.00";
            }
            if (TextBox41.Text == "" || TextBox41.Text == " ")
            {
                TextBox41.Text = "0.00";
            }
            if (TextBox42.Text == "" || TextBox42.Text == " ")
            {
                TextBox42.Text = "0.00";
            }
            if (TextBox43.Text == "" || TextBox43.Text == " ")
            {
                TextBox43.Text = "0.00";
            }
            if (TextBox44.Text == "" || TextBox44.Text == " ")
            {
                TextBox44.Text = "0.00";
            }
            if (TextBox45.Text == "" || TextBox45.Text == " ")
            {
                TextBox45.Text = "0.00";
            }
            if (TextBox46.Text == "" || TextBox46.Text == " ")
            {
                TextBox46.Text = "0.00";
            }
            if (TextBox47.Text == "" || TextBox47.Text == " ")
            {
                TextBox47.Text = "0.00";
            }
            if (TextBox48.Text == "" || TextBox48.Text == " ")
            {
                TextBox48.Text = "0.00";
            }
            if (TextBox49.Text == "" || TextBox49.Text == " ")
            {
                TextBox49.Text = "0.00";
            }
            if (TextBox50.Text == "" || TextBox50.Text == " ")
            {
                TextBox50.Text = "0.00";
            }
            Label21.Text = (Convert.ToDecimal(Label7.Text) + Convert.ToDecimal(TextBox37.Text)).ToString();
            Label22.Text = (Convert.ToDecimal(Label8.Text) + Convert.ToDecimal(TextBox38.Text)).ToString();
            Label23.Text = (Convert.ToDecimal(Label9.Text) + Convert.ToDecimal(TextBox39.Text)).ToString();
            Label24.Text = (Convert.ToDecimal(Label10.Text) + Convert.ToDecimal(TextBox40.Text)).ToString();
            Label25.Text = (Convert.ToDecimal(Label11.Text) + Convert.ToDecimal(TextBox41.Text)).ToString();
            Label26.Text = (Convert.ToDecimal(Label12.Text) + Convert.ToDecimal(TextBox42.Text)).ToString();
            Label27.Text = (Convert.ToDecimal(Label13.Text) + Convert.ToDecimal(TextBox43.Text)).ToString();
            Label28.Text = (Convert.ToDecimal(Label14.Text) + Convert.ToDecimal(TextBox44.Text)).ToString();
            Label29.Text = (Convert.ToDecimal(Label15.Text) + Convert.ToDecimal(TextBox45.Text)).ToString();
            Label30.Text = (Convert.ToDecimal(Label16.Text) + Convert.ToDecimal(TextBox46.Text)).ToString();
            Label31.Text = (Convert.ToDecimal(Label17.Text) + Convert.ToDecimal(TextBox47.Text)).ToString();
            Label32.Text = (Convert.ToDecimal(Label18.Text) + Convert.ToDecimal(TextBox48.Text)).ToString();
            Label33.Text = (Convert.ToDecimal(Label19.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();
            Label34.Text = (Convert.ToDecimal(Label20.Text) + Convert.ToDecimal(TextBox50.Text)).ToString();
        }

        protected void ImageButton132_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 2;
            Save_Excel();
        }

        void Save_Excel()
        {
            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;

            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            wBook = excelApp.Workbooks.Open(Server.MapPath("Uploads/請款單樣板.xls"));
            wBook.Activate();
            try
            {
                wSheet = (Excel._Worksheet)wBook.Worksheets["格式"];
                excelApp.Cells[3, 3] = DAL.DailyMode.PID_Name_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
                excelApp.Cells[3, 10] = Session["PID"].ToString();
                excelApp.Cells[3, 17] = TextBox1.Text;
                excelApp.Cells[4, 3] = Label3.Text;
                excelApp.Cells[4, 10] = TextBox2.Text + "~" + TextBox4.Text;
                excelApp.Cells[4, 17] = TextBox6.Text;

                //for (int j = 1; j < DAL.Temp.j; j++)
                //{
                //    excelApp.Cells[8, 1] = j.ToString();
                //    excelApp.Cells[8, 2] = DAL.Temp.count3[1, j];
                //    excelApp.Cells[8, 6] = DAL.Temp.count3[3, j];
                //    excelApp.Cells[8, 8] = DAL.Temp.count3[4, j];
                //    excelApp.Cells[8, 10] = DAL.Temp.count3[8, j];
                //    excelApp.Cells[8, 11] = DAL.Temp.count3[9, j];
                //    if (DAL.Temp.count3[6, j] == null || DAL.Temp.count3[6, j] == " ")
                //    {
                //        DAL.Temp.count3[6, j] = "0";
                //    }
                //    if (DAL.Temp.count3[7, j] == null || DAL.Temp.count3[7, j] == " ")
                //    {
                //        DAL.Temp.count3[7, j] = "0";
                //    }
                //    if (DAL.Temp.count3[8, j] == null || DAL.Temp.count3[8, j] == " ")
                //    {
                //        DAL.Temp.count3[8, j] = "0";
                //    }
                //    if (DAL.Temp.count3[9, j] == null || DAL.Temp.count3[9, j] == " ")
                //    {
                //        DAL.Temp.count3[9, j] = "0";
                //    }
                //    excelApp.Cells[8, 12] = (Convert.ToDecimal(DAL.Temp.count3[6, j]) + Convert.ToDecimal(DAL.Temp.count3[8, j])).ToString();
                //    excelApp.Cells[8, 13] = (Convert.ToDecimal(DAL.Temp.count3[7, j]) + Convert.ToDecimal(DAL.Temp.count3[9, j])).ToString();
                //    excelApp.Cells[8, 15] = DAL.Temp.count3[10, j];
                //}

                excelApp.Cells[33, 3] = Label7.Text;
                excelApp.Cells[33, 4] = Label8.Text;
                excelApp.Cells[33, 5] = Label9.Text;
                excelApp.Cells[33, 7] = Label10.Text;
                excelApp.Cells[33, 9] = Label11.Text;
                excelApp.Cells[33, 10] = Label12.Text;
                excelApp.Cells[33, 11] = Label13.Text;
                excelApp.Cells[33, 12] = Label14.Text;
                excelApp.Cells[33, 13] = Label15.Text;
                excelApp.Cells[33, 14] = Label16.Text;
                excelApp.Cells[33, 15] = Label17.Text;
                excelApp.Cells[33, 16] = Label18.Text;
                excelApp.Cells[33, 17] = Label19.Text;
                excelApp.Cells[33, 18] = Label20.Text;

                excelApp.Cells[34, 3] = TextBox37.Text;
                excelApp.Cells[34, 4] = TextBox38.Text;
                excelApp.Cells[34, 5] = TextBox39.Text;
                excelApp.Cells[34, 7] = TextBox40.Text;
                excelApp.Cells[34, 9] = TextBox41.Text;
                excelApp.Cells[34, 10] = TextBox42.Text;
                excelApp.Cells[34, 11] = TextBox43.Text;
                excelApp.Cells[34, 12] = TextBox44.Text;
                excelApp.Cells[34, 13] = TextBox45.Text;
                excelApp.Cells[34, 14] = TextBox46.Text;
                excelApp.Cells[34, 15] = TextBox47.Text;
                excelApp.Cells[34, 16] = TextBox48.Text;
                excelApp.Cells[34, 17] = TextBox49.Text;
                excelApp.Cells[34, 18] = TextBox50.Text;

                excelApp.Cells[35, 3] = Label21.Text;
                excelApp.Cells[35, 4] = Label22.Text;
                excelApp.Cells[35, 5] = Label23.Text;
                excelApp.Cells[35, 7] = Label24.Text;
                excelApp.Cells[35, 9] = Label25.Text;
                excelApp.Cells[35, 10] = Label26.Text;
                excelApp.Cells[35, 11] = Label27.Text;
                excelApp.Cells[35, 12] = Label28.Text;
                excelApp.Cells[35, 13] = Label29.Text;
                excelApp.Cells[35, 14] = Label30.Text;
                excelApp.Cells[35, 15] = Label31.Text;
                excelApp.Cells[35, 16] = Label32.Text;
                excelApp.Cells[35, 17] = Label33.Text;
                excelApp.Cells[35, 18] = Label34.Text;

                DAL.OFundMode.OFund_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "D");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    excelApp.Cells[39 + i - 1, 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[39 + i - 1, 7] = DAL.Temp2.count[1, i];
                    excelApp.Cells[39 + i - 1, 10] = DAL.Temp2.count[2, i];
                    excelApp.Cells[39 + i - 1, 12] = DAL.Temp2.count[3, i];
                    excelApp.Cells[39 + i - 1, 14] = DAL.Temp2.count[4, i];
                    excelApp.Cells[39 + i - 1, 16] = DAL.Temp2.count[5, i];
                    excelApp.Cells[39 + i - 1, 17] = DAL.Temp2.count[6, i];
                }

                DAL.OFundMode.OFund_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "I");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    excelApp.Cells[52 + i - 1, 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[52 + i - 1, 7] = DAL.Temp2.count[1, i];
                    excelApp.Cells[52 + i - 1, 10] = DAL.Temp2.count[2, i];
                    excelApp.Cells[52 + i - 1, 12] = DAL.Temp2.count[3, i];
                    excelApp.Cells[52 + i - 1, 14] = DAL.Temp2.count[4, i];
                    excelApp.Cells[52 + i - 1, 16] = DAL.Temp2.count[5, i];
                    excelApp.Cells[52 + i - 1, 17] = DAL.Temp2.count[6, i];
                }

                if (DAL.Temp2.Check_Button_Type == 1)
                {
                }
                else if (DAL.Temp2.Check_Button_Type == 2)
                {
                    string pathFile = Server.MapPath("Uploads/Output.xls");
                    try
                    {
                        wBook.SaveAs(pathFile, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Excel.XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                        Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                        wBook.Close(false, Type.Missing, Type.Missing);
                        excelApp.Quit();
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(excelApp);
                        Excel2Pdf(Server.MapPath("Uploads/Output.xls"), Server.MapPath("Uploads/Output.pdf"));
                        WebClient myWebClient = new WebClient();
                        Response.ContentType = "pdf";
                        Response.AppendHeader("Content-Disposition", "Attachment; FileName=Output.pdf");
                        Response.TransmitFile(Server.MapPath("Uploads/Output.pdf"));
                        Response.End();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script language=javascript>alert('儲存檔案出錯，檔案可能正在使用！')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("產生報表時出錯！" + Environment.NewLine + ex.Message);
            }
        }

        public static bool Excel2Pdf(string source, string target)
        {
            try
            {
                var ExcelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook book = ExcelApp.Workbooks.Open(source);
                Microsoft.Office.Interop.Excel.XlFileFormat xlFormatPDF = (Microsoft.Office.Interop.Excel.XlFileFormat)57;
                book.SaveAs(target, xlFormatPDF);
                ExcelApp.Visible = false;
                ExcelApp.Quit();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return false;
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
            Pnl_2.Visible = true;
            DAL.Temp3.cc = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);
            Session["OFID"] = DAL.Temp3.cc;
            Show_Date();
        }
    }
}