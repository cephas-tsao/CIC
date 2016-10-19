<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidPayV.aspx.cs" Inherits="IMS.BidPayV" %>


<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>業主付款方式</title>
<style type="text/css">
.auto-style2 {
	 font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
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
.auto-style10 {
	text-align: center;
	font-size: medium;
	background-color: #FFFF99;
}
.auto-style13 {
	background-color: #FFFBD6;
}
.auto-style8 {
	font-size: small;
}
.auto-style9 {
	font-size: large;
}
.auto-style11 {
	text-align: left;
	background-color: #FFFBD6;
}
</style>
</head>
 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 100%;" class="auto-style12">
		<tr>
			<td class="TableTop" colspan="4">
			<strong>業主付款方式檢視</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">預付款百分比</td>
			<td style="width: 190px" class="auto-style2">
		<asp:Label id="TxPrepayPercentage" runat="server" Height="30px" Width="85px"></asp:Label>
			</td>
			<td class="Table1" style="width: 160px">估驗頻率</td>
			<td class="auto-style2" style="width: 190px">&nbsp;<asp:Label id="TxEstAcceptNum" runat="server" Height="20px" Width="50px"></asp:Label>
			<span class="auto-style8">&nbsp;
		<asp:Label id="TxEstAcceptUnit" runat="server" Height="20px" Width="50px"></asp:Label>
			</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">估驗日期1</td>
			<td style="width: 190px" class="auto-style2">
		<asp:Label id="TxEstAcceptDate1" runat="server" Height="30px" Width="125px"></asp:Label>
		&nbsp;
			</td>
			<td class="Table1" style="width: 160px">估驗日期2</td>
			<td style="width: 190px" class="auto-style2">
		<asp:Label id="TxEstAcceptDate2" runat="server" Height="30px" Width="125px"></asp:Label>
		&nbsp;
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">保留款百分比</td>
			<td style="width: 190px" class="auto-style2">
		<asp:Label id="TxRetentionPercentage" runat="server" Height="30px" Width="85px"></asp:Label>
			</td>
			<td class="Table1" style="width: 160px">物價補貼</td>
			<td style="width: 190px" class="auto-style2">
		<asp:Label id="TxPriceSubsidyNY" runat="server" Height="30px" Width="85px"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 60px; width: 210px">其他付款規定</td>
			<td class="auto-style2" colspan="3" style="height: 60px">
		<asp:Label id="TxOtherPayment" runat="server" Height="92px" Width="471px" TextMode="MultiLine"></asp:Label>
			</td>
		</tr>
		</table>
</form>
   
</body>

</html>
