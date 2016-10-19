<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnalysisEdit.aspx.cs" Inherits="IMS.AnalysisEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
        <link rel="stylesheet" type="text/css" href="CSS/Normal.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style33L {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: left;
	color: #000000;
}
    
        .auto-style72 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 33px;
        }
        .auto-style73 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 33px;
        }
        .auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
	text-align: center;
	color: #FFFFFF;
    }
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
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
        .auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFD2D2;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
            .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
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
                                        <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="Table1">單位</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="Table1">資源代碼</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="Table1">分析數量</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TxAnaNumber" runat="server" Font-Size="Large" Height="25px" Width="100px" Font-Bold="True"></asp:TextBox>
                                        <asp:Button ID="BtnEdit" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="修改" Width="54px" OnClick="BtnEdit_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table2" colspan="8">
     
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="ClearWBSAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="清空所有子項" Width="120px" OnClick="ClearWBSAll_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="AddRow" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加工料項目" Width="120px" OnClick="AddRow_Click" />
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="SaveWBS" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存所有項目" Width="120px" OnClick="SaveWBS_Click"/>
                                    </td>
                                </tr>
                            </table>
     
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="100%" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" >
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                     <asp:Button ID="Delete" runat="server" CommandName="Earse" CommandArgument='<%# Container.DataItemIndex%>' Text="刪除" CssClass="BtnFree"></asp:Button>  
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="PriceID" runat="server" Text='<%# Bind("PriceID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField  HeaderText="序號" >
                                            <ItemTemplate>
                                               <asp:TextBox ID="TxSort" runat="server" Text='<%# Bind("SortNum") %>' Width="30px" CssClass="TBshort"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TxSort" runat="server" Text='<%# Bind("SortNum") %>' Width="30px" CssClass="TBshort"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="工料項目種類">
                                            <ItemTemplate>
                                               <asp:DropDownList ID="ItemKind" runat="server" Font-Size="Medium" Height="30px" Width="100px">
                                              <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                               </asp:DropDownList>
                                            </ItemTemplate>
                                          <EditItemTemplate>
                                               <asp:DropDownList ID="ItemKind" runat="server" Font-Size="Medium" Height="30px" Width="100px">
                                                 <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                               </asp:DropDownList>
                                          </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="工料項目名稱">
                                            <ItemTemplate>
                                                   <asp:TextBox ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>' CssClass="TBlong"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                  <asp:TextBox ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>' CssClass="TBlong"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="單位">
                                            <ItemTemplate>
                                            <asp:DropDownList ID="DDL_EdUnit" DataSource='<%# Utility.Unitlist.UnitList() %>' Text='<%# Bind("Unit") %>' runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Value="0" Selected="True">-請選擇-</asp:ListItem></asp:DropDownList>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                              <asp:DropDownList ID="DDL_EdUnit" DataSource='<%# Utility.Unitlist.UnitList() %>' Text='<%# Bind("Unit") %>'  runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Value="0" Selected="True">-請選擇-</asp:ListItem></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="單價分析">
                                            <ItemTemplate>
                                                 <asp:ImageButton ID="Complex" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px"  Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' Enabled="false" />  <%--Visible='<%# aaaa()  %>'  --%>                                               
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                 <asp:ImageButton ID="Complex" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px"  Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="資源編碼">
                                            <ItemTemplate>
                                                  <asp:TextBox ID="Code" runat="server" Text='<%# Bind("Code") %>' CssClass="TBshort"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                  <asp:TextBox ID="Code" runat="server" Text='<%# Bind("Code") %>' CssClass="TBshort"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="數量">
                                            <ItemTemplate>
                                                  <asp:TextBox ID="Quantity" runat="server" Text='<%# Bind("Number") %>' CssClass="TBshort"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                  <asp:TextBox ID="Quantity" runat="server" Text='<%# Bind("Number") %>' CssClass="TBshort"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="備註">
                                            <ItemTemplate>
                                                 <asp:TextBox ID="Notes" runat="server" Text='<%# Bind("Notes") %>' CssClass="TBlong"></asp:TextBox>
                                                 <asp:Label runat="server" ID="Price" Text='<%# Bind("Price") %>' Visible="false"></asp:Label>
                                                  <asp:Label runat="server" ID="Kind" Text='<%# Bind("Kind") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                 <asp:TextBox ID="Notes" runat="server" Text='<%# Bind("Notes") %>' CssClass="TBlong"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>                                    
                                      <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle  CssClass="Table1" />
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
                   
                            <table class="Table100">
                                    <tr>
                                    <td class="Table1"  style="text-align:left">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">自公用工料資料庫代入</asp:LinkButton>
                                        </td>
                                </tr>
                                    <tr>
                                    <td class="Table2">
                                        <asp:Panel ID="Pnl_Import" runat="server" Visible="False">
                                            <table class="Table100">
                                                <tr>
                                                    <td class="Table0">標案專屬工料資料庫</td>
                                                </tr>
                                                <tr>
                                                    <td class="Table2">
                                                        <table class="Table100">
                                                            <tr>
                                                                <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                                <td class="Table1">工料種類</td>
                                                                <td class="Table2" rowspan="2">
                                                                    <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="Table1">工料名稱(關鍵字)</td>
                                                                <td class="Table1" rowspan="2">
                                                                    <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                                    <br />
                                                                    <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="Table1">
                                                                    <asp:DropDownList ID="DDL_WBS" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                                         <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                                        <asp:ListItem Value="X1">拆工拆料項</asp:ListItem>
                                                                        <asp:ListItem Value="X2">連工帶料項</asp:ListItem>                                       
                                                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="Table2">
                                                                    <asp:TextBox ID="TxSearch" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                                                            DataKeyNames="PriceID" DataSourceID="SqlDataSource2" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="選取工料" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="代入項目" CommandArgument='<%# Container.DataItemIndex%>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField Visible="false">
                                                                    <ItemTemplate>
                                                                      <asp:Label ID="PriceID" runat="server" Text='<%# Bind("PriceID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="工料名稱">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--<asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                <asp:BoundField DataField="ItemName" HeaderText="工項名稱" SortExpression="ItemName">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>--%>
                                                                <asp:TemplateField HeaderText="單位">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Unit" runat="server" Text='<%# Bind("Unit") %>' ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="資源編碼">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Code" runat="server" Text='<%# Bind("Code") %>' ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--<asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                                                <%--<asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />--%>
                                                                <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                                <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="Complex" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Complex" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Price" runat="server" Text='<%# Bind("Complex") %>' Visible="false" ></asp:Label>
                                                                              <asp:Label ID="ItemKind" runat="server" Text='<%# Bind("ItemKind") %>' Visible="false" ></asp:Label>
                                                                            <asp:Label ID="Kind" runat="server"  Visible="false" ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="AnaNumber" HeaderText="AnaNumber" SortExpression="AnaNumber" Visible="False" />
                                                                <%--<asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />--%>
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
                                                                <%--<asp:BoundField DataField="ItemKind" HeaderText="ItemKind" SortExpression="ItemKind" Visible="False" />--%>
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
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                            SelectCommand="<%=Sql%>"    
                                                            UpdateCommand="UPDATE [Bid1DB_Library] SET [ItemName] = @ItemName, [Unit] = @Unit, [Type] = @Type, [Code] = @Code, [PccCode] = @PccCode, [Complex] = @Complex, [AnaNumber] = @AnaNumber, [Price] = @Price, [BPrice] = @BPrice, [ReferenceID] = @ReferenceID, [CReferenceID] = @CReferenceID, [ReferenceNumber] = @ReferenceNumber, [CReferenceNumber] = @CReferenceNumber, [Labor] = @Labor, [Equipment] = @Equipment, [Material] = @Material, [MisWork] = @MisWork, [Notes] = @Notes, [NewItem] = @NewItem, [ItemKind] = @ItemKind WHERE [PriceID] = @PriceID">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="PriceID" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="ItemName" Type="String" />
                                                                <asp:Parameter Name="Unit" Type="String" />
                                                                <asp:Parameter Name="Type" Type="String" />
                                                                <asp:Parameter Name="Code" Type="String" />
                                                                <asp:Parameter Name="PccCode" Type="String" />
                                                                <asp:Parameter Name="Complex" Type="Int32" />
                                                                <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                                                <asp:Parameter Name="Price" Type="Decimal" />
                                                                <asp:Parameter Name="BPrice" Type="Decimal" />
                                                                <asp:Parameter Name="ReferenceID" Type="String" />
                                                                <asp:Parameter Name="CReferenceID" Type="String" />
                                                                <asp:Parameter Name="ReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="CReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="Labor" Type="Decimal" />
                                                                <asp:Parameter Name="Equipment" Type="Decimal" />
                                                                <asp:Parameter Name="Material" Type="Decimal" />
                                                                <asp:Parameter Name="MisWork" Type="Decimal" />
                                                                <asp:Parameter Name="Notes" Type="String" />
                                                                <asp:Parameter Name="NewItem" Type="Int32" />
                                                                <asp:Parameter Name="ItemKind" Type="String" />
                                                            </InsertParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="ItemName" Type="String" />
                                                                <asp:Parameter Name="Unit" Type="String" />
                                                                <asp:Parameter Name="Type" Type="String" />
                                                                <asp:Parameter Name="Code" Type="String" />
                                                                <asp:Parameter Name="PccCode" Type="String" />
                                                                <asp:Parameter Name="Complex" Type="Int32" />
                                                                <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                                                <asp:Parameter Name="Price" Type="Decimal" />
                                                                <asp:Parameter Name="BPrice" Type="Decimal" />
                                                                <asp:Parameter Name="ReferenceID" Type="String" />
                                                                <asp:Parameter Name="CReferenceID" Type="String" />
                                                                <asp:Parameter Name="ReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="CReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="Labor" Type="Decimal" />
                                                                <asp:Parameter Name="Equipment" Type="Decimal" />
                                                                <asp:Parameter Name="Material" Type="Decimal" />
                                                                <asp:Parameter Name="MisWork" Type="Decimal" />
                                                                <asp:Parameter Name="Notes" Type="String" />
                                                                <asp:Parameter Name="NewItem" Type="Int32" />
                                                                <asp:Parameter Name="ItemKind" Type="String" />
                                                                <asp:Parameter Name="PriceID" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        </td>
                                </tr>
                                    </table>

    
    </div>

                        <br />

    </form>
</body>
</html>
