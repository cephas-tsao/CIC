using System;
using System.Web.UI;
using Excel = Microsoft.Office.Interop.Excel;
using System.Net;
using System.Drawing;

namespace IMS
{
    public partial class CompletionFill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Pnl_WBS_Table();
        }

        void Pnl_WBS_Table()
        {
            bool Result = DAL.CompletionMode.Pnl_WBS_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
            int Layer_Number = 1;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                string LayerCode = "";
                int j = 1;
                string s = DAL.Temp2.count[8, i];
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
            string TmpStr = "";
            TmpStr = @"<table class=""Table100"">
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"" rowspan=""2"" colspan='" + Layer_Number + @"'>項次</td>
                               <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單價分析</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單價</td>
                               <td class=""ShtCellCC"" colspan=""2"">原合約預算</td>
                               <td class=""ShtCellCC"" colspan=""2"">末次變更設計後</td>
                               <td class=""ShtCellCC"" colspan=""2"">竣工結算</td>
                               <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                           </tr>
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"">數量</td>
                               <td class=""ShtCellCC"">複價</td>
                               <td class=""ShtCellCC"">數量</td>
                               <td class=""ShtCellCC"">複價</td>
                               <td class=""ShtCellCC"">數量</td>
                               <td class=""ShtCellCC"">複價</td>
                           </tr>";
            decimal sum = 0;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (Result)
                {
                    string Id_Name_1 = "Text_1_" + i.ToString();
                    string Id_Name_2 = "Text_2_" + i.ToString();
                    string Id_Name_3 = "Text_3_" + i.ToString();
                    string Id_Name_4 = "Text_4_" + i.ToString();
                    string ItemOrder = "";
                    int j = 1;
                    string s = DAL.Temp2.count[8, i];
                    string[] sArray = s.Split(';');
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
                    for (int z = 1; z < j; z++)
                    {
                        TmpStr += @"<td class=""ShtCellCC"" align=""center"" style=""width: 5px""></td>";
                    }
                    int kk = Layer_Number - j + 1;
                    TmpStr += @"<td class=""ShtCellCL"" colspan='" + kk + @"' >" + DAL.Temp2.count[0, i] + @"</td>";
                    kk = 0;
                    TmpStr += @"<td class=""ShtCellCC""  style=""width:550px;font-family:Microsoft JhengHei;text-align:left;font-size:14px;"">" + DAL.Temp2.count[1, i] + "</td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 50px""><input id='" + i + @"' name='" + i + @"' value ='" + DAL.Temp2.count[2, i] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:50px;text-align:center;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    string aa1 = "";
                    string aa2 = "";
                    aa1 = "href='AnalysisV_EWBS.aspx?PriceID=" + DAL.Temp2.count[3, i].ToString() + "' target='_blank'";
                    if (DAL.Temp2.count[9, i] == " " || DAL.Temp2.count[9, i] == "0")
                    {
                        aa2 = "style='visibility:hidden;padding-left:5px'";
                    }
                    else
                    {
                        aa2 = "style='visibility:none;padding-left:5px'";
                    }
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 50px""><a " + aa1 + @" ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析"" " + aa2 + @" ></a></td>";
                    if (DAL.Temp2.count[5, i] == " ")
                    {
                        DAL.Temp2.count[5, i] = "0.000";
                    }
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_2 + @"' name='" + Id_Name_2 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    if (DAL.Temp2.count[4, i] == " ")
                    {
                        DAL.Temp2.count[4, i] = "0.000";
                    }
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[11, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[11, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i])), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[4, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i])), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    sum = sum + Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i]);
                    if (DAL.Temp2.count[6, i] == " " || DAL.Temp2.count[6, i] == null)
                    {
                        DAL.Temp2.count[6, i] = "0.000";
                    }
                    string cc = "run('" + Id_Name_1 + "','" + Id_Name_2 + "','" + Id_Name_3 + "');";
                    cc = "onkeyup=" + Convert.ToChar(34) + cc + Convert.ToChar(34);
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_1 + @"' name='" + Id_Name_1 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[6, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" " + cc + @" style=""text-align:right;font-size:14px;width:100px;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_3 + @"' name='" + Id_Name_3 + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[6, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i])), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_4 + @"' name='" + Id_Name_4 + @"' value ='" + DAL.Temp2.count[7, i] + @"' type=""text"" style=""font-size:14px;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"<tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"" colspan='" + Layer_Number + @"'></td>
                               <td class=""ShtCellCC"" >合計</td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" >" + Math.Round(sum, 3, MidpointRounding.AwayFromZero) + @"</td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                               <td class=""ShtCellCC"" ></td>
                           </tr>";
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }

        protected void ImageButton212_Click(object sender, ImageClickEventArgs e)
        {
            bool cc = false;
            string Text_ID_1;
            string Text_ID_2;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                Text_ID_1 = "Text_1_" + i.ToString();
                Text_ID_2 = "Text_4_" + i.ToString();
                string ComNumber = Request.Form[Text_ID_1];
                string ComNotes = Request.Form[Text_ID_2];
                if (ComNotes == " " || ComNotes == null || ComNotes == "")
                { 
                }
                else
                {
                    cc = DAL.CompletionMode.CompletionFill_Update(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), Convert.ToInt32(DAL.Temp2.count[10, i]), Convert.ToDecimal(ComNumber), ComNotes);
                }
            }
            if (cc)
            {
                Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                Pnl_WBS_Table();
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料儲存失敗！')</script>");
            }
        }

        protected void ImageButton210_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 1;
            Save_Excel();
        }

        protected void ImageButton211_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 2;
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
            excelApp.Workbooks.Add(Type.Missing);
            wBook = excelApp.Workbooks[1];
            wBook.Activate();
            wBook.Worksheets.Item[1].PageSetup.Orientation = 2;
            int Layer_Number = 1;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                string LayerCode = "";
                int j = 1;
                string s = DAL.Temp2.count[8, i];
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
                wSheet.Name = "竣工數量填列";
                wSheet.Activate();
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, (Layer_Number - 1) + 10]];
                wRange.Select();
                wRange.Merge(0);
                excelApp.Cells[1, 1] = "竣工數量填列";
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
                wRange.ColumnWidth = 40;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 2], wSheet.Cells[1, (Layer_Number - 1) + 2]];
                wRange.ColumnWidth = 5;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 3], wSheet.Cells[1, (Layer_Number - 1) + 3]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 4], wSheet.Cells[1, (Layer_Number - 1) + 4]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 5], wSheet.Cells[1, (Layer_Number - 1) + 5]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 6], wSheet.Cells[1, (Layer_Number - 1) + 6]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 7], wSheet.Cells[1, (Layer_Number - 1) + 7]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 8], wSheet.Cells[1, (Layer_Number - 1) + 8]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 9], wSheet.Cells[1, (Layer_Number - 1) + 9]];
                wRange.ColumnWidth =8;
                wRange = wSheet.Range[wSheet.Cells[1, (Layer_Number - 1) + 10], wSheet.Cells[1, (Layer_Number - 1) + 10]];
                wRange.ColumnWidth = 8;
                wRange = wSheet.Range[wSheet.Cells[2, 1], wSheet.Cells[3, (Layer_Number - 1)]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 1], wSheet.Cells[3, (Layer_Number - 1) + 1]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 2], wSheet.Cells[3, (Layer_Number - 1) + 2]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 3], wSheet.Cells[3, (Layer_Number - 1) + 3]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 4], wSheet.Cells[2, (Layer_Number - 1) + 5]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 6], wSheet.Cells[2, (Layer_Number - 1) + 7]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 8], wSheet.Cells[2, (Layer_Number - 1) + 9]];
                wRange.Merge(0);
                wRange = wSheet.Range[wSheet.Cells[2, (Layer_Number - 1) + 10], wSheet.Cells[3, (Layer_Number - 1) + 10]];
                wRange.Merge(0);
                excelApp.Cells[2, 1] = "項次";
                excelApp.Cells[2, (Layer_Number - 1) + 1] = "工項名稱";
                excelApp.Cells[2, (Layer_Number - 1) + 2] = "單位";
                excelApp.Cells[2, (Layer_Number - 1) + 3] = "單價";
                excelApp.Cells[2, (Layer_Number - 1) + 4] = "原合約預算";
                excelApp.Cells[2, (Layer_Number - 1) + 6] = "末次變更設計後";
                excelApp.Cells[2, (Layer_Number - 1) + 8] = "竣工結算";
                excelApp.Cells[2, (Layer_Number - 1) + 10] = "備註";
                excelApp.Cells[3, (Layer_Number - 1) + 4] = "數量";
                excelApp.Cells[3, (Layer_Number - 1) + 5] = "複價";
                excelApp.Cells[3, (Layer_Number - 1) + 6] = "數量";
                excelApp.Cells[3, (Layer_Number - 1) + 7] = "複價";
                excelApp.Cells[3, (Layer_Number - 1) + 8] = "數量";
                excelApp.Cells[3, (Layer_Number - 1) + 9] = "複價";
                wRange = wSheet.Range[wSheet.Cells[2, 1], wSheet.Cells[3, (Layer_Number - 1) + 10]];
                wRange.Font.Name = "微軟正黑體";
                wRange.Font.Bold = true;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                wRange.Interior.Color = ColorTranslator.ToOle(Color.White);

                decimal sum = 0;
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    sum = sum + Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i]);
                    if ((i % 2) == 0)
                    {
                        wRange = wSheet.Range[wSheet.Cells[i + 3, 1], wSheet.Cells[i + 3, (Layer_Number - 1) + 10]];
                        wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Interior.Color = ColorTranslator.ToOle(Color.Aqua);
                        wRange.WrapText = true;
                    }
                    else
                    {
                        wRange = wSheet.Range[wSheet.Cells[i + 3, 1], wSheet.Cells[i + 3, (Layer_Number - 1) + 10]];
                        wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                        wRange.Interior.Color = ColorTranslator.ToOle(Color.White);
                        wRange.WrapText = true;
                    }
                    string ItemOrder = "";
                    int j = 1;
                    string s = DAL.Temp2.count[8, i];
                    string[] sArray = s.Split(';');
                    foreach (string k in sArray)
                    {
                        ItemOrder = k.ToString();
                        j = j + 1;
                    }
                    excelApp.Cells[i + 3, j - 1] = DAL.Temp2.count[0, i];
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 1] = DAL.Temp2.count[1, i];
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 2] = DAL.Temp2.count[2, i];
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 3] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 4] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[11, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 5] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[11, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 6] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[4, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 7] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 8] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[6, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 9] = (Math.Round(Convert.ToDecimal(DAL.Temp2.count[6, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero)).ToString("N");
                    excelApp.Cells[i + 3, (Layer_Number - 1) + 10] = DAL.Temp2.count[7, i];
                }
                wRange = wSheet.Range[wSheet.Cells[4, 1], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1)]];
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                wRange = wSheet.Range[wSheet.Cells[4, (Layer_Number - 1) + 1], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1) + 1]];
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignLeft;
                wRange = wSheet.Range[wSheet.Cells[4, (Layer_Number - 1) + 2], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1) + 2]];
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                wRange = wSheet.Range[wSheet.Cells[4, (Layer_Number - 1) + 3], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1) + 9]];
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignRight;
                wRange = wSheet.Range[wSheet.Cells[4, (Layer_Number - 1) + 10], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1) + 10]];
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignLeft;
                wRange = wSheet.Range[wSheet.Cells[4, 1], wSheet.Cells[DAL.Temp2.i + 2, (Layer_Number - 1) + 10]];
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.Font.Size = 10;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.CadetBlue);
                wRange.Font.Name = "微軟正黑體";
                wRange = wSheet.Range[wSheet.Cells[DAL.Temp2.i + 3, 1], wSheet.Cells[DAL.Temp2.i + 3, (Layer_Number - 1) + 1]];
                wRange.Merge(0);
                excelApp.Cells[DAL.Temp2.i + 3, 1] = "合計";
                excelApp.Cells[DAL.Temp2.i + 3, (Layer_Number - 1) + 7] = sum.ToString();
                wRange = wSheet.Range[wSheet.Cells[DAL.Temp2.i + 3, 1], wSheet.Cells[DAL.Temp2.i + 3, (Layer_Number - 1) + 10]];
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.Font.Size = 10;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.Gray);
                wRange.Font.Color = ColorTranslator.ToOle(Color.Black);
                wRange.Interior.Color = ColorTranslator.ToOle(Color.Gray);
                wRange.Font.Name = "微軟正黑體";
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignRight;
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
    }
}