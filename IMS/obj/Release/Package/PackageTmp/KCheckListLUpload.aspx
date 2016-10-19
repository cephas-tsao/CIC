<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListLUpload.aspx.cs" Inherits="IMS.KCheckListLUpload" %>

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
    <div>
        <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">
            <asp:Label ID="ProjectLabel" runat="server"></asp:Label>
            <asp:Label ID="ProjectidLabel" runat="server"></asp:Label>
           上傳頁面</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">改善狀態：</td>
		<td class="Table2" style="height: 22px">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DDLshort">
                <asp:ListItem>改善前</asp:ListItem>
                <asp:ListItem>改善中</asp:ListItem>
                <asp:ListItem>改善後</asp:ListItem>
            </asp:DropDownList>
		
        </td>
	</tr>

             <tr>
		<td class="Table1" style="height: 22px; width: 306px;">說明：</td>
		<td class="Table2" style="height: 22px">
		           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
             <tr>
		<td class="Table1" style="height: 22px; width: 306px;"></td>
		<td class="Table2" style="height: 22px">
		           <asp:FileUpload ID="FU1" runat="server" />
		<span class="NoteText"></span></td>
	</tr>
             

        <tr>
		<td colspan="2" class="Table1">
		<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="上傳" CssClass="BtnLargeShort" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁"  OnClick="BtnBack_Click1"/>
		</td>
	</tr>    
        
        
        </table>

    
        
           
         
            
            <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
       
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </div>
    </form>
</body>
</html>
