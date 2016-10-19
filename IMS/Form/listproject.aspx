<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="listproject.aspx.cs" Inherits="IMS.Form.listproject" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
<body>

    <div>
    
        工程項目表：<br />
        <asp:Button ID="Button1" runat="server" Text="新增工程" OnClick="Button1_Click"  />
        <asp:Button ID="Button2" runat="server" Text="修改工程" OnClick="Button2_Click" />
        <asp:Button ID="Button5" runat="server" Text="編輯工程項目表" OnClick="Button5_Click" />
        <asp:Button ID="Button3" runat="server" Text="刪除工程" OnClick="Button3_Click"   />
<asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁"> </br>
    <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" Wrap="False">序號</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">工程名</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

</body>
</div>

    </asp:Content>
