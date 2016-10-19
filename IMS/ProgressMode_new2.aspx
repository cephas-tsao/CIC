 <%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProgressMode_new2.aspx.cs" Inherits="IMS.ProgressMode_new2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>進度管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
    <script>
        function alerttime(now_data, start_data, end_data) {

            //判斷時間是否為區段中
            if ((Date.parse(end_data)).valueOf() >= (Date.parse(now_data)).valueOf() && (Date.parse(start_data)).valueOf() <= (Date.parse(now_data)).valueOf()) {
            } else {
                alert("不合理的日期，請重新選擇，日期須介於" + start_data + "與" + end_data + "之間");
            }
        }
    </script>
    <asp:Label runat="server" Text="目前進度版次："></asp:Label>
    <asp:DropDownList ID="DDL_version" runat="server" DataSourceID="Sql_version" DataTextField="Version" DataValueField="Version" AutoPostBack="true" OnSelectedIndexChanged="DDL_version_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="Sql_version" runat="server"></asp:SqlDataSource>
    <br />
    <asp:Label runat="server" Text="請輸入預計開工日期："></asp:Label>
    <asp:TextBox ID="TB_RSdate" runat="server" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));"></asp:TextBox>
    <asp:Button ID="Btn_Schedule" runat="server" Text="排程" />
    <br />
    <asp:Table ID="Tbl_Output" runat="server" BorderStyle="Double" BorderWidth="1" GridLines="Both">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell Width="20px" Text="作業編號" RowSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Width="200px" Text="作業名稱" RowSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Width="20px" Text="工期" RowSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="開始日期" ColumnSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="結束日期" ColumnSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="浮時" RowSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="要徑" RowSpan="2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="預計日期" ColumnSpan="2"></asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableHeaderRow>
            <asp:TableHeaderCell Text="最早"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最早"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="開始"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="結束"></asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <asp:Button ID="Update_date" runat="server" Text="儲存進度時程" OnClick="Update_date_Click" />
    <asp:Button ID="Show_Chart" runat="server" Text="顯示甘特圖" OnClick="Show_Chart_Click" />
    <asp:Button ID="Insert_ActProg" runat="server" Text="輸入實際進度" OnClick="Insert_ActProg_Click" />
</asp:Content>