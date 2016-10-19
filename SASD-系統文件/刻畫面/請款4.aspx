<%@ Page Language="C#" AutoEventWireup="true" CodeFile="請款4.aspx.cs" Inherits="請款4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 34px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 34px;
        }
    </style>
    </head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop">業主請款加款管理</td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server">
        
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">新增加款紀錄</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_Insert" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">加款事由</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Subject" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">加款類型</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Style" runat="server" CssClass="DDLshort">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>獎金</asp:ListItem>
                            <asp:ListItem>津貼</asp:ListItem>
                            <asp:ListItem>應加金額</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">發生日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Date" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">依據文號</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Docu" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">加款金額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Price" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">稅金</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Tax" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <asp:Button ID="Button4" runat="server" CssClass="BtnFree" OnClick="Button4_Click" Text="5%自動計算" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1">加款總額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_SumPrice" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <asp:Button ID="Button5" runat="server" CssClass="BtnFree" OnClick="Button5_Click" Text="自動合計" />
                    </td>
                    <td class="Table1">&nbsp;</td>
                    <td class="Table2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="確定新增" />
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click">加款紀錄總覽</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_View" runat="server">
            <table class="Table100">
                <tr>
                    <td class="Table2C">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="編輯/刪除" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"BelongOFID"))==0)? true:false %>' OnClick="Button1_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="加款類型" HeaderText="加款類型" SortExpression="加款類型" />
                                <asp:BoundField DataField="加款事由" HeaderText="加款事由" SortExpression="加款事由" />
                                <asp:BoundField DataField="發生日期" HeaderText="發生日期" SortExpression="發生日期" />
                                <asp:BoundField DataField="加款總額" HeaderText="加款總額" SortExpression="加款總額" />
                                <asp:BoundField DataField="記錄人員" HeaderText="記錄人員" SortExpression="記錄人員" />
                                <asp:BoundField DataField="請款單號" HeaderText="請款單號" SortExpression="請款單號" />
                                <asp:BoundField DataField="請款期別" HeaderText="請款期別" SortExpression="請款期別" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT OFund_Modify.Type AS 加款類型, OFund_Modify.Subject AS 加款事由, OFund_Modify.Date AS 發生日期, OFund_Modify.SumPrice AS 加款總額, OFund_Modify.Recorder AS 記錄人員, OFund_Main.OF_Code AS 請款單號, OFund_Main.OF_Edition AS 請款期別, OFund_Modify.OF_MID, OFund_Modify.BelongOFID FROM OFund_Modify LEFT OUTER JOIN OFund_Main ON OFund_Modify.BelongOFID = OFund_Main.OFID WHERE (OFund_Modify.PID = @PID) AND (OFund_Modify.IncreaseDebit = @IncreaseDebit) ORDER BY OFund_Modify.OF_MID DESC">
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                                <asp:Parameter DefaultValue="I" Name="IncreaseDebit" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="Table2R">註：已請款之加款紀錄無法編輯或刪除</td>
                </tr>
                <tr>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Update" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table0" colspan="4">
                                        <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White">編輯加款紀錄</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">加款事由</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Subject0" runat="server" CssClass="TB500">屬業主應支付之雜支</asp:TextBox>
                                    </td>
                                    <td class="Table1">加款類型</td>
                                    <td class="Table2">
                                        <asp:DropDownList ID="DDL_Style0" runat="server" CssClass="DDLshort">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem>獎金</asp:ListItem>
                                            <asp:ListItem>津貼</asp:ListItem>
                                            <asp:ListItem Selected="True">應加金額</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">發生日期</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Date0" runat="server" CssClass="TBmiddle">2015/12/9</asp:TextBox>
                                    </td>
                                    <td class="Table1">依據文號</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Docu0" runat="server" CssClass="TBlong">台科工款字第104120039號</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">加款金額</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Price0" runat="server" CssClass="TBmiddle">30,000</asp:TextBox>
                                    </td>
                                    <td class="Table1">稅金</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Tax0" runat="server" CssClass="TBmiddle">1,500</asp:TextBox>
                                        <asp:Button ID="Button6" runat="server" CssClass="BtnFree" OnClick="Button6_Click" Text="5%自動計算" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">加款總額</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_SumPrice0" runat="server" CssClass="TBmiddle">31,500</asp:TextBox>
                                        <asp:Button ID="Button7" runat="server" CssClass="BtnFree" OnClick="Button7_Click" Text="自動合計" />
                                    </td>
                                    <td class="Table1">&nbsp;</td>
                                    <td class="Table2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="Table1" colspan="4">
                                        <asp:Button ID="Button8" runat="server" CssClass="BtnLargeShort" Text="確定修改" />
                                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button9" runat="server" CssClass="BtnLargeShort" Text="回復原值" />
                                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button10" runat="server" CssClass="BtnLargeShort" Text="刪除紀錄" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
