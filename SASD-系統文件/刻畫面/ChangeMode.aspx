<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeMode.aspx.cs" Inherits="ChangeMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>變更管理模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="ChangeCBudget.aspx" Text="合約預算變更" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="ChangeExeBudget.aspx" Text="執行預算變更" />
    
                </td>
            </tr>
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="ChangeSubBudget.aspx" Text="分包追加減" />
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="ProgressMode_new.aspx" Text="預定進度變更" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
