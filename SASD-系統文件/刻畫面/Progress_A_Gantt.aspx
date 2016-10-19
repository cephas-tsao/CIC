<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Progress_A_Gantt.aspx.cs" Inherits="Progress_A_Gantt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="Table1">預定進度版本</td>
                <td class="Table2LC">
                    <asp:DropDownList ID="DDL_S" runat="server" CssClass="DDLshort">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem Selected="True">3</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="Table1">實際進度版本</td>
                <td class="Table2LC">
                    <asp:DropDownList ID="DDL_S0" runat="server" CssClass="DDLshort">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem Selected="True">5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnFree" OnClick="Button1_Click" Text="桿狀圖繪製" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server" CssClass="LinkBtnA" Text="實際進度桿狀圖" Visible="False"></asp:Label>
        <br />
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Gantt1.png" Width="500px" Visible="False" />
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="LinkBtnA" Text="預定進度VS實際進度桿狀圖" Visible="False"></asp:Label>
        <br />
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Gantt3.png" Width="500px" Visible="False" />
    
    </div>
    </form>
</body>
</html>
