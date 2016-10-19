<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidMode.aspx.cs" Inherits="BidMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>標案管理模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="BidInfo1.aspx" Text="未成案訊息管理" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="BidInfoM.aspx" Text="標案資訊管理" />
    
                </td>
                <td>
        <asp:Button ID="Button6" runat="server" CssClass="ModeBtn" PostBackUrl="BidPreAssess.aspx" Text="投標評估(初評)" />
    
                </td>
                <td>
        <asp:Button ID="Button8" runat="server" CssClass="ModeBtn" PostBackUrl="BidRAssess.aspx" Text="投標評估(複評)" />
    
                </td>
            </tr>
            </table>
        <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="BidRecord.aspx" Text="決標紀錄" />
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="BidView.aspx" Text="標案綜合檢視" />
    
                </td>
                <td>
        <asp:Button ID="Button7" runat="server" CssClass="ModeBtn" PostBackUrl="BidSetting.aspx" Text="常用資料維護" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
