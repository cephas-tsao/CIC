<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>未命名 1</title>
<style type="text/css">
.auto-style1 {
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style2 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style3 {
	text-align: center;
	background-color: #FFFBD6;
}
.auto-style8 {
	background-color: #FFFBD6;
}
.auto-style9 {
	text-align: center;
}
.auto-style10 {
	font-family: 微軟正黑體;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 55%; height: 325px" class="auto-style10">
		<tr>
			<td class="auto-style1" colspan="2"><strong>合約應注意條款編修</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" style="width: 200px"><strong>條款種類</strong></td>
			<td class="auto-style3" style="width: 600px"><strong>說&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">契約終止</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox8" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">變更設計</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox9" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">爭議處理</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox10" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">其他</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox11" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="2" style="height: 40px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
			</td>
		</tr>
	</table>
</form>

</body>

</html>
