<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>未命名 1</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
}
.auto-style2 {
	text-align: left;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style4 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style6 {
	font-size: small;
}
.auto-style7 {
	margin-top: 0px;
}
.auto-style8 {
	font-size: medium;
}
.auto-style10 {
	border-width: 0px;
}
.auto-style16 {
	border-style: none;
	border-width: medium;
}
.auto-style17 {
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style18 {
	font-family: 微軟正黑體;
}
.auto-style19 {
	background-color: #FFFBD6;
}
.auto-style20 {
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style18" style="width: 60%; height: 300px">
		<tr>
			<td class="auto-style4" colspan="2"><strong>工期逾罰資料編修</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" colspan="2" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="auto-style5" style="height: 50px">開工期限</td>
			<td class="auto-style19" style="height: 50px" valign="top">
			<input checked="checked" name="Radio1" type="radio" /><span class="auto-style6">業主通知後</span><input name="Radio1" type="radio" /><span class="auto-style6">西元(YYYY/MM/DD)&nbsp;&nbsp;
			<br />
			</span><input name="Radio1" type="radio" /><span class="auto-style6">建照取得後</span><input name="Radio1" type="radio" /><span class="auto-style6">合約簽訂後&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
		&nbsp;(天)</span></td>
		</tr>
		<tr>
			<td class="auto-style5" style="height: 40px">完工提報期限</td>
			<td class="auto-style19" style="height: 40px">
			<span class="auto-style8">完工後</span><span class="auto-style6">&nbsp;
		<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="auto-style5">工期延展<br />
			提報期限</td>
			<td class="auto-style19">事件發生後<span class="auto-style6"><asp:TextBox id="TextBox7" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="2">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">&nbsp;逾罰明細</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增逾罰明細資料" Width="175px" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<table class="auto-style10" style="width: 100%">
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;</td>
					<td class="auto-style17" style="width: 266px"><strong>階段名稱</strong></td>
					<td class="auto-style17" style="width: 120px"><strong>工期</strong></td>
					<td class="auto-style17" style="width: 120px"><strong>逾罰</strong></td>
					<td class="auto-style17"><strong>說明</strong></td>
				</tr>
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;
		<asp:Button id="Button7" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button8" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px" />
					</td>
					<td class="auto-style20" style="width: 266px">施工臨時設施</td>
					<td class="auto-style20" style="width: 120px">工作天20天</td>
					<td class="auto-style20" style="width: 120px">千分之1/每天</td>
					<td class="auto-style20">&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;
		<asp:Button id="Button9" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button10" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px" />
					</td>
					<td class="auto-style20" style="width: 266px">施工圍籬</td>
					<td class="auto-style20" style="width: 120px">工作天40天</td>
					<td class="auto-style20" style="width: 120px">千分之1/每天</td>
					<td class="auto-style20">&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;
		<asp:Button id="Button11" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button12" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px" />
					</td>
					<td class="auto-style20" style="width: 266px">開工典禮</td>
					<td class="auto-style20" style="width: 120px">2016/04/15</td>
					<td class="auto-style20" style="width: 120px">每天2000元</td>
					<td class="auto-style20">&nbsp;</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
