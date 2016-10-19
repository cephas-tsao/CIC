<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractV.aspx.cs" Inherits="IMS.ContractV" %>

<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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

    </style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="TableTop" colspan="2" style="height: 29px">合約條款評估檢視</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">1.開工期限合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract1" runat="server" ></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote1" runat="server"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">2.工期合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract2" runat="server" ></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote2" runat="server" ></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">3.工期階段管制合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract3" runat="server" Text="合約條款評估結果3"></asp:Label>
                <asp:Button ID="BtnPunish" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看工期逾罰資料"   OnClick="BtnPunish_Click"/>
                <br />
                說明：<asp:Label ID="LbContractNote3" runat="server" ></asp:Label>
                <br/>
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">4.保固合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract4" runat="server" ></asp:Label>
                <asp:Button ID="Button4" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看合約保固資料"  OnClick="BtnWarrany_Click"/>
                <br />
                說明：<asp:Label ID="LbContractNote4" runat="server" ></asp:Label>
                <br />
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">5.承攬方式合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract5" runat="server"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote5" runat="server" ></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">6.付款辦法合理性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract6" runat="server" ></asp:Label>
                <asp:Button ID="BtnPay" runat="server" Font-Names="微軟正黑體" Font-Size="Small" Text="查看付款辦法"   OnClick="BtnPay_Click" />
                <br />
                說明：<asp:Label ID="LbContractNote6" runat="server" ></asp:Label>
                <br />
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">7.物價補貼</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract7" runat="server" ></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote7" runat="server"></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">8.對我不利條文</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract8" runat="server" ></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote8" runat="server" ></asp:Label>
			</td>

		</tr>
        <tr>
			<td class="Table1" style="width: 200px; height: 45px;">9.合約條款適法性</td>
			<td class="Table2">
		        評估：<asp:Label ID="LbContract9" runat="server" ></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote9" runat="server" ></asp:Label>
			</td>

		</tr>
		</table>
</form>

</body>

</html>
