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
	color: #008000;
	font-size: small;
}


</style>
</head>

<body>

<form id="form1" runat="server">

	<table style="width: 100%">
		<tr>
			<td colspan="5" class="auto-style1">專案基本資料</td>
		</tr>
		<tr>
			<td class="auto-style3">專案(工程)編號</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox1" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>
			</td>
			<td class="auto-style3">專案(工程)名稱</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox2" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">專案(工程)狀態</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox29" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>
			</td>
			<td class="auto-style3">專案(工程)簡稱</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox3" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 104px">備註</td>
			<td colspan="4" class="auto-style4" style="height: 104px">
			<asp:TextBox id="TextBox4" runat="server"  Height="100px" Width="600px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工程所在國家</td>
			<td class="auto-style4" colspan="2">
			<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
			<td class="auto-style3">工程所在縣市</td>
			<td class="auto-style4">
			<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地負責人</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox5" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">工地電話</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox6" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地傳真</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox9" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">業主名稱</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox7" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主聯絡人</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox10" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">業主連絡電話</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox8" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主地址</td>
			<td class="auto-style4" colspan="4">
			<asp:TextBox id="TextBox11" runat="server"  Height="30px" Width="600px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 32px">預定開工日期</td>
			<td class="auto-style4" colspan="2" style="height: 32px">
			<asp:TextBox id="TextBox12" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton1" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
			<td class="auto-style3" style="height: 32px">預定完工日期</td>
			<td class="auto-style4" style="height: 32px">
			<asp:TextBox id="TextBox13" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton2" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			<br />
			<span class="auto-style6">*倘工期有展延則須修改預定完工日期為展延後之日期</span></td>
		</tr>
		<tr>
			<td class="auto-style3">實際開工日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox14" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton3" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
			<td class="auto-style3">實際完工日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox15" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton4" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style3">核定完工日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox16" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton5" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
			<td class="auto-style3">驗收合格日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox18" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton6" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style3">預定保固期滿日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox17" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton7" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
			<td class="auto-style3">實際保固金退還日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox19" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			<asp:ImageButton id="ImageButton8" runat="server" Height="25px" ImageUrl=".\img\calendar.jpg" Width="25px" />
			</td>
		</tr>
		<tr>
			<td class="auto-style3">履約保證金</td>
			<td class="auto-style4">
			<asp:RadioButtonList id="RadioButtonList1" runat="server">
				<asp:ListItem>金額</asp:ListItem>
				<asp:ListItem>百分比</asp:ListItem>
			</asp:RadioButtonList>
			</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox20" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style4">&nbsp;</td>
			<td class="auto-style4">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 33px">工程區分</td>
			<td class="auto-style4" colspan="2" style="height: 33px">
			<asp:RadioButtonList id="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem>公共工程</asp:ListItem>
				<asp:ListItem>民間工程</asp:ListItem>
			</asp:RadioButtonList>
			</td>
			<td class="auto-style3" style="height: 33px">工程分類</td>
			<td class="auto-style4" style="height: 33px">
			<asp:DropDownList id="DropDownList4" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層數</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox21" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
			<td class="auto-style3">地上樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox22" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層面積</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox23" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
			<td class="auto-style3">地上樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox24" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
		</tr>
		<tr>
			<td class="auto-style3">建物高度</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox25" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
			<td class="auto-style3">開挖深度</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox26" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
		</tr>
		<tr>
			<td class="auto-style3">基礎型式</td>
			<td class="auto-style4" colspan="2">
			<asp:DropDownList id="DropDownList5" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
			<td class="auto-style3">擋土措施</td>
			<td class="auto-style4">
			<asp:DropDownList id="DropDownList6" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">施工概要備註</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TextBox27" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="auto-style3">其他工程概要</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox28" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="5" class="auto-style5">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" />
			</td>
		</tr>
	</table>

</form>

</body>

</html>
