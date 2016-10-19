<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidBudgetPEdit.aspx.cs" Inherits="BidBudgetPEdit" %>

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
             var result_style = document.getElementById('TrNew2').style;
             result_style.display = 'none';
         }
         //顯示TR
         function show_tr() {
             //alert("缺漏項即將顯示");
             var result_style = document.getElementById('TrNew1').style;
             result_style.display = 'table-row';
             var result_style = document.getElementById('TrNew2').style;
             result_style.display = 'table-row';
         }

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">投標預算建置編修</td>
            </tr>
            <tr>
                <td class="Table0" colspan="4">單價填列</td>
            </tr>
            <tr>
                <td class="Table1L">&nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="前往工項編輯" Width="27px" PostBackUrl="~/BidBudgetEdit.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton196" runat="server" Height="30px" ImageUrl="~/img/UnSee.png" ToolTip="顯示缺漏項(目前隱藏)" Width="27px" OnClick="ImageButton196_Click" />
                                </td>
                <td class="Table1R">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                    &nbsp;&nbsp;
                                </td>
                <td width="80px" class="Table1">選擇標案</td>
                <td width="300px" class="Table2CC">
		<asp:DropDownList id="DDL_Bid" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID">
		</asp:DropDownList>
                                </td>
            </tr>
        </table>
                        <table class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">資源編碼</td>
                                <td class="ShtCellCC">資源名稱</td>
                                <td class="ShtCellCC">單位</td>
                                <td class="ShtCellCC">原標單<br /> 工程用量</td>
                                <td class="ShtCellCC">校核後<br /> 工程用量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC" colspan="2">調整後單價</td>
                                <td class="ShtCellCC">詢報價作業</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工警告燈號，定光燈號，裝拆"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label145" runat="server" Font-Names="微軟正黑體" Text="168.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label216" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox86" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton41" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" Width="30px" ToolTip="新增詢價單" OnClick="ImageButton41_Click" />
                                    &nbsp;<asp:ImageButton ID="ImageButton39" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" OnClick="ImageButton39_Click" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label108" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0156403102"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label127" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label146" runat="server" Font-Names="微軟正黑體" Text="168.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label244" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox87" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton126" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton128" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label109" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02240A0003"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Height="25px" Text="袪水，擋抽排水"></asp:Label>
                                </td>
                                <td align="center" class="ShtCellCC">
                                    <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label307" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox85" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton129" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label110" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02323A0003"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Height="25px" Text="棄土區費用(含水土保持)"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="201.60"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label245" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox88" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton134" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label111" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0339000004"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label91" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土養護"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label130" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label149" runat="server" Font-Names="微軟正黑體" Text="1,180.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label246" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox89" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton135" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton137" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label112" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label92" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="74.14"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                    </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox90" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton138" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton140" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002421501"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Height="25px" Text="裝料機，膠輪式，1.50~1.59m3"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="2.02"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label248" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox91" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton141" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton143" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label114" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002600004"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土泵"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label152" runat="server" Font-Names="微軟正黑體" Text="1,180.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label249" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox92" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton144" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton146" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000003421801"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Height="25px" Text="傾卸貨車，總重21t~21.9t，8L.M3"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="10.08"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label250" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox93" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton147" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton149" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000004417901"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label154" runat="server" Font-Names="微軟正黑體" Text="290.85"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox94" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton150" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton152" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005100602"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Height="25px" Text="操作手，年資6~10年"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label167" runat="server" Font-Names="微軟正黑體" Text="6.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Text="8.00"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox95" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">2300</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label304" runat="server" Font-Names="微軟正黑體" Text="3,067"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton51" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="單一資源項目單價調整" Width="30px" OnClick="ImageButton51_Click" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton153" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton155" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005P00002"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Height="25px" Text="模版安裝工"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Text="345.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label252" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox96" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton156" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton158" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label172" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000006900002"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label173" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土作業工"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label174" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label175" runat="server" Font-Names="微軟正黑體" Text="47.20"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox97" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    </td>
                                <td class="ShtCellCC">
                                    </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton159" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton161" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label176" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000006000002"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label177" runat="server" Font-Names="微軟正黑體" Height="25px" Text="普通工"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label178" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Text="1,049.50"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Text="1,055.00"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox98" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label305" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton54" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="單一資源項目單價調整" Width="30px" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton162" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton164" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label180" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0258012134"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label181" runat="server" Font-Names="微軟正黑體" Height="25px" Text="注油電桿，杉木，雜酚油，三級，L=6.5M"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label182" runat="server" Font-Names="微軟正黑體" Text="支"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label183" runat="server" Font-Names="微軟正黑體" Text="20.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label254" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox99" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton165" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton167" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowNew" id="TrNew1" style="display: none;">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label117" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M00001"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label98" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼製模板"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label136" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label155" runat="server" Font-Names="微軟正黑體" Text="0.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label231" runat="server" Font-Names="微軟正黑體" Text="150.00"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox100" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton168" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton170" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label118" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050421A3"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label99" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，140kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label156" runat="server" Font-Names="微軟正黑體" Text="1,000.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label255" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox101" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton171" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton173" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label184" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050431A3"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，175kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label186" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label187" runat="server" Font-Names="微軟正黑體" Text="180.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label256" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox102" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton174" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton210" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label119" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0321030005"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label100" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼筋，SD280"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label157" runat="server" Font-Names="微軟正黑體" Text="684.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label257" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox103" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton211" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110a001A"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label101" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門框，烤漆選色"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label158" runat="server" Font-Names="微軟正黑體" Text="5.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label258" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox104" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label188" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110b002A"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label189" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門扇，45db，烤漆選色"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label190" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label191" runat="server" Font-Names="微軟正黑體" Text="10.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox105" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label192" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08710E0008"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label193" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，門五金，不鏽鋼天地栓"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label194" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label195" runat="server" Font-Names="微軟正黑體" Text="5.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label260" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox106" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label196" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0871150008"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label197" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，標準門鉸鏈，自動歸位型"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label198" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label199" runat="server" Font-Names="微軟正黑體" Text="10.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox107" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton191" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label200" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M088100130A"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label201" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，玻璃，平面，t=3mm"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label202" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label203" runat="server" Font-Names="微軟正黑體" Text="60.00"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label262" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox108" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton192" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton194" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label204" runat="server" Font-Names="微軟正黑體" Height="25px">M093103C00A</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label205" runat="server" Font-Names="微軟正黑體" Height="25px">產品，瓷磚，(瓷質壁磚，一級品)，200x200mm</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label206" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label207" runat="server" Font-Names="微軟正黑體">38,250.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label263" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox109" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton195" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton197" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label208" runat="server" Font-Names="微軟正黑體" Height="25px">M093412304A</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label209" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label210" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label211" runat="server" Font-Names="微軟正黑體">13,008.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label264" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox110" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton198" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton200" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label212" runat="server" Font-Names="微軟正黑體" Height="25px">M09341r400A</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label213" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，還原磚，250x250mm</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label214" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label215" runat="server" Font-Names="微軟正黑體">25,280.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox111" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton201" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton203" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowNew" id="TrNew2" style="display: none;">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label121" runat="server" Font-Names="微軟正黑體" Height="25px">M09341r500A</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label102" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，還原磚，300x300mm</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體">0.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label243" runat="server" Font-Names="微軟正黑體">5,000.00</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox112" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton204" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton206" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Height="25px">M096342304A</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label103" runat="server" Font-Names="微軟正黑體" Height="25px">產品，花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label141" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體">605.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label266" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox113" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton207" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" ToolTip="新增詢價單" Width="30px" />
                                    &nbsp;<asp:ImageButton ID="ImageButton209" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" />
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Height="25px">W0127116004</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label104" runat="server" Font-Names="微軟正黑體" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體">168.69</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Text="174,78"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC"></td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Height="25px">W0127120004</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Height="25px">工具損耗</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體">12,464,75</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label268" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Height="25px">W0127130004</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label107" runat="server" Font-Names="微軟正黑體" Height="25px">運雜費</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體">3.00</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label269" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                            </tr>
                        </table>
            <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
