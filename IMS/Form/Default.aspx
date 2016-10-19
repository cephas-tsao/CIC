<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="Default.aspx.cs" Inherits="IMS.Form.Default" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
    

    <div dir="ltr">
        歡迎 
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;<br />
        <br />
    <asp:Button ID="Button4" runat="server" Text="工程項目表" OnClick="Button4_Click" Height="46px" Width="136px" />
        <br></br>
        <br></br>
     <asp:Button ID="Button1" runat="server" Text="檢核工程" OnClick="Button1_Click" Height="46px" Width="136px" />
         </div>
</div>

    </asp:Content>
