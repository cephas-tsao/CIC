<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubInviteAdd.aspx.cs" Inherits="SubInviteAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
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
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }  
        
        .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 25px;
            width: 100%;
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
                

                
            .SB_RowTop_M {
            background-color: #00A600;
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            vertical-align:central;
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
        .SB_Row_M {
            background-color: #A6FFA6;
        }
                        

                
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">新增邀標單</td>
		</tr>
		    <tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList33" runat="server" Font-Size="Medium" Height="30px" Width="155px" Font-Names="微軟正黑體">
                                                                <asp:ListItem Value="BookInTime">預定進場時間</asp:ListItem>
                                                                <asp:ListItem Value="BookContractDate">預定完成發包日期</asp:ListItem>
                                                                <asp:ListItem Value="LastContractDate">最遲完成發包日期</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button37" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox86" runat="server" Font-Size="Medium" Height="20px" Width="120px"></asp:TextBox>
                                                            <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLshort" Font-Size="Medium" AutoPostBack="True" Font-Names="微軟正黑體" OnSelectedIndexChanged="DDL_Op3_SelectedIndexChanged">
                                                                <asp:ListItem Selected="True" Value="&lt;">之前</asp:ListItem>
                                                                <asp:ListItem Value="&gt;">之後</asp:ListItem>
                                                                <asp:ListItem Value="Between">之間</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="TextBox87" runat="server" Font-Size="Medium" Height="20px" Width="120px" Visible="False"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                </td>
            </tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button38_Click" Text="新增此分包預算之邀標單" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" InsertVisible="False" ReadOnly="True" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                            <asp:BoundField DataField="SB_Code" HeaderText="分包預算編號" SortExpression="SB_Code" />
                                            <asp:BoundField DataField="SB_Name" HeaderText="分包預算名稱" SortExpression="SB_Name" />
                                            <asp:BoundField DataField="BookInTime" HeaderText="預定進場時間" SortExpression="BookInTime" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BookContractDate" HeaderText="預定完成發包日期" SortExpression="BookContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="LastContractDate" HeaderText="最遲完成發包日期" SortExpression="LastContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BudgetPrice" HeaderText="預算金額" SortExpression="BudgetPrice" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY FROM SubBudgetList WHERE (PID = @PID) AND (BudgetLockNY = 0)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_IAdd" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包預算/邀標單資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server">
                <table style="width: 100%">
                <tr>
                    <td class="auto-style2">分包預算編號</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="SB001"></asp:Label>
                    </td>
                    <td class="auto-style2">分包預算名稱</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="分包預算1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">承攬方式</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label685" runat="server" Text="實做實算"></asp:Label>
                    </td>
                    <td class="auto-style2">採購負責人</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label689" runat="server" Text="採購部-陳大華"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">預定進場日期</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label686" runat="server" Text="2016.5.1"></asp:Label>
                    </td>
                    <td class="auto-style2">預定完成發包日期</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label688" runat="server" Text="2015.12.31"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">最遲完成發包期限</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label687" runat="server" Text="2016.3.31"></asp:Label>
                    </td>
                    <td class="auto-style2">分包預算金額</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label684" runat="server" Text="6,500"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">邀標單回覆期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">保固期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                        年</td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">補充說明</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="150px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">檢視分包預算工項</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Material" runat="server" Visible="False">
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
                        <td class="ShtCellCC">
                            壹.一.3.1</td>
                        <td class="ShtCellCL">
                            B2F-挑高模板支撐架</td>
                        <td class="ShtCellCC">
                            M3</td>
                        <td class="ShtCellCR">1,000</td>
                        <td class="ShtCellCR">80</td>
                        <td class="ShtCellCR">80,000</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">
                            壹.一.4.2</td>
                        <td class="ShtCellCL">
                            280kgf/cm2預拌混凝土材料</td>
                        <td class="ShtCellCC">
                            M3</td>
                        <td class="ShtCellCR">272</td>
                        <td class="ShtCellCR">1,480</td>
                        <td class="ShtCellCR">402,560</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">
                            壹.一.9.1.2</td>
                        <td class="ShtCellCL">
                            280kgf/cm2預拌混凝土材料</td>
                        <td class="ShtCellCC">
                            M3</td>
                        <td class="ShtCellCR">1,008</td>
                        <td class="ShtCellCR">1,480</td>
                        <td class="ShtCellCR">1,491,840</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">
                            [全]</td>
                        <td class="ShtCellCL">
                            預拌混凝土澆置工資</td>
                        <td class="ShtCellCC">
                            工</td>
                        <td class="ShtCellCR">595.2</td>
                        <td class="ShtCellCR">3,200</td>
                        <td class="ShtCellCR">1,904,640</td>
                    </tr>
                </table>
            </asp:Panel>
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
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="樣　品" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="型錄規範" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="大樣圖說" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox4" runat="server" Text="單價分析表" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox5" runat="server" Text="業績表" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox6" runat="server" Text="材料證明" />
                    </td>
                    <td class="auto-style3C" colspan="2">
                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox7_CheckedChanged" Text="其他" />
                        <asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Visible="False" Width="200px"></asp:TextBox>
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
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">附件名稱</td>
                            <td class="auto-style3">
                            <asp:TextBox ID="TextBox85" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">附件類型</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem>圖說</asp:ListItem>
                                    <asp:ListItem>規範</asp:ListItem>
                                    <asp:ListItem>其他</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="TextBox84" runat="server" Height="25px" Visible="False" Width="100px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">選擇檔案</td>
                            <td class="auto-style3">
                                <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" />
                            </td>
                            <td class="auto-style2">
                                <asp:Button ID="Button32" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="上傳" Width="71px" />
                            </td>
                            <tr>
                                <td class="auto-style3C" colspan="7">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" Width="100%" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                                            <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                            <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" Visible="False" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [SubRFQ_File] WHERE [UID] = @UID" InsertCommand="INSERT INTO [SubRFQ_File] ([SBID], [Name], [Type], [Path]) VALUES (@SBID, @Name, @Type, @Path)" SelectCommand="SELECT * FROM [SubRFQ_File]" UpdateCommand="UPDATE [SubRFQ_File] SET [SBID] = @SBID, [Name] = @Name, [Type] = @Type, [Path] = @Path WHERE [UID] = @UID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="SBID" Type="Int32" />
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="SBID" Type="Int32" />
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">選擇邀標廠商</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_firm" runat="server" Visible="False">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style3">
                            <table class="auto-style63">
                                <tr>
                                    <td class="auto-style2" rowspan="2">搜<br /> 尋</td>
                                    <td class="auto-style2">廠商類型</td>
                                    <td class="auto-style3C" rowspan="2">
                                        <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                            <asp:ListItem Value="OR">或</asp:ListItem>
                                            <asp:ListItem Value="NOT">非</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style2">廠商專長/供給項目(關鍵字)</td>
                                    <td class="auto-style3C" rowspan="2">
                                        <asp:Button ID="Button18" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                        <br />
                                        <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource7" DataTextField="Content" DataValueField="Content" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px">
                                            <asp:ListItem Value="">-請選擇 -</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Content] FROM [UsualWord] WHERE ([Type] = @Type)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:TextBox ID="TextBox24" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C" colspan="5">
                                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource6" Width="100%" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="選擇">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox8" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                    <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="廠商類型" SortExpression="Type" />
                                    <asp:BoundField DataField="SupportItem" HeaderText="廠商專長／供給材料" SortExpression="SupportItem" />
                                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" Visible="False" />
                                    <asp:BoundField DataField="Location" HeaderText="所在縣市" SortExpression="Location" />
                                    <asp:BoundField DataField="Tel1" HeaderText="聯絡電話" SortExpression="Tel1" />
                                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                    <asp:TemplateField HeaderText="詳細資料">
                                        <ItemTemplate>
                                            <asp:Button ID="Button39" runat="server" Text="詳細資料" CssClass="BtnFree" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [UID], [Name], [Type], [SupportItem], [Owner], [Location], [Tel1], [Notes] FROM [FirmM]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增邀標單" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
