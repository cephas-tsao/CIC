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
    font-weight:bold;
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
.center {
	text-align: center;
}
.right {
	text-align: right;
}
.largebutton {
	font-family: 微軟正黑體;
    font-size: large;
    font-weight:bold;
}


.auto-style6 {
	font-size: small;
	color: #FF0000;
}


    .auto-style7 {
        font-family: 微軟正黑體;
        font-size: medium;
        background-color: #FFFF99;
        text-align: center;
        color: #000000;
        width: 306px;
        height: 21px;
    }
    .auto-style8 {
        font-family: 微軟正黑體;
        font-size: medium;
        background-color: #FFFBD6;
        text-align: left;
        color: #000000;
        height: 21px;
    }


</style>
</head>

<body>

<form id="form1" runat="server">

	<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [Bid_PreData] WHERE [UID] = @UID" InsertCommand="INSERT INTO [Bid_PreData] ([Name], [ForecastPrice], [ForecastBiddingDate], [Notes]) VALUES (@Name, @ForecastPrice, @ForecastBiddingDate, @Notes)" SelectCommand="SELECT * FROM [Bid_PreData] ORDER BY [UID] DESC" UpdateCommand="UPDATE [Bid_PreData] SET [Name] = @Name, [ForecastPrice] = @ForecastPrice, [ForecastBiddingDate] = @ForecastBiddingDate, [Notes] = @Notes WHERE [UID] = @UID">
        <DeleteParameters>
            <asp:Parameter Name="UID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ForecastPrice" Type="Decimal" />
            <asp:Parameter Name="ForecastBiddingDate" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ForecastPrice" Type="Decimal" />
            <asp:Parameter Name="ForecastBiddingDate" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="UID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style1">未成案訊息總覽</td>
	</tr>
	<tr>
		<td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="新增標案" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True">
                    <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                    </asp:CommandField>
                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="預估名稱" SortExpression="Name" />
                    <asp:BoundField DataField="ForecastPrice" DataFormatString="{0:0,000.##}" HeaderText="預估金額" SortExpression="ForecastPrice">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ForecastBiddingDate" DataFormatString="{0:d}" HeaderText="預估招標日期" SortExpression="ForecastBiddingDate">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
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
            </asp:GridView>
        </td>
	</tr>
	</table>
    <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style1" colspan="2">新增未成案訊息</td>
	</tr>
	<tr>
		<td class="auto-style7">預估名稱</td>
		<td class="auto-style8">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>

	<tr>
		<td class="auto-style3" style="width: 306px">預估金額</td>
		<td class="auto-style4">
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="auto-style3" style="width: 306px">預估招標日期</td>
		<td class="auto-style4">
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="auto-style3" style="width: 306px">備註</td>
		<td class="auto-style4">
		<asp:TextBox id="TextBox4" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="center">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定新增" Width="107px" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="全部清空" Width="107px" />
		</td>
	</tr>
</table>

</form>

</body>

</html>
