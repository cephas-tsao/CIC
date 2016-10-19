<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OFundIncreaseView.aspx.cs" Inherits="OFundIncreaseView" %>

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
                <td class="TableTop" colspan="9">業主請款加款明細檢視</td>
            </tr>
            <tr>
                <td class="Table1">加款事由</td>
                <td class="Table1">加款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">加款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">加款總額</td>
                <td class="Table1">依據文號</td>
                <td class="Table1">記錄人員</td>
                <td class="Table1">備註</td>
            </tr>
            <tr>
                                            <td class="Table2LC">進度超前獎金</td>
                                            <td class="Table2CC">
                                                                獎金</td>
                                            <td class="Table2CC">2015/08/10</td>
                                            <td class="Table2RC">50,000.00</td>
                                            <td class="Table2RC">2,500.00</td>
                                            <td class="Table2RC">52,500.00</td>
                                            <td class="Table2RC">台科工款字第104080079號</td>
                                            <td class="Table2CC">王大遠</td>
                                            <td class="Table2CC">請款指定尚未核撥</td>
                                        </tr>
            <tr>
                <td class="Table2LC">加班津貼</td>
                <td class="Table2CC">津貼</td>
                <td class="Table2CC">2015/08/22</td>
                <td class="Table2RC">30,000.00</td>
                <td class="Table2RC">1,500.00</td>
                <td class="Table2RC">31,500.00</td>
                <td class="Table2RC">台科工款字第104080173號</td>
                <td class="Table2CC">王大遠</td>
                <td class="Table2CC">請款指定已核撥</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
