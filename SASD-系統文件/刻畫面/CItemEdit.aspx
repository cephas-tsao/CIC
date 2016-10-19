﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CItemEdit.aspx.cs" Inherits="CItemEdit" %>

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
                <td class="TableTop" colspan="4">合約預算-修改工項</td>
            </tr>
            <tr>
                <td class="Table1">階層</td>
                <td class="Table2">
                                <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" CssClass="DDLshort">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Selected="True">2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">上層工項</td>
                <td class="Table2">
                                <asp:DropDownList ID="DropDownList17" runat="server" CssClass="DDLfree">
                                    <asp:ListItem Value="1">壹 發包工程費</asp:ListItem>
                                </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="Table1">項次</td>
                <td class="Table2">
                                <asp:DropDownList ID="DropDownList18" runat="server" CssClass="DDLshort">
                                    <asp:ListItem>一</asp:ListItem>
                                    <asp:ListItem>二</asp:ListItem>
                                    <asp:ListItem Selected="True">三</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">工項類型</td>
                <td class="Table2">
                                <asp:DropDownList ID="DropDownList29" runat="server" CssClass="DDLfree" AutoPostBack="True" OnSelectedIndexChanged="DropDownList29_SelectedIndexChanged">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem" Selected="True">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="Table1">名稱</td>
                <td class="Table2" colspan="3">
                                <asp:TextBox ID="TextBox51" runat="server" CssClass="TB500">xxxxxxxxxxxxxxxxxx</asp:TextBox>
                            </td>
            </tr>
            <tr>
                <td class="Table1">單位</td>
                <td class="Table2">
                                <asp:DropDownList ID="DropDownList30" runat="server" CssClass="DDLfree">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">連結工料</td>
                <td class="Table2"><asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="工料連結設定" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="4">
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="儲存修改" />
&nbsp;
                    <asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" Text="回復原值" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
