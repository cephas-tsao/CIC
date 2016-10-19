<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidItemEdit.aspx.cs" Inherits="IMS.BidItemEdit1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>
    <form id="form2" runat="server">
          <script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
     <script type="text/javascript">

         function addLayerCode() {

             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },

                 dataType: 'text',

                 //success: function (UpdtItemOrder) {

                 //    $.ajax({
                 //        type: "POST",

                 //        url: '../Ajax/UpdateBidItemOrder.aspx?action=addsave',

                 //        //data: { "uid": uid },

                 //        dataType: 'text',

                 success: function (msg) {

                     alert("更新成功");

                 }
             })
         }
         function addLayerCode1() {

             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },

                 dataType: 'text',

                 success: function (UpdtItemOrder) {

                     $.ajax({
                         type: "POST",

                         url: '../Ajax/UpdateBidItemOrder.aspx?action=addsave',

                         //data: { "uid": uid },

                         dataType: 'text',

                         success: function (msg) {

                             alert("更新成功");

                         }
                     })
                 }
             })
         }

    </script>
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">投標預算-修改工項</td>
            </tr>
            <tr>
                <td class="Table1">階層</td>
                <td class="Table2">
                            <%--    <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" CssClass="DDLshort">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Selected="True">2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                </asp:DropDownList>--%>
                            <asp:DropDownList ID="DDLLayer" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DDLLayer_SelectedIndexChanged">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>                              
                                </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </td>
                <td class="Table1">上層工項</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDLDtUpper" runat="server" Font-Size="Medium" DataSourceID="SqlDataSource1" AutoPostBack="True" CssClass="DDLshort" OnSelectedIndexChanged="DDLTop_SelectedIndexChanged">                       
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>        
                                </asp:DropDownList>                            
                            <%--    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>--%>
                            </td>
            </tr>
            <tr>
                <td class="Table1">項次</td>
                <td class="Table2">
                                  <asp:DropDownList ID="DDLNext" runat="server" Font-Size="Medium" Height="30px" Width="155px">                                
                                </asp:DropDownList>
                            </td>
                <td class="Table1">工項類型</td>
                <td class="Table2">
                             
                          <asp:DropDownList ID="DDLKind" runat="server" Font-Size="Medium" Height="30px" Width="155px" AutoPostBack="true" OnSelectedIndexChanged="DDLKind_SelectedIndexChanged"> 
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem" Selected="True">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>                             
                                </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="Table1">名稱</td>
                <td class="Table2" colspan="3">
                             <asp:TextBox ID="TxItemName" runat="server" Font-Size="Medium"  CssClass="TB500"></asp:TextBox>
                            </td>
            </tr>
            <tr>
                <td class="Table1">單位</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDL_Unit" runat="server" CssClass="DDLfree">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">連結工料</td>
                <td class="Table2">  <asp:Label runat="server" ID="ItemName" Font-Size="Medium" Height="25px" Width="500px"></asp:Label>
                    <asp:Label ID="LbPriceID" runat="server"  Visible="false"></asp:Label>
                  <%--  <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="工料連結設定" Enabled="False" />--%>
                         <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="工料連結設定" OnClick="Button17_Click" />
                      <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="4">
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="Add_Click"/>
&nbsp;
                    <asp:Button ID="BtnRecovery" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="BtnRecovery_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
