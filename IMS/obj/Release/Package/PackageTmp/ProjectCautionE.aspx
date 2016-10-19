<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectCautionE.aspx.cs" Inherits="IMS.ProjectCautionE" %>

<!DOCTYPE html>

 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>未命名 1</title>
<style type="text/css">
.auto-style1 {
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}

.auto-style9 {
	text-align: center;
}
.auto-style10 {
	font-family: 微軟正黑體;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="Table100">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約應注意條款編修</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px"><strong>條款種類</strong></td>
			<td class="Table2" style="width: 600px"><strong>說&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">契約終止</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="ContractCaution1" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">變更設計</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="ContractCaution2" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">爭議處理</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="ContractCaution3" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px; width: 200px">其他</td>
			<td class="Table2" style="width: 600px; height: 50px" valign="top">
		<asp:TextBox id="ContractCaution4" runat="server" Height="100px" Width="600px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" colspan="2" style="height: 40px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>
		</tr>
	</table>
</form>

</body>

</html>