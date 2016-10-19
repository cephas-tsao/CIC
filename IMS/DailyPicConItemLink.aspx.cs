using System;

namespace IMS
{
    public partial class DailyPicConItemLink : System.Web.UI.Page
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
                               <td class=""ShtCellCC"" rowspan=""2""></td>
                               <td class=""ShtCellCC"" rowspan=""2"" colspan='" + Layer_Number + @"'>項次</td>
                               <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單價分析</td>
                               <td class=""ShtCellCC"" rowspan=""2"">單價</td>
                               <td class=""ShtCellCC"" colspan=""2"">原合約預算</td>
                               <td class=""ShtCellCC"" colspan=""2"">末次變更設計後</td>
                               <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                           </tr>
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"">數量</td>
                               <td class=""ShtCellCC"">複價</td>
                               <td class=""ShtCellCC"">數量</td>
                               <td class=""ShtCellCC"">複價</td>
                           </tr>";
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (Result)
                {
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
                    string cc1 = "button_" + i.ToString();
                    string cc2 = "SetCookie('" + DAL.Temp2.count[1, i] + "','" + DAL.Temp2.count[10, i] + "');";
                    cc2 = "onclick=" + Convert.ToChar(34) + cc2 + Convert.ToChar(34);
                    TmpStr += @"<td class=""ShtCellCC"" align=""center"" style=""width: 20px""><input id='" + cc1 + @"' type=""button"" Value=""選擇"" " + cc2 + @"' runat=""Server""></td>";
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
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[5, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    if (DAL.Temp2.count[4, i] == " ")
                    {
                        DAL.Temp2.count[4, i] = "0.000";
                    }
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[11, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[11, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i])), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[4, i]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[5, i])), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + DAL.Temp2.count[7, i] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }
    }
}