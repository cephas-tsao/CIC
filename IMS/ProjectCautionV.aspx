<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectCautionV.aspx.cs" Inherits="IMS.ProjectCautionV" %>

<!DOCTYPE html>

<head id="Head1" runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約應注意修款</title>
<style type="text/css">
.auto-style10 {
	font-family: 微軟正黑體;
}
.auto-style1 {
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}

</style>
</head>

<body>
 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<form id="form1" runat="server">
	<br />
	<table style="width: 900px; height: 278px" class="Table100">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約應注意條款檢視</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px"><strong>條款種類</strong></td>
			<td class="Table2" style="width: 600px"><strong>說&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">契約終止</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<%--<asp:TextBox id="TextBox8" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="ContractCaution1" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">變更設計</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<%--<asp:TextBox id="TextBox9" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="ContractCaution2" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">爭議處理</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<%--<asp:TextBox id="TextBox10" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="ContractCaution3" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">其他</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<%--<asp:TextBox id="TextBox11" runat="server" Height="100px" Width="550px" BackColor="White" BorderColor="White" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="ContractCaution4" runat="server"></asp:Literal>
			</td>
		</tr>
		</table>
</form>

</body>

</html>
