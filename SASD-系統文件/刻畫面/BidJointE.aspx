<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidJointE.aspx.cs" Inherits="BidJointE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop">共同投標廠商管理</td>
            </tr>
            <tr>
                <td class="Table0">
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_Add" runat="server" ForeColor="White" OnClick="LBtn_Add_Click">新增共同投標廠商</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DropDownList9" runat="server" CssClass="DDLlong">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">共同投標項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">共同投標金額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1" colspan="2">
                        <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="確定新增" />
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" CssClass="BtnFree" Text="全部清空" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_Add0" runat="server" ForeColor="White">共同投標廠商清單</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2LC">
			<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					<asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
						<ControlStyle Font-Names="微軟正黑體" Font-Size="Small" CssClass="BtnFree" />
<ControlStyle Font-Names="微軟正黑體" Font-Size="Small"></ControlStyle>
						<ItemStyle Width="100px" CssClass="BtnFree" />
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
				<EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />

			</asp:GridView>
			    </td>
            </tr>
        </table>
    
    </div>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=WANG-PC\SQLEXPRESS;Initial Catalog=CICIMS;User ID=CICIMS;Password=ntustCIC419" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID">
			</asp:SqlDataSource>
    </form>
</body>
</html>
