<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FFundIncreaseView.aspx.cs" Inherits="IMS.FFundIncreaseView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>分包商計價加款明細檢視</title>
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #666699;
            text-align: center;
            color: #FFFFFF;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table class="Table100">
            <tr>
                <td class="TableTop">分包商計價加款明細檢視</td>
            </tr >
        </table >
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="搜尋結果尚無資料">               
                <AlternatingRowStyle BackColor="White" />
                <Columns>                                
                    <asp:BoundField DataField="Subject" HeaderText="加款事由" SortExpression="FFund_Debit.Subject" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="加款類型" SortExpression="FFund_Debit.Type" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="發生日期" SortExpression="FFund_Debit.Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="加款金額" SortExpression="FFund_Debit.Price" ItemStyle-HorizontalAlign="Center">                               
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Tax" HeaderText="稅金" SortExpression="FFund_Main.Tax" ItemStyle-HorizontalAlign="Center">                    
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="SumPrice" HeaderText="加款總額" SortExpression="FFund_Debit.SumPrice" ItemStyle-HorizontalAlign="Center"> 
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select * From FFund_Modify Where BelongFFID=@FFID And IncreaseDebit='I'">
               <SelectParameters>
                   <asp:SessionParameter Name="FFID" SessionField="FFID" />
               </SelectParameters>
           </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
