<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addproject.aspx.cs" Inherits="add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        工程項目表名稱：<asp:TextBox ID="projectname" runat="server" ></asp:TextBox>
        <asp:Button ID="addprojectbtn" runat="server" OnClick="addprojectbtn_Click" Text="新增" />
          
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          
    </form>
    
</body>
</html>
