<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConditionV.aspx.cs" Inherits="IMS.ConditionV" %>

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
.Table1 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
    .Table2 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
        }
    .Table13 {
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
			<td class="TableTop" colspan="2" style="height: 29px">條件評估檢視</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">1.施工技術能力</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition1" runat="server" Text="條件評估結果1"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote1" runat="server" Text="條件評估說明1"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">2.人力機具負荷</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition2" runat="server" Text="條件評估結果2"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote2" runat="server" Text="條件評估說明2"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">3.規範圖說</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition3" runat="server" Text="條件評估結果3"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote3" runat="server" Text="條件評估說明3"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">4.工址現況</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition4" runat="server" Text="條件評估結果4"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote4" runat="server" Text="條件評估說明4"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">5.估算時間</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition5" runat="server" Text="條件評估結果5"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote5" runat="server" Text="條件評估說明5"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1">6.特殊限制約定</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbCondition6" runat="server" Text="條件評估結果6"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote6" runat="server" Text="條件評估說明6"></asp:Label>
			</td>

		</tr>
		</table>
</form>

</body>

</html>