<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_Prediction.aspx.cs" Inherits="IMS.AI_Prediction" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/AI.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>人工智慧推論</title>
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
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx', 'content1')">建築成本概算</a></li>
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx?value=深開挖壁體變位預測', 'content1')">深開挖壁體變位預測</a></li>
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx?value=專案現金流量預測', 'content1')">專案現金流量預測</a></li>
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx?value=專案完工總成本預測', 'content1')">專案完工總成本預測</a></li>
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx?value=專案完工工期推論', 'content1')">專案完工工期推論</a></li>
            <li><a href="AI_Model.aspx" target="content1" onclick="window.open('AI_Model.aspx?value=營造廠專業協力廠商評鑑', 'content1')">營造廠專業協力廠商評鑑</a></li>
        </ul>   
      <iframe src="AI_Model.aspx" name="content1" frameborder="0" scrolling="yes" noresize="noresize" width="100%" height="800px"></iframe>
 </div>
</div>



</asp:Content>