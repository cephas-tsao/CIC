<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KEngineeringEdit.aspx.cs" Inherits="IMS.KEngineeringEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
     <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">修改工程檢查表</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">工程名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="KEngineeringName" runat="server"  CssClass="TBmiddle"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeShort" Text="修改工程" OnClick="Button1_Click"   />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁" OnClick="BtnBack_Click"  />
		</td>
	</tr>
        

         <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</table>
         <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>
