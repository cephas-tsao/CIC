<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="listplace.aspx.cs" Inherits="IMS.Form.listplace" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Form.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>品質管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div style="width: 100%;padding-left:200px">
<body>
  
    <div>
    
        工地工程表：<br />
        <asp:Button ID="Button1" runat="server" Text="新增工地" OnClick="Button1_Click"  />
        
        
<asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁">
        <asp:Label ID="Label2" runat="server"></asp:Label>
        </br>
    <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server">序號</asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" Wrap="False">工地</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">工程</asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server" >地址</asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server" >檢核</asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server" >歷史紀錄</asp:TableCell>
                 <asp:TableCell ID="TableCell7" runat="server" >修改
                 </asp:TableCell>
                 <asp:TableCell ID="TableCell8" runat="server" >刪除</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>

</body>
</div>
    </asp:Content>