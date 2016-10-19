<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompletionMode.aspx.cs" Inherits="CompletionMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>竣工驗收模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="CompletionFill.aspx" Text="竣工數量填列" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="AcceptanceM.aspx" Text="驗收紀錄管理" />
    
                </td>
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="AcceptanceView.aspx" Text="驗收紀錄檢視" />
    
                </td>
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
