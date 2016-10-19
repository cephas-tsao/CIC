<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OFundDebitApproval.aspx.cs" Inherits="IMS.OFundDebitApproval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>請款單業主核撥扣款明細</title>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
</head>
<body>
 <form id="form1" runat="server">
<table class="Table100">
    <tr>
        <td class="TableTop">請款單業主核撥扣款明細</td>
    </tr >
</table >      
       <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">新增扣款紀錄</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_Insert" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">扣款事由</td>
                    <td class="Table2" colspan="3">
                        <asp:TextBox ID="TB_Subject" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">扣款類型</td>
                    <td class="Table2" colspan="2">
                        <asp:DropDownList ID="DDL_Style" runat="server" CssClass="DDLshort">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>預支款扣款</asp:ListItem>
                            <asp:ListItem>罰款</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">發生日期</td>
                    <td class="Table2" colspan="2">
                        <asp:TextBox ID="TB_Date" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">依據文號</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Docu" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">扣款金額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Price" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">稅金</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Tax" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">
                        <asp:Button ID="Button4" runat="server" CssClass="BtnFree" OnClick="Button4_Click" Text="5%自動計算" />
                    </td>
                    <td class="Table1">扣款總額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_SumPrice" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">
                        <asp:Button ID="Button5" runat="server" CssClass="BtnFree" OnClick="Button5_Click" Text="自動合計" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="10">
                        <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="確定新增" OnClick="Button2_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click">扣款明細</asp:LinkButton>
                </td>
            </tr>
        </table>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
    <asp:GridView id="GridView1" runat="server"  DataKeyNames="OF_MID" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" EmptyDataText="搜尋結果尚無資料">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:CheckBox ID="checkbox1" runat="server"  Checked='<%#Eval("ckbSelect").ToString()=="1"?true:false%>' Enabled='<%#Eval("ckb_Show").ToString()=="1"?true:false%>' Text='' ></asp:CheckBox>          
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="Subject" HeaderText="扣款事由" SortExpression="Subject" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Type" HeaderText="扣款類型" SortExpression="Type" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="發生日期" SortExpression="Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="扣款金額" SortExpression="Price" ItemStyle-HorizontalAlign="Center">                               
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Tax" HeaderText="稅金" SortExpression="Tax" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="SumPrice" HeaderText="扣款總額" SortExpression="SumPrice" ItemStyle-HorizontalAlign="Center"> 
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Documents" HeaderText="依據文號" SortExpression="Documents" ItemStyle-HorizontalAlign="Center"> 
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Recorder" HeaderText="記錄人員" SortExpression="Recorder" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br /> 
    <div style="text-align: center" >
        <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="儲存認定" OnClick="Button1_Click" />
    </div>
    </asp:Panel>
    </form>
</body>
</html>
