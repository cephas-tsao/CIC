<%@ Page Language="C#" AutoEventWireup="true" CodeFile="合預4-3.aspx.cs" Inherits="合預4_3" %>

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
            height: 25px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
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
                        

        .auto-style54 {
            width: 33px;
        }
        .autoCenter {
            text-align: center;
        }
                            


            .autoRight{
           text-align:center;
        }
                


            .autoRight{
           text-align:right;
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
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        <br />
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="5">合約預算變更</td>
		</tr>
		<tr>
		<td class="auto-style2L" width="40%">
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/AddNewList.png" ToolTip="新增合約變更" Width="27px" PostBackUrl="~/CChangeSummaryA.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton175" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" PostBackUrl="~/CChangeAdd.aspx" />
                                    &nbsp;
                                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
		<td class="auto-style2">
                                原合約預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,117,881"></asp:Label>
            </td>
            <td class="auto-style2">
                變更後合約預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,374,894"></asp:Label>
            </td>
		</tr>
		</table>
    
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                    選擇顯示之變更次別</td>
            <td class="auto-style3">
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Enabled="False" Selected="True">原合約預算</asp:ListItem>
                    <asp:ListItem Selected="True">第1次變更設計</asp:ListItem>
                    <asp:ListItem Selected="True">第2次變更設計</asp:ListItem>
                    <asp:ListItem Selected="True">第3次變更設計</asp:ListItem>
                    <asp:ListItem Enabled="False" Selected="True">第4次變更設計</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td class="auto-style2" rowspan="2">
                                    <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="重新載入" />
                                </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                    選擇顯示之欄位</td>
            <td class="auto-style3">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>數量</asp:ListItem>
                    <asp:ListItem>單價</asp:ListItem>
                    <asp:ListItem Selected="True">複價(含總價)</asp:ListItem>
                    <asp:ListItem>責任歸屬</asp:ListItem>
                    <asp:ListItem>原因</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		</table>
    
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" rowspan="2">編輯</td>
                                <td class="auto-style45" colspan="3" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style45">原合約預算</td>
                                
                                <td class="auto-style45">
                                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第1次變更設計</asp:HyperLink>
                                </td>
                                
                                <td class="auto-style45">
                                    <asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第2次變更設計</asp:HyperLink>
                                </td>
                                
                                <td class="auto-style45">
                                    <asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第3次變更設計</asp:HyperLink>
                                </td>
                                
                                <td class="auto-style45">
                                    <asp:HyperLink ID="HyperLink6" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第4次變更設計</asp:HyperLink>
                                </td>
                                <td class="auto-style45" rowspan="2">變更設計<br />
                                    追加減金額</td>
                                <td class="auto-style45" rowspan="2">備註</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">複價</td>
                            </tr>
                            <tr class="TableSingle">
                                <td align="center">
                                    &nbsp;</td>
                                <td colspan="3" align="center">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">
                                    &nbsp;</td>
                                <td class="auto-style83">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style77" style="width: 3px">&nbsp;</td>
                                <td class="auto-style88"></td>
                                <td class="auto-style77" colspan="2"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">&nbsp;</td>
                                <td class="auto-style82">
                                    </td>
                                <td class="auto-style82">
                                    </td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CChangeDetail.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label278" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label292" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label306" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label218" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label279" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label293" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label307" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label182" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label219" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label280" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label294" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label308" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">152,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label220" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+28,500" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label281" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">2,892,750</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label295" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">2,740,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label309" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">2,588,250</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label188" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">2,436,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label221" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="-609,000" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style88">
                                    <asp:ImageButton ID="ImageButton181" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label282" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label296" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label310" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label191" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label222" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label283" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label297" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label311" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label194" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label223" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label284" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label298" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label312" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label197" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label224" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">&nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="autoCenter" colspan="2">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton184" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label285" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label299" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label313" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label200" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">3,130,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,819,913" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label286" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label300" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label314" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label203" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style91">
                                    <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td class="auto-style91"></td>
                                <td class="auto-style92"></td>
                                <td class="auto-style92" align="center">
                                    <asp:Label ID="Label51" runat="server" Text="3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style93">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label287" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label301" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label315" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label206" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="auto-style96">
                                    </td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label288" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label302" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label316" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label209" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableDouble">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label289" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label303" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label317" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label212" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td style="width: 3px">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
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
                                <td class="autoRight">
                                    <asp:Label ID="Label171" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label290" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label304" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label318" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label215" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label230" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="TableSingle">
                                <td>&nbsp;</td>
                                <td colspan="3">&nbsp;</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label67" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label216" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label291" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">15,965,631</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label305" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">15,813,381</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label319" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">15,661,131</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label217" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" ForeColor="Red">18,357,294</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label231" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,239,413" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                            </tr>
                        </table>
    
    </div>
    </form>
</body>
</html>
