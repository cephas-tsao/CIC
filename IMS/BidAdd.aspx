<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="BidAdd.aspx.cs" Inherits="IMS.BidAdd" %>

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
		<td class="TableTop" colspan="2">新增標案</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">標案名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TextName" runat="server"  CssClass="TBmiddle"></asp:TextBox>
		<span class="NoteText">(必填)</span></td>
	</tr>
    <tr>
		<td class="Table1" style="height: 22px; width: 306px;">標案簡稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TxNickName" runat="server" CssClass="TBlong"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1" >標案狀態</td>
		<td class="Table2">
		<asp:DropDownList id="DropDownList2" runat="server"  CssClass="DDLfree">
		</asp:DropDownList>
		<span class="NoteText">(必選)</span></td>
	</tr>

	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeShort" Text="新增標案"  OnClick="SaveAction" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁" OnClick="BtnBack_Click"/>
		</td>
	</tr>
</table>
      </form>
         </body>
    </html>

