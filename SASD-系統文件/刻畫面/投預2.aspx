<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投預2.aspx.cs" Inherits="投預2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #800000;
	        text-align: center;
	        color: #FFFFFF;
            height: 27px;
        }
        .auto-style2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align: center;
	        color: #000000;
        }
        .auto-style2L {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align: left;
	        color: #000000;
        }
        .auto-style2R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align:right;
	        color: #000000;
            width:10%;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFBD6;
	        text-align:left;
	        color: #000000;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFBD6;
	        text-align:center;
	        color: #000000;
        }
        .auto-style63 {
            width: 100%;
            vertical-align:central;
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
        .auto-style67 {
            width: 100%;
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
            .Table2 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style68 {
            width: 6%;
        }
        
        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}



        .auto-style36 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 26px;
        }



        .auto-style69 {
            width: 657px;
        }
        .auto-style70 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: center;
            color: #000000;
            width: 657px;
        }



        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style67">
            <tr>
                <td class="auto-style2" width="30%">請選擇標案</td>
                <td class="auto-style3">
		<asp:DropDownList id="DropDownList3" AppendDataBoundItems="true" runat="server" Height="50px" Width="300px" Font-Size="Medium" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
		        </td>
            </tr>
            </table>
        <table class="auto-style67">
            <tr>
                <td class="auto-style1" colspan="2">標案專屬工料資料庫</td>
            </tr>
            <tr>
                <td class="auto-style2L" colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">新增工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Add" runat="server" Visible="False">
                        <table class="TableUp">
                            <tr>
                                <td class="auto-style33">工料種類</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList32" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="155px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X">工項</asp:ListItem>
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
                        </table>
                        <table class="TableDown">
                            <tr>
                                <td class="auto-style33">資源編碼</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox21" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">備註</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TextBox44" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">有無單價分析</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DropDownList31" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" Enabled="False">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="1">有下層單價分析</asp:ListItem>
                                        <asp:ListItem Value="0">無下層單價分析</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33">
                                    <asp:Button ID="Button25" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="100px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
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
                                                    <asp:ListItem Value="X">工項</asp:ListItem>
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
                                            <asp:BoundField DataField="PriceName" HeaderText="工項名稱" SortExpression="PriceName">
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
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
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [PriceAnalysis] WHERE [PriceID] = @PriceID" InsertCommand="INSERT INTO [PriceAnalysis] ([PriceName], [Complex], [Price], [Unit], [Code], [ReferenceID], [ReferenceNumber]) VALUES (@PriceName, @Complex, @Price, @Unit, @Code, @ReferenceID, @ReferenceNumber)" SelectCommand="SELECT PriceID, PriceName, Complex, AnaNumber, Price, Unit, Code, PccCode, ReferenceID, ReferenceNumber FROM PriceAnalysis ORDER BY PriceID DESC" UpdateCommand="UPDATE [PriceAnalysis] SET [PriceName] = @PriceName, [Complex] = @Complex, [Price] = @Price, [Unit] = @Unit, [Code] = @Code, [ReferenceID] = @ReferenceID, [ReferenceNumber] = @ReferenceNumber WHERE [PriceID] = @PriceID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PriceName" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PriceName" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style70">
                                    <asp:Button ID="Button23" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="存入標案專屬資料庫" />
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
                                        <asp:ListItem Value="X">工項</asp:ListItem>
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
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" BackColor="White" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Font-Underline="True" ForeColor="Red" Text="工料項目總覽"></asp:Label>
                </td>
                <td class="auto-style2R">
                                    <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示全部" Width="100px" />
                                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource2" GridLines="None" Width="100%" ForeColor="#333333" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工料" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Medium" Text="編修工料項目" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
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
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button26" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="單價分析" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
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
                                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
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
                                    <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="155px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X">工項</asp:ListItem>
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
                        </table>
                    <table class="auto-style67">
                        <tr>
                            <td class="auto-style33">資源編碼</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TextBox46" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style33">備註</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TextBox47" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style33">
                                <asp:Button ID="Button29" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加/刪除單價分析" Width="150px" />
                            </td>
                            <td class="auto-style33">
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [Bid_Library] WHERE ([BID] = @BID) ORDER BY [PriceID] DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
