<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FFundDebitAssign.aspx.cs" Inherits="FFundDebitAssign" %>

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
                <td class="TableTop" colspan="8">計價單指定扣款明細</td>
            </tr>
            <tr>
                <td class="Table1">&nbsp;</td>
                <td class="Table1">扣款事由</td>
                <td class="Table1">扣款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">扣款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">扣款總額</td>
                <td class="Table1">記錄人員</td>
            </tr>
            <tr>
                                            <td class="Table2CC">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Enabled="False" Text=" " />
                                            </td>
                                            <td class="Table2LC">
                                                                臨時水電費</td>
                                            <td class="Table2CC">代支代付</td>
                                            <td class="Table2CC">2015/10/1</td>
                                            <td class="Table2RC">1,200.00</td>
                                            <td class="Table2RC">0</td>
                                            <td class="Table2RC">1,200.00</td>
                                            <td class="Table2CC">王大遠</td>
                                        </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Text=" " />
                </td>
                <td class="Table2LC">點工</td>
                <td class="Table2CC">代雇工扣款</td>
                <td class="Table2CC">2015/10/15</td>
                <td class="Table2RC">10,000.00</td>
                <td class="Table2RC">500.00</td>
                <td class="Table2RC">10,500.00</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                </td>
                <td class="Table2LC">勞安罰款</td>
                <td class="Table2CC">罰款</td>
                <td class="Table2CC">2015/10/30</td>
                <td class="Table2RC">200,000.00</td>
                <td class="Table2RC">0</td>
                <td class="Table2RC">200,000.00</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table1" colspan="8">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="完成指定" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
