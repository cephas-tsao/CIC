<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addplace.aspx.cs" Inherits="add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        工地名稱：<asp:TextBox ID="placename" runat="server"></asp:TextBox>
        <br />
        地址：<asp:TextBox ID="p1" runat="server"></asp:TextBox>
        區 
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p2" runat="server"></asp:TextBox>
        棟<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p3" runat="server"></asp:TextBox>
        樓<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p4" runat="server"></asp:TextBox>
        戶<br />
        工程：<asp:ListBox ID="ListBox1" runat="server" ></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="addprojectbtn" runat="server" OnClick="addprojectbtn_Click" Text="新增" />
          
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          
    </form>
    
</body>
</html>
