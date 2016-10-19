<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidWarrantyV.aspx.cs" Inherits="IMS.BidWarrantyV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約保固資料</title>
<style type="text/css">
.auto-style4 {
	font-family: 微軟正黑體;
}
.auto-style1 {
	text-align: center;
	font-size: large;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style6 {
	background-color: #FFFBD6;
}
.auto-style8 {
	font-size: medium;
}
.auto-style9 {
	text-align: left;
	background-color: #FFFBD6;
}
.auto-style7 {
	text-align: left;
	background-color: #FFFFFF;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #507CD1;
}
.auto-style12 {
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
	<table class="auto-style4" style="width: 100%">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約保固資料檢視</strong></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">保固百分比</td>
			<td class="auto-style2" style="width: 500px">
		<asp:Label id="TxWarrantyPercentage" runat="server" Height="30px" Width="234px"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 70px">其他保固規定</td>
			<td class="auto-style2" style="width: 500px; height: 70px" valign="top">
		<asp:Label id="TxOtherWarranty" runat="server" Height="60px" Width="443px"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">保固明細</span></td>
		</tr>
		<tr>
			<td colspan="2">
			<table style="width: 100%;" align="center">
				<tr>
					<td class="auto-style11" style="width: 220px"><strong>保固項目名稱</strong></td>
					<td class="auto-style11" style="width: 220px"><strong>
					保固年限(年)</strong></td>
				</tr>
                <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>
				<tr>
					<td class="auto-style12" style="width: 220px">
                        <asp:Literal ID="LtWarrantyItem" runat="server"></asp:Literal>&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
                        <asp:Literal ID="LtWarrantyYear" runat="server"></asp:Literal>&nbsp;</td>
				</tr>
				<%--<tr>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
				</tr>--%>
                        </ItemTemplate>
                    </asp:Repeater>
				</table>
			</td>
		</tr>
	</table>
</form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</body>

</html>