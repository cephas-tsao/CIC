using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Drawing;
using System.Net;

namespace IMS
{
    public partial class FinanceCodeMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL.Temp2.CN = 1;
            }
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList2.SelectedIndex == 0))
            {
                if (DAL.Temp2.CN == 0)
                {
                    RadioButtonList2.SelectedIndex = 1;
                    Response.Write("<script language=javascript>alert('資料尚未儲存！')</script>");
                }
                else
                {
                    DAL.Temp2.CN = 0;
                    Pnl_WBS.Visible = true;
                    Pnl_Resource.Visible = false;
                    Pnl_WBS_Mark_Table();
                }
            }
            else if ((RadioButtonList2.SelectedIndex == 1))
            {
                if (DAL.Temp2.CN == 0)
                {
                    RadioButtonList2.SelectedIndex = 0;
                    Response.Write("<script language=javascript>alert('資料尚未儲存！')</script>");
                }
                else
                {
                    DAL.Temp2.CN = 0;
                    Pnl_WBS.Visible = false;
                    Pnl_Resource.Visible = true;
                    Pnl_Resource_Mark_Table();
                }
            }
        }

        protected void ImageButton212_Click(object sender, ImageClickEventArgs e)
        {
            bool cc = false;
            DAL.Temp2.CN = 1;
            string Text_ID;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if ((RadioButtonList2.SelectedIndex == 0))
                {
                    Text_ID = "Text_O" + i.ToString();
                }
                else
                {
                    Text_ID = "Text" + i.ToString();
                }
                string FI_Code = Request.Form[Text_ID];
                int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                if (DAL.Temp2.count[3, i] == " " || DAL.Temp2.count[3, i] == "")
                {
                }
                else
                {
                    if (DAL.FinanceCodeMode.FI_Mapping_Check(Session["DatabaseName"].ToString(), EWID, Convert.ToInt32(DAL.Temp2.count[3, i])))
                    {
                        if (DAL.FinanceCodeMode.FI_Mapping_Update(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]), FI_Code))
                        {
                            cc = true;
                        }
                        else
                        {
                            cc = false;
                        }
                    }
                    else
                    {
                        if (DAL.FinanceCodeMode.FI_Mapping_Insert(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]), FI_Code))
                        {
                            cc = true;
                        }
                        else
                        {
                            cc = false;
                        }
                    }
                }
            }
            if (cc)
            {
                Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
            }
            else
            { 
                Response.Write("<script language=javascript>alert('資料儲存失敗！')</script>");
            }
            if ((RadioButtonList2.SelectedIndex == 0))
            {
                Pnl_WBS_Mark_Table();
            }
            else
            {
                Pnl_Resource_Mark_Table();
            }
        }

        void Pnl_WBS_Mark_Table()
        {
            bool Result = DAL.FinanceCodeMode.Pnl_WBS_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
            int Layer_Number=1;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                string LayerCode = "";
                int j = 1;
                string s = DAL.Temp2.count[0, i];
                string[] sArray = s.Split(';');
                foreach (string k in sArray)
                {
                    LayerCode = k.ToString();
                    j = j + 1;
                    if (Layer_Number < j)
                    {
                        Layer_Number = Layer_Number + 1;
                    }
                }
            }
            string TmpStr="";
            TmpStr = @"<table class=""Table100"">
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"" colspan='" + Layer_Number + @"'>項次</td>
                                   <td class=""ShtCellCC"">工項名稱</td>
                                   <td class=""ShtCellCC"">單位</td>
                                   <td class=""ShtCellCC"">財會編碼</td>
                           </tr>";
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (Result)
                {
                    string Id_Name = "Text_O" + i.ToString();
                    string ItemOrder = "";
                    int j = 1;
                    string s = DAL.Temp2.count[4, i];
                    string[] sArray = s.Split('.');
                    foreach (string k in sArray)
                    {
                        ItemOrder = k.ToString();
                        j = j + 1;
                    }
                    if ((i % 2) == 0)
                    {
                        TmpStr += @"<tr class=""ShtRowSingle"">";
                    }
                    else
                    {
                        TmpStr += @"<tr class=""ShtRowDouble"">";
                    }
                    //if (j == Layer_Number)
                    //{
                    //    TmpStr += @"<tr class=""ShtRowExecuteDeep"">";
                    //}
                    for (int z = 1; z < j; z++)
                    {
                        TmpStr += @"<td class=""ShtCellCC"" align=""center"" style=""width: 5px""></td>";
                    }
                    int kk = Layer_Number - j + 1;
                    TmpStr += @"<td class=""ShtCellCL"" colspan='" + kk + @"' >" + ItemOrder + @"</td>";
                    TmpStr += @"<td class=""ShtCellCL"">" + DAL.Temp2.count[1, i] + "</td>";
                    TmpStr += @"<td class=""ShtCellCC"">" + DAL.Temp2.count[2, i] + "</td>";
                    if (DAL.Temp2.count[3, i] == " " || DAL.Temp2.count[3, i] == "")
                    {
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name + @"' name='" + Id_Name + @"' type=""text"" /></td>";
                    }
                    else
                    {
                        int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                        string FI_Code_Text = DAL.FinanceCodeMode.FI_Code_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]));
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name + @"' name='" + Id_Name + @"' value ='" + FI_Code_Text + @"' type=""text"" /></td>";
                    }
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }

        void Pnl_Resource_Mark_Table()
        {
            string TmpStr = "";
            bool Result = DAL.FinanceCodeMode.Pnl_Resource_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
            TmpStr = @"<table class=""Sht100"">
                               <tr class=""ShtRowTop"">
                                   <td class=""ShtCellCC"">資源編碼</td>
                                   <td class=""ShtCellCC"">資源名稱</td>
                                   <td class=""ShtCellCC"">單位</td>
                                   <td class=""ShtCellCC"">財會編碼</td>
                               </tr>";
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (Result)
                {
                    string Id_Name = "Text" + i.ToString();
                    if ((i % 2) == 0)
                    {
                        TmpStr += @"<tr class=""ShtRowDouble"">
                                    <td class=""ShtCellCL"">" + DAL.Temp2.count[0, i] + "</td>";
                        TmpStr += @"<td class=""ShtCellCL"">" + DAL.Temp2.count[1, i] + "</td>";
                        TmpStr += @"<td class=""ShtCellCC"">" + DAL.Temp2.count[2, i] + "</td>";
                        int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                        string FI_Code_Text = DAL.FinanceCodeMode.FI_Code_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]));
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name + @"' name='" + Id_Name + @"' value ='" + FI_Code_Text + @"' type=""text"" /></td>";
                        TmpStr += @"</tr>";
                    }
                    else
                    {
                        TmpStr += @"<tr class=""ShtRowSingle"">
                                    <td class=""ShtCellCL"">" + DAL.Temp2.count[0, i] + "</td>";
                        TmpStr += @"<td class=""ShtCellCL"">" + DAL.Temp2.count[1, i] + "</td>";
                        TmpStr += @"<td class=""ShtCellCC"">" + DAL.Temp2.count[2, i] + "</td>";
                        int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                        string FI_Code_Text = DAL.FinanceCodeMode.FI_Code_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]));
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name + @"' name='" + Id_Name + @"' value ='" + FI_Code_Text + @"' type=""text"" /></td>";
                        TmpStr += @"</tr>";
                    }
                }
            }
            TmpStr += @"</table>";
            Literal2.Text = TmpStr.ToString();
        }

        protected void ImageButton210_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 1;
            if (RadioButtonList2.SelectedIndex == 0)
            {
                Save_Excel_1();
            }
            else if (RadioButtonList2.SelectedIndex == 1)
            {
                Save_Excel_2();
            }
        }

        void Save_Excel_1()
        {
            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;
            Excel.Range wRange;

            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            excelApp.Workbooks.Add(Type.Missing);
            wBook = excelApp.Workbooks[1];
            wBook.Activate();
            bool Result = DAL.FinanceCodeMode.Pnl_WBS_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
            int Layer_Number = 1;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                string LayerCode = "";
                int j = 1;
                string s = DAL.Temp2.count[0, i];
                string[] sArray = s.Split(';');
                foreach (string k in sArray)
                {
                    LayerCode = k.ToString();
                    j = j + 1;
                    if (Layer_Number < j)
                    {
                        Layer_Number = Layer_Number + 1;
                    }
                }
            }
            try
            {
                wSheet = (Excel._Worksheet)wBook.Worksheets[1];
                wSheet.Name = "財務會計用編碼編輯-依執行預算工作項目填寫";
                wSheet.Activate();
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, (Layer_Number-1)+3]];
                wRange.Select();
                wRange.Merge(0);
                excelApp.Cells[1, 1] = "財務會計用編碼編輯-依執行預算工作項目填寫";
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
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, (Layer_Number - 1)]];
                wRange.ColumnWidth = 2;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 1], wSheet.Cells[1, (Layer_Number - 1) + 1]];
                wRange.ColumnWidth = 55;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 2], wSheet.Cells[1, (Layer_Number - 1) + 2]];
                wRange.ColumnWidth = 6;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 3], wSheet.Cells[1, (Layer_Number - 1) + 3]];
                wRange.ColumnWidth = 10;
                wRange = wSheet.Range[wSheet.Cells[2, 1], wSheet.Cells[2, (Layer_Number - 1)]];
                wRange.Select();
                wRange.Merge(0);
                excelApp.Cells[2, 1] = "資源編碼";
                excelApp.Cells[2, (Layer_Number - 1) + 1] = "資源名稱";
                excelApp.Cells[2, (Layer_Number - 1) + 2] = "單位";
                excelApp.Cells[2, (Layer_Number - 1) + 3] = "財會編碼";
                wRange = wSheet.Range[wSheet.Cells[2, 1], wSheet.Cells[2, (Layer_Number - 1) + 3]];
                wRange.Select();
                wRange.Font.Name = "微軟正黑體";
                wRange.Font.Bold = true;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                wRange.Interior.Color = ColorTranslator.ToOle(Color.White);
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    if (Result)
                    {
                        string Id_Name = "Text" + i.ToString();
                        if ((i % 2) == 0)
                        {
                            wRange = wSheet.Range[wSheet.Cells[i + 2, 1], wSheet.Cells[i + 2, (Layer_Number - 1) + 3]];
                            wRange.Select();
                            wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                            wRange.Interior.Color = ColorTranslator.ToOle(Color.White);
                            wRange.WrapText = true;
                        }
                        else
                        {
                            wRange = wSheet.Range[wSheet.Cells[i + 2, 1], wSheet.Cells[i + 2, (Layer_Number - 1) + 3]];
                            wRange.Select();
                            wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                            wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                            wRange.WrapText = true;
                        }
                    }
                    string ItemOrder = "";
                    int j = 1;
                    string s = DAL.Temp2.count[4, i];
                    string[] sArray = s.Split('.');
                    foreach (string k in sArray)
                    {
                        ItemOrder = k.ToString();
                        j = j + 1;
                    }
                    excelApp.Cells[i + 2, j - 1] = ItemOrder;
                    excelApp.Cells[i + 2, (Layer_Number - 1) + 1] = DAL.Temp2.count[1, i];
                    excelApp.Cells[i + 2, (Layer_Number - 1) + 2] = DAL.Temp2.count[2, i];
                    int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                    if (DAL.Temp2.count[3, i] == " " || DAL.Temp2.count[3, i] == "")
                    {
                        excelApp.Cells[i + 2, (Layer_Number - 1) + 3] = "";
                    }
                    else
                    {
                        string FI_Code_Text = DAL.FinanceCodeMode.FI_Code_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]));
                        excelApp.Cells[i + 2, (Layer_Number - 1) + 3] = FI_Code_Text;
                    }
                }
                wRange = wSheet.Range[wSheet.Cells[3, 1], wSheet.Cells[DAL.Temp2.i + 1, (Layer_Number - 1) + 3]];
                wRange.Select();
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.Font.Size = 10;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Font.Name = "微軟正黑體";
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                if (DAL.Temp2.Check_Button_Type == 1)
                {
                }
                else if (DAL.Temp2.Check_Button_Type == 2)
                {
                    string pathFile = Server.MapPath("Uploads/Output.xlsx");
                    try
                    {
                        wBook.SaveAs(pathFile, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Excel.XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                        Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                        wBook.Close(false, Type.Missing, Type.Missing);
                        excelApp.Quit();
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(excelApp);
                        Excel2Pdf(Server.MapPath("Uploads/Output.xlsx"), Server.MapPath("Uploads/Output.pdf"));
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

        void Save_Excel_2()
        {
            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;
            Excel.Range wRange;

            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            excelApp.Workbooks.Add(Type.Missing);
            wBook = excelApp.Workbooks[1];
            wBook.Activate();
            try
            {
                wSheet = (Excel._Worksheet)wBook.Worksheets[1];
                wSheet.Name = "財務會計用編碼編輯-依執行預算資源項目填寫";
                wSheet.Activate();

                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, 4]];
                wRange.Select();
                wRange.Merge(0);
                excelApp.Cells[1, 1] = "財務會計用編碼編輯-依執行預算資源項目填寫";
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

                ((Excel.Range)excelApp.Columns["A", System.Type.Missing]).ColumnWidth = 10;
                ((Excel.Range)excelApp.Columns["B", System.Type.Missing]).ColumnWidth = 55;
                ((Excel.Range)excelApp.Columns["C", System.Type.Missing]).ColumnWidth = 6;
                ((Excel.Range)excelApp.Columns["D", System.Type.Missing]).ColumnWidth = 10;
                excelApp.Cells[2, 1] = "資源編碼";
                excelApp.Cells[2, 2] = "資源名稱";
                excelApp.Cells[2, 3] = "單位";
                excelApp.Cells[2, 4] = "財會編碼";
                wRange = wSheet.Range[wSheet.Cells[2, 1], wSheet.Cells[2, 4]];
                wRange.Select();
                wRange.Font.Name = "微軟正黑體";
                wRange.Font.Bold = true;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                wRange.Interior.Color = ColorTranslator.ToOle(Color.White);
                bool Result = DAL.FinanceCodeMode.Pnl_Resource_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    if (Result)
                    {
                        string Id_Name = "Text" + i.ToString();
                        if ((i % 2) == 0)
                        {
                            wRange = wSheet.Range[wSheet.Cells[i + 2, 1], wSheet.Cells[i + 2, 4]];
                            wRange.Select();
                            wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                            wRange.Interior.Color = ColorTranslator.ToOle(Color.White);
                            wRange.WrapText = true;
                        }
                        else
                        {
                            wRange = wSheet.Range[wSheet.Cells[i + 2, 1], wSheet.Cells[i + 2, 4]];
                            wRange.Select();
                            wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                            wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                            wRange.WrapText = true;
                        }
                    }
                    excelApp.Cells[i + 2, 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[i + 2, 2] = DAL.Temp2.count[1, i];
                    excelApp.Cells[i + 2, 3] = DAL.Temp2.count[2, i];
                    int EWID = DAL.FinanceCodeMode.EWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), DAL.Temp2.count[1, i]);
                    string FI_Code_Text = DAL.FinanceCodeMode.FI_Code_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), EWID, Convert.ToInt32(DAL.Temp2.count[3, i]));
                    excelApp.Cells[i + 2, 4] = FI_Code_Text;
                }
                wRange = wSheet.Range[wSheet.Cells[3, 1], wSheet.Cells[DAL.Temp2.i + 1, 4]];
                wRange.Select();
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.Font.Size = 10;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Font.Name = "微軟正黑體";
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                if (DAL.Temp2.Check_Button_Type == 1)
                {
                }
                else if (DAL.Temp2.Check_Button_Type == 2)
                {
                    string pathFile = Server.MapPath("Uploads/Output.xlsx");
                    try
                    {
                        wBook.SaveAs(pathFile, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Excel.XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                        Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                        wBook.Close(false, Type.Missing, Type.Missing);
                        excelApp.Quit();
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(excelApp);
                        Excel2Pdf(Server.MapPath("Uploads/Output.xlsx"), Server.MapPath("Uploads/Output.pdf"));
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

        protected void ImageButton211_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 2;
            if (RadioButtonList2.SelectedIndex == 0)
            {
                Save_Excel_1();
            }
            else if (RadioButtonList2.SelectedIndex == 1)
            {
                Save_Excel_2();
            }
        }
    }
}