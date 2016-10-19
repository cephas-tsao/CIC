<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>標案轉入</title>
<style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
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
.auto-style5 {
	text-align: center;
}


.auto-style6 {
	font-size: small;
	color: #FF0000;
}


.auto-style8 {
	text-align: left;
	font-family: 微軟正黑體;
	text-decoration: underline;
}
.auto-style90 {
	text-align: center;
	font-family: 微軟正黑體;
	background-color:#990000;
	color:white;
	width:100px;
}
.auto-style91 {
	text-align: center;
	font-family: 微軟正黑體;
	background-color:#990000;
	color:white;
	width:250px;
}

.auto-style10 {
	text-align: center;
	font-family: 微軟正黑體;
	background-color:#FFFBD6;
	color:black;
	width:100px;

}
.auto-style11 {
	text-align: center;
	font-family: 微軟正黑體;
	background-color:#FFFBD6;
	color:black;
	width:250px;

}



</style>
</head>

<body>

<form id="form1" runat="server">

	<br />

	<table style="width: 100%">
		<tr>
		<td class="auto-style3">請選擇標案</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />
		</td>
	</tr>

		<tr>
			<td colspan="4" class="auto-style1">投標內業資訊</td>
		</tr>
		<tr>
			<td class="auto-style3" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style4" style="height: 45px">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>
			<td class="auto-style3">標案狀態</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px">改LABEL</asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">作業負責人</td>
			<td class="auto-style4" colspan="3">
			<asp:DropDownList id="DropDownList7" runat="server" Height="30px" Width="150px" Font-Size="Medium">
			</asp:DropDownList>
			<asp:DropDownList id="DropDownList8" runat="server" Height="30px" Width="150px" Font-Size="Medium">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">完成領標日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox21" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style3">預定估算完成日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox22" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">標前會議時間</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox23" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style3">寄送標單日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox24" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">退圖日期</td>
			<td class="auto-style4" colspan="3">
			<asp:TextBox id="TextBox25" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 26px">估算成本</td>
			<td class="auto-style4" style="height: 26px" colspan="3">
			<asp:TextBox id="TextBox29" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">建議標價</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox30" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style3">建議利潤</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox32" runat="server"  Height="30px" Width="250px">改LABEL</asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">核定標價</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox31" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style3">核定利潤</td>
			<td class="auto-style4">
			<asp:TextBox id="TextBox33" runat="server"  Height="30px" Width="250px">改LABEL</asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" />
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style8">
			共同投標廠商明細</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
			<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
				<AlternatingRowStyle BackColor="White" />
				<Columns>
					<asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
						<ControlStyle Font-Names="微軟正黑體" Font-Size="Small" />
<ControlStyle Font-Names="微軟正黑體" Font-Size="Small"></ControlStyle>
						<ItemStyle Width="100px" />
					</asp:CommandField>
					<asp:BoundField DataField="JBID" HeaderText="JBID" InsertVisible="False" ReadOnly="True" SortExpression="JBID" Visible="False">
					</asp:BoundField>
					<asp:BoundField DataField="共同投標廠商名稱" HeaderText="共同投標廠商名稱" SortExpression="共同投標廠商名稱">
						<ItemStyle Width="250px" />
					</asp:BoundField>
					<asp:BoundField DataField="共同投標項目" HeaderText="共同投標項目" SortExpression="共同投標項目">
						<ItemStyle Width="250px" />
					</asp:BoundField>
					<asp:BoundField DataField="共同投標金額" HeaderText="共同投標金額" SortExpression="共同投標金額">
						<ItemStyle Width="250px" />
					</asp:BoundField>
				</Columns>
				<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
				<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
				<SortedAscendingCellStyle BackColor="#FDF5AC" />
				<SortedAscendingHeaderStyle BackColor="#4D0000" />
				<SortedDescendingCellStyle BackColor="#FCF6C0" />
				<SortedDescendingHeaderStyle BackColor="#820000" />

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=WANG-PC\SQLEXPRESS;Initial Catalog=CICIMS;User ID=CICIMS;Password=ntustCIC419" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID">
			</asp:SqlDataSource>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
			<table>
				<tr>
					<td class="auto-style90" style="height: 20px"><strong>新增廠商</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標廠商名稱</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標項目</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標金額</strong></td>
				</tr>
				<tr>
					<td class="auto-style10">
					<asp:Button id="Button3" runat="server" Text="新增" />
					</td>
					<td class="auto-style11">
			<asp:DropDownList id="DropDownList9" runat="server" Height="30px" Width="250px" Font-Size="Medium">
				<asp:ListItem>-請選擇-</asp:ListItem>
			</asp:DropDownList>
					</td>
					<td class="auto-style11">
			<asp:TextBox id="TextBox34" runat="server"  Height="30px" Width="250px"></asp:TextBox>
					</td>
					<td class="auto-style11">
			<asp:TextBox id="TextBox35" runat="server"  Height="30px" Width="250px"></asp:TextBox>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

</form>

</body>

</html>
