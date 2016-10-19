<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConditionE.aspx.cs" Inherits="IMS.ConditionE" %>

<head id="Head1" runat="server">
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
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="TableTop" colspan="2" style="height: 29px">條件評估編修</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">1.施工技術能力</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">本公司專長</asp:ListItem>
                    <asp:ListItem Value="1">足以勝任</asp:ListItem>
                    <asp:ListItem Value="2">需外聘專家</asp:ListItem>
                    <asp:ListItem Value="3">無此技術能力</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxAbility" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">2.人力機具負荷</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">現有資源足以應付</asp:ListItem>
                    <asp:ListItem Value="1">需招募人才</asp:ListItem>
                    <asp:ListItem Value="2">需添購設備</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxLabor" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">3.規範圖說</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">規範合理圖說清楚</asp:ListItem>
                    <asp:ListItem Value="1">規範合理圖說模糊</asp:ListItem>
                    <asp:ListItem Value="2">有難以接受者</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxRule" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">4.工址現況</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">現場狀況極佳</asp:ListItem>
                    <asp:ListItem Value="1">現場狀況尚可</asp:ListItem>
                    <asp:ListItem Value="2">施工條件差，需克服</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxPosition" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">5.估算時間</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">時間緊迫</asp:ListItem>
                    <asp:ListItem Value="1">時間合理</asp:ListItem>
                    <asp:ListItem Value="2">與其它案件衝突</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxTime" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1">6.特殊限制約定</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0">特殊規定可以克服</asp:ListItem>
                    <asp:ListItem Value="1">特殊規定需再商議</asp:ListItem>
                    <asp:ListItem Value="2">無特殊規定</asp:ListItem>
                </asp:RadioButtonList>
                說明：<asp:TextBox ID="TxRestrict" runat="server" Font-Names="微軟正黑體" Height="20px" Width="500px"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="height: 45px;" colspan="2">
		<asp:Button id="Save" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Recovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>

		</tr>
		</table>
</form>

</body>

</html>

