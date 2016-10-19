<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidBudgetMode.aspx.cs" Inherits="BidBudgetMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>投標預算模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="BidLibrary.aspx" Text="標案工料資料庫" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="BidBudgetEdit.aspx" Text="投標預算建置編修" />
    
                </td>
            </tr>
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="RFQM.aspx" Text="詢價單管理" />
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="BidBudgetView.aspx" Text="投標預算檢視" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
