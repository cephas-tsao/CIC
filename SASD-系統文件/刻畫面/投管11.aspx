<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>

<script runat="server">

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonList1.SelectedIndex)
        {
            case 0:
                Pnl_PreItem.Visible = true;
                Pnl_Foundation.Visible = false;
                Pnl_Retaining.Visible = false;
                break;
            case 1:
                Pnl_PreItem.Visible = false;
                Pnl_Foundation.Visible = true;
                Pnl_Retaining.Visible = false;
                break;
            case 2:
                Pnl_PreItem.Visible = false;
                Pnl_Foundation.Visible = false;
                Pnl_Retaining.Visible = true;
                break;
        }
    }
</script>

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
.auto-style3 {
	font-family: 微軟正黑體;
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #CE0000;
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
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
    .auto-style13 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        height: 45px;
        width: 200px;
    }
    .auto-style14 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        height: 24px;
    }
    </style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 85%">
		
		<tr>
			<td class="auto-style2" colspan="2" style="height: 29px"><strong>
			    常用資料維護</strong></td>
		</tr>

		<tr>
			<td class="auto-style7" style="height: 45px">常用資料種類</td>
			<td class="auto-style12" style="height: 45px">
			<asp:RadioButtonList id="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
				<asp:ListItem>投標應備事項</asp:ListItem>
				<asp:ListItem>構造物基礎型式</asp:ListItem>
				<asp:ListItem>開挖擋土措施</asp:ListItem>
			</asp:RadioButtonList>
			</td>
		</tr>

		</table>
    <asp:Panel ID="Pnl_PreItem" runat="server" Width="85%" Visible="False">
    
    <table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="auto-style3" colspan="6" style="height: 29px">投標應備項目管理</td>
		</tr>
		<tr>
			<td class="auto-style14" colspan="6">新增投標應備項目</td>

		</tr>
		<tr>
			<td class="auto-style13">項目名稱</td>
			<td class="auto-style12" style="height: 45px" colspan="2">
		        <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style7">承辦部門</td>
			<td class="auto-style12">
		        <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="True" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [DepartmentList]"></asp:SqlDataSource>
            </td>

			<td class="auto-style7">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px" />
		    </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">搜尋投標應備項目</td>
		</tr>
		<tr>
			<td class="auto-style13" rowspan="2">項目名稱(關鍵字)</td>
			<td class="auto-style12" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style7" style="height: 45px" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
			<td class="auto-style7" rowspan="2">承辦部門</td>
			<td class="auto-style12" rowspan="2">
		        <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="True" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                </asp:DropDownList>
                </td>

			<td class="auto-style7">
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px" />
		        <br />
		    </td>

		</tr>
		<tr>

			<td class="auto-style7">
		<asp:Button id="Button9" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px" />
		    </td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="6">刪修既有投標應備項目</td>

		</tr>
		<tr>
			<td class="auto-style12" colspan="6">
                <asp:GridView ID="GridView1" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                        <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                        <ItemStyle Width="120px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                        <asp:BoundField DataField="ItemName" HeaderText="應備項目名稱" SortExpression="ItemName" />
                        <asp:TemplateField HeaderText="負責部門" SortExpression="ResponseDept">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName" SelectedValue='<%# Bind("ResponseDept") %>'>
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResponseDept") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [BidPreItem] WHERE [UID] = @UID" InsertCommand="INSERT INTO [BidPreItem] ([ItemName], [ResponseDept]) VALUES (@ItemName, @ResponseDept)" SelectCommand="SELECT * FROM [BidPreItem]" UpdateCommand="UPDATE [BidPreItem] SET [ItemName] = @ItemName, [ResponseDept] = @ResponseDept WHERE [UID] = @UID">
                    <DeleteParameters>
                        <asp:Parameter Name="UID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ResponseDept" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ResponseDept" Type="String" />
                        <asp:Parameter Name="UID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>

		</tr>
		</table>
        </asp:Panel>
    <asp:Panel ID="Pnl_Foundation" runat="server" Width="85%" Visible="False">
    
    <table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="auto-style3" colspan="3">構造物基礎型式管理</td>

		</tr>
		<tr>
			<td class="auto-style1" colspan="3">新增構造物基礎型式</td>

		</tr>
        <tr>
			<td class="auto-style13">基礎型式名稱</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="auto-style7">
		<asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px" />
		    </td>

		</tr>
        <tr>
			<td class="auto-style1" colspan="3">搜尋構造物基礎型式</td>
		</tr>
        <tr>
			<td class="auto-style13" rowspan="2">基礎型式名稱(關鍵字)</td>
			<td class="auto-style12" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="auto-style7">
		<asp:Button id="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px" />
		        <br />
		    </td>

		</tr>
        <tr>

			<td class="auto-style7">
		<asp:Button id="Button8" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px" />
		    </td>

		</tr>
        <tr>
			<td class="auto-style1" colspan="3">刪修既有構造物基礎型式</td>

		</tr>
        <tr>
			<td class="auto-style12" colspan="3">
                <asp:GridView ID="GridView2" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="FoundationID" DataSourceID="SqlDataSource4">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                        <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                        <ItemStyle Width="120px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="FoundationID" HeaderText="FoundationID" InsertVisible="False" ReadOnly="True" SortExpression="FoundationID" Visible="False" />
                        <asp:BoundField DataField="FoundationName" HeaderText="基礎型式" SortExpression="FoundationName" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [Foundation] WHERE [FoundationID] = @FoundationID" InsertCommand="INSERT INTO [Foundation] ([FoundationName]) VALUES (@FoundationName)" SelectCommand="SELECT * FROM [Foundation]" UpdateCommand="UPDATE [Foundation] SET [FoundationName] = @FoundationName WHERE [FoundationID] = @FoundationID">
                    <DeleteParameters>
                        <asp:Parameter Name="FoundationID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FoundationName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FoundationName" Type="String" />
                        <asp:Parameter Name="FoundationID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>

		</tr>
		</table>
        </asp:Panel>
    <asp:Panel ID="Pnl_Retaining" runat="server" Width="85%" Visible="False">
    
    <table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="auto-style3" colspan="3">開挖擋土措施管理</td>

		</tr>
        <tr>
			<td class="auto-style1" colspan="3">新增開挖擋土措施</td>

		</tr>
        <tr>
			<td class="auto-style13">擋土措施名稱</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:TextBox ID="TextBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="auto-style7">
		<asp:Button id="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px" />
		    </td>

		</tr>
        <tr>
			<td class="auto-style1" colspan="3">搜尋開挖擋土措施</td>
		</tr>
        <tr>
			<td class="auto-style13" rowspan="2">擋土措施名稱(關鍵字)</td>
			<td class="auto-style12" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TextBox2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="auto-style7">
		<asp:Button id="Button6" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px" />
		        <br />
		    </td>

		</tr>
        <tr>

			<td class="auto-style7">
		<asp:Button id="Button7" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px" />
		    </td>

		</tr>
        <tr>
			<td class="auto-style1" colspan="3">刪修既有開挖擋土措施</td>

		</tr>
        <tr>
			<td class="auto-style12" colspan="3">
                <asp:GridView ID="GridView3" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RetainingID" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                        <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                        <ItemStyle Width="120px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="RetainingID" HeaderText="RetainingID" InsertVisible="False" ReadOnly="True" SortExpression="RetainingID" Visible="False" />
                        <asp:BoundField DataField="RetainingName" HeaderText="擋土措施" SortExpression="RetainingName" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [Retaining] WHERE [RetainingID] = @RetainingID" InsertCommand="INSERT INTO [Retaining] ([RetainingName]) VALUES (@RetainingName)" SelectCommand="SELECT * FROM [Retaining]" UpdateCommand="UPDATE [Retaining] SET [RetainingName] = @RetainingName WHERE [RetainingID] = @RetainingID">
                    <DeleteParameters>
                        <asp:Parameter Name="RetainingID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RetainingName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RetainingName" Type="String" />
                        <asp:Parameter Name="RetainingID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>

		</tr>
		</table>
        </asp:Panel>
</form>

</body>

</html>
