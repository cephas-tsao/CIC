<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidRecordV.aspx.cs" Inherits="IMS.BidRecordV" %>

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
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
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
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>


<form id="form1" runat="server">
	<br />
	<table class="Table100" style="width: 100%">
		
		<tr>
			<td class="Table1" style="width: 30%; height: 45px;">標案名稱</td>
			<td class="auto-style2"><asp:Label ID="LbBidName" runat="server" ></asp:Label>
                </td>
		</tr>
		</table>
    <table class="auto-style5" style="width: 100%; height: 587px">

		<tr>
			<td class="TableTop" colspan="6" style="height: 29px"><strong>
			    決標紀錄檢視</strong></td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; I.公告招標資訊</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbOwnerName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">預算金額</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbBudgetAmount" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbEngLocation" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">是否共同投標</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbJointBidNY" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">決標方式</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbAwardingType" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">開標時間</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbOpenBidTime" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">業主聯絡人</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbOwnerContactPerson" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">業主連絡電話</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbOwnerContactTel" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; II.決標主紀錄</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">決標結果</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbResult" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>
			<td class="Table1">得標廠商</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbGetFirm" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">得標金額</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbAwardPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>
			<td class="Table1">底價金額</td>
			<td class="auto-style2">
		        <asp:Label ID="LbUpsetPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
            </td>

			<td class="Table1">標比</td>

			<td class="auto-style2">
		        <asp:Label ID="LbBidRatio" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; III.決標明細紀錄</td>

		</tr>
		<tr>
			<td class="Table1">參與開標人員</td>
			<td class="auto-style2">
		        <asp:Label ID="LbBidStaff" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
            </td>
			<td class="Table1">最初投標金額</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbBidPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">優先減價金額</td>
			<td class="auto-style2" style="height: 45px">
		        <asp:Label ID="LbFirstDiscountPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
            </td>
			<td class="Table1">最後減價金額</td>
			<td class="auto-style2" colspan="3">
		        <asp:Label ID="LbLastDiscountPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">備註</td>
			<td class="auto-style2" style="height: 45px" colspan="5">
		        <asp:Label ID="LbNotes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp; 
			IV.其他投標廠商紀錄</td>
		</tr>
		<tr>
			<td class="auto-style12" colspan="6">
                <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
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
                        <%--<asp:BoundField DataField="NoReason" HeaderText="不合格/未得標原因" SortExpression="NoReason" />--%>
                          <asp:TemplateField HeaderText="不合格/未得標原因">
                            <ItemTemplate>                           
                                 <asp:Label id="LbNoReason" runat="server"  Text='<%# Eval("NoReason")%>'></asp:Label>
                            </ItemTemplate>                       
                        </asp:TemplateField>
                        <asp:BoundField DataField="LowReason" HeaderText="標價偏低理由" SortExpression="LowReason" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"  >
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
