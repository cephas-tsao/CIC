<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="CBudgetView.aspx.cs" Inherits="IMS.CBudgetView" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/CBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>合約預算模組-合約預算檢視</title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="./css/jquery.treegrid.css"/>  
<script type="text/javascript" src="js/jquery.treegrid.js"></script>
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
            height: 25px;
        }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            height: 25px;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
        }
      .auto-style85 {
	width: 37px;
	text-align: center;
    color:red;
}                      

        .auto-styleA {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 30px;
        }
            .auto-styleB {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
                        


        /*.Table1 {
            width: 88%;
            margin-left:220px;
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
                        


        .autoLeft{
           text-align:left;
           height:100%;
           line-height:100%;          
           vertical-align:middle;
           padding-left:5px;        
        }
        .auto-style83 {
	height: 28px;
       width: 8%;
	text-align: center;
}
        .auto-style81 {
            width: 8%;
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
        .autoCenter {
            text-align: center;
        }
            .auto-style84 {
	width: 37px;
	text-align: center;
}
                    
        .autoRight{
           text-align:center;
        }
                


            .autoRight{
           text-align:right;
        }
        
        

        .auto-style43 {
            width: 37px;
        }
      .auto-style87 {
	width: 37px;
	text-align: center;
    color:blue;
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
            .auto-style90 {
            height: 23px;
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
          .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
           .checkboxlist {
	   white-space: nowrap;
 
  padding-left:200px;
        overflow: hidden;
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
                            if ($(this).treegrid('getDepth') >= i - 1) {
                                $(this).treegrid('collapse');
                            }
                        }
                    }
                });
            }
    </script>  
 <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
    
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="7">合約預算檢視</td>
		</tr>
		<tr>
		<td class="TableFun1L">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click" />
                                &nbsp; <asp:ImageButton ID="ImgPDF" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPDF_Click" />
                                </td>
		<td class="TableFun1C">
                                原合約預算總價</td>
            <td class="TableFun2C">
                <asp:Label ID="LbCTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="TableFun1C">
                變更後合約預算總價</td>
            <td class="TableFun2C">
                <asp:Label ID="LbETotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="TableFun1C">
                                總追加減金額</td>
            <td class="TableFun2C">
                <asp:Label ID="LbSTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
		</tr>
		</table>
    
        <table class="Table100">
		<tr>
		<td class="TableFun1C">
                                    選擇顯示之變更次別</td>
           
                <td class="TableFun2L" > <asp:CheckBox ID="check" runat="server" Text="原合約預算" Checked="true" Enabled="false" /> <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="CheckBoxList2_SelectedIndexChanged" RepeatLayout="Flow" ></asp:CheckBoxList> </td>
            
            <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: white; z-index:999;   position:absolute;   left:45%;  top:5%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <td class="TableFun1C" rowspan="2">
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>    
                                    <asp:Button ID="Reload" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="重新載入" OnClick="Reload_Click" OnClientClick="showProgress();"/>
                            </ContentTemplate>
               <Triggers>
                <asp:PostBackTrigger ControlID="Reload" />
                </Triggers>
                    </asp:UpdatePanel>
                                </td>
		</tr>
           
		<tr>
		<td class="TableFun1C">
                                    選擇顯示之欄位</td>
            <td class="TableFun2L">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True">數量</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">單價</asp:ListItem>
                    <asp:ListItem Value="2" Selected="True">複價(含總價)</asp:ListItem>
                    <asp:ListItem Value="3" Selected="True">責任歸屬</asp:ListItem>
                    <asp:ListItem Value="4" Selected="True">原因</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		   <tr>
                <td class="TableFun1L" colspan="4">選擇顯示階層：<asp:DropDownList ID="DDL_LayerSelect" runat="server" AutoPostBack="True" CssClass="DDLshort" OnSelectedIndexChanged="DDL_LayerSelect_SelectedIndexChanged">
                  <asp:ListItem Value="0" Selected="True">-請選擇-</asp:ListItem>              
                    </asp:DropDownList>
                                </td>
         
            </tr>
		</table>
      <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>--%>
                        <table class="tree" style="margin-top:-15px;" >
                    
                           <tr class="ShtRowTop"><%-- 
                                <td class="auto-style45" colspan="<%=LbLayerNum %>" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">原合約預算</td>--%>
                               <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <%--<td class="auto-style45" colspan="5">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第<%=Cedittion %>次變更設計</asp:HyperLink>
                                </td>
                                <td class="auto-style45" rowspan="2">變更設計<br />
                                    追加減金額</td>--%>
                            <%--  </tr>
                            --%>
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal>  
                                  <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                               
                                  <%--  <tr class="TableSingle"><td class="auto-style45" rowspan="2">備註</td>                          
                             
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>--%>
                                 <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                              
                              <%--  <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">責任歸屬</td>
                                <td class="auto-style90">原因</td>  </tr>--%>
                         <%--   <asp:Literal ID="Literal6" runat="server"></asp:Literal>--%>
                          </tr>
                        <%--    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                        <tr class="ShtRowSingle">--%>
                             <%--   <td colspan="3" align="center">--%>
                                <%--      <asp:Label ID="LbWid" runat="server" Visible="false"></asp:Label>
                                       <asp:Label ID="LbPriceID" runat="server" Visible="false"></asp:Label>
                                   <asp:Literal ID="Literal1" runat="server"></asp:Literal>--%>
                              <%--  </td>--%>
                             <%--   <td class="autoLeft">
                                 <asp:Label  ID="LbItemName" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"><asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                                <td class="auto-style81"> <asp:ImageButton ID="ImageButtonAna" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" CommandName="Analyst" CommandArgument='<%# Container.ItemIndex%>' ToolTip="檢視單價分析" /></td>
                                <td class="auto-style83"><asp:Label ID="LbCNumber" runat="server" Font-Names="微軟正黑體"></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbCPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbCComplex" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>--%>
                               <%-- <td class="auto-style83"><asp:Label ID="LbChNumber" runat="server" Font-Names="微軟正黑體" Width="80px" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbEPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbEComplex" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbRespond" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83"><asp:Label ID="LbReason" runat="server" Font-Names="微軟正黑體" ></asp:Label>&nbsp;</td>
                                <td class="auto-style83">
                                   <asp:Label ID="LbChPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label> &nbsp;</td>--%>
                      
                                 <%--  <td class="auto-style83">
                                 <asp:Label ID="LbNotes" runat="server" Font-Names="微軟正黑體" Width="120px"></asp:Label>&nbsp;</td>
                            </tr>
                                </ItemTemplate>
                            </asp:Repeater>--%>
                             
                        
                        </table>
    
    </div>
       <script type="text/javascript" src="../js/jquery.treegrid.min.js"></script>
        <script type="text/javascript">
            $('.tree').treegrid();
        </script> 
</asp:Content>