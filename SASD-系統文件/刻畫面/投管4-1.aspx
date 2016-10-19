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
.center {
	text-align: center;
}
.right {
	text-align: right;
}
.auto-style6 {
	font-size: small;
	color: #FF0000;
}
.largebutton {
	font-family: 微軟正黑體;
    font-size: large;
    font-weight:bold;
}


    .auto-style8 {
        font-family: 微軟正黑體;
        font-size: medium;
        background-color: #FFFF99;
        text-align: center;
        color: #000000;
        height: 40px;
    }
    .auto-style9 {
        font-family: 微軟正黑體;
        font-size: medium;
        background-color: #FFFBD6;
        text-align: left;
        color: #000000;
        height: 40px;
    }


</style>
</head>

<body>

<form id="form1" runat="server">

	<br />

<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style3">請選擇標案</td>
		<td class="auto-style4" colspan="7">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
	</tr>
	<tr>
		<td class="auto-style1" colspan="8" style="height: 27px">公告招標資訊</td>
	</tr>
	<tr>
		<td class="auto-style3">標案名稱</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
		</td>
		<td class="auto-style3">標案狀態</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">工程所在國家</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
		<td class="auto-style3">工程所在縣市</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList4" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
	</tr>

	<tr>
		<td class="auto-style3" style="height: 45px">電子領標</td>
		<td class="auto-style4" style="height: 45px">
		<asp:DropDownList id="DropDownList5" runat="server" Height="32px" Width="73px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 45px">
		電子投標</td>
		<td class="auto-style4" style="height: 45px">
		<asp:DropDownList id="DropDownList6" runat="server" Height="32px" Width="73px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 45px">截標時間</td>
		<td class="auto-style4" colspan="3" style="height: 45px">
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>

	<tr>
		<td class="auto-style3">業主名稱</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
		<td class="auto-style3">業主聯絡人</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="auto-style8">業主地址</td>
		<td class="auto-style9" colspan="3">
		<asp:TextBox id="TextBox9" runat="server" Height="30px" Width="400px"></asp:TextBox>
			</td>
		<td class="auto-style8">業主聯絡電話</td>
		<td class="auto-style9" colspan="3">
		<asp:TextBox id="TextBox10" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
	</tr>

	<tr>
		<td class="auto-style3" style="height: 24px">領標地址</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:TextBox id="TextBox11" runat="server" Height="30px" Width="400px"></asp:TextBox>
		</td>
		<td class="auto-style3" style="height: 24px">押圖費</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:TextBox id="TextBox12" runat="server" Height="30px" Width="300px"></asp:TextBox>
		元</td>
	</tr>

	<tr>
		<td class="auto-style3">圖說費</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox13" runat="server" Height="30px" Width="300px"></asp:TextBox>
		元</td>
		<td class="auto-style3">退圖期限</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox14" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">履約保證金</td>
		<td class="auto-style4" colspan="3">
		<table style="width: 100%">
			<tr>
				<td style="width: 90px">
		<asp:RadioButtonList id="RadioButtonList1" runat="server">
			<asp:ListItem>金額</asp:ListItem>
			<asp:ListItem>百分比</asp:ListItem>
		</asp:RadioButtonList>
				</td>
				<td>
		<asp:TextBox id="TextBox15" runat="server" Height="30px" Width="200px"></asp:TextBox>
		(元)</td>
			</tr>
		</table>
		</td>
		<td class="auto-style3">押標金</td>
		<td class="auto-style4" colspan="3">
		<table style="width: 100%">
			<tr>
				<td style="width: 90px">
		<asp:RadioButtonList id="RadioButtonList2" runat="server">
			<asp:ListItem>金額</asp:ListItem>
			<asp:ListItem>百分比</asp:ListItem>
		</asp:RadioButtonList>
				</td>
				<td>
		<asp:TextBox id="TextBox20" runat="server" Height="30px" Width="200px"></asp:TextBox>
		(元)</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">廠商投標規定</td>
		<td class="auto-style4" colspan="7">
		<asp:TextBox id="TextBox17" runat="server" Height="100px" Width="1000px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">開標地點</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox18" runat="server" Height="30px" Width="400px"></asp:TextBox>
		</td>
		<td class="auto-style3">開標時間</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="TextBox22" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="auto-style3" style="height: 24px">決標方式</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:DropDownList id="DropDownList9" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 24px">共同投標</td>
		<td class="auto-style4" style="height: 24px">
		<asp:DropDownList id="DropDownList7" runat="server" Height="32px" Width="73px" Font-Size="Medium">
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 24px">
		已領標</td>
		<td class="auto-style4" style="height: 24px">
		<asp:DropDownList id="DropDownList8" runat="server" Height="32px" Width="73px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
	</tr>

	<tr>
		<td colspan="8" class="center">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" />
		</td>
    </tr>
		</table>
    
</form>

</body>

</html>
