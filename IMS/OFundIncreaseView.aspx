<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OFundIncreaseView.aspx.cs" Inherits="IMS.OFundIncreaseView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
    <title>業者請款加款明細檢視</title>
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
                <td class="TableTop">業者請款加款明細檢視</td>
            </tr >
        </table >
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="OF_MID" HeaderText="OF_MID" InsertVisible="False" ReadOnly="True" SortExpression="FF_MID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Subject" HeaderText="扣款事由" SortExpression="OFund_Modify.Subject" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Type" HeaderText="扣款類型" SortExpression="OFund_Modify.Type" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Date" HeaderText="發生日期" SortExpression="OFund_Modify.Date" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False" />
                                <asp:BoundField DataField="Price" HeaderText="加款金額" SortExpression="OFund_Modify.Price" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Tax" HeaderText="稅金" SortExpression="OFund_Modify.Tax" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="SumPrice" HeaderText="加款總額" SortExpression="OFund_Modify.SumPrice" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Documents" HeaderText="依據文號" SortExpression="OFund_Modify.Documents" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Recorder" HeaderText="記錄人員" SortExpression="OFund_Modify.Recorder" ItemStyle-HorizontalAlign="Center"/>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select * From OFund_Modify Where BelongOFID=@OFID And IncreaseDebit='I'">
            <SelectParameters>
                <asp:SessionParameter Name="OFID" SessionField="OFID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
