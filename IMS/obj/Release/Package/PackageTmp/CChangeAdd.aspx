<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CChangeAdd.aspx.cs"  MaintainScrollPositionOnPostback="true"  Inherits="IMS.CChangeAdd" %>

<!DOCTYPE html>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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
         //function ShowLoading(e) {
         //    // var divBg = document.createElement('div');
         //    //var divBg = document.getElementById('blockScreen');
         //    //var divLoad = document.createElement('div');
         //    //var img = document.createElement('img');

         //    //img.src = 'images/ajax-loader.gif';
         //    //divLoad.setAttribute("class", "blockScreenLoader");
         //    //divLoad.appendChild(img);

         //    //divBg.appendChild(divLoad);

         //    //document.getElementById('blockScreen').style.display = 'block';
         //    var loading = $("#LoadingImage");
         //    $('#LoadingImage').show();
         //    loading.show();
         //    // These 2 lines cancel form submission, so only use if needed.
         //    //window.event.cancelBubble= true;
         //    //e.stopPropagation();
         //}

         //$.ajaxSetup({ async: false }); // 重點在這段 加了這段 就會變成 同步型的 AJAX
         window.onbeforeunload = myunload;
         //$(document).ajaxStart(function () {
         //    $("#LoadingImage").css("display", "block");
         //});
         //$(document).ajaxComplete(function () {
         //    $("#LoadingImage").css("display", "none");
         //});
         var succeed = false;
         function myunload()
         {
             if (succeed==true)
             {
                 window.event.returnValue = "更新尚未完成，是否離開?";//關閉時,彈出視窗的訊息
             }
         }
     
         //var loading = $("#LoadingImage");
         //$().ready(function () {
         //    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(
         //                              showProgress);
         //    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(
         //                              App.ProgressIndicator.Hide);
         //});
         function addLayerCode() {
             succeed = true;
             //loading.show();
             //showProgress();
             //$('#LoadingImage').show();  // show the loading message.
             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },
                 beforeSend:  function showProgress() {
                     var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                     updateProgress.style.display = "block";
                 },
                 complete:function hideProgress() {
                     var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                     updateProgress.style.display = "none";
                 },
                 dataType: 'text',

                 success: function (UpdtItemOrder) {

                     $.ajax({
                         type: "POST",

                         url: '../Ajax/UpdateCBItemOrder.aspx?action=addsave',

                         //data: { "uid": uid },

                         dataType: 'text',

                         success: function (msg) {
                             //$('#LoadingImage').hide();
                             //loading.hide();
                             alert("更新成功");
                             succeed = false;
                           
                         }
                     })
                   
                 }
             })
         }

    </script>
    <style type="text/css">
        
      
        .TableTop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
            height: 30px;
        }
    
        .Table2CC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align:central;
        }
        
        .BtnFree {
            font-size:medium;
            font-family:微軟正黑體;
            height:30px;
        }
        .Table2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: right;
            color: #000000;
            vertical-align:top;
        }
      
        .DDLshort {
            font-size:medium;
            font-family:微軟正黑體;
            width:150px;
            height:25px;
        }
        .TB500 {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:500px;
        }
        

        .TBshort {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:75px;
        }
        .TBmiddle {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:150px;
            }
        .BtnLargeMedium {
            font-size:medium;
            font-family:微軟正黑體;
            height:35px;
            width:150px;
        }
                    
        .auto-style5 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            }
         .pleaseWait { 
             /*width: 50%; 
             height: 100px;*/ 
             background-color: #696969; 
             display: none; 
             z-index:999; 
             position:absolute; 
             left:45%; 
             top:55%;
                /*filter: alpha(opacity=40);
                opacity: 0.7;*/
      /*background-color: #696969;
filter: alpha(opacity=40);
opacity: 0.7;
xindex:-1;*/
         }               


        </style>
