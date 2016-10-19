<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidCautionV.aspx.cs" Inherits="IMS.BidCautionV" %>

<style type="text/css">
.auto-style1 {
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style2 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style3 {
	text-align: center;
	background-color: #FFFBD6;
}
.auto-style8 {
	background-color: #FFFBD6;
}
.auto-style10 {
	font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>

<form id="form1" runat="server">
	<br />
	<table style="width: 100%; height: 325px" class="auto-style10">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約應注意條款檢視</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px"><strong>條款種類</strong></td>
			<td class="auto-style10" style="width: 600px"><strong>說&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">契約終止</td>
			<td class="auto-style10" style="width: 600px; height: 50px" valign="top">
		<asp:Label id="ContractCaution1" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White" ReadOnly="True"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">變更設計</td>
			<td class="auto-style10" style="width: 600px; height: 50px" valign="top">
		<asp:Label id="ContractCaution2" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White" ReadOnly="True"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">爭議處理</td>
			<td class="auto-style10" style="width: 600px; height: 50px" valign="top">
		<asp:Label id="ContractCaution3" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White" ReadOnly="True"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">其他</td>
			<td class="auto-style10" style="width: 600px; height: 50px" valign="top">
		<asp:Label id="ContractCaution4" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White" ReadOnly="True"></asp:Label>
			</td>
		</tr>
		</table>
</form>

</body>

</html>
