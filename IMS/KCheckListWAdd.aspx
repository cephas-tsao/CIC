﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListWAdd.aspx.cs" Inherits="IMS.KCheckListWAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />

    <style type="text/css">
          .LB {          
	       font-size:medium;
            font-family:微軟正黑體;
            width:300px;
            height:100px;
	       
            } 
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="Table100">
	<tr>
		<td class="TableTop" colspan="2">新增專案表單</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">選擇公司樣板</td>
		<td class="Table2" style="height: 22px">
            <asp:ListBox ID="ListBox1" runat="server" CssClass="LB" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
		<span class="NoteText">(必填)<asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            </span></td>
	</tr>
        <tr>
		<td class="Table1" style="height: 22px; width: 306px;">自主檢查表名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TextBox1" runat="server"  CssClass="TB500"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeMedium" Text="新增自主檢查表"  OnClick="SaveAction" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁"  OnClick="BtnBack_Click1"/>
		</td>
	</tr>
</table>
      </form>
</body>
</html>
