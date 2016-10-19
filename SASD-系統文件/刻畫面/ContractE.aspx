<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style5 {
	border-width: 0px;
	font-family: 微軟正黑體;
}
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
    .auto-style72 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 85%">
		
		<tr>
			<td class="auto-style2" colspan="2" style="height: 29px">合約條款評估編修</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">1.開工期限合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox1" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">2.工期合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox2" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">3.工期階段管制合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="Button3" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看工期逾罰資料" />
                <br/>
                說明：<asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">4.保固合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="Button4" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看合約保固資料" />
                <br />
                說明：<asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">5.承攬方式合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">6.付款辦法合理性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="Button5" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看付款辦法" />
                <br />
                說明：<asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">7.物價補貼</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">8.對我不利條文</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">9.合約條款適法性</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">合理</asp:ListItem>
                    <asp:ListItem Value="2">不合理</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox9" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="height: 45px;" colspan="2">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" />
			</td>

		</tr>
		</table>
</form>

</body>

</html>
