﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checklisthistory.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
   
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: medium">
        歡迎 
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" Visible="False" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁">
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        </br>
        工地名稱：<asp:Label ID="Label1" runat="server" Text="" align="left" ></asp:Label>
        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
        <br />
        工程名稱：<asp:Label runat="server" id="Label4"></asp:Label>
    
        <asp:Label runat="server" id="Label2"></asp:Label>
    
    
        <br />
        <br />
        選擇紀錄：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        
        
        <asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" Height="21px" Width="78px" />
        
        
        <br />
        
        
        <asp:Label runat="server" id="Label3" />
        
        
    </div>
    </form>
</body>
</html>
