<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewItem.aspx.cs" Inherits="AddNewItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style2C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align: center;
	        color: #000000;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFBD6;
	        text-align:left;
	        color: #000000;
        }
        .Table3 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
        }
            .auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    vertical-align:top;
}


        .auto-style63 {
            width: 100%;
            vertical-align:central;
            border:dashed;
        }
        .auto-style66 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style64 {
            width: 35%;
            vertical-align:central;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
        }
                    
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
.auto-style11 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #BB3D00;
	text-align: center;
	color: #FFFFFF;
}
            .auto-style76 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #BB3D00;
            text-align: center;
            color: #FFFFFF;
            height: 27px;
        }
            .auto-style77 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 60px;
        }
        .auto-style78 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
            .auto-style79 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 44px;
        }
        .auto-style80 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            }
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 100%">
                <tr>
                    <td class="auto-style1">插入缺漏項</td>
                </tr>
            </table>
        <asp:Panel ID="Pnl_WBS" runat="server" Visible="False">
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style11" colspan="6">WBS缺漏項插補</td>
                </tr>
                <tr>
                    <td class="auto-style77">插補位置<br /> (原工項之後)</td>
                    <td class="auto-style78" colspan="4">
                        <asp:DropDownList ID="DropDownList17" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="FullName" DataValueField="LayerCode" Font-Size="Medium" Height="30px" Width="300px">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT LayerCode, ItemOrder + ' ' + Item AS FullName FROM XBid1DB ORDER BY LayerCode"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style2C" rowspan="2">
                        <asp:Button ID="Button24" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" />
                        <br />
                        <asp:Button ID="Button25" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="關閉視窗" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2C">缺漏項名稱</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label7" runat="server" Text="缺漏項工項名稱" Width="200px"></asp:Label>
                    </td>
                    <td class="auto-style2C">單位</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label6" runat="server" Text="缺漏項單位"></asp:Label>
                    </td>
                    <td class="auto-style2C">
                        <asp:Label ID="Label8" runat="server" Text="有/無單價分析"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
        <asp:Panel ID="Pnl_Analysis" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style76" colspan="7">單價分析表缺漏項插補</td>
                </tr>
                <tr>
                    <td class="auto-style79">父項名稱</td>
                    <td class="auto-style80" colspan="3">
                        <asp:Label ID="Label9" runat="server" Text="清除及堀除" Width="200px"></asp:Label>
                    </td>
                    <td class="auto-style79">單位</td>
                    <td class="auto-style80">
                        <asp:Label ID="Label10" runat="server" Text="M2"></asp:Label>
                    </td>
                    <td class="auto-style2C" rowspan="2">
                        <asp:Button ID="Button26" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" />
                        <br />
                        <asp:Button ID="Button27" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="關閉視窗" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2C">缺漏項名稱</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label12" runat="server" Text="缺漏項工項名稱" Width="200px"></asp:Label>
                    </td>
                    <td class="auto-style2C">單位</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label13" runat="server" Text="缺漏項單位"></asp:Label>
                    </td>
                    <td class="auto-style2C" colspan="2">
                        <asp:Label ID="Label14" runat="server" Text="有/無單價分析"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                                        <asp:Panel ID="Pnl_Import" runat="server">
                                            <table class="Table3">
                                                <tr>
                                                    <td class="auto-style75">標案專屬工料資料庫</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-styleD12">
                                                        <table class="auto-style63">
                                                            <tr>
                                                                <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                                <td class="auto-style64">工項種類</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                    <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">工項名稱(關鍵字)</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                                    <br />
                                                                    <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style64">
                                                                    <asp:DropDownList ID="DropDownList33" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                                        <asp:ListItem Value="0">不分類</asp:ListItem>
                                                                        <asp:ListItem Value="X">工項</asp:ListItem>
                                                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">
                                                                    <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" GridLines="None" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button21" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="插入工項" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                <asp:BoundField DataField="ItemName" HeaderText="工項名稱" SortExpression="ItemName">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                                                <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                                                <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                                <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox75" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button23" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢單價分析" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="AnaNumber" HeaderText="AnaNumber" SortExpression="AnaNumber" Visible="False" />
                                                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                                                <asp:BoundField DataField="BPrice" HeaderText="BPrice" SortExpression="BPrice" Visible="False" />
                                                                <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                                                <asp:BoundField DataField="CReferenceID" HeaderText="CReferenceID" SortExpression="CReferenceID" Visible="False" />
                                                                <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
                                                                <asp:BoundField DataField="CReferenceNumber" HeaderText="CReferenceNumber" SortExpression="CReferenceNumber" Visible="False" />
                                                                <asp:BoundField DataField="Labor" HeaderText="Labor" SortExpression="Labor" Visible="False" />
                                                                <asp:BoundField DataField="Equipment" HeaderText="Equipment" SortExpression="Equipment" Visible="False" />
                                                                <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" Visible="False" />
                                                                <asp:BoundField DataField="MisWork" HeaderText="MisWork" SortExpression="MisWork" Visible="False" />
                                                                <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                                                <asp:BoundField DataField="NewItem" HeaderText="NewItem" SortExpression="NewItem" Visible="False" />
                                                                <asp:BoundField DataField="ItemKind" HeaderText="ItemKind" SortExpression="ItemKind" Visible="False" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
    
    </div>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [Bid_Library] WHERE ([BID] = @BID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
    </form>
</body>
</html>
