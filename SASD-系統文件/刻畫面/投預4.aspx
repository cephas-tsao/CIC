<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投預4.aspx.cs" Inherits="投預4" %>

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
    <style type="text/css">



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
.TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
.TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
.TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
        .auto-style45 {
        }
        .auto-style46 {
            width: 37px;
            height: 46px;
        }
        


        .autoLeft{
           text-align:left;
        }
        .autoCenter{
           text-align:center;
        }
        .autoRight{
           text-align:right;
        }
        
        .auto-style43 {
            width: 37px;
        }
                

        .auto-style77 {
            height: 39px;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

        .auto-style55 {
        }
        .auto-style54 {
            width: 33px;
        }
        .LabelC {
            text-align:center;
            vertical-align:central;
        }
        .auto-style79 {
            height: 28px;
        }
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
}
.auto-style83 {
	height: 28px;
	text-align: center;
}
.auto-style84 {
	width: 37px;
	text-align: center;
}
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: right;
                color: #000000;
                height: 33px;
            }
            .auto-style15L {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: left;
                color: #000000;
                height: 33px;
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
            .auto-style85 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
        }
            .auto-style86 {
            width: 3px;
            height: 23px;
        }
        .auto-style87 {
            height: 23px;
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
        .auto-style90 {
            text-align: right;
            height: 39px;
        }
            </style>
</head>
<body>
    <form id="form1" runat="server">
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
			<td class="auto-style1" colspan="2">投標預算數量編修</td>
		</tr>
		<tr>
		<td class="auto-style15L">
                                &nbsp;&nbsp;
                                <asp:Button ID="Button19" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示缺漏項" Width="100px" OnClick="Button19_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button18" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" OnClick="Button18_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
                                </td>
		<td class="auto-style15">
                                <asp:Button ID="Button16" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" />
                            &nbsp;&nbsp;
                                <asp:Button ID="Button17" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
                            &nbsp;&nbsp;
                                </td>
		</tr>
		</table>
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" colspan="3">項次</td>
                                <td class="auto-style45">工項名稱</td>
                                <td class="auto-style45">單位</td>
                                <td class="auto-style46">單價分析</td>
                                <td class="auto-style45">原標單數量</td>
                                <td class="auto-style45">校核後數量</td>
                                <td class="auto-style45">備註</td>
                            </tr>
                            <tr class="TableSingle">
                                <td colspan="3" class="autoCenter">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style81"></td>
                                <td class="auto-style79"></td>
                                <td class="auto-style83"></td>
                                <td class="auto-style83">
                                    <asp:TextBox ID="TextBox58" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="auto-style82">
                                    <asp:TextBox ID="TextBox59" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td align="center">
                                    <asp:Label ID="Label19" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label22" runat="server" Text="1,680" Font-Names="微軟正黑體" Format="{0:N4}"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox51" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox57" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox52" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox55" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">&nbsp;</td>
                                <td class="auto-style84">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoCenter">&nbsp;</td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox56" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox53" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox54" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox60" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox61" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="auto-style82">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style89">
                                    <asp:ImageButton ID="ImageButton12" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="auto-style90">
                                    <asp:Label ID="Label32" runat="server" Text="180" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style82">
                                    <asp:TextBox ID="TextBox62" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="auto-style82">
                                    <asp:TextBox ID="TextBox63" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox64" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox65" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox66" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox67" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TableNew" id="TrNew1" style="display: none;">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    5a</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label69" runat="server" Height="25px" Text="鋼製模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label70" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton22" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox82" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox83" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="2" align="center">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    &nbsp;</td>
                                <td class="auto-style84">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoCenter">
                                    &nbsp;</td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox84" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox68" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox69" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox70" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox71" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="TableNew" id="TrNew2" style="display: none;">
                                <td class="auto-style86"></td>
                                <td class="auto-style87"></td>
                                <td class="auto-style87" align="center">
                                    2a</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label67" runat="server" Height="25px" Text="舖地磚，還原磚，300x300mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label68" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton21" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox80" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox81" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox72" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox73" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox74" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox75" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox76" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox77" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
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
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox78" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TextBox79" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
