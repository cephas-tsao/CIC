<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OFundDebitView.aspx.cs" Inherits="OFundDebitView" %>

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
                <td class="TableTop" colspan="9">業主請款扣款明細檢視</td>
            </tr>
            <tr>
                <td class="Table1">扣款事由</td>
                <td class="Table1">扣款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">扣款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">扣款總額</td>
                <td class="Table1">依據文號</td>
                <td class="Table1">記錄人員</td>
                <td class="Table1">備註</td>
            </tr>
            <tr>
                                            <td class="Table2LC">扣回預支款項20%</td>
                                            <td class="Table2CC">
                                                                預支款扣款</td>
                                            <td class="Table2CC">2015/09/01</td>
                                            <td class="Table2RC">100,000.00</td>
                                            <td class="Table2RC">5,000.00</td>
                                            <td class="Table2RC">105,000.00</td>
                                            <td class="Table2RC">台科工款字第104090037號</td>
                                            <td class="Table2CC">王大遠</td>
                                            <td class="Table2CC">請款指定尚未核撥</td>
                                        </tr>
            <tr>
                <td class="Table2LC">現場缺失罰款</td>
                <td class="Table2CC">罰款</td>
                <td class="Table2CC">2015/08/15</td>
                <td class="Table2RC">3,000.00</td>
                <td class="Table2RC">150.00</td>
                <td class="Table2RC">3,150.00</td>
                <td class="Table2RC">台科工款字第104080379號</td>
                <td class="Table2CC">王大遠</td>
                <td class="Table2CC">請款指定已核撥</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
