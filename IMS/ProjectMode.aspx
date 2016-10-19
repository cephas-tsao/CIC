<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProjectMode.aspx.cs" Inherits="IMS.ProjectMode" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <Area:Project ID="ProjectBox" runat="server" /> 
   <%-- <nav>
        <ul id="menu">
     <li><asp:LinkButton ID="PM01" runat="server" Text="標案轉入" PostBackUrl="~/ProjectBidIn.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="PM02" runat="server" Text="專案資料管理" PostBackUrl="~/ProjectInfoM.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="PM03" runat="server" Text="專案基本資料檢視" PostBackUrl="~/ProjectInfo1View.aspx"></asp:LinkButton><br /></li>  
    <li><asp:LinkButton ID="PM04" runat="server" Text="工程合約資料檢視" PostBackUrl="~/ProjectInfo2View.aspx"></asp:LinkButton><br /></li>
      <li><asp:LinkButton ID="PM05" runat="server" Text="專案工料資料庫" PostBackUrl="~/ProLibrary.aspx"></asp:LinkButton><br /></li>
</ul>
</nav>--%>
</asp:Content>