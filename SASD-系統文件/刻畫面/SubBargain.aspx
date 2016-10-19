<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubBargain.aspx.cs" Inherits="SubBargain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
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
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
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
            width: 100%;
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
                

                
            .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
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
            
        
                            
            .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
            
        
                            
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style4">
            <tr>
                <td class="auto-style1">協力廠商議價議約</td>
            </tr>
            <tr>
                <td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium" Font-Names="微軟正黑體">
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
                                    <asp:GridView ID="GV_SB" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="Sql_SB" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" SelectText="查詢已回傳報價之廠商" ShowSelectButton="True">
                                            <ControlStyle CssClass="BtnFree" />
                                            </asp:CommandField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button44" runat="server" CssClass="BtnFree" OnClick="Button44_Click" Text="檢視議價呈核表" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" InsertVisible="False" ReadOnly="True" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                            <asp:BoundField DataField="SB_Code" HeaderText="分包預算編號" SortExpression="SB_Code" />
                                            <asp:BoundField DataField="SB_Name" HeaderText="分包預算名稱" SortExpression="SB_Name" />
                                            <asp:BoundField DataField="BookInTime" HeaderText="預定進場時間" SortExpression="BookInTime" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BookContractDate" HeaderText="預定完成發包時間" SortExpression="BookContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="LastContractDate" HeaderText="最遲完成發包時間" SortExpression="LastContractDate" DataFormatString="{0:yyyy/MM/dd}" />
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
                                    <asp:SqlDataSource ID="Sql_SB" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [SBID], [PID], [SB_Name], [SB_Code], [BookInTime], [BookContractDate], [LastContractDate] FROM [SubBudgetList] WHERE (([PID] = @PID) AND ([BudgetLockNY] = @BudgetLockNY) AND ([GetFirmID] = @GetFirmID))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="BudgetLockNY" Type="Int32" />
                                            <asp:Parameter DefaultValue="0" Name="GetFirmID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3R">
                                    註：僅顯示尚未決定得標廠商之分包預算</td>
            </tr>
            <tr>
                <td class="auto-style3C">
                                    <asp:GridView ID="GV_Firm" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="Sql_Detail" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button45" runat="server" CssClass="BtnFree" OnClick="Button45_Click" Text="增修議約議價內容" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="TotalPrice" HeaderText="報價總價" SortExpression="TotalPrice" />
                                            <asp:TemplateField HeaderText="折扣後總價" SortExpression="DiscountTotal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DiscountTotal") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DiscountTotal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
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
                                    <asp:SqlDataSource ID="Sql_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SubRFQ_Firm.UID, SubRFQ_Firm.SBID, SubRFQ_Firm.TotalPrice, SubRFQ_Firm.GetNY, FirmM.Name, SubRFQ_Firm.DiscountPercent, SubRFQ_Firm.DiscountTotal FROM SubRFQ_Firm INNER JOIN FirmM ON SubRFQ_Firm.FirmID = FirmM.UID WHERE (SubRFQ_Firm.SBID = @SBID) AND (SubRFQ_Firm.TotalPrice IS NOT NULL) ORDER BY SubRFQ_Firm.Sort">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GV_SB" Name="SBID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Bargain" runat="server" Visible="False">
            <table class="auto-style4">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">議價資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Price" runat="server" Visible="False">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">廠商名稱</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label5" runat="server" Text="育偉土木包工業"></asp:Label>
                        </td>
                        <td class="auto-style2">預算金額</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label686" runat="server" Text="3,879,040"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">報價有效期限</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label685" runat="server" Font-Names="微軟正黑體" Text="2016.01.31"></asp:Label>
                        </td>
                        <td class="auto-style2">報價總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red" Text="3,726,600"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style103">是否為得標廠商</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Text="是/否"></asp:Label>
                        </td>
                        <td class="auto-style103">議價後總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label687" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">議價內容</td>
                        <td class="auto-style3" colspan="3">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                <asp:ListItem>約定總價上限</asp:ListItem>
                                <asp:ListItem>約定折扣百分比</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:TextBox ID="TB_Bargain" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Visible="False" Width="150px"></asp:TextBox>
                            <asp:Label ID="LB_Unit" runat="server" Text="元" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="SB_Table_M">
                    <tr class="SB_RowTop_M">
                        <td class="auto-style102">執行項次</td>
                        <td class="auto-style102">工項名稱</td>
                        <td class="auto-style102">單位</td>
                        <td class="auto-style102">數量</td>
                        <td class="auto-style102">報價單價</td>
                        <td class="auto-style102">報價複價</td>
                        <td class="auto-style102">議價後單價</td>
                        <td class="auto-style102">議價後複價</td>
                        <td class="auto-style102">廠牌規格說明</td>
                        <td class="auto-style102">備註</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">壹.一.3.1</td>
                        <td class="ShtCellCL">B2F-挑高模板支撐架</td>
                        <td class="ShtCellCC">M3</td>
                        <td class="ShtCellCR">1,000</td>
                        <td class="ShtCellCC">85</td>
                        <td class="ShtCellCR">85,000</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCC">&nbsp;</td>
                        <td class="ShtCellCC">&nbsp;</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">壹.一.4.2</td>
                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                        <td class="ShtCellCC">M3</td>
                        <td class="ShtCellCR">272</td>
                        <td class="ShtCellCC">1,450</td>
                        <td class="ShtCellCR">394,400</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCC">&nbsp;</td>
                        <td class="ShtCellCC">&nbsp;</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">壹.一.9.1.2</td>
                        <td class="ShtCellCL">280kgf/cm2預拌混凝土材料</td>
                        <td class="ShtCellCC">M3</td>
                        <td class="ShtCellCR">1,008</td>
                        <td class="ShtCellCC">1,450</td>
                        <td class="ShtCellCR">1,461,600</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCC">&nbsp;</td>
                        <td class="ShtCellCC">&nbsp;</td>
                    </tr>
                    <tr class="SB_Row_M">
                        <td class="ShtCellCC">[全]</td>
                        <td class="ShtCellCL">預拌混凝土澆置工資</td>
                        <td class="ShtCellCC">工</td>
                        <td class="ShtCellCR">595.2</td>
                        <td class="ShtCellCC">3,000</td>
                        <td class="ShtCellCR">1,785,600</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCR">-</td>
                        <td class="ShtCellCC">&nbsp;</td>
                        <td class="ShtCellCC">&nbsp;</td>
                    </tr>
                </table>
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="Button25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="計算並儲存" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">議約資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Contract" runat="server" Visible="False">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">合約種類</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>工程合約</asp:ListItem>
                                <asp:ListItem>買賣合約</asp:ListItem>
                            </asp:DropDownList>
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
                        <td class="auto-style2">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Warranty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請先選擇合約種類-</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2">逾罰</td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="136" />
                            <span">千分之</span><br />&nbsp;<span><asp:TextBox ID="TextBox96" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            /每天</span></span">
                        </td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="137" checked="true" />
                            <span>一天<br /> 
                            <asp:TextBox ID="TextBox97" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            元</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox98" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2">保養年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox119" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2" colspan="2">再保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox120" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">稅額百分比</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox100" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3" colspan="4">
                            <asp:TextBox ID="TextBox99" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3" colspan="6">
                            <asp:TextBox ID="TextBox101" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
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
                            <asp:TextBox ID="TextBox104" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
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
                        <td class="auto-style3C"></td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox108" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox109" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox110" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
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
                            <asp:TextBox ID="TextBox111" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox112" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox113" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox114" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
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
                            <asp:TextBox ID="TextBox115" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox116" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox117" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox118" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DropDownList37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>現金</asp:ListItem>
                                <asp:ListItem>銀行產物公司</asp:ListItem>
                                <asp:ListItem>商業本票</asp:ListItem>
                                <asp:ListItem>銀行支票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="Button42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="儲存" Width="100px" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button43" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="回復原值" Width="100px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
