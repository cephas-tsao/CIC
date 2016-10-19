<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListHView.aspx.cs" Inherits="IMS.KCheckListHView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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

        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
     <asp:Label ID="Label2" runat="server" Text=""  Visible="false"></asp:Label>
    <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">
            <asp:Label ID="ProjectLabel" runat="server"></asp:Label>
            <asp:Label ID="ProjectidLabel" runat="server"></asp:Label>
            自主檢查表紀錄檢視</strong></td>
	</tr>
	   
        <tr>
		<td class="Table1" style="height: 22px; width: 306px;">自主檢查表：</td>
		<td class="Table2" style="height: 22px">
		<asp:Label ID="EngineeringNameLabel" runat="server"></asp:Label>
		    <asp:Label ID="EngineeringidLabel" runat="server" Visible="False"></asp:Label>
		<span class="NoteText"></span>
            <asp:Label ID="personLabel" runat="server" Visible="False"></asp:Label>
        </td>
	</tr>
       <tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查人員：</td>
		<td class="Table2" style="height: 22px">
		<asp:Label ID="personLabel1" runat="server"></asp:Label>
		<span class="NoteText"></span></td>
	</tr>
        
        <tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查位置：</td>
		<td class="Table2" style="height: 22px">
		<asp:Label ID="LocationLabel" runat="server"></asp:Label>
		<span class="NoteText"></span></td>
	</tr>
     <tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查時間：</td>
		<td class="Table2" style="height: 22px">
		<asp:Label ID="DateTime" runat="server"></asp:Label>
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
                
                <asp:TableCell runat="server">項目</asp:TableCell>
                <asp:TableCell runat="server">完成度</asp:TableCell>
               
               
                <asp:TableCell runat="server">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
         <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label4" runat="server" Text="Label">施工中</asp:Label>
                       </td>
                </tr>
            </table>
        
        <asp:Table ID="Table2" runat="server"  BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%">
            <asp:TableRow runat="server" CssClass="TableRow">
                
                <asp:TableCell runat="server">項目</asp:TableCell>
                 <asp:TableCell runat="server">完成度</asp:TableCell>
                
              
                <asp:TableCell runat="server">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
         <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label5" runat="server" Text="Label">施工後</asp:Label>
                       </td>
                </tr>
            </table>
        
        <asp:Table ID="Table3" runat="server"  BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%">
            <asp:TableRow runat="server" CssClass="TableRow">
               
                <asp:TableCell runat="server">項目</asp:TableCell>
                 <asp:TableCell runat="server">完成度</asp:TableCell>
                
                
                <asp:TableCell runat="server">備註</asp:TableCell>
            </asp:TableRow>
        </asp:Table>



		</td>
		
	</tr>
       
	
</table>
    </form>
</body>
</html>
