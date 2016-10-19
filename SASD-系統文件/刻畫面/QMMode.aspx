<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QMMode.aspx.cs" Inherits="QMMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>品質管理模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="QPlanM.aspx" Text="施工/品質計畫書管理" />
    
                </td>
                <td>
        <asp:Button ID="Button6" runat="server" CssClass="ModeBtn" PostBackUrl="QChecklistAdd.aspx" Text="自主檢查表建立" />
    
                </td>
                <td>
        <asp:Button ID="Button8" runat="server" CssClass="ModeBtn" PostBackUrl="QChecklistFill.aspx" Text="自主檢查表填報" />
    
                </td>
            </tr>
            </table>
        <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="QStaAnalysis.aspx" Text="統計分析" />
    
                </td>
                <td>
        <asp:Button ID="Button7" runat="server" CssClass="ModeBtn" PostBackUrl="QMissTrack.aspx" Text="缺失改善追蹤" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
