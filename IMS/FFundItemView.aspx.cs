using System;

namespace IMS
{
    public partial class FFundItemView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowDate();
        }

        void ShowDate()
        {
            string TmpStr = "";
            TmpStr = @"<table class=""Table100"">
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"">項次</td>
                               <td class=""ShtCellCC"">工項/工料名稱</td>
                               <td class=""ShtCellCC"">單位</td>
                               <td class=""ShtCellCC"">分包數量</td>
                               <td class=""ShtCellCC"">分包單價</td>
                               <td class=""ShtCellCC"">分包複價</td>
                               <td class=""ShtCellCC"">前期累計數量</td>
                               <td class=""ShtCellCC"">前期累計金額</td>
                               <td class=""ShtCellCC"">本期完成數量</td>
                               <td class=""ShtCellCC"">本期完成金額</td>
                               <td class=""ShtCellCC"">本期累計數量</td>
                               <td class=""ShtCellCC"">本期累計金額</td>
                               <td class=""ShtCellCC"">備註</td>
                           </tr>";
            DAL.Temp.j = 0;
            bool Result = DAL.FirmFundMode.FFundItem_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]));
            for (int j = 1; j < DAL.Temp.j; j++)
            {
                if (Result)
                {
                    string Id_Name_1 = "Text_1_" + j.ToString();
                    string Id_Name_2 = "Text_2_" + j.ToString();
                    string Id_Name_3 = "Text_3_" + j.ToString();
                    string Id_Name_4 = "Text_4_" + j.ToString();
                    string Id_Name_5 = "Text_5_" + j.ToString();
                    string Id_Name_6 = "Text_6_" + j.ToString();
                    string Id_Name_7 = "Text_7_" + j.ToString();
                    string Id_Name_8 = "Text_8_" + j.ToString();

                    if ((j % 2) == 0)
                    {
                        TmpStr += @"<tr class=""ShtRowSingle"">";
                    }
                    else
                    {
                        TmpStr += @"<tr class=""ShtRowDouble"">";
                    }
                    if (DAL.Temp.count3[3, j] == " ")
                    {
                        DAL.Temp.count3[3, j] = "0.000";
                    }
                    if (DAL.Temp.count3[4, j] == " ")
                    {
                        DAL.Temp.count3[4, j] = "0.000";
                    }
                    if (DAL.Temp.count3[5, j] == " ")
                    {
                        DAL.Temp.count3[5, j] = "0.000";
                    }
                    if (DAL.Temp.count3[6, j] == " ")
                    {
                        DAL.Temp.count3[6, j] = "0.000";
                    }
                    if (DAL.Temp.count3[7, j] == " ")
                    {
                        DAL.Temp.count3[7, j] = "0.000";
                    }
                    if (DAL.Temp.count3[8, j] == " ")
                    {
                        DAL.Temp.count3[8, j] = "0.000";
                    }
                    if (DAL.Temp.count3[9, j] == " ")
                    {
                        DAL.Temp.count3[9, j] = "0.000";
                    }
                    TmpStr += @"<td class=""ShtCellCC""><input value ='" + j.ToString() + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:30px;text-align:center;font-size:14px;background-color:transparent""></td>"; ;
                    TmpStr += @"<td class=""ShtCellCL""><input value ='" + DAL.Temp.count3[1, j] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:250px;text-align:left;font-size:14px;background-color:transparent""></td>"; ;
                    TmpStr += @"<td class=""ShtCellCC""><input value ='" + DAL.Temp.count3[2, j] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:40px;text-align:center;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[3, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_1 + @"' name='" + Id_Name_1 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[4, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[5, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_2 + @"' name='" + Id_Name_2 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[6, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_3 + @"' name='" + Id_Name_3 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[7, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_4 + @"' name='" + Id_Name_4 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[8, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_5 + @"' name='" + Id_Name_5 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[9, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_6 + @"' name='" + Id_Name_6 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[6, j]) + Convert.ToDecimal(DAL.Temp.count3[8, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_7 + @"' name='" + Id_Name_7 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[7, j]) + Convert.ToDecimal(DAL.Temp.count3[9, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_8 + @"' name='" + Id_Name_8 + @"' value ='" + DAL.Temp.count3[10, j] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }
    }
}