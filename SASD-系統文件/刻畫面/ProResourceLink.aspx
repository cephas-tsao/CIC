﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProResourceLink.aspx.cs" Inherits="ProResourceLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">




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
    <form id="form2" runat="server">
    <div>
    
                                    <table class="Table1">
                                        <tr>
                                            <td class="auto-style75">專案工料資料庫</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-styleD12">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">有無單價分析</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">工料名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="Button20_Click" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList33" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                                <asp:ListItem Value="1">有單價分析</asp:ListItem>
                                                                <asp:ListItem Value="0">無單價分析</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" GridLines="None" Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="選取工料" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button21" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Medium" Text="連結此工料" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName">
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
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [Pro_Resource] WHERE ([ProjectCode] = @ProjectCode)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="ProjectCode" SessionField="ProjectCode" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
    
    </div>
    </form>
</body>
</html>
