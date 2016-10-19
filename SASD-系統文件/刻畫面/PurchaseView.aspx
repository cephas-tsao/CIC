<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PurchaseView.aspx.cs" Inherits="PurchaseView" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
    <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }     
                        
        
            .auto-style63 {
            width: 100%;
            vertical-align:central;
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
                

                

            .auto-style4 {
            width: 100%;
        }
            

        
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
        }
                    

        
        .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
            }
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            }
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
}
.auto-style106 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: right;
	color: #000000;
}
        .auto-style107 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: left;
            color: #000000;
            height: 29px;
        }
        .auto-style108 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            height: 29px;
        }
        .auto-style109 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: right;
            color: #000000;
            height: 29px;
        }         

        
        .auto-style110 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            }
                            

            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
            
        
            .auto-style2A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #5D7B9D;
            text-align: center;
            color: #FFFFFF;
            }
                    
        
            .ShtCellCC {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            vertical-align:central;
            color: #000000;
        }
        .ShtCellCL {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: left;
            vertical-align:central;
            color: #000000;
        }
        .ShtCellCR {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: right;
            vertical-align:central;
            color: #000000;
        }
        
        
            .SB_Table_M {
            width:100%;
            background-color: #6C6C6C;
        }
        .SB_Table_M {
            width:100%;
            background-color: #6C6C6C;
        }
        .SB_Row_M {
            background-color: #A6FFA6;
        }
        .SB_Row_M {
            background-color: #A6FFA6;
        }
                            
        
            .auto-style112 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: right;
            color: #000000;
            height: 34px;
        }

        
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">採購發包綜合檢視</td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList35" runat="server" AppendDataBoundItems="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                                                <asp:ListItem Value="SB_Name">分包預算名稱(關鍵字)</asp:ListItem>
                                                                <asp:ListItem Value="SC_Name">分包合約名稱(關鍵字)</asp:ListItem>
                                                            </asp:DropDownList>
                                                            </td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">得標廠商</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button39" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList34" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource10" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="160px">
                                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
            </td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView6" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button44" runat="server" CssClass="BtnFree" OnClick="Button44_Click" Text="綜合檢視" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="分包預算編號" HeaderText="分包預算編號" SortExpression="分包預算編號" />
                                            <asp:BoundField DataField="分包預算名稱" HeaderText="分包預算名稱" SortExpression="分包預算名稱" />
                                            <asp:BoundField DataField="預定進場時間" HeaderText="預定進場時間" SortExpression="預定進場時間" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="預算金額" HeaderText="預算金額" SortExpression="預算金額" />
                                            <asp:BoundField DataField="得標廠商名稱" HeaderText="得標廠商名稱" SortExpression="得標廠商名稱" />
                                            <asp:BoundField DataField="分包合約編號" HeaderText="分包合約編號" SortExpression="分包合約編號" />
                                            <asp:BoundField DataField="分包合約名稱" HeaderText="分包合約名稱" SortExpression="分包合約名稱" />
                                            <asp:BoundField DataField="合約(得標)金額" HeaderText="合約(得標)金額" SortExpression="合約(得標)金額" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT FirmM.Name AS 得標廠商名稱, SubBudgetList.SB_Code AS 分包預算編號, SubBudgetList.SB_Name AS 分包預算名稱, SubBudgetList.BookInTime AS 預定進場時間, SubBudgetList.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubBudgetList.BudgetPrice AS 預算金額, SubContract_Main.TotalPrice AS [合約(得標)金額], SubBudgetList.PID FROM SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID RIGHT OUTER JOIN SubBudgetList ON SubContract_Main.SC_Code = SubBudgetList.SC_Code WHERE (SubBudgetList.PID = @PID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
    
    </div>
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0" Visible="False">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1">分包預算資訊</td>
                            </tr>
                        </table>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style2">分包預算編號</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label685" runat="server" Text="SB001"></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算名稱</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label686" runat="server" Text="分包預算1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">承攬方式</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label688" runat="server" Text="實做實算"></asp:Label>
                                </td>
                                <td class="auto-style2">採購負責人</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label687" runat="server" Text="採購部-陳大華"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style110">預定進場日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label689" runat="server" Text="2016.5.1"></asp:Label>
                                </td>
                                <td class="auto-style110">預定完成發包日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label691" runat="server" Text="2015.12.31"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">最遲完成發包期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label690" runat="server" Text="2016.3.31"></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算金額</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label684" runat="server" Text="6,500"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style2">分包預算工項</td>
                                <td class="auto-style3">
                                    
                                    <table class="auto-style4">
                                        <tr class="SB_RowTop_M">
                                            <td class="auto-style102">執行項次</td>
                                            <td class="auto-style102">工項名稱</td>
                                            <td class="auto-style102">單位</td>
                                            <td class="auto-style102">數量</td>
                                            <td class="auto-style102">預算單價</td>
                                            <td class="auto-style102">預算複價</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">壹.一.3.1</td>
                                            <td class="ShtCellCL">B2F-挑高模板支撐架</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">1,000</td>
                                            <td class="ShtCellCR">80</td>
                                            <td class="ShtCellCR">80,000</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">壹.一.4.2</td>
                                            <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">272</td>
                                            <td class="ShtCellCR">1,480</td>
                                            <td class="ShtCellCR">402,560</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">壹.一.9.1.2</td>
                                            <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                            <td class="ShtCellCC">M3</td>
                                            <td class="ShtCellCR">1,008</td>
                                            <td class="ShtCellCR">1,480</td>
                                            <td class="ShtCellCR">1,491,840</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">[全]</td>
                                            <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                            <td class="ShtCellCC">工</td>
                                            <td class="ShtCellCR">595.2</td>
                                            <td class="ShtCellCR">3,200</td>
                                            <td class="ShtCellCR">1,904,640</td>
                                        </tr>
                                    </table>
                                    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="2000px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1" style="height: 27px">邀標單資訊</td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">分包預算編號</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label1" runat="server" Text="SB002"></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算名稱</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label2" runat="server" Text="分包預算2"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">承攬方式</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label692" runat="server" Text="實做實算"></asp:Label>
                                </td>
                                <td class="auto-style2">採購負責人</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label693" runat="server" Text="採購部-陳大華"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">預定進場日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label694" runat="server" Text="2016.5.1"></asp:Label>
                                </td>
                                <td class="auto-style2">預定完成發包日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label695" runat="server" Text="2015.12.31"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">最遲完成發包期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label696" runat="server" Text="2016.3.31"></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算金額</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label697" runat="server" Text="6,500"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">邀標單回覆期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label698" runat="server" Text="2015.11.30"></asp:Label>
                                </td>
                                <td class="auto-style2">保固期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label699" runat="server" Text="1.5"></asp:Label>
                                    年</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">補充說明</td>
                                <td class="auto-style3" colspan="3">
                                    <asp:Label ID="Label700" runat="server" Text="這是邀標單"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">廠商應檢附項目</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_attach" runat="server" Visible="False">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Enabled="False" Text="樣　品" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Enabled="False" Text="型錄規範" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked="True" Enabled="False" Text="大樣圖說" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox4" runat="server" Checked="True" Enabled="False" Text="單價分析表" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox5" runat="server" Enabled="False" Text="業績表" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox6" runat="server" Checked="True" Enabled="False" Text="材料證明" />
                                    </td>
                                    <td class="auto-style3C" colspan="2">
                                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="True" Enabled="False" Text="其他" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">邀標單附件</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_file" runat="server" Visible="False">
                            <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource9" ForeColor="#333333" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ButtonType="Button" SelectText="下載" ShowSelectButton="True">
                                    <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                    <ItemStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                    <asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" Visible="False" />
                                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
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
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [UID], [Name], [Type], [Path] FROM [SubRFQ_File]"></asp:SqlDataSource>
                        </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">廠商報價資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_InviteQ" runat="server" Visible="False">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:GridView ID="GridView10" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Button42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button42_Click" Text="檢視廠商報價" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                                <asp:BoundField DataField="FirmID" HeaderText="FirmID" SortExpression="FirmID" Visible="False" />
                                                <asp:BoundField DataField="SBID" HeaderText="SBID" SortExpression="SBID" Visible="False" />
                                                <asp:BoundField DataField="TotalPrice" HeaderText="報價總價(不含稅)" SortExpression="TotalPrice" />
                                                <asp:BoundField DataField="RFQ_ReplyDate" HeaderText="回覆期限" SortExpression="RFQ_ReplyDate" />
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
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT FirmM.Name, FirmM.UID, SubRFQ_Firm.FirmID, SubRFQ_Firm.SBID, SubRFQ_Firm.Sort, SubRFQ_Firm.TotalPrice, SubRFQ_Firm.GetNY, SubBudgetList.RFQ_ReplyDate FROM FirmM INNER JOIN SubRFQ_Firm ON FirmM.UID = SubRFQ_Firm.FirmID INNER JOIN SubBudgetList ON SubRFQ_Firm.SBID = SubBudgetList.SBID WHERE (SubRFQ_Firm.SBID = 2) ORDER BY SubRFQ_Firm.Sort"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr>
                                        <td class="auto-style2">廠商名稱</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label5" runat="server" Text="育偉土木包工業"></asp:Label>
                                        </td>
                                        <td class="auto-style2">報價總價(不含稅)</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">報價有效期限</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label717" runat="server" Font-Names="微軟正黑體" Text="2015.12.31"></asp:Label>
                                        </td>
                                        <td class="auto-style2">議價後總價(不含稅)</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label716" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">是否為得標廠商</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Text="是/否"></asp:Label>
                                        </td>
                                        <td class="auto-style2">稅金</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="Label7" runat="server" Text="-"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">議價內容</td>
                                        <td class="auto-style3" colspan="3">約定總價上限-50000元</td>
                                    </tr>
                                </table>
                                <table class="SB_Table_M">
                                    <tr class="SB_RowTop_M">
                                        <td class="auto-style102">執行項次</td>
                                        <td class="auto-style102">工項名稱</td>
                                        <td class="auto-style102">單位</td>
                                        <td class="auto-style102">數量</td>
                                        <td class="auto-style102">預算單價</td>
                                        <td class="auto-style102">預算複價</td>
                                    </tr>
                                    <tr class="SB_Row_M">
                                        <td class="ShtCellCC">壹.一.3.1</td>
                                        <td class="ShtCellCL">B2F-挑高模板支撐架</td>
                                        <td class="ShtCellCC">M3</td>
                                        <td class="ShtCellCR">1,000</td>
                                        <td class="ShtCellCR">80</td>
                                        <td class="ShtCellCR">80,000</td>
                                    </tr>
                                    <tr class="SB_Row_M">
                                        <td class="ShtCellCC">壹.一.4.2</td>
                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                        <td class="ShtCellCC">M3</td>
                                        <td class="ShtCellCR">272</td>
                                        <td class="ShtCellCR">1,480</td>
                                        <td class="ShtCellCR">402,560</td>
                                    </tr>
                                    <tr class="SB_Row_M">
                                        <td class="ShtCellCC">壹.一.9.1.2</td>
                                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                        <td class="ShtCellCC">M3</td>
                                        <td class="ShtCellCR">1,008</td>
                                        <td class="ShtCellCR">1,480</td>
                                        <td class="ShtCellCR">1,491,840</td>
                                    </tr>
                                    <tr class="SB_Row_M">
                                        <td class="ShtCellCC">[全]</td>
                                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                        <td class="ShtCellCC">工</td>
                                        <td class="ShtCellCR">595.2</td>
                                        <td class="ShtCellCR">3,200</td>
                                        <td class="ShtCellCR">1,904,640</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="TableTop">分包合約資訊</td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包合約主資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_main" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2">得標廠商</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label718" runat="server" Text="老王建設"></asp:Label>
                                    </td>
                                    <td class="auto-style2">原合約總價</td>
                                    <td class="auto-style3"><span class="auto-style14">
                                        <asp:Label ID="Label753" runat="server" Font-Bold="True" ForeColor="Red" Text="6,500"></asp:Label>
                                        </span></td>
                                    <td class="auto-style2">追加減後合約總價</td>
                                    <td class="auto-style3"><span class="auto-style14">
                                        <asp:Label ID="Label752" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                                        </span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">分包合約編號</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label732" runat="server" Text="SB005"></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">分包合約名稱</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label724" runat="server" Text="分包預算5"></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">合約種類</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label719" runat="server" Text="工程合約"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">預定完工日期</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label733" runat="server" Text="2016.6.30"></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">履約保證</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label723" runat="server" Text="銀行支票保證"></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">出廠證明提送</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label725" runat="server" Text="100"></asp:Label>
                                        </span>%提送</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">請款次數</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label721" runat="server" Text="1"></asp:Label>
                                        次/月</span><span class="auto-style8"> </span></td>
                                    <td class="auto-style2">請款日</td>
                                    <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="Label727" runat="server" Text="15"></asp:Label>
                                        </span>日</td>
                                    <td class="auto-style2">付款日</td>
                                    <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="Label726" runat="server" Text="20"></asp:Label>
                                        </span>日</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">工期逾罰規定</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label720" runat="server" Text="合約規定完工工作天數"></asp:Label>
                                    </td>
                                    <td class="auto-style2">逾罰</td>
                                    <td class="auto-style3" colspan="3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label728" runat="server" Text="一天1000元"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保固年限</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label722" runat="server" Text="2"></asp:Label>
                                        </span>年</td>
                                    <td class="auto-style2">承攬範圍</td>
                                    <td class="auto-style3">
                                        &nbsp;</td>
                                    <td class="auto-style2">稅額百分比</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label730" runat="server" Text="5"></asp:Label>
                                        </span>%</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">備註</td>
                                    <td class="auto-style3" colspan="3">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label731" runat="server" Text="老王綁來的標"></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">追加減次數</td>
                                    <td class="auto-style3">0</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton34" runat="server" OnClick="LinkButton34_Click">付款資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_pay" runat="server" Visible="False">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2A" colspan="5">預付款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">預付款百分比</td>
                                    <td class="auto-style2">預付款現金百分比</td>
                                    <td class="auto-style2">預付款期票百分比</td>
                                    <td class="auto-style2">預付款期票天數</td>
                                    <td class="auto-style2">預付款還款保證</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        15%</td>
                                    <td class="auto-style3C">
                                        100%</td>
                                    <td class="auto-style3C">
                                        0%</td>
                                    <td class="auto-style3C">
                                        </td>
                                    <td class="auto-style3C">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label734" runat="server" Text="銀行支票保證"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">工程款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                    <td class="auto-style2">工程款現金百分比</td>
                                    <td class="auto-style2">工程款期票百分比</td>
                                    <td class="auto-style2">工程款期票天數</td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C"></td>
                                    <td class="auto-style3C">
                                        80%</td>
                                    <td class="auto-style3C">
                                        20%</td>
                                    <td class="auto-style3C">
                                        10天</td>
                                    <td class="auto-style3C"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">保留款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保留款百分比</td>
                                    <td class="auto-style2">保留款現金百分比</td>
                                    <td class="auto-style2">保留款期票百分比</td>
                                    <td class="auto-style2">保留款期票天數</td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        10%</td>
                                    <td class="auto-style3C">
                                        50%</td>
                                    <td class="auto-style3C">
                                        50%</td>
                                    <td class="auto-style3C">
                                        10天</td>
                                    <td class="auto-style3C"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">保固金資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保固金百分比</td>
                                    <td class="auto-style2">保固金現金百分比</td>
                                    <td class="auto-style2">保固金期票百分比</td>
                                    <td class="auto-style2">保固金期票天數</td>
                                    <td class="auto-style2">保固金保留方式</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        10%</td>
                                    <td class="auto-style3C">
                                        70%</td>
                                    <td class="auto-style3C">
                                        30%</td>
                                    <td class="auto-style3C">
                                        10天</td>
                                    <td class="auto-style3C">
                                        <span class="auto-style14">
                                        <asp:Label ID="Label735" runat="server" Text="現金"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton35" runat="server" OnClick="LinkButton35_Click">合約及相關文件</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_file0" runat="server" Visible="False">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                
                                    </tr>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3C">
                                                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button45" runat="server" Text="下載" CssClass="BtnFree" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                                        <asp:BoundField DataField="Name" HeaderText="檔案名稱" SortExpression="Name" />
                                                        <asp:BoundField DataField="Type" HeaderText="檔案類型" SortExpression="Type" />
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
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [SubContract_File]">
                                                </asp:SqlDataSource>
                                            </td>
                                            </td>
                                    </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton36" runat="server" OnClick="LinkButton36_Click">分包合約工項</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_Material" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2">選擇顯示之變更次別</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">原分包合約預算</asp:ListItem>
                                            <asp:ListItem>第1次追加減</asp:ListItem>
                                            <asp:ListItem>第2次追加減</asp:ListItem>
                                            <asp:ListItem>第3次追加減</asp:ListItem>
                                            <asp:ListItem Enabled="False" Selected="True">第4次追加減</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td class="auto-style2" rowspan="2">
                                        <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" PostBackUrl="~/合預4-3.aspx" Text="重新載入" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">選擇顯示之欄位</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">數量</asp:ListItem>
                                            <asp:ListItem Selected="True">複價</asp:ListItem>
                                            <asp:ListItem>備註</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                        
                            <table class="SB_Table_M">
                                <tr class="SB_RowTop_M">
                                    <td class="auto-style102" rowspan="2">執行項次</td>
                                    <td class="auto-style102" rowspan="2">工料名稱</td>
                                    <td class="auto-style102" rowspan="2">單位</td>
                                    <td class="auto-style102" rowspan="2">單價</td>
                                    <td class="auto-style102" colspan="2">原分包合約預算</td>
                                    <td class="auto-style102" colspan="2">第3次追加減</td>
                                    <td class="auto-style102" colspan="2">第4次追加減</td>
                                </tr>
                                <tr class="SB_Row_M">
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                </tr>
                                <tr class="SB_Row_M">
                                    <td class="ShtCellCC">壹.一.3.1</td>
                                    <td class="ShtCellCL">B2F-挑高模板支撐架</td>
                                    <td class="ShtCellCC">M3</td>
                                    <td class="ShtCellCR">80</td>
                                    <td class="ShtCellCR">1,000</td>
                                    <td class="ShtCellCR">80,000</td>
                                    <td class="ShtCellCR">1,000</td>
                                    <td class="ShtCellCR">80,000</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                                <tr class="SB_Row_M">
                                    <td class="ShtCellCC">壹.一.4.2</td>
                                    <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                    <td class="ShtCellCC">M3</td>
                                    <td class="ShtCellCR">1,480</td>
                                    <td class="ShtCellCR">272</td>
                                    <td class="ShtCellCR">402,560</td>
                                    <td class="ShtCellCR">310</td>
                                    <td class="ShtCellCR">458,800</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                                <tr class="SB_Row_M">
                                    <td class="ShtCellCC">壹.一.9.1.2</td>
                                    <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                                    <td class="ShtCellCC">M3</td>
                                    <td class="ShtCellCR">1,480</td>
                                    <td class="ShtCellCR">1,008</td>
                                    <td class="ShtCellCR">1,491,840</td>
                                    <td class="ShtCellCR">1,200</td>
                                    <td class="ShtCellCR">1,776,000</td>
                                    <td class="auto-style112">-</td>
                                    <td class="auto-style112">-</td>
                                </tr>
                                <tr class="SB_Row_M">
                                    <td class="ShtCellCC">[全]</td>
                                    <td class="ShtCellCL">預拌混凝土澆置工資</td>
                                    <td class="ShtCellCC">工</td>
                                    <td class="ShtCellCR">3,200</td>
                                    <td class="ShtCellCR">595.2</td>
                                    <td class="ShtCellCR">1,904,640</td>
                                    <td class="ShtCellCR">595.2</td>
                                    <td class="ShtCellCR">1,904,640</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
    </form>
</body>
</html>
