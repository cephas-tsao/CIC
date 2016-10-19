<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OFundMode.aspx.cs" Inherits="OFundMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>業主請款模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="OFundView.aspx" Text="業主請款檢視" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="OFundEdit.aspx" Text="業主請款增修" />
    
                </td>
            </tr>
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="OFundDebitM.aspx" Text="業主扣款管理" />
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="OFundIncreaseM.aspx" Text="業主加款管理" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
