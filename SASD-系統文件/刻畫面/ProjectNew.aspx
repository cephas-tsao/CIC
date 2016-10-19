<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectNew.aspx.cs" Inherits="ProjectNew" %>

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
                <td class="TableTop">新增專案</td>
            </tr>
            <tr>
                <td class="Table1L">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="1">新增空白專案</asp:ListItem>
                        <asp:ListItem Value="2">由標案轉入</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_1" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="2">&nbsp; 新增空白專案</td>
                </tr>
                <tr>
                <td class="Table1">專案(工程)編號</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong"></asp:TextBox>
		            <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)名稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TBlong"></asp:TextBox>
                    <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)簡稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TBlong"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1">備註</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="TBlong" Height="100px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" PostBackUrl="~/ProjectInfoM.aspx" Text="確定新增" />
&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
                </td>
            </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Pnl_2" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="2">&nbsp; 由標案轉入</td>
                </tr>
                <tr>
		<td class="Table1">選擇標案</td>
		<td class="Table2">
		<asp:DropDownList id="DropDownList1" AppendDataBoundItems="true" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID">
		    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>
		<span class="NoteText">(必選)</span></td>
	</tr>
	<tr>
		<td class="Table1">專案(工程)編號</td>
	    <td class="Table2">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="TBlong"></asp:TextBox>
            <span class="NoteText">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1">專案(工程)名稱</td>
		<td class="Table2">
		<asp:TextBox id="TextBox6" runat="server" CssClass="TBlong"></asp:TextBox>
		<span class="NoteText">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px">專案(工程)簡稱</td>
		<td class="Table2">
		<asp:TextBox id="TextBox7" runat="server"  CssClass="TBlong"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1">備註</td>
		<td class="Table2">
		<asp:TextBox ID="TextBox8" runat="server" CssClass="TBlong" Height="100px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button3" runat="server" Text="標案轉入" CssClass="BtnLargeShort" />
		    &nbsp;
            <asp:Button ID="Button4" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
		</td>
	</tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
