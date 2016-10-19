<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProLibrary.aspx.cs" Inherits="ProLibrary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">

        .auto-style67 {
            width: 100%;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
        }
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2L {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: left;
	        color: #000000;
        }
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #97CBFF;
	text-align: center;
	color: #000000;
}



        .auto-style36 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 26px;
        }



        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


        .auto-style69 {
            width: 657px;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
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
            .auto-style63 {
            width: 100%;
            vertical-align:central;
        }
        .auto-style68 {
            width: 6%;
        }
        
        .auto-style64 {
            width: 35%;
            vertical-align:central;
            text-align:center;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
            text-align:center;
        }
        .auto-style70 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            width: 657px;
        }



        .auto-style2R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align:right;
	        color: #000000;
            width:10%;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        <br />
    
        <table class="Table100">
            <tr>
                <td class="auto-style1">合約工料資料庫</td>
            </tr>
            <tr>
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">新增工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Pnl_Add" runat="server" Visible="False">
                        <table class="Table100">
                            <tr>
                                <td class="auto-style33">工料種類</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList32" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">連工帶料項</asp:ListItem>
                                        <asp:ListItem Value="X2">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33">工料名稱</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Height="25px" Width="800px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">單位</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList36" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style33">資源編碼</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox21" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">備註</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox44" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style33" colspan="2">
                                    <asp:Button ID="Button25" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="100px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            </table>
        <table class="auto-style67">
            <tr>
                <td class="auto-style2L" colspan="2">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">匯入共用工料資料庫之工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Import" runat="server" Visible="False">
                        <table class="auto-style67">
                            <tr>
                                <td class="auto-style69">
                                    <asp:ListBox ID="ListBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="500px" Width="100%"></asp:ListBox>
                                </td>
                                <td class="auto-style3C" width="60px" rowspan="2">
                                    <asp:Button ID="Button21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&lt;&lt;" Width="50px" />
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&gt;&gt;" Width="50px" />
                                </td>
                                <td class="auto-styleD22" rowspan="2">
                                    <table class="auto-style63">
                                        <tr>
                                            <td class="auto-style68" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style64">工項種類</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">工項名稱(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="Button18" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                <br />
                                                <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style64">
                                                <asp:DropDownList ID="DropDownList34" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                    <asp:ListItem Value="0">不分類</asp:ListItem>
                                                    <asp:ListItem Value="X1">連工帶料項</asp:ListItem>
                                                    <asp:ListItem Value="X2">拆工拆料項</asp:ListItem>
                                                    <asp:ListItem Value="M">材料</asp:ListItem>
                                                    <asp:ListItem Value="E">機具</asp:ListItem>
                                                    <asp:ListItem Value="L">人力</asp:ListItem>
                                                    <asp:ListItem Value="W">雜項</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">
                                                <asp:TextBox ID="TextBox24" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" Width="100%" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                            <asp:DynamicField DataField="ItemName" HeaderText="工料名稱" />
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                            <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                            <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
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
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT * FROM [PrivateResource]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style70">
                                    <asp:Button ID="Button23" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="存入合約工料資料庫" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button24" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清空列表" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2L" colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">工料項目搜尋</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Search" runat="server" Visible="False">
                        <table class="auto-style63">
                            <tr>
                                <td class="auto-style64">工料種類</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium">
                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                        <asp:ListItem Value="NOT">非</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style64">工料名稱(關鍵字)</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style64">
                                    <asp:DropDownList ID="DropDownList33" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                        <asp:ListItem Value="0">不分類</asp:ListItem>
                                        <asp:ListItem Value="X1">連工帶料項</asp:ListItem>
                                        <asp:ListItem Value="X2">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style64">
                                    <asp:TextBox ID="TextBox22" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Font-Underline="True" ForeColor="Red" Text="工料項目總覽"></asp:Label>
                </td>
                <td class="auto-style2R">
                                    <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示全部" Width="100px" />
                                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource4" GridLines="None" Width="100%" ForeColor="#333333" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Medium" Text="編修工料項目" OnClick="Button1_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ItemName" HeaderText="資源名稱" SortExpression="ItemName" />
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button26" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="單價分析" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CPrice" HeaderText="合約單價" SortExpression="CPrice" />
                                            <asp:BoundField DataField="CAmount" HeaderText="合約工程用量" SortExpression="CAmount" />
                                            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" DeleteCommand="DELETE FROM [Pro_Resource] WHERE [PriceID] = @PriceID" InsertCommand="INSERT INTO [Pro_Resource] ([PID], [ItemName], [Unit], [Code], [Complex], [AnaNumber], [RFQ_Code], [CPrice], [EPrice], [CAmount], [EAmount], [Notes], [ItemKind], [ResourceNY]) VALUES (@PID, @ItemName, @Unit, @Code, @Complex, @AnaNumber, @RFQ_Code, @CPrice, @EPrice, @CAmount, @EAmount, @Notes, @ItemKind, @ResourceNY)" SelectCommand="SELECT * FROM [Pro_Resource] WHERE ([PID] = @PID) ORDER BY [PriceID] DESC" UpdateCommand="UPDATE [Pro_Resource] SET [PID] = @PID, [ItemName] = @ItemName, [Unit] = @Unit, [Code] = @Code, [Complex] = @Complex, [AnaNumber] = @AnaNumber, [RFQ_Code] = @RFQ_Code, [CPrice] = @CPrice, [EPrice] = @EPrice, [CAmount] = @CAmount, [EAmount] = @EAmount, [Notes] = @Notes, [ItemKind] = @ItemKind, [ResourceNY] = @ResourceNY WHERE [PriceID] = @PriceID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PID" Type="String" />
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="RFQ_Code" Type="String" />
                                            <asp:Parameter Name="CPrice" Type="Decimal" />
                                            <asp:Parameter Name="EPrice" Type="Decimal" />
                                            <asp:Parameter Name="CAmount" Type="Decimal" />
                                            <asp:Parameter Name="EAmount" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                            <asp:Parameter Name="ResourceNY" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PID" Type="String" />
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="RFQ_Code" Type="String" />
                                            <asp:Parameter Name="CPrice" Type="Decimal" />
                                            <asp:Parameter Name="EPrice" Type="Decimal" />
                                            <asp:Parameter Name="CAmount" Type="Decimal" />
                                            <asp:Parameter Name="EAmount" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                            <asp:Parameter Name="ResourceNY" Type="Int32" />
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Edit" runat="server" Visible="False">
        <table class="auto-style67">
            <tr>
                <td class="auto-style2L" colspan="6">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server">工料項目編修</asp:LinkButton>
                </td>
            </tr>
                            <tr>
                                <td class="auto-style33">工料種類</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">連工帶料項</asp:ListItem>
                                        <asp:ListItem Value="X2">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33">工料名稱</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox45" runat="server" Font-Size="Medium" Height="25px" Width="800px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">單位</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        <tr>
                            <td class="auto-style33">資源編碼</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TextBox46" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style33">備註</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TextBox47" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style33" colspan="2">
                                <asp:Button ID="Button27" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定修改" Width="100px" />
                                &nbsp;
                                <asp:Button ID="Button30" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除此項目" Width="120px" />
                                &nbsp;
                                <asp:Button ID="Button28" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="結束" />
                            </td>
            </tr>
                        </table>
                    </asp:Panel>
                
        <br />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT PriceID, PID, ItemName, Unit, Code, Complex, AnaNumber, RFQ_Code, CPrice, EPrice, CAmount, EAmount, Notes, ItemKind, ResourceNY FROM Pro_Resource WHERE (PID = @PID) ORDER BY PriceID DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PriojectCode" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
