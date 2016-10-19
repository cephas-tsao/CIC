<%@ Page Language="C#" AutoEventWireup="true" CodeFile="合預4-2.aspx.cs" Inherits="合預4_2" %>

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
        


            .ShtRowSingle {
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
        .ShtRowDouble {
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;
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
                <asp:Label ID="Label278" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
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
                    <asp:ListItem>第1次變更設計</asp:ListItem>
                    <asp:ListItem>第2次變更設計</asp:ListItem>
                    <asp:ListItem>第3次變更設計</asp:ListItem>
                    <asp:ListItem>第4次變更設計</asp:ListItem>
                    <asp:ListItem Enabled="False" Selected="True">第5次變更設計</asp:ListItem>
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
                    <asp:ListItem Selected="True">數量</asp:ListItem>
                    <asp:ListItem Selected="True">單價</asp:ListItem>
                    <asp:ListItem Selected="True">複價(含總價)</asp:ListItem>
                    <asp:ListItem Selected="True">責任歸屬</asp:ListItem>
                    <asp:ListItem Selected="True">原因</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		</table>
    
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" rowspan="2" style="width: 60px">編輯</td>
                                <td class="auto-style45" colspan="3" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style45" colspan="3">原合約預算</td>
                                
                                <td class="auto-style45" colspan="5">
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" ForeColor="#0066FF" ToolTip="變更摘要編輯" NavigateUrl="~/CChangeSummary2.aspx">第5次變更設計</asp:HyperLink>
                                </td>
                                <td class="auto-style45" rowspan="2">變更設計<br />
                                    追加減金額</td>
                                <td class="auto-style45" rowspan="2">備註</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">責任歸屬</td>
                                <td class="auto-style90">原因</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td align="center" class="ShtCellCC" style="width: 60px">
                                    &nbsp;</td>
                                <td colspan="3" align="center">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="auto-style83">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 60px">&nbsp;</td>
                                <td class="auto-style77" style="width: 3px"></td>
                                <td class="auto-style77" colspan="2"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style82"></td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label73" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="26,880"></asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label238" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,980"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label239" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label240" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,680"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    設計圖面的衝突</td>
                                <td class="ShtCellCL">
                                    原預算未列</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label218" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label146" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label159" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label241" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label242" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label243" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label219" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">&nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style40" colspan="2" align="center">
                                    <asp:Label ID="Label12" runat="server" Text="二" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="結構體工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label160" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label244" runat="server" Font-Names="微軟正黑體" Text="4,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label245" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label246" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">152,000</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label220" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+28,500" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Text="800"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label248" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label249" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,436,000</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label221" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="-609,000" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 60px">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label149" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label136" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label250" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label252" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label222" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="auto-style82">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label163" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label254" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label255" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label223" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label256" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label257" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label258" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label224" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">&nbsp;</td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="autoCenter" colspan="2">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label152" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="30"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label260" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="ShtCellChange">
                                    <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,130,770</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="+2,819,913" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label262" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label263" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label264" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 60px">
                                    <asp:ImageButton ID="ImageButton186" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td class="auto-style91"></td>
                                <td class="auto-style92"></td>
                                <td class="auto-style92" align="center">
                                    3</td>
                                <td class="auto-style93">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label266" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="auto-style96">
                                    </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton187" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    4</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label56" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label57" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label268" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label269" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label270" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 60px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    5</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label60" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label61" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label271" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label272" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label273" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 60px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton189" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                </td>
                                <td style="width: 3px">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style40" align="center">
                                    6</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label64" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label65" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
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
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label274" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label275" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label276" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCL">
                                    &nbsp;</td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label230" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="0"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                            </tr>
                            </table>
    
    </div>
    </form>
</body>
</html>
