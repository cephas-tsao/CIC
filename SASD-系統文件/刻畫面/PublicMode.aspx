<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PublicMode.aspx.cs" Inherits="PublicMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>共用功能模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    
        <table class="Table100" style="text-align: center;vertical-align:central;">
            <tr style="height:500px;">
                <td>
    
        <asp:Button ID="Button1" runat="server" CssClass="ModeBtn" PostBackUrl="PriceAnalysis.aspx" Text="共用工料管理" />
                </td>
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="WordLibrary.aspx" Text="常用詞庫管理" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="ConIllLibrary.aspx" Text="施工圖元件庫" />
    
                </td>
            </tr>
        </table>
            
    </div>
    </form>
</body>
</html>
