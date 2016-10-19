<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>業主付款方式</title>
<style type="text/css">
.auto-style1 {
	font-size: large;
	text-align: center;
	background-color: #800000;
}
.auto-style4 {
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style5 {
	text-align: center;
}
.auto-style8 {
	font-size: small;
}
.auto-style9 {
	font-size: large;
}
.auto-style10 {
	text-align: center;
	font-size: medium;
	background-color: #FFFF99;
}
.auto-style11 {
	text-align: left;
	background-color: #FFFBD6;
}
.auto-style12 {
	font-family: 微軟正黑體;
}
.auto-style13 {
	background-color: #FFFBD6;
}
.auto-style14 {
	font-size: medium;
}
.auto-style15 {
	color: #008000;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 50%; height: 150px" class="auto-style12">
		<tr>
			<td class="auto-style1" colspan="4"><span class="auto-style4">
			<strong>業主付款方式編修</strong></span></td>
		</tr>
		<tr>
			<td class="auto-style10" style="width: 210px">預付款百分比</td>
			<td style="width: 190px" class="auto-style13">
		<asp:TextBox id="TextBox9" runat="server" Height="30px" Width="125px"></asp:TextBox>
			</td>
			<td class="auto-style10" style="width: 160px">估驗頻率</td>
			<td class="auto-style13" style="width: 190px">&nbsp;<asp:TextBox id="TextBox7" runat="server" Height="20px" Width="50px"></asp:TextBox>
			<span class="auto-style14">次/</span><span class="auto-style8">
		<asp:TextBox id="TextBox8" runat="server" Height="20px" Width="50px"></asp:TextBox>
			<br />
			<span class="auto-style15">(ex.1次/月)</span></span></td>
		</tr>
		<tr>
			<td class="auto-style10" style="width: 210px">估驗日期1</td>
			<td style="width: 190px" class="auto-style13">
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="125px"></asp:TextBox>
		&nbsp;
			<asp:ImageButton id="ImageButton2" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
			<td class="auto-style10" style="width: 160px">估驗日期2</td>
			<td style="width: 190px" class="auto-style13">
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="125px"></asp:TextBox>
		&nbsp;
			<asp:ImageButton id="ImageButton3" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style10" style="width: 210px">保留款百分比</td>
			<td style="width: 190px" class="auto-style13">
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="85px"></asp:TextBox>
			<span class="auto-style9">%</span></td>
			<td class="auto-style10" style="width: 160px">物價補貼</td>
			<td style="width: 190px" class="auto-style13">
		<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="85px">
			<asp:ListItem>-請選擇-</asp:ListItem>
			<asp:ListItem>是</asp:ListItem>
			<asp:ListItem>否</asp:ListItem>
		</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style10" style="height: 60px; width: 210px">其他付款規定</td>
			<td class="auto-style11" colspan="3" style="height: 60px">
		<asp:TextBox id="TextBox4" runat="server" Height="100px" Width="471px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style5" colspan="4" style="height: 40px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
			</td>
		</tr>
	</table>
</form>

</body>

</html>
