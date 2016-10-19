<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProgressMode_new.aspx.cs" Inherits="IMS.ProgressMode1" %>

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
    <div>
        <asp:Label runat="server" Text="目前進度作業項目版本："></asp:Label>
        <asp:DropDownList ID="DDL_version" runat="server" DataSourceID="Sql_version" DataTextField="Version" DataValueField="Version" AutoPostBack="true" OnSelectedIndexChanged="DDL_version_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="Sql_version" runat="server"></asp:SqlDataSource>
        <br />
        <asp:Label runat="server" Text="請輸入作業數量："></asp:Label><asp:TextBox ID="TB_Activity" runat="server"></asp:TextBox><asp:Button ID="Btn_make" runat="server" Text="確定" OnClick="Btn_make_Click" />
        <asp:Button ID="Btn_Clear" runat="server" Text="清除全部項目" Enabled="false" OnClick="Btn_Clear_Click" />
        <br />
        <asp:Table ID="Tbl_Input" runat="server" BorderStyle="Double" BorderWidth="1" GridLines="Both">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell Text="作業編號" Width="20px"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="隸屬工項(WI)"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="作業名稱(Activities)" Width="200px"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="工期" Width="20px"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="前置作業編號" Width="100px"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="前置時間" Width="20px"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="WI比重(%)" Width="30px"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <asp:Button ID="Btn_Save" runat="server" Text="儲存作業進度" OnClick="Btn_Save_Click" />
        <asp:Button ID="Btn_Newversion" runat="server" Text="另存新版本進度" OnClick="Btn_Newversion_Click" />
        <asp:Button ID="Btn_Set" runat="server" Text="進度日期設定" OnClick="Btn_Set_Click" />
        <br />
    </div>
    
</asp:Content>
