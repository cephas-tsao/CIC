<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="SubBudgetAdd.aspx.cs" Inherits="IMS.SubBudgetAdd" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-新增分包預算</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title></title>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../js/jquery.scrollTo.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSB.css" />
       <style type="text/css">
           /*body { position: fixed; overflow-y:scroll }*/
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
	left:36%; top:23%;
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
#popup1{
	/* 提示框div塊的樣式 */
	position:absolute; width:202px;
	color:#004a7e; font-size:14px;
	font-family:Arial, Helvetica, sans-serif;
	left:36%; top:14%;
    background-color:#FFFFFF;
}
#popup1.show{
	/* 顯示提示框的邊框 */	
	border:1px solid #004a7e;
}
#popup1.hide{
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
           .scrollview {
            overflow-y:scroll;
           }
           .inputbox {
           padding-top:50px;
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
     <%--
         var IsPostBack = '<%=IsPostBack.ToString() %>';
         window.onload = function () {
             var strCook = document.cookie;
             if (strCook.indexOf("!~") != 0) {
                 var intS = strCook.indexOf("!~");
                 var intE = strCook.indexOf("~!");
                 var strPos = strCook.substring(intS + 2, intE);
                 if (IsPostBack == 'True') {
                     document.getElementById("<%=Pnl_WBS.ClientID %>").scrollTop = strPos;
                    }
                    else {
                     document.cookie = "yPos=!~0~!";
                    }
                    }
                    }
                    function SetDivPosition() {
                        var intY = document.getElementById("<%=Pnl_WBS.ClientID %>").scrollTop;
                        //document.title = intY;
                        document.cookie = "yPos=!~" + intY + "~!";
                    }    
     ---%>
     $(window).load(function () { $("#LoadingImage").hide() })
    
    </script>
     
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
         <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:30%;" ><img src="../IMG/waiting.gif" /></div>   
     <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
        <table class="Table100" id="title">
        <tr>
			<td class="TableTop" colspan="5">新增分包預算</td>
		</tr>
		<tr>
		<td class="Table1" width="40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td class="Table1">執行預算總價</td>
            <td class="Table2C">
                <asp:Label ID="LbExeTatal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red"  ></asp:Label>
            </td>
            <td class="Table1">
                已分包預算總價</td>
            <td class="Table2C">
                <asp:Label ID="LbSubTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red"  ></asp:Label>
            </td>
		</tr>
		</table>
        <table class="Table100">
		<tr >
			<td class="Table1" width="30%" rowspan="2" >分包預算內容</td>
		<td class="Table1">執行預算</td>
		</tr>
              <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:25%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
                
		<tr >
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>     
		<td class="Table1L" aria-orientation="horizontal">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" Width="60%" CssClass="RBLstyle" >
                                    <asp:ListItem onclick ="showProgress();" Value="1" >依執行預算工作項目選擇</asp:ListItem>
                                    <asp:ListItem onclick ="showProgress();" Value="2">依執行預算資源項目選擇</asp:ListItem>
                                </asp:RadioButtonList>
                           </ContentTemplate>
               <Triggers>
                <asp:PostBackTrigger ControlID="RadioButtonList2" />
                </Triggers>
                    </asp:UpdatePanel>
                                </td>           
      
		</tr>
                       
		<tr>
		<td class="Table2C" valign="top">
        <table style="width: 100%">
        <tr>
		<td class="Table0" colspan="2">
                                分包資訊</td>
		</tr>
		<tr>
		<td class="Table1">
                                分包預算編號</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TxSubNo" runat="server" CssClass="TBmiddle"></asp:TextBox>*
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                分包預算名稱</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TxSubName" runat="server" CssClass="TBmiddle"></asp:TextBox>*
            </td>
		</tr>
		<tr>
		<td class="Table1">
                承攬方式</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="RadioButtonList1" runat="server" CssClass="DDLfree">
                                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                                        <asp:ListItem>實做實算</asp:ListItem>
                                                        <asp:ListItem>總價承攬</asp:ListItem>
                                                        <asp:ListItem>實做+總價</asp:ListItem>
                                                        <asp:ListItem>統包</asp:ListItem>
                                                        <asp:ListItem>其他</asp:ListItem>
                                                    </asp:DropDownList>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                採購負責人</td>
            <td class="Table2">
                                                    <asp:DropDownList ID="DDL_Dep" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="DepartmentName" DataValueField="DepartmentName"  CssClass="DDLfree" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                                        <asp:ListItem>-請選擇部門-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
                                                    <asp:DropDownList ID="DDL_Staff" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name"  CssClass="DDLfree">
                                                        <asp:ListItem>-請選擇部門人員-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DDL_Dep" Name="Department" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                預定進場日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TxWD" runat="server" CssClass="TBmiddle" onclick="WdatePicker();" ></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                預定完成發包日期</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TxFSub" runat="server" CssClass="TBmiddle" onclick="WdatePicker();" ></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="Table1">
                                最遲完成發包期限</td>
            <td class="Table2">
                                                    <asp:TextBox ID="TxLSub" runat="server" CssClass="TBmiddle" onclick="WdatePicker();" ></asp:TextBox>
            </td>
		</tr>
		</table>
                 <table style="width: 100%">
		<tr>
		<td class="Table0">
                                分包工料</td>
		</tr>
		<tr>
		<td class="auto-style3">
                                    <table class="SB_Table_M">
                                        <tr class="SB_RowTop_M">
                                            <td>&nbsp;</td>
                                            <td>執行項次</td>
                                            <td>工項名稱</td>
                                            <td>單位</td>
                                            <td>數量</td>
                                            <td>預算單價</td>
                                            <td>預算複價</td>
                                        </tr>
                                        <asp:Repeater ID="Repeater3"  runat="server" OnItemCommand="Repeater3_ItemCommand" OnItemDataBound="Repeater3_ItemDataBound">
                                            <ItemTemplate>                                         
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC">
                                               <asp:Button id="delete_Click" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px"  CommandName="Delete"   CommandArgument='<%# Container.ItemIndex %>'/>
                                            </td>
                                            <td class="ShtCellCL">
                                                <%--<asp:Label ID="LbRiUpperBKID" runat="server" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "RiUpperBKID") %>' ></asp:Label>--%>
                                             <%--   <asp:Label ID="LbBKID" runat="server" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>' ></asp:Label>--%>
                                             
                                                <asp:Label ID="LbItemOrder" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ItemOrder") %>'></asp:Label></td>
                                            <td class="ShtCellCC">
                                                   <asp:Label ID="EWID" runat="server" visible="false" text='<%# DataBinder.Eval(Container.DataItem, "EWID") %>'></asp:Label>
                                                <asp:Label ID="LbItemName" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label></td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="LbUnit" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label></td>
                                            <td class="ShtCellCR">
                                                <asp:Label ID="LbENumber" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ENumber") %>'></asp:Label></td>
                                            <td class="ShtCellCR">
                                                <asp:Label ID="LbEUnitPrice" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "EUnitPrice") %>'></asp:Label></td>
                                            <td class="ShtCellCR">
                                                <asp:Label ID="LbRemain" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "LastSubNumber") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LbComplex" runat="server" ></asp:Label></td>
                                        </tr>
                                                   </ItemTemplate>
                                        </asp:Repeater>
                                        <tr class="SB_Row_M">
                                            <td class="ShtCellCC" colspan="6">&nbsp;</td>
                                            <td class="ShtCellCR">&nbsp;</td>
                                        </tr>

                                    </table>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
                                                    </td>
		</tr>
		<tr>
		<td class="Table1">
            
                                    <asp:Button ID="BtnAddSub" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增分包預算" CssClass="BtnLargeMedium" OnClick="BtnAddSub_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnClearSub" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="全部清空" CssClass="BtnLargeMedium" OnClick="BtnClearSub_Click" />
                                </td>
		</tr>
		</table>
        </td>
		<td class="Table2C" valign="top">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <panel id="WBSSearch" runat="server" visible="false">
            <table id="searchitem" >
                     <tr>
                                             <td style="width:30%" >搜尋工項：</td><td style="width:50%;text-align:left;padding-top:10px"><input type="text" name="searcher" id="searcher" onkeyup="findWBS();"  /> &nbsp; &nbsp;</td> <td style="width:20%;text-align:left;padding-left:2em"> <input type="button" id="btnsearch" name="btnsearch" value="搜尋"  onclick="SearchKeyword(searcher);" style="width:100px"/></td>
                                                      <div id="popup">
	                                                            <ul id="colors_ul"></ul>
                                                            </div>
                                                        <style id="m-search"></style>       
                                                    </tr> 
            </table>
                </panel>
                <panel id="ResourceSearch" runat="server" visible="false">
            <table id="Table1" >
                     <tr>
                                             <td style="width:30%" >搜尋工項：</td><td style="width:50%;text-align:left;padding-top:10px"><input type="text" name="Researcher" id="Researcher" onkeyup="findResource();"  /> &nbsp; &nbsp;</td> <td style="width:20%;text-align:left;padding-left:2em"> <input type="button" id="Button1" name="btnsearch" value="搜尋"  onclick="SearchReKeyword(Researcher);" style="width:100px"/></td>
                                                      <div id="popup1">
	                                                            <ul id="colors_ul"></ul>
                                                            </div>
                                                        <style id="m-search"></style>       
                                                    </tr> 
            </table>
                </panel>
                            <asp:Panel ID="Pnl_WBS" runat="server" Visible="False"  Width="100%" Height="500"   ><%--onscroll="SetDivPosition()" CssClass="scrollview"--%>
                                   
                                <iframe id="FrameWBS" width="100%" height="600" src="SubBudgetAddWBS.aspx" onload="document.getElementById('LoadingImage').style.display='none';">

                                         </iframe>
                                     
                                <%--   <table class="Table100" style="width:100%;">                                        
                                       
                                            <td class="Sht50" valign="top" style="width:100%" >
                                                <table class="Sht100"  border="1" style="width:100%" id="scroll" >
                                              
                                                                                     
                                                    <tr class="ShtRowTop">
                                                        <td colspan="<%=LbLayerNum %>" style="width:10%">項次</td>
                                                        <td style="width:20%">工項名稱</td>
                                                        <td style="width:5%">單位</td>
                                                        <td class="ShtCellCC" style="width:5%">執行數量</td>
                                                        <td class="ShtCellCC" style="width:5%">預算單價</td>
                                                        <td class="ShtCellCC" style="width:5%">剩餘數量</td>
                                                        <td class="ShtCellCC" style="width:10%">分包數量</td>
                                                        <td style="width:5%"><asp:ImageButton ID="ImgSubRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" OnClick="ImgSubRItem_Click" />&nbsp;</td>
                                                    </tr>
                                     <div id="scroll1" >
                                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
                                                      
                                                         <ItemTemplate>                               
                                                    <tr class="ShtRowSingle" id="task-<%# DataBinder.Eval(Container.DataItem, "Ewid") %>">                                               
                                                              <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                        <td class="ShtCellCL" style="width:20%" id="box">
                                                            <asp:Label ID="LbItemOrder" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                                            <asp:Label ID="Lbwid" runat="server" Font-Names="微軟正黑體" Height="25px"  ></asp:Label>
                                                            <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px"></asp:Label>
                                                        </td>
                                                         <td class="ShtCellCC" style="width:5%"><asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC" style="width:5%"><asp:Label ID="LbENum" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC" style="width:5%"><asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                        <td class="ShtCellCC" style="width:5%"><asp:Label ID="LbLastSubNumber" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                                           <td class="ShtCellCC" style="width:20%"><asp:Textbox ID="LbSubNum" runat="server" Font-Names="微軟正黑體" OnTextChanged="LbSubNum_TextChanged" AutoPostBack="true" Width="70%" ></asp:Textbox></td>
                                                        <td class="ShtCellCC" style="width:5%">
                                                            <asp:CheckBox ID="checkSub" runat="server" OnCheckedChanged="check_CheckedChanged"/>--%>
                                                                <%--<asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="加入分包工項" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>' />--%>
                                                            <%--<asp:ImageButton ID="ImgSubC" runat="server" Height="30px" ImageUrl="~/img/package.png" ToolTip="全工項分包" Width="30px" CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>'/>
                                                          <asp:ImageButton ID="ImgRItem" runat="server" Height="30px" ImageUrl="~/img/ArrowRight.jpg" ToolTip="檢視資源項目" Width="30px" CommandName="SelectResource" CommandArgument='<%# Container.ItemIndex%>' OnClick="ImageButton25_Click" />--%>
                                                   <%--  </td>
                                                    </tr>                                                                
                                                              </ItemTemplate>                                                
                                                        </asp:Repeater> 
                                                     
                                                      </div>                              
                                                </table>
                                              
                                            </td>--%>
                                           <%-- <td class="Sht50" valign="top">
                                                <asp:Panel ID="Pnl_Analysis" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbWItemName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                                </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbWUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">分析數量</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbAnalyst" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項數量</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbWQuantity" runat="server" ></asp:Label></td>
                                                            <td class="SB_Cell0C_A">工項單價</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbWPrice" runat="server" ></asp:Label></td>
                                                            <td class="SB_Cell0C_A" colspan="2">
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">&nbsp;</td>
                                                            <td class="SB_Cell0C_A">種類</td>
                                                            <td class="SB_Cell0C_A">工料項目名稱</td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell0C_A">工率</td>
                                                            <td class="SB_Cell0C_A">執行單價</td>
                                                            <td class="SB_Cell0C_A">工項用量</td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                        </tr>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>
                                                        <asp:Repeater ID="Repeater4" DataSourceID="SqlDataSource6" runat="server" OnItemDataBound="Repeater4_ItemDataBound">
                                                            <ItemTemplate>                                                         
                                                        <tr>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:CheckBox ID="CheckBox1" runat="server"  OnCheckedChanged="CheckBox1_CheckedChanged"  />
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbBKID" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "BKID") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="LbRiItemKind" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "ItemKind") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1L_A">
                                                                <asp:Label ID="LbRiItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "RiName") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbRiUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "WiUnit") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbRiWorkRate" runat="server" Font-Size="Medium" Height="25px" Width="100px" text='<%# DataBinder.Eval(Container.DataItem, "WorkRate") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbRiPrice" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "RiPrice") %>'></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbRiQuantity" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ItemAmount") %>'></asp:Label></td>
                                                            <td class="SB_Cell1R_A"><asp:Label ID="LbRiRemain" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "LastAmount") %>'></asp:Label></td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px" ></asp:TextBox>
                                                            </td>
                                                            <tr>
                                                                   </ItemTemplate>
                                                        </asp:Repeater>
                                                            
                                                    </table>
                                                    <asp:Button ID="BtnRiSave" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="存入分包工料" OnClick="BtnRiSave_Click" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="BtnRiClear" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnRiClear_Click" />
                                                </asp:Panel>
                                                <asp:Panel ID="Pnl_ItemPack" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項名稱</td>
                                                            <td class="SB_Cell1L_A" colspan="3">
                                                                <asp:Label ID="LbRemain" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbBKID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbEWID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false" ></asp:Label>
                                                                <asp:Label ID="LbWItemName1" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">單位</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:Label ID="LbWUnit1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                                            </td>
                                                            <td class="SB_Cell0C_A">剩餘用量</td>
                                                            <td class="SB_Cell1R_A">
                                                                <asp:Label ID="LbLastAmount" runat="server" ></asp:Label>
                                                               </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">工項數量</td>
                                                            <td class="SB_Cell1R_A"><asp:Label ID="LbWQuantity1" runat="server"></asp:Label></td>
                                                            <td class="SB_Cell0C_A">工項單價</td>
                                                            <td class="SB_Cell1R_A" colspan="3">  <asp:Label ID="LbWPrice1" runat="server" Text="Label"></asp:Label></td>
                                                            <td class="SB_Cell0C_A">分包用量</td>
                                                            <td class="SB_Cell1C_A">
                                                                <asp:TextBox ID="TxSubQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="100px" OnTextChanged="TxSubQuantity_TextChanged"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Button ID="BtnSaveWi" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px"  Text="存入分包工料" OnClick="BtnSaveWi_Click"/>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="BtnClearWi" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" OnClick="BtnClearWi_Click" />
                                                </asp:Panel>
                                            </td>--%>
                                      <%-- </tr>
                                    </table>--%>
                                </asp:Panel>
          
          <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                <asp:Panel ID="Pnl_Resource" runat="server" Visible="False"  Height="1000">
                                        <iframe id="FrameRes" width="100%" height="600" src="SubBudgetAddRes.aspx" onload="document.getElementById('LoadingImage').style.display='none';">

                                         </iframe>
                                  
                                             
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
            </td>
		</tr>
		</table>
    
    </div>

