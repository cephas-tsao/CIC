<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnalysisV.aspx.cs" Inherits="AnalysisV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
        .auto-style34A {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: center;
	color: #000000;
}
        .auto-style34 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}
        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table2 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table3 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style34A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 35px;
        }
        .auto-style34 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 35px;
        }
        .auto-style72 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 33px;
        }
        .auto-style73 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 33px;
        }
        .auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
	text-align: center;
	color: #FFFFFF;
    }
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
}
.auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    vertical-align:top;
}


        .auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFD2D2;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
            .auto-style74 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: left;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
            </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    

                            <table class="Table1">
                                <tr>
                                    <td class="auto-style33">工項名稱</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清除及掘除"></asp:Label>
                                    </td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="M2"></asp:Label>
                                    </td>
                                    <td class="auto-style33">資源代碼</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="00001"></asp:Label>
                                    </td>
                                    <td class="auto-style33">分析數量</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="10,000"></asp:Label>
                                    </td>
                                </tr>
                                </table>
                            <table class="Table2">
                                <tr>
                                    <td class="auto-style33">序號</td>
                                    <td class="auto-style33">工料項目種類</td>
                                    <td class="auto-style33">工料項目名稱</td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style33">單價<br />
                                        分析</td>
                                    <td class="auto-style33">資源編碼</td>
                                    <td class="auto-style33">數量</td>
                                    <td class="auto-style33">原填列單價</td>
                                    <td class="auto-style33">原複價</td>
                                    <td class="auto-style33">投標單價</td>
                                    <td class="auto-style33">投標複價</td>
                                    <td class="auto-style33">備註</td>
                                </tr>
                                <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label57" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">1</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label212" runat="server" Font-Size="Medium" Height="25px" Width="50px">工項</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label65" runat="server" Font-Size="Medium" Height="25px" Width="500px">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label66" runat="server" Font-Size="Medium" Height="25px" Width="50px">M</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                            <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label67" runat="server" Font-Size="Medium" Height="25px" Width="150px">00011</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label68" runat="server" Font-Size="Medium" Height="25px" Width="100px">1,000.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label221" runat="server" Font-Size="Medium" Height="25px">200.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label238" runat="server" Font-Size="Medium" Height="25px">200,000.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label241" runat="server" Font-Size="Medium" Height="25px">200.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label242" runat="server" Font-Size="Medium" Height="25px">200,000.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label69" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label58" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">2</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label213" runat="server" Font-Size="Medium" Height="25px" Width="50px">工項</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label25" runat="server" Font-Size="Medium" Height="25px" Width="500px">棄土區費用(含水土保持)</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label26" runat="server" Font-Size="Medium" Height="25px" Width="50px">M3</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label27" runat="server" Font-Size="Medium" Height="25px" Width="150px">00012</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label28" runat="server" Font-Size="Medium" Height="25px" Width="100px">1,200.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label240" runat="server" Font-Size="Medium" Height="25px">50.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label237" runat="server" Font-Size="Medium" Height="25px">60,000.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label243" runat="server" Font-Size="Medium" Height="25px">50.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label244" runat="server" Font-Size="Medium" Height="25px">60,000.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label45" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                <tr>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label59" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">3</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label214" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                    </td>
                                    <td class="auto-style75">
                                        <asp:Label ID="Label30" runat="server" Font-Size="Medium" Height="25px" Width="500px">推土機，140~149KW</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label32" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label34" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00001</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label36" runat="server" Font-Size="Medium" Height="25px" Width="100px">12.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label222" runat="server" Font-Size="Medium" Height="25px">1,606.500</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label236" runat="server" Font-Size="Medium" Height="25px">19,278.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label245" runat="server" Font-Size="Medium" Height="25px">1,606.500</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label246" runat="server" Font-Size="Medium" Height="25px">19,278.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label47" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label60" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">4</asp:Label>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label215" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label111" runat="server" Font-Size="Medium" Height="25px" Width="500px">裝料機，膠輪式，1.50~1.59m3</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label211" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="A" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00002</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label41" runat="server" Font-Size="Medium" Height="25px" Width="100px">12.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label223" runat="server" Font-Size="Medium" Height="25px">832.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label235" runat="server" Font-Size="Medium" Height="25px">9,984.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label247" runat="server" Font-Size="Medium" Height="25px">832.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label248" runat="server" Font-Size="Medium" Height="25px">9,984.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label5" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label61" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">5</asp:Label>
                                        </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label216" runat="server" Font-Size="Medium" Height="25px" Width="50px">機具</asp:Label>
                                    </td>
                                    <td class="auto-style75">
                                        <asp:Label ID="Label6" runat="server" Font-Size="Medium" Height="25px" Width="500px">傾卸貨車，總重21t~21.9t，8L.M3</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label7" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label8" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00003</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label9" runat="server" Font-Size="Medium" Height="25px" Width="100px">60.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label224" runat="server" Font-Size="Medium" Height="25px">481.950</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label234" runat="server" Font-Size="Medium" Height="25px">28,917.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label249" runat="server" Font-Size="Medium" Height="25px">481.950</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label250" runat="server" Font-Size="Medium" Height="25px">28,917.000</asp:Label>
                                    </td>
                                    <td class="auto-style74">
                                        <asp:Label ID="Label10" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label62" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">6</asp:Label>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label217" runat="server" Font-Size="Medium" Height="25px" Width="50px">人力</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label11" runat="server" Font-Size="Medium" Height="25px" Width="500px">操作手</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label12" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label13" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00001</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label14" runat="server" Font-Size="Medium" Height="25px" Width="100px">12.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label225" runat="server" Font-Size="Medium" Height="25px">310.650</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label233" runat="server" Font-Size="Medium" Height="25px">3,727.800</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label251" runat="server" Font-Size="Medium" Height="25px">310.650</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label252" runat="server" Font-Size="Medium" Height="25px">3,727.800</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label15" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label63" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">7</asp:Label>
                                        </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label218" runat="server" Font-Size="Medium" Height="25px" Width="50px">人力</asp:Label>
                                    </td>
                                    <td class="auto-style73">
                                        <asp:Label ID="Label16" runat="server" Font-Size="Medium" Height="25px" Width="500px">駕駛</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label17" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        &nbsp;</td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label18" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00002</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label19" runat="server" Font-Size="Medium" Height="25px" Width="100px">60.000</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label239" runat="server" Font-Size="Medium" Height="25px">310.650</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label232" runat="server" Font-Size="Medium" Height="25px">18,639.000</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label253" runat="server" Font-Size="Medium" Height="25px">310.650</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label254" runat="server" Font-Size="Medium" Height="25px">18,639.000</asp:Label>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:Label ID="Label20" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label70" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">8</asp:Label>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label219" runat="server" Font-Size="Medium" Height="25px" Width="50px">人力</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label21" runat="server" Font-Size="Medium" Height="25px" Width="500px">其他普通工及勞力工</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label22" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label23" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00099</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label24" runat="server" Font-Size="Medium" Height="25px" Width="100px">60.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label227" runat="server" Font-Size="Medium" Height="25px">198.820</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label231" runat="server" Font-Size="Medium" Height="25px">11,929.200</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label255" runat="server" Font-Size="Medium" Height="25px">198.820</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label256" runat="server" Font-Size="Medium" Height="25px">11,929.200</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label29" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label64" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">9</asp:Label>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label220" runat="server" Font-Size="Medium" Height="25px" Width="50px">雜項</asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="Label31" runat="server" Font-Size="Medium" Height="25px" Width="500px">工具損耗</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label33" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label35" runat="server" Font-Size="Medium" Height="25px" Width="150px">W00002</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label37" runat="server" Font-Size="Medium" Height="25px" Width="100px">1.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label228" runat="server" Font-Size="Medium" Height="25px">7,525.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label230" runat="server" Font-Size="Medium" Height="25px">7,525.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label257" runat="server" Font-Size="Medium" Height="25px">7,525.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label258" runat="server" Font-Size="Medium" Height="25px">7,525.000</asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="Label38" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                </tr>
                                    </table>

    
    </div>

                        <br />

    </form>
</body>
</html>
