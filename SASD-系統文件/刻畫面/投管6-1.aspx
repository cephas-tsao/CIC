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


.auto-style7 {
	font-size: small;
	color: #008000;
}


</style>
</head>

<body>

<form id="form1" runat="server">

	<br />

	<table style="width: 100%">
		<tr>
		<td class="auto-style3">請選擇標案</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />
		</td>
	</tr>

		<tr>
			<td colspan="4" class="auto-style1">工程概要</td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style4" style="height: 45px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>
			<td class="auto-style3">標案狀態</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工程區分</td>
			<td class="auto-style4">
			<asp:RadioButtonList id="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem>公共工程</asp:ListItem>
				<asp:ListItem>民間工程</asp:ListItem>
			</asp:RadioButtonList>
		    </td>
			<td class="auto-style3">工程分類</td>
			<td class="auto-style4">
			<asp:DropDownList id="DropDownList4" runat="server" Height="30px" Width="300px" Font-Size="Medium">
			</asp:DropDownList>
		    </td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox21" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
			<td class="auto-style3">地上樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox22" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox23" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
			<td class="auto-style3">地上樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox24" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
		</tr>
		<tr>
			<td class="auto-style3">建物高度</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox25" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
			<td class="auto-style3">開挖深度</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox26" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 26px">基礎型式</td>
			<td class="auto-style4" style="height: 26px">
			<asp:DropDownList id="DropDownList5" runat="server" Height="30px" Width="300px" Font-Size="Medium">
			</asp:DropDownList>
			<br />
			<span class="auto-style7">*如欲增修基礎型式之內容請至常用資料維護功能</span></td>
			<td class="auto-style3" style="height: 26px">擋土措施</td>
			<td class="auto-style4" style="height: 26px">
			<asp:DropDownList id="DropDownList6" runat="server" Height="30px" Width="300px" Font-Size="Medium">
			</asp:DropDownList>
			<br />
			<span class="auto-style7">*如欲增修擋土措施之內容請至常用資料維護功能</span></td>
		</tr>
		<tr>
			<td class="auto-style3">施工概要備註</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox27" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="auto-style3">其他工程概要</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox28" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" />
			</td>
		</tr>
	</table>

</form>

</body>

</html>
