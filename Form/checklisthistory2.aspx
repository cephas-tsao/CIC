<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checklisthistory2.aspx.cs" Inherits="test" %>

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
        <asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁">
        <br />
        </br>
        工地名稱：<asp:Label ID="Label1" runat="server" Text="" align="left" ></asp:Label>
        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
        <br />
        工程名稱：<asp:Label runat="server" id="Label4"></asp:Label>
    
        <asp:Label runat="server" id="Label2"></asp:Label>
    
        <br />
        日期：<asp:Label ID="Label7" runat="server"></asp:Label>
        
        <br />
        檢核人員：<asp:Label ID="Label10" runat="server"></asp:Label>
        
        <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">序號</asp:TableCell>
                <asp:TableCell runat="server">項目</asp:TableCell>
                <asp:TableCell runat="server">完成度</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        
        
        
        
        
        
        
        
        
        
        <br />
        
        
        <asp:Button ID="Button1" runat="server" Text="輸出word檔" OnClick="Button1_Click" Height="23px" Width="114px" />
        <asp:Label runat="server" id="Label3" />
        
        
        <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label9" runat="server" Visible="False"></asp:Label>
        
        
    </div>
    </form>
</body>
</html>
