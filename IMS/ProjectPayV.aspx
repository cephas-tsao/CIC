<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectPayV.aspx.cs" Inherits="IMS.ProjectPayV" %>

<!DOCTYPE html>
<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>業主付款方式</title>
<style type="text/css">
.auto-style12 {
	font-family: 微軟正黑體;
}
.auto-style1 {
	font-size: large;
	text-align: center;
	background-color: #800000;
}
.auto-style4 {
	color: #FFFFFF;
	background-color: #800000;
}

.auto-style8 {
	font-size: small;
}
.auto-style9 {
	font-size: large;
}

</style>
</head>
 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 900px; height: 150px" class="Table100">
		<tr>
			<td class="TableTop" colspan="4">
			<strong>業主付款方式檢視</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">預付款百分比</td>
			<td style="width: 190px" class="Table2">
	
                <asp:Literal ID="PrepayPercentage" runat="server"></asp:Literal>
			%</td>
			<td class="Table1" style="width: 160px">估驗頻率</td>
			<td class="Table2" style="width: 190px">&nbsp;<asp:Literal ID="EstAcceptNum" runat="server"></asp:Literal>
			<span class="auto-style8">&nbsp;次/
		
                <asp:Literal ID="EstAcceptUnit" runat="server"></asp:Literal>
			</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">估驗日期1</td>
			<td style="width: 190px" class="Table2">
		
                <asp:Literal ID="EstAcceptDate1" runat="server"></asp:Literal>
		&nbsp;
			</td>
			<td class="Table1" style="width: 160px">估驗日期2</td>
			<td style="width: 190px" class="Table2">
		
                <asp:Literal ID="EstAcceptDate2" runat="server"></asp:Literal>
		&nbsp;
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">保留款百分比</td>
			<td style="width: 190px" class="Table2">
	
                <asp:Literal ID="RetentionPercentage" runat="server"></asp:Literal>
			<span class="auto-style9">%</span></td>
			<td class="Table1" style="width: 160px">物價補貼</td>
			<td style="width: 190px" class="Table2">
	
                <asp:Literal ID="PriceSubsidyNY" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 60px; width: 210px">其他付款規定</td>
			<td class="Table2" colspan="3" style="height: 60px">
		
                <asp:Literal ID="OtherPayment" runat="server"></asp:Literal>
			</td>
		</tr>
		</table>
</form>

</body>

</html>