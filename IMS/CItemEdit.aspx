<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CItemEdit.aspx.cs" Inherits="IMS.CItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <title></title>
</head>
          <script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
     <script type="text/javascript">
         function showProgress() {
             var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                    updateProgress.style.display = "block";
                }
                function hideProgress() {
                    var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                 updateProgress.style.display = "none";
             }
             window.onbeforeunload = myunload;

             var succeed = false;
             function myunload() {
                 if (succeed == true) {
                     window.event.returnValue = "更新尚未完成，是否離開?";//關閉時,彈出視窗的訊息
                 }
             }
         function addLayerCode() {

             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddBWLayerCode.aspx?action=addsave',
                 dataType: 'text',
                 success: function (msg) {

                     alert("更新成功");

                 }
             })
         }
         function addLayerCode1() {

             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },

                 dataType: 'text',

                 success: function (UpdtItemOrder) {

                     $.ajax({
                         type: "POST",

                         url: '../Ajax/UpdateCBItemOrder.aspx?action=addsave',

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
<body>
    <form id="form1" runat="server"> 
     <div>
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">合約預算-修改工項</td>
            </tr>
            <tr>
                <td class="Table1">階層</td>
                <td class="Table2">
                              <asp:DropDownList ID="DDLLayer" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DDLLayer_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>                                 
                                </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </td>
                <td class="Table1">上層工項</td>
                <td class="Table2">
                               <asp:DropDownList ID="DDLDtUpper" runat="server"  DataSourceID="SqlDataSource1" AutoPostBack="True" CssClass="DDLshort" Width="300px" OnSelectedIndexChanged="DDLTop_SelectedIndexChanged">                       
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>        
                                </asp:DropDownList>               
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
                                <asp:DropDownList ID="DDLKind" runat="server" CssClass="DDLshort" AutoPostBack="True" OnSelectedIndexChanged="DDLKind_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem" >主項大類</asp:ListItem>
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
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">連結工料</td>
                <td class="Table2"> <asp:Label runat="server" ID="ItemName" Font-Size="Medium" Height="25px" Width="500px"></asp:Label>
                    <asp:Label ID="LbPriceID" runat="server"  Visible="false"></asp:Label><asp:Button ID="Button17" runat="server" CssClass="BtnFree" Text="工料連結設定" Enabled="False" OnClick="Button17_Click" />
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="4">
                       <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                    <asp:Button ID="BtnSave" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="Add_Click" OnClientClick="showProgress()"/>
&nbsp;
                    <asp:Button ID="BtnRecovery" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="BtnRecovery_Click" />
                     
                         </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="BtnSave" />
                </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
      <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
    </div>
    </form>
</body>
</html>
