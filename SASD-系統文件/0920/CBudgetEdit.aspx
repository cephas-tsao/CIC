<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="CBudgetEdit.aspx.cs" Inherits="IMS.CBudgetEdit" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/CBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <body>
    <title>合約預算模組-合約預算建置編修</title>
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
      <%--<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>--%>
      <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
       <link rel="stylesheet" href="CSS/Jquery-ui.theme.css" />
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
    <script type="text/javascript">
        function UpdtItemOrder() {

            $.ajax({
                type: "POST",

                url: '../Ajax/UpdateCBItemOrder.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function addLayerCode() {

                    $.ajax({
                        type: "POST",

                        url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                        //data: { "uid": uid },

                        dataType: 'text',
                        success: function (msg) {

                            alert("項次更新成功");


                        }

                    })

                }

            })
        }

        function addLayerCode() {

            $.ajax({
                type: "POST",

                url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function (msg) {

                    alert("階層碼更新成功");


                }

            })

        }

    </script>
     <script>
         (function ($) {
             $.widget("custom.combobox", {
                 _create: function () {
                     this.wrapper = $("<span>")
                       .addClass("custom-combobox")
                       .insertAfter(this.element);

                     this.element.hide();
                     this._createAutocomplete();
                     this._createShowAllButton();
                 },

                 _createAutocomplete: function () {
                     var selected = this.element.children(":selected"),
                       value = selected.val() ? selected.text() : "";

                     this.input = $("<input>")
                       .appendTo(this.wrapper)
                       .val(value)
                       .attr("title", "")
                       .addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left")
                       .autocomplete({
                           delay: 0,
                           minLength: 0,
                           source: $.proxy(this, "_source")
                       })
                       .tooltip({
                           tooltipClass: "ui-state-highlight"
                       });

                     this._on(this.input, {
                         autocompleteselect: function (event, ui) {
                             ui.item.option.selected = true;
                             this._trigger("select", event, {
                                 item: ui.item.option
                             });
                         },

                         autocompletechange: "_removeIfInvalid"
                     });
                 },

                 _createShowAllButton: function () {
                     var input = this.input,
                       wasOpen = false;

                     $("<a>")
                       .attr("tabIndex", -1)
                       .attr("title", "Show All Items")
                       .tooltip()
                       .appendTo(this.wrapper)
                       .button({
                           icons: {
                               primary: "ui-icon-triangle-1-s"
                           },
                           text: false
                       })
                       .removeClass("ui-corner-all")
                       .addClass("custom-combobox-toggle ui-corner-right")
                       .mousedown(function () {
                           wasOpen = input.autocomplete("widget").is(":visible");
                       })
                       .click(function () {
                           input.focus();

                           // Close if already visible
                           if (wasOpen) {
                               return;
                           }

                           // Pass empty string as value to search for, displaying all results
                           input.autocomplete("search", "");
                       });
                 },

                 _source: function (request, response) {
                     var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                     response(this.element.children("option").map(function () {
                         var text = $(this).text();
                         if (this.value && (!request.term || matcher.test(text)))
                             return {
                                 label: text,
                                 value: text,
                                 option: this
                             };
                     }));
                 },

                 _removeIfInvalid: function (event, ui) {

                     // Selected an item, nothing to do
                     if (ui.item) {
                         return;
                     }

                     // Search for a match (case-insensitive)
                     var value = this.input.val(),
                       valueLowerCase = value.toLowerCase(),
                       valid = false;
                     this.element.children("option").each(function () {
                         if ($(this).text().toLowerCase() === valueLowerCase) {
                             this.selected = valid = true;
                             return false;
                         }
                     });

                     // Found a match, nothing to do
                     if (valid) {
                         return;
                     }

                     // Remove invalid value
                     this.input
                       .val("")
                       .attr("title", value + " didn't match any item")
                       .tooltip("open");
                     this.element.val("");
                     this._delay(function () {
                         this.input.tooltip("close").attr("title", "");
                     }, 2500);
                     this.input.autocomplete("instance").term = "";
                 },

                 _destroy: function () {
                     this.wrapper.remove();
                     this.element.show();
                 }
             });
         })(jQuery);

         $(function () {
             $("#combobox").combobox();
             $("#toggle").click(function () {
                 $("#combobox").toggle();
             });
         });
    </script>
      <script>
          $(function () {
              var availableTags = [<%=DAL.WebModel.Get_Item_List(Session["DatabaseName"].ToString()) %>];
              $("#TxItemName").autocomplete({
                  source: availableTags
              }).bind("input.autocomplete", function () {
                  $(this).autocomplete("search", this.value);
              });
          });

      </script>
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("該階層有項目，是否刪除?")) {

                confirm_value.value = "Yes";

            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);

        }
    </script>

   <style type="text/css">


          .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        
        } 
          .autoLeft{
            text-align:left;
           height:100%;
           line-height:100%;          
           vertical-align:middle;
           padding-left:5px;        
        }

            </style>

   <%-- <head runat="server">--%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
    


    <div>
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="4">合約預算建置編修</td>
		</tr>
        <tr>
			<td class="Table0" colspan="4">工項編修/數量填列</td>
		</tr>
        <tr>
                <td class="TableFun1L">&nbsp;
                                    <asp:ImageButton ID="IBtn_Import" runat="server" Height="30px" ImageUrl="~/img/import.jpg" ToolTip="匯入合約預算" Width="27px" OnClick="ImageButton175_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_LayerSet" runat="server" Height="30px" ImageUrl="~/img/Layer.png" ToolTip="階層及編號設定" Width="27px"  OnClick="ImageButton178_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_AddNewItem" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" OnClientClick="window.open('CItemAdd.aspx', 'window', config='height=300,width=1200');" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px" PostBackUrl="~/CResourceList.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_Caculate" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="總價調整" Width="27px" OnClick="ImageButton214_Click" />
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" OnClick="IBtn_Lock_Click" ImageUrl="~/img/UnLock.jpg" ToolTip="預算尚未鎖定(點選鎖定預算)" OnClientClick="return confirm('確認要鎖定嗎?(鎖定後原工項不能刪增，須以預算變更處理!');" />
                     <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonDel" runat="server" OnClick="LinkButtonDel_Click"></asp:LinkButton>
                                </td>
                <td class="TableFun1C">合約預算總價</td>
                <td class="TableFun2C">
                                    <asp:Label ID="LbSum" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
                                </td>
                <td class="TableFun1R">
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="IBtn_Save_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_Reload" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px"  OnClick="IBtn_Reload_Click"/>
                                &nbsp;
                                <asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click" />
                                &nbsp;
                                <asp:ImageButton ID="ImgPDF" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPDF_Click" />
                                    &nbsp;&nbsp;
                                </td>
            </tr>
            
        <tr>
                <td class="TableFun1L" colspan="4">選擇顯示階層：<asp:DropDownList ID="DDL_LayerSelect" runat="server" AutoPostBack="True" CssClass="DDLshort">
                    <asp:ListItem Value="3">3(ALL)</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    </asp:DropDownList>
                                </td>
            </tr>
            
                        </table>
                        
                        <table class="Sht100"><%--class="Sht100"--%>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2" style="width: 65px">工項<br />
                                    編輯</td>
                                <td class="ShtCellCC" colspan="<%=LbLayerNum %>" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" rowspan="2">單價分析</td>
                                <td class="ShtCellCC" colspan="3">合約預算</td>
                                <td class="ShtCellCC" rowspan="2">備註</td>
                             <%--   <td class="ShtCellCC" rowspan="2">&nbsp;</td>--%>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                            </tr>
                               <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                      
                        </table>   
    </div>

</body>




    </asp:Content>