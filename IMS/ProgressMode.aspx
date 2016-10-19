<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProgressMode.aspx.cs" Inherits="IMS.ProgressMode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>進度管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
    <script>
        function alerttime(now_data,start_data,end_data) {
            //var new_data = new Date();  // 現在時間
            //var start_data = "2015/1/1 00:00:00";  //起始時間
            //var end_data = "2016/9/10 00:00:00";  //結束時間

            //判斷時間是否為區段中
            if ((Date.parse(end_data)).valueOf() >= (Date.parse(now_data)).valueOf() && (Date.parse(start_data)).valueOf() <= (Date.parse(now_data)).valueOf()) {
                //alert(start_data + " <= " + new_data + " >= " + end_data + " 之中");
            } else {
                alert("不合理的日期，請重新選擇，日期須介於" + start_data + "與" + end_data + "之間");
            }
        }
    </script>
    <asp:Label runat="server" Text="請輸入作業數量："></asp:Label>
    <asp:TextBox ID="TB_Activities1" runat="server"></asp:TextBox>
    <asp:Button ID="Btn1" runat="server" Text="確定" OnClick="Btn1_Click" />
    <asp:Button ID="Btn_auto" runat="server" Text="載入WBS" OnClick="Btn_auto_Click" />
    <asp:Button ID="Btn_load" runat="server" Text="讀取排程結果" OnClick="Btn_load_Click" />
    <br />
    <asp:Label runat="server" Text="施工開始日："></asp:Label><asp:TextBox ID="TB_StartDay" runat="server" TextMode="Date" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));"></asp:TextBox><br />
    <asp:Table ID="Tbl_Input" runat="server" BorderStyle="Double" BorderWidth="1" GridLines="Both" >
        <asp:TableHeaderRow>
            <asp:TableHeaderCell Text="作業編號" Width="20px"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="隸屬項目"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="作業名稱" Width="200px"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="工期" Width="20px"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="前置作業編號" Width="100px"></asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <asp:Button ID="Btn2" runat="server" Text="計算工期" OnClick="Btn2_Click" /><br />
    <asp:Label ID="Label2" runat="server" Text="總工期為："></asp:Label><br />
    <asp:Table ID="Tbl_Output" runat="server" BorderStyle="Double" Visible="false" BorderWidth="1" GridLines="Both">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell Width="20px" Text="作業編號"></asp:TableHeaderCell>
            <asp:TableHeaderCell Width="200px" Text="作業名稱"></asp:TableHeaderCell>
            <asp:TableHeaderCell Width="20px" Text="工期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最早開始"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最早結束"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚開始"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚結束"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="要徑"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最早開始日期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚開始日期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最早結束日期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="最晚結束日期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="預計開始日期"></asp:TableHeaderCell>
            <asp:TableHeaderCell Text="預計結束日期"></asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <asp:Button ID="Btn_Save" runat="server" Text="儲存排程結果" OnClick="Btn_Save_Click" />
</asp:Content>
