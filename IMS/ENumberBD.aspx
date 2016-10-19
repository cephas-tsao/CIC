<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ENumberBD.aspx.cs" Inherits="IMS.ENumberBD1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./CSS/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./CSS/StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./CSS/StyleSB.css" />
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

                 url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

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

                 url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },

                 dataType: 'text',

                 success: function (UpdtItemOrder) {

                     $.ajax({
                         type: "POST",

                         url: '../Ajax/UpdateItemOrder.aspx?action=addsave',

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
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 24px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table style="width: 100%">
        <tr>
			<td class="TableTop">執行預算-拆數量</td>
		</tr>
        <tr>
			<td class="Table2C">
        <table style="width: 100%">
		    <tr>
		<td class="Table1">
                                變更次別</td>
            <td class="Table2CC">
                                    <asp:Label ID="LbVersion" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="Table1L" colspan="7">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="TableTop2" colspan="9">
                                上層工項(拆數量母項)</td>
		</tr>
		<tr>
		<td class="Table1">
                                項次</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="LbItemOrder" runat="server"></asp:Label>
            </td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2" colspan="5">
                                    <asp:Label ID="LbUPItemName" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="auto-style1">
                單位</td>
            <td class="auto-style2" colspan="2">
                                    <asp:Label ID="LbUPUnit" runat="server"  Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="auto-style1">
                合約數量</td>
            <td class="auto-style2">
                                    <asp:Label ID="LbCNumber" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
            <td class="auto-style1">
                                    執行數量</td>
            <td class="auto-style2">
                                     <asp:Label ID="LbENumber" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
            <td class="auto-style1">
                單價</td>
            <td class="auto-style2">
                                    <asp:Label ID="LbPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label> </td>
		</tr>
		<tr>
		<td class="TableTop2" colspan="9">
                                下層工項(拆數量子項)</td>
		</tr>
		<tr>
		<td class="Table2C" colspan="9">
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">&nbsp;</td>
                                        <td class="ShtCellCC">工項名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">數量</td>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                        <ItemTemplate>                                       
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" CommandName="Delete" CommandArgument='<%# Container.ItemIndex%>'/>
                                       <asp:ImageButton ID="ImgUP" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px"  Visible="false" CommandName="Up"  CommandArgument='<%# Container.ItemIndex%>'/>
                                    <asp:ImageButton ID="ImgDown" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px"  Visible="false" CommandName="Down"  CommandArgument='<%# Container.ItemIndex%>'/>
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TxItemName" runat="server" CssClass="TBlong" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                     <%--       <asp:DropDownList ID="DDLUnit" runat="server" CssClass="DDLfree" DataSource='<%# Utility.Unitlist.UnitList() %>' Text='<%# Bind("Unit") %>'>
                                                <asp:ListItem>-請選擇-</asp:ListItem>                                             
                                            </asp:DropDownList>--%>
                                            <asp:Label ID="DDLUnit" runat="server" Text='<%# Bind("Unit") %>'></asp:Label>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TxQuantity" runat="server" CssClass="TBshort" Text='<%# Bind("ENumber") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                             </ItemTemplate>
                                    </asp:Repeater>
                                  
                                </table>
            </td>
		</tr>
		<tr>
		<td class="Table2R" colspan="9">
                                    <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增子項" Width="27px"  OnClick="ImgAdd_Click"/>
                                            </td>
		</tr>
		</table>
            </td>
		</tr>
        <tr>
			<td class="Table1">
                    <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                                    <asp:Button ID="BtnDivide" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" OnClick="BtnDivide_Click" OnClientClick="showProgress()"/>
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" OnClientClick="window.close()" />
                                 </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="BtnDivide" />
                </Triggers>
                    </asp:UpdatePanel>        </td>
		</tr>
		    </table>
    
    </div>
    </form>
</body>
</html>
