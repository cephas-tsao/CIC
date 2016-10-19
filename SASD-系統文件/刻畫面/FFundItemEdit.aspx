<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FFundItemEdit.aspx.cs" Inherits="FFundItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server">
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="13">分包商計價單-估驗明細修改</td>
            </tr>
            <tr>
                <td class="Table1">執行項次</td>
                <td class="Table1">工項名稱</td>
                <td class="Table1">單位</td>
                <td class="Table1">分包數量</td>
                <td class="Table1">分包單價</td>
                <td class="Table1">分包複價</td>
                <td class="Table1">前期累計數量</td>
                <td class="Table1">前期累計金額</td>
                <td class="Table1">本期完成數量</td>
                <td class="Table1">本期完成金額</td>
                <td class="Table1">本期累計數量</td>
                <td class="Table1">本期累計金額</td>
                <td class="Table1">備註</td>
            </tr>
            <tr>
                <td class="Table2CC">1</td>
                                            <td class="Table2LC">結構用混凝土，預拌，175kgf/cm2，第1型水泥</td>
                                            <td class="Table2CC">
                                                                <asp:Label ID="Label707" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M3"></asp:Label>
                                                            </td>
                                            <td class="Table2RC">100.00</td>
                                            <td class="Table2RC">3,170.00</td>
                                            <td class="Table2RC">317,000.00</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2CC">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2LC">
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
                                        </tr>
            <tr>
                <td class="Table2CC">2</td>
                                            <td class="Table2LC">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</td>
                                            <td class="Table2CC">
                                                                M</td>
                                            <td class="Table2RC">100.00</td>
                                            <td class="Table2RC">200.00</td>
                                            <td class="Table2RC">20,000.00</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2CC">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2LC">
                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
                                        </tr>
            <tr>
                <td class="Table2CC">3</td>
                                            <td class="Table2LC">推土機，140~149KW</td>
                                            <td class="Table2CC">
                                                                時</td>
                                            <td class="Table2RC">2.016</td>
                                            <td class="Table2RC">1,606.50</td>
                                            <td class="Table2RC">3,238.704</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2CC">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2LC">
                                                <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
                                        </tr>
            <tr>
                <td class="Table2CC">4</td>
                                            <td class="Table2LC">開挖機，履帶式，0.70~0.79m3，90~99KW</td>
                                            <td class="Table2CC">
                                                                時</td>
                                            <td class="Table2RC">100.00</td>
                                            <td class="Table2RC">661.50</td>
                                            <td class="Table2RC">66,150.00</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2CC">
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2RC">xxx.xx</td>
                                            <td class="Table2LC">
                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
                                        </tr>
            <tr>
                <td class="Table1" colspan="13">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="儲存修改" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="回復原值" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
