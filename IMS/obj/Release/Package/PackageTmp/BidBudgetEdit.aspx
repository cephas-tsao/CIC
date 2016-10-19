<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidBudgetEdit.aspx.cs" Inherits="IMS.BidBudgetEdit" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <body>
    <title>專案管理模組-投標預算檢視</title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <script type="text/javascript" src="js/jquery.treegrid.js"></script>
<link rel="stylesheet" href="./css/jquery.treegrid.css">                 
     <script type="text/javascript">        
         //隱藏TR
         function hide_tr() {
             //alert("缺漏項即將隱藏");
             var str = "<%= ShowString %>";
            var k = str.split(",");//k不指定型態
            for (var i = 0; i < k.length; i++) {
                var result_style = document.getElementById(k[i]).style;
                //result_style.display = 'TableDouble';
                result_style.display = 'none';
                //document.getElementById(k[i]).className = "TableSingle";
            }
        }
        //顯示TR
        function show_tr() {

            var str = "<%= ShowString %>";
            var k = str.split(",");//k不指定型態

            for (var i = 0; i < k.length; i++) {

                var result_style = document.getElementById(k[i]).style;
                result_style.display = 'table-row';
                document.getElementById(k[i]).className = "TableNew";
            }
        }

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
  
   <%--  <script type="text/javascript">
         $(document).ready(function () {
             $('.tree').treegrid({
                 onChange: function () {
                     alert("Changed: " + $(this).attr("id"));
                 },
                 onCollapse: function () {
                     alert("Collapsed: " + $(this).attr("id"));
                 },
                 onExpand: function () {
                     alert("Expanded " + $(this).attr("id"));
                 }
             });
             $('#node-1').on("change", function () {
                 alert("Event from " + $(this).attr("id"));
             });
         });
    </script>--%>

    <style type="text/css">
           .auto-style85 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
        }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
            }



            .auto-style6 {
	font-size: small;
	color: #FF0000;
}
        
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
        .auto-styleB {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
        .auto-styleA {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 30px;
        }
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: right;
                color: #000000;
                height: 33px;
            }
          /*.Table2 {
            width: 85%;
            padding-left:200px;
            border-collapse:collapse;
        }   


        .Table1 {
            width: 100%;

            border-collapse:collapse;
        }*/
