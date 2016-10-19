<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CBudgetView.aspx.cs" Inherits="CBudgetView" %>

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
    
        <br />
    
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="7">合約預算檢視</td>
		</tr>
		<tr>
		<td class="Table1L" width="30%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
		<td class="Table1">
                                原合約預算總價</td>
            <td class="Table2RC">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,198,470"></asp:Label>
            </td>
            <td class="Table1">
                追加減金額</td>
            <td class="Table2RC">
                <asp:Label ID="Label327" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="+2,250,610"></asp:Label>
            </td>
            <td class="Table1">
                變更後合約預算總價</td>
            <td class="Table2RC">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,449,080"></asp:Label>
            </td>
		</tr>
		</table>
    
        <table class="Table100">
		<tr>
		<td class="Table1">
                                    選擇顯示之變更次別</td>
            <td class="Table2LC">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Enabled="False" Selected="True">原合約預算</asp:ListItem>
                    <asp:ListItem>第1次變更設計</asp:ListItem>
                    <asp:ListItem>第2次變更設計</asp:ListItem>
                    <asp:ListItem>第3次變更設計</asp:ListItem>
                    <asp:ListItem Selected="True">第4次變更設計</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td class="Table1" rowspan="2">
                                    <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="重新載入" PostBackUrl="~/合預4-3.aspx" />
                                </td>
		</tr>
		<tr>
		<td class="Table1">
                                    選擇顯示之欄位</td>
            <td class="Table2LC">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">數量</asp:ListItem>
                    <asp:ListItem Selected="True">單價</asp:ListItem>
                    <asp:ListItem Selected="True">複價(含總價)</asp:ListItem>
                    <asp:ListItem Selected="True">責任歸屬</asp:ListItem>
                    <asp:ListItem Selected="True">原因</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		</table>
    
                        <table class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" colspan="3" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" rowspan="2">單價分析</td>
                                <td class="ShtCellCC" colspan="3">原合約預算</td>
                                <td class="ShtCellCC" colspan="5">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第4次變更設計</asp:HyperLink>
                                </td>
                                <td class="ShtCellCC" rowspan="2">變更設計<br />
                                    追加減金額</td>
                                <td class="ShtCellCC" rowspan="2">備註</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">責任歸屬</td>
                                <td class="ShtCellCC">原因</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td colspan="3" align="center" class="ShtCellCC">
                                    <asp:Label ID="Label238" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label239" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 3px"></td>
                                <td class="ShtCellCC" colspan="2"  align="center">
                                    <asp:Label ID="Label240" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label241" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label242" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label243" runat="server" Height="25px" Text="清除及掘除" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label244" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label245" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label246" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label177" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label178" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label218" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label252" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label180" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label181" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label182" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label219" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label256" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label257" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label258" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton23" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label260" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label183" runat="server" Font-Names="微軟正黑體" Text="4,000" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label184" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">152,000</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label232" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">業主變更及要求</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label237" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label220" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+28,500" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label266" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label186" runat="server" Font-Names="微軟正黑體" Text="800" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label187" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label188" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">2,436,000</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label233" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">工地需求，施工因素及工法變更</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label236" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label221" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="-609,000" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label271" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label272" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label273" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label189" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label190" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label191" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label222" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label277" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label278" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label279" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label192" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label193" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label194" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label223" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label283" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label284" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label285" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label195" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label196" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label197" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label224" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2">
                                    <asp:Label ID="Label286" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label287" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                    <strong><span lang="EN-US" style="font-size:12.0pt;
mso-bidi-font-size:11.0pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;
mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA;font-weight:normal;
mso-bidi-font-weight:bold">CBudget_WBS.ItemKind=formula</span></strong></td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label291" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label292" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label293" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label198" runat="server" Font-Names="微軟正黑體" Text="30" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label199" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label200" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">3,130,770</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label234" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">設計圖面衝突</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    <asp:Label ID="Label235" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,819,913" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label297" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label298" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label299" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label201" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label202" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label203" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label303" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label304" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label305" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label204" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label205" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label206" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                </td>
                                <td class="ShtCellTL">
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label306" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label308" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton31" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label309" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label310" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label311" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label207" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label208" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label209" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label315" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label316" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label317" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label210" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label211" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label212" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
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
                                    <asp:Label ID="Label321" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label322" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label323" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label213" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label214" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label215" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label230" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td colspan="3" class="ShtCellCC">
                                    <asp:Label ID="Label325" runat="server" Text="貳" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    勞工安全衛生費</td>
                                <td class="ShtCellCC">
                                    式</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    1</td>
                                <td class="ShtCellCR">
                                    80,589</td>
                                <td class="ShtCellCR">
                                    80,589</td>
                                <td class="ShtCellCR">
                                    1</td>
                                <td class="ShtCellChange">
                                    91,786</td>
                                <td class="ShtCellChange">
                                    91,786</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellTL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label326" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+11,197" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    發包工程費*0.5%</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td colspan="3">&nbsp;</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label324" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label216" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,198,470</asp:Label>
                                </td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label217" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">18,449,080</asp:Label>
                                </td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellTL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label231" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,250,610" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                        </table>
    
    </div>
    </form>
</body>
</html>
