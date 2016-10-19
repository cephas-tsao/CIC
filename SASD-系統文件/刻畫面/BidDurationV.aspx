<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工期逾罰資料</title>
<style type="text/css">
.auto-style18 {
	font-family: 微軟正黑體;
}
.auto-style4 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style2 {
	text-align: left;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style19 {
	background-color: #FFFBD6;
}
.auto-style8 {
	font-size: medium;
}
.auto-style10 {
	border-width: 0px;
}
.auto-style17 {
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style20 {
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
    .auto-style21 {
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        width: 286px;
        height: 24px;
    }
    .auto-style22 {
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        width: 168px;
        height: 24px;
    }
    .auto-style23 {
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        width: 167px;
        height: 24px;
    }
    .auto-style24 {
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 24px;
    }
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style18" style="width: 60%; height: 300px">
		<tr>
			<td class="auto-style4" colspan="2"><strong>工期逾罰資料檢視</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" colspan="2" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="auto-style5" style="height: 50px">開工期限</td>
			<td class="auto-style19" style="height: 50px">
			    <asp:Label ID="Label1" runat="server" Text="OOOOXXXXX"></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="auto-style5" style="height: 40px">完工提報期限</td>
			<td class="auto-style19" style="height: 40px">
			<span class="auto-style8">完工後<asp:Label ID="Label2" runat="server" Text="XX"></asp:Label>
                天內提報</span></td>
		</tr>
		<tr>
			<td class="auto-style5">工期延展<br />
			提報期限</td>
			<td class="auto-style19">事件發生後<span class="auto-style8"><asp:Label ID="Label3" runat="server" Text="XX"></asp:Label>
                天內提報</span></td>
		</tr>
		<tr>
			<td class="auto-style2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">&nbsp;逾罰明細</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<table class="auto-style10" style="width: 100%">
				<tr>
					<td class="auto-style17" style="width: 286px"><strong>階段名稱</strong></td>
					<td class="auto-style17" style="width: 168px"><strong>工期</strong></td>
					<td class="auto-style17" style="width: 167px"><strong>逾罰</strong></td>
					<td class="auto-style17"><strong>說明</strong></td>
				</tr>
				<tr>
					<td class="auto-style20" style="width: 286px">&nbsp;</td>
					<td class="auto-style20" style="width: 168px">&nbsp;</td>
					<td class="auto-style20" style="width: 167px">&nbsp;</td>
					<td class="auto-style20">&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style20" style="width: 286px">&nbsp;</td>
					<td class="auto-style20" style="width: 168px">&nbsp;</td>
					<td class="auto-style20" style="width: 167px">&nbsp;</td>
					<td class="auto-style20">&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style21"></td>
					<td class="auto-style22"></td>
					<td class="auto-style23"></td>
					<td class="auto-style24"></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
