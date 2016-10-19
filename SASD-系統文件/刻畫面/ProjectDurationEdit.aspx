<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>逾罰明細資料新增</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: large;
	font-family: 微軟正黑體;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style3 {
	font-family: 微軟正黑體;
	text-align: center;
	background-color: #FFFF99;
}
.auto-style2 {
	font-family: 微軟正黑體;
	background-color: #FFFBD6;
}
.auto-style4 {
	font-size: small;
}
.auto-style5 {
	font-family: 微軟正黑體;
	text-align: center;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 57%; height: 267px">
		<tr>
			<td class="auto-style1" colspan="5"><strong>逾罰明細資料修改</strong></td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px">階段名稱</td>
			<td class="auto-style2" colspan="4">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="234px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px">工期</td>
			<td class="auto-style2" style="width: 260px">
			<input checked="checked" name="Radio1" type="radio" value="128" /><span class="auto-style4">西元</span><br />
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="220px"></asp:TextBox>
			</td>
			<td class="auto-style2" style="width: 132px">
			<input name="Radio1" type="radio" value="129" /><span class="auto-style4">工作天</span><br />
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="61px"></asp:TextBox>
			<span class="auto-style4">天</span></td>
			<td class="auto-style2" style="width: 132px" valign="top">
			<input name="Radio1" type="radio" value="130" /><span class="auto-style4">日曆天</span><br />
		<asp:TextBox id="TextBox4" runat="server" Height="30px" Width="61px"></asp:TextBox>
			<span class="auto-style4">天</span></td>
			<td class="auto-style2" style="width: 132px" valign="top">
			<input name="Radio1" type="radio" value="131" /><span class="auto-style4">其他<br />
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="89px"></asp:TextBox>
			</span></td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px">逾罰</td>
			<td class="auto-style2" style="width: 260px">
			<input name="Radio1" type="radio" value="132" /><span class="auto-style4">千分之</span><br />
		<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="180px"></asp:TextBox>
			<span class="auto-style4">/每天</span></td>
			<td class="auto-style2" colspan="3" valign="top">
			<input class="auto-style4" name="Radio1" type="radio" value="133" /><span class="auto-style4">一天<br />
		<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="200px"></asp:TextBox>
			元</span></td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px">說明</td>
			<td class="auto-style2" colspan="4">
		<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="520px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style5" colspan="5" style="height: 45px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
			</td>
		</tr>
	</table>
</form>

</body>

</html>
