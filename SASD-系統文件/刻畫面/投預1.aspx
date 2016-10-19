<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投預1.aspx.cs" Inherits="投預1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        //隱藏TR
        function hide_tr() {
            //alert("缺漏項即將隱藏");
            var result_style = document.getElementById('TrNew1').style;
            result_style.display = 'none';
        }
        //顯示TR
        function show_tr() {
            //alert("缺漏項即將顯示");
            var result_style = document.getElementById('TrNew1').style;
            result_style.display = 'table-row';
        }

</script>
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
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: right;
                color: #000000;
                height: 33px;
            }
            


        .Table1 {
            width: 100%;

            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
        .auto-style46 {
            width: 37px;
            }
        


            .auto-style91 {
            width: 45px;
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
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style79 {
            height: 28px;
        }
        .auto-style92 {
            height: 28px;
            text-align: center;
            width: 45px;
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
                

        .auto-style93 {
            height: 39px;
            text-align: center;
            width: 45px;
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
           text-align:right;
        }
        
        .autoRight{
           text-align:center;
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
            </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
	<table style="width: 100%">
		<tr>
		<td class="auto-style85">請選擇標案</td>
		<td class="auto-style16">
		<asp:DropDownList id="DDL_BidSelect" runat="server" Height="50px" Width="300px" Font-Size="Medium" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged">
            <asp:ListItem>-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT DISTINCT Bid_WBS.BID, BidM0.BidName FROM BidM0 INNER JOIN Bid_WBS ON BidM0.BID = Bid_WBS.BID ORDER BY Bid_WBS.BID DESC"></asp:SqlDataSource>
		<span class="auto-style6">(必選)</span></td>
		</tr>
        </table>
        <asp:Panel ID="Pnl_ALL" runat="server" Visible="False">
        
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="7">投標預算檢視</td>
		</tr>
		<tr>
		<td class="auto-styleA">
                                原標單總價</td>
		    <td class="auto-styleB">
                <asp:Label ID="Label68" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,006,643"></asp:Label>
            </td>
            <td class="auto-styleA">校核後總價</td>
            <td class="auto-styleB">
                <asp:Label ID="Label172" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,120,913"></asp:Label>
            </td>
            <td class="auto-styleA">投標預算總價</td>
            <td class="auto-styleB">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,117,881"></asp:Label>
            </td>
		<td class="auto-style15">
                                <asp:Button ID="Button19" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button19_Click" Text="顯示缺漏項" Width="100px" />
                                &nbsp;</td>
		</tr>
		</table>
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" colspan="3" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">原標單</td>
                                <td class="auto-style45" colspan="2">校核後</td>
                                <td class="auto-style45" colspan="3">投標預算</td>
                                <td class="auto-style45">&nbsp;</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">單價</td>
                                <td class="auto-style91">複價</td>
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">複價</td>
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">單價</td>
                                <td class="auto-style45">複價</td>
                                <td class="auto-style45">備註</td>
                            </tr>
                            <tr class="TableSingle">
                                <td colspan="3" align="center">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style81"></td>
                                <td class="auto-style79"></td>
                                <td class="auto-style83"></td>
                                <td class="auto-style92">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style77" style="width: 3px"></td>
                                <td class="auto-style77" colspan="2"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style82"></td>
                                <td class="auto-style51"></td>
                                <td class="auto-style77"></td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style93">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style54" align="center">
                                    <asp:Label ID="Label10" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label15" runat="server" Height="25px" Text="清除及掘除" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label19" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label22" runat="server" Text="1,680" Font-Names="微軟正黑體" Format="{0:N4}"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label69" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="auto-autoRight">
                                    <asp:Label ID="Label70" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="26,880"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label71" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="2,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label72" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="32,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label73" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style54" align="center">
                                    <asp:Label ID="Label11" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label16" runat="server" Height="25px" Text="基地及路幅開挖，未含運費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label20" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style43" align="center">
                                    <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label23" runat="server" Text="8,000" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label76" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label107" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label146" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="auto-style84">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label13" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label21" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton10" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label24" runat="server" Text="3,250" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label77" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label108" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label121" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label25" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label26" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label27" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton11" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label28" runat="server" Text="1,000" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label78" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label109" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,067</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style88"></td>
                                <td class="auto-style77"></td>
                                <td class="auto-style77" align="center">
                                    <asp:Label ID="Label29" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style89">
                                    <asp:ImageButton ID="ImageButton12" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label32" runat="server" Text="180" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label79" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,148</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label91" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label110" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label149" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label136" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label33" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label35" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton13" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label36" runat="server" Text="683.78" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label80" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label92" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label111" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label37" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label38" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label39" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton14" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label40" runat="server" Text="3,450" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label81" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">581</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label93" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label112" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="autoCenter" colspan="2">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="auto-style84">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label43" runat="server" Text="1" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label44" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label45" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton15" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label46" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label82" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">103,619</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label152" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label47" runat="server" Text="2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label48" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label49" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton16" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label50" runat="server" Text="1,580" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label83" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,183</asp:Label>
                                </td>
                                <td class="aautoRight">
                                    <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label114" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="aautoRight">
                                    <asp:Label ID="Label127" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="aautoRight">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableNew" id="TrNew1" style="display: none;">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td align="center" class="auto-style40">
                                    <asp:Label ID="Label101" runat="server" Font-Names="微軟正黑體" Text="2a"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label102" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，還原磚，300x300mm"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label103" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton21" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label104" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label105" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,183</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Text="50"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="109,150"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label154" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label141" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">-</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label167" runat="server" Font-Names="微軟正黑體" Text="-"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label51" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton17" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label54" runat="server" Text="542" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label84" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,981</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label155" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label55" runat="server" Text="4" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label56" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label57" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton18" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label58" runat="server" Text="55" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label85" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,807</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label117" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label130" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label156" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label59" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label60" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label61" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton19" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label62" runat="server" Text="1,530" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label86" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,009</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label98" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label118" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label157" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    <asp:Label ID="Label63" runat="server" Text="6" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label64" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label65" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton20" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label66" runat="server" Text="5" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">43,886</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label99" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label119" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label158" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label145" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td colspan="3">&nbsp;</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label67" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="auto-style84">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label100" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,006,643</asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label174" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,120,913</asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label175" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                            </tr>
                        </table>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
