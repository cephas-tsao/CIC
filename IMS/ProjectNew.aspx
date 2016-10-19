<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProjectNew.aspx.cs" Inherits="IMS.ProjectNew" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-標案轉入</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <%--<link href="../CSS/Main.css" rel="stylesheet" type="text/css" />--%>
          <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <Area:Project ID="ProjectBox" runat="server" /> 

   <%-- <div style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">--%>
    
        <table class="Table100" >
            <tr>
                <td class="TableTop">新增專案</td>
            </tr>
            <tr>
                <td class="Table1L">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="1">新增空白專案</asp:ListItem>
                        <asp:ListItem Value="2">由標案轉入</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_1" runat="server" Visible="False" DefaultButton="ADD">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="2">&nbsp; 新增空白專案</td>
                </tr>
               <tr>
                <td class="Table1">專案(工程)編號</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectCode1" runat="server" CssClass="TBlong"></asp:TextBox>
		            <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)名稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectName1" runat="server" CssClass="TBlong"></asp:TextBox>
                    <span class="NoteText">(必填)</span></td>
            </tr>
            <tr>
                <td class="Table1">專案(工程)簡稱</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxProjectNickname1" runat="server" CssClass="TBlong"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1">備註</td>
                <td class="Table2LC">
                    <asp:TextBox ID="TxNote1" runat="server" CssClass="TBlong" Height="100px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="2">
                    <asp:Button ID="ADD" runat="server" CssClass="BtnLargeShort" Text="確定新增"  OnClick="SaveAction"/>
&nbsp;
                  <asp:Button ID="BtnClear" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="BtnClear_Click"  />
                </td>
            </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Pnl_2" runat="server" Visible="False" DefaultButton="Button3">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="2">&nbsp; 由標案轉入</td>
                </tr>
            <tr>
		<td class="Table1" >選擇標案</td>
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
		<td class="Table1" >專案(工程)編號</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="TxProjectCode" runat="server" CssClass="TBlong"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" >專案(工程)名稱</td>
		<td class="Table2">
		<asp:TextBox id="TxProjectName" runat="server" CssClass="TBlong"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>
	<tr>
		<td class="Table1" >專案(工程)簡稱</td>
		<td class="Table2">
		<asp:TextBox id="TxProjectNickname" runat="server" CssClass="TBlong"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="Table1" >備註</td>
		<td class="Table2" >
		<asp:TextBox id="TxNote" runat="server" CssClass="TBlong" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="Table1" >
		<asp:Button id="Button3" runat="server" Text="標案轉入" Width="107px" OnClick="SaveAction1" CssClass="BtnLargeShort"/>
                &nbsp;
            <asp:Button ID="BtnClear1" runat="server" CssClass="BtnLargeShort" Text="全部清空"  OnClick="BtnClear1_Click" />
		</td>
	</tr>
            </table>
        </asp:Panel>
   <%-- </div>--%>


 </asp:Content>