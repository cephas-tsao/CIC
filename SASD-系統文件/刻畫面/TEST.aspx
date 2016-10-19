<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TEST.aspx.cs" Inherits="TEST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
		        <asp:DropDownList ID="DDL_Check" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="750px" AutoPostBack="True">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem Value="未依招標文件規定投標">未依招標文件規定投標</asp:ListItem>
                    <asp:ListItem>押標金未繳或不符合規定</asp:ListItem>
                    <asp:ListItem>資格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>規格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>價格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>投標文件為空白文件、無關文件或標封內空無一物</asp:ListItem>
                    <asp:ListItem>借用或冒用他人名義或證件，或以偽造、變造之文件投標</asp:ListItem>
                    <asp:ListItem>偽造、變造投標文件</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：投標文件內容由同一人或同一廠商繕寫或備具者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：押標金由同一人或同一廠商繳納或申請退還者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：投標標封或通知機關信函號碼連號，顯係同一人或同一廠商所為者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：廠商地址、電話號碼、傳真機號碼、聯絡人或電子郵件網址相同者</asp:ListItem>
                    <asp:ListItem>屬採購法第103條第1項不得參加投標或作為決標對象之情形</asp:ListItem>
                    <asp:ListItem>違反採購法施行細則第33條之情形</asp:ListItem>
                    <asp:ListItem>屬採購法施行細則第38條第1項規定之情形</asp:ListItem>
                    <asp:ListItem Value="Other">其他</asp:ListItem>
                </asp:DropDownList>
		        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT Bid_Library.*, Bid_WBS.* FROM Bid_Library INNER JOIN Bid_WBS ON Bid_Library.PriceID = Bid_WBS.ItemRef"></asp:SqlDataSource>
    
                <br />
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
