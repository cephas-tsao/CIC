<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListWSave.aspx.cs" Inherits="IMS.KCheckListWSave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
     <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet" />
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
  <script type="text/javascript" src="http://mybidrobot.allalla.com/jquery/jquery.ui.datepicker-zh-TW.js"></script>
  <style>
    article,aside,figure,figcaption,footer,header,hgroup,menu,nav,section {display:block;}
   
  </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox1").datepicker();
            $("#TextBox1").attr("ReadOnly", true);
        });
        
  </script>
    <style type="text/css">

        .Table2CC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align:central;
        }
        .TableRow {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #507CD1;
            text-align: center;
            color: #FFFFFF;
            vertical-align:central;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
   <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">
            <asp:Label ID="ProjectLabel" runat="server"></asp:Label>
            <asp:Label ID="ProjectidLabel" runat="server"></asp:Label>
            自主檢查表填報</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">自主檢查表：</td>
		<td class="Table2" style="height: 22px">
		<asp:Label ID="EngineeringLabel" runat="server"></asp:Label>
		    <asp:Label ID="EngineeringidLabel" runat="server" Visible="False"></asp:Label>
		<span class="NoteText"></span>
            <asp:Label ID="personLabel" runat="server" Visible="False"></asp:Label>
		<asp:Label ID="KCheckListTimeId" runat="server"></asp:Label>
        </td>
	</tr>
       <tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查位置：</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox ID="TextBox2" runat="server"  CssClass="TBmiddle"></asp:TextBox>
		<asp:Label ID="LocationLabel" runat="server"></asp:Label>
		<span class="NoteText"></span></td>
	</tr>
       <tr>
		<td class="Table1" style="height: 22px; width: 306px;">日期：</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox ID="TextBox1" runat="server"  CssClass="TBmiddle"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
       
       
        <tr>
		<td  style="height: 22px; width: 306px;" colspan="2">
             <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label3" runat="server" Text="Label">施工前</asp:Label>
                       </td>
                </tr>
            </table>
            <asp:Table ID="Table1" runat="server"  
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%" >
            <asp:TableRow runat="server" CssClass="TableRow">
                
                <asp:TableCell runat="server" Width="70%">項目</asp:TableCell>
                <asp:TableCell runat="server" Width="10%">完成度</asp:TableCell>
                <asp:TableCell runat="server" Width="20%">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
         <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label1" runat="server" Text="Label">施工中</asp:Label>
                       </td>
                </tr>
            </table>
        
        <asp:Table ID="Table2" runat="server"  BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%">
            <asp:TableRow runat="server" CssClass="TableRow">
                
                <asp:TableCell runat="server" Width="70%">項目</asp:TableCell>
                <asp:TableCell runat="server" Width="10%">完成度</asp:TableCell>
                <asp:TableCell runat="server" Width="20%">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
         <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label2" runat="server" Text="Label">施工後</asp:Label>
                       </td>
                </tr>
            </table>
        
        <asp:Table ID="Table3" runat="server"  BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%">
            <asp:TableRow runat="server" CssClass="TableRow">
               
                <asp:TableCell runat="server" Width="70%">項目</asp:TableCell>
                <asp:TableCell runat="server" Width="10%">完成度</asp:TableCell>
                <asp:TableCell runat="server" Width="20%">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>



		</td>
		
	</tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeMedium" Text="完成填報"  OnClick="SaveAction" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁"  OnClick="BtnBack_Click1"/>
		</td>
	</tr>
</table>
    </form>
</body>
</html>