/*.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}*/
        .auto-style46 {
            width: 37px;
            }
        


        .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
        .autoRight{
           text-align:center;
        }
                


        .autoLeft{
        text-align:left;
           height:100%;
           line-height:100%;          
           vertical-align:middle;
           padding-left:5px;            
        }
        .auto-style83 {
	height: 28px;
	text-align: center;
}
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style79 {
            height: 28px;
        }
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

        .auto-style77 {
            height: 39px;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
}
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

        .auto-style54 {
            width: 33px;
        }
        .auto-style84 {
	width: 37px;
	text-align: center;
}
            .autoRight{
           text-align:right;
        }
        
        .auto-style43 {
            width: 37px;
        }
                

            .auto-style88 {
            width: 3px;
            height: 39px;
        }
        .auto-style89 {
            width: 37px;
            text-align: center;
            height: 39px;
        }
            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
            .auto-style91 {
            width: 45px;
        }
        .auto-style92 {
            height: 28px;
            text-align: center;
            width: 45px;
        }
        .auto-style93 {
            height: 39px;
            text-align: center;
            width: 45px;
        }
        .autoCenter {
            text-align: center;
        }
            .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
            .autoRight{
           text-align:right;
        }
        
        .autoRight{
           text-align:center;
        }
                


            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
            </style>


    <div>
      <Area:MemberBoxUC ID="MemberBox" runat="server" />         
        <table class="Table100" style="width: 100%;border-color:transparent" border="1">
            <tr>
                <td class="TableTop" colspan="8">投標預算建置編修</td>
            </tr>
            <tr>
                <td class="Table0" colspan="8">工項編修/數量填列校核</td><%--window.open('BidItemAdd.aspx', 'window', config='height=400,width=1000');--%>
            </tr>
              <tr>
                <td class="TableFun1C">原標單總價</td>
                <td class="TableFun2C">
                <asp:Label ID="LbOTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" CssClass="TableFun3" ></asp:Label>
                                </td>
                <td class="TableFun1C">校核後總價</td>
                <td class="TableFun2C">
                <asp:Label ID="LbCTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
                                </td>
                <td class="TableFun1C">投標預算總價</td>
                <td class="TableFun2C">
                <asp:Label ID="LbBTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
                      <asp:Label ID="LbATotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體"  Visible="false"></asp:Label>
                                </td>
                    <td width="80px" class="TableFun1C">選擇標案</td>
                <td width="300px" class="TableFun2C">
		<asp:DropDownList id="DDL_BidSelect" runat="server" CssClass="DDLfree" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged">
		</asp:DropDownList>
                                </td>
            </tr>
            </table>
               <table class="Table100" style="width: 100%;padding-left:200px">
            <tr>
                <td class="TableFun1L">&nbsp;
                                    <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/Layer.png" ToolTip="階層及編號設定" Width="27px"  OnClientClick="window.open('BidLayerSet.aspx', 'window', config='height=500,width=1500');"/>
                                &nbsp;
                                    <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px"    OnClientClick="window.open('BidItemAdd.aspx', 'window', config='height=500,width=1500');"/>
                                &nbsp;  
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px"  OnClick="IBtn_PriceFill_Click"/>
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton197" runat="server" Height="30px" ImageUrl="~/img/Enter.jpg" ToolTip="插補缺漏項" Width="27px" OnClick="ImageButton197_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="Display" runat="server" Height="30px" ImageUrl="~/img/UnSee.png" ToolTip="顯示缺漏項(目前隱藏)" Width="27px" Text="顯示缺漏項" OnClick="Display_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton214" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="投標預算重新總計" Width="27px" OnClick="ImageButton214_Click" />
                     <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonDel" runat="server" OnClick="LinkButtonDel_Click"></asp:LinkButton>
                                </td>
                <td class="TableFun1R">
                                    <asp:ImageButton ID="ImgSave" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="ImgSave_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="ImgRecovery" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="ImgRecovery_Click" />
                                &nbsp;
                                <asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click" />
                                &nbsp;
                                <asp:ImageButton ID="ImgPdf" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPdf_Click" />
                                    &nbsp;&nbsp;
                                </td>
         
            </tr>
            <tr>
                <td class="TableFun1L" colspan="2">選擇顯示階層：<asp:DropDownList ID="DDL_LayerSelect" runat="server" AutoPostBack="True" CssClass="DDLshort" OnSelectedIndexChanged="DDL_LayerSelect_SelectedIndexChanged">
                  <asp:ListItem Value="0" Selected="True">請選擇</asp:ListItem>              
                    </asp:DropDownList>
                                </td>
         
            </tr>
        </table>
    
    </div>
     <asp:Panel ID="Pnl_ALL" runat="server" Visible="False" CssClass="Table2">
                        <table id="BidBudget" class="tree" style="width: 100%;" border="1" >
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2">工項<br />
                                    編輯</td>
                                <td class="ShtCellCC" colspan="<%=LbLayerNum %>" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" rowspan="2">單價<br />
                                    分析</td>
                                <td class="ShtCellCC" colspan="3">原標單</td>
                                <td class="ShtCellCC" colspan="2">校核後</td>
                                <td class="ShtCellCC" colspan="3">投標預算</td>
                                <td class="ShtCellCC" rowspan="2">備註</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                            </tr>
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                  
                        </table>
    </asp:Panel>
        <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>

       <script type="text/javascript" src="../js/jquery.treegrid.min.js"></script>
        <script type="text/javascript">
            $('.tree').treegrid();
        </script>  
    
      <script>
          function Select(i) {
              $('.tree').find('tr').each(function () {
               
                  if (i == 1) {
                      $('.tree').treegrid('getRootNodes').treegrid('collapseAll');
                  }
                  else {
                  
                      var a = $(this).attr("id");
                      if (a != null) {
                          var b = $(this).treegrid('getParentNode');
                          var c = $(this).treegrid('getDepth');
                          //$(this).treegrid('getParentNode').treegrid('collapse');
                          if ($(this).treegrid('getDepth') >= i-1) {
                              $(this).treegrid('collapse');
                          }
                      }                    
                  }               
              });
          }
    </script>  
</body>
    </asp:Content>
