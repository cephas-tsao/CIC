<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="RFQQuery.aspx.cs" Inherits="IMS.RFQQuery" %>


<!DOCTYPE html>

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
            /*.Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
            .Table1 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFF99;
	            text-align: center;
	            color: #000000;
            }
            .Table2 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: left;
	            color: #000000;
        }
            .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            }
            .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 34px;
        }
        .Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            margin-left: 40px;
            height: 34px;
        }*/
            .auto-style2 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFD2D2;
	            text-align: left;
            height: 24px;
        }
            /*.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}*/
            .auto-style10 {
            height: 24px;
        }
            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
        .auto-style11 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
        }
        .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            width: 205px;
        }
        .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            width: 15%;
            height: 24px;
        }
        .Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            height: 24px;
        }
        .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 24px;
        }
    </style>
</head>
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>
    <form id="form1" runat="server">
    <div>
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop" colspan="4">詢價單查詢</td>
                            </tr>
                            <tr>
                                <td class="Table1">詢價單編號</td>
                                <td class="Table2">
                                    <asp:Label ID="RFQ_Code" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">
                                    詢價單名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="LbName" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">報價回覆期限</td>
                                <td class="Table2">
                                    <asp:Label ID="ReplyDate" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">
                                    保固期限規定</td>
                                <td class="Table2">
                                    <asp:Label ID="Warranty" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">工程所在縣市</td>
                                <td class="Table2">
		                            <asp:Label ID="Location" runat="server" ></asp:Label>
		                        </td>
                                <td class="Table1">
                                    經辦人</td>
                                <td class="Table2">
			                        <asp:Label ID="WorkManName" runat="server"></asp:Label>
			                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">補充說明</td>
                                <td class="Table2" colspan="3">
                                    <asp:Label ID="Notes" runat="server"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                  <td class="Table1" colspan="4">
                                <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                              
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table0" colspan="8">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單<asp:Label ID="Quatation" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="Table1">廠商名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="LbName" runat="server"></asp:Label>
                                </td>
                                <td class="Table1">
                                    報價有效期限</td>
                                <td class="Table2">
                                    <asp:Label ID="ExpiretionDate" runat="server" ></asp:Label>
                                    </td>
                                <td class="Table1">
                                    是否引用此報價</td>
                                <td class="Table2">
                                    <asp:Label ID="QuoteNY" runat="server" Text="是/否"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">折扣百分比</td>
                                <td class="Table2">
                                    <asp:Label ID="DiscountPercent" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">
                                    總價(不含稅)</td>
                                <td class="Table2">
                                    <asp:Label ID="TotalPrice" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">
                                    稅金</td>
                                <td class="Table2">
                                    <asp:Label ID="Tax" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">工程名稱</td>
                                <td class="Table2" colspan="7">
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
                                <td class="auto-style10">報價單價</td>
                                <td class="auto-style10">折扣單價</td>
                                <td class="auto-style10">複價</td>
                                <td class="auto-style10">結算方式</td>
                                <td class="auto-style10">廠牌規格說明</td>
                                <td class="auto-style10">備註</td>
                            </tr>
                            <tr class="TableSingle">
                                <td>
                                    <asp:Label ID="PriceID" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Unit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Amount" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="UnitPrice" runat="server" ></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="DiscountPrice" runat="server"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="ComplexPrice" runat="server" ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ClearWay" runat="server" ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Explan" runat="server" ></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Note" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            </table>
                                </td>
                            </tr>
                            <tr>
                                </ItemTemplate>
                                </asp:Repeater>
                              <%--      <td class="Table1" colspan="4">
                    <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style2" colspan="8">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單2</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">廠商名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="Label157" runat="server" Text="OOOOOOOOOOO"></asp:Label>
                                </td>
                                <td class="Table1">
                                    報價有效期限</td>
                                <td class="Table2">
                                    <asp:Label ID="Label158" runat="server" Text="xxxx/xx/xx"></asp:Label>
                                    </td>
                                <td class="Table1">
                                    是否引用此報價</td>
                                <td class="Table2">
                                    <asp:Label ID="Label179" runat="server" Text="是/否"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">折扣百分比</td>
                                <td class="Table2">
                                    <asp:Label ID="Label159" runat="server" Text="xx.xx%"></asp:Label>
                                </td>
                                <td class="Table1">
                                    總價(不含稅)</td>
                                <td class="Table2">
                                    <asp:Label ID="Label160" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td class="Table1">
                                    稅金</td>
                                <td class="Table2">
                                    <asp:Label ID="Label161" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 15%">工程名稱</td>
                                <td class="Table2" colspan="7">
                                    <asp:Label ID="Label162" runat="server" Text="XXXXXXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            </table>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr class="TableTop">
                                <td class="auto-style10">編碼</td>
                                <td class="auto-style10">名稱</td>
                                <td class="auto-style10">單位</td>
                                <td class="auto-style10">總工程用量</td>
                                <td class="auto-style10">報價單價</td>
                                <td class="auto-style10">折扣單價</td>
                                <td class="auto-style10">複價</td>
                                <td class="auto-style10">結算方式</td>
                                <td class="auto-style10">廠牌規格說明</td>
                                <td class="auto-style10">備註</td>
                            </tr>
                            <tr class="TableSingle">
                                <td>
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工警告燈號，定光燈號，裝拆"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label172" runat="server" Font-Names="微軟正黑體" Text="168.00"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label173" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label174" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label175" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label176" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label177" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label178" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                            </tr>
                            </table>
                                </td>
                            </tr>
                            <tr>--%>
                              <%--  <td class="Table1" colspan="4">--%>
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table0">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單附件</td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                                         DataKeyNames="UID" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" OnRowCommand="GridView5_RowCommand">
                                        <Columns>
                                            <%--<asp:CommandField ButtonType="Button" SelectText="下載" ShowSelectButton="True" >
                                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            <ItemStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            </asp:CommandField>--%>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button runat="server" ID="DownLoad" CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex%>' Text="下載" /> 
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# Bind("Name") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type">
                                            </asp:BoundField>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [RFQ_File] WHERE [UID] = @UID" InsertCommand="INSERT INTO [RFQ_File] ([Name], [Type], [Path]) VALUES (@Name, @Type, @Path)" 
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
                                    </td>
                            </tr>
                            </table>
                                </td>
                            </tr>
                            </table>
    
    </div>
    </form>
</body>
</html>