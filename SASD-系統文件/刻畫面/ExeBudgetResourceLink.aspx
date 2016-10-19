<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExeBudgetResourceLink.aspx.cs" Inherits="ExeBudgetResourceLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
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
                            


        .Table1 {
            width: 100%;

            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E0E0E0;
	text-align: center;
	color: #000000;
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
            .autoRight{
           text-align:right;
        }
        
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

        .auto-style78 {
            text-align: left;
            height: 39px;
        }
            .autoCenter{
           text-align:center;
        }
                


            .auto-style91 {
            text-align: left;
            height: 27px;
        }
        .auto-style92 {
            text-align: center;
            height: 27px;
        }
        .auto-style93 {
            text-align: right;
            height: 27px;
        }
                    
            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
                        

        
        .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         

        .auto-style96 {
            text-align: left;
            height: 34px;
        }
        .auto-style97 {
            text-align: center;
            height: 34px;
        }
        .auto-style98 {
            text-align: right;
            height: 34px;
        }
                        

        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">執行預算建置</td>
		</tr>
        <tr>
			<td class="Table0">工項資源串聯</td>
		</tr>
		<tr>
		<td class="auto-style2L" width="50%">
                                    &nbsp;
                                <asp:ImageButton ID="ImageButton214" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="前往工項編輯" Width="27px" PostBackUrl="~/ExeBudgetEdit.aspx" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton215" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px" PostBackUrl="~/ExeBudgetPEdit.aspx" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton212" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存修改" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton213" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                    </td>
		</tr>
		</table>
    
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" colspan="2">選擇串聯項目</td>
                                <td class="auto-style45" rowspan="2">資源來源</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style45" rowspan="2">執行預算<br /> 單價</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style45">主(單選)</td>
                                <td class="auto-style45">從(複選)</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton1" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    共用</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83">
                                    <asp:Label ID="Label21" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    3,250</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton2" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="auto-style78">
                                    140預拌混凝土</td>
                                <td class="autoCenter">
                                    M3</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton3" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="autoLeft">
                                    混凝土養護</td>
                                <td class="autoCenter">
                                    式</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton4" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    共用</td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style97">
                                    M3</td>
                                <td class="auto-style98">
                                    180</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton5" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    共用</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    KG</td>
                                <td class="autoRight">
                                    683.78</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton6" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="auto-style91">
                                    <asp:Label ID="Label38" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style92">
                                    M2</td>
                                <td class="auto-style93">
                                    3,450</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton7" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox7" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    共用</td>
                                <td class="autoLeft">
                                    混凝土養護</td>
                                <td class="autoCenter">
                                    式</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton8" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox8" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="autoLeft">
                                    混凝土養護</td>
                                <td class="autoCenter">
                                    式</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton9" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox9" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style97">
                                    M3</td>
                                <td class="auto-style98">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton11" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox11" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="autoLeft">
                                    混凝土養護</td>
                                <td class="autoCenter">
                                    式</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="autoCenter">
                                    <asp:RadioButton ID="RadioButton10" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox10" runat="server" Text=" " />
                                </td>
                                <td class="autoCenter">
                                    專案</td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label2" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style97">
                                    M3</td>
                                <td class="auto-style98">
                                    &nbsp;</td>
                            </tr>
                            </table>
    
                        <br />
    
    </div>
    </form>
</body>
</html>
