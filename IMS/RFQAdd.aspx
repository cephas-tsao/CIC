<%@ Page Language="C#" AutoEventWireup="true"  MaintainScrollPositionOnPostback="true" CodeBehind="RFQAdd.aspx.cs" Inherits="IMS.RFQAdd" %>
<!DOCTYPE html>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">


            .auto-style1 {
	            font-family: 微軟正黑體;
	            font-size: large;
	            background-color: #800000;
	            text-align: center;
	            color: #FFFFFF;
            }
         
          
.TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
.TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
            .auto-style10 {
            height: 24px;
        }
            .auto-style67 {
            width: 100%;
        }
    


        .auto-style69 {
            width: 657px;
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
         
            </style>
</head>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>
    <form id="form1" runat="server">
    <div>
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop" colspan="4">新增詢價單</td>
                            </tr>
                            <tr>
                                <td class="Table1">詢價單編號</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxNo" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="Table1">
                                    詢價單名稱</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxName" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">報價回覆期限</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxDate" runat="server" Font-Size="Medium" Height="25px" Width="200px" onclick="WdatePicker();"></asp:TextBox>
                                </td>
                                <td class="Table1">
                                    保固期限規定</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxWarranty" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">工程所在縣市</td>
                                <td class="Table2">
		<asp:DropDownList id="DropDownList4" AppendDataBoundItems="true" runat="server" Height="25px" Width="200px" Font-Size="Medium" DataSourceID="SqlDataSource2" DataTextField="City" DataValueField="City">
            <asp:ListItem Value="0">-請選擇縣市-</asp:ListItem>
		</asp:DropDownList>
		                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [CityList]"></asp:SqlDataSource>
		                        </td>
                                <td class="Table1">
                                    經辦人</td>
                                <td class="Table2">
			<asp:DropDownList id="DropDownList7" AppendDataBoundItems="True" runat="server" Height="30px" Width="120px" Font-Size="Medium" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DepartmentName" DataValueField="DepartmentName" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                <asp:ListItem Value="0">-請選擇部門-</asp:ListItem>
			</asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
			<asp:DropDownList id="DropDownList8" AppendDataBoundItems="true" runat="server" Height="30px" Width="150px" Font-Size="Medium" Font-Names="微軟正黑體" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name" AutoPostBack="True">
                <asp:ListItem Value="0">-請選擇部門人員-</asp:ListItem>
			</asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"  SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList7" Name="Department" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
			                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">補充說明</td>
                                <td class="Table2" colspan="3">
                                    <asp:TextBox ID="TxNotes" runat="server" Font-Size="Medium" Height="50px" Width="600px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                            </tr>
                            </table>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; 詢價工料項目</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">工程名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="BidName" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            </table>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr class="TableTop">
                                <td class="auto-style10">編碼</td>
                                <td class="auto-style10">名稱</td>
                                <td class="auto-style10">單位</td>
                                <td class="auto-style10">總工程用量</td>
                                <td class="auto-style10">廠牌規格說明</td>
                                <td class="auto-style10">備註</td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server"   OnItemDataBound="Repeater1_ItemDataBound">
                                <ItemTemplate>
                            <tr class="TableSingle">
                                <td>

                                    <asp:Label ID="LbPrice" runat="server" Font-Names="微軟正黑體" Height="25px"  Visible="false"></asp:Label>
                                    <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="LbNumber" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxBrand" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TxNote" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table1">
                                <asp:Button ID="Button16" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增同標案其他工料項目" Width="200px" OnClick="Button16_Click" />
                            &nbsp;
                                <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增跨標案相同工料項目" Width="200px" OnClick="Button17_Click" />
                                </td>
                            </tr>
                            </table>
                        <asp:Panel ID="Pnl_OtherItem" runat="server" Visible="False">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="TableTop">&nbsp;&nbsp;&nbsp;&nbsp; 新增同標案其他工料項目</td>
                                </tr>
                                <tr>
                                    <td class="Table1">
                                        <table class="auto-style67">
                                            <tr>
                                                <td class="auto-style69">
                                                    <asp:ListBox ID="ListBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="350px" Width="100%"></asp:ListBox>
                                                </td>
                                                <td class="Table1" rowspan="2" width="60px">
                                                    <asp:Button ID="Button21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&lt;&lt;" Width="50px" OnClick="ItemAdd_Click" />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Button22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&gt;&gt;" Width="50px" OnClick="ItemDel_Click" />
                                                </td>
                                                <td class="Table2" rowspan="2">
                                                    <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                                        <tr>
                                                            <td class="Table1" style="width: 15%">工程名稱</td>
                                                            <td class="Table2">
                                                                <asp:Label ID="LbBidName" runat="server" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                                                        CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource4" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="選取">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="PriceID" Text='<%# Bind("PriceID") %>' ></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />--%>
                                                            <asp:TemplateField HeaderText="編碼">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Code" Text='<%# Bind("Code") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:BoundField DataField="Code" HeaderText="編碼" SortExpression="Code" />--%>
                                                               <asp:TemplateField HeaderText="資源名稱">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="ItemName" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:BoundField DataField="ItemName" HeaderText="資源名稱" SortExpression="ItemName" >
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>--%>
                                                              <asp:TemplateField HeaderText="單位">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--<asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                                            <%--<asp:BoundField DataField="Amount" HeaderText="總工程用量" SortExpression="Amount" />--%>
                                                               <asp:TemplateField HeaderText="總工程用量">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Amount" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
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
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"  >
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                                            <asp:Parameter DefaultValue="1" Name="ResourceNY" Type="Int32" />
                                                            <asp:Parameter DefaultValue="variableSumPercentage" Name="ItemKind" Type="String" />
                                                            <asp:Parameter DefaultValue="25" Name="PriceID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Table1">
                                                    <asp:Button ID="Button25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="加入詢價工料" OnClick="Button25_Click" />
                                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button24" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清空列表" OnClick="ClearAll_Click" />
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Pnl_OtherBid" runat="server" Visible="False">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="Table2">&nbsp;&nbsp;&nbsp;&nbsp; 新增跨標案相同工料項目</td>
                                </tr>
                                <tr>
                                    <td class="Table1">
                                        <table class="auto-style67">
                                            <tr>
                                                <td class="auto-style69">
                                                    <asp:ListBox ID="ListBox2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="350px" Width="100%"></asp:ListBox>
                                                </td>
                                                <td class="Table1" rowspan="2" width="60px">
                                                    <asp:Button ID="Button26" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&lt;&lt;" Width="50px"  OnClick="ItemAdd1_Click"/>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Button27" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&gt;&gt;" Width="50px" OnClick="ItemDel1_Click" />
                                                </td>
                                                <td class="Table2" rowspan="2">
                                                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                                                        CellPadding="4" DataKeyNames="PriceID" datasourceid="SqlDataSource5" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="選取">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                             <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="PriceID" Text='<%# Bind("PriceID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                              <asp:TemplateField HeaderText="工程名稱">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="BidName" Text='<%# Bind("BidName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField> 
                                                             <asp:TemplateField HeaderText="編碼">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Code" Text='<%# Bind("Code") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>                                                        
                                                               <asp:TemplateField HeaderText="資源名稱">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="ItemName" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>                                                          
                                                              <asp:TemplateField HeaderText="單位">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>                                                          
                                                               <asp:TemplateField HeaderText="總工程用量">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="Amount" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                         <%--   <asp:BoundField DataField="BidName" HeaderText="工程名稱" SortExpression="BidName" />
                                                            <asp:BoundField DataField="Code" HeaderText="編碼" SortExpression="Code" />
                                                            <asp:BoundField DataField="ItemName" HeaderText="資源名稱" SortExpression="ItemName" >
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                                            <asp:BoundField DataField="Amount" HeaderText="總工程用量" SortExpression="Amount"--%> 
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
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"  >
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                                            <asp:Parameter DefaultValue="1" Name="ResourceNY" Type="Int32" />
                                                            <asp:Parameter DefaultValue="variableSumPercentage" Name="ItemKind" Type="String" />
                                                        <%--     <asp:Parameter DefaultValue="0155682024" Name="Code" Type="String" />--%>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Table2">
                                                    <asp:Button ID="Button28" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="加入詢價工料" OnClick="Button28_Click" />
                                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button29" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清空列表" OnClick="ClearAll1_Click" />
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table2" colspan="7">
                                    &nbsp;&nbsp;&nbsp;&nbsp; 詢價單附件
                            <tr>
                                <td class="Table1">
                                    附件名稱</td>
                                <td class="Table2">
                                    <asp:TextBox ID="AttachName" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="Table1">
                                    附件類型</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DDL_kind" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" >
                                        <asp:ListItem Value="0" Selected="True">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="1">圖說</asp:ListItem>
                                        <asp:ListItem Value="2">規範</asp:ListItem>
                                        <asp:ListItem Value="3">其他</asp:ListItem>
                                    </asp:DropDownList>
                              <%--      <asp:TextBox ID="TextBox84" runat="server" Height="25px" Visible="False" Width="100px"></asp:TextBox>--%>
                                </td>
                                <td class="Table1">
                                    選擇選擇檔案</td>
                                <td class="Table2">
                                    <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" />
                                </td>
                                <td class="Table1">
                                                <asp:Button ID="UpLoad" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="上傳" Width="71px" OnClick="UpLoad_Click" />
                                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" colspan="7">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        DataKeyNames="UID" DataSourceID="SqlDataSource9" Width="100%" AllowSorting="True" OnRowCommand="GridView5_RowCommand">
                                        <Columns>
                                      
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" DeleteText="刪除項目">
                                            <ItemStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            </asp:CommandField>
                                            <asp:TemplateField HeaderText="附件名稱">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="Name" Text='<%# Bind("Name") %>' CommandArgument='<%# Container.DataItemIndex%>' CommandName="DownLoad" ></asp:LinkButton>
                                                    <%--<asp:Label runat="server" ID="Name" ></asp:Label>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="附件類型">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Type" Text='<%# Bind("Type") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                       <%--     <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type">
                                            </asp:BoundField>--%>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Path" Text='<%# Bind("Path") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" />--%>
                                            <asp:BoundField DataField="UID" HeaderText="UID" SortExpression="UID" InsertVisible="False" ReadOnly="True" Visible="False" />
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
                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server"  DeleteCommand="DELETE FROM [RFQ_File] WHERE [UID] = @UID" InsertCommand="INSERT INTO [RFQ_File] ([Name], [Type], [Path]) VALUES (@Name, @Type, @Path)" 
                                        UpdateCommand="UPDATE [RFQ_File] SET [Name] = @Name, [Type] = @Type, [Path] = @Path WHERE [UID] = @UID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server"></asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table2">
                                    &nbsp;&nbsp;&nbsp;&nbsp; 選擇詢價廠商（可複選）
                            <tr>
                                <td class="Table1">
                                    <table class="auto-style63">
                                        <tr>
                                            <td class="auto-style68" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style64">廠商類型</td>
                                            <td class="auto-style65" rowspan="2">
                                               <asp:DropDownList ID="DDL_Op2" runat="server" Font-Size="Medium">
                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                    </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">廠商專長/供給項目(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                <br />
                                                <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style64">
                                                <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource7" DataTextField="Type" DataValueField="Type" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px">
                                                    <asp:ListItem Value="0">-請選擇 -</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server"  SelectCommand="SELECT * FROM [PublicDB].[dbo].[FrimType]">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td class="auto-style64">
                                                <asp:TextBox ID="TxPro" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource6" Width="100%" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選擇">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox3" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="UID" Text='<%# Bind("UID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />--%>
                                            <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Type" HeaderText="廠商類型" SortExpression="Type" />
                                            <asp:BoundField DataField="SupportItem" HeaderText="廠商專長／供給材料" SortExpression="SupportItem" />
                                            <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" Visible="False" />
                                            <asp:BoundField DataField="Location" HeaderText="所在縣市" SortExpression="Location" />
                                            <asp:BoundField DataField="Tel1" HeaderText="聯絡電話" SortExpression="Tel1" />
                                            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
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
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" SelectCommand="SELECT [UID], [Name], [Type], [SupportItem], [Owner], [Location], [Tel1], [Notes] FROM [FirmM]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">
                                    <asp:Button ID="BtnRequire" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增詢價單" Font-Bold="True"  OnClick="BtnRequire_Click"/>
                                                    </td>
                            </tr>
                            </table>
    
    </div>
    </form>
</body>
</html>