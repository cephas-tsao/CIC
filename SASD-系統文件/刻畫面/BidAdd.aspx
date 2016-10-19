<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidAdd.aspx.cs" Inherits="BidAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">新增標案</strong></td>
	</tr>
	<tr>
		<td class="Table1">標案名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
		<span class="NoteText">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1">標案簡稱</td>
		<td class="Table2">
		<asp:TextBox id="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1">標案狀態</td>
		<td class="Table2">
		<asp:DropDownList id="DropDownList2" runat="server" CssClass="DDLfree">
            <asp:ListItem>-請選擇-</asp:ListItem>
            <asp:ListItem>已成案未領標</asp:ListItem>
            <asp:ListItem>已領標</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
		</asp:DropDownList>
		<span class="NoteText">(必選)</span></td>
	</tr>

	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeShort" Text="新增標案"/>
		&nbsp;
		<asp:Button id="Button2" runat="server" CssClass="BtnLargeShort" Text="回前頁"/>
		</td>
	</tr>
</table>
    </div>
    </form>
</body>
</html>
