<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FFundIncreaseAssign.aspx.cs" Inherits="FFundIncreaseAssign" %>

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
                <td class="TableTop" colspan="8">計價單指定加款明細</td>
            </tr>
            <tr>
                <td class="Table1">&nbsp;</td>
                <td class="Table1">加款事由</td>
                <td class="Table1">加款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">加款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">加款總額</td>
                <td class="Table1">記錄人員</td>
            </tr>
            <tr>
                                            <td class="Table2CC">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text=" " />
                                            </td>
                                            <td class="Table2LC">
                                                                進度超前獎金</td>
                                            <td class="Table2CC">獎金</td>
                                            <td class="Table2CC">2015/12/9</td>
                                            <td class="Table2RC">5,000.00</td>
                                            <td class="Table2RC">250.00</td>
                                            <td class="Table2RC">5,250.00</td>
                                            <td class="Table2CC">王大遠</td>
                                        </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox2" runat="server" Enabled="False" Text=" " />
                </td>
                <td class="Table2LC">加班津貼</td>
                <td class="Table2CC">津貼</td>
                <td class="Table2CC">2015/9/1</td>
                <td class="Table2RC">30,000.00</td>
                <td class="Table2RC">1,500.00</td>
                <td class="Table2RC">31,500.00</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                </td>
                <td class="Table2LC">一定要給的</td>
                <td class="Table2CC">應加金額</td>
                <td class="Table2CC">2015/12/6</td>
                <td class="Table2RC">30,000.00</td>
                <td class="Table2RC">0</td>
                <td class="Table2RC">30,000.00</td>
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
