<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FinanceCodeMap.aspx.cs" Inherits="IMS.FinanceCodeMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <title>財務管理模組</title>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <link rel="stylesheet" type="text/css" href="CSS/StyleSht.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="Table100">
            <tr>
			    <td class="TableTop" colspan="2">財務會計用編碼編輯</td>
		    </tr>
		    <tr>
		        <td class="Table1L" width="50%">
                    &nbsp;<asp:ImageButton ID="ImageButton212" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存修改" Width="27px" OnClick="ImageButton212_Click" />
                </td>
		        <td class="Table1R">
                    &nbsp;<asp:ImageButton ID="ImageButton210" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImageButton210_Click" />
                    &nbsp; <asp:ImageButton ID="ImageButton211" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton211_Click" />
                    &nbsp; &nbsp;
		        </td>
		    </tr>
		    <tr>
		        <td class="Table1L">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                        <asp:ListItem Value="0">依執行預算工作項目填寫</asp:ListItem>
                        <asp:ListItem Value="1">依執行預算資源項目填寫</asp:ListItem>
                     </asp:RadioButtonList>
                </td>
		        <td class="Table1L">
                    1.請使用者依本身需求選擇工作項目或資源項目填寫財會編碼。<br />
                    2.填寫完畢請記得點選儲存按鈕才算完成。<br />
                </td>
		        </tr>
		        <tr>
		            <td class="Table1" colspan="2">
                        <asp:Panel ID="Pnl_WBS" runat="server" Visible="False">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </asp:Panel>
                        <asp:Panel ID="Pnl_Resource" runat="server" Visible="False">
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        </asp:Panel>
                    </td>
		        </tr>
        </table>
    </div>
</asp:Content>
