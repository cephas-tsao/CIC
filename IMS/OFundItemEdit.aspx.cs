﻿using System;

namespace IMS
{
    public partial class OFundItemEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Page_InitComplete(object sender, System.EventArgs e)
        {
            ShowDate();
        }

        void ShowDate()
        {
            bool Result = DAL.OFundMode.OFundItem_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]), Convert.ToInt32(Session["Edition"]));
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
            decimal Sum_1 = 0;
            decimal Sum_2 = 0;
            decimal Sum_3 = 0;
            decimal Sum_4 = 0;
            string TmpStr = "";
            TmpStr = @"<table class=""Table100"">
                           <tr class=""ShtRowTop"">
                               <td class=""ShtCellCC"" style='width:" + 1 * Layer_Number + "px;' colspan='" + Layer_Number + @"'>項次</td>
                               <td class=""ShtCellCC"" style=""width:400px;"" >工料名稱</td>
                               <td class=""ShtCellCC"" style=""width:50px;"" >單位</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >合約數量</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >合約單價</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >合約複價</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >日報紀錄數量</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >前期累計數量</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >前期累計金額</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >本期請款數量</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >本期請款金額</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >本期核發數量</td>
                               <td class=""ShtCellCC"" style=""width:100px;"" >本期核發金額</td>
                               <td class=""ShtCellCC"">備註</td>
                           </tr>";
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (Result)
                {
                    string Id_Name_1 = "Text_1_" + i.ToString();
                    string Id_Name_2 = "Text_2_" + i.ToString();
                    string Id_Name_3 = "Text_3_" + i.ToString();
                    string Id_Name_4 = "Text_4_" + i.ToString();
                    string Id_Name_5 = "Text_5_" + i.ToString();
                    string Id_Name_6 = "Text_6_" + i.ToString();
                    string ItemOrder = "";
                    int j = 1;
                    string s = DAL.Temp2.count[0, i];
                    string[] sArray = s.Split(';');
                    foreach (string k in sArray)
                    {
                        ItemOrder = k.ToString();
                        j = j + 1;
                    }
                    if (DAL.Temp2.count[8, i] == "" || DAL.Temp2.count[8, i] == " " || DAL.Temp2.count[8, i] == null || Convert.ToDecimal(DAL.Temp2.count[8, i]) == 0)
                    {
                        if ((i % 2) == 0)
                        {
                            TmpStr += @"<tr class=""ShtRowSingle"">";
                        }
                        else
                        {
                            TmpStr += @"<tr class=""ShtRowDouble"">";
                        }
                    }
                    else
                    {
                        TmpStr += @"<tr style=""background-color:#c39797;"">";
                    }
                    for (int z = 1; z < j; z++)
                    {
                        TmpStr += @"<td class=""ShtCellCC"" align=""center"" style=""width: 5px""></td>";
                    }
                    int kk = Layer_Number - j + 1;
                    TmpStr += @"<td class=""ShtCellCL"" colspan='" + kk + @"' >" + DAL.Temp2.count[1, i] + @"</td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 550px;font-family:Microsoft JhengHei;text-align:left;font-size:14px;"">" + DAL.Temp2.count[2, i] + @"</td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 50px""><input id='" + i + @"' name='" + i + @"' value ='" + DAL.Temp2.count[3, i] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:50px;text-align:center;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + DAL.Temp2.count[4, i] + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    if (DAL.Temp2.count[4, i] == "" || DAL.Temp2.count[4, i] == " " || DAL.Temp2.count[4, i] == null)
                    {
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                    }
                    else
                    {
                        if (DAL.Temp2.count[6, i] == "" || DAL.Temp2.count[6, i] == " " || DAL.Temp2.count[6, i] == null)
                        {
                            DAL.Temp2.count[6, i] = "0.000";
                        }
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_1 + @"' name='" + Id_Name_1 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[6, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round((Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[6, i])), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        Sum_1 = Sum_1 + Convert.ToDecimal(DAL.Temp2.count[4, i]) * Convert.ToDecimal(DAL.Temp2.count[6, i]);
                    }
                    if (DAL.Temp2.count[4, i] == "" || DAL.Temp2.count[4, i] == " " || DAL.Temp2.count[4, i] == null)
                    {
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                    }
                    else
                    {
                        if (DAL.Temp2.count[15, i] == "" || DAL.Temp2.count[15, i] == " " || DAL.Temp2.count[15, i] == null)
                        {
                            DAL.Temp2.count[15, i] = "0.000";
                        }
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[15, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                    }
                    if (DAL.Temp2.count[4, i] == "" || DAL.Temp2.count[4, i] == " " || DAL.Temp2.count[4, i] == null)
                    {
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                    }
                    else
                    {
                        if (DAL.Temp2.count[13, i] == "" || DAL.Temp2.count[13, i] == " " || DAL.Temp2.count[13, i] == null)
                        {
                            DAL.Temp2.count[13, i] = "0.000";
                        }
                        if (DAL.Temp2.count[14, i] == "" || DAL.Temp2.count[14, i] == " " || DAL.Temp2.count[14, i] == null)
                        {
                            DAL.Temp2.count[14, i] = "0.000";
                        }
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[13, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + i + @"' name='" + i + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[14, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        Sum_2 = Sum_2 + Convert.ToDecimal(DAL.Temp2.count[14, i]);
                    }
                    if (DAL.Temp2.count[4, i] == "" || DAL.Temp2.count[4, i] == " " || DAL.Temp2.count[4, i] == null)
                    {
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                        TmpStr += @"<td class=""ShtCellCC""></td>";
                    }
                    else
                    {
                        if (DAL.Temp2.count[8, i] == "" || DAL.Temp2.count[8, i] == " " || DAL.Temp2.count[8, i] == null)
                        {
                            DAL.Temp2.count[8, i] = "0.000";
                        }
                        if (DAL.Temp2.count[9, i] == "" || DAL.Temp2.count[9, i] == " " || DAL.Temp2.count[9, i] == null)
                        {
                            DAL.Temp2.count[9, i] = "0.000";
                        }
                        if (DAL.Temp2.count[10, i] == "" || DAL.Temp2.count[10, i] == " " || DAL.Temp2.count[10, i] == null)
                        {
                            DAL.Temp2.count[10, i] = "0.000";
                        }
                        if (DAL.Temp2.count[11, i] == "" || DAL.Temp2.count[11, i] == " " || DAL.Temp2.count[11, i] == null)
                        {
                            DAL.Temp2.count[11, i] = "0.000";
                        }
                        string cc = "run1('" + Id_Name_1 + "','" + Id_Name_2 + "','" + Id_Name_3 + "');";
                        cc = "onkeyup=" + Convert.ToChar(34) + cc + Convert.ToChar(34);
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_2 + @"' name='" + Id_Name_2 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[8, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" " + cc + @" style=""text-align:right;font-size:14px;width:100px;font-family:Microsoft JhengHei;""></td>";
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_3 + @"' name='" + Id_Name_3 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[9, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        Sum_3 = Sum_3 + Convert.ToDecimal(DAL.Temp2.count[9, i]);
                        cc = "run1('" + Id_Name_1 + "','" + Id_Name_4 + "','" + Id_Name_5 + "');";
                        cc = "onkeyup=" + Convert.ToChar(34) + cc + Convert.ToChar(34);
                        TmpStr += @"<td class=""ShtCellCC"" style=""width: 100px""><input id='" + Id_Name_4 + @"' name='" + Id_Name_4 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[10, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" " + cc + @" style=""text-align:right;font-size:14px;width:100px;font-family:Microsoft JhengHei;""></td>";
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_5 + @"' name='" + Id_Name_5 + @"' value ='" + Math.Round(Convert.ToDecimal(DAL.Temp2.count[11, i]), 3, MidpointRounding.AwayFromZero) + @"' type=""text"" style=""border-color:white;border-width:0px;border-style:dotted;width:100px;text-align:right;font-size:14px;background-color:transparent;font-family:Microsoft JhengHei;""></td>";
                        Sum_4 = Sum_4 + Convert.ToDecimal(DAL.Temp2.count[11, i]);
                        TmpStr += @"<td class=""ShtCellCC""><input id='" + Id_Name_6 + @"' name='" + Id_Name_6 + @"' value ='" + DAL.Temp2.count[12, i] + @"' type=""text"" style=""text-align:right;font-size:14px;font-family:Microsoft JhengHei;""></td>";
                    }
                    TmpStr += @"</tr>";
                }
            }
            TmpStr += @"<tr class=""ShtRowTop"">
                                     <td class=""ShtCellCC"" colspan='" + Layer_Number + @"'></td>
                                     <td class=""ShtCellCC"" >合計</td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" >" + +Math.Round(Sum_1, 3, MidpointRounding.AwayFromZero) + @"</td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" align=""right"">" + Math.Round(Sum_2, 3, MidpointRounding.AwayFromZero) + @"</td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" align=""right"">" + Math.Round(Sum_3, 3, MidpointRounding.AwayFromZero) + @"</td>
                                     <td class=""ShtCellCC"" ></td>
                                     <td class=""ShtCellCC"" align=""right"">" + +Math.Round(Sum_4, 3, MidpointRounding.AwayFromZero) + @"</td>
                                     <td class=""ShtCellCC"" ></td>
                        </tr>";
            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int Result = 0;
            string Text_ID_1;
            string Text_ID_2;
            string Text_ID_3;
            string Text_ID_4;
            string Text_ID_5;
            for (int i = 1; i < DAL.Temp2.i; i++)
            {
                if (DAL.Temp2.count[4, i] == "" || DAL.Temp2.count[4, i] == " " || DAL.Temp2.count[4, i] == null)
                {

                }
                else
                {
                    Text_ID_1 = "Text_2_" + i.ToString();
                    Text_ID_2 = "Text_3_" + i.ToString();
                    Text_ID_3 = "Text_4_" + i.ToString();
                    Text_ID_4 = "Text_5_" + i.ToString();
                    Text_ID_5 = "Text_6_" + i.ToString();
                    string ComplexNumber_1 = Request.Form[Text_ID_1];
                    string ComplexPrice_1 = Request.Form[Text_ID_2];
                    string ComplexNumber_2 = Request.Form[Text_ID_3];
                    string ComplexPrice_2 = Request.Form[Text_ID_4];
                    string Note = Request.Form[Text_ID_5];
                    Result = DAL.OFundMode.OFundItemEdit_Update_1(Session["DatabaseName"].ToString(), Convert.ToInt32(DAL.Temp2.count[16, i]), Convert.ToDecimal(ComplexNumber_1), Convert.ToDecimal(ComplexPrice_1), Convert.ToDecimal(ComplexNumber_2), Convert.ToDecimal(ComplexPrice_2), Note);
                    Result = DAL.OFundMode.OFundItemEdit_Update_2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                }
            }
            if (Result == 1)
            {
                Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料儲存失敗！')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ShowDate();
        }
    }
}