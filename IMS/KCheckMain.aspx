<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KCheckMain.aspx.cs" Inherits="IMS.WebForm1" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/KCheckMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />  
    </div>
</asp:Content>

