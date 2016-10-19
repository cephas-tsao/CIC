<%@ Page Language="C#" AutoEventWireup="true" CodeFile="合預2.aspx.cs" Inherits="合預2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
        }
        .auto-style2C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: center;
	        color: #000000;
        }
        


        .auto-style8 {
	color: #FF0000;
}
.auto-style13 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFAF60;
	text-align: center;
	color: #000000;
}
.auto-style14 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFE4CA;
	text-align: left;
	color: #000000;
}

.auto-style7DR {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #ECF5FF;
	text-align: right;
	vertical-align:bottom;
	color: #000000;
}


        .auto-style5 {
	text-align: center;
}
        .Table2 {
            width: 100%;
        }
                

        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
        

        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
            border-bottom:ridge;
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
            width: 3px;
        }
        .auto-style54 {
            width: 33px;
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
                        


        .auto-style83 {
	height: 28px;
	text-align: center;
}
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

        .auto-style82 {
	height: 39px;
	text-align: center;
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
                


            .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
                        


            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">合約預算建置編修</td>
		</tr>
		<tr>
		<td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="Section1" runat="server" OnClick="Section1_Click">階層及編號設定</asp:LinkButton>
                </td>
		</tr>
		<tr>
		<td class="auto-style3">
            <asp:Panel ID="Pnl_Layer" runat="server" Visible="false">
                <asp:Panel ID="Pnl_LayerSet" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td class="auto-style2C" style="height:20px">
                                項次編號方式</td>
                            <td class="auto-style3" style="vertical-align:central">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem>獨立編號</asp:ListItem>
                                    <asp:ListItem>組合編號</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="auto-style3" style="vertical-align:central">
                                <br />
                                <asp:Label ID="Label1" runat="server" Height="30px" Text="加入組合符號："></asp:Label>
                                <asp:DropDownList ID="DropDownList5" runat="server" Enabled="False" Font-Size="Medium" Height="30px" Width="50px">
                                    <asp:ListItem>.</asp:ListItem>
                                    <asp:ListItem>-</asp:ListItem>
                                    <asp:ListItem>,</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style3" rowspan="3">說明：<br /> 
                                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton1_Click">獨立編號</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">組合編號</asp:LinkButton>
                                <asp:Panel ID="Pnl_Note1" runat="server" Visible="False">
                                    <span class="auto-style8">&quot;獨立編號&quot;</span>是依照您所設定的各階層編號直接獨立來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：一, 二, 三,...<br /> 第三階：1, 2, 3,...<br /> ...以此類推</asp:Panel>
                                <asp:Panel ID="Pnl_Note2" runat="server" Visible="False">
                                    <span class="auto-style8">&quot;組合編號&quot;</span>則是依照您所設定的各階層編號，以累加方式來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：壹.一, 壹.二, 壹.三,...<br /> 第三階：壹.一.1, 壹.一.2, 壹.一.3,...<br /> ...以此類推</asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2C" style="width: 195px;" rowspan="2">項次編號設定</td>
                            <td class="auto-style3" colspan="2">
                                <table style="width: 100%">
                                    <tr>
                                        <td class="auto-style13">第一階</td>
                                        <td class="auto-style14">
                                            <asp:DropDownList ID="DropDownList28" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px">
                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [LayerOrder] WHERE ([OrderNum] = @OrderNum) ORDER BY [Kind]">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="0" Name="OrderNum" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7DR" colspan="2">
                                <asp:Button ID="Button2" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="+階層" Width="100px" />
                            </td>
                        </tr>
                    </table>
                    </asp:Panel>
                    <table style="width: 100%">
                        <tr>
                            <td class="auto-style5">
                                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="30px" OnClick="Button1_Click" Text="階層及編號設定並鎖定" Width="235px" />
                            </td>
                        </tr>
                    </table>
            </asp:Panel>
            </td>
		</tr>
		<tr>
			<td class="auto-style2L">
                
                    
                &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="Section2" runat="server" OnClick="Section2_Click" ToolTip="新增業主標單之工項">新增工項</asp:LinkButton>
                
                    
                </td>
		</tr>
		<tr>
			<td class="auto-style3">
			    <asp:Panel ID="Pnl_AddItem" runat="server" Visible="False">
                    <table class="Table2">
                        <tr>
                            <td class="auto-style2C">階層</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Selected="True">2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">上層工項</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList17" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="1">壹 發包工程費</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">項次</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList18" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem>一</asp:ListItem>
                                    <asp:ListItem>二</asp:ListItem>
                                    <asp:ListItem Selected="True">三</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">工項類型</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList29" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">統計項目</asp:ListItem>
                                    <asp:ListItem Value="workitem">明細項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="Table2">
                        <tr>
                            <td class="auto-style2C">名稱</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox51" runat="server" Font-Size="Medium" Height="25px" Width="500px"></asp:TextBox>
                            </td>
                            <td class="auto-style2C">單位</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList30" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">備註</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox44" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="auto-style2C">
                                <asp:Button ID="Button16" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定新增" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
		</tr>
            <tr>
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="Section3" runat="server" OnClick="Section4_Click">合約預算明細表</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Pnl_WBS" runat="server">
                        <table border="1" class="Table2">
                            <tr class="auto-style33">
                                <td class="auto-style2C">
                                    <asp:Button ID="Button12" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="120px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button14" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除勾選項目" Width="120px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button13" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="取消勾選" Width="120px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button15" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="明細表清空" Width="120px" />
                                </td>
                                <td class="auto-style2C">
                                    <asp:Button ID="Button23" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="總價調整" OnClick="Button23_Click" Width="120px" />
                                    &nbsp;
                                    <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" PostBackUrl="~/CResourceList.aspx" Text="修正單價(資源統計表)" />
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2" width="70%"></td>
                                <td class="auto-style2">合約預算總價</td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="355,420"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" rowspan="2">&nbsp;</td>
                                <td class="auto-style45" colspan="3" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">合約預算</td>
                                <td class="auto-style45" rowspan="2">備註</td>
                                <td class="auto-style45" rowspan="2">&nbsp;</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">單價</td>
                                <td class="auto-style45">複價</td>
                            </tr>
                            <tr class="TableSingle">
                                <td align="center">
                                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                </td>
                                <td align="center" colspan="3">
                                    <asp:TextBox ID="TextBox37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">壹</asp:TextBox>
                                </td>
                                <td class="autoLeft">
                                    <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">發包工程費</asp:TextBox>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style81"></td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style77" style="width: 3px">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                                </td>
                                <td class="auto-style77" style="width: 3px"></td>
                                <td align="center" class="auto-style77" colspan="2">
                                    <asp:TextBox ID="TextBox38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="32px">一</asp:TextBox>
                                </td>
                                <td class="auto-style78">
                                    <asp:TextBox ID="TextBox10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">假設工程</asp:TextBox>
                                </td>
                                <td class="auto-style82"></td>
                                <td class="auto-style51"></td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td align="center" class="auto-style54">
                                    <asp:TextBox ID="TextBox39" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">1</asp:TextBox>
                                </td>
                                <td class="autoLeft">
                                    <asp:TextBox ID="TextBox11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">清除及掘除</asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">M2</asp:TextBox>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton21" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton21_Click" />
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">1680</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button17_Click" Text="設定工料連結" Width="120px" />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td align="center" class="auto-style54">
                                    <asp:TextBox ID="TextBox40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">2</asp:TextBox>
                                </td>
                                <td class="autoLeft">
                                    <asp:TextBox ID="TextBox12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">基地及路幅開挖，未含運費</asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:TextBox>
                                </td>
                                <td align="center" class="auto-style43">
                                    <asp:ImageButton ID="ImageButton22" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">8000</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Button ID="Button21" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button17_Click" Text="設定工料連結" Width="120px" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td align="center" class="auto-style40" colspan="2">
                                    <asp:TextBox ID="TextBox42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="32px">二</asp:TextBox>
                                </td>
                                <td class="autoLeft">
                                    <asp:TextBox ID="TextBox17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">結構體工程</asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style84">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td align="center" class="auto-style40">
                                    <asp:TextBox ID="TextBox41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">1</asp:TextBox>
                                </td>
                                <td class="autoLeft">
                                    <asp:TextBox ID="TextBox20" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">構造物開挖，(含抽排水，依設計圖說計價線)</asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:TextBox>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton23" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">3250</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Button ID="Button22" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button17_Click" Text="設定工料連結" Width="120px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
		</table>
    
    </div>
    </form>
</body>
</html>
