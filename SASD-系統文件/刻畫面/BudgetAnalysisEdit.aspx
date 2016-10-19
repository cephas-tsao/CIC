<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BudgetAnalysisEdit.aspx.cs" Inherits="BudgetAnalysisEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
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
        .Table3 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
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
        .Table2 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style33L {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: left;
	color: #000000;
}
            .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
        }
            .auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    vertical-align:top;
}


        .auto-style63 {
            width: 100%;
            vertical-align:central;
            border:dashed;
        }
        .auto-style66 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style64 {
            width: 35%;
            vertical-align:central;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
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
                                        <asp:TextBox ID="TextBox43" runat="server" Font-Size="Large" Height="25px" Width="100px" Font-Bold="True">10000</asp:TextBox>
                                        <asp:Button ID="Button26" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="修改" Width="54px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style34A" colspan="8">
                                <asp:Button ID="Button12" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="修改勾選項目" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button14" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除勾選項目" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button13" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="取消勾選" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button15" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="清空所有子項" Width="120px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Button25" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加工料項目" Width="120px" />
                                    </td>
                                </tr>
                            </table>
                            <table class="Table3">
                                <tr>
                                    <td class="auto-style33">&nbsp;</td>
                                    <td class="auto-style33">序號</td>
                                    <td class="auto-style33">工料項目種類</td>
                                    <td class="auto-style33">工料項目名稱</td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style33">單價<br />
                                        分析</td>
                                    <td class="auto-style33">資源編碼</td>
                                    <td class="auto-style33">數量</td>
                                    <td class="auto-style33">備註</td>
                                </tr>
                                <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox9" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox57" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">1</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList38" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X" Selected="True">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox65" runat="server" Font-Size="Medium" Height="25px" Width="500px">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox66" runat="server" Font-Size="Medium" Height="25px" Width="50px">M</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                            <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton8_Click" />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox67" runat="server" Font-Size="Medium" Height="25px" Width="150px">00011</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox68" runat="server" Font-Size="Medium" Height="25px" Width="100px">1000</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox69" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox58" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">2</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X" Selected="True">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox25" runat="server" Font-Size="Medium" Height="25px" Width="500px">棄土區費用(含水土保持)</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox26" runat="server" Font-Size="Medium" Height="25px" Width="50px">M3</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox27" runat="server" Font-Size="Medium" Height="25px" Width="150px">00012</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox28" runat="server" Font-Size="Medium" Height="25px" Width="100px">1200</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox45" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox59" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">3</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList37" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E" Selected="True">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox30" runat="server" Font-Size="Medium" Height="25px" Width="500px">推土機，140~149KW</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox32" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox34" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00001</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox36" runat="server" Font-Size="Medium" Height="25px" Width="100px">12</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox47" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox60" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">4</asp:TextBox>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E" Selected="True">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Height="25px" Width="500px">裝料機，膠輪式，1.50~1.59m3</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00002</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Height="25px" Width="100px">12</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox61" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">5</asp:TextBox>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E" Selected="True">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Height="25px" Width="500px">傾卸貨車，總重21t~21.9t，8L.M3</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox7" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox8" runat="server" Font-Size="Medium" Height="25px" Width="150px">E00003</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox9" runat="server" Font-Size="Medium" Height="25px" Width="100px">60</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox10" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox62" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">6</asp:TextBox>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L" Selected="True">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox11" runat="server" Font-Size="Medium" Height="25px" Width="500px">操作手</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox12" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox13" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00001</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox14" runat="server" Font-Size="Medium" Height="25px" Width="100px">12</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox15" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style72">
                                        <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style72">
                                        <asp:TextBox ID="TextBox63" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">7</asp:TextBox>
                                        </td>
                                    <td class="auto-style72">
                                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L" Selected="True">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style73">
                                        <asp:TextBox ID="TextBox16" runat="server" Font-Size="Medium" Height="25px" Width="500px">駕駛</asp:TextBox>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:TextBox ID="TextBox17" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style72">
                                        &nbsp;</td>
                                    <td class="auto-style72">
                                        <asp:TextBox ID="TextBox18" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00002</asp:TextBox>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:TextBox ID="TextBox19" runat="server" Font-Size="Medium" Height="25px" Width="100px">60</asp:TextBox>
                                    </td>
                                    <td class="auto-style72">
                                        <asp:TextBox ID="TextBox20" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox7" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox70" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">8</asp:TextBox>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L" Selected="True">人力</asp:ListItem>
                                            <asp:ListItem Value="W">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox21" runat="server" Font-Size="Medium" Height="25px" Width="500px">其他普通工及勞力工</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox22" runat="server" Font-Size="Medium" Height="25px" Width="50px">時</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox23" runat="server" Font-Size="Medium" Height="25px" Width="150px">L00099</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox24" runat="server" Font-Size="Medium" Height="25px" Width="100px">60</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox29" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:CheckBox ID="CheckBox8" runat="server" Text=" " />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox64" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">9</asp:TextBox>
                                        </td>
                                    <td class="auto-style34A">
                                        <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="100px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="X">工項</asp:ListItem>
                                            <asp:ListItem Value="M">材料</asp:ListItem>
                                            <asp:ListItem Value="E">機具</asp:ListItem>
                                            <asp:ListItem Value="L">人力</asp:ListItem>
                                            <asp:ListItem Value="W" Selected="True">雜項</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:TextBox ID="TextBox31" runat="server" Font-Size="Medium" Height="25px" Width="500px">工具損耗</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox33" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        &nbsp;</td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox35" runat="server" Font-Size="Medium" Height="25px" Width="150px">W00002</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox37" runat="server" Font-Size="Medium" Height="25px" Width="100px">1</asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:TextBox ID="TextBox38" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                    </table>
                            <table class="Table2">
                                    <tr>
                                    <td class="auto-style33L">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">自專案工料資料庫代入</asp:LinkButton>
                                        </td>
                                </tr>
                                    <tr>
                                    <td class="auto-style34A">
                                        <asp:Panel ID="Pnl_Import" runat="server" Visible="False">
                                            <table class="Table3">
                                                <tr>
                                                    <td class="auto-style75">專案工料資料庫</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-styleD12">
                                                        <table class="auto-style63">
                                                            <tr>
                                                                <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                                <td class="auto-style64">工項種類</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                    <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">工項名稱(關鍵字)</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                                    <br />
                                                                    <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style64">
                                                                    <asp:DropDownList ID="DropDownList33" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                                        <asp:ListItem Value="0">不分類</asp:ListItem>
                                                                        <asp:ListItem Value="X">工項</asp:ListItem>
                                                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">
                                                                    <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" DataSourceID="SqlDataSource2" GridLines="None" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="代入工項" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                <asp:BoundField DataField="ItemName" HeaderText="工項名稱" SortExpression="ItemName">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                                                <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                                                <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                                <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox75" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="AnaNumber" HeaderText="AnaNumber" SortExpression="AnaNumber" Visible="False" />
                                                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                                                <asp:BoundField DataField="BPrice" HeaderText="BPrice" SortExpression="BPrice" Visible="False" />
                                                                <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                                                <asp:BoundField DataField="CReferenceID" HeaderText="CReferenceID" SortExpression="CReferenceID" Visible="False" />
                                                                <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
                                                                <asp:BoundField DataField="CReferenceNumber" HeaderText="CReferenceNumber" SortExpression="CReferenceNumber" Visible="False" />
                                                                <asp:BoundField DataField="Labor" HeaderText="Labor" SortExpression="Labor" Visible="False" />
                                                                <asp:BoundField DataField="Equipment" HeaderText="Equipment" SortExpression="Equipment" Visible="False" />
                                                                <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" Visible="False" />
                                                                <asp:BoundField DataField="MisWork" HeaderText="MisWork" SortExpression="MisWork" Visible="False" />
                                                                <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                                                <asp:BoundField DataField="NewItem" HeaderText="NewItem" SortExpression="NewItem" Visible="False" />
                                                                <asp:BoundField DataField="ItemKind" HeaderText="ItemKind" SortExpression="ItemKind" Visible="False" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [Bid1DB_Library] WHERE [PriceID] = @PriceID" InsertCommand="INSERT INTO [Bid1DB_Library] ([ItemName], [Unit], [Type], [Code], [PccCode], [Complex], [AnaNumber], [Price], [BPrice], [ReferenceID], [CReferenceID], [ReferenceNumber], [CReferenceNumber], [Labor], [Equipment], [Material], [MisWork], [Notes], [NewItem], [ItemKind]) VALUES (@ItemName, @Unit, @Type, @Code, @PccCode, @Complex, @AnaNumber, @Price, @BPrice, @ReferenceID, @CReferenceID, @ReferenceNumber, @CReferenceNumber, @Labor, @Equipment, @Material, @MisWork, @Notes, @NewItem, @ItemKind)" SelectCommand="SELECT * FROM [Bid_Library] ORDER BY [PriceID]" UpdateCommand="UPDATE [Bid1DB_Library] SET [ItemName] = @ItemName, [Unit] = @Unit, [Type] = @Type, [Code] = @Code, [PccCode] = @PccCode, [Complex] = @Complex, [AnaNumber] = @AnaNumber, [Price] = @Price, [BPrice] = @BPrice, [ReferenceID] = @ReferenceID, [CReferenceID] = @CReferenceID, [ReferenceNumber] = @ReferenceNumber, [CReferenceNumber] = @CReferenceNumber, [Labor] = @Labor, [Equipment] = @Equipment, [Material] = @Material, [MisWork] = @MisWork, [Notes] = @Notes, [NewItem] = @NewItem, [ItemKind] = @ItemKind WHERE [PriceID] = @PriceID">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="PriceID" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="ItemName" Type="String" />
                                                                <asp:Parameter Name="Unit" Type="String" />
                                                                <asp:Parameter Name="Type" Type="String" />
                                                                <asp:Parameter Name="Code" Type="String" />
                                                                <asp:Parameter Name="PccCode" Type="String" />
                                                                <asp:Parameter Name="Complex" Type="Int32" />
                                                                <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                                                <asp:Parameter Name="Price" Type="Decimal" />
                                                                <asp:Parameter Name="BPrice" Type="Decimal" />
                                                                <asp:Parameter Name="ReferenceID" Type="String" />
                                                                <asp:Parameter Name="CReferenceID" Type="String" />
                                                                <asp:Parameter Name="ReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="CReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="Labor" Type="Decimal" />
                                                                <asp:Parameter Name="Equipment" Type="Decimal" />
                                                                <asp:Parameter Name="Material" Type="Decimal" />
                                                                <asp:Parameter Name="MisWork" Type="Decimal" />
                                                                <asp:Parameter Name="Notes" Type="String" />
                                                                <asp:Parameter Name="NewItem" Type="Int32" />
                                                                <asp:Parameter Name="ItemKind" Type="String" />
                                                            </InsertParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="ItemName" Type="String" />
                                                                <asp:Parameter Name="Unit" Type="String" />
                                                                <asp:Parameter Name="Type" Type="String" />
                                                                <asp:Parameter Name="Code" Type="String" />
                                                                <asp:Parameter Name="PccCode" Type="String" />
                                                                <asp:Parameter Name="Complex" Type="Int32" />
                                                                <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                                                <asp:Parameter Name="Price" Type="Decimal" />
                                                                <asp:Parameter Name="BPrice" Type="Decimal" />
                                                                <asp:Parameter Name="ReferenceID" Type="String" />
                                                                <asp:Parameter Name="CReferenceID" Type="String" />
                                                                <asp:Parameter Name="ReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="CReferenceNumber" Type="String" />
                                                                <asp:Parameter Name="Labor" Type="Decimal" />
                                                                <asp:Parameter Name="Equipment" Type="Decimal" />
                                                                <asp:Parameter Name="Material" Type="Decimal" />
                                                                <asp:Parameter Name="MisWork" Type="Decimal" />
                                                                <asp:Parameter Name="Notes" Type="String" />
                                                                <asp:Parameter Name="NewItem" Type="Int32" />
                                                                <asp:Parameter Name="ItemKind" Type="String" />
                                                                <asp:Parameter Name="PriceID" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        </td>
                                </tr>
                                    </table>

    
    </div>

                        <br />

    </form>
</body>
</html>
