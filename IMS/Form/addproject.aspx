<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="addproject.aspx.cs" Inherits="IMS.Form.addproject" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
    <div>
        
        工程項目表名稱：<asp:TextBox ID="projectname" runat="server" ></asp:TextBox>
        <asp:Button ID="addprojectbtn" runat="server" OnClick="addprojectbtn_Click" Text="新增" />
          
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          
  </div>
        </div>
    </asp:Content>