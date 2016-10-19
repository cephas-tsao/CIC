<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailyWeatherView.aspx.cs" Inherits="IMS.DailyWeatherView" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>晴雨表總覽</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSunRain.css" />
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    </div>
    <div > 
        <table class="Table100">
            <tr>
                <td colspan="9" class="TableTop">晴雨表總覽</td>
            </tr>
            <tr>
                <td class="Table1">
                    圖<br />
                    例</td>
                <td class="Table2CC">
                    <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/img/Sun.jpg" Width="30px" />
                    晴天</td>
                <td class="Table2CC">
                    <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/img/Cloud.jpg" Width="30px" />
                    陰天</td>
                <td class="Table2CC">
                    <asp:Image ID="Image3" runat="server" Height="30px" ImageUrl="~/img/Rain.jpg" Width="30px" />
                    雨天</td>
                <td class="Table2CC">
                    <asp:Image ID="Image4" runat="server" Height="30px" ImageUrl="~/img/Typhoon.jpg" Width="30px" />
                    颱風</td>
                <td class="Table2CC">
                    <asp:Image ID="Image5" runat="server" Height="30px" ImageUrl="~/img/Snow.jpg" Width="30px" />
                    雪</td>
                <td class="Table2CC">
                    <asp:Image ID="Image6" runat="server" Height="30px" ImageUrl="~/img/Weekend.jpg" Width="30px" />
                    假日</td>
                <td class="Table1">顯示年份</td>
                <td class="Table2CC">
                    <asp:DropDownList ID="DDL_Year" runat="server" CssClass="DDLshort" style="text-align: center" AutoPostBack="True" OnSelectedIndexChanged="DDL_Year_SelectedIndexChanged">
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="Table1">
                    <asp:ImageButton ID="ImageButton133" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton133_Click" />
                                &nbsp;
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton132_Click" />
                </td>
            </tr>
        </table>
        <table id="Show_Weather" class="Table101">
        </table>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>   
    </div>
</asp:Content>




