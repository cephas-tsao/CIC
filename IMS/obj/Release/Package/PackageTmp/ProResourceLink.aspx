<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProResourceLink.aspx.cs" Inherits="IMS.ProResourceLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">
     
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
    <form id="form2" runat="server">
     <div>
      <table class="Table100">
                                <tr>
                                    <td class="Table1">工項名稱</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="Table1">單位</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="Table1">資源代碼</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="Table1">分析數量</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAnaNumber" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                </tr>
                                </table>
                                    <table class="Table100">
                                        <tr>
                                            <td class="TableTop">專案工料資料庫</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2">
                                                <table class="Table100">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="Table2">工料種類</td>
                                                        <td class="Table1" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                        </td>
                                                        <td class="Table2">工料名稱(關鍵字)</td>
                                                        <td class="Table1" rowspan="2">
                                                            <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="Table2">
                                                            <asp:DropDownList ID="DDL_Res" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                               <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                                        <asp:ListItem >拆工拆料項</asp:ListItem>
                                                                        <asp:ListItem >連工帶料項</asp:ListItem>                                       
                                                                        <asp:ListItem >材料</asp:ListItem>
                                                                        <asp:ListItem >機具</asp:ListItem>
                                                                        <asp:ListItem >人力</asp:ListItem>
                                                                        <asp:ListItem >雜項</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="Table2">
                                                            <asp:TextBox ID="TxSearch" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                                                    CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" DataSourceID="SqlDataSource1" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
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
                                                          <%--  <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox75" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                            </EditItemTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Complex" runat="server" Text='<%# Bind("Complex") %>' Visible="false"></asp:Label>
                                                                <asp:Button ID="BtnAnalyst" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢單價分析" CommandName="analyst"  CommandArgument='<%# Container.DataItemIndex%>' />
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
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="<%=Sql%>" >                                                    
                                                   <%-- <SelectParameters>
                                                        <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                                    </SelectParameters>--%>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
    
    </div>
    </form>
</body>
</html>