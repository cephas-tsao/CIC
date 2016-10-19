<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listplace.aspx.cs" Inherits="list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        工地工程表：<br />
        <asp:Button ID="Button1" runat="server" Text="新增工地" OnClick="Button1_Click"  />
        
        
<asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁">
        <asp:Label ID="Label2" runat="server"></asp:Label>
        </br>
    <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server">序號</asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" Wrap="False">工地</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">工程</asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server" >地址</asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server" >檢核</asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server" >歷史紀錄</asp:TableCell>
                 <asp:TableCell ID="TableCell7" runat="server" >修改
                 </asp:TableCell>
                 <asp:TableCell ID="TableCell8" runat="server" >刪除</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
