<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubBudgetAddWBS.aspx.cs" Inherits="IMS.SubBudgetAddWBS"  MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <%--<link rel="stylesheet" type="text/css" href="../css/Style1.css" />--%>
    <link rel="stylesheet" type="text/css" href="../css/StyleSht.css" />
    <%--<link rel="stylesheet" type="text/css" href="../css/StyleSB.css" />--%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

<body>
      <style type="text/css">
         table {

    /*border: 1px solid #000000;*/ 
    border-collapse: collapse;

}   
  .Table101 {
            width: 100%;
           border-right-style:none;
            border-collapse:collapse;
        }
      
       .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
       .linebr { 
clear: both; /* 清除左右浮動 */ 
width: 400px; /* 必須定義寬度 */ 
word-break: break-word; /* 文本行的任意字內斷開 */ 
word-wrap: break-word; /* IE */ 
white-space: -moz-pre-wrap; /* Mozilla */ 
white-space: -hp-pre-wrap; /* HP printers */ 
white-space: -o-pre-wrap; /* Opera 7 */ 
white-space: -pre-wrap; /* Opera 4-6 */ 
white-space: pre; /* CSS2 */ 
white-space: pre-wrap; /* CSS 2.1 */ 
white-space: pre-line; /* CSS 3 (and 2.1 as well, actually) */ 
} 


      form{padding:0px; margin:0px;}
input{
	/* 用戶輸入框的樣式 */
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px; border:1px solid #000000;
	width:200px; padding:1px; margin:0px;
}
#popup{
	/* 提示框div塊的樣式 */
	position:absolute; width:202px;
	color:#004a7e; font-size:14px;
	font-family:Arial, Helvetica, sans-serif;
	left:39%; top:14%;
    background-color:#FFFFFF;
}
#popup.show{
	/* 顯示提示框的邊框 */	
	border:1px solid #004a7e;
}
#popup.hide{
	/* 隱藏提示框的邊框 */
	border:none;
}
/* 提示框的樣式風格 */
ul{
	list-style:none;
	margin:0px; padding:0px;
}
li.mouseOver{
	background-color:#004a7e;
	color:#FFFFFF;
}
li.mouseOut{
	background-color:#FFFFFF;
	color:#004a7e;
} 


.highlighted {
    background-color:yellow;
    
}
.emptyBlock1000 {
    height:1000px;
}
.emptyBlock2000 {
    height:2000px;
}

      .highlight {
    background-color: #FFFF88;
}
</style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <form id="form1" runat="server">
       <script>
         
          
           var IsPostBack = '<%=IsPostBack.ToString() %>';
           window.onload = function () {
               var strCook = document.cookie;
               if (strCook.indexOf("!~") != 0) {
                   var intS = strCook.indexOf("!~");
                   var intE = strCook.indexOf("~!");
                   var strPos = strCook.substring(intS + 2, intE);
                   if (IsPostBack == 'True') {
                       document.getElementById("<%=Pnl_WBS1.ClientID %>").scrollTop = strPos;
                 }
                 else {
                     document.cookie = "yPos=!~0~!";
                 }
             }
         }
         function SetDivPosition() {
             var intY = document.getElementById("<%=Pnl_WBS1.ClientID %>").scrollTop;
             //document.title = intY;
             document.cookie = "yPos=!~" + intY + "~!";
         }
       </script>  
    <script type="text/javascript">
     
     
        var q = parent.document.getElementById("searcher")
        var n = 0;
        var i = 0;
        function someFunction(data) {
          
            var a1 = data.getUserData;
            //上層搜尋框變更內容即把i=0(搜尋次數歸0)
            $(q).on('input', function (e) {
                i = 0;
            });
            var temp = new Array();
            temp = a1.split(",");
            var arr = new Array();
            var found = false;
            for (var id in temp) {
             
                var a2 = temp[id];

                var p = $("#task-" + a2);
              
                var offset = $("#task-" + a2).offset();
                arr.push(offset);
                offsetTop = offset.top;
            
                console.log(offsetTop);
              
                //$('html, body').animate({ scrollTop: $(p).offsetTop }, 'slow');               
                //var str = document.getElementById("searcher").value;
                //$("body ").highlight(str);
              
            }       
        
            while (i <= n) {
                found = true;
                if (found) {
                  
                    var offsets = arr[i];
                    ($('html, body').animate({ scrollTop: arr[i].top }, 200));
                }
                i += 1;
            }
      
                // If found, mark it and scroll it into view.
                if (found) {
                    var t = arr.length;
                    
                    if (n < t - 1) {
                        n++;
                    }
                  
                } else {
                    // Otherwise, start over at the top of the page and find first match.
                    if (n > 0) {
                        n = 0;
                        i = 0;
                        //someFunction(arr[n]);
                    }
                    // Not found anywhere, give message. else
                    alert("搜尋已經到底!!");
                
                }      
          
        }
    </script>
   
    <div>
        <asp:Panel ID="Pnl_WBS1" runat="server"  onscroll="SetDivPosition()"  Width="100%" Height="500"><%--ScrollBars="Vertical"  ScrollBars="Vertical" onscroll="SetDivPosition()" Visible="False"--%>
           
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>                       
                                     
                                    <table class="Table100" style="width:100%" >                                        
                                       
                                        </tr>
                                            <tr>
                                                <td class="Sht50" style="width:100%" valign="top">
                                                    <table id="scroll" border="1" class="Sht100" style="width:100%;">
                                                        <tr class="ShtRowTop">
                                                            <td colspan="<%=LbLayerNum %>" style="width:10%">項次</td>
                                                            <td style="width:20%">工項名稱</td>
                                                            <td style="width:5%">單位</td>
                                                            <td style="width:5%">執行數量</td>
                                                            <td style="width:5%">預算單價</td>
                                                            <td style="width:5%">剩餘數量</td>
                                                            <td style="width:10%">分包數量</td>
                                                            <td style="width:5%">
                                                                <asp:ImageButton ID="ImgSubRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" OnClick="ImgSubRItem_Click" ToolTip="加入分包工項" Width="30px" />
                                                                &nbsp;</td>
                                                        </tr>
                                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                                            <ItemTemplate>
                                                                <tr id='task-<%# DataBinder.Eval(Container.DataItem, "Ewid") %>' class="ShtRowSingle">
                                                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                                    <td id="box" class="ShtCellCL" style="width:20%">
                                                                        <asp:Label ID="LbItemOrder" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                                                        <asp:Label ID="Lbwid" runat="server" Font-Names="微軟正黑體" Height="25px" visible="false"></asp:Label>
                                                                        <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px"></asp:Label>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:5%">
                                                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:5%">
                                                                        <asp:Label ID="LbENum" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:5%">
                                                                        <asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:5%">
                                                                        <asp:Label ID="LbLastSubNumber" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:20%">
                                                                        <asp:TextBox ID="LbSubNum" runat="server" AutoPostBack="true" Font-Names="微軟正黑體" OnTextChanged="LbSubNum_TextChanged" Width="70%"></asp:TextBox>
                                                                    </td>
                                                                    <td class="ShtCellCC" style="width:5%">
                                                                        <asp:CheckBox ID="checkSub" runat="server" OnCheckedChanged="check_CheckedChanged" />
                                                                        <%--<asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>' />--%><%--<asp:ImageButton ID="ImgSubC" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>'/>
                                                          <asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" CommandName="SelectResource" CommandArgument='<%# Container.ItemIndex%>' OnClick="ImageButton25_Click" />--%></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </table>
                                                </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
    </div>
</form>
</body>
</html>
