<%@ Page Language="C#" AutoEventWireup="true" CodeFile="請款1.aspx.cs" Inherits="請款1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 35px;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 35px;
        }
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop">業主請款單檢視</td>
            </tr>
            </table>
    
        
    
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="9">請款總覽</td>
            </tr>
            <tr>
                <td class="Table1">&nbsp;</td>
                <td class="Table1">請款期別</td>
                <td class="Table1">請款單號</td>
                <td class="Table1">估驗起始日期</td>
                <td class="Table1">估驗截止日期</td>
                <td class="Table1">請款日期</td>
                <td class="Table1">付款日期</td>
                <td class="Table1">實請金額</td>
                <td class="Table1">備註說明</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="明細" />
                </td>
                <td class="Table2CC">1</td>
                <td class="Table2CC">TC001A0001</td>
                <td class="Table2CC">2015/06/01</td>
                <td class="Table2CC">2015/06/30</td>
                <td class="Table2CC">2015/07/01</td>
                <td class="Table2CC">2015/07/10</td>
                <td class="Table2RC">1,953,000</td>
                <td class="Table2LC"></td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:Button ID="Button2" runat="server" CssClass="BtnFree" Text="明細" />
                </td>
                <td class="Table2CC">2</td>
                <td class="Table2CC">TC001A0002</td>
                <td class="Table2CC">2015/07/01</td>
                <td class="Table2CC">2015/07/31</td>
                <td class="Table2CC">2015/08/01</td>
                <td class="Table2CC">2015/08/10</td>
                <td class="Table2RC">903,000</td>
                <td class="Table2LC"></td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:Button ID="Button3" runat="server" CssClass="BtnFree" Text="明細" OnClick="Button3_Click" />
                </td>
                <td class="Table2CC">3</td>
                <td class="Table2CC">TC001A0003</td>
                <td class="Table2CC">2015/08/01</td>
                <td class="Table2CC">2015/08/31</td>
                <td class="Table2CC">2015/09/01</td>
                <td class="Table2CC">2015/09/10</td>
                <td class="Table2RC">903,000</td>
                <td class="Table2LC"></td>
            </tr>
        </table>
            <asp:Panel ID="Pnl_1" runat="server" Visible="False">
            
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="5">請款明細</td>
                <td class="Table0R">
                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                </td>
            </tr>
            <tr>
                <td class="Table1">請款單號</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle" >TC001A0003</asp:TextBox>
                </td>
                <td class="Table1">請款期別</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" >3</asp:TextBox>
                </td>
                <td class="Table1" rowspan="3">備註說明</td>
                <td class="Table2LC" rowspan="3">
                    <asp:TextBox ID="TextBox32" runat="server" CssClass="TBfree" Height="75px" TextMode="MultiLine" Width="220px"></asp:TextBox>
                </td>
            </tr>
       
                    <tr>
                        <td class="auto-style1">請款起算日期</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle" >2015/08/01</asp:TextBox>
                        </td>
                        <td class="Table1">請款截止日期</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" >2015/08/31</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">請款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle" >2015/09/01</asp:TextBox>
                        </td>
                        <td class="Table1">領款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" >2015/09/10</asp:TextBox>
                        </td>
                    </tr>
            
                    <tr>
                        <td class="Table1">原合約總價</td>
                        <td class="Table2R">
                            <asp:Label ID="Label1" runat="server" Text="10,000,000"></asp:Label>
                        </td>
                        <td class="Table1">末次變更版次</td>
                        <td class="Table2R">
                            4</td>
                        <td class="Table1">末次變更後合約總價</td>
                        <td class="Table2R">
                            13,000,000</td>
                    </tr>
                    <tr>
                        <td class="Table1">履約保證金</td>
                        <td class="Table2R">500,000</td>
                        <td class="Table1">預付款</td>
                        <td class="Table2R">10.00%</td>
                        <td class="Table1">保留款</td>
                        <td class="Table2R">10.00%</td>
                    </tr>
                </table>
                <table class="Table100">
                    <tr>
                        <td class="Table1" rowspan="2">項次</td>
                        <td class="Table1" rowspan="2">項目</td>
                        <td class="Table1" rowspan="2">前期累計(核撥)</td>
                        <td class="Table1" colspan="2">本期</td>
                        <td class="Table1" rowspan="2">至本期累計(核撥)</td>
                        <td class="Table1" rowspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table1">
                            請款</td>
                        <td class="Table1">核撥</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">1</td>
                        <td class="Table2LC">估驗金額</td>
                        <td class="Table2CC">1,920,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >960,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox37" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">960,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">2,880,000</td>
                        <td class="Table2CC">
                            <asp:Button ID="Button4" runat="server" CssClass="BtnFree" OnClick="Button4_Click" Text="估驗明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">2</td>
                        <td class="Table2LC">預付款(+)</td>
                        <td class="Table2CC">1,000,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox38" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">1,000,000</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">3</td>
                        <td class="Table2LC">扣回預付款(-)</td>
                        <td class="Table2CC">200,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle" dir="rtl" >100,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox39" runat="server" CssClass="TBmiddle" dir="rtl">100,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">300,000</td>
                        <td class="Table2CC"></td>
                    </tr>
                    <tr>
                        <td class="Table2CC">4</td>
                        <td class="Table2LC">到場材料(+)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox33" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox40" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">5</td>
                        <td class="Table2LC">扣除已請材料(-)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox41" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">6</td>
                        <td class="Table2LC">應請金額</td>
                        <td class="Table2CC">2,720,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox34" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >860,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox42" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">860,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            3,580,000</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">7</td>
                        <td class="Table2LC">營業稅</td>
                        <td class="Table2CC">136,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox35" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >43,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox43" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">43,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">179,000</td>
                        <td class="Table2CC">應請金額*<asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort" dir="rtl" Width="25px">5</asp:TextBox>
                            ％</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">8</td>
                        <td class="Table2LC">保留款(-)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox44" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            0</td>
                        <td class="Table2CC"></td>
                    </tr>
                    <tr>
                        <td class="Table2CC">9</td>
                        <td class="Table2LC">扣款/罰款(-)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox45" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            0</td>
                        <td class="Table2CC">
                            <asp:Button ID="Button10" runat="server" CssClass="BtnFree" OnClick="Button10_Click" Text="扣款明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">10</td>
                        <td class="Table2LC">加款(+)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox46" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:Button ID="Button11" runat="server" CssClass="BtnFree" OnClick="Button11_Click" Text="加款明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">11</td>
                        <td class="Table2LC">退還保留款(+)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox47" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">12</td>
                        <td class="Table2LC">物價指數補貼(+)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox48" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">13</td>
                        <td class="Table2LC">工程保險費(+)</td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox49" runat="server" CssClass="TBmiddle" dir="rtl">0</asp:TextBox>
                        </td>
                        <td class="Table2CC">0</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">14</td>
                        <td class="Table2LC">實請金額</td>
                        <td class="Table2CC">2,856,000</td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">903,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox50" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False">903,000</asp:TextBox>
                        </td>
                        <td class="Table2CC">3,759,000</td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
