<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewSubBudget.aspx.cs" Inherits="AddNewSubBudget" %>

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
			<td class="TableTop" colspan="4">新增分包預算</td>
		</tr>
		<tr>
		<td class="Table1">
                                分包預算編號</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
            <td class="Table1">
                                分包預算名稱</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                承攬方式</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="RadioButtonList1" runat="server" CssClass="DDLshort">
                                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                                        <asp:ListItem>實做實算</asp:ListItem>
                                                        <asp:ListItem>總價承攬</asp:ListItem>
                                                        <asp:ListItem>實做+總價</asp:ListItem>
                                                        <asp:ListItem>統包</asp:ListItem>
                                                        <asp:ListItem>其他</asp:ListItem>
                                                    </asp:DropDownList>
            </td>
            <td class="Table1">
                採購負責人</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="DepartmentName" DataValueField="DepartmentName"  CssClass="DDLshort" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                                        <asp:ListItem>-請選擇部門-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
                                                    <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name"  CssClass="DDLshort">
                                                        <asp:ListItem>-請選擇部門人員-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList7" Name="Department" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="Table1">
                                預定進場日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
            <td class="Table1">
                預定完成發包日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
            <td class="Table1">
                                最遲完成發包期限</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1" colspan="6">
                                分包工料</td>
		</tr>
		<tr>
		<td class="auto-style3" colspan="6">
                                    <table class="SB_Table_M">
                                        <tr class="SB_RowTop_M">
                                            <td>&nbsp;</td>
                                            <td>工項/工料名稱</td>
                                            <td>單位</td>
                                            <td>所屬工項</td>
                                            <td>數量</td>
                                            <td>預算單價</td>
                                            <td>預算複價</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button35" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">結構用混凝土，預拌，175kgf/cm2，第1型水泥</td>
                                            <td class="ShtCellCC">
                                                                <asp:Label ID="Label706" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M3"></asp:Label>
                                                            </td>
                                            <td class="ShtCellCL">[全工項發包]</td>
                                            <td class="ShtCellCR">100.00</td>
                                            <td class="ShtCellCR">3,170.00</td>
                                            <td class="ShtCellCR">317,000.00</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button36" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</td>
                                            <td class="ShtCellCC">
                                                                M</td>
                                            <td class="ShtCellCL">壹.一.1.1.清除及掘除-機具</td>
                                            <td class="ShtCellCR">100.00</td>
                                            <td class="ShtCellCR">200.00</td>
                                            <td class="ShtCellCR">20,000.00</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button37" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">推土機，140~149KW</td>
                                            <td class="ShtCellCC">
                                                                時</td>
                                            <td class="ShtCellCL">壹.一.1.1.清除及掘除-機具</td>
                                            <td class="ShtCellCR">2.016</td>
                                            <td class="ShtCellCR">1,606.50</td>
                                            <td class="ShtCellCR">3,238.704</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                                <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Text="刪除" CssClass="BtnFree" />
                                            </td>
                                            <td class="ShtCellCL">開挖機，履帶式，0.70~0.79m3，90~99KW</td>
                                            <td class="ShtCellCC">
                                                                時</td>
                                            <td class="ShtCellCL">壹.一.2.基地及路幅開挖，未含運費</td>
                                            <td class="ShtCellCR">100.00</td>
                                            <td class="ShtCellCR">661.50</td>
                                            <td class="ShtCellCR">66,150.00</td>
                                        </tr>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC" colspan="6">合計</td>
                                            <td class="ShtCellCR">x,xxx.xxx</td>
                                        </tr>
                                    </table>
                                                    </td>
		</tr>
		<tr>
		<td class="Table1" colspan="6">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增分包預算" PostBackUrl="~/採發1.aspx" CssClass="BtnLargeMedium" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/採發1_4.aspx" CssClass="BtnLargeMedium" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
