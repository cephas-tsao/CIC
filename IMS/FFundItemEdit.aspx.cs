using System;

namespace IMS
{
    public partial class FFundItemEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowDate();
        }

        protected void Button1_Click(object sender, EventArgs e)
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
                    string cc = "run('" + Id_Name_1 + "','" + Id_Name_2 + "','" + Id_Name_3 + "','" + Id_Name_4 + "','" + Id_Name_5 + "','" + Id_Name_6 + "','" + Id_Name_7 + "');";
                    cc = "onkeyup=" + Convert.ToChar(34) + cc + Convert.ToChar(34);
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_4 + @"' name='" + Id_Name_4 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[8, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" " + cc + @" style=""text-align:right;font-size:14px;width:80px""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_5 + @"' name='" + Id_Name_5 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[9, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_6 + @"' name='" + Id_Name_6 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[6, j]) + Convert.ToDecimal(DAL.Temp.count3[8, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_7 + @"' name='" + Id_Name_7 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp.count3[7, j]) + Convert.ToDecimal(DAL.Temp.count3[9, j]), 3, MidpointRounding.AwayFromZero).ToString("N") + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:80px;text-align:right;font-size:14px;background-color:transparent""></td>";
                    TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_8 + @"' name='" + Id_Name_8 + @"' value ='" + DAL.Temp.count3[10, j] + @"' type=""text"" style=""text-align:left;font-size:14px;""></td>";
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int Result = 0;
            string Text_ID_1;
            string Text_ID_2;
            string Text_ID_3;
            for (int i = 1; i < DAL.Temp.j; i++)
            {
                Text_ID_1 = "Text_4_" + i.ToString();
                Text_ID_2 = "Text_5_" + i.ToString();
                Text_ID_3 = "Text_8_" + i.ToString();
                string ComplexNumber = Request.Form[Text_ID_1];
                string ComplexPrice = Request.Form[Text_ID_2];
                string Note = Request.Form[Text_ID_3];
                Result = Result + DAL.FirmFundMode.FFundItemEdit_Update_1(Session["DatabaseName"].ToString(), Convert.ToInt32(DAL.Temp.count3[11, i]), Convert.ToDecimal(ComplexNumber), Convert.ToDecimal(ComplexPrice), Note);
            }

            Result = DAL.FirmFundMode.FFundItemEdit_Update_2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]));
            if (Result == 1)
            {
                Response.Write("<script language=javascript>alert('選取成功！')</script>");
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                Response.Write("<script language='javascript'>window.close();</" + "script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('選取失敗！')</script>");
            }
        }
    }
}