</body>
</html>
    <script language="javascript">
        var oInputField;	//考慮到很多函數中都要使用
        var oInputField1;	//考慮到很多函數中都要使用
        var oPopDiv;		//因此採用全局變量的形式
        var oPopDiv1;		//因此採用全局變量的形式
        var oColorsUl;
        var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            else if (window.XMLHttpRequest)
                xmlHttp = new XMLHttpRequest();
        }
        function initVars() {
            //初始化變量
            oInputField = document.forms["form1"].searcher;
            oInputField1 = document.forms["form1"].Researcher;
            oPopDiv = document.getElementById("popup");
            oPopDiv1 = document.getElementById("popup1");
            oColorsUl = document.getElementById("colors_ul");
        }
        function clearColors() {
            //清除提示內容
            for (var i = oColorsUl.childNodes.length - 1; i >= 0; i--)
                oColorsUl.removeChild(oColorsUl.childNodes[i]);
            if (oPopDiv != null) {
                oPopDiv.className = "hide";
            }
            else if (oPopDiv1 !=null)
            {
            oPopDiv1.className = "hide";
        }
        }
        function setColors(the_colors) {
            //顯示提示框，傳入的參數即為匹配出來的結果組成的數組
            clearColors();	//每輸入一個字母就先清除原先的提示，再繼續
            if (oPopDiv) {
                oPopDiv.className = "show";
            }
            else if (oPopDiv1) {
                oPopDiv1.className = "show";
            }
            var oLi;
            for (var i = 0; i < the_colors.length; i++) {
                //將匹配的提示結果逐一顯示給用戶
                oLi = document.createElement("li");
                oColorsUl.appendChild(oLi);
                oLi.appendChild(document.createTextNode(the_colors[i]));

                oLi.onmouseover = function () {
                    this.className = "mouseOver";	//鼠標經過時高亮
                }
                oLi.onmouseout = function () {
                    this.className = "mouseOut";	//離開時恢復原樣
                }
                oLi.onclick = function () {
                    //用戶點擊某個匹配項時，設置輸入框為該項的值
                    if (oInputField) {
                        oInputField.value = this.firstChild.nodeValue;
                    }
                    else if (oInputField1)
                    {
                    oInputField1.value = this.firstChild.nodeValue;}
                    clearColors();	//同時清除提示框
                }
            }
        }
        function findWBS() {
            initVars();		//初始化變量
            if (oInputField.value.length > 0) {
                createXMLHttpRequest();		//將用戶輸入發送給服務器
                var sUrl = "../Ajax/Findkey.aspx?sColor=" +encodeURI(oInputField.value) + "&timestamp=" + new Date().getTime();
                xmlHttp.open('GET', sUrl, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        var aResult = new Array();
                        if (xmlHttp.responseText.length) {
                            aResult = xmlHttp.responseText.split(",");
                            setColors(aResult);	//顯示服務器結果
                        }
                        else
                            clearColors();
                    }
                }
                xmlHttp.send(null);
            }
            else
                clearColors();	//無輸入時清除提示框（例如用戶按del鍵）
        }
        function findResource() {
            initVars();		//初始化變量
            if (oInputField1.value.length > 0) {
                createXMLHttpRequest();		//將用戶輸入發送給服務器
                var sUrl = "../Ajax/Findkey.aspx?fresource=" + encodeURI(oInputField1.value) + "&timestamp=" + new Date().getTime();
                xmlHttp.open('GET', sUrl, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        var aResult = new Array();
                        if (xmlHttp.responseText.length) {
                            aResult = xmlHttp.responseText.split(",");
                            setColors(aResult);	//顯示服務器結果
                        }
                        else
                            clearColors();
                    }
                }
                xmlHttp.send(null);
            }
            else
                clearColors();	//無輸入時清除提示框（例如用戶按del鍵）
        }
