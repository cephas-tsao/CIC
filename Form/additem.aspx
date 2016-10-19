<%@ Page Language="C#" AutoEventWireup="true" CodeFile="additem.aspx.cs" Inherits="additem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    工程項目：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
        <br />
        施工階段：<asp:DropDownList ID="phaseDropDownList" runat="server">
            
            <asp:ListItem>施工前</asp:ListItem>
            <asp:ListItem>施工中</asp:ListItem>
            <asp:ListItem>施工後</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        施工項目名稱：<asp:TextBox ID="itemname" runat="server"></asp:TextBox>
        <asp:Button ID="addnewitembtn" runat="server" Text="新增" OnClick="addnewitembtn_Click" /><asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
