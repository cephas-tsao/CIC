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
.auto-style13 {
	font-size: small;
	color: #FF0000;
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
	<table class="auto-style5" style="width: 79%; height: 587px">
		<tr>
		<td class="auto-style7">請選擇標案</td>
		<td class="auto-style12" colspan="3">
		<asp:DropDownList id="DropDownList3" AppendDataBoundItems="true" runat="server" Height="30px" Width="300px" Font-Size="Medium" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體">
            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
		<span class="auto-style13">(必選)</span></td>
	</tr>

		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			    決標紀錄增修</strong></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label1" runat="server" Text="XXXXXX"></asp:Label>
			</td>
			<td class="auto-style7">標案狀態</td>
			<td class="auto-style12">
			    <asp:Label ID="Label2" runat="server" Text="備標完成"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.公告招標資訊</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主名稱"></asp:Label>
			</td>
			<td class="auto-style7">預算金額</td>
			<td class="auto-style12">
		        <asp:Label ID="Label5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="預算金額"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="國家-縣市"></asp:Label>
			</td>
			<td class="auto-style7">是否共同投標</td>
			<td class="auto-style12">
		        <asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="是/否"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">決標方式</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="決標方式"></asp:Label>
			</td>
			<td class="auto-style7">開標時間</td>
			<td class="auto-style12">
		        <asp:Label ID="Label7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="開標時間"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">業主聯絡人</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主聯絡人"></asp:Label>
			</td>
			<td class="auto-style7">業主連絡電話</td>
			<td class="auto-style12">
		        <asp:Label ID="Label10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主聯絡電話"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.決標主紀錄</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">決標結果</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:DropDownList ID="DropDownList4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>得標</asp:ListItem>
                    <asp:ListItem>未得標</asp:ListItem>
                    <asp:ListItem>流標</asp:ListItem>
                    <asp:ListItem>廢標</asp:ListItem>
                    <asp:ListItem>重新招標</asp:ListItem>
                </asp:DropDownList>
            </td>
			<td class="auto-style7">得標廠商</td>
			<td class="auto-style12">
			    <asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">得標金額</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style7">底價金額</td>
			<td class="auto-style12">
			    <asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; III.決標明細紀錄</td>

		</tr>
		<tr>
			<td class="auto-style15">參與開標人員</td>
			<td class="auto-style16">
		        <asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style17">最初投標金額</td>
			<td class="auto-style16">
		        <asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">優先減價金額</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style7">最後減價金額</td>
			<td class="auto-style12">
		        <asp:TextBox ID="TextBox9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">備註</td>
			<td class="auto-style12" style="height: 45px" colspan="3">
		        <asp:TextBox ID="TextBox10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="400px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
                <asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button id="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			IV.其他投標廠商紀錄</td>
		</tr>
		<tr>
			<td class="auto-style14" colspan="4">
                <asp:Button id="Button5" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Text="新增其他投標廠商紀錄" Width="200px" />
            </td>
		</tr>
		<tr>
			<td class="auto-style12" colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" Text="編輯" >
                        <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                        </asp:ButtonField>
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
                        <asp:ControlParameter ControlID="DropDownList3" Name="BID" PropertyName="SelectedValue" Type="Int32" />
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
