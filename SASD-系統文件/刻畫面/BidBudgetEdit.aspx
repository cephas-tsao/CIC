<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidBudgetEdit.aspx.cs" Inherits="BidBudgetEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />                             
     <script type="text/javascript">
         //隱藏TR
         function hide_tr() {
             //alert("缺漏項即將隱藏");
             var result_style = document.getElementById('TrNew1').style;
             result_style.display = 'none';
             //var result_style = document.getElementById('TrNew2').style;
             //result_style.display = 'none';
         }
         //顯示TR
         function show_tr() {
             //alert("缺漏項即將顯示");
             var result_style = document.getElementById('TrNew1').style;
             result_style.display = 'table-row';
             //var result_style = document.getElementById('TrNew2').style;
             //result_style.display = 'table-row';
         }

</script>

    <style type="text/css">

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

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="8">投標預算建置編修</td>
            </tr>
            <tr>
                <td class="Table0" colspan="8">工項編修/數量填列校核</td>
            </tr>
            <tr>
                <td class="Table1">原標單總價</td>
                <td class="Table2CC">
                <asp:Label ID="Label68" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,006,643"></asp:Label>
                                </td>
                <td class="Table1">校核後總價</td>
                <td class="Table2CC">
                <asp:Label ID="Label172" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,120,913"></asp:Label>
                                </td>
                <td class="Table1">投標預算總價</td>
                <td class="Table2CC">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,117,881"></asp:Label>
                                </td>
                <td width="80px" class="Table1">選擇標案</td>
                <td width="300px" class="Table2CC">
		<asp:DropDownList id="DDL_Bid" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID">
		</asp:DropDownList>
                                </td>
            </tr>
        </table>
        <table class="Table100">
            <tr>
                <td class="Table1L">&nbsp;
                                    <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/Layer.png" ToolTip="階層及編號設定" Width="27px" PostBackUrl="~/BidLayerSet.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton175" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" PostBackUrl="~/BidItemAdd.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px" PostBackUrl="~/BidBudgetPEdit.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton197" runat="server" Height="30px" ImageUrl="~/img/Enter.jpg" ToolTip="插補缺漏項" Width="27px" OnClick="ImageButton197_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton196" runat="server" Height="30px" ImageUrl="~/img/UnSee.png" ToolTip="顯示缺漏項(目前隱藏)" Width="27px" OnClick="ImageButton196_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton214" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="投標預算重新總計" Width="27px" OnClick="ImageButton214_Click" />
                                </td>
                <td class="Table1R">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                    &nbsp;&nbsp;
                                </td>
            </tr>
        </table>
    
    </div>
    
                        <table id="EBudget" class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2">工項<br />
                                    編輯</td>
                                <td class="ShtCellCC" colspan="3" rowspan="2">項次</td>
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
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton217" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td colspan="3" align="center" class="ShtCellCC">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox46" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton218" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton219" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCC" style="width: 3px"></td>
                                <td class="ShtCellCC" colspan="2"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox47" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton220" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton221" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">1</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label15" runat="server" Height="25px" Text="清除及掘除" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label19" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" OnClick="ImageButton7_Click" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox62" runat="server" CssClass="TBshort" dir="rtl">1,680</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label69" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label70" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="26,880"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox48" runat="server" CssClass="TBshort" dir="rtl">2,000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label72" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="32,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label73" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                    </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton222" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton223" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">2</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label16" runat="server" Height="25px" Text="基地及路幅開挖，未含運費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label20" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox63" runat="server" CssClass="TBshort" dir="rtl">8,000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label76" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox49" runat="server" CssClass="TBshort" dir="rtl">8,000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label146" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox28" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton224" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton225" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox29" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton226" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton227" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">1</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label21" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton9" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox64" runat="server" CssClass="TBshort" dir="rtl">3,250</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label77" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox50" runat="server" CssClass="TBshort" dir="rtl">3,250</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label121" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox30" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton228" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton229" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">2</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label26" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label27" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton10" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox65" runat="server" CssClass="TBshort" dir="rtl">1,000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label78" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox51" runat="server" CssClass="TBshort" dir="rtl">1,000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,067</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox31" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton230" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton231" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">3</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton11" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox66" runat="server" CssClass="TBshort" dir="rtl">180</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label79" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,148</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label91" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox52" runat="server" CssClass="TBshort" dir="rtl">180</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label149" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label136" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox32" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton232" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton233" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">4</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label35" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton12" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox67" runat="server" CssClass="TBshort" dir="rtl">683.78</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label80" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label92" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox61" runat="server" CssClass="TBshort" dir="rtl">683.78</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox33" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton234" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton235" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">5</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label38" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label39" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton13" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox68" runat="server" CssClass="TBshort" dir="rtl">3,450</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label81" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">581</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label93" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox54" runat="server" CssClass="TBshort" dir="rtl">3,450</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox35" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton236" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton237" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox39" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton238" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton239" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">1</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label44" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label45" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton14" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox69" runat="server" CssClass="TBshort" dir="rtl">3</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label82" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">103,619</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox55" runat="server" CssClass="TBshort" dir="rtl">3</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label152" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton240" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton241" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">2</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label48" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label49" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton15" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox70" runat="server" CssClass="TBshort" dir="rtl">1,580</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label83" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,183</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox56" runat="server" CssClass="TBshort" dir="rtl">1,580</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label127" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowNew" id="TrNew1" style="display: none;">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton242" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton243" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">2a</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label102" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，還原磚，300x300mm"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    M2</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton216" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label104" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label105" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,183</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox75" runat="server" CssClass="TBshort" dir="rtl">50</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="109,150"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label154" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label141" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">-</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label167" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox76" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton244" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton245" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">3</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton16" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox71" runat="server" CssClass="TBshort" dir="rtl">542</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label84" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,981</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox57" runat="server" CssClass="TBshort" dir="rtl">542</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label155" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                    </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton246" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton247" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">4</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label56" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label57" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton17" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox72" runat="server" CssClass="TBshort" dir="rtl">55</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label85" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,807</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox58" runat="server" CssClass="TBshort" dir="rtl">55</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label130" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label156" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox43" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton248" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton249" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">5</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label60" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label61" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton18" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox73" runat="server" CssClass="TBshort" dir="rtl">1,530</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label86" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,009</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label98" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox59" runat="server" CssClass="TBshort" dir="rtl">1,530</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label157" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox44" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton250" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/BidItemEdit.aspx" />
                                &nbsp;<asp:ImageButton ID="ImageButton251" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">6</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label64" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label65" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton19" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox74" runat="server" CssClass="TBshort" dir="rtl">5</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">43,886</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label99" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox60" runat="server" CssClass="TBshort" dir="rtl">5</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label158" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label145" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox45" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            </table>
    
        <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>
    </form>
</body>
</html>
