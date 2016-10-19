<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div dir="ltr">
        歡迎 
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;<br />
        <br />
    <asp:Button ID="Button4" runat="server" Text="工程項目表" OnClick="Button4_Click" Height="46px" Width="136px" /></br></br>
     <asp:Button ID="Button1" runat="server" Text="檢核工程" OnClick="Button1_Click" Height="46px" Width="136px" />
         </div>
    </form>
   
</body>
</html>
