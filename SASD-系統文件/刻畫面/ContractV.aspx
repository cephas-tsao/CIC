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
			<td class="auto-style2" colspan="2" style="height: 29px">合約條款評估檢視</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">1.開工期限合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label1" runat="server" Text="合約條款評估結果1"></asp:Label>
                <br />
                說明：<asp:Label ID="Label2" runat="server" Text="合約條款評估說明1"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">2.工期合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label3" runat="server" Text="合約條款評估結果2"></asp:Label>
                <br />
                說明：<asp:Label ID="Label4" runat="server" Text="合約條款評估說明2"></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="auto-style73">3.工期階段管制合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label5" runat="server" Text="合約條款評估結果3"></asp:Label>
                <asp:Button ID="Button3" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看工期逾罰資料" />
                <br />
                說明：<asp:Label ID="Label6" runat="server" Text="合約條款評估說明3"></asp:Label>
                <br/>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">4.保固合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label7" runat="server" Text="合約條款評估結果4"></asp:Label>
                <asp:Button ID="Button4" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看合約保固資料" />
                <br />
                說明：<asp:Label ID="Label8" runat="server" Text="合約條款評估說明4"></asp:Label>
                <br />
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">5.承攬方式合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label9" runat="server" Text="合約條款評估結果5"></asp:Label>
                <br />
                說明：<asp:Label ID="Label10" runat="server" Text="合約條款評估說明5"></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">6.付款辦法合理性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label11" runat="server" Text="合約條款評估結果6"></asp:Label>
                <asp:Button ID="Button5" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看付款辦法" />
                <br />
                說明：<asp:Label ID="Label12" runat="server" Text="合約條款評估說明6"></asp:Label>
                <br />
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">7.物價補貼</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label13" runat="server" Text="合約條款評估結果7"></asp:Label>
                <br />
                說明：<asp:Label ID="Label14" runat="server" Text="合約條款評估說明7"></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">8.對我不利條文</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label15" runat="server" Text="合約條款評估結果8"></asp:Label>
                <br />
                說明：<asp:Label ID="Label16" runat="server" Text="合約條款評估說明8"></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">9.合約條款適法性</td>
			<td class="auto-style72">
		        評估：<asp:Label ID="Label17" runat="server" Text="合約條款評估結果9"></asp:Label>
                <br />
                說明：<asp:Label ID="Label18" runat="server" Text="合約條款評估說明9"></asp:Label>
			</td>

		</tr>
		</table>
</form>

</body>

</html>
