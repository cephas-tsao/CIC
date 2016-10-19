<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OFundDebitAssign.aspx.cs" Inherits="OFundDebitAssign" %>

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
                <td class="TableTop" colspan="9">請款單指定扣款明細</td>
            </tr>
            <tr>
                <td class="Table1">&nbsp;</td>
                <td class="Table1">扣款事由</td>
                <td class="Table1">扣款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">扣款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">扣款總額</td>
                <td class="Table1">依據文號</td>
                <td class="Table1">記錄人員</td>
            </tr>
            <tr>
                                            <td class="Table2CC">
                                                <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                            </td>
                                            <td class="Table2LC">
                                                                勞安罰款</td>
                                            <td class="Table2CC">罰款</td>
                                            <td class="Table2CC">2015/10/30</td>
                                            <td class="Table2RC">200,000.00</td>
                                            <td class="Table2RC">0</td>
                                            <td class="Table2RC">200,000.00</td>
                                            <td class="Table2RC">台科工款字第104120001號</td>
                                            <td class="Table2CC">王大遠</td>
                                        </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox7" runat="server" Enabled="False" Text=" " />
                </td>
                <td class="Table2LC">扣回預支款項20%</td>
                <td class="Table2CC">預支款扣款</td>
                <td class="Table2CC">2015/07/01</td>
                <td class="Table2RC">100,000.00</td>
                <td class="Table2RC">5,000.00</td>
                <td class="Table2RC">105,000.00</td>
                <td class="Table2RC">台科工款字第104070003號</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox8" runat="server" Enabled="False" Text=" " />
                </td>
                <td class="Table2LC">扣回預支款項20%</td>
                <td class="Table2CC">預支款扣款</td>
                <td class="Table2CC">2015/08/01</td>
                <td class="Table2RC">100,000.00</td>
                <td class="Table2RC">5,000.00</td>
                <td class="Table2RC">105,000.00</td>
                <td class="Table2RC">台科工款字第104080002號</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked="True" Text=" " />
                </td>
                <td class="Table2LC">扣回預支款項20%</td>
                <td class="Table2CC">預支款扣款</td>
                <td class="Table2CC">2015/09/01</td>
                <td class="Table2RC">100,000.00</td>
                <td class="Table2RC">5,000.00</td>
                <td class="Table2RC">105,000.00</td>
                <td class="Table2RC">台科工款字第104090037號</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                </td>
                <td class="Table2LC">工程督導扣點</td>
                <td class="Table2CC">罰款</td>
                <td class="Table2CC">2015/12/01</td>
                <td class="Table2RC">6,000.00</td>
                <td class="Table2RC">300.00</td>
                <td class="Table2RC">6,300.00</td>
                <td class="Table2RC">台科工款字第104120099號</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked="True" Text=" " />
                </td>
                <td class="Table2LC">現場缺失罰款</td>
                <td class="Table2CC">罰款</td>
                <td class="Table2CC">2015/08/15</td>
                <td class="Table2RC">3,000.00</td>
                <td class="Table2RC">150.00</td>
                <td class="Table2RC">3,150.00</td>
                <td class="Table2RC">台科工款字第104080379號</td>
                <td class="Table2CC">王大遠</td>
            </tr>
            <tr>
                <td class="Table1" colspan="9">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="完成指定" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
