<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivitySetting_3.aspx.cs" Inherits="ActivitySetting_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">作業項目設定</td>
		</tr>
       
		<tr>
		<td class="Table1L">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存" Width="27px" />
                                &nbsp; <asp:Image ID="IBtn_Lock" runat="server" Height="30px" Width="27px" TabIndex="0" Enabled="False" />
                                </td>
		<td class="Table1R">
                                    <asp:DropDownList ID="DDL_EWBS" runat="server" CssClass="DDLlong">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                        <asp:ListItem>構用混凝土，預拌，2 140kgf/cm2，第1型水泥</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ImageButton ID="IBtn_AddNew" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="儲存" Width="27px" />
                                </td>
		</tr>
		</table>
    
                        <table id="ActivityTable" border="1" class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">編輯</td>
                                <td class="ShtCellCC" colspan="2">執行預算工項</td>
                                <td class="ShtCellCC">作業項目名稱</td>
                                <td class="ShtCellCC">分攤工項比例</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A1" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D1" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    1</td>
                                <td class="ShtCellCL">
                                    構造物開挖，(含抽排水，依設計圖說計價線)</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N1" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P1" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A3" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D3" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    3.1</td>
                                <td class="ShtCellCL">
                                    B1F-175混凝土</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N3" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P3" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A4" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D4" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    3.2</td>
                                <td class="ShtCellCL">
                                    1F-175混凝土</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N4" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P4" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A5" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D5" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    4.1</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label268" runat="server" Height="25px" Text="B1-鋼筋" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N5" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P5" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A6" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D6" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    4.2</td>
                                <td class="ShtCellCL">
                                    1F-鋼筋</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N6" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P6" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A7" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D7" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    5.1</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label262" runat="server" Height="25px" Text="B1-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N7" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P7" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A8" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" />
                                    <asp:ImageButton ID="IBtn_D8" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    5.2</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label264" runat="server" Height="25px" Text="1F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N8" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P8" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A9" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" PostBackUrl="~/ActivitySetting_1.aspx" />
                                    <asp:ImageButton ID="IBtn_D9" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    5.3</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label266" runat="server" Height="25px" Text="2F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N9" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P9" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A10" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" PostBackUrl="~/EReallocation.aspx" />
                                    <asp:ImageButton ID="IBtn_D10" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    6</td>
                                <td class="ShtCellCL">
                                    鋼製模板</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N10" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P10" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A11" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" PostBackUrl="~/EReallocation.aspx" />
                                    <asp:ImageButton ID="IBtn_D11" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" />
                                </td>
                                <td class="ShtCellCC">
                                    2</td>
                                <td class="ShtCellCL">
                                    結構用混凝土，預拌，140kgf/cm2，第1型水泥</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N11" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P11" runat="server" CssClass="TBshort" style="text-align:center"></asp:TextBox>
                                    ％</td>
                            </tr>
                            </table>
    </div>
    </form>
</body>
</html>
