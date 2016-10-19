<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidPreAdd.aspx.cs" Inherits="IMS.BidPreAdd" %>

  <style type="text/css">

.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
            height: 27px;
        }
.auto-style3 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFF99;
	text-align: center;
	color: #000000;
}
.auto-style4 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
	color: #000000;
}
.auto-style6 {
	font-size: small;
	color: #FF0000;
}
.center {
	text-align: center;
}
    </style>
</head>
<body>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <form id="form1" runat="server">
    <div>
    
        <br />

<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<%--<tr>
		<td class="auto-style3">預估名稱</td>
        <td class="auto-style4">
		<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
		</td>
	</tr>--%>
	<tr>
		<td class="TableTop" colspan="2"><strong>新增標案</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">標案名稱</td>
		<td class="Table2" style="height: 22px">         
		<asp:TextBox id="TxBidName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">標案簡稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TxNickName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px">標案狀態</td>
		<td class="Table2">
		<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="300px" Font-Size="Medium">           
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
	</tr>

	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增標案" Width="107px" OnClick="SaveAction" />
		</td>
	</tr>
</table>

    </div>

            </form>
</body>
</html>