</script>
 
       <script type="text/javascript">
           function FindNext() {
               var str = document.getElementById("searcher").value;
               if (str == "") {
                   alert("Please enter some text to search!");
                   return;
               }

               var supported = false;
               var found = false;
               if (window.find) {        // Firefox, Google Chrome, Safari
                   supported = true;
                   // if some content is selected, the start position of the search 
                   // will be the end position of the selection
                   found = window.find(str);
               }
               else {
                   if (document.selection && document.selection.createRange) { // Internet Explorer, Opera before version 10.5
                       var textRange = document.selection.createRange();
                       if (textRange.findText) {   // Internet Explorer
                           supported = true;
                           // if some content is selected, the start position of the search 
                           // will be the position after the start position of the selection
                           if (textRange.text.length > 0) {
                               textRange.collapse(true);
                               textRange.move("character", 1);
                           }

                           found = textRange.findText(str);
                           if (found) {
                               textRange.select();
                           }
                       }
                   }
               }

               if (supported) {
                   if (!found) {
                       alert("The following text was not found:\n" + str);
                   }
               }
               else {
                   alert("Your browser does not support this example!");
               }
           }
    </script>
    
    <script>
        var TRange = null;

        function findString(str) {
            if (parseInt(navigator.appVersion) < 4) return;
            var strFound;
            if (window.find) {

                // CODE FOR BROWSERS THAT SUPPORT window.find

                strFound = self.find(str);
                if (!strFound) {
                    strFound = self.find(str, 0, 1);
                    while (self.find(str, 0, 1)) continue;
                }
            }
            else if (navigator.appName.indexOf("Microsoft") != -1) {

                // EXPLORER-SPECIFIC CODE

                if (TRange != null) {
                    TRange.collapse(false);
                    strFound = TRange.findText(str);
                    if (strFound) TRange.select();
                }
                if (TRange == null || strFound == 0) {
                    TRange = self.document.body.createTextRange();
                    strFound = TRange.findText(str);
                    if (strFound) TRange.select();
                }
            }
            else if (navigator.appName == "Opera") {
                alert("Opera browsers not supported, sorry...")
                return;
            }
            if (!strFound) alert("String '" + str + "' not found!")
            return;
        }

    </script>
    <script>
        function srh(txt) {
           //搜尋網頁上的字串
            var x = document.body.createTextRange();
            var x = document.createRange();
            //var x = document.setSelectionRange(1, 500);
            //var range = obj.createTextRange();
            //var x = document.createRange();
            //var x = obj.setSelectionRange(开始序号, 结束序号);
            //obj.focus();
            //if (txt.setSelectionRange) {
            //    txt.focus();
            //    txt.setSelectionRange(start, end);
            //}
            //var x = document.body.createTextRange();
            //range.setStart(text.firstChild, 1);
            //range.setEnd(text.firstChild, 7);
            //text = document.setSelectionRange(start, end);
            //alert('2');
            //document.getElementById("tf").setSelectionRange(0,20);
            //document.execCommand("Paste", false, null);
            var txt = document.getElementById("searcher").value;
            x.moveStart("character");
            if (x.findText(txt) != false) {
                x.select();
                x.scrollIntoView();
                x.execCommand("BackColor", false, "green");
            }
            else {
                alert("查無" + txt + "的資料");
            }
        }
    </script>
    <script>
        function SelectText(element) {
            var doc = document,
              text = doc.getElementById(element),     
              range, selection;
            //alert(text);
            if (doc.body.createTextRange) {
                range = document.body.createTextRange();
                range.moveToElementText(text);
                range.moveStart("character", -1);
                range.findText(element);               
                range.scrollIntoView();
                //range.select();
            } else if (window.getSelection) {
               
                selection = window.getSelection();
               
                range = document.createRange();
               
                range.selectNodeContents(text);
               
                selection.removeAllRanges();
               
                selection.addRange(range);
               
            }
        }

        //document.getElementById('btnsearch').addEventListener('click', function () {
        //    SelectText('searcher');
        //});
        //document.getElementById('btnB').addEventListener('click', function () {
        //    SelectText('textB');
        //});

    </script>
  <script>
  
  
      function findInPage(text) {
          var txt, i, found;
          var n=0;
          //alert(text.value)
          //var str = document.getElementById("searcher").value;
          if (text == "") {
              return false;
          }
          // Find next occurance of the given string on the page, wrap around to the
          // start of the page if necessary.
          if (window.find) {
              // Look for match starting at the current point. If not found, rewind
              // back to the first match.

              if (window.find(text.value)) {
                  //while (window.find(text.value, false, true))
                      while (window.find(text.value, 0, 1)) continue;
                  {
                      n++;
                  }
              } else {
                  n++;
              }
              // If not found in either direction, give message.
              if (n == 0) {
                  alert("Not found.");
              }
          } else if (window.document.body.createTextRange) {
              txt = window.document.body.createTextRange();
              // Find the nth match from the top of the page.
              found = true;
              i = 0;
           
              while (found === true && i <= n) {
                  found = txt.findText(text.value);
                  if (found) {
                      txt.moveStart("character", 1);
                      txt.moveEnd("textedit");

                  }
                  i += 1;
              }
              // If found, mark it and scroll it into view.
              if (found) {
                  txt.moveStart("character", -1);
                  txt.findText(text);
                  txt.select();
                  txt.scrollIntoView();
                  n++;
              } else {
                  // Otherwise, start over at the top of the page and find first match.
                  if (n > 0) {
                      n = 0;
                      findInPage(text.value);
                  }
                  // Not found anywhere, give message. else
                  alert("Not found.");
              }
          }
          return false;
      }

  </script>
    <script>
        //$(document).ready(function () {
        function SearchKeyword(word) {
            $.ajax({
                type: 'GET',

                url: '../Ajax/sidepage.aspx?act=getUserData&rnd=' + Math.random(),
                //data: { "data":result},
                data: { "Keyword": word.value },

                dataType: "json",
                //dataType: 'text',
                success: function (data) {
                    // Call this function on success                   
                    //alert(data.getUserData.split(','));                   
                    //someFunction(data);
                  
                    document.getElementById("FrameWBS").contentWindow.someFunction(data);
                  
                    //return data;
                },

            })
        }
        var arr = new Array();
        function someFunction(data) {
            var a1 = data.getUserData;         
            var temp = new Array();           
            temp = a1.split(",");
          
            var iHeight = $("#selection").height();
                for (var id in temp) {
                //$('#' + id).top();
                var a2 = temp[id];
               
                var p = $("#task-" + a2);
                //alert(p);
                var offset = $("#task-" + a2).offset();               
                arr.push(offset);               
                offsetTop = offset.top;             
             
                console.log(offsetTop);
                var view = $("#Pnl_WBS");
                $('#scroll1').scroll();
                var container = $('scroll'),
                scrollTo = $(p);
            
                var body = $("html, body");
                $("html, body").animate({ scrollTop: $(p).offset().top }, 1000);
                //var $target = $('#scroll');
                //$target.scrollTo($(p), 800);
                //var body = $("html, body");
               

                //body.stop().animate({ scrollTop: 0 }, '500', 'swing', function () {
                //    alert("Finished animating");
                //});
                    var str = document.getElementById("searcher").value;
                    $("body ").highlight(str);
            }
            var n = 0;
          
        }

        function SearchReKeyword(word) {
            $.ajax({
                type: 'GET',

                url: '../Ajax/sidepage.aspx?act=getReData&rnd=' + Math.random(),
                //data: { "data":result},
                data: { "Keyword": word.value },

                dataType: "json",
                //dataType: 'text',
                success: function (data) {
                    // Call this function on success                   
                    //alert(data.getUserData.split(','));                   
                    //someFunction(data);

                    document.getElementById("FrameRes").contentWindow.someFunction(data);

                    //return data;
                },

            })
        }
    </script>
    <script>
      
        function highlight(txt) {
            //搜尋網頁上的字串
          
            var str = document.getElementById("searcher").value;
            $("body ").highlight(str);
           
            if (parseInt(navigator.appVersion) < 4) return;
            var strFound;
            var TRange = null;
                    
            var strFound;
            strFound = self.find(str);
            if (strFound && self.getSelection && !self.getSelection().anchorNode) {
                strFound = self.find(str);
            }
            //if (window.find) {        // Firefox, Google Chrome, Safari
            var found = false;
            if (window.find) {        // Firefox, Google Chrome, Safari
                supported = true;
                // if some content is selected, the start position of the search 
                // will be the end position of the selection
                //found = window.find(str);
                window.find(str, false, true);
                $('html, body').animate({ scrollTop: $(p).offset().top }, 200);
            }
            var foundin = $("*:contains(" + str + ")");
            $("window").scrollTop($("*:contains(" + str + "):eq(n)").offset());
            if (window.find(str, false, true))
            {
                alert('找到了');
                              
                //$("b:contains(" + str + ")").css('color', 'red');
            }
         
            //if (strFound) {
            //    strFound = self.find(str, 0, 1)
            //    alert(window.find());
            //    while (self.find(str, 0, 1)) continue
            //}
            else if (window.document.body.createTextRange) {
                txt = window.document.body.createTextRange();
                // Find the nth match from the top of the page.
                found = true;
                i = 0;
                var n = 0;
              
                while (found === true && i <= n) {
                    found = txt.findText(str);
                    if (found) {
                        txt.moveStart("character", 1);
                        txt.moveEnd("textedit");

                    }
                    i += 1;
                }
                // If found, mark it and scroll it into view.
                if (found) {
                    txt.moveStart("character", -1);
                    txt.findText(str);
                    txt.select();
                    txt.scrollIntoView();
                    n++;
                } else {
                    // Otherwise, start over at the top of the page and find first match.
                    if (n > 0) {
                        n = 0;
                        //findInPage(text.value);
                    }
                    // Not found anywhere, give message. else
                    alert("Not found.");
                }
            }
            //return false;
         
        }
      
    </script>
    <script>
        jQuery.extend({
            highlight: function (node, re, nodeName, className) {
                if (node.nodeType === 3) {
                    var match = node.data.match(re);
                    if (match) {
                        var highlight = document.createElement(nodeName || 'span');
                        highlight.className = className || 'highlight';
                        var wordNode = node.splitText(match.index);
                        wordNode.splitText(match[0].length);
                        var wordClone = wordNode.cloneNode(true);
                        highlight.appendChild(wordClone);
                        wordNode.parentNode.replaceChild(highlight, wordNode);
                        return 1; //skip added node in parent
                    }
                } else if ((node.nodeType === 1 && node.childNodes) && // only element nodes that have children
                        !/(script|style)/i.test(node.tagName) && // ignore script and style nodes
                        !(node.tagName === nodeName.toUpperCase() && node.className === className)) { // skip if already highlighted
                    for (var i = 0; i < node.childNodes.length; i++) {
                        i += jQuery.highlight(node.childNodes[i], re, nodeName, className);
                    }
                }
                return 0;
            }
        });

        jQuery.fn.unhighlight = function (options) {
            var settings = { className: 'highlight', element: 'span' };
            jQuery.extend(settings, options);

            return this.find(settings.element + "." + settings.className).each(function () {
                var parent = this.parentNode;
                parent.replaceChild(this.firstChild, this);
                parent.normalize();
            }).end();
        };

        jQuery.fn.highlight = function (words, options) {
            var settings = { className: 'highlight', element: 'span', caseSensitive: false, wordsOnly: false };
            jQuery.extend(settings, options);

            if (words.constructor === String) {
                words = [words];
            }
            words = jQuery.grep(words, function (word, i) {
                return word != '';
            });
            words = jQuery.map(words, function (word, i) {
                return word.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
            });
            if (words.length == 0) { return this; };

            var flag = settings.caseSensitive ? "" : "i";
            var pattern = "(" + words.join("|") + ")";
            if (settings.wordsOnly) {
                pattern = "\\b" + pattern + "\\b";
            }
            var re = new RegExp(pattern, flag);

            return this.each(function () {
                jQuery.highlight(this, re, settings.element, settings.className);
            });
        };

    </script>

<script>
    function doSearch(text) {
        var sel;
        if (window.find && window.getSelection) {
            sel = window.getSelection();
            if (sel.rangeCount > 0) {
                sel.collapseToEnd();
            }
            //window.find(text);
            window.find(text, false, true);
        } else if (document.selection && document.body.createTextRange) {
            sel = document.selection;
            var textRange;
            if (sel.type == "Text") {
                textRange = sel.createRange();
                textRange.collapse(false);
            } else {
                textRange = document.body.createTextRange();
                textRange.collapse(true);
            }
            if (textRange.findText(text)) {
                textRange.select();
            }
        }
    }

    function searchpage() {
        doSearch(document.getElementById("searcher").value);
    }
</script>
    </asp:Content>