</head>
<body >
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <table class="Table100">
        <tr>
		<td class="TableTop">合約預算變更-新增工項</td>
		</tr>
		</table>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
            <table style="width: 100%">
                <tr>
                <td class="Table0" width="25%">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="White">執行預算變更新增工項列表</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_ExeAdd" runat="server" Visible="False">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="EWID" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" 
                    OnRowDataBound="GridView1_RowDataBound" Width="100%" PageSize="10" AllowPaging="true">
                    <HeaderStyle CssClass="Table1" />
                    <RowStyle CssClass="Table2" />
                    <Columns>
                           <asp:TemplateField  ShowHeader="False" >
                    <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Medium" Text="引用" CommandArgument='<%# Container.DataItemIndex%>' />                                                                        
                    </ItemTemplate>
                </asp:TemplateField>                       
                        <asp:TemplateField HeaderText="項次">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ItemOrder" Text='<%# Eval("ItemOrder") %>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:TemplateField HeaderText="名稱">
                            <ItemStyle CssClass="auto-style3" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ItemName" Text='<%# Eval("ItemName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                    
                          <asp:TemplateField HeaderText="單位">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Unit" Text='<%# Eval("Unit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="工項類型">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ItemKind" Text='<%# Eval("ItemKind") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="執行數量">
                          <ItemTemplate>
                              <asp:Label runat="server" ID="EQuantity" Text='<%# Eval("ENumber") %>' ></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                        <asp:TemplateField HeaderText="備註">
                           <ItemTemplate>
                               <asp:Label runat="server" ID="Notes" Text='<%# Eval("Notes") %>'></asp:Label>
                           </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                     <PagerStyle BackColor="#C6C3C6"  HorizontalAlign="center" />
                </asp:GridView>
          
        </asp:Panel>
       
        
    <table class="Table100">
                        <tr>
                            <td class="Table0" colspan="8">新增合約預算工項</td>
                        </tr>
                        <tr>
                            <td class="Table1">變更次別</td>
                            <td class="Table2" colspan="3">
                  <asp:Label ID="LbEdition" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
                            </td>
                            <td class="Table1">階層</td>
                            <td class="Table2">
                            <asp:DropDownList ID="DDLLayer" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DDLLayer_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                            <td class="Table1">上層工項</td>
                            <td class="Table2">
                                 <asp:DropDownList ID="DDLTop" runat="server" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DDLTop_SelectedIndexChanged">                                                    
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
                               <asp:DropDownList ID="DDL_ItemKind" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">工項名稱</td>
                            <td class="Table2" colspan="3">
                                  <asp:TextBox ID="TxItemName" runat="server" Font-Size="Medium" Height="25px" Width="500px" AutoPostBack="true" OnTextChanged="TxItemName_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">單位</td>
                            <td class="Table2">
                                   <asp:DropDownList ID="DDL_Unit" runat="server" Font-Size="Medium" Height="30px" Width="155px" DataSource='<%# Utility.Unitlist.UnitList() %>'>
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">
                                數量</td>
                            <td class="Table2">
                                <asp:TextBox ID="TxQuantity" runat="server" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="true" OnTextChanged="TxItemName_TextChanged"></asp:TextBox>
                            </td>
                            <td class="Table1">備註</td>
                            <td class="Table2">
                                <asp:TextBox ID="TxNotes" runat="server" CssClass="TBmiddle"></asp:TextBox>
                            </td>
                      <td class="Table1" colspan="2">
                                      <%--    <asp:Button ID="Button2" runat="server" Text="設定工料連結" OnClick="Button17_Click" CssClass="BtnFree" />--%>
                            </td>
                        </tr>
          <tr>  <td class="Table1">工料名稱</td><td class="auto-style3">   <asp:Label ID="ReItemName" runat="server" Font-Size="Medium" Height="25px" Width="500px"></asp:Label></td>
                             <td class="Table1" colspan="6">
                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="設定工料連結" OnClick="Button17_Click" />
                                    <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
                            </td></tr>
                            
                                   <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
  
                
                      <tr>
                            <td class="Table1">責任歸屬</td>
                            <td class="Table2" colspan="3">
                <asp:DropDownList ID="DDLResponse" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    <asp:ListItem>業主變更及要求</asp:ListItem>
                    <asp:ListItem>投標自算與預算編列因素</asp:ListItem>
                    <asp:ListItem>設計圖面的衝突</asp:ListItem>
                    <asp:ListItem>工地需求、施工因素及工法變更</asp:ListItem>
                    <asp:ListItem>拆工料、單價、單位及發包方式變更</asp:ListItem>
                    <asp:ListItem>應扣包商款項</asp:ListItem>
                    <asp:ListItem>天然災害</asp:ListItem>
                </asp:DropDownList>
                            </td>
                            <td class="Table1">原因</td>
                            <td class="Table2" colspan="3">
                <asp:DropDownList ID="DDLReason" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    <asp:ListItem>原預算未列</asp:ListItem>
                    <asp:ListItem>規格改變</asp:ListItem>
                    <asp:ListItem>用量增減</asp:ListItem>
                    <asp:ListItem>客戶變更</asp:ListItem>
                    <asp:ListItem>其他</asp:ListItem>
                </asp:DropDownList>
                            </td>
                        </tr>
                        </table>
        <table style="width: 100%">
		<tr>
		 <td class="Table1" colspan="8">
  <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                     <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增" OnClick="BtnSave_Click" OnClientClick="showProgress()"  />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="返回前頁" OnClientClick="window.close()" />
                    </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="BtnSave" />
                </Triggers>
                    </asp:UpdatePanel>
                                   
                                </td>
		</tr>
		</table>
     

    </form>
</body>
</html>
