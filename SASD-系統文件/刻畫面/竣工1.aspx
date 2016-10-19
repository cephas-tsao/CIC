<%@ Page Language="C#" AutoEventWireup="true" CodeFile="竣工1.aspx.cs" Inherits="竣工1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">竣工數量填列</td>
		</tr>
		<tr>
		<td class="Table1L" width="50%">
                                    &nbsp;
                                <asp:ImageButton ID="ImageButton212" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存修改" Width="27px" />
                                &nbsp; 
                                    </td>
		<td class="Table1R">
                                &nbsp;<asp:ImageButton ID="ImageButton210" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton211" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                &nbsp; &nbsp;</td>
		</tr>
		</table>
    
                        <table border="1" class="Sht100">
                            <tr class="ShtRowTop">
                                <td colspan="3" rowspan="2" class="ShtCellCC">項次</td>
                                <td rowspan="2" class="ShtCellCC">工項名稱</td>
                                <td rowspan="2" class="ShtCellCC">單位</td>
                                <td rowspan="2" class="ShtCellCC">單價<br />
                                    分析</td>
                                <td rowspan="2" class="ShtCellCC">單價</td>
                                <td colspan="2" class="ShtCellCC">原合約預算</td>
                                <td colspan="2" class="ShtCellCC">末次變更後合約預算</td>
                                <td colspan="2" class="ShtCellCC">
                                    竣工結算</td>
                                <td class="ShtCellCC" rowspan="2">備註</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">複價</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td colspan="3" align="center" class="ShtCellCC">
                                    <asp:Label ID="Label238" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    發包工程費</td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox14" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 3px"></td>
                                <td class="ShtCellCC" colspan="2"  align="center">
                                    <asp:Label ID="Label240" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                  假設工程
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox15" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label242" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                   清除及掘除
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label244" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px"/>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label326" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label366" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label352" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label245" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBshort" dir="rtl">2000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label325" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="3,200"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label248" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label249" runat="server" Height="25px" Text="基地及路幅開挖，未含運費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label250" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC" align="center">
                                    <asp:ImageButton ID="ImageButton22" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label327" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label367" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label353" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox17" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2" align="center">
                                    <asp:Label ID="Label254" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label255" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox18" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label256" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                 構造物開挖，(含抽排水，依設計圖說計價線)
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label258" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton23" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label328" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label368" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label354" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox19" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label262" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label263" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label264" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton24" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label329" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label369" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label355" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label268" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label269" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label270" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton25" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label330" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label370" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label356" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label271" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label273" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label274" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label275" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label276" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton26" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label331" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label371" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label357" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label277" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label279" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label280" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label281" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label282" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton27" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label332" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label372" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label358" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label283" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label285" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2">
                                    <asp:Label ID="Label286" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label287" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label288" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label289" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label290" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton28" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label333" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label373" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label359" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label291" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label293" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label294" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label295" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label296" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton29" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label334" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label374" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label360" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label297" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label299" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label300" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label301" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label302" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton30" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label335" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label375" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label361" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label303" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label305" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                    </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label306" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                   花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label308" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton31" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label336" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label376" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label362" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label309" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label311" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label312" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label313" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label314" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton32" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label337" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label377" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label363" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label315" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label317" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox12" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label318" runat="server" Text="6" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label319" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label320" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton33" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label338" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label378" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label364" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label321" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label323" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox13" runat="server" CssClass="TBshort" dir="rtl"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td colspan="3" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label324" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label365" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                                </td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label216" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                            </tr>
                        </table>
    
                        <br />
    
    </div>
    </form>
</body>
</html>
