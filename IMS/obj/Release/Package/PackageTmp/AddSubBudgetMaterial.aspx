<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSubBudgetMaterial.aspx.cs" Inherits="IMS.AddSubBudgetMaterial" %>


<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSB.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            }
        .auto-style2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: right;
            color: #000000;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }
            
        .auto-style4 {
            width: 100%;
        }
            

        
        .Table1 {
            width: 100%;
            border:solid;
            border-collapse:collapse;
        }
        .TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E0E0E0;
	text-align: center;
	color: #000000;
}
                


            .auto-style342 {
            height: 43px;
        }
                                        

        
            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
                        


        .autoLeft{
           text-align:left;
        }
        .auto-style83 {
	height: 28px;
	text-align: center;
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
                        

            .auto-style97 {
            width: 3px;
            height: 35px;
        }
        .auto-style98 {
            text-align: center;
            height: 35px;
        }
        .auto-style99 {
            text-align: left;
            height: 35px;
        }
                            
        .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         

        .auto-style55 {
            text-align:center;
        }
                                

        .auto-style54 {
            width: 33px;
        }
        .autoCenter {
            text-align: center;
        }
                                
        

            .autoRight{
           text-align:right;
        }
        
        

            .autoRight{
           text-align:center;
        }
                


            .auto-style88 {
            width: 3px;
            height: 39px;
        }
            .auto-style91 {
            width: 3px;
            height: 33px;
        }
        .auto-style92 {
            height: 33px;
        }
        .auto-style93 {
            text-align: left;
            height: 33px;
        }
        .auto-style94 {
            text-align: center;
            height: 33px;
        }
                            

        
        .Table3 {
            width: 100%;
            border-top:solid;
            border-left:solid;
            border-right:solid;
            border-collapse:collapse;
        }
                            

        
        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
        .auto-style34 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 35px;
        }
            .auto-style34 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}
            .auto-style74 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
                                                

        
        .auto-style345 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: right;
	color: #000000;
	height: 35px;
	background-color: #E8FFC4;
}
        .Table2 {
            width: 100%;
            border-bottom:solid;
            border-left:solid;
            border-right:solid;
        }
            .auto-style34A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 35px;
        }
            .auto-style34A {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: center;
	color: #000000;
}
        .auto-style341A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFFCE;
            text-align: center;
            color: #000000;
            height: 35px;
        }
        .auto-style341 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFFCE;
	text-align: left;
	color: #000000;
}
        .auto-style346 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFFCE;
	text-align: right;
	color: #000000;
	height: 35px;
}
                                        

        
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: left;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
                                

        
        .auto-style344 {
            text-align: center;
            height: 23px;
        }
                                        
    .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
        

        </style>
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



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>    
                                                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                                    <asp:ListItem onclick ="showProgress();">依執行預算工作項目選擇</asp:ListItem>
                                                                    <asp:ListItem onclick ="showProgress();">依執行預算資源項目選擇</asp:ListItem>
                                                                </asp:RadioButtonList>
                            </ContentTemplate>
               <Triggers>
                <asp:PostBackTrigger ControlID="RadioButtonList2" />
                </Triggers>
                    </asp:UpdatePanel>
                                                            </td>
                <td class="auto-style2R">
                                                                                    <asp:Button ID="BtnBack" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="返回前頁" OnClick="BtnBack_Click" />
                                                            </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                                                <asp:Panel ID="Pnl_WBS" runat="server" Visible="False">
                                                                   <table class="Sht100"  >
                                                    <tr class="ShtRowTop">
                                                        <td colspan="<%=LbLayerNum %>">項次</td>
                                                        <td >工項名稱</td>
                                                        <td >單位</td>
                                                        <td class="ShtCellCC">執行數量</td>
                                                        <td class="ShtCellCC">預算單價</td>
                                                        <td class="ShtCellCC">剩餘數量</td>
                                                        <td class="ShtCellCC">分包數量</td>
                                                        <td >&nbsp;</td>
                                                    </tr>
                                                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                                <tr class="ShtRowSingle" style="border:none">                                               
                                                              <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                        <td class="ShtCellCL">
                                                            <asp:Label ID="LbItemOrder" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                                            <asp:Label ID="Lbwid" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                                            <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px"></asp:Label>
                                                        </td>
                                                         <td class="ShtCellCC"><asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC"><asp:Label ID="LbENum" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC"><asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC"><asp:Label ID="LbLastSubNumber" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                           <td class="ShtCellCC"><asp:Textbox ID="LbSubNum" runat="server" Font-Names="微軟正黑體" ></asp:Textbox></td>
                                                        <td class="ShtCellCC">
                                                                <asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>' />
                                                            <%--<asp:ImageButton ID="ImgSubC" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>'/>
                                                          <asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" CommandName="SelectResource" CommandArgument='<%# Container.ItemIndex%>' OnClick="ImageButton25_Click" />--%>
                                                        </td>
                                                    </tr>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                   
                                                                                
                                                                                </table>
                                                                            </td>
                                                     <%--                       <td valign="top" width="50%">
                                                                                <asp:Panel ID="Pnl_Analysis" runat="server" Visible="False">
                                                                                    <table class="Table3">
                                                                                        <tr>
                                                                                            <td class="auto-style33">工項名稱</td>
                                                                                            <td class="auto-style34">
                                                                                                <asp:Label ID="LbWItemName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                                                </td>
                                                                                            <td class="auto-style33">單位</td>
                                                                                            <td class="auto-style74">
                                                                                                <asp:Label ID="LbWUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style33">分析數量</td>
                                                                                            <td class="auto-style345">
                                                                                                <asp:Label ID="LbAnalyst" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                     
                                                                                        <tr>
                                                                                            <td class="auto-style33">工項數量</td>
                                                                                            <td class="auto-style345"><asp:Label ID="LbWQuantity" runat="server" ></asp:Label></td>
                                                                                            <td class="auto-style33">工項單價</td>
                                                                                            <td class="auto-style345"> <asp:Label ID="LbWPrice" runat="server" ></asp:Label></td>
                                                                                            <td class="auto-style33" colspan="2">
                                                                                                <asp:CheckBox ID="CheckBox9" runat="server" AutoPostBack="True" Text="全選此工項" OnCheckedChanged="CheckBox9_CheckedChanged" />
                                                                                                <asp:Panel ID="Panel1" runat="server" Visible="False">
                                                                                                    <table class="auto-style4">
                                                                                                        <tr>
                                                                                                            <td class="auto-style33">分包數量</td>
                                                                                                            <td class="auto-style34">
                                                                                                                <asp:TextBox ID="TextBox16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </asp:Panel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table class="Table2">
                                                                                        <tr>
                                                                                            <td class="auto-style33">&nbsp;</td>
                                                                                            <td class="auto-style33">種類</td>
                                                                                            <td class="auto-style33">工料項目名稱</td>
                                                                                            <td class="auto-style33">單位</td>
                                                                                            <td class="auto-style33">工率</td>
                                                                                            <td class="auto-style33">執行單價</td>
                                                                                            <td class="auto-style33">工項用量</td>
                                                                                            <td class="auto-style33">剩餘用量</td>
                                                                                            <td class="auto-style33">分包用量</td>
                                                                                        </tr>
                                                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                                                                                           <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3"  >
                                                                                            <ItemTemplate>
                                                                                                   <tr>
                                                                                            <td class="auto-style34A">
                                                                                                <asp:CheckBox ID="CheckBox1" runat="server" BorderStyle="None" />
                                                                                            </td>
                                                                                            <td class="auto-style34A">
                                                                                                <asp:Label ID="LbBKID" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>' Visible="false"></asp:Label>
                                                                                                 <asp:Label ID="LbRiItemKind" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "ItemKind") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style34">
                                                                                                 <asp:Label ID="LbRiItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "RiName") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style34A">
                                                                                                <asp:Label ID="LbRiUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "WiUnit") %>'></asp:Label>                                                        
                                                                                            </td>
                                                                                            <td class="auto-style345">
                                                                                                <asp:Label ID="LbRiWorkRate" runat="server" Font-Size="Medium" Height="25px" Width="100px" text='<%# DataBinder.Eval(Container.DataItem, "WorkRate") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style345">
                                                                                               <asp:Label ID="LbRiPrice" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "RiPrice") %>'></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style345"><asp:Label ID="LbRiQuantity" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ItemAmount") %>'></asp:Label></td>
                                                                                            <td class="auto-style345"><asp:Label ID="LbRiRemain" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "LastAmount") %>'></asp:Label></td>
                                                                                            <td class="auto-style34A">
                                                                                                   <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px" ></asp:TextBox>
                                                                                            </td>
                                                                                                       </tr>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                                                                                                               
                                                                                    </table>
                                                                                    <asp:Button ID="BtnAddWi1" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加至分包工料"  OnClick="BtnAddWi1_Click" />
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                    <asp:Button ID="BtnClearWi1" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnClearWi1_Click" />
                                                                                </asp:Panel>
                                                                                   <asp:Panel ID="Pnl_ItemPack" runat="server" Visible="False">
                                                    <table class="Table1"">
                                                        <tr>
                                                            <td class="auto-style33">工項名稱</td>
                                                            <td class="auto-style34" colspan="3">
                                                                <asp:Label ID="LbRemain" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbBKID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbEWID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbWItemName1" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                            </td>
                                                            <td class="auto-style33">單位</td>
                                                            <td class="auto-style34">
                                                                <asp:Label ID="LbWUnit1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                                            </td>
                                                            <td class="auto-style33">剩餘用量</td>
                                                            <td class="auto-style34">
                                                                <asp:Label ID="LbLastAmount" runat="server" ></asp:Label>
                                                               </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style33">工項數量</td>
                                                            <td class="auto-style34"><asp:Label ID="LbWQuantity1" runat="server"></asp:Label></td>
                                                            <td class="auto-style33">工項單價</td>
                                                            <td class="auto-style34" colspan="3">  <asp:Label ID="LbWPrice1" runat="server" Text="Label"></asp:Label></td>
                                                            <td class="auto-style33">分包用量</td>
                                                            <td class="auto-style34">
                                                                <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px" OnTextChanged="TxSubQuantity_TextChanged"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="BtnSaveWi" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px"  Text="存入分包工料" OnClick="BtnSaveWi_Click"/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="Button1" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnClearWi_Click" />
                                              </asp:Panel>
                                                                            </td>--%>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                               <asp:Panel ID="Pnl_Resource" runat="server" Visible="False">
                                                                    <table class="auto-style4">
                                                                        <tr>
                                                                            <td valign="top" style="width:50%" >
                                                                                <table border="1" class="Table1">
                                                                                    <tr class="TableTop">
                                                                                      <%--  <td class="auto-style45">資源編碼</td>--%>
                                                                                        <td class="auto-style45">資源名稱</td>
                                                                                        <td class="auto-style45">單位</td>
                                                                                        <td class="auto-style45">&nbsp;</td>
                                                                                    </tr>
                                                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand">
                                                                                          <ItemTemplate>                                                    
                                                    <tr class="ShtRowSingle">                                                    
                                                        <td class="ShtCellCL">
                                                             <asp:Label ID="LbResourceCode" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "ResourceCode") %>' Visible="false"></asp:Label>
                                                             <asp:Label ID="LbEAmount" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                            <asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                            <asp:Label ID="LbEWID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
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
                                                                                  
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td valign="top" width="50%">
                                                                                <asp:Panel ID="Pnl_SourceList" runat="server" Visible="False">
                                                                                    <table class="Table3">
                                                                                        <tr>
                                                                                            <td class="auto-style33">資源名稱</td>
                                                                                            <td class="auto-style34" colspan="3">
                                                                                                 <asp:Label ID="LbEwid" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                                                <asp:Label ID="LbRiItemName1" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                                                            </td>
                                                                                            <td class="auto-style33">單位</td>
                                                                                            <td class="auto-style74">
                                                                                                <asp:Label ID="LbRiUnit1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="auto-style33">總工程用量</td>
                                                                                            <td class="auto-style345">    <asp:Label ID="LbRiAmount" runat="server" ></asp:Label></td>
                                                                                            <td class="auto-style33">資源單價</td>
                                                                                            <td class="auto-style345">
                                                                                                 <asp:Label ID="EUnitPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                                            </td>
                                                                                                <td class="SB_Cell0C_A" colspan="2">
                                                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" AutoPostBack="true" >
                                                                    <asp:ListItem Value="1" Selected="True">全資源分包</asp:ListItem>
                                                                    <asp:ListItem Value="2">部分資源分包</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <table class="Table2">
                                                                                        <tr>
                                                                                            <td class="SB_Cell0C_A">&nbsp;</td>
                                                                                            <td class="SB_Cell0C_A">項次</td>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                                                        </tr>
                                                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                                                                                        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                                                                            <ItemTemplate>                                                        
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox1" runat="server"  />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                  <%--<asp:Label ID="LbBKID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>'></asp:Label>--%>
                                                                <asp:Label ID="LbEwid" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "EWID") %>' Visible="false"></asp:Label>
                                                                <%--<asp:Label ID="LbRiPrice2" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "RiPrice") %>'></asp:Label>--%>
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
                                                                <asp:Label ID="LbRemain" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "LastSubNumber") %>'></asp:Label></td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px"></asp:TextBox>
                                                            </td>
                                                            </tr>
                                                                </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                      
                                                                                    </table>
                                                                                    <asp:Button ID="BtnAddRi" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加至分包工料" OnClick="BtnAddRi_Click"/>
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                    <asp:Button ID="BtnClearRi" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnClearRi_Click"  />
                                                                                </asp:Panel>
                                           <%--    <asp:Panel ID="Pnl_SourcePack" runat="server" Visible="False">
                                                    <table class="Table3">
                                                        <tr>
                                                            <td class="auto-style33">資源名稱</td>
                                                            <td class="auto-style34" colspan="3">
                                                                <asp:Label ID="LbRiItemname" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                            </td>
                                                            <td class="auto-style33">單位</td>
                                                            <td class="auto-style34">
                                                                <asp:Label ID="LbRiUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style33">總工程用量</td>
                                                            <td class="auto-style34">
                                                                <asp:Label ID="LbTQuantity" runat="server" ></asp:Label></td>
                                                            <td class="auto-style33">資源單價</td>
                                                            <td class="auto-style34">
                                                                <asp:Label ID="LbRiPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                            </td>
                                                            <td class="auto-style33" colspan="2">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="Table2">
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>
                                                        <tr>
                                                            <td class="auto-style33">項次</td>
                                                            <td class="auto-style33">工項名稱</td>
                                                            <td class="auto-style33">單位</td>
                                                            <td class="auto-style33">工項用量</td>
                                                            <td class="auto-style33">剩餘用量</td>
                                                        </tr>
                                                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource7" OnItemDataBound="Repeater5_ItemDataBound">
                                                            <ItemTemplate>

                                                        <tr>
                                                            <td class="style34A">
                                                                <asp:Label ID="LbBKID" runat="server" Font-Size="Medium" Height="25px" Width="50px"  text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="LbRiPrice" runat="server" Font-Size="Medium" Height="25px" Width="50px"  text='<%# DataBinder.Eval(Container.DataItem, "RiPrice") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="LbEwid" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "WiEWID") %>' Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbItemOrder" runat="server" Font-Size="Medium" Height="25px" Width="60px"  ></asp:Label>
                                                            </td>
                                                            <td class="style34A">
                                                                <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px"  text='<%# DataBinder.Eval(Container.DataItem, "WiName") %>'></asp:Label>
                                                            </td>
                                                            <td class="style34A">
                                                                <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px"  text='<%# DataBinder.Eval(Container.DataItem, "WiUnit") %>'></asp:Label>
                                                            </td>
                                                            <td class="style34A">
                                                                <asp:Label ID="LbItemAmount" runat="server"  text='<%# DataBinder.Eval(Container.DataItem, "ItemAmount") %>'></asp:Label></td>
                                                            <td class="style34A">
                                                                <asp:Label ID="LbRemain" runat="server"  text='<%# DataBinder.Eval(Container.DataItem, "LastAmount") %>'></asp:Label></td>
                                                        </tr>
                                                                
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                       
                                                    </table>
                                                    <asp:Button ID="BtnRiSub" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全資源存入分包工料" OnClick="BtnRiSub_Click" />
                                                </asp:Panel>--%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                                 
                                                            </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
