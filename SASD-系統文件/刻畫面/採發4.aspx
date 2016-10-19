<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發4.aspx.cs" Inherits="採發4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
	        color: #000000;
            height: 25px;
        }     
            .TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}

.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
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
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
}
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
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
                

                
            .auto-style110 {
            width: 35%;
            vertical-align: central;
            height: 32px;
        }
                

                
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">邀標單管理</td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style110">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style110">
                                                            <asp:DropDownList ID="DropDownList33" runat="server" Font-Size="Medium" Height="30px" Width="155px" Font-Names="微軟正黑體">
                                                                <asp:ListItem Value="BookInTime">預定進場時間</asp:ListItem>
                                                                <asp:ListItem Value="BookContractDate">預定完成發包日期</asp:ListItem>
                                                                <asp:ListItem Value="LastContractDate">最遲完成發包日期</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
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
                                                            <asp:TextBox ID="TextBox86" runat="server" Font-Size="Medium" Height="20px" Width="120px"></asp:TextBox>
                                                            <asp:DropDownList ID="DDL_Op3" runat="server" Font-Size="Medium" AutoPostBack="True" Font-Names="微軟正黑體" OnSelectedIndexChanged="DDL_Op3_SelectedIndexChanged">
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
                                    <asp:GridView ID="GridView8" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button38_Click" Text="查詢/填寫/匯出邀標單" Visible='<%# (DataBinder.Eval(Container.DataItem,"SC_Code") is DBNull)? true:false %>'/>
                                                    &nbsp;
                                                    <asp:Button ID="Button41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button41_Click" Text="編修/刪除邀標單"  Visible='<%# (DataBinder.Eval(Container.DataItem,"SC_Code")is DBNull)? true:false %>' />
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
                                            <asp:TemplateField HeaderText="是否已訂定分包合約" SortExpression="SC_Code">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SC_Code") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (DataBinder.Eval(Container.DataItem,"SC_Code")is DBNull)? "否":"是" %>'></asp:Label>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY,SC_Code FROM SubBudgetList WHERE (PID = @PID) AND (BudgetLockNY = 1)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="auto-style3R">
                                    註：已有分包合約之預算無法執行邀標單之管理功能</td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_InviteE" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">檢視分包預算/變更邀標單資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server">
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
                        <asp:Label ID="Label691" runat="server" Text="6,500"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">邀標單回覆期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">2015.11.30</asp:TextBox>
                    </td>
                    <td class="auto-style2">保固期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1.5</asp:TextBox>
                        年</td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">補充說明</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="150px" TextMode="MultiLine" Width="500px">這是邀標單</asp:TextBox>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">檢視分包預算工料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Material" runat="server" Visible="False">
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style102">工料名稱</td>
                        <td class="auto-style102">單位</td>
                        <td class="auto-style102">所屬工項</td>
                        <td class="auto-style102">數量</td>
                        <td class="auto-style102">預算單價</td>
                        <td class="auto-style102">預算複價</td>
                    </tr>
                    <tr>
                        <td class="auto-style105">
                            <asp:Label ID="Label692" runat="server" Font-Size="Medium" Height="25px">產品，鋼筋，SD280</asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="Label693" runat="server" Font-Size="Medium" Height="25px" Width="50px">T</asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="Label694" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                        </td>
                        <td class="auto-style106">0.500</td>
                        <td class="auto-style106">8,000.00</td>
                        <td class="auto-style106">4,000.000</td>
                    </tr>
                    <tr>
                        <td class="auto-style105">
                            <asp:Label ID="Label695" runat="server" Font-Size="Medium" Height="25px">產品，金屬材料，鐵線</asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="Label696" runat="server" Font-Size="Medium" Height="25px" Width="50px">KG</asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="Label697" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                        </td>
                        <td class="auto-style106">2.000</td>
                        <td class="auto-style106">22.00</td>
                        <td class="auto-style106">44.000</td>
                    </tr>
                    <tr>
                        <td class="auto-style105">
                            <asp:Label ID="Label698" runat="server" Font-Size="Medium" Height="25px">技術工</asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="Label699" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="Label700" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                        </td>
                        <td class="auto-style106">0.675</td>
                        <td class="auto-style106">1,700.00</td>
                        <td class="auto-style106">1,147.500</td>
                    </tr>
                    <tr>
                        <td class="auto-style105">
                            <asp:Label ID="Label701" runat="server" Font-Size="Medium" Height="25px">小工</asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="Label702" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="Label703" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                        </td>
                        <td class="auto-style106">0.675</td>
                        <td class="auto-style106">1,500.00</td>
                        <td class="auto-style106">1,012.500</td>
                    </tr>
                    <tr>
                        <td class="auto-style107">
                            <asp:Label ID="Label704" runat="server" Font-Size="Medium" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                        </td>
                        <td class="auto-style108">
                            <asp:Label ID="Label705" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                        </td>
                        <td class="auto-style107">
                            <asp:Label ID="Label690" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                        </td>
                        <td class="auto-style109">0.500</td>
                        <td class="auto-style109">592.00</td>
                        <td class="auto-style109">296.000</td>
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
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="樣　品" Checked="True" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="型錄規範" Checked="True" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="大樣圖說" Checked="True" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox4" runat="server" Text="單價分析表" Checked="True" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox5" runat="server" Text="業績表" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox6" runat="server" Text="材料證明" Checked="True" />
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
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">變更邀標單附件</asp:LinkButton>
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
                                <asp:Button ID="Button36" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="上傳" Width="71px" />
                            </td>
                            <tr>
                                <td class="auto-style3C" colspan="7">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource10" Width="100%" ForeColor="#333333" GridLines="None">
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
                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [SubRFQ_File] WHERE [UID] = @UID" InsertCommand="INSERT INTO [SubRFQ_File] ([SBID], [Name], [Type], [Path]) VALUES (@SBID, @Name, @Type, @Path)" SelectCommand="SELECT * FROM [SubRFQ_File]" UpdateCommand="UPDATE [SubRFQ_File] SET [SBID] = @SBID, [Name] = @Name, [Type] = @Type, [Path] = @Path WHERE [UID] = @UID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="SBID" Type="String" />
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="SBID" Type="String" />
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
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">變更邀標廠商</asp:LinkButton>
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
                        <asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定變更邀標單" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button37" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="回復原值" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button38" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="刪除邀標單" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
                        <asp:Panel ID="Pnl_InviteQ" runat="server" Visible="False">
                        
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style2">分包預算編號</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label3" runat="server" Text="SB002"></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算名稱</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label4" runat="server" Text="分包預算2"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3C" colspan="4">
                                    <asp:GridView ID="GridView10" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button42_Click" Text="查詢/填寫廠商報價" />
                                                    &nbsp;
                                                    <asp:Button ID="Button43" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="匯出邀標單" />
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
                                    <td class="auto-style2" rowspan="2">報價總價(不含稅)</td>
                                    <td class="auto-style3" rowspan="2">
                                        <asp:Label ID="Label6" runat="server" Text="-" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">報價有效期限</td>
                                    <td class="auto-style3">
                                        <asp:TextBox ID="TextBox27" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
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
                            </table>
                                <table class="auto-style4">
                                    <tr>
                                        <td class="auto-style102">工料名稱</td>
                                        <td class="auto-style102">單位</td>
                                        <td class="auto-style102">所屬工項</td>
                                        <td class="auto-style102">數量</td>
                                        <td class="auto-style102">報價單價</td>
                                        <td class="auto-style102">報價複價</td>
                                        <td class="auto-style102">議價後單價</td>
                                        <td class="auto-style102">議價後複價</td>
                                        <td class="auto-style102">廠牌規格說明</td>
                                        <td class="auto-style102">備註</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label667" runat="server" Height="25px" Font-Size="Medium">產品，鋼筋，SD280</asp:Label>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:Label ID="Label678" runat="server" Height="25px" Font-Size="Medium" Width="50px">T</asp:Label>
                                        </td>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label656" runat="server" Font-Names="微軟正黑體" Text="壹.二.4.2.1F-鋼筋" Font-Size="Medium"></asp:Label>
                                        </td>
                                        <td class="auto-style106">
                                            0.500</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox28" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style106">
                                            -</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox88" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox93" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label668" runat="server" Font-Size="Medium" Height="25px">產品，金屬材料，鐵線</asp:Label>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:Label ID="Label679" runat="server" Font-Size="Medium" Height="25px" Width="50px">KG</asp:Label>
                                        </td>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label681" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                        </td>
                                        <td class="auto-style106">2.000</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox29" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox89" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox94" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label669" runat="server" Font-Size="Medium" Height="25px">技術工</asp:Label>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:Label ID="Label677" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                        </td>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label682" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                        </td>
                                        <td class="auto-style106">0.675</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox30" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox90" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox95" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label670" runat="server" Font-Size="Medium" Height="25px">小工</asp:Label>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:Label ID="Label676" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                        </td>
                                        <td class="auto-style105">
                                            <asp:Label ID="Label683" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                        </td>
                                        <td class="auto-style106">0.675</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox31" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style106">-</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox91" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox96" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style107">
                                            <asp:Label ID="Label671" runat="server" Font-Size="Medium" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                        </td>
                                        <td class="auto-style108">
                                            <asp:Label ID="Label680" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                                        </td>
                                        <td class="auto-style107">
                                            <asp:Label ID="Label684" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                        </td>
                                        <td class="auto-style109">0.500</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox32" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style109">-</td>
                                        <td class="auto-style109">-</td>
                                        <td class="auto-style109">-</td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox92" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:TextBox ID="TextBox97" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Button ID="Button25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="計算總價並儲存" />
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp;&nbsp; 邀標單附件</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource9" Width="100%" ForeColor="#333333" GridLines="None">
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
                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [UID], [Name], [Type], [Path] FROM [SubRFQ_File]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
    
    </div>
    </form>
</body>
</html>
