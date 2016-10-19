<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發9.aspx.cs" Inherits="採發9" %>

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
                    

        
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
            
        
                            

            .auto-style4 {
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

        
            .auto-style110 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            height: 34px;
        }
        .auto-style111 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: left;
            color: #000000;
            height: 34px;
        }
        .auto-style112 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: right;
            color: #000000;
            height: 34px;
        }

        
            .BtnFree {
            font-size:medium;
            font-family:微軟正黑體;
            height:30px;
        }
        .auto-style113 {
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
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">分包預算變更</td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包合約名稱(關鍵字)</td>
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
                                    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button43" runat="server" CssClass="BtnFree" OnClick="Button42_Click" Text="編輯" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="分包合約編號" HeaderText="分包合約編號" SortExpression="分包合約編號" />
                                            <asp:BoundField DataField="分包合約名稱" HeaderText="分包合約名稱" SortExpression="分包合約名稱" />
                                            <asp:BoundField DataField="得標廠商名稱" HeaderText="得標廠商名稱" SortExpression="得標廠商名稱" />
                                            <asp:BoundField DataField="預定進場時間" DataFormatString="{0:yyyy/MM/dd}" HeaderText="預定進場時間" SortExpression="預定進場時間" />
                                            <asp:BoundField DataField="分包合約總價" HeaderText="分包合約總價" SortExpression="分包合約總價" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SubContract_Main.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總價, SubContract_Main.BookInTime AS 預定進場時間, FirmM.Name AS 得標廠商名稱 FROM SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE (SubContract_Main.PID = @PID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_SubContract" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="Table0">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="White">分包合約主資料</asp:LinkButton>
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
                        <td class="auto-style2">前次追加減後總價</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label752" runat="server" Font-Bold="True" ForeColor="Red" Text="7,500"></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">分包合約編號</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label732" runat="server" Text="SC005"></asp:Label>
                            </span></td>
                        <td class="auto-style2">分包合約名稱</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label724" runat="server" Text="分包合約5"></asp:Label>
                            </span></td>
                        <td class="auto-style2">合約種類</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label719" runat="server" Text="工程合約"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style113">預定完工日期</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label733" runat="server" Text="2016.6.30"></asp:Label>
                            </span></td>
                        <td class="auto-style113">履約保證</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label723" runat="server" Text="銀行支票保證"></asp:Label>
                            </span></td>
                        <td class="auto-style113">出廠證明提送</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label725" runat="server" Text="100"></asp:Label>
                            </span>%提送</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">請款次數</td>
                        <td class="auto-style3"><span class="auto-style14">
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
                        <td class="auto-style3" colspan="3"><span class="auto-style14">
                            <asp:Label ID="Label728" runat="server" Text="一天1000元"></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label722" runat="server" Text="2"></asp:Label>
                            </span>年</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">稅額百分比</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label730" runat="server" Text="5"></asp:Label>
                            </span>%</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label731" runat="server" Text="老王綁來的標"></asp:Label>
                            </span></td>
                        <td class="auto-style2">本次追加減次序</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label751" runat="server" Font-Bold="True" ForeColor="Red" Text="4"></asp:Label>
                            </span></td>
                        <td class="auto-style2">本次追加減後總價</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label754" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                            </span></td>
                    </tr>
                </table>
            </asp:Panel>
                        <table style="width: 100%">
                            <tr>
                                <td class="Table0">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton36" runat="server" OnClick="LinkButton36_Click" ForeColor="White">分包合約工料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_Material" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td class="Table1L" colspan="3">&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/AddNewList.png" PostBackUrl="~/EChangeSummaryA.aspx" ToolTip="新增執行預算變更" Width="27px" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton207" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/AddNewItem.png" PostBackUrl="~/AddSubBudgetMaterial.aspx" ToolTip="增加新工料" Width="27px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">選擇顯示之變更次別</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">原分包合約預算</asp:ListItem>
                                            <asp:ListItem>第1次追加減</asp:ListItem>
                                            <asp:ListItem>第2次追加減</asp:ListItem>
                                            <asp:ListItem Selected="True">第3次追加減</asp:ListItem>
                                            <asp:ListItem Selected="True">第4次追加減</asp:ListItem>
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
                            <table class="auto-style4">
                                <tr>
                                    <td class="auto-style102" rowspan="2">&nbsp;</td>
                                    <td class="auto-style102" rowspan="2">工料名稱</td>
                                    <td class="auto-style102" rowspan="2">單位</td>
                                    <td class="auto-style102" rowspan="2">所屬工項</td>
                                    <td class="auto-style102" rowspan="2">單價</td>
                                    <td class="auto-style102" colspan="2">原分包合約預算</td>
                                    <td class="auto-style102" colspan="2">第3次追加減</td>
                                    <td class="auto-style102" colspan="2">第4次追加減</td>
                                </tr>
                                <tr>
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                    <td class="auto-style102">數量</td>
                                    <td class="auto-style102">複價</td>
                                </tr>
                                <tr>
                                    <td class="auto-style103">
                                        <asp:ImageButton ID="ImageButton201" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/Edit.png" PostBackUrl="~/SubChangeDetail.aspx" ToolTip="單一項目追加減" Width="27px" />
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label736" runat="server" Font-Size="Medium" Height="25px">產品，鋼筋，SD280</asp:Label>
                                    </td>
                                    <td class="auto-style103">
                                        <asp:Label ID="Label737" runat="server" Font-Size="Medium" Height="25px" Width="50px">T</asp:Label>
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label738" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                    </td>
                                    <td class="auto-style106">8,000.00</td>
                                    <td class="auto-style106">1.000</td>
                                    <td class="auto-style106">8,000.000</td>
                                    <td class="auto-style106">0.500</td>
                                    <td class="auto-style106">4,000.000</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                                <tr>
                                    <td class="auto-style103">
                                        <asp:ImageButton ID="ImageButton202" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="單一項目追加減" Width="27px" />
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label739" runat="server" Font-Size="Medium" Height="25px">產品，金屬材料，鐵線</asp:Label>
                                    </td>
                                    <td class="auto-style103">
                                        <asp:Label ID="Label740" runat="server" Font-Size="Medium" Height="25px" Width="50px">KG</asp:Label>
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label741" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                    </td>
                                    <td class="auto-style106">22.00</td>
                                    <td class="auto-style106">4.000</td>
                                    <td class="auto-style106">88.000</td>
                                    <td class="auto-style106">2.000</td>
                                    <td class="auto-style106">44.000</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                                <tr>
                                    <td class="auto-style110">
                                        <asp:ImageButton ID="ImageButton203" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="單一項目追加減" Width="27px" />
                                    </td>
                                    <td class="auto-style111">
                                        <asp:Label ID="Label742" runat="server" Font-Size="Medium" Height="25px">技術工</asp:Label>
                                    </td>
                                    <td class="auto-style110">
                                        <asp:Label ID="Label743" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                    </td>
                                    <td class="auto-style111">
                                        <asp:Label ID="Label744" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                    </td>
                                    <td class="auto-style112">1,700.00</td>
                                    <td class="auto-style112">1.000</td>
                                    <td class="auto-style112">1,700.000</td>
                                    <td class="auto-style112">0.675</td>
                                    <td class="auto-style112">1,147.500</td>
                                    <td class="auto-style112">-</td>
                                    <td class="auto-style112">-</td>
                                </tr>
                                <tr>
                                    <td class="auto-style103">
                                        <asp:ImageButton ID="ImageButton204" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="單一項目追加減" Width="27px" />
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label745" runat="server" Font-Size="Medium" Height="25px">小工</asp:Label>
                                    </td>
                                    <td class="auto-style103">
                                        <asp:Label ID="Label746" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                    </td>
                                    <td class="auto-style105">
                                        <asp:Label ID="Label747" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                    </td>
                                    <td class="auto-style106">1,500.00</td>
                                    <td class="auto-style106">1.000</td>
                                    <td class="auto-style106">1,500.000</td>
                                    <td class="auto-style106">0.675</td>
                                    <td class="auto-style106">1,012.500</td>
                                    <td class="auto-style106">-</td>
                                    <td class="auto-style106">-</td>
                                </tr>
                                <tr>
                                    <td class="auto-style108">
                                        <asp:ImageButton ID="ImageButton205" runat="server" BorderStyle="None" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="單一項目追加減" Width="27px" />
                                    </td>
                                    <td class="auto-style107">
                                        <asp:Label ID="Label748" runat="server" Font-Size="Medium" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                    </td>
                                    <td class="auto-style108">
                                        <asp:Label ID="Label749" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                                    </td>
                                    <td class="auto-style107">
                                        <asp:Label ID="Label750" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                    </td>
                                    <td class="auto-style109">592.00</td>
                                    <td class="auto-style109">1.000</td>
                                    <td class="auto-style109">592.000</td>
                                    <td class="auto-style109">0.500</td>
                                    <td class="auto-style109">296.000</td>
                                    <td class="auto-style109">-</td>
                                    <td class="auto-style109">-</td>
                                </tr>
                            </table>
                </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;<asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="計算" Width="120px" />
&nbsp;
                        <asp:Button ID="Button41" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="計算並儲存" Width="120px" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button44" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="回復原值" Width="120px" />
                    </td>
                </tr>
            </table>
            </asp:Panel>
    
    </div>
    </form>
</body>
</html>
