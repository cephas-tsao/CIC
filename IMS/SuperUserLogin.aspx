<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SuperUserLogin.aspx.cs" Inherits="IMS.SuperUserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>後台登入頁面</title>
    <link href="CSS/Login.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login_panel">
            <asp:Panel ID="Panel1" runat="server" Width="220px" Height="94px">
                <asp:Label runat="server" Text="後台登入"></asp:Label><br />
                <asp:Label ID="Lbl_Name" runat="server" Text="帳號"></asp:Label>
                <asp:TextBox ID="TB_Name" runat="server"></asp:TextBox><br />
                <asp:Label ID="Lbl_Password" runat="server" Text="密碼"></asp:Label>
                <asp:TextBox ID="TB_Password" runat="server" TextMode="Password"></asp:TextBox><br />
                <asp:Button ID="Btn_submit" runat="server" Text="登入" OnClick="Btn_submit_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_reset" runat="server" Text="重置" OnClick="Btn_reset_Click" /><br />
                <asp:Label ID="Lbl_Error" runat="server" Text="錯誤訊息" Visible="false" ForeColor="Red"></asp:Label><br />
            </asp:Panel>
        </div>
</asp:Content>
