<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約應注意修款</title>
<style type="text/css">
.auto-style10 {
	font-family: 微軟正黑體;
}
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
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 55%; height: 278px" class="auto-style10">
		<tr>
			<td class="auto-style1" colspan="2"><strong>合約應注意條款檢視</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" style="width: 200px"><strong>條款種類</strong></td>
			<td class="auto-style3" style="width: 600px"><strong>說&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">契約終止</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox8" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">變更設計</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox9" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">爭議處理</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox10" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2" style="height: 50px; width: 200px">其他</td>
			<td class="auto-style8" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="TextBox11" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		</table>
</form>

</body>

</html>
