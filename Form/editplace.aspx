﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editplace.aspx.cs" Inherits="edititem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        工地名稱：<br />
    
         <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    
         <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
        
    </form>
</body>
</html>
