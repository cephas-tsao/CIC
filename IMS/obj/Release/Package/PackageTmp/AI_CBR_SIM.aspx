<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_CBR_SIM.aspx.cs" Inherits="IMS.AI_CBR_SIM" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/AI.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>爭議案例</title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<Area:MemberBoxUC ID="MemberBox" runat="server" />    
 <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" href="CSS/Jquery-ui.theme.css" />
    <script>
        $(document).ready(function () {
            $("#tabs").tabs({
                activate: function () {
                    var selectedTab = $("#tabs").tabs('option', 'active');
                    $("#<%= hdnSelectedTab.ClientID %>").val(selectedTab);
                },
                active: $("#<%= hdnSelectedTab.ClientID %>").val()
            });
        });
    </script>
<div >
      <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li><a href="http://140.118.5.165:83/case_manage/case_manage.asp" target="content1" onclick="window.open('http://140.118.5.165:83/case_manage/case_manage.asp', 'content1')" >案例管理</a></li>
            <li><a href="http://140.118.5.165:83/dispute/cause.asp"  target="content1"  onclick="window.open('http://140.118.5.165:83/dispute/cause.asp', 'content1')">佐證資料查詢</a></li>
            <li><a href="http://140.118.5.165:83/STATISTIC/statistic.htm"  target="content1" onclick="window.open('http://140.118.5.165:83/STATISTIC/statistic.htm', 'content1')" >案例統計分析</a></li>
            <li><a href="http://140.118.5.165:83/SEARCH/SIMNEW2.asp"  target="content1"  onclick="window.open('http://140.118.5.165:83/SEARCH/SIMNEW2.asp', 'content1')" >相似案例搜尋</a></li>
        </ul>   
      <iframe src="http://140.118.5.165:83/case_manage/case_manage.asp" name="content1" frameborder="0" scrolling="yes" noresize="noresize" width="100%" height="800px"></iframe>
 </div>
</div>


</asp:Content>
