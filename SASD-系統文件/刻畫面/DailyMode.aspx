<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DailyMode.aspx.cs" Inherits="DailyMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>日報管理模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="DailyFill.aspx" Text="日報填寫" />
                </td>
                <td>
        <asp:Button ID="Button7" runat="server" CssClass="ModeBtn" PostBackUrl="DailyView.aspx" Text="日報檢視" />
    
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="DailyWeatherView.aspx" Text="晴雨表總覽" />
    
                </td>
            </tr>
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button6" runat="server" CssClass="ModeBtn" PostBackUrl="DailyWorkPicView.aspx" Text="施工照片總覽" />
    
                </td>
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="DailyTestView.aspx" Text="檢驗取樣記錄總覽" />
    
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="DailySetting.aspx" Text="日報常用設定" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
