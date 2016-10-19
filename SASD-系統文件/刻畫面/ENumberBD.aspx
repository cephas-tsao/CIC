<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ENumberBD.aspx.cs" Inherits="ENumberBD" %>

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
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 24px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="TableTop">執行預算-拆數量</td>
		</tr>
        <tr>
			<td class="Table2C">
        <table style="width: 100%">
		    <tr>
		<td class="Table1">
                                變更次別</td>
            <td class="Table2CC">
                                    <asp:Label ID="Label182" runat="server" Text="0" ForeColor="Red"></asp:Label>
            </td>
            <td class="Table1L" colspan="7">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="TableTop2" colspan="9">
                                上層工項(拆數量母項)</td>
		</tr>
		<tr>
		<td class="Table1">
                                項次</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="Label174" runat="server" Text="3"></asp:Label>
            </td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2" colspan="5">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="auto-style1">
                單位</td>
            <td class="auto-style2" colspan="2">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="auto-style1">
                合約數量</td>
            <td class="auto-style2">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
            <td class="auto-style1">
                                    執行數量</td>
            <td class="auto-style2">
                                    65.5</td>
            <td class="auto-style1">
                單價</td>
            <td class="auto-style2">
                                    3,170</td>
		</tr>
		<tr>
		<td class="TableTop2" colspan="9">
                                下層工項(拆數量子項)</td>
		</tr>
		<tr>
		<td class="Table2C" colspan="9">
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">&nbsp;</td>
                                        <td class="ShtCellCC">工項名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">數量</td>
                                    </tr>
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong">B1F-175混凝土</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem Selected="True">M3</asp:ListItem>
                                                <asp:ListItem>式</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort">35.5</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="ShtRowDouble">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton191" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBlong">1F-175混凝土</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem Selected="True">M3</asp:ListItem>
                                                <asp:ListItem>式</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort">30</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
            </td>
		</tr>
		<tr>
		<td class="Table2R" colspan="9">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增子項" Width="27px" PostBackUrl="~/ENumberBD_1.aspx" />
                                            </td>
		</tr>
		</table>
            </td>
		</tr>
        <tr>
			<td class="Table1">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" PostBackUrl="~/執預1.aspx" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預1.aspx" />
                                </td>
		</tr>
		    </table>
    
    </div>
    </form>
</body>
</html>
