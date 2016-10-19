<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
}
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
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style13 {
	font-size: small;
	color: #FF0000;
}
    .auto-style14 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        height: 31px;
    }
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 79%; height: 587px">
		<tr>
		<td class="auto-style7">請選擇標案</td>
		<td class="auto-style12" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style13">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />
		</td>
	</tr>

		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			合約概要</strong></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style12" style="height: 45px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>
			<td class="auto-style7">標案狀態</td>
			<td class="auto-style12">
			<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style14" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 26px;">承攬方式</td>
			<td class="auto-style12" colspan="3" style="height: 26px">
			<asp:RadioButtonList id="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem>實做實算</asp:ListItem>
				<asp:ListItem>總價承攬</asp:ListItem>
				<asp:ListItem>實做+總價</asp:ListItem>
				<asp:ListItem>統包</asp:ListItem>
				<asp:ListItem>其他</asp:ListItem>
			</asp:RadioButtonList>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">業主名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TextBox9" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建築師/設計單位名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TextBox10" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">監造單位名稱</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<asp:TextBox id="TextBox11" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">PCM名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TextBox12" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工期計算方式</td>
			<td class="auto-style12" style="width: 300px">
		<asp:DropDownList id="DropDownList1" runat="server" Height="30px" Width="300px" Font-Size="Medium">
			<asp:ListItem>-請選擇-</asp:ListItem>
			<asp:ListItem>限期完工</asp:ListItem>
			<asp:ListItem>工作天</asp:ListItem>
			<asp:ListItem>日曆天</asp:ListItem>
			<asp:ListItem>其他</asp:ListItem>
		</asp:DropDownList>
			</td>
			<td class="auto-style7" style="width: 200px">工期</td>
			<td class="auto-style12" style="width: 300px">
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button6" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px" />
			</td>
		</tr>
		</table>
</form>

</body>

</html>
