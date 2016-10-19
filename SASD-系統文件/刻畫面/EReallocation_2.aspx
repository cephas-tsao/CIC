<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EReallocation_2.aspx.cs" Inherits="EReallocation_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="TableTop" colspan="2">執行預算-拆工料</td>
		</tr>
        <tr>
			<td class="Table2C">
        <table style="width: 100%">
		    <tr>
		<td class="Table1">
                                變更次別</td>
            <td class="Table2CC">
                                    <asp:Label ID="Label182" runat="server" Text="0" ForeColor="Red"></asp:Label>
            </td>
            <td class="Table1L" colspan="5">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                上層工項(拆工料母項)</td>
		</tr>
		<tr>
		<td class="Table1">
                                項次</td>
            <td class="Table2" colspan="2">
                                    2</td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2" colspan="3">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="Table1">
                單位</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="Table1">
                數量</td>
            <td class="Table2">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
            <td class="Table1">
                單價</td>
            <td class="Table2">
                                    3,170</td>
		</tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                下層新增工項(拆工料子項)</td>
		</tr>
		<tr>
		<td class="Table2C" colspan="7">
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">移除</td>
                                        <td class="ShtCellCC">工項名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">數量</td>
                                    </tr>
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton195" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong">140預拌混凝土</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem Selected="True">M3</asp:ListItem>
                                                <asp:ListItem>式</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort">1,050</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="ShtRowDouble">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton196" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px" />
                                    <asp:ImageButton ID="ImageButton192" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBlong">混凝土養護</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem>M3</asp:ListItem>
                                                <asp:ListItem Selected="True">式</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort">1,000</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton191" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" />
                                    <asp:ImageButton ID="ImageButton194" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px" />
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox7" runat="server" CssClass="TBlong">混凝土作業工</asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DDLfree">
                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                <asp:ListItem>M</asp:ListItem>
                                                <asp:ListItem>M2</asp:ListItem>
                                                <asp:ListItem>M3</asp:ListItem>
                                                <asp:ListItem>式</asp:ListItem>
                                                <asp:ListItem Selected="True">工</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBshort">7.2</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
            </td>
		</tr>
		<tr>
		<td class="Table2R" colspan="7">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增子項" Width="27px" />
                                            </td>
		</tr>
		</table>
            </td>
			<td class="Table2C" width="35%">
                                    <table class="SB_Table_A">
                                        <tr class="SB_RowTop_M">
                                            <td colspan="5">對應合約工項之單價分析</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell0C_A">引用</td>
                                            <td class="SB_Cell0C_A">類型</td>
                                            <td class="SB_Cell0C_A">工料名稱</td>
                                            <td class="SB_Cell0C_A">單位</td>
                                            <td class="SB_Cell0C_A">工率</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label280" runat="server" Text="連工帶料項" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label272" runat="server" Height="25px" Text="混凝土養護" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label288" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label281" runat="server" Text="材料" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    產品，預拌混凝土材料費，140kgf/cm2，第1型水泥，(工地交貨，含減水劑)</td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label289" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton181" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label282" runat="server" Text="機具" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label274" runat="server" Height="25px" Text="混凝土泵" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label290" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label283" runat="server" Text="機具" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label275" runat="server" Height="25px" Text="混凝土泵，混凝土輸送管" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label291" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label284" runat="server" Text="機具" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label276" runat="server" Height="25px" Text="混凝土振動器" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label292" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton184" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" PostBackUrl="~/EReallocation_2.aspx" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label285" runat="server" Text="人力" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label277" runat="server" Height="25px" Text="混凝土作業工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label293" runat="server" Text="工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">0.04</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label286" runat="server" Text="人力" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label278" runat="server" Height="25px" Text="其他普通工及勞力工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label294" runat="server" Text="工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">0.1</td>
                                        </tr>
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px" />
                                            </td>
		<td class="SB_Cell1C_A">
                                    <asp:Label ID="Label287" runat="server" Text="雜項" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="Label279" runat="server" Height="25px" Text="工具損耗" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="Label295" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                            <td class="SB_Cell1R_A">1</td>
                                        </tr>
                                    </table>
            </td>
		</tr>
        <tr>
			<td class="Table1" colspan="2">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" PostBackUrl="~/ExeBudgetEdit_1.aspx" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預1.aspx" />
                                </td>
		</tr>
		    </table>
    
    </div>
    </form>
</body>
</html>
