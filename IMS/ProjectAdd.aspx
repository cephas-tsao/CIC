<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectAdd.aspx.cs" Inherits="IMS.ProjectAdd1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="2">新增專案</td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)編號</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectCode" runat="server" CssClass="TBlong"></asp:TextBox>
		            <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)名稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectName" runat="server" CssClass="TBlong"></asp:TextBox>
                    <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)簡稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectNickname" runat="server" CssClass="TBlong"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1">備註</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxNote" runat="server" CssClass="TBlong" Height="100px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="2">
                    <asp:Button ID="ADD" runat="server" CssClass="BtnLargeShort" Text="確定新增"  OnClick="SaveAction"/>
&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="返回前頁" OnClientClick="window.close()"/>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>