<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CItemAdd.aspx.cs" Inherits="IMS.CItemAdd" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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

                     //data: { "uid": uid },

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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">合約預算-新增工項</td>
            </tr>
            <tr>
                <td class="Table1">階層</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDLLayer" runat="server" AutoPostBack="True" CssClass="DDLshort" OnSelectedIndexChanged="DDLLayer_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>                                  
                                </asp:DropDownList>
                            </td>
                <td class="Table1">上層工項</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDLTop" runat="server" CssClass="DDLshort" OnSelectedIndexChanged="DDLTop_SelectedIndexChanged">
                                 
                                </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="Table1">項次</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDLNext" runat="server" CssClass="DDLshort">
                                   
                                </asp:DropDownList>
                            </td>
                <td class="Table1">工項類型</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDLKind" runat="server" CssClass="DDLshort" AutoPostBack="True">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td class="Table1">名稱</td>
                <td class="Table2" colspan="3">
                                <asp:TextBox ID="TxItemName" runat="server" CssClass="TB500" OnTextChanged="TxItemName_TextChanged"></asp:TextBox>
                            </td>
            </tr>
            <tr>
                <td class="Table1">單位</td>
                <td class="Table2">
                                <asp:DropDownList ID="DDL_Unit" runat="server" CssClass="DDLfree" DataSource='<%# Utility.Unitlist.UnitList() %>'>
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table1">連結工料</td>
                <td class="Table2"> <asp:Label runat="server" ID="ItemName" Font-Size="Medium" Height="25px" Width="500px"></asp:Label><asp:Button ID="BtnRLink" runat="server" CssClass="BtnFree" Text="工料連結設定"   OnClick="BtnRLink_Click"/>
                      <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
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
                    <asp:Button ID="BtnSave" runat="server" CssClass="BtnLargeShort" Text="確定新增" OnClick="Add_Click" OnClientClick="showProgress()"/>
&nbsp;
                    <asp:Button ID="BtnClear" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
                              </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="BtnSave" />
                </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
