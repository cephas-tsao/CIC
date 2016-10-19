<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EReallocation.aspx.cs" Inherits="EReallocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
    
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="TableTop" colspan="2">執行預算-拆工料</td>
		</tr>
        <tr>
			<td class="Table2C">
        <table style="width: 100%">
		    <tr>
		<td class="Table1">
                                變更次別</td>
            <td class="Table2CC">
                                    <asp:Label ID="Label182" runat="server" Text="0" ForeColor="Red"></asp:Label>
            </td>
            <td class="Table1L" colspan="5">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                上層工項(拆工料母項)</td>
		</tr>
		<tr>
		<td class="Table1">
                                項次</td>
            <td class="Table2" colspan="2">
                                    2</td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2" colspan="3">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="Table1">
                單位</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="Table1">
                數量</td>
            <td class="Table2">
                                    1,000</td>
            <td class="Table1">
                單價</td>
            <td class="Table2">
                                    3,045</td>
		</tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                下層新增工項(拆工料子項)</td>
		</tr>
		<tr>
		<td class="Table2C" colspan="7">
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">&nbsp;</td>
                                        <td class="ShtCellCC">工項名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">數量</td>
                                    </tr>
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong">140預拌混凝土</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem Selected="True">M3</asp:ListItem>
                                                <asp:ListItem>式</asp:ListItem>
                                                <asp:ListItem>包</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort">1,050</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="ShtRowDouble">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton191" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBlong">混凝土養護</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem>M3</asp:ListItem>
                                                <asp:ListItem Selected="True">式</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort">1,000</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
            </td>
		</tr>
		<tr>
		<td class="Table2R" colspan="7">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增子項" Width="27px" PostBackUrl="~/EReallocation_1.aspx" />
                                            </td>
		</tr>
		</table>
            </td>
			<td class="Table2C" width="35%">
                                    <table class="SB_Table_A">
                                        <tr>
                                            <td class="TableTop2">
                                                <asp:RadioButtonList ID="Radio_Ref" runat="server" OnSelectedIndexChanged="Radio_Ref_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="Private">共用工料庫</asp:ListItem>
                                                    <asp:ListItem Value="Execute">執行預算工料庫</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                                <asp:Panel ID="Pnl_Private" runat="server">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A" rowspan="2">搜<br /> 尋</td>
                                                            <td class="SB_Cell0C_A">工料名稱(關鍵字)</td>
                                                            <td class="SB_Cell0C_A" rowspan="2">
                                                                <asp:Button ID="Button18" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                                <br />
                                                                <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">
                                                                <asp:TextBox ID="TextBox24" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A" colspan="3">
                                                                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" Width="100%" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="5">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="引用">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowLEFT.jpg" ToolTip="下移" Width="27px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                        <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName" />
                                                                        <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#7C6F57" />
                                                                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#E3EAEB" />
                                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT [PriceID], [ItemName], [Unit] FROM [PrivateResource]"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <asp:Panel ID="Pnl_Execute" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A" rowspan="2">搜<br /> 尋</td>
                                                            <td class="SB_Cell0C_A">工料名稱(關鍵字)</td>
                                                            <td class="SB_Cell0C_A" rowspan="2">
                                                                <asp:Button ID="Button21" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                                <br />
                                                                <asp:Button ID="Button22" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">
                                                                <asp:TextBox ID="TextBox25" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell1C_A" colspan="3">
                                                                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" PageSize="5" Width="100%">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="引用">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButton192" runat="server" Height="30px" ImageUrl="~/img/ArrowLEFT.jpg" ToolTip="下移" Width="27px" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                        <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName" />
                                                                        <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#7C6F57" />
                                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#E3EAEB" />
                                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT [PriceID], [ItemName], [Unit] FROM [PrivateResource]"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        </table>
            </td>
		</tr>
        <tr>
			<td class="Table1" colspan="2">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" PostBackUrl="~/執預1.aspx" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預1.aspx" />
                                </td>
		</tr>
		    </table>
    
    </div>
    </form>
</body>
</html>
