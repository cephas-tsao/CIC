<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubBudgetAddRes.aspx.cs" Inherits="IMS.SubBudgetAddRes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
      <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSB.css" />
<body>
    <style>
        table {

    /*border: 1px solid #000000;*/ 
    border-collapse: collapse;

}

    </style>
    <form id="form1" runat="server">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
           <script type="text/javascript">

               var n = 0;
               var i = 0;
               var q = parent.document.getElementById("Researcher")
               function someFunction(data) {
                   $(q).on('input', function (e) {
                       i = 0;
                   });
                   var a1 = data.getReData;
                   if (a1.IsPostBack) {
                       alert('change');

                   }
                   var temp = new Array();
                   temp = a1.split(",");
                   var arr = new Array();
                   var found = false;
                   for (var id in temp) {

                       var a2 = temp[id];
                       //var A = trID.uniqueID;
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
     <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                <asp:Panel ID="Pnl_Resource" runat="server"   Height="1000"><%--Visible="False"ScrollBars="Vertical"--%>
                                    <table class="Table100">
                                        <tr >
                                            <td class="Sht50" valign="top">
                                                <table class="Sht100" border="1" >
                                                    <tr class="ShtRowTop">                                                   
                                                        <td class="ShtCellCC">資源名稱</td>
                                                        <td class="ShtCellCC">單位</td>
                                                        <td class="ShtCellCC">&nbsp;</td>
                                                    </tr>
                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand" ClientIDMode = "Static">
                                                        <ItemTemplate>                                                                                                                                                              
                                                    <tr class="ShtRowSingle"  id="trID" runat="server"  style="border-width:thin" >                                                                                                   
                                                        <td class="ShtCellCL">                                                              
                                                              <asp:Label ID="LbResourceCode" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "ResourceCode") %>' Visible="false"></asp:Label>
                                                             <asp:Label ID="LbEAmount" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                            <asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                            <asp:Label ID="LbEWID" runat="server" Font-Names="微軟正黑體" Height="25px" visible="false" ></asp:Label>
                                                            <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px"  Visible="false"></asp:Label>
                                                            <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                     
                                                        </td>
                                                        <td class="ShtCellCC">
                                                            <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                                        </td>
                                                        <td class="ShtCellCC">
                                                               
                                                            <%--<asp:ImageButton ID="ImgRiSub" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全資源分包" Width="30px" CommandName="SelectAllRi"  CommandArgument='<%# Container.ItemIndex%>' />--%>
                                                            <asp:ImageButton ID="ImgPList" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視父項列表" Width="30px" CommandName="SelectFList"  CommandArgument='<%# Container.ItemIndex%>' />
                                                        </td>
                                                          
                                                    </tr>
                                                           
                                                                </ItemTemplate>
                                                    </asp:Repeater>
                                                 
                                                </table>
                                            </td>
                                            <td width="50%" valign="top">
                                                <asp:Panel ID="Pnl_SourceList" runat="server" Visible="False">
                                                    <table class="SB_Table_A" style="border-color:white" border="1">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">資源名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="LbEwid" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                               <%-- <asp:Label ID="LbItemOrder" runat="server" Font-Names="微軟正黑體" Height="25px"  Visible="false"></asp:Label>--%>
                                                                <asp:Label ID="LbRiItemName1" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbRiUnit1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">總工程用量</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbRiAmount" runat="server" ></asp:Label></td>
                                                            <td class="SB_Cell0C_A">預算單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="EUnitPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A" colspan="2">
                                                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" AutoPostBack="true" >
                                                                    <asp:ListItem Value="1" >全資源分包</asp:ListItem>
                                                                    <asp:ListItem Value="2">部分資源分包</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server"></asp:SqlDataSource>
                                                    <table class="SB_Table_A" style="border-color:white" border="1">
                                                        <tr><td class="SB_Cell0C_A">&nbsp;</td>
                                                            
                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                        </tr>
                                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource8" OnItemDataBound="Repeater6_ItemDataBound">
                                                            <ItemTemplate>                                                        
                                                        <tr id="trID" runat="server">
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox11" runat="server"  OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                  <%--<asp:Label ID="LbBKID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>'></asp:Label>--%>
                                                                <asp:Label ID="LbEwid" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "EWID") %>' Visible="false"></asp:Label>
                                                              
                                                                <asp:Label ID="LbItemOrder" runat="server" Font-Size="Medium" Height="25px" Width="60px" ></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbItemAmount" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ENumber") %>'></asp:Label></td>
                                                            <td class="SB_Cell1R_A">
                                                              <%--    <asp:Label ID="LbUsed" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ENumber") %>'></asp:Label></td>--%>
                                                                <asp:Label ID="LbRemain" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "LastSubNumber") %>'></asp:Label></td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                            </tr>
                                                                </ItemTemplate>
                                                        </asp:Repeater>                                                        
                                                        
                                                        
                                                       
                                                    </table>
                                                    <div style="text-align:center">
                                                    <asp:Button ID="BtnSaveSub" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="存入分包工料" OnClick="BtnSaveSub_Click" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="BtnClearSubList" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnClearSubList_Click" />
                                                        </div>
                                                </asp:Panel>
                                         
                                             
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
    </div>
    </form>
</body>
</html>
