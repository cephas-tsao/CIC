<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubBudgetAdd_3.aspx.cs" Inherits="SubBudgetAdd_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
    
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #B7FF4A;
            text-align: center;
            color: #000000;
            width: 59px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: right;
            color: #000000;
            width: 59px;
        }
    </style>
    
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
		<td class="TableTop2C" width="30%" rowspan="2">
                                    分包預算內容</td>
		<td class="TableTop2C">
                                執行預算</td>
		</tr>
		<tr>
		<td class="Table0" aria-orientation="horizontal">
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
                                分包工項</td>
		</tr>
		<tr>
		<td class="auto-style3">
                                    <table class="SB_Table_M">
                                        <tr class="SB_RowTop_M">
                                            <td>&nbsp;</td>
                                            <td>執行項次</td>
                                            <td>工項名稱</td>
                                            <td>單位</td>
                                            <td>數量</td>
                                            <td>預算單價</td>
                                            <td>預算複價</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button35" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCC">壹.一.3.1</td>
                                            <td class="ShtCellCL">
                                                                B2F-挑高模板支撐架</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">1,000</td>
                                            <td class="ShtCellCR">80</td>
                                            <td class="ShtCellCR">80,000</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button36" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCC">壹.一.4.2</td>
                                            <td class="ShtCellCL">
                                                                280kgf/cm2預拌混凝土材料</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">272</td>
                                            <td class="ShtCellCR">1,480</td>
                                            <td class="ShtCellCR">402,560</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button37" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCC">壹.一.9.1.2</td>
                                            <td class="ShtCellCL">
                                                                280kgf/cm2預拌混凝土材料</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">1,008</td>
                                            <td class="ShtCellCR">1,480</td>
                                            <td class="ShtCellCR">1,491,840</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCC">[全]</td>
                                            <td class="ShtCellCL">
                                                                預拌混凝土澆置工資</td>
                                            <td class="ShtCellCC">工</td>
                                            <td class="ShtCellCR">595.2</td>
                                            <td class="ShtCellCR">3,200</td>
                                            <td class="ShtCellCR">1,904,640</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC" colspan="6">&nbsp;</td>
                                            <td class="ShtCellCR">3,879,040</td>
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
                                                        <td class="ShtCellCC" colspan="5">項次</td>
                                                        <td class="ShtCellCC">工項名稱</td>
                                                        <td class="ShtCellCC">單位</td>
                                                        <td class="ShtCellCC">執行數量</td>
                                                        <td class="ShtCellCC">預算單價</td>
                                                        <td class="ShtCellCC">剩餘數量</td>
                                                        <td class="ShtCellCC">分包數量</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td align="center" colspan="5" class="ShtCellCC">
                                                            <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Text="壹"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            直接工程費</td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox49" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton73" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC"></td>
                                                        <td align="center" class="ShtCellCC" colspan="4">
                                                            <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Text="一"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            結構體工程</td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox50" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton172" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="3">1</td>
                                                        <td class="ShtCellCL">
                                                            放樣</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCR">45,435</td>
                                                        <td class="ShtCellCR">30</td>
                                                        <td class="ShtCellCR">45,435</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton173" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">2</td>
                                                        <td class="ShtCellCL">
                                                            建物四周防墜網</td>
                                                        <td class="ShtCellCC">
                                                            M</td>
                                                        <td class="ShtCellCR">2,760</td>
                                                        <td class="ShtCellCR">120</td>
                                                        <td class="ShtCellCR">2,760</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox30" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">建物東側防墬網</td>
                                                        <td class="ShtCellCC">M</td>
                                                        <td class="ShtCellCR">670</td>
                                                        <td class="ShtCellCR">120</td>
                                                        <td class="ShtCellCR">670</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox54" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton255" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">建物南側防墬網</td>
                                                        <td class="ShtCellCC">M</td>
                                                        <td class="ShtCellCR">710</td>
                                                        <td class="ShtCellCR">120</td>
                                                        <td class="ShtCellCR">710</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox55" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton256" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">建物西側防墬網</td>
                                                        <td class="ShtCellCC">M</td>
                                                        <td class="ShtCellCR">670</td>
                                                        <td class="ShtCellCR">120</td>
                                                        <td class="ShtCellCR">670</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox56" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton257" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">建物北側防墬網</td>
                                                        <td class="ShtCellCC">M</td>
                                                        <td class="ShtCellCR">710</td>
                                                        <td class="ShtCellCR">120</td>
                                                        <td class="ShtCellCR">710</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox57" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton258" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">3</td>
                                                        <td class="ShtCellCL">挑高模板支撐架</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">126,189</td>
                                                        <td class="ShtCellCR">80</td>
                                                        <td class="ShtCellCR">126,189</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox51" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton222" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">B2F-挑高模板支撐架</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">1,813</td>
                                                        <td class="ShtCellCR">80</td>
                                                        <td class="ShtCellCR">813</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox58" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton251" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">B1F-挑高模板支撐架</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">50,774</td>
                                                        <td class="ShtCellCR">80</td>
                                                        <td class="ShtCellCR">50,774</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox59" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton252" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">1F-挑高模板支撐架</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">36,801</td>
                                                        <td class="ShtCellCR">80</td>
                                                        <td class="ShtCellCR">36,801</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox60" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton253" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">2F-挑高模板支撐架</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">36,801</td>
                                                        <td class="ShtCellCR">80</td>
                                                        <td class="ShtCellCR">36,801</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox61" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton254" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">4</td>
                                                        <td class="ShtCellCL">廢水處理槽體--4000PSI預拌混凝土壓送</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">259</td>
                                                        <td class="ShtCellCR">1,653</td>
                                                        <td class="ShtCellCR">259</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox52" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton223" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">8</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox62" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton247" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">272</td>
                                                        <td class="ShtCellCR">1,480</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox63" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton248" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">5</td>
                                                        <td class="ShtCellCL">
                                                            防震區----3500PSI巨積預拌混凝土壓送</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">844</td>
                                                        <td class="ShtCellCR">1,858</td>
                                                        <td class="ShtCellCR">844</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox53" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton224" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">26.4</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox64" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton249" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">245kgf/cm2巨積預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">886</td>
                                                        <td class="ShtCellCR">1,675</td>
                                                        <td class="ShtCellCR">886</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox65" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton250" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">6</td>
                                                        <td class="ShtCellCL">
                                                            廢水處理槽體--鋼筋彎紮及組立SD420#4~#10</td>
                                                        <td class="ShtCellCC">
                                                            T</td>
                                                        <td class="ShtCellCR">20.8</td>
                                                        <td class="ShtCellCR">25,015</td>
                                                        <td class="ShtCellCR">20.8</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox32" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">鋼筋彎紮-工資</td>
                                                        <td class="ShtCellCC">T</td>
                                                        <td class="ShtCellCR">20.8</td>
                                                        <td class="ShtCellCR">3,100</td>
                                                        <td class="ShtCellCR">20.8</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox66" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton244" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">鋼筋SD420#4~#10-材料</td>
                                                        <td class="ShtCellCC">T</td>
                                                        <td class="ShtCellCR">21.8</td>
                                                        <td class="ShtCellCR">20,850</td>
                                                        <td class="ShtCellCR">21.8</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox67" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton245" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">廢水處理槽體-鋼筋雜項</td>
                                                        <td class="ShtCellCC">式</td>
                                                        <td class="ShtCellCR">1</td>
                                                        <td class="ShtCellCR">1,300</td>
                                                        <td class="ShtCellCR">1</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox68" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton246" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">7</td>
                                                        <td class="ShtCellCL">
                                                            防震區 回填砂底層H=30CM+四周W=15CM</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">136</td>
                                                        <td class="ShtCellCR">2,000</td>
                                                        <td class="ShtCellCR">136</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox31" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="3">8</td>
                                                        <td class="ShtCellCL">
                                                            預拌混凝土,140kgf/cm2,含澆置及搗實</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">1,131</td>
                                                        <td class="ShtCellCR">1,402</td>
                                                        <td class="ShtCellCR">1,131</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox34" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">B2F-140kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">48</td>
                                                        <td class="ShtCellCR">1,418</td>
                                                        <td class="ShtCellCR">48</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox69" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton239" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">1.5</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox70" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton240" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">140kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">51</td>
                                                        <td class="ShtCellCR">1,240</td>
                                                        <td class="ShtCellCR">51</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox71" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton241" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">B1F-140kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">581</td>
                                                        <td class="ShtCellCR">1,402</td>
                                                        <td class="ShtCellCR">581</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox72" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton242" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">8.8</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox73" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton243" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">140kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">295</td>
                                                        <td class="ShtCellCR">1,240</td>
                                                        <td class="ShtCellCR">295</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox74" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton238" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">1F-140kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">241</td>
                                                        <td class="ShtCellCR">1,401</td>
                                                        <td class="ShtCellCR">241</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox75" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton237" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">7.5</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox76" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton236" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">140kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">253</td>
                                                        <td class="ShtCellCR">1,240</td>
                                                        <td class="ShtCellCR">253</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox77" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton235" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">2F-140kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">251</td>
                                                        <td class="ShtCellCR">1,401</td>
                                                        <td class="ShtCellCR">251</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox78" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton234" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">7.5</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox79" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton233" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">140kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">253</td>
                                                        <td class="ShtCellCR">1,240</td>
                                                        <td class="ShtCellCR">253</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox80" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton232" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">9</td>
                                                        <td class="ShtCellCL">預拌混凝土,280kgf/cm2,含澆置及搗實</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">
                                                            17,149</td>
                                                        <td class="ShtCellCR">1,580</td>
                                                        <td class="ShtCellCR">17,149</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox33" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton181" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">1</td>
                                                        <td class="ShtCellCL">
                                                            B2F-280kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">1,008</td>
                                                        <td class="ShtCellCR">1,580</td>
                                                        <td class="ShtCellCR">1,008</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox35" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            &nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">
                                                            預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">
                                                            工</td>
                                                        <td class="ShtCellCR">31.5</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">
                                                            0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">1,008</td>
                                                        <td class="ShtCellCR">1,480</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox81" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton231" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">2</td>
                                                        <td class="ShtCellCL">
                                                            B1F-280kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCR">5,901</td>
                                                        <td class="ShtCellCR">1,580</td>
                                                        <td class="ShtCellCR">5,901</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox38" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">184</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox82" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton230" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">5,901</td>
                                                        <td class="ShtCellCR">1,480</td>
                                                        <td class="ShtCellCR">5,901</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox83" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton229" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">3</td>
                                                        <td class="ShtCellCL">1F-280kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCR">1,580</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox84" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton228" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">
                                                            預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">
                                                            工</td>
                                                        <td class="ShtCellCR">160</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox39" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCR">1,480</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox85" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton227" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="2">4</td>
                                                        <td class="ShtCellCL">2F-280kgf/cm2預拌混凝土</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCR">1,580</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox40" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">1</td>
                                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">工</td>
                                                        <td class="ShtCellCR">160</td>
                                                        <td class="ShtCellCR">3,200</td>
                                                        <td class="ShtCellCR">0</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox86" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton226" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowExecuteSoft">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">2</td>
                                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">M3</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCR">1,480</td>
                                                        <td class="ShtCellCR">5,120</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox87" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton225" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="4">
                                                            <asp:Label ID="Label41" runat="server" Font-Names="微軟正黑體" Text="三"></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCL">
                                                            泥水裝修工程</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCR">&nbsp;</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox47" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">1</td>
                                                        <td class="ShtCellCL">
                                                            庫版可拆式牆</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCR">254</td>
                                                        <td class="ShtCellCR">1,800</td>
                                                        <td class="ShtCellCR">254</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox41" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                        <td class="ShtCellCC" colspan="3">2</td>
                                                        <td class="ShtCellCL">
                                                            電梯坑1:2水泥砂漿粉光</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCR">238</td>
                                                        <td class="ShtCellCR">238</td>
                                                        <td class="ShtCellCR">238</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox42" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC"></td>
                                                        <td class="ShtCellCC" colspan="3">3</td>
                                                        <td class="ShtCellCL">
                                                            電梯機房地坪泡沫混凝土</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCR">410</td>
                                                        <td class="ShtCellCR">853</td>
                                                        <td class="ShtCellCR">410</td>
                                                        <td class="ShtCellCC">
                                                            <asp:TextBox ID="TextBox43" runat="server" CssClass="TBshort"></asp:TextBox>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton191" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_Resource" runat="server" Visible="False">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Sht50" valign="top">
                                                <table class="Sht100">
                                                    <tr class="ShtRowTop">
                                                        <td class="ShtCellCC">資源名稱</td>
                                                        <td class="ShtCellCC">單位</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            放樣</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton195" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            建物四周防墜網</td>
                                                        <td class="ShtCellCC">
                                                            M</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton52" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" BorderStyle="Dotted" OnClick="ImageButton52_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            挑高模板支撐架</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton201" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            預拌混凝土澆置工資</td>
                                                        <td class="ShtCellCC">
                                                            工</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton205" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            280kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton196" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            245kgf/cm2巨積預拌混凝土材料</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton209" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            鋼筋彎紮-工資</td>
                                                        <td class="ShtCellCC">
                                                            T</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton211" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            鋼筋SD420#4~#10-材料</td>
                                                        <td class="ShtCellCC">
                                                            T</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton212" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            廢水處理槽體-鋼筋雜項</td>
                                                        <td class="ShtCellCC">
                                                            式</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton213" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            防震區 回填砂底層H=30CM+四周W=15CM</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton214" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">
                                                            140kgf/cm2預拌混凝土材料</td>
                                                        <td class="ShtCellCC">
                                                            M3</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton218" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">
                                                            庫版可拆式牆</td>
                                                        <td class="ShtCellCC">
                                                            M2</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton219" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowSingle">
                                                        <td class="ShtCellCL">電梯坑1:2水泥砂漿粉光</td>
                                                        <td class="ShtCellCC">M2</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton220" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                    <tr class="ShtRowDouble">
                                                        <td class="ShtCellCL">電梯機房地坪泡沫混凝土</td>
                                                        <td class="ShtCellCC">M2</td>
                                                        <td class="ShtCellCC">
                                                            <asp:ImageButton ID="ImageButton221" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="50%" valign="top">
                                                <asp:Panel ID="Pnl_Source" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">資源名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                預拌混凝土澆置工資</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                工</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">總工程數量</td>
                                                            <td class="SB_Cell1R_A">595.2</td>
                                                            <td class="SB_Cell0C_A">預算單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                3,2000</td>
                                                            <td class="SB_Cell0C_A" colspan="2">
                                                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" AutoPostBack="True">
                                                                    <asp:ListItem Value="ALL" Selected="True">全資源分包</asp:ListItem>
                                                                    <asp:ListItem Value="Part">部分資源分包</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Panel ID="Pnl_List" runat="server" Visible="False">
                                                    
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">&nbsp;</td>
                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">
                                                                工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="auto-style1">工項數量</td>
                                                            <td class="SB_Cell0C_A">剩餘數量</td>
                                                            <td class="SB_Cell0C_A">分包數量</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox11" runat="server" Text=" " AutoPostBack="True" />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                壹.一.4.1</td>
                                                            <td class="SB_Cell1L_A">
                                                                預拌混凝土澆置工資</td>
                                                            <td class="SB_Cell1C_A">
                                                                工</td>
                                                            <td class="auto-style2">8</td>
                                                            <td class="auto-style2">0</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <tr>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:CheckBox ID="CheckBox18" runat="server" AutoPostBack="True" Text=" " />
                                                                </td>
                                                                <td class="SB_Cell1C_A">
                                                                    壹.一.5.1</td>
                                                                <td class="SB_Cell1L_A">
                                                                    預拌混凝土澆置工資</td>
                                                                <td class="SB_Cell1C_A">
                                                                    工</td>
                                                                <td class="auto-style2">26.4</td>
                                                                <td class="auto-style2">0</td>
                                                                <td class="SB_Cell1C_A">
                                                                    <asp:TextBox ID="TextBox91" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                </td>
                                                                <tr>
                                                                    <td class="SB_Cell1C_A">
                                                                        <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="True" Text=" " />
                                                                    </td>
                                                                    <td class="SB_Cell1C_A">壹.一.8.1.1</td>
                                                                    <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                    <td class="SB_Cell1C_A">工</td>
                                                                    <td class="auto-style2">1.5</td>
                                                                    <td class="auto-style2">0</td>
                                                                    <td class="SB_Cell1C_A">
                                                                        <asp:TextBox ID="TextBox92" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:CheckBox ID="CheckBox20" runat="server" AutoPostBack="True" Text=" " />
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">壹.一.8.2.1</td>
                                                                        <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                        <td class="SB_Cell1C_A">工</td>
                                                                        <td class="auto-style2">8.8</td>
                                                                        <td class="auto-style2">0</td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:TextBox ID="TextBox93" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <tr>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:CheckBox ID="CheckBox21" runat="server" AutoPostBack="True" Text=" " />
                                                                            </td>
                                                                            <td class="SB_Cell1C_A">壹.一.8.3.1</td>
                                                                            <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                            <td class="SB_Cell1C_A">工</td>
                                                                            <td class="auto-style2">7.5</td>
                                                                            <td class="auto-style2">0</td>
                                                                            <td class="SB_Cell1C_A">
                                                                                <asp:TextBox ID="TextBox94" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                            </td>
                                                                            <tr>
                                                                                <td class="SB_Cell1C_A">
                                                                                    <asp:CheckBox ID="CheckBox22" runat="server" AutoPostBack="True" Text=" " />
                                                                                </td>
                                                                                <td class="SB_Cell1C_A">壹.一.8.4.1</td>
                                                                                <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                                <td class="SB_Cell1C_A">工</td>
                                                                                <td class="auto-style2">7.5</td>
                                                                                <td class="auto-style2">0</td>
                                                                                <td class="SB_Cell1C_A">
                                                                                    <asp:TextBox ID="TextBox95" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                                </td>
                                                                                <tr>
                                                                                    <td class="SB_Cell1C_A">
                                                                                        <asp:CheckBox ID="CheckBox14" runat="server" Text=" " />
                                                                                    </td>
                                                                                    <td class="SB_Cell1C_A">壹.一.9.1.1</td>
                                                                                    <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                                    <td class="SB_Cell1C_A">工</td>
                                                                                    <td class="auto-style2">31.5</td>
                                                                                    <td class="auto-style2">0</td>
                                                                                    <td class="SB_Cell1C_A">
                                                                                        <asp:TextBox ID="TextBox21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </tr>
                                                                        </tr>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:CheckBox ID="CheckBox15" runat="server" Text=" " />
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">壹.一.9.2.1</td>
                                                                        <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                        <td class="SB_Cell1C_A">工</td>
                                                                        <td class="auto-style2">184</td>
                                                                        <td class="auto-style2">0</td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:TextBox ID="TextBox88" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:CheckBox ID="CheckBox16" runat="server" Text=" " />
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">壹.一.9.3.1</td>
                                                                        <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                        <td class="SB_Cell1C_A">工</td>
                                                                        <td class="auto-style2">160</td>
                                                                        <td class="auto-style2">0</td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:TextBox ID="TextBox89" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:CheckBox ID="CheckBox17" runat="server" Text=" " />
                                                                        </td>
                                                                        <td class="SB_Cell1C_A">壹.一.9.4.1</td>
                                                                        <td class="SB_Cell1L_A">預拌混凝土澆置工資</td>
                                                                        <td class="SB_Cell1C_A">工</td>
                                                                        <td class="auto-style2">160</td>
                                                                        <td class="auto-style2">0</td>
                                                                        <td class="SB_Cell1C_A">
                                                                            <asp:TextBox ID="TextBox90" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </tr>
                                                            </tr>
                                                        </tr>
                                                    </table>
                                                   </asp:Panel>
                                                    <asp:Button ID="Button23" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="存入分包工料" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Button24" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" />
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
