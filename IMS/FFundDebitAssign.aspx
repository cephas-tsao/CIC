<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FFundDebitAssign.aspx.cs" Inherits="IMS.FFundDebitAssign1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>計價單指定扣款明細</title>
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
</head>
<body>
 <form id="form1" runat="server">
<table class="Table100">
    <tr>
        <td class="TableTop">計價單指定扣款明細</td>
    </tr >
</table >
    <asp:GridView id="GridView1" runat="server"  DataKeyNames="FF_MID" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" EmptyDataText="搜尋結果尚無資料">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:CheckBox ID="checkbox1" runat="server"  Checked='<%#Eval("ckbSelect").ToString()=="1"?true:false%>' Enabled='<%#Eval("ckb_Show").ToString()=="1"?true:false%>' Text='' ></asp:CheckBox>          
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="Subject" HeaderText="扣款事由" SortExpression="FFund_Debit.Subject" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Type" HeaderText="扣款類型" SortExpression="FFund_Debit.Type" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="發生日期" SortExpression="FFund_Debit.Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="扣款金額" SortExpression="FFund_Debit.Price" ItemStyle-HorizontalAlign="Center">                               
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Tax" HeaderText="稅金" SortExpression="FFund_Main.Tax" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="SumPrice" HeaderText="扣款總額" SortExpression="FFund_Debit.SumPrice" ItemStyle-HorizontalAlign="Center"> 
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Recorder" HeaderText="記錄人員" SortExpression="FFund_Debit.Recorder" ItemStyle-HorizontalAlign="Center">
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
        <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="完成指定" OnClick="Button1_Click" />
    </div>
     <br>
    </form>
</body>
</html>
