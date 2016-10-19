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
.auto-style6 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: left;
	border-style: none;
	border-width: medium;
}
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.auto-style8 {
	text-decoration: underline;
}
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style10 {
	text-align: center;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style13 {
	background-color: #FFFBD6;
	text-align: center;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 79%; height: 587px">
		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			工程合約資料</strong></td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工程編號</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style7" style="width: 200px">工程名稱</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style8">合約基本資料</span></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">原合約總價</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="340px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 26px;">承攬方式</td>
			<td class="auto-style6" colspan="3" style="height: 26px">
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
			<td class="auto-style1" style="width: 300px">
		<asp:DropDownList id="DropDownList1" runat="server" Height="30px" Width="300px">
			<asp:ListItem>-請選擇-</asp:ListItem>
			<asp:ListItem>限期完工</asp:ListItem>
			<asp:ListItem>工作天</asp:ListItem>
			<asp:ListItem>日曆天</asp:ListItem>
			<asp:ListItem>其他</asp:ListItem>
		</asp:DropDownList>
			</td>
			<td class="auto-style7" style="width: 200px">工期</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style8">建物執照資料</span></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建照號碼</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style7" style="width: 200px">建照核發日期</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton1" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">使照號碼</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox4" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style7" style="width: 200px">使照核發日期</td>
			<td class="auto-style1" style="width: 300px">
		<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton2" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
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
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			III.聯合承攬資料</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">
			<table align="center" style="width: 95%; height: 150px">
				<tr>
					<td style="height: 29px; width: 143px"></td>
					<td class="auto-style11" style="height: 29px; width: 280px">
					<strong>聯合承攬廠商</strong></td>
					<td class="auto-style11" style="height: 29px; width: 282px">
					<strong>承攬項目</strong></td>
					<td class="auto-style11" style="height: 29px"><strong>合約金額</strong></td>
				</tr>
				<tr>
					<td style="width: 143px; height: 30px;" align="center">
		<asp:Button id="Button7" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button8" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px" />
					</td>
					<td style="width: 280px; height: 30px;" class="auto-style13">
		<asp:TextBox id="TextBox17" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td style="width: 282px; height: 30px;" class="auto-style13">
		<asp:TextBox id="TextBox18" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td class="auto-style13" style="height: 30px">
		<asp:TextBox id="TextBox19" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td style="height: 30px; width: 143px" align="center">
		<asp:Button id="Button9" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button10" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px" />
					</td>
					<td style="height: 30px; width: 280px" class="auto-style13">
		<asp:TextBox id="TextBox24" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td style="height: 30px; width: 282px" class="auto-style13">
		<asp:TextBox id="TextBox23" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td style="height: 30px" class="auto-style13">
		<asp:TextBox id="TextBox20" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td style="width: 143px; height: 33px;" align="center">
		<asp:Button id="Button11" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px" />
		<asp:Button id="Button12" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="50px" />
					</td>
					<td style="width: 280px; height: 33px;" class="auto-style13">
		<asp:TextBox id="TextBox25" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td style="width: 282px; height: 33px;" class="auto-style13">
		<asp:TextBox id="TextBox22" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td style="height: 33px" class="auto-style13">
		<asp:TextBox id="TextBox21" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
				</tr>
				</table>
			<table align="center" style="width: 95%; height: 50px">
				<tr>
					<td style="height: 29px; width: 143px" class="auto-style10">
					新增聯合承攬資料</td>
					<td class="auto-style11" style="height: 29px; width: 280px">
					<strong>聯合承攬廠商</strong></td>
					<td class="auto-style11" style="height: 29px; width: 282px">
					<strong>承攬項目</strong></td>
					<td class="auto-style11" style="height: 29px"><strong>合約金額</strong></td>
				</tr>
				<tr>
					<td class="auto-style10" style="width: 143px">
		<asp:Button id="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="新增" Width="51px" />
					</td>
					<td class="auto-style13" style="width: 280px">
		<asp:DropDownList id="DropDownList3" runat="server" Height="28px" Width="265px">
		</asp:DropDownList>
					</td>
					<td class="auto-style13" style="width: 282px">
		<asp:TextBox id="TextBox15" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td class="auto-style13">
		<asp:TextBox id="TextBox16" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
