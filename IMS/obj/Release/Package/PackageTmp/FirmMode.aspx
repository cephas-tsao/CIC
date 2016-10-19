<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirmMode.aspx.cs" Inherits="IMS.FirmMode" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/FirmMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商管理</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
         <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <%-- <nav>	
    <ul id="menu">
    <li><asp:LinkButton ID="F01" runat="server" Text="基本資料管理" PostBackUrl="~/FirmView.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="F02" runat="server" Text="包商資料管理" PostBackUrl="~/FirmM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F03" runat="server" Text="遴選評估(初評)" PostBackUrl="~/FirmAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F04" runat="server" Text="遴選評估(複評)" PostBackUrl="~/FirmSecAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F05" runat="server" Text="分包商考核(初評)" PostBackUrl="~/FirmCheck.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F06" runat="server" Text="分包商考核(複評)" PostBackUrl="~/FirmSecCheck.aspx"></asp:LinkButton><br /></li>
            </ul>
         </nav>--%>
</asp:Content>
