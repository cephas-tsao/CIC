<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KEngineeringAdd.aspx.cs" Inherits="IMS.KEngineeringAdd" %>

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
		<td class="TableTop" colspan="2">新增公司樣板</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">樣板名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="KEngineeringName" runat="server"  CssClass="TBmiddle"></asp:TextBox>
		<span class="NoteText">(必填)</span></td>
	</tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeMedium" Text="新增公司樣板"  OnClick="SaveAction" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁"  OnClick="BtnBack_Click1"/>
		</td>
	</tr>
</table>
      </form>
</body>
</html>
