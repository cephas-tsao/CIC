<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
}
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
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style14 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
    text-align:right;
}
    .auto-style15 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        width: 200px;
        height: 45px;
    }
    .auto-style16 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
    }
    .auto-style17 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        height: 45px;
    }
    </style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 79%">
		
		<tr>
			<td class="auto-style7" style="width: 30%; height: 45px;">標案名稱</td>
			<td class="auto-style12"><asp:Label ID="Label37" runat="server" Text="標案名稱"></asp:Label>
                </td>
		</tr>
		</table>
    <table class="auto-style5" style="width: 79%; height: 587px">

		<tr>
			<td class="auto-style2" colspan="6" style="height: 29px"><strong>
			    決標紀錄檢視</strong></td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; I.公告招標資訊</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主名稱"></asp:Label>
			</td>
			<td class="auto-style7">預算金額</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="預算金額"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="國家-縣市"></asp:Label>
			</td>
			<td class="auto-style7">是否共同投標</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="是/否"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">決標方式</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="決標方式"></asp:Label>
			</td>
			<td class="auto-style7">開標時間</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="開標時間"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">業主聯絡人</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主聯絡人"></asp:Label>
			</td>
			<td class="auto-style7">業主連絡電話</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主聯絡電話"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; II.決標主紀錄</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">決標結果</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="決標結果"></asp:Label>
            </td>
			<td class="auto-style7">得標廠商</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label39" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="得標廠商"></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">得標金額</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="得標金額"></asp:Label>
            </td>
			<td class="auto-style7">底價金額</td>
			<td class="auto-style12">
		        <asp:Label ID="Label41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="底價金額"></asp:Label>
            </td>

			<td class="auto-style7">標比</td>

			<td class="auto-style12">
		        <asp:Label ID="Label47" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="標比"></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; III.決標明細紀錄</td>

		</tr>
		<tr>
			<td class="auto-style15">參與開標人員</td>
			<td class="auto-style16">
		        <asp:Label ID="Label42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="參與開標人員"></asp:Label>
            </td>
			<td class="auto-style17">最初投標金額</td>
			<td class="auto-style16" colspan="3">
		        <asp:Label ID="Label43" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="最初投標金額"></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">優先減價金額</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label44" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="優先減價金額"></asp:Label>
            </td>
			<td class="auto-style7">最後減價金額</td>
			<td class="auto-style12" colspan="3">
		        <asp:Label ID="Label45" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="最後減價金額"></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">備註</td>
			<td class="auto-style12" style="height: 45px" colspan="5">
		        <asp:Label ID="Label46" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="備註"></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; 
			IV.其他投標廠商紀錄</td>
		</tr>
		<tr>
			<td class="auto-style12" colspan="6">
                <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                        <asp:BoundField DataField="BID" HeaderText="BID" SortExpression="BID" Visible="False" />
                        <asp:BoundField DataField="FirmName" HeaderText="廠商名稱" SortExpression="FirmName" />
                        <asp:TemplateField HeaderText="是否合格" SortExpression="CheckNY">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CheckNY") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"CheckNY"))==1)? "是":"否" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="是否得標" SortExpression="GetNY">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GetNY") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"GetNY"))==1)? "是":"否" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BidPrice" HeaderText="投標金額" SortExpression="BidPrice" DataFormatString="{0:#,###.##}" />
                        <asp:BoundField DataField="NoReason" HeaderText="不合格/未得標原因" SortExpression="NoReason" />
                        <asp:BoundField DataField="LowReason" HeaderText="標價偏低理由" SortExpression="LowReason" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [BidRecord_FirmList] WHERE ([BID] = @BID)" DeleteCommand="DELETE FROM [BidRecord_FirmList] WHERE [UID] = @UID" InsertCommand="INSERT INTO [BidRecord_FirmList] ([BID], [FirmName], [CheckNY], [GetNY], [BidPrice], [NoReason], [LowReason]) VALUES (@BID, @FirmName, @CheckNY, @GetNY, @BidPrice, @NoReason, @LowReason)" UpdateCommand="UPDATE [BidRecord_FirmList] SET [BID] = @BID, [FirmName] = @FirmName, [CheckNY] = @CheckNY, [GetNY] = @GetNY, [BidPrice] = @BidPrice, [NoReason] = @NoReason, [LowReason] = @LowReason WHERE [UID] = @UID">
                    <DeleteParameters>
                        <asp:Parameter Name="UID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BID" Type="Int32" />
                        <asp:Parameter Name="FirmName" Type="String" />
                        <asp:Parameter Name="CheckNY" Type="Int32" />
                        <asp:Parameter Name="GetNY" Type="Int32" />
                        <asp:Parameter Name="BidPrice" Type="Decimal" />
                        <asp:Parameter Name="NoReason" Type="String" />
                        <asp:Parameter Name="LowReason" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="BID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BID" Type="Int32" />
                        <asp:Parameter Name="FirmName" Type="String" />
                        <asp:Parameter Name="CheckNY" Type="Int32" />
                        <asp:Parameter Name="GetNY" Type="Int32" />
                        <asp:Parameter Name="BidPrice" Type="Decimal" />
                        <asp:Parameter Name="NoReason" Type="String" />
                        <asp:Parameter Name="LowReason" Type="String" />
                        <asp:Parameter Name="UID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
		</tr>
		</table>
</form>

</body>

</html>
