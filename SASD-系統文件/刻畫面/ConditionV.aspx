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
			<td class="auto-style2" colspan="2" style="height: 29px">條件評估檢視</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">1.施工技術能力</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label1" runat="server" Text="條件評估結果1"></asp:Label>
                <br />
                說明：<asp:Label ID="Label2" runat="server" Text="條件評估說明1"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">2.人力機具負荷</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label3" runat="server" Text="條件評估結果2"></asp:Label>
                <br />
                說明：<asp:Label ID="Label4" runat="server" Text="條件評估說明2"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">3.規範圖說</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label5" runat="server" Text="條件評估結果3"></asp:Label>
                <br />
                說明：<asp:Label ID="Label6" runat="server" Text="條件評估說明3"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">4.工址現況</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label7" runat="server" Text="條件評估結果4"></asp:Label>
                <br />
                說明：<asp:Label ID="Label8" runat="server" Text="條件評估說明4"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">5.估算時間</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label9" runat="server" Text="條件評估結果5"></asp:Label>
                <br />
                說明：<asp:Label ID="Label10" runat="server" Text="條件評估說明5"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style73">6.特殊限制約定</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label11" runat="server" Text="條件評估結果6"></asp:Label>
                <br />
                說明：<asp:Label ID="Label12" runat="server" Text="條件評估說明6"></asp:Label>
			</td>

		</tr>
		</table>
</form>

</body>

</html>
