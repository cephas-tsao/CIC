﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FirmMode.aspx.cs" Inherits="FirmMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>分包商管理模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="FirmView.aspx" Text="分包商資料檢視" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="FirmM.aspx" Text="分包商基本資料管理" />
    
                </td>
            </tr>
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="FirmAssess.aspx" Text="分包商遴選評估" />
                </td>
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="FirmCheck.aspx" Text="分包商考核" />
    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
