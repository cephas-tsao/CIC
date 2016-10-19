<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubChangeDetail.aspx.cs" Inherits="SubChangeDetail" %>

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
            height: 19px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align: central;
            height: 19px;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align: central;
            width: 14px;
            height: 25px;
        }
        .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style5 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align: central;
            height: 25px;
        }
        .auto-style6 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 25px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="TableTop">分包預算項目追加減明細</td>
		</tr>
		</table>
    
        <table class="Table100">
		<tr>
		<td class="Table1">
                                追加減次序</td>
		<td class="Table2CC">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="4"></asp:Label>
            </td>
            <td class="Table1">
                執行項次</td>
            <td class="Table2CC">
                                        壹.一.3.1</td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2LC">
                                        B2F-挑高模板支撐架</td>
            <td class="Table1">
                單位</td>
            <td class="Table2CC">
                M3</td>
		</tr>
		</table>
        <table class="Table100">
		<tr>
		<td class="Table0" colspan="4">
                                所屬工項-執行預算</td>
		</tr>
		<tr>
		<td class="Table1">
                                &nbsp;</td>
            <td class="Table1">
                                    執行數量</td>
            <td class="Table1">
                                    執行單價</td>
            <td class="Table1">
                                    執行複價</td>
		</tr>
		<tr>
		<td class="Table1">
                                原執行預算</td>
            <td class="Table2CC">
                XXXX</td>
            <td class="Table2CC">
                XXXX</td>
            <td class="Table2CC">
                XXXX</td>
		</tr>
		<tr>
		<td class="Table1">
                                末次變更後</td>
            <td class="Table2CC">
                XXXX</td>
            <td class="Table2CC">
                XXXX</td>
            <td class="Table2CC">
                XXXX</td>
		</tr>
		<tr>
		<td class="Table0" colspan="4">
                                分包預算項目</td>
		</tr>
		<tr>
		<td class="Table1">
                                &nbsp;</td>
            <td class="Table1">
                                    數量</td>
            <td class="Table1">
                                    單價</td>
            <td class="Table1">
                                    複價</td>
		</tr>
		<tr>
		<td class="Table1">
                                原預算</td>
            <td class="Table2CC">
                <asp:Label ID="Label178" runat="server" Text="1,000" Width="150px"></asp:Label>
            </td>
            <td class="Table2CC">
                <asp:Label ID="Label179" runat="server" Text="80" Width="150px"></asp:Label>
            </td>
            <td class="Table2CC">
                <asp:Label ID="Label180" runat="server" Text="80,000" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style1">
                                變更前</td>
            <td class="auto-style2">
                <asp:Label ID="Label181" runat="server" Text="1,000" Width="150px"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label182" runat="server" Text="80" Width="150px"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label183" runat="server" Text="80,000" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                本次追加減</td>
            <td class="Table2CC">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="TB_5_TextChanged">0</asp:TextBox>
            </td>
            <td class="Table2CC">
                &nbsp;</td>
            <td class="Table2CC">
                                    &nbsp;</td>
		</tr>
		<tr>
		<td class="Table1">
                                變更後</td>
            <td class="Table2CC">
                                    <asp:TextBox ID="Label184" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="Label184_TextChanged">1,000</asp:TextBox>
            </td>
            <td class="Table2CC">
                <asp:Label ID="Label188" runat="server" Text="80" Width="150px"></asp:Label>
            </td>
            <td class="Table2CC">
                <asp:Label ID="Label187" runat="server" Text="80,000" Width="150px"></asp:Label>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="Table1">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開" PostBackUrl="~/採發9.aspx" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/採發9.aspx" />
                                </td>
		</tr>
		</table>
    
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
