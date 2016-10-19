<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidDurationV.aspx.cs" Inherits="IMS.BidDurationV" %>

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
	 font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
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
	background-color: #507CD1;
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
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style18" style="width: 100%; height: 300px">
		<tr>
			<td class="TableTop" colspan="2"><strong>工期逾罰資料檢視</strong></td>
		</tr>
		<tr>
			<td class="auto-style2" colspan="2" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px;width:30%;">開工期限</td>
			<td class="auto-style2" style="height: 50px">
			    <%--<asp:Label ID="Label1" runat="server" Text="OOOOXXXXX"></asp:Label>--%>
                <asp:Literal ID="LtStartDeadline" runat="server"></asp:Literal>
            </td>
		</tr>
		<tr>
			<td class="Table1" style="height: 40px">完工提報期限</td>
			<td class="auto-style2" style="height: 40px">
			<span id="finish" runat="server" class="auto-style8" style="visibility:hidden"><%--<asp:Label ID="Label2" runat="server" Text="XX"></asp:Label>--%><asp:Literal ID="LtCompletionEscDeadline" runat="server"></asp:Literal>
                </span></td>
		</tr>
		<tr>
			<td class="Table1">工期延展<br />
			提報期限</td>
			<td class="auto-style2"><span id="duration" runat="server" class="auto-style8" style="visibility:hidden"><%--<asp:Label ID="Label3" runat="server" Text="XX"></asp:Label>--%><asp:Literal ID="LtDelayEscDeadline" runat="server"></asp:Literal>
                </span></td>
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
					<td class="auto-style17" style="width: 167px"><strong>說明</strong></td>
				</tr>
                  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
				<tr>
					<td class="auto-style2" style="width: 286px"><asp:Literal ID="LtStageName" runat="server"></asp:Literal>&nbsp;</td>
					<td class="auto-style2" style="width: 168px"><asp:Literal ID="LtDuration" runat="server"></asp:Literal>&nbsp;</td>
					<td class="auto-style2" style="width: 167px"><asp:Literal ID="LtPunish" runat="server"></asp:Literal>&nbsp;</td>
					<td class="auto-style2"><asp:Literal ID="LtNotes" runat="server"></asp:Literal>&nbsp;</td>
				</tr>
			
       
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
