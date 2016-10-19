<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發1_3.aspx.cs" Inherits="採發1_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="5">新增分包預算</td>
		</tr>
		<tr>
		<td class="Table1" width="40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td class="Table1">
                                執行預算總價</td>
            <td class="Table2C">
                <asp:Label ID="Label462" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
            </td>
            <td class="Table1">
                已分包預算總價</td>
            <td class="Table2C">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="8,111,222"></asp:Label>
            </td>
		</tr>
		</table>
        <table class="Table100">
		<tr>
		<td class="Table1" width="30%" rowspan="2">
                                    分包預算內容</td>
		<td class="Table1">
                                執行預算</td>
		</tr>
		<tr>
		<td class="Table1L" aria-orientation="horizontal">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem>依執行預算工作項目選擇</asp:ListItem>
                                    <asp:ListItem>依執行預算資源項目選擇</asp:ListItem>
                                </asp:RadioButtonList>
                                </td>
		</tr>
		<tr>
		<td class="Table2C" valign="top">
    
        <table style="width: 100%">
        <tr>
		<td class="Table0" colspan="2">
                                分包資訊</td>
		</tr>
		<tr>
		<td class="Table1">
                                分包預算編號</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                分包預算名稱</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                承攬方式</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="RadioButtonList1" runat="server" CssClass="DDLshort">
                                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                                        <asp:ListItem>實做實算</asp:ListItem>
                                                        <asp:ListItem>總價承攬</asp:ListItem>
                                                        <asp:ListItem>實做+總價</asp:ListItem>
                                                        <asp:ListItem>統包</asp:ListItem>
                                                        <asp:ListItem>其他</asp:ListItem>
                                                    </asp:DropDownList>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                採購負責人</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="DepartmentName" DataValueField="DepartmentName"  CssClass="DDLshort" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                                        <asp:ListItem>-請選擇部門-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
                                                    <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name"  CssClass="DDLshort">
                                                        <asp:ListItem>-請選擇部門人員-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList7" Name="Department" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                預定進場日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                預定完成發包日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                最遲完成發包期限</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="Table0">
                                分包工料</td>
		</tr>
		<tr>
		<td class="auto-style3">
                                    <table class="SB_Table_M">
                                        <tr class="SB_RowTop_M">
                                            <td>&nbsp;</td>
                                            <td>工項/工料名稱</td>
                                            <td>單位</td>
                                            <td>所屬工項</td>
                                            <td>數量</td>
                                            <td>預算單價</td>
                                            <td>預算複價</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button35" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">結構用混凝土，預拌，175kgf/cm2，第1型水泥</td>
                                            <td class="ShtCellCC">
                                                                <asp:Label ID="Label707" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M3"></asp:Label>
                                                            </td>
                                            <td class="ShtCellCL">[全工項發包]</td>
                                            <td class="ShtCellCR">100.00</td>
                                            <td class="ShtCellCR">3,170.00</td>
                                            <td class="ShtCellCR">317,000.00</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button39" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</td>
                                            <td class="ShtCellCC">
                                                                M</td>
                                            <td class="ShtCellCL">壹.一.1.1.清除及掘除-機具</td>
                                            <td class="ShtCellCR">100.00</td>
                                            <td class="ShtCellCR">200.00</td>
                                            <td class="ShtCellCR">20,000.00</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button40" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">推土機，140~149KW</td>
                                            <td class="ShtCellCC">
                                                                時</td>
                                            <td class="ShtCellCL">壹.一.1.1.清除及掘除-機具</td>
                                            <td class="ShtCellCR">2.016</td>
                                            <td class="ShtCellCR">1,606.50</td>
                                            <td class="ShtCellCR">3,238.704</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button41" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">混凝土作業工</td>
                                            <td class="ShtCellCC">
                                                                工</td>
                                            <td class="ShtCellCL">[全資源發包]</td>
                                            <td class="ShtCellCR">47.2</td>
                                            <td class="ShtCellCR">2,200.00</td>
                                            <td class="ShtCellCR">103,840.000</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC" colspan="6">合計</td>
                                            <td class="ShtCellCR">x,xxx.xxx</td>
                                        </tr>
                                    </table>
                                                    </td>
		</tr>
		<tr>
		<td class="Table1">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增分包預算" PostBackUrl="~/採發1.aspx" CssClass="BtnLargeMedium" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="全部清空" CssClass="BtnLargeMedium" />
                                </td>
		</tr>
		</table>
    
                                                    </td>
		<td class="Table2C" valign="top">
                                <asp:Panel ID="Pnl_WBS" runat="server" Visible="False">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Sht50" valign="top">
                                                <table class="Sht100">
                                                    <tr class="ShtRowTop">
                                                        <td class="ShtCellCC" colspan="4">項次</td>
                                                        <td class="ShtCellCC">工項名稱</td>
                                                        <td class="ShtCellCC">單位</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td align="center" colspan="4" class="ShtCellCC">
                                                            <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Text="壹"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Height="25px" Text="發包工程費"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton73" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC" style="width: 3px"></td>
                                                        <td align="center" class="ShtCellCC" colspan="3">
                                                            <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Text="一"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label14" runat="server" Font-Names="微軟正黑體" Height="25px" Text="假設工程"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton74" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label19" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton75" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td align="center" class="ShtCellCC">1.1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label260" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除-機具"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label258" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton76" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton25" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" OnClick="ImageButton25_Click" BorderStyle="Dotted" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td align="center" class="ShtCellCC">1.2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除-人力"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton77" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton26" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Height="25px" Text="基地及路幅開挖，未含運費"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label20" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton78" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton79" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td align="center" class="ShtCellCC" colspan="3">
                                                            <asp:Label ID="Label12" runat="server" Font-Names="微軟正黑體" Text="二"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label17" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構體工程"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton113" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label21" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton80" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton81" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label26" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label27" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton82" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton83" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label30" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label31" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton84" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" BorderStyle="Dotted" OnClick="ImageButton84_Click" />
                                                            <asp:ImageButton ID="ImageButton85" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label34" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label35" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton112" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">4.1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label268" runat="server" Font-Names="微軟正黑體" Height="25px" Text="B1-鋼筋"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label269" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton86" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton87" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">4.2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label463" runat="server" Font-Names="微軟正黑體" Height="25px" Text="1F-鋼筋"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label464" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton88" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton89" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">4.3</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label465" runat="server" Font-Names="微軟正黑體" Height="25px" Text="2F-鋼筋"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label466" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton90" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton91" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">5</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label38" runat="server" Font-Names="微軟正黑體" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label39" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton111" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">5.1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label262" runat="server" Font-Names="微軟正黑體" Height="25px" Text="B1-普通模板"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label263" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton92" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton93" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">5.2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label264" runat="server" Font-Names="微軟正黑體" Height="25px" Text="1F-普通模板"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton94" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton95" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteDeep">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">5.3</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label266" runat="server" Font-Names="微軟正黑體" Height="25px" Text="2F-普通模板"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton96" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton97" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">
                                                            <asp:Label ID="Label41" runat="server" Font-Names="微軟正黑體" Text="三"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label42" runat="server" Font-Names="微軟正黑體" Height="25px" Text="建築門窗工程"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton110" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label44" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label45" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton98" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton99" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label48" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，還原磚，250x250mm"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label49" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton100" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton101" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label52" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label53" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton102" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton103" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label56" runat="server" Font-Names="微軟正黑體" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label57" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton104" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton105" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">5</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label60" runat="server" Font-Names="微軟正黑體" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label61" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton106" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton107" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">6</td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label64" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label65" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton108" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton109" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="Sht50" valign="top">
                                                <asp:Panel ID="Pnl_Analysis" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label467" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清除及掘除"></asp:Label>
                                                                -機具</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M2"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">分析數量</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="10,000"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項數量</td>
                                                            <td class="SB_Cell1R_A">1,680</td>
                                                            <td class="SB_Cell0C_A">工項單價</td>
                                                            <td class="SB_Cell1R_A">16.00</td>
                                                            <td class="SB_Cell0C_A" colspan="2">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">&nbsp;</td>
                                                            <td class="SB_Cell0C_A">種類</td>
                                                            <td class="SB_Cell0C_A">工料項目名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工率</td>
                                                            <td class="SB_Cell0C_A">執行單價</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" " OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" BorderStyle="Dotted" />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label212" runat="server" Font-Size="Medium" Height="25px" Width="50px">拆工拆料項</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="Label469" runat="server" Font-Size="Medium" Height="25px">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label66" runat="server" Font-Size="Medium" Height="25px" Width="50px">M</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label68" runat="server" Font-Size="Medium" Height="25px" Width="100px">1,000.000</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label221" runat="server" Font-Size="Medium" Height="25px">200.00</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                168.000</td>
                                                            <td class="SB_Cell1R_A">68.000</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <tr>
                                                                <td class="SB_Cell2C_A">
                                                                    <asp:CheckBox ID="CheckBox7" runat="server" Text=" " />
                                                                </td>
                                                                <td class="SB_Cell2C_A">
                                                                    <asp:Label ID="Label491" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell2L_A">
                                                                    <asp:Label ID="Label492" runat="server" Font-Size="Medium" Height="25px">推土機，140~149KW</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell2C_A">
                                                                    <asp:Label ID="Label493" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell2R_A">0.012</td>
                                                                <td class="SB_Cell2R_A">
                                                                    <asp:Label ID="Label498" runat="server" Font-Size="Medium" Height="25px">1,606.50</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell2R_A">2.016</td>
                                                                <td class="SB_Cell2R_A">0.816</td>
                                                                <td class="SB_Cell2C_A">
                                                                    <asp:TextBox ID="TextBox9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                </td>
                                                                <tr>
                                                                    <td class="SB_Cell2C_A">
                                                                        <asp:CheckBox ID="CheckBox8" runat="server" Text=" " />
                                                                    </td>
                                                                    <td class="SB_Cell2C_A">
                                                                        <asp:Label ID="Label495" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                                                    </td>
                                                                    <td class="SB_Cell2L_A">
                                                                        <asp:Label ID="Label497" runat="server" Font-Size="Medium" Height="25px">傾卸貨車，總重21t~21.9t，8L.M3</asp:Label>
                                                                    </td>
                                                                    <td class="SB_Cell2C_A">
                                                                        <asp:Label ID="Label496" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                                                    </td>
                                                                    <td class="SB_Cell2R_A">
                                                                        0.012</td>
                                                                    <td class="SB_Cell2R_A">
                                                                        <asp:Label ID="Label499" runat="server" Font-Size="Medium" Height="25px">481.95</asp:Label>
                                                                    </td>
                                                                    <td class="SB_Cell2R_A">
                                                                        2.016</td>
                                                                    <td class="SB_Cell2R_A">0.816</td>
                                                                    <td class="SB_Cell2C_A">
                                                                        <asp:TextBox ID="TextBox10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:Label ID="Label213" runat="server" Font-Size="Medium" Height="25px" Width="50px">連工帶料項</asp:Label>
                                                                        </td>
                                                                        <td class="SB_Cell1L_A">
                                                                            <asp:Label ID="Label25" runat="server" Font-Size="Medium" Height="25px">棄土區費用(含水土保持)</asp:Label>
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:Label ID="Label470" runat="server" Font-Size="Medium" Height="25px" Width="50px">M3</asp:Label>
                                                                        </td>
                                                                        <td class="SB_Cell1R_A">
                                                                            <asp:Label ID="Label28" runat="server" Font-Size="Medium" Height="25px" Width="100px">1,200.000</asp:Label>
                                                                        </td>
                                                                        <td class="SB_Cell1R_A">
                                                                            <asp:Label ID="Label240" runat="server" Font-Size="Medium" Height="25px" Width="40px">50.00</asp:Label>
                                                                        </td>
                                                                        <td class="SB_Cell1R_A">
                                                                            201.600</td>
                                                                        <td class="SB_Cell1R_A">201.600</td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:TextBox ID="TextBox11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <tr>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:CheckBox ID="CheckBox3" runat="server" Text=" " BorderStyle="Dotted" />
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label214" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1L_A">
                                                                                <asp:Label ID="Label473" runat="server" Font-Size="Medium" Height="25px">推土機，140~149KW</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label32" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label36" runat="server" Font-Size="Medium" Height="25px" Width="100px">12.000</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label222" runat="server" Font-Size="Medium" Height="25px">1,606.50</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                2.016</td>
                                                                            <td class="SB_Cell1R_A">0</td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:TextBox ID="TextBox12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label215" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1L_A">
                                                                                <asp:Label ID="Label111" runat="server" Font-Size="Medium" Height="25px">裝料機，膠輪式，1.50~1.59m3</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label211" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label476" runat="server" Font-Size="Medium" Height="25px" Width="82px">12.000</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label223" runat="server" Font-Size="Medium" Height="25px">832.00</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                2.016</td>
                                                                            <td class="SB_Cell1R_A">2.016</td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:TextBox ID="TextBox13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label216" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1L_A">
                                                                                <asp:Label ID="Label6" runat="server" Font-Size="Medium" Height="25px">傾卸貨車，總重21t~21.9t，8L.M3</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label7" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label479" runat="server" Font-Size="Medium" Height="25px" Width="100px">60.000</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label224" runat="server" Font-Size="Medium" Height="25px">481.95</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                10.080</td>
                                                                            <td class="SB_Cell1R_A">10.080</td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:TextBox ID="TextBox14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label220" runat="server" Font-Size="Medium" Height="25px" Width="40px">雜項</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1L_A">
                                                                                <asp:Label ID="Label490" runat="server" Font-Size="Medium" Height="25px">工具損耗</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:Label ID="Label33" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label37" runat="server" Font-Size="Medium" Height="25px" Width="59px">1.000</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                <asp:Label ID="Label228" runat="server" Font-Size="Medium" Height="25px">7,525.00</asp:Label>
                                                                            </td>
                                                                            <td class="SB_Cell1R_A">
                                                                                0.168</td>
                                                                            <td class="SB_Cell1R_A">0.168</td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:TextBox ID="TextBox15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </tr>
                                                                </tr>
                                                            </tr>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="存入分包工料" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" />
                                                </asp:Panel>
                                                <asp:Panel ID="Pnl_ItemPack" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="Label643" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label603" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M3"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell1R_A">
                                                                80.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項數量</td>
                                                            <td class="SB_Cell1R_A">180.00</td>
                                                            <td class="SB_Cell0C_A">工項單價</td>
                                                            <td class="SB_Cell1R_A" colspan="3">3,170.00</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TextBox22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="Button25" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" PostBackUrl="~/採發1-1.aspx" Text="存入分包工料" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Button26" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_Resource" runat="server">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Sht50" valign="top">
                                                <table class="Sht100">
                                                    <tr class="ShtRowTop">
                                                        <td class="ShtCellCC">資源編碼</td>
                                                        <td class="ShtCellCC">資源名稱</td>
                                                        <td class="ShtCellCC">單位</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label591" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工警告燈號，定光燈號，裝拆"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton114" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton43" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label108" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0156403102"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label127" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton116" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton117" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label109" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02240A0003"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Height="25px" Text="袪水，擋抽排水"></asp:Label>
                                                        </td>
                                                        <td align="center" class="ShtCellCC">
                                                            <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton118" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton119" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label110" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02323A0003"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Height="25px" Text="棄土區費用(含水土保持)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton120" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton121" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label592" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0339000004"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label91" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土養護"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label130" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton122" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton123" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label112" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label593" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton124" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton125" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002421501"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Height="25px" Text="裝料機，膠輪式，1.50~1.59m3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton126" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton127" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label114" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002600004"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土泵"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton128" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton129" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000003421801"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Height="25px" Text="傾卸貨車，總重21t~21.9t，8L.M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton130" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000004417901"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton115" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" BorderStyle="Dotted" OnClick="ImageButton115_Click" />
                                                            <asp:ImageButton ID="ImageButton52" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" OnClick="ImageButton52_Click" BorderStyle="Dotted" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005100602"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Height="25px" Text="操作手，年資6~10年"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton133" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005P00002"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Height="25px" Text="模版安裝工"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton134" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton135" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label172" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000006900002"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label173" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土作業工"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label174" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton136" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" BorderStyle="Dotted" OnClick="ImageButton136_Click" />
                                                            <asp:ImageButton ID="ImageButton137" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label180" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0258012134"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label181" runat="server" Font-Names="微軟正黑體" Height="25px" Text="注油電桿，杉木，雜酚油，三級，L=6.5M"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label182" runat="server" Font-Names="微軟正黑體" Text="支"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton140" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton141" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label118" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050421A3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label99" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，140kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton142" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton143" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label184" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050431A3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，175kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label186" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton144" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton145" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label119" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0321030005"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label100" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼筋，SD280"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton146" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton147" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110a001A"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label101" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門框，烤漆選色"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton148" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton149" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label188" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110b002A"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label189" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門扇，45db，烤漆選色"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label190" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton150" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton151" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label192" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08710E0008"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label193" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，門五金，不鏽鋼天地栓"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label194" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton152" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton153" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label196" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0871150008"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label197" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，標準門鉸鏈，自動歸位型"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label198" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton154" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton155" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label200" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M088100130A"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label201" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，玻璃，平面，t=3mm"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label202" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton156" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton157" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label204" runat="server" Font-Names="微軟正黑體" Height="25px">M093103C00A</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label205" runat="server" Font-Names="微軟正黑體" Height="25px">產品，瓷磚，(瓷質壁磚，一級品)，200x200mm</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label206" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton158" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton159" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label208" runat="server" Font-Names="微軟正黑體" Height="25px">M093412304A</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label209" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label210" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton160" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton161" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label595" runat="server" Font-Names="微軟正黑體" Height="25px">M09341r400A</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label596" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，還原磚，250x250mm</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label597" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton162" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton163" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Height="25px">M096342304A</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label103" runat="server" Font-Names="微軟正黑體" Height="25px">產品，花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label141" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton164" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton165" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Height="25px">W0127116004</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label104" runat="server" Font-Names="微軟正黑體" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton166" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton167" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Height="25px">W0127120004</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Height="25px">工具損耗</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton168" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton169" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Height="25px">W0127130004</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="Label107" runat="server" Font-Names="微軟正黑體" Height="25px">運雜費</asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton170" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" />
                                                            <asp:ImageButton ID="ImageButton171" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="50%" valign="top">
                                                <asp:Panel ID="Pnl_SourceList" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">資源名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="Label601" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label551" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="時"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">總工程用量</td>
                                                            <td class="SB_Cell1R_A">281.25</td>
                                                            <td class="SB_Cell0C_A">資源單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="661.50"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A" colspan="2">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">&nbsp;</td>
                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox11" runat="server" Text=" " OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label553" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.一.2</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="Label554" runat="server" Font-Size="Medium" Height="25px">基地及路幅開挖，未含運費</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label555" runat="server" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">200.00</td>
                                                            <td class="SB_Cell1R_A">200.00</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <tr>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:CheckBox ID="CheckBox14" runat="server" Text=" " />
                                                                </td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label600" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.二.1</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1L_A">
                                                                    <asp:Label ID="Label567" runat="server" Font-Size="Medium" Height="25px">構造物開挖，(含抽排水，依設計圖說計價線)</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label568" runat="server" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1R_A">81.25</td>
                                                                <td class="SB_Cell1R_A">81.25</td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:TextBox ID="TextBox21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </tr>
                                                        </tr>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="Button23" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="存入分包工料" PostBackUrl="~/採發1_4.aspx" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Button24" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" />
                                                </asp:Panel>
                                                <asp:Panel ID="Pnl_SourcePack" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">資源名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="Label704" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土作業工"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label687" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="工"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">總工程用量</td>
                                                            <td class="SB_Cell1R_A">47.20</td>
                                                            <td class="SB_Cell0C_A">資源單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label688" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="2,200.00"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A" colspan="2">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label689" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.二.2</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="Label690" runat="server" Font-Size="Medium" Height="25px">結構用混凝土，預拌，140kgf/cm2，第1型水泥</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label691" runat="server" Font-Size="Medium" Height="25px" Width="50px">M3</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">40.00</td>
                                                            <td class="SB_Cell1R_A">40.00</td>
                                                        </tr>
                                                            <tr>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label692" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.二.3</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1L_A">
                                                                    <asp:Label ID="Label693" runat="server" Font-Size="Medium" Height="25px">結構用混凝土，預拌，175kgf/cm2，第1型水泥</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label694" runat="server" Font-Size="Medium" Height="25px" Width="50px">M3</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1R_A">7.20</td>
                                                                <td class="SB_Cell1R_A">7.20</td>
                                                            </tr>
                                                    </table>
                                                    <asp:Button ID="Button27" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全資源存入分包工料" />
                                                </asp:Panel>
                                                <asp:Panel ID="Pnl_SourcePack1" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">資源名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="Label695" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label696" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="時"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">總工程用量</td>
                                                            <td class="SB_Cell1R_A">281.25</td>
                                                            <td class="SB_Cell0C_A">資源單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="Label697" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="661.50"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A" colspan="2">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label698" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.一.2</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="Label699" runat="server" Font-Size="Medium" Height="25px">基地及路幅開挖，未含運費</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="Label700" runat="server" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">200.00</td>
                                                            <td class="SB_Cell1R_A">100.00</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label701" runat="server" Font-Size="Medium" Height="25px" Width="50px">壹.二.1</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1L_A">
                                                                    <asp:Label ID="Label702" runat="server" Font-Size="Medium" Height="25px">構造物開挖，(含抽排水，依設計圖說計價線)</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:Label ID="Label703" runat="server" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:Label>
                                                                </td>
                                                                <td class="SB_Cell1R_A">81.25</td>
                                                                <td class="SB_Cell1R_A">50.00</td>
                                                            </tr>
                                                        </table>
                                                    <asp:Button ID="Button28" runat="server" Enabled="False" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="此資源已有其他分包，無法進行全資源分包" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
            </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
