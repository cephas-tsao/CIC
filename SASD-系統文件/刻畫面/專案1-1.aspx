<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>標案轉入</title>
<style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFFFF;
	text-align: left;
	color: #000000;
}
.auto-style3 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFF99;
	text-align: center;
	color: #000000;
}
.auto-style4 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
	color: #000000;
}
.auto-style5 {
	text-align: center;
}


.auto-style6 {
	font-size: small;
	color: #FF0000;
}


</style>
</head>

<body>

<form id="form1" runat="server">

	<br />

<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style1" colspan="2"><strong>標案轉入</strong></td>
	</tr>
	<tr>
		<td class="auto-style3" style="width: 306px">選擇標案</td>
		<td class="auto-style4">
		<asp:DropDownList id="DropDownList1" runat="server" Height="30px" Width="300px">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
	</tr>
	<tr>
		<td class="auto-style2" colspan="2">請輸入工程相關資訊：</td>
	</tr>
	<tr>
		<td class="auto-style3" style="height: 22px; width: 306px;">專案(工程)編號</td>
		<td class="auto-style4" style="height: 22px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="auto-style3" style="width: 306px">專案(工程)名稱</td>
		<td class="auto-style4">
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="auto-style3" style="width: 306px">專案(工程)簡稱</td>
		<td class="auto-style4">
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3" style="width: 306px; height: 24px;">備註</td>
		<td class="auto-style4" style="height: 24px">
		<asp:TextBox id="TextBox4" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="auto-style5">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="標案轉入" Width="107px" />
		</td>
	</tr>
</table>

</form>

</body>

</html>
