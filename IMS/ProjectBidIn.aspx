<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProjectBidIn.aspx.cs" Inherits="IMS.ProjectBidIn" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-標案轉入</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <%--<link href="../CSS/Main.css" rel="stylesheet" type="text/css" />--%>
          <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <Area:Project ID="ProjectBox" runat="server" /> 
 


	<br />

<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;border-color:white" border="1">
	<tr>
		<td class="TableTop" colspan="2"><strong>標案轉入</strong></td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px">選擇標案</td>
		<td class="Table2">
		<asp:DropDownList id="DropDownList1" runat="server" Height="30px" Width="300px" DataTextField="BidName" DataValueField="Bid" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
	</tr>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
	<tr>
		<td class="TableTop2" colspan="2">請輸入工程相關資訊：</td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">專案(工程)編號</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TxProjectCode" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px">專案(工程)名稱</td>
		<td class="Table2">
		<asp:TextBox id="TxProjectName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px">專案(工程)簡稱</td>
		<td class="Table2">
		<asp:TextBox id="TxProjectNickname" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1" style="width: 306px; height: 24px;">備註</td>
		<td class="Table2" style="height: 24px">
		<asp:TextBox id="TxNote" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="Table1" style="padding-left:500px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="標案轉入" Width="107px" OnClick="SaveAction" />
		</td>
	</tr>
</table>


    </asp:Content>