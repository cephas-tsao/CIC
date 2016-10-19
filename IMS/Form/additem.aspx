<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="additem.aspx.cs" Inherits="IMS.Form.additem1" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
    <div>
    工程項目：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
        <br />
        施工階段：<asp:DropDownList ID="phaseDropDownList" runat="server">
            
            <asp:ListItem>施工前</asp:ListItem>
            <asp:ListItem>施工中</asp:ListItem>
            <asp:ListItem>施工後</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        施工項目名稱：<asp:TextBox ID="itemname" runat="server"></asp:TextBox>
        <asp:Button ID="addnewitembtn" runat="server" Text="新增" OnClick="addnewitembtn_Click" /><asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
    </div>
 </div>
    </asp:Content>
