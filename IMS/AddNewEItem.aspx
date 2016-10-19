<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewEItem.aspx.cs" Inherits="IMS.AddNewEItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
         //function addLayerCode() {

         //    $.ajax({
         //        type: "POST",

         //        url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

         //        //data: { "uid": uid },

         //        dataType: 'text',

         //        success: function (msg) {

         //            alert("更新成功");

         //        }
         //    })
         //}
         //function addLayerCode1() {

         //    $.ajax({
         //        type: "POST",

         //        url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

         //        //data: { "uid": uid },

         //        dataType: 'text',

         //        success: function (UpdtItemOrder) {

         //            $.ajax({
         //                type: "POST",

         //                url: '../Ajax/UpdateItemOrder.aspx?action=addsave',

         //                //data: { "uid": uid },

         //                dataType: 'text',

         //                success: function (msg) {

         //                    alert("更新成功");

         //                }
         //            })
         //        }
         //    })
         //}
    </script>
    <style type="text/css">

        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
        }
            

        
        .Table2 {
            width: 100%;
        }
                

        .auto-style2C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: center;
	        color: #000000;
        }
        


        </style>
</head>
<body>
    <form id="form1" runat="server" DefaultButton="Add_Click">
    <div>
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">新增執行預算工項</td>
		</tr>
		</table>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    <table class="Table2">
                        <tr>
                            <td class="auto-style2C" >階層</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DDLLayer" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DDLLayer_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>                               
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">上層工項</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DDLTop" runat="server" Font-Size="Medium" Height="30px" Width="285px" OnSelectedIndexChanged="DDLTop_SelectedIndexChanged">                               
                                </asp:DropDownList>
                            </td>
                            </tr>
                     <tr>
                            <td class="auto-style2C">項次</td>
                            <td class="auto-style3" >
                                <asp:Label ID="LbNext" runat="server"  ></asp:Label>
                            </td>
                            <td class="auto-style2C">工項類型</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DDLKind" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="Table2">
                        <tr>
                            <td class="auto-style2C">名稱</td>
                            <td class="auto-style3" colspan="3">
                                <asp:TextBox ID="TxItemName" runat="server" Font-Size="Medium" Height="25px" Width="500px" OnTextChanged="TxItemName_TextChanged"></asp:TextBox>
                            </td>
                            </tr><tr>
                            <td class="auto-style2C">單位</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DDL_Unit" runat="server" Font-Size="Medium" Height="30px" Width="155px" DataSource='<%# Utility.Unitlist.UnitList() %>'>
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C" >備註</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TxNotes" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                         
                        </tr>
                 
                    </table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
             <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                                    <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定新增並離開"  OnClick="Add_Click" OnClientClick="showProgress()"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁"  OnClientClick="window.close()" />
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