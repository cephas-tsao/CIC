<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="addplace.aspx.cs" Inherits="IMS.Form.addplace" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
    <div>
        
        工地名稱：<asp:TextBox ID="placename" runat="server"></asp:TextBox>
        <br />
        地址：<asp:TextBox ID="p1" runat="server"></asp:TextBox>
        區 
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p2" runat="server"></asp:TextBox>
        棟<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p3" runat="server"></asp:TextBox>
        樓<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="p4" runat="server"></asp:TextBox>
        戶<br />
        工程：<asp:ListBox ID="ListBox1" runat="server" ></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="addprojectbtn" runat="server" OnClick="addprojectbtn_Click" Text="新增" />
          
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          
 </div>
        </div>
    </asp:Content>