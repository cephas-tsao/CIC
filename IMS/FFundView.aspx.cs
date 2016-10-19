using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Net;

namespace IMS
{
    public partial class FFundView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pnl_1.Visible = true;
            Session["SCID"] = DropDownList1.SelectedValue;
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = "Select * From FFund_Main Where SCID = " + Session["SCID"] + " and PID = " + Session["PID"];
            GridView1.DataBind();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Pnl_2.Visible = true;
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            OpenNewWindowA("FFundItemView.aspx", "A");
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
        protected void Button10_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("FFundDebitView.aspx", "A");
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("FFundIncreaseView.aspx", "A");
        }
        protected void ImageButton131_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 1;
            Save_Excel();
        }

        void Save_Excel()
        {
            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;
            Excel.Range wRange;

            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            wBook = excelApp.Workbooks.Open(Server.MapPath("Uploads/計價單樣板.xls"));
            wBook.Activate();
            try
            {
                wSheet = (Excel._Worksheet)wBook.Worksheets["格式"];
                excelApp.Cells[3, 3] = DAL.DailyMode.PID_Name_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
                excelApp.Cells[4, 3] = DAL.FirmFundMode.FFundView_Search50(Session["DatabaseName"].ToString(), Convert.ToInt32(DropDownList1.SelectedValue), "SC_Name");
                excelApp.Cells[4, 10] = DAL.FirmFundMode.FFundView_Search50(Session["DatabaseName"].ToString(), Convert.ToInt32(DropDownList1.SelectedValue), "TotalPrice");
                string kk = DAL.FirmFundMode.FFundView_Search50(Session["DatabaseName"].ToString(), Convert.ToInt32(DropDownList1.SelectedValue), "FirmID");
                excelApp.Cells[5, 3] = DAL.FirmFundMode.FFundView_Search51(Session["DatabaseName"].ToString(), Convert.ToInt32(kk));
                excelApp.Cells[3, 10] = Session["PID"].ToString();
                excelApp.Cells[3, 15] = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FF_Code");
                excelApp.Cells[4, 10] = DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "LastTotalPrice");
                excelApp.Cells[4, 15] = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FF_Edition");
                excelApp.Cells[5, 10] = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "StartDate") + "~" + DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "EndDate");

                DAL.Temp.j = 0;
                DAL.FirmFundMode.FFundItem_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]));
                for (int j = 1; j < DAL.Temp.j; j++)
                {
                    excelApp.Cells[8, 1] = j.ToString();
                    excelApp.Cells[8, 2] = DAL.Temp.count3[1, j];
                    excelApp.Cells[8, 6] = DAL.Temp.count3[3, j];
                    excelApp.Cells[8, 8] = DAL.Temp.count3[4, j];
                    excelApp.Cells[8, 10] = DAL.Temp.count3[8, j];
                    excelApp.Cells[8, 11] = DAL.Temp.count3[9, j];
                    if (DAL.Temp.count3[6, j] == null || DAL.Temp.count3[6, j] == " ")
                    {
                        DAL.Temp.count3[6, j] = "0";
                    }
                    if (DAL.Temp.count3[7, j] == null || DAL.Temp.count3[7, j] == " ")
                    {
                        DAL.Temp.count3[7, j] = "0";
                    }
                    if (DAL.Temp.count3[8, j] == null || DAL.Temp.count3[8, j] == " ")
                    {
                        DAL.Temp.count3[8, j] = "0";
                    }
                    if (DAL.Temp.count3[9, j] == null || DAL.Temp.count3[9, j] == " ")
                    {
                        DAL.Temp.count3[9, j] = "0";
                    }
                    excelApp.Cells[8, 12] = (Convert.ToDecimal(DAL.Temp.count3[6, j]) + Convert.ToDecimal(DAL.Temp.count3[8, j])).ToString();
                    excelApp.Cells[8, 13] = (Convert.ToDecimal(DAL.Temp.count3[7, j]) + Convert.ToDecimal(DAL.Temp.count3[9, j])).ToString();
                    excelApp.Cells[8, 15] = DAL.Temp.count3[10, j];
                }

                excelApp.Cells[34, 3] = Label7.Text;
                excelApp.Cells[34, 4] = Label8.Text;
                excelApp.Cells[34, 5] = Label9.Text;
                excelApp.Cells[34, 7] = Label10.Text;
                excelApp.Cells[34, 9] = Label11.Text;
                excelApp.Cells[34, 10] = Label12.Text;
                excelApp.Cells[34, 11] = Label13.Text;
                excelApp.Cells[34, 12] = Label14.Text;
                excelApp.Cells[34, 13] = Label15.Text;
                excelApp.Cells[34, 14] = Label16.Text;
                excelApp.Cells[34, 15] = Label17.Text;
                excelApp.Cells[34, 16] = Label18.Text;
                excelApp.Cells[35, 3] = TextBox8.Text;
                excelApp.Cells[35, 4] = TextBox20.Text;
                excelApp.Cells[35, 5] = TextBox21.Text;
                excelApp.Cells[35, 7] = TextBox22.Text;
                excelApp.Cells[35, 9] = TextBox23.Text;
                excelApp.Cells[35, 10] = TextBox24.Text;
                excelApp.Cells[35, 11] = TextBox25.Text;
                excelApp.Cells[35, 12] = TextBox26.Text;
                excelApp.Cells[35, 13] = TextBox27.Text;
                excelApp.Cells[35, 14] = TextBox28.Text;
                excelApp.Cells[35, 15] = TextBox29.Text;
                excelApp.Cells[35, 16] = TextBox30.Text;
                excelApp.Cells[36, 3] = Label19.Text;
                excelApp.Cells[36, 4] = Label20.Text;
                excelApp.Cells[36, 5] = Label21.Text;
                excelApp.Cells[36, 7] = Label22.Text;
                excelApp.Cells[36, 9] = Label23.Text;
                excelApp.Cells[36, 10] = Label24.Text;
                excelApp.Cells[36, 11] = Label25.Text;
                excelApp.Cells[36, 12] = Label26.Text;
                excelApp.Cells[36, 13] = Label27.Text;
                excelApp.Cells[36, 14] = Label28.Text;
                excelApp.Cells[36, 15] = Label29.Text;
                excelApp.Cells[36, 16] = Label30.Text;
                
                DAL.FirmFundMode.FFund_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "D");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    excelApp.Cells[40 + i - 1, 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[40 + i - 1, 7] = DAL.Temp2.count[1, i];
                    excelApp.Cells[40 + i - 1, 10] = DAL.Temp2.count[2, i];
                    excelApp.Cells[40 + i - 1, 12] = DAL.Temp2.count[3, i];
                    excelApp.Cells[40 + i - 1, 14] = DAL.Temp2.count[4, i];
                    excelApp.Cells[40 + i - 1, 15] = DAL.Temp2.count[5, i];
                }

                DAL.FirmFundMode.FFund_Search2(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "I");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    excelApp.Cells[53 + i - 1, 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[53 + i - 1, 7] = DAL.Temp2.count[1, i];
                    excelApp.Cells[53 + i - 1, 10] = DAL.Temp2.count[2, i];
                    excelApp.Cells[53 + i - 1, 12] = DAL.Temp2.count[3, i];
                    excelApp.Cells[53 + i - 1, 14] = DAL.Temp2.count[4, i];
                    excelApp.Cells[53 + i - 1, 15] = DAL.Temp2.count[5, i];
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

        protected void ImageButton132_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 2;
            Save_Excel();
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
            Session["FFID"] = DAL.Temp3.cc;
            Show_Date();
        }

        void Show_Date()
        {
            Session["FFID"] = DAL.Temp3.cc;
            TextBox1.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FF_Code");
            TextBox6.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FF_Edition");
            TextBox2.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "StartDate");
            TextBox4.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "EndDate");
            TextBox3.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FundDate");
            TextBox5.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PayDate");
            TextBox7.Text = DAL.FirmFundMode.FFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Note");

            Label1.Text = DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "LastTotalPrice");
            Label2.Text = DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "TaxPercent");
            if (Label1.Text == "" || Label1.Text == " ")
            {
                Label1.Text = "0.00";
            }
            if (Label2.Text == "" || Label2.Text == " ")
            {
                Label2.Text = "0.00";
            }
            Label3.Text = (Convert.ToDecimal(Label1.Text) + Convert.ToDecimal(Label2.Text)).ToString();
            Label4.Text = DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "PrepayPercent");
            Label5.Text = DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "RetentionPercent");
            Label6.Text = "現金" + DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "FundCash");
            Label6.Text += "%;期票" + DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "FundCheck");
            Label6.Text += "%(" + DAL.FirmFundMode.FFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "FundCheckDay") + ")";

            Label7.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item1", Convert.ToInt32(TextBox6.Text));
            Label8.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item2", Convert.ToInt32(TextBox6.Text));
            Label9.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item3", Convert.ToInt32(TextBox6.Text));
            Label10.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item4", Convert.ToInt32(TextBox6.Text));
            Label11.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item5", Convert.ToInt32(TextBox6.Text));
            Label12.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item6", Convert.ToInt32(TextBox6.Text));
            Label13.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item7", Convert.ToInt32(TextBox6.Text));
            Label14.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item8", Convert.ToInt32(TextBox6.Text));
            Label15.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item9", Convert.ToInt32(TextBox6.Text));
            Label16.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item10", Convert.ToInt32(TextBox6.Text));
            Label17.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item11", Convert.ToInt32(TextBox6.Text));
            Label18.Text = DAL.FirmFundMode.FFundView_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "Item12", Convert.ToInt32(TextBox6.Text));

            TextBox8.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item1");
            TextBox20.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item2");
            TextBox21.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item3");
            TextBox22.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item4");
            TextBox23.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item5");
            TextBox24.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item6");
            TextBox25.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item7");
            TextBox26.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item8");
            TextBox27.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item9");
            TextBox28.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item10");
            TextBox29.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item11");
            TextBox30.Text = DAL.FirmFundMode.FFundView_Search3(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Item12");

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
            if (TextBox8.Text == "" || TextBox8.Text == " ")
            {
                TextBox8.Text = "0.00";
            }
            if (TextBox20.Text == "" || TextBox20.Text == " ")
            {
                TextBox20.Text = "0.00";
            }
            if (TextBox21.Text == "" || TextBox21.Text == " ")
            {
                TextBox21.Text = "0.00";
            }
            if (TextBox22.Text == "" || TextBox22.Text == " ")
            {
                TextBox22.Text = "0.00";
            }
            if (TextBox23.Text == "" || TextBox23.Text == " ")
            {
                TextBox23.Text = "0.00";
            }
            if (TextBox24.Text == "" || TextBox24.Text == " ")
            {
                TextBox24.Text = "0.00";
            }
            if (TextBox25.Text == "" || TextBox25.Text == " ")
            {
                TextBox25.Text = "0.00";
            }
            if (TextBox26.Text == "" || TextBox26.Text == " ")
            {
                TextBox26.Text = "0.00";
            }
            if (TextBox27.Text == "" || TextBox27.Text == " ")
            {
                TextBox27.Text = "0.00";
            }
            if (TextBox28.Text == "" || TextBox28.Text == " ")
            {
                TextBox28.Text = "0.00";
            }
            if (TextBox29.Text == "" || TextBox29.Text == " ")
            {
                TextBox29.Text = "0.00";
            }
            if (TextBox30.Text == "" || TextBox30.Text == " ")
            {
                TextBox30.Text = "0.00";
            }

            Label19.Text = (Convert.ToDecimal(Label7.Text) + Convert.ToDecimal(TextBox8.Text)).ToString();
            Label20.Text = (Convert.ToDecimal(Label8.Text) + Convert.ToDecimal(TextBox20.Text)).ToString();
            Label21.Text = (Convert.ToDecimal(Label9.Text) + Convert.ToDecimal(TextBox21.Text)).ToString();
            Label22.Text = (Convert.ToDecimal(Label10.Text) + Convert.ToDecimal(TextBox22.Text)).ToString();
            Label23.Text = (Convert.ToDecimal(Label11.Text) + Convert.ToDecimal(TextBox23.Text)).ToString();
            Label24.Text = (Convert.ToDecimal(Label12.Text) + Convert.ToDecimal(TextBox24.Text)).ToString();
            Label25.Text = (Convert.ToDecimal(Label13.Text) + Convert.ToDecimal(TextBox25.Text)).ToString();
            Label26.Text = (Convert.ToDecimal(Label14.Text) + Convert.ToDecimal(TextBox26.Text)).ToString();
            Label27.Text = (Convert.ToDecimal(Label15.Text) + Convert.ToDecimal(TextBox27.Text)).ToString();
            Label28.Text = (Convert.ToDecimal(Label16.Text) + Convert.ToDecimal(TextBox28.Text)).ToString();
            Label29.Text = (Convert.ToDecimal(Label17.Text) + Convert.ToDecimal(TextBox29.Text)).ToString();
            Label30.Text = (Convert.ToDecimal(Label18.Text) + Convert.ToDecimal(TextBox30.Text)).ToString();
        }
    }
}