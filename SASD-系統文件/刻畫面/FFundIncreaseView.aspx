<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FFundIncreaseView.aspx.cs" Inherits="FFundIncreaseView" %>

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
                <td class="TableTop" colspan="7">分包商計價加款明細檢視</td>
            </tr>
            <tr>
                <td class="Table1">加款事由</td>
                <td class="Table1">加款類型</td>
                <td class="Table1">發生日期</td>
                <td class="Table1">加款金額</td>
                <td class="Table1">稅金</td>
                <td class="Table1">加款總額</td>
                <td class="Table1">記錄人員</td>
            </tr>
            <tr>
                                            <td class="Table2LC">進度超前獎金</td>
                                            <td class="Table2CC">
                                                                獎金</td>
                                            <td class="Table2CC">2015/12/9</td>
                                            <td class="Table2RC">5,000.00</td>
                                            <td class="Table2RC">250.00</td>
                                            <td class="Table2RC">5,250.00</td>
                                            <td class="Table2CC">王大遠</td>
                                        </tr>
            <tr>
                <td class="Table2LC">加班津貼</td>
                <td class="Table2CC">津貼</td>
                <td class="Table2CC">2015/9/1</td>
                <td class="Table2RC">30,000.00</td>
                <td class="Table2RC">1,500.00</td>
                <td class="Table2RC">31,500.00</td>
                <td class="Table2CC">王大遠</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
