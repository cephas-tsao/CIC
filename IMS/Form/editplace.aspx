<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="editplace.aspx.cs" Inherits="IMS.Form.editplace" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
    <div>
    
        工地名稱：<br />
    
         <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    
         <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </div>
        
 </div>
    </asp:Content>