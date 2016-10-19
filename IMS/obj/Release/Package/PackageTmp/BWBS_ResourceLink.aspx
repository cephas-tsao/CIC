<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BWBS_ResourceLink.aspx.cs" Inherits="IMS.BWBS_ResourceLink" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
 .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
        .auto-style34A {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: center;
	color: #000000;
}
        .auto-style34 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}


        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
            border-bottom:ridge;
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
    width:50%;
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
                

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table class="Table1">
                                <tr>
                                    <td class="auto-style33">工項名稱</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="auto-style33">資源代碼</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="auto-style33">分析數量</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbAnaNumber" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                </tr>
                                </table>
                                    <table class="Table1">
                                        <tr>
                                            <td class="auto-style75">標案專屬工料資料庫</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-styleD12">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">有無單價分析</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">工料名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Res" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                                <asp:ListItem Value="1">有單價分析</asp:ListItem>
                                                                <asp:ListItem Value="2">無單價分析</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TxSearch" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"   DataSourceID="SqlDataSource1"
                                                    CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取工料" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button21" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="連結此工料" CommandArgument='<%# Container.DataItemIndex%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="PriceID" runat="server" Visible="false" Text='<%# Bind("PriceID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="工料名稱">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ItemName" runat="server"  Text='<%# Bind("ItemName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>                                                      
                                                           <asp:TemplateField HeaderText="單位">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Unit" runat="server"  Text='<%# Bind("Unit") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                           <asp:TemplateField HeaderText="資源編碼">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Code" runat="server"  Text='<%# Bind("Code") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                                        <%--<asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />--%>
                                                        <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                        <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox75" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Button ID="Complex" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"  CommandName="analyst"  CommandArgument='<%# Container.DataItemIndex%>'
                                                                 Text="有單價分析"    />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                      
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
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="<%=Sql%>"></asp:SqlDataSource>                                          
                                            </td>
                                        </tr>
                                    </table>
     <%--   <asp:GridView ID="GridView2" runat="server" ></asp:GridView>--%>
    
    </div>
    </form>
</body>
</html>

