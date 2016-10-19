<%@ Page Language="C#" AutoEventWireup="true" CodeFile="合預4-1.aspx.cs" Inherits="合預4_1" %>

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
			<td class="TableTop" colspan="7">合約預算變更</td>
		</tr>
		<tr>
		<td class="Table1L" width="40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/AddNewList.png" ToolTip="新增合約變更" Width="27px" PostBackUrl="~/CChangeSummaryA.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton175" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" PostBackUrl="~/CChangeAdd.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
		<td class="Table1">
                                原合約預算總價</td>
            <td class="Table2RC">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,117,881"></asp:Label>
            </td>
            <td class="Table1">
                追加減金額</td>
            <td class="Table2RC">
                <asp:Label ID="Label327" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="+2,250,610"></asp:Label>
            </td>
            <td class="Table1">
                變更後合約預算總價</td>
            <td class="Table2RC">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
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
                    <asp:ListItem Enabled="False" Selected="True">第4次變更設計</asp:ListItem>
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
                                <td class="ShtCellCC" rowspan="2">編輯</td>
                                <td class="ShtCellCC" colspan="3" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" colspan="3">原合約預算</td>
                                <td class="ShtCellCC" colspan="5">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummaryE.aspx">第4次變更設計</asp:HyperLink>
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
                                <td align="center" class="ShtCellCC">
                                    &nbsp;</td>
                                <td colspan="3" align="center" class="ShtCellCC">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                                <td class="ShtCellCC" style="width: 3px"></td>
                                <td class="ShtCellCC" colspan="2"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CChangeDetail.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label10" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label15" runat="server" Height="25px" Text="清除及掘除" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label19" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label73" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label218" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label11" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label16" runat="server" Height="25px" Text="基地及路幅開挖，未含運費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label20" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label146" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label219" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label13" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label21" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
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
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label232" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">業主變更及要求</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label237" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label220" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+28,500" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label25" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label26" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label27" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
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
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label233" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">工地需求，施工因素及工法變更</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label236" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label221" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="-609,000" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton181" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label29" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label149" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label136" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label222" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label33" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label35" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label223" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label37" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label38" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label39" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label224" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton184" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label43" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label44" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label45" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label152" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
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
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label234" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">設計圖面衝突</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label235" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Font-Size="Small">用量增減</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,819,913" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label47" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label48" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label49" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label51" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label155" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
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
                                <td class="ShtCellCL">
                                </td>
                                <td class="ShtCellCL">
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label55" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label56" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label57" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label156" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label59" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label60" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label61" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label157" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" align="center">
                                    <asp:Label ID="Label63" runat="server" Text="6" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label64" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label65" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label158" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label145" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label230" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td class="ShtCellCC" colspan="3">貳</td>
                                <td class="ShtCellCL">
                                    勞工安全衛生費</td>
                                <td class="ShtCellCC">
                                    式</td>
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
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellChange">
                                    +11,197</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                            </tr>
                            </table>
    
    </div>
    </form>
</body>
</html>
