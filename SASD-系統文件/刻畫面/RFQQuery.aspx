<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQQuery.aspx.cs" Inherits="RFQQuery" %>

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
            }
            .auto-style6 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
            .auto-style3 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFF99;
	            text-align: center;
	            color: #000000;
            }
            .auto-style4 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: left;
	            color: #000000;
        }
            .auto-style5 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            }
            .auto-style7 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 34px;
        }
        .auto-style8 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            margin-left: 40px;
            height: 34px;
        }
            .auto-style2 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFD2D2;
	            text-align: left;
            height: 24px;
        }
            .TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
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
        .auto-style12 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            width: 205px;
        }
        .auto-style13 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            width: 15%;
            height: 24px;
        }
        .auto-style14 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            height: 24px;
        }
        .auto-style15 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1" colspan="4">詢價單查詢</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">詢價單編號</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label1" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    詢價單名稱</td>
                                <td class="auto-style6">
                                    <asp:Label ID="Label2" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">報價回覆期限</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label3" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    保固期限規定</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label4" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">工程所在縣市</td>
                                <td class="auto-style6">
		                            <asp:Label ID="Label5" runat="server" Text="xxxxx"></asp:Label>
		                        </td>
                                <td class="auto-style3">
                                    經辦人</td>
                                <td class="auto-style6">
			                        <asp:Label ID="Label6" runat="server" Text="xxx-xxx"></asp:Label>
			                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">補充說明</td>
                                <td class="auto-style8" colspan="3">
                                    <asp:Label ID="Label7" runat="server" Text="xxxxx"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="4">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style2" colspan="8">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單1</td>
                            </tr>
                            <tr>
                                <td class="auto-style13">廠商名稱</td>
                                <td class="auto-style14">
                                    <asp:Label ID="Label8" runat="server" Text="XXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style15">
                                    報價有效期限</td>
                                <td class="auto-style14">
                                    <asp:Label ID="Label154" runat="server" Text="xxxx/xx/xx"></asp:Label>
                                    </td>
                                <td class="auto-style15">
                                    是否引用此報價</td>
                                <td class="auto-style14">
                                    <asp:Label ID="Label180" runat="server" Text="是/否"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 15%">折扣百分比</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label155" runat="server" Text="xx.xx%"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    總價(不含稅)</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label152" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    稅金</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label153" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 15%">工程名稱</td>
                                <td class="auto-style4" colspan="7">
                                    <asp:Label ID="Label151" runat="server" Text="XXXXXXXXXXXXXX"></asp:Label>
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
                                    <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工警告燈號，定光燈號，裝拆"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label145" runat="server" Font-Names="微軟正黑體" Text="168.00"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label148" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label156" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label149" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label150" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label146" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label147" runat="server" Text="xxxxx"></asp:Label>
                                </td>
                            </tr>
                            </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="4">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style2" colspan="8">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單2</td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 15%">廠商名稱</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label157" runat="server" Text="OOOOOOOOOOO"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    報價有效期限</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label158" runat="server" Text="xxxx/xx/xx"></asp:Label>
                                    </td>
                                <td class="auto-style3">
                                    是否引用此報價</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label179" runat="server" Text="是/否"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 15%">折扣百分比</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label159" runat="server" Text="xx.xx%"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    總價(不含稅)</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label160" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    稅金</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label161" runat="server" Text="xxxxx.xx"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 15%">工程名稱</td>
                                <td class="auto-style4" colspan="7">
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
                            <tr>
                                <td class="auto-style7" colspan="4">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單附件</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource9" Width="100%" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" SelectText="下載" ShowSelectButton="True">
                                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            <ItemStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" />
                                            <asp:BoundField DataField="UID" HeaderText="UID" SortExpression="UID" InsertVisible="False" ReadOnly="True" Visible="False" />
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
                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [RFQ_File] WHERE [UID] = @UID" InsertCommand="INSERT INTO [RFQ_File] ([Name], [Type], [Path]) VALUES (@Name, @Type, @Path)" SelectCommand="SELECT [Name], [Type], [Path], [UID] FROM [RFQ_File] ORDER BY [UID]" UpdateCommand="UPDATE [RFQ_File] SET [Name] = @Name, [Type] = @Type, [Path] = @Path WHERE [UID] = @UID">
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
