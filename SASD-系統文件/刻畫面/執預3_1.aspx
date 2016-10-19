<%@ Page Language="C#" AutoEventWireup="true" CodeFile="執預3_1.aspx.cs" Inherits="執預3_0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
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
                        
        .auto-style101 {
            width: 122px;
        }
        .auto-style46 {
            width: 37px;
            }
        


            .auto-style102 {
            height: 39px;
            text-align: center;
            width: 122px;
        }
                


            .auto-style81 {
            width: 37px;
            height: 28px;
        }
                        

            .auto-style104 {
            text-align: center;
            width: 122px;
        }
                            
        .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFECEC;
	color: #000000;
}         
        .TableNewExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         
        .auto-style55 {
            text-align:center;
        }
                        

            .auto-style105 {
            text-align: center;
            height: 33px;
            width: 122px;
        }
                    
        .auto-style106 {
	text-align: center;
	color: #FF0000;
}
                    
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="5">執行預算變更</td>
		</tr>
		<tr>
		<td class="auto-style2L" width="40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/AddNewList.png" ToolTip="新增執行預算變更" Width="27px" PostBackUrl="~/EChangeSummaryA.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton175" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" PostBackUrl="~/EChangeAdd.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
		<td class="auto-style2">
                                變更後合約預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label462" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
            </td>
            <td class="auto-style2">
                變更後執行預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                    選擇顯示之變更次別</td>
            <td class="auto-style3">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Enabled="False" Selected="True">原執行預算</asp:ListItem>
                    <asp:ListItem>第1次變更</asp:ListItem>
                    <asp:ListItem>第2次變更</asp:ListItem>
                    <asp:ListItem Selected="True">第3次變更</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td class="auto-style2" rowspan="2">
                                    <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="重新載入" PostBackUrl="~/合預4-3.aspx" />
                                </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                    選擇顯示之欄位</td>
            <td class="auto-style3">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">數量</asp:ListItem>
                    <asp:ListItem Selected="True">單價</asp:ListItem>
                    <asp:ListItem Selected="True">複價(含總價)</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		</table>
    
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style101" rowspan="2">編輯</td>
                                <td class="auto-style45" colspan="4" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">
                                    原執行預算</td>
                                <td class="auto-style45" colspan="3">
                                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/EChangeSummaryE.aspx">第3次變更</asp:HyperLink>
                                </td>
                                <td class="auto-style45" rowspan="2">備註</td>
                                <td class="auto-style45" rowspan="2">進度項目<br />
                                </td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style102"></td>
                                <td colspan="4" align="center">
                                    <asp:Label ID="Label276" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label277" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style81"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="auto-style83">
                                    &nbsp;</td>
                                <td class="auto-style83">
                                    <asp:CheckBox ID="CheckBox25" runat="server" Text=" " Enabled="False" />
                                    </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="3" align="center">
                                    <asp:Label ID="Label296" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label297" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox28" runat="server" Text=" " Enabled="False" />
                                    </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label298" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label299" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton9" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label303" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label304" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label305" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label422" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label423" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label424" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox30" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label306" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label307" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton10" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label311" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label312" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label313" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    1,500</td>
                                <td class="ShtCellCR">
                                    3,045</td>
                                <td class="ShtCellCR">
                                    4,567,500</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox34" runat="server" Text=" " Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104" style="height: 33px">
                                    <asp:ImageButton ID="ImageButton217" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/EChangeDetail.aspx" />
                                </td>
                                <td style="width: 3px; height: 33px;"></td>
                                <td class="auto-style55" style="height: 33px"></td>
                                <td class="auto-style55" style="height: 33px"></td>
                                <td class="auto-style55" style="height: 33px">2.1</td>
                                <td class="autoLeft" style="height: 33px">
                                    基礎底層-140混凝土</td>
                                <td class="autoCenter" style="height: 33px">
                                    <asp:Label ID="Label461" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter" style="height: 33px">
                                    <asp:ImageButton ID="ImageButton213" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR" style="height: 33px">
                                    500</td>
                                <td class="ShtCellCR" style="height: 33px">
                                    3,045</td>
                                <td class="ShtCellCR" style="height: 33px">
                                    1,522,500</td>
                                <td class="ShtCellCR" style="height: 33px">
                                    800</td>
                                <td class="ShtCellCR" style="height: 33px">
                                    3,045</td>
                                <td class="ShtCellCR" style="height: 33px">
                                    2,436,000</td>
                                <td class="autoRight" style="height: 33px">
                                    </td>
                                <td class="autoRight" style="height: 33px">
                                    <asp:CheckBox ID="CheckBox31" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton223" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">2.2</td>
                                <td class="autoLeft">
                                    1F-140混凝土</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label463" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton221" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    250</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label470" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    761,250</td>
                                <td class="ShtCellCR">
                                    350</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label468" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    1,065,750</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox32" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton224" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">2.3</td>
                                <td class="autoLeft">
                                    2F-140混凝土</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label464" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton222" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    250</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label471" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    761,250</td>
                                <td class="ShtCellCR">
                                    350</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label469" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    1,065,750</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox33" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td class="auto-style88"></td>
                                <td class="auto-style77"></td>
                                <td class="auto-style55" colspan="2">3</td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label314" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label315" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton11" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label319" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label320" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label321" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label428" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label429" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label430" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                                <td class="auto-style82">
                                    <asp:CheckBox ID="CheckBox35" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton225" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td class="auto-style88">&nbsp;</td>
                                <td class="auto-style77">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">3.1</td>
                                <td class="auto-style78">
                                    175混凝土材料費</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label482" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton254" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label484" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    2,900</td>
                                <td class="ShtCellCR">
                                    522,000</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label486" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    2,900</td>
                                <td class="ShtCellCR">
                                    522,000</td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                                <td class="auto-style82">
                                    <asp:CheckBox ID="CheckBox56" runat="server" Text=" " Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton256" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td class="auto-style88">&nbsp;</td>
                                <td class="auto-style77">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">3.2</td>
                                <td class="auto-style78">
                                    175混凝土工</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label483" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton255" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label485" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    270</td>
                                <td class="ShtCellCR">
                                    48,600</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label487" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    270</td>
                                <td class="ShtCellCR">
                                    48,600</td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                                <td class="auto-style82">
                                    <asp:CheckBox ID="CheckBox57" runat="server" Text=" " Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="autoCenter" colspan="3">
                                    <asp:Label ID="Label337" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label338" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox29" runat="server" Text=" " Enabled="False" />
                                    </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton208" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label339" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label340" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton14" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label239" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label240" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label241" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label437" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label438" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label439" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox44" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style105">
                                    <asp:ImageButton ID="ImageButton229" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label344" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label345" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton15" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label242" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label243" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label244" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label440" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label441" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label442" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox45" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton230" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td class="auto-style91"></td>
                                <td class="auto-style92"></td>
                                <td class="auto-style55" colspan="2">3</td>
                                <td class="auto-style93">
                                    <asp:Label ID="Label349" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label350" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:ImageButton ID="ImageButton16" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label245" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label246" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label443" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label444" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label445" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox46" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton231" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">4</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label354" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label355" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton17" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label248" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label249" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label250" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label446" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label447" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label448" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox47" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton232" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">5</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label359" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label360" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton18" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label252" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label449" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label450" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label451" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox48" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton233" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">6</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label364" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label365" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton19" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label254" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label255" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label256" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label452" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label453" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label454" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox49" runat="server" Text=" " Checked="True" Enabled="False" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style101">&nbsp;</td>
                                <td colspan="4">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label369" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label257" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,121,241</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label455" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,121,241</asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
    
    </div>
    </form>
</body>
</html>
