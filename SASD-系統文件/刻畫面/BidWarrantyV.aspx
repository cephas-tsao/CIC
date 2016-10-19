<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約保固資料</title>
<style type="text/css">
.auto-style4 {
	font-family: 微軟正黑體;
}
.auto-style1 {
	text-align: center;
	font-size: large;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style6 {
	background-color: #FFFBD6;
}
.auto-style8 {
	font-size: medium;
}
.auto-style9 {
	text-align: left;
	background-color: #FFFBD6;
}
.auto-style7 {
	text-align: left;
	background-color: #FFFFFF;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style12 {
	text-align: center;
	background-color: #FFFBD6;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style4" style="width: 50%">
		<tr>
			<td class="auto-style1" colspan="2"><strong>合約保固資料檢視</strong></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="auto-style5" style="width: 200px">保固百分比</td>
			<td class="auto-style6" style="width: 500px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="234px"></asp:TextBox>
			<span class="auto-style8">%</span></td>
		</tr>
		<tr>
			<td class="auto-style5" style="width: 200px; height: 70px">其他保固規定</td>
			<td class="auto-style9" style="width: 500px; height: 70px" valign="top">
		<asp:TextBox id="TextBox2" runat="server" Height="60px" Width="443px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">保固明細</span></td>
		</tr>
		<tr>
			<td colspan="2">
			<table style="width: 70%; height: 102px;" align="center">
				<tr>
					<td class="auto-style11" style="width: 220px"><strong>保固項目名稱</strong></td>
					<td class="auto-style11" style="width: 220px"><strong>
					保固年限(年)</strong></td>
				</tr>
				<tr>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
