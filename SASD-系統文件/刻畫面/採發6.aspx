<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發6.aspx.cs" Inherits="採發6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">










        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #5D7B9D;
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
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
.auto-style15 {
	color: #008000;
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
                

                
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">新增分包合約</td>
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
                                                            <asp:DropDownList ID="DropDownList34" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="160px">
                                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
            </td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView6" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button40_Click" Text="新增分包合約" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" InsertVisible="False" ReadOnly="True" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="分包預算編號" HeaderText="分包預算編號" SortExpression="分包預算編號" />
                                            <asp:BoundField DataField="分包預算名稱" HeaderText="分包預算名稱" SortExpression="分包預算名稱" />
                                            <asp:BoundField DataField="預定進場時間" HeaderText="預定進場時間" SortExpression="預定進場時間" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="預算金額" HeaderText="預算金額" SortExpression="預算金額" />
                                            <asp:BoundField DataField="得標廠商名稱" HeaderText="得標廠商名稱" SortExpression="得標廠商名稱" />
                                            <asp:BoundField DataField="報價總價" HeaderText="報價總價" SortExpression="報價總價" />
                                            <asp:BoundField DataField="議價後總價" HeaderText="議價後總價" SortExpression="議價後總價" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SubBudgetList.SBID, SubBudgetList.SB_Code AS 分包預算編號, SubBudgetList.SB_Name AS 分包預算名稱, SubBudgetList.BookInTime AS 預定進場時間, SubBudgetList.BudgetPrice AS 預算金額, FirmM.Name AS 得標廠商名稱, SubRFQ_Firm.TotalPrice AS 報價總價, SubRFQ_Firm.DisTotalPrice AS 議價後總價 FROM SubBudgetList INNER JOIN SubRFQ_Firm ON SubBudgetList.SBID = SubRFQ_Firm.SBID AND SubBudgetList.GetFirmID = SubRFQ_Firm.FirmID INNER JOIN FirmM ON SubRFQ_Firm.FirmID = FirmM.UID WHERE (SubBudgetList.GetFirmID &lt;&gt; @GetFirmID) AND (SubBudgetList.SC_Code IS NULL)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="GetFirmID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="Table2R">
                                    註：僅顯示已有得標廠商且尚未新增分包合約之分包預算</td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_Contract" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">分包預算邀標資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_BudgetData" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">分包預算編號</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label692" runat="server" Text="SB004"></asp:Label>
                        </td>
                        <td class="auto-style2">分包預算名稱</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label693" runat="server" Text="分包預算4"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">承攬方式</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label694" runat="server" Text="總價承攬"></asp:Label>
                        </td>
                        <td class="auto-style2">採購負責人</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label695" runat="server" Text="採購部-陳大華"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">預定進場日期</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label696" runat="server" Text="2016.1.1"></asp:Label>
                        </td>
                        <td class="auto-style4">分包預算金額</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label697" runat="server" Text="10,000,000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">得標廠商</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label698" runat="server" Text="老王建設"></asp:Label>
                        </td>
                        <td class="auto-style2">議價後總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label699" runat="server" Text="9,000,000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包合約主資料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">分包合約編號</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox85" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px">SB004</asp:TextBox>
                        </td>
                        <td class="auto-style2">分包合約名稱</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox86" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px">分包預算4</asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">合約種類</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged1">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>工程合約</asp:ListItem>
                                <asp:ListItem>買賣合約</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">預定完工日期</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox91" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">履約保證</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem>銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2" colspan="2">出廠證明提送</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox88" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %提送</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">請款次數</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            <span class="auto-style14">次/月</span><span class="auto-style8"> </span></td>
                        <td class="auto-style2">請款日</td>
                        <td class="auto-style3">每月<asp:TextBox ID="TextBox89" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                        <td class="auto-style2" colspan="2">付款日</td>
                        <td class="auto-style3">每月<asp:TextBox ID="TextBox90" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style4">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Warranty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請先選擇合約種類-</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4">逾罰</td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="134" />
                            <span">千分之</span><br />&nbsp;<span><asp:TextBox ID="TextBox96" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            /每天</span></td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="135" checked="true" />
                            <span>一天<br /> 
                            <asp:TextBox ID="TextBox97" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            元</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox98" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox99" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">稅額百分比</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox100" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3" colspan="6">
                            <asp:TextBox ID="TextBox101" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">付款資料</asp:LinkButton>
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
                            <asp:TextBox ID="TextBox102" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox103" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox104" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox105" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DropDownList36" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem>銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
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
                        <td class="auto-style3C">
                            </td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox108" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox109" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox110" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
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
                            <asp:TextBox ID="TextBox111" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox112" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox113" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox114" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
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
                            <asp:TextBox ID="TextBox115" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox116" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox117" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox118" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DropDownList37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>現金</asp:ListItem>
                                <asp:ListItem>銀行產物公司</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>商業本票銀行支票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增分包合約" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
        <br />
    
    </div>
    </form>
</body>
</html>
