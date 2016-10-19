<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PriceAnalysis_Edit.aspx.cs" Inherits="IMS.PriceAnalysis_Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
         <link rel="stylesheet" type="text/css" href="./css/Normal.css" />
   
    <title>工料編輯</title>
</head>
 <body style="width:1000px;">
    <form id="form1" runat="server">
    <div >
              <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" >工料編輯</asp:LinkButton>
                </td>
            </tr>
            </table>
    <br />
        工料名：<asp:TextBox ID="TB_PriceName" runat="server" CssClass="TBlong"></asp:TextBox> &nbsp;&nbsp;
        分析數量：<asp:TextBox ID="TB_AnaNum" runat="server" Height="20px" CssClass="TBshort"></asp:TextBox> &nbsp;&nbsp;
        單位：<asp:DropDownList ID="DDL_Unit" runat="server" Height="20px" CssClass="DDLFree"></asp:DropDownList><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Table ID="Tbl_Price" runat="server" BorderStyle="Double" Width="100%"  >
            
            <asp:TableHeaderRow BackColor="#5D7B9D">
                <asp:TableHeaderCell Text="刪除" Width="40px"  CssClass="BtnFree" ></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="工料名" CssClass="DDLlong" ></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="數量" CssClass="TBshort" Width="40px" ></asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <table style="width:100%">
          <tr>
                    <td class="Table1" colspan="3">
        <asp:Button ID="Btn_Add" runat="server" Text="新增" CssClass="BtnFree" OnClick="Btn_Add_Click" /> &nbsp;
        <asp:Button ID="Btn_Save" runat="server" Text="存檔" CssClass="BtnFree" OnClick="Btn_Save_Click" /> &nbsp;
        <asp:Button ID="Btn_Close" runat="server" Text="關閉" CssClass="BtnFree" OnClientClick="window.close()" /><br />
            </td></tr>            </table>
    </div>
    </form>
</body>
</html>
