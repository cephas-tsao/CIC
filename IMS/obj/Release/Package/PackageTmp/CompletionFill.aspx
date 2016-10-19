<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompletionFill.aspx.cs" Inherits="IMS.CompletionFill" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/CompletionMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>竣工數量填列</title>
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
    </style>
    <script type="text/javascript">
        function run(a, b, c) {
            var form1 = document.getElementById(a);
            var form2 = document.getElementById(b);
            document.getElementById(c).value = form1.value * form2.value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
    <link rel="stylesheet" type="text/css" href="CSS/StyleSht.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />  
        <div style="width:88%;float:right;">
        <table class="Table100">
            <tr>
			    <td class="TableTop" colspan="2">竣工數量填列</td>
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
            </table>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
