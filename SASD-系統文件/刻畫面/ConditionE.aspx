<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
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
    .auto-style72 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
        }
    .auto-style73 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        width: 200px;
        height: 45px;
    }
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 85%">
		
		<tr>
			<td class="auto-style2" colspan="2" style="height: 29px">條件評估編修</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">1.施工技術能力</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">本公司專長</asp:ListItem>
                    <asp:ListItem Value="2">足以勝任</asp:ListItem>
                    <asp:ListItem Value="3">需外聘專家</asp:ListItem>
                    <asp:ListItem Value="4">無此技術能力</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox1" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">2.人力機具負荷</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">現有資源足以應付</asp:ListItem>
                    <asp:ListItem Value="2">需招募人才</asp:ListItem>
                    <asp:ListItem Value="3">需添購設備</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox2" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">3.規範圖說</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">規範合理圖說清楚</asp:ListItem>
                    <asp:ListItem Value="2">規範合理圖說模糊</asp:ListItem>
                    <asp:ListItem Value="3">有難以接受者</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">4.工址現況</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">現場狀況極佳</asp:ListItem>
                    <asp:ListItem Value="2">現場狀況尚可</asp:ListItem>
                    <asp:ListItem Value="3">施工條件差，需克服</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">5.估算時間</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">時間緊迫</asp:ListItem>
                    <asp:ListItem Value="2">時間合理</asp:ListItem>
                    <asp:ListItem Value="3">與其它案件衝突</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style73">6.特殊限制約定</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">特殊規定可以克服</asp:ListItem>
                    <asp:ListItem Value="2">特殊規定需再商議</asp:ListItem>
                    <asp:ListItem Value="3">無特殊規定</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="height: 45px;" colspan="2">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" />
			</td>

		</tr>
		</table>
</form>

</body>

</html>
