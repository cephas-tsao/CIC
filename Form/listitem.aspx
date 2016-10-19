<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listitem.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: 28px">
        工程名稱：<asp:Label ID="Label1" runat="server" align="left" style="font-size:25px"></asp:Label>
        <asp:Label runat="server" id="Label2"></asp:Label></br>

   <asp:Button ID="Button1" runat="server" Text="新增項目" OnClick="Button1_Click1" />
        <asp:Button ID="Button2" runat="server" Text="修改項目" OnClick="Button2_Click"  />
        <asp:Button ID="Button3" runat="server" Text="刪除項目" OnClick="Button3_Click"  />
<asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click1" /> </br>
       

        <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server" Wrap="False">序號</asp:TableCell>
                <asp:TableCell runat="server">項目</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        
        
        
        
     

        
        
        
        

        
        
        
        <asp:Label runat="server" ID="Label3" />
        <asp:Label ID="Label4" runat="server"></asp:Label>

        
        
        
    </div>
    </form>
</body>
</html>
