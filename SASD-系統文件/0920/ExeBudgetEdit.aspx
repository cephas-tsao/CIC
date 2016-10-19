<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ExeBudgetEdit.aspx.cs" Inherits="IMS.ExeBudgetEdit" EnableEventValidation = "false" MaintainScrollPositionOnPostback="true"  %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/ExeBudget.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>專案管理模組-執行預算編輯</title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <%--<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>--%>
 <script type="text/javascript">
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
     //function addLayerCode() {
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

<html xmlns="http://www.w3.org/1999/xhtml"></html>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            height: 25px;
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
        
        /*.Table1 {
              width: 88%;
            margin-left:220px;
            border-collapse:collapse;
        }*/
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E0E0E0;
	text-align: center;
	color: #000000;
}
                


            .auto-style90 {
            height: 23px;
        }
        


            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
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
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
       .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         

        .auto-style77 {
            height: 39px;
        }
        .auto-style55 {
            text-align:center;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
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
        .auto-style96 {
            text-align: right;
            height: 33px;
        }
        .auto-style46 {
            width: 37px;
            }
        


            .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

            .auto-style84 {
	width: 37px;
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
        .auto-style100 {
            width: 37px;
            text-align: center;
            height: 35px;
        }
                    
        .auto-style101 {
            width: 90px;
        }
        .auto-style102 {
            height: 39px;
            text-align: center;
            width: 90px;
        }
        .auto-style103 {
            text-align: center;
            height: 35px;
            width: 90px;
        }
        .auto-style104 {
            text-align: center;
            width: 90px;
        }
        .auto-style105 {
            text-align: center;
            height: 33px;
            width: 90px;
        }
        .checkbox {
        height:50px;
        width:50px;
        }           
        </style>
   
<body>
   
    <div id="div1" runat="server">
       <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
     <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="6">執行預算工項編輯</td>
		</tr>
		<tr>
   
		<td class="TableFun1L">
                                                                  &nbsp;
                                    <asp:ImageButton ID="ImgBtnAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增執行預算工項" Width="27px" OnClick="ImgBtnAdd_Click"  />
                                &nbsp;<asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px"  OnClick="IBtn_PriceFill_Click" OnClientClick="return confirm('請確認頁面資料是否存檔?確認前往單價填列嗎?');" />
                                &nbsp; <asp:ImageButton ID="IBtn_Reload" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="重新匯入合約預算" Width="27px"  OnClick="IBtn_Reload_Click" OnClientClick="return confirm('既有執行預算內容將全數刪除，並重新載入合約預算內容，是否確定執行?');" />                            
                                 &nbsp; <asp:ImageButton ID="ImgSave" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存" Width="27px" OnClick="ImgSave_Click" />                       
            <asp:LinkButton ID="LBtnConfirm" runat="server"  OnClick="LBtnConfirm_Click"></asp:LinkButton>
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" OnClick="IBtn_Lock_Click" ImageUrl="~/img/UnLock.jpg" ToolTip="預算尚未鎖定(點選鎖定預算)" OnClientClick="return confirm('確認要鎖定嗎?(鎖定後原工項不能刪增，須以預算變更處理!');" />
                      
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"></asp:LinkButton>        
        </td>
        
		<td class="TableFun1C">
                                合約預算總價</td>
            <td class="TableFun2C">
                <asp:Label ID="LbCTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="TableFun1C">
                執行預算總價</td>
            <td class="TableFun2C">
                <asp:Label ID="LbETotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
              <td class="TableFun1R">
                                  &nbsp; <asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click" />
                                &nbsp; <asp:ImageButton ID="ImgPDF" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPDF_Click" />
                   <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>  <asp:LinkButton ID="LinkButtonDel" runat="server" OnClick="LinkButtonDel_Click"></asp:LinkButton>
                                </td>
		</tr>
        
		<tr>
   
		<td class="TableFun1L" colspan="6">
                                                                  選擇顯示階層：<asp:DropDownList ID="DDL_LayerSelect" runat="server" AutoPostBack="True" CssClass="DDLshort">
                    <asp:ListItem Value="3">3(ALL)</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    </asp:DropDownList>
        </td>
        
		</tr>
        
		</table>
   
       
                        <table class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2" style="width:8%">編輯</td>
                                <td class="ShtCellCC" colspan="<%=LbLayerNum %>" rowspan="2" >項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2" style="width:3%">單位</td>
                          <%--      <td class="auto-style46" rowspan="2">單價分析</td>--%>
                                <td class="ShtCellCC" colspan="3" style="width:20%">合約預算</td>
                                <td class="ShtCellCC" colspan="3" style="width:20%">執行預算</td>
                                <td class="ShtCellCC" rowspan="2" id="note" runat="server" style="width:5%">備註</td>
                                <td class="ShtCellCC" rowspan="2" style="width:5%">進度引用
                                </td>
                                <td class="ShtCellCC" rowspan="2" style="width:5%">
                                    <asp:ImageButton ID="ImgCheckIn" runat="server" Height="25px" ImageUrl="~/img/CheckIn.png" ToolTip="全選" Width="25px" OnClick="ImgCheckIn_Click" />
                                    <br />
                                    <asp:ImageButton ID="ImgCheckOut" runat="server" Height="25px" ImageUrl="~/img/CheckOut.png" ToolTip="全不選" Width="25px" OnClick="ImgCheckOut_Click" />
                                </td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" style="width:6%">數量</td>
                                <td class="ShtCellCC" style="width:6%">單價</td>
                                <td class="ShtCellCC" style="width:8%">複價</td>
                                <td class="ShtCellCC" style="width:6%">數量</td>
                                <td class="ShtCellCC" style="width:6%">單價</td>
                                <td class="ShtCellCC" style="width:8%">複價</td>
                            </tr>
                  
    
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                      <tr class="ShtRowSingle"  >
                                <td class="ShtCellCC">
                                   
                                    <asp:ImageButton ID="ImgBtnNumBD" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" CommandName="NumBD" CommandArgument='<%# Container.ItemIndex%>'/>
                                     <asp:ImageButton ID="ImgBtnRlon" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" CommandName="Relocation" CommandArgument='<%# Container.ItemIndex%>'/>
                                    <%--<asp:ImageButton ID="ImgBtnDel" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" CommandName="Delete" CommandArgument='<%# Container.ItemIndex%>' OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除"/>--%>
                                 
                                       <asp:Label ID="LbWid" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbItemKind" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbLayerCode" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbRiName" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbRiUnit" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbAnaNumber" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbExecuteKind" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbPriceID" runat="server" Visible="false"></asp:Label>
                                </td>
                                        
                               <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                              <%--  <td colspan="<%=LbLayerNum %>" align="center">                                 
                                    <asp:Label ID="LbItemOrder" runat="server"  Font-Names="微軟正黑體"></asp:Label>
                                </td>--%>
                                <td class="ShtCellCL" style="width:30%">
                                    <asp:Label  ID="LbItemName" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"> <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                              <%--  <td class="auto-style81" style="padding-left:5px">
                                     <asp:ImageButton ID="ImageButtonAna" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" CommandName="Analyst" CommandArgument='<%# Container.ItemIndex%>' ToolTip="檢視單價分析" />
                                </td>--%>
                                <td class="ShtCellCR">   <asp:Label ID="LbCNumber" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                                <td class="ShtCellCR">   <asp:Label ID="LbCPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                <td class="ShtCellCC">   <asp:Label ID="LbCComplex" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                <td class="ShtCellCR">   <asp:Textbox ID="LbENumber" runat="server" Font-Names="微軟正黑體" Width="80px" ></asp:Textbox></td>
                                <td class="ShtCellCR">   <asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                <td class="ShtCellCC">   <asp:Label ID="LbEComplex" runat="server" Font-Names="微軟正黑體" ></asp:Label></td>
                                <td class="ShtCellCC">
                                      <asp:Textbox ID="LbNotes" runat="server" Font-Names="微軟正黑體" Width="120px"></asp:Textbox></td>
                                <td class="ShtCellCC" colspan="2">
                                    <asp:CheckBox ID="check" runat="server" style="zoom: 1.6" OnCheckedChanged="check_CheckedChanged" /> &nbsp;</td>
                            </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                       
                        </table>
       
    
   

     </div>
</body>
</html>

</asp:Content>