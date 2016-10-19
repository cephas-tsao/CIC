<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidSetting.aspx.cs" Inherits="IMS.BidSetting" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標單匯入</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">
 <body onkeydown = "return (event.keyCode!=13)">
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.TableTop {
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
.Table1 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.Table2 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
    .Table1 {
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

      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />

	<br />
	<table class="auto-style5" style="width: 100%; padding-left:200px">
		
		<tr>
			<td class="TableTop" colspan="2" style="height: 29px"><strong>
			    常用資料維護</strong></td>
		</tr>

		<tr>
			<td class="Table1" style="height: 45px">常用資料種類</td>
			<td class="Table2" style="height: 45px">
			<asp:RadioButtonList id="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="500px">
				<asp:ListItem>投標應備事項</asp:ListItem>
				<asp:ListItem>構造物基礎型式</asp:ListItem>
				<asp:ListItem>開挖擋土措施</asp:ListItem>
			</asp:RadioButtonList>
			</td>
		</tr>

		</table>
    <asp:Panel ID="Pnl_PreItem" runat="server" Width="85%" Visible="False">
    
    <table class="auto-style5" style="width: 100%;padding-left:200px">
		
		<tr>
			<td class="Table1" colspan="6" style="height: 45px">投標應備項目管理</td>
		</tr>
		<tr>
			<td class="TableTop" colspan="6">新增投標應備項目</td>

		</tr>
		<tr>
			<td class="Table1">項目名稱</td>
			<td class="Table2" style="height: 45px" colspan="2">
		        <asp:TextBox ID="TxItemName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="Table1">承辦部門</td>
			<td class="Table2">
		        <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="True" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT * FROM [DepartmentList]"></asp:SqlDataSource>
            </td>

			<td class="Table1">
		<asp:Button id="Bid_Add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px" OnClick="SaveAction"/>
		    </td>

		</tr>
		<tr>
			<td class="TableTop" colspan="6">搜尋投標應備項目</td>
		</tr>
		<tr>
			<td class="Table1" rowspan="2">項目名稱(關鍵字)</td>
			<td class="Table2" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TxSearch" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="Table1" style="height: 45px" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
			<td class="Table1" rowspan="2">承辦部門</td>
			<td class="Table2" rowspan="2">
		        <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="True" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                </asp:DropDownList>
                </td>

			<td class="Table1">
		<asp:Button id="Search" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px" OnClick="Search_Click" />
		        <br />
		    </td>

		</tr>
		<tr>

			<td class="Table1">
		<asp:Button id="ALL" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px" OnClick="ALL_Click" />
		    </td>

		</tr>
		<tr>
			<td class="TableTop" colspan="6">刪修既有投標應備項目</td>

		</tr>
		<tr>
			<td class="Table2" colspan="6">
                <asp:GridView ID="GridView1" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"  onclientclick="return confirm('確定要刪除嗎？')"/>
                            </ItemTemplate>
                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  DeleteCommand="DELETE FROM [BidPreItem] WHERE [UID] = @UID" InsertCommand="INSERT INTO [BidPreItem] ([ItemName], [ResponseDept]) VALUES (@ItemName, @ResponseDept)" SelectCommand="SELECT * FROM [BidPreItem]" UpdateCommand="UPDATE [BidPreItem] SET [ItemName] = @ItemName, [ResponseDept] = @ResponseDept WHERE [UID] = @UID">
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
    
    <table class="auto-style5" style="width: 100%;padding-left:200px">
		
		<tr>
			<td class="Table1" colspan="3">構造物基礎型式管理</td>

		</tr>
		<tr>
			<td class="TableTop" colspan="3">新增構造物基礎型式</td>

		</tr>
        <tr>
			<td class="Table1">基礎型式名稱</td>
			<td class="Table2" style="height: 45px">
		        <asp:TextBox ID="TxFoundationName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="Table1">
		<asp:Button id="Fd_Add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px" OnClick="Fd_Add_Click"/>
		    </td>

		</tr>
        <tr>
			<td class="TableTop" colspan="3">搜尋構造物基礎型式</td>
		</tr>
        <tr>
			<td class="Table1" rowspan="2">基礎型式名稱(關鍵字)</td>
			<td class="Table2" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TxFdSearch" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="Table1">
		<asp:Button id="FdSearch" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px" OnClick="FdSearch_Click" />
		        <br />
		    </td>

		</tr>
        <tr>

			<td class="Table1">
		<asp:Button id="FdALL" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px" OnClick="FdALL_Click" />
		    </td>

		</tr>
        <tr>
			<td class="TableTop" colspan="3">刪修既有構造物基礎型式</td>

		</tr>
        <tr>
			<td class="Table2" colspan="3">
                <asp:GridView ID="GridView2" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="FoundationID" DataSourceID="SqlDataSource4">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" onclientclick="return confirm('確定要刪除嗎？')" />
                            </ItemTemplate>
                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FoundationID" HeaderText="FoundationID" InsertVisible="False" ReadOnly="True" SortExpression="FoundationID" Visible="False" />
                        <asp:BoundField DataField="FoundationName" HeaderText="基礎型式" SortExpression="FoundationName" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server"  DeleteCommand="DELETE FROM [Foundation] WHERE [FoundationID] = @FoundationID" InsertCommand="INSERT INTO [Foundation] ([FoundationName]) VALUES (@FoundationName)" SelectCommand="SELECT * FROM [Foundation]" UpdateCommand="UPDATE [Foundation] SET [FoundationName] = @FoundationName WHERE [FoundationID] = @FoundationID">
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
    
    <table class="auto-style5" style="width: 100%;padding-left:200px">
		
		<tr>
			<td class="Table1" colspan="3">開挖擋土措施管理</td>

		</tr>
        <tr>
			<td class="TableTop" colspan="3">新增開挖擋土措施</td>

		</tr>
        <tr>
			<td class="Table1">擋土措施名稱</td>
			<td class="Table2" style="height: 45px">
		        <asp:TextBox ID="TxRetainingWall" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="Table1">
		<asp:Button id="BtRetaining" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="50px"  OnClick="BtRetaining_Click"/>
		    </td>

		</tr>
        <tr>
			<td class="TableTop" colspan="3">搜尋開挖擋土措施</td>
		</tr>
        <tr>
			<td class="Table1" rowspan="2">擋土措施名稱(關鍵字)</td>
			<td class="Table2" style="height: 45px" rowspan="2">
		        <asp:TextBox ID="TxRetaining" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

			<td class="Table1">
		<asp:Button id="BtRetainingSearch" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="50px"  OnClick="BtRetainingSearch_Click"/>
		        <br />
		    </td>

		</tr>
        <tr>

			<td class="Table1">
		<asp:Button id="RetainingAll" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="50px"  OnClick="RetainingAll_Click" />
		    </td>

		</tr>
        <tr>
			<td class="TableTop" colspan="3">刪修既有開挖擋土措施</td>

		</tr>
        <tr>
			<td class="Table2" colspan="3">
                <asp:GridView ID="GridView3" Width="85%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RetainingID" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" onclientclick="return confirm('確定要刪除嗎？')"/>
                            </ItemTemplate>
                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RetainingID" HeaderText="RetainingID" InsertVisible="False" ReadOnly="True" SortExpression="RetainingID" Visible="False" />
                        <asp:BoundField DataField="RetainingName" HeaderText="擋土措施" SortExpression="RetainingName" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"  DeleteCommand="DELETE FROM [Retaining] WHERE [RetainingID] = @RetainingID" InsertCommand="INSERT INTO [Retaining] ([RetainingName]) VALUES (@RetainingName)" SelectCommand="SELECT * FROM [Retaining]" UpdateCommand="UPDATE [Retaining] SET [RetainingName] = @RetainingName WHERE [RetainingID] = @RetainingID">
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
</body>
</asp:Content>