﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="執預1.aspx.cs" Inherits="執預1" %>

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
       .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         

        .auto-style77 {
            height: 39px;
        }
        .auto-style55 {
            text-align:center;
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
        .auto-style46 {
            width: 37px;
            }
        


            .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

            .auto-style84 {
	width: 37px;
	text-align: center;
}
                    
        .auto-style97 {
            width: 3px;
            height: 35px;
        }
        .auto-style98 {
            text-align: center;
            height: 35px;
        }
        .auto-style99 {
            text-align: left;
            height: 35px;
        }
        .auto-style100 {
            width: 37px;
            text-align: center;
            height: 35px;
        }
                    
        .auto-style101 {
            width: 90px;
        }
        .auto-style102 {
            height: 39px;
            text-align: center;
            width: 90px;
        }
        .auto-style104 {
            text-align: center;
            width: 90px;
        }
        .auto-style105 {
            text-align: center;
            height: 33px;
            width: 90px;
        }
                    
        .auto-style106 {
            width: 3px;
        }
                    
        </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="6">執行預算建置</td>
		</tr>
        <tr>
			<td class="Table0" colspan="6">工項編修</td>
		</tr>
		<tr>
		<td class="auto-style2L">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_AddItem" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增執行預算工項" Width="27px" PostBackUrl="~/AddNewEItem.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px" PostBackUrl="~/ExeBudgetPEdit.aspx" />
                                &nbsp; <asp:ImageButton ID="IBtn_Reload" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="重新匯入合約預算" Width="27px" />
                                &nbsp; <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存" Width="27px" />
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" OnClick="IBtn_Lock_Click" />
                                </td>
		<td class="auto-style2">
                                合約預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,117,881"></asp:Label>
            </td>
            <td class="auto-style2">
                執行預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label217" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="16,121,241"></asp:Label>
            </td>
            <td class="auto-style2">
                                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
		</tr>
		</table>
    
                        <table id="EBudget" border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style101" rowspan="2">編輯</td>
                                <td class="auto-style45" colspan="4" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">合約預算</td>
                                <td class="auto-style45" colspan="3">執行預算</td>
                                <td class="auto-style45" rowspan="2">備註</td>
                                <td class="auto-style45">進度引用<br />
                                </td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style90">數量</td>
                                <td class="auto-style90">單價</td>
                                <td class="auto-style90">複價</td>
                                <td class="auto-style45">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="25px" ImageUrl="~/img/CheckIn.png" ToolTip="全選" Width="25px" />
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="25px" ImageUrl="~/img/CheckOut.png" ToolTip="全不選" Width="25px" />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style102"></td>
                                <td colspan="4" align="center">
                                    <asp:Label ID="Label8" runat="server" Text="壹" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label1" runat="server" Height="25px" Text="發包工程費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style83"></td>
                                <td class="auto-style81"></td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">&nbsp;</td>
                                <td class="auto-style83">
                                    <asp:TextBox ID="TextBox46" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="auto-style83">
                                    <asp:CheckBox ID="CheckBox20" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style102">
                                    </td>
                                <td class="auto-style88"></td>
                                <td class="auto-style77" colspan="3"  align="center">
                                    <asp:Label ID="Label9" runat="server" Text="一" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label14" runat="server" Height="25px" Text="假設工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style82"></td>
                                <td class="auto-style51"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82"></td>
                                <td class="auto-style82">
                                    <asp:TextBox ID="TextBox47" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="auto-style82">
                                    <asp:CheckBox ID="CheckBox21" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton137" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style97"></td>
                                <td class="auto-style98"></td>
                                <td class="auto-style98" colspan="2">1</td>
                                <td class="auto-style99">
                                    <asp:Label ID="Label15" runat="server" Height="25px" Text="清除及掘除" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label19" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style100">
                                    <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" ToolTip="檢視單價分析" />
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label73" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label74" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label75" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="26,880"></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:TextBox ID="TextBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,680</asp:TextBox>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label219" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="18" ></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label220" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="30,240"></asp:Label>
                                </td>
                                <td class="auto-style98">
                                    <asp:TextBox ID="TextBox25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                    </td>
                                <td class="auto-style98">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton139" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style54" align="center">
                                    1.1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label260" runat="server" Height="25px" Text="清除及掘除-機具" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label258" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton23" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="auto-style98">
                                    <asp:TextBox ID="TextBox52" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px" Enabled="False">1,680</asp:TextBox>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label271" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="10"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label274" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16,800"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox26" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton140" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style54" align="center">
                                    1.2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label261" runat="server" Height="25px" Text="清除及掘除-人力" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label259" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style84">
                                    <asp:ImageButton ID="ImageButton24" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="auto-style98">
                                    <asp:TextBox ID="TextBox53" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px" Enabled="False">1,680</asp:TextBox>
                                </td>
                                <td class="auto-style98">
                                    <asp:Label ID="Label273" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="8"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label275" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="13,440"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox27" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104"><asp:ImageButton ID="ImageButton141" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton142" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label16" runat="server" Height="25px" Text="基地及路幅開挖，未含運費" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label20" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">8,000</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label222" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label223" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox28" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style40" colspan="3" align="center">
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
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox29" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox22" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton136" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton143" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label21" runat="server" Text="B.M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton9" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">3,250</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label226" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox30" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton144" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton145" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label26" runat="server" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label27" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton10" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label161" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,000</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label229" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox31" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton147" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" PostBackUrl="~/EReallocation.aspx" />
                                </td>
                                <td class="auto-style88"></td>
                                <td class="auto-style77"></td>
                                <td class="auto-style55" colspan="2">3</td>
                                <td class="auto-style78">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label31" runat="server" Text="M3" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton11" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">180</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label231" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label232" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                                </td>
                                <td class="auto-style82">
                                    <asp:TextBox ID="TextBox32" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="auto-style82">
                                    <asp:CheckBox ID="CheckBox7" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton181" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">3.1</td>
                                <td class="autoLeft">
                                    預拌混凝土，175kgf/cm2，材料</td>
                                <td class="autoCenter">
                                    M3</td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton182" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox56" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px" Enabled="False">180</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    2,799</td>
                                <td class="autoRight">
                                    503,820</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox57" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox25" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton148" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" PostBackUrl="~/ENumberBD.aspx" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">4</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label35" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton12" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox20" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px" Enabled="False">443.78</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label234" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label235" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox33" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox8" runat="server" Text=" " />
                                </td>
                            </tr>
                            
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton151" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                    <asp:ImageButton ID="ImageButton165" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">4.1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label268" runat="server" Height="25px" Text="B1-鋼筋" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label269" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton25" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox48" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">203.78</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    13</td>
                                <td class="autoRight">
                                    2,649.14</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox34" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox9" runat="server" Text=" " />
                                </td>
                            </tr>
                            
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton183" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                    <asp:ImageButton ID="ImageButton184" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">4.2</td>
                                <td class="autoLeft">
                                    1F-鋼筋</td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label276" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton185" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox58" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">240</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    13</td>
                                <td class="autoRight">
                                    3,120</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox59" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox26" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton152" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">5</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label38" runat="server" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label39" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton13" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px" Enabled="False">3,450</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label237" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label238" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox35" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox10" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton167" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                    <asp:ImageButton ID="ImageButton168" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">5.1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label262" runat="server" Height="25px" Text="B1-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label263" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton20" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox49" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,000</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    585</td>
                                <td class="autoRight">
                                    585,000</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox36" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox11" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton170" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                    <asp:ImageButton ID="ImageButton171" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">5.2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label264" runat="server" Height="25px" Text="1F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label265" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton21" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox50" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,225</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    585</td>
                                <td class="autoRight">
                                    716,625</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox12" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton173" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                    <asp:ImageButton ID="ImageButton174" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除項目" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55">5.3</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label266" runat="server" Height="25px" Text="2F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label267" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton22" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox51" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,225</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    585</td>
                                <td class="autoRight">
                                    716,625</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox13" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableExecute">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" PostBackUrl="~/EReallocation.aspx" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">6</td>
                                <td class="autoLeft">
                                    鋼製模板</td>
                                <td class="autoCenter">
                                    M2</td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton180" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    0</td>
                                <td class="autoRight">
                                    0</td>
                                <td class="autoRight">
                                    0</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox54" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">0</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    700</td>
                                <td class="autoRight">
                                    0</td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox55" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox24" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104">
                                    &nbsp;</td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="autoCenter" colspan="3">
                                    <asp:Label ID="Label41" runat="server" Text="三" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label42" runat="server" Height="25px" Text="建築門窗工程" Font-Names="微軟正黑體"></asp:Label>
                                </td>
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
                                    <asp:TextBox ID="TextBox39" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox23" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton153" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton154" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">1</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label44" runat="server" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label45" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton14" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">3</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label240" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label241" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox14" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style105">
                                    <asp:ImageButton ID="ImageButton155" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton156" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">2</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label48" runat="server" Height="25px" Text="舖地磚，還原磚，250x250mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label49" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton15" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label140" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox23" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,580</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label243" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label244" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox15" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton157" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton158" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style91"></td>
                                <td class="auto-style92"></td>
                                <td class="auto-style55" colspan="2">3</td>
                                <td class="auto-style93">
                                    <asp:Label ID="Label52" runat="server" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label53" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:ImageButton ID="ImageButton16" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label155" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:TextBox ID="TextBox24" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">542</asp:TextBox>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label246" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:Label ID="Label247" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                                </td>
                                <td class="auto-style96">
                                    <asp:TextBox ID="TextBox42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                    </td>
                                <td class="autoCenter">
                                    <asp:CheckBox ID="CheckBox16" runat="server" Text=" " />
                                    </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style105">
                                    <asp:ImageButton ID="ImageButton159" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton160" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style91"></td>
                                <td class="auto-style94"></td>
                                <td class="auto-style94" colspan="2">4</td>
                                <td class="auto-style93">
                                    <asp:Label ID="Label56" runat="server" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label57" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:ImageButton ID="ImageButton17" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label156" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:TextBox ID="TextBox11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">55</asp:TextBox>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label249" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:Label ID="Label250" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                                </td>
                                <td class="auto-style94">
                                    <asp:TextBox ID="TextBox43" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="auto-style94">
                                    <asp:CheckBox ID="CheckBox17" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableDouble">
                                <td class="auto-style104">
                                    <asp:ImageButton ID="ImageButton161" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton162" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">5</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label60" runat="server" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label61" runat="server" Text="M2" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton18" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1,530</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label252" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label253" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox44" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox18" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style104"><asp:ImageButton ID="ImageButton163" runat="server" Height="30px" ImageUrl="~/img/NumBD.png" ToolTip="拆數量" Width="27px" />
                                    <asp:ImageButton ID="ImageButton164" runat="server" Height="30px" ImageUrl="~/img/Reallocation.png" ToolTip="拆工料" Width="27px" />
                                </td>
                                <td class="auto-style106">&nbsp;</td>
                                <td class="auto-style55">&nbsp;</td>
                                <td class="auto-style55" colspan="2">6</td>
                                <td class="autoLeft">
                                    <asp:Label ID="Label64" runat="server" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:Label ID="Label65" runat="server" Text="樘" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:ImageButton ID="ImageButton19" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" ToolTip="檢視單價分析" />
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
                                    <asp:TextBox ID="TextBox17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">5</asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label255" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="Label256" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:TextBox ID="TextBox45" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="autoRight">
                                    <asp:CheckBox ID="CheckBox19" runat="server" Text=" " />
                                </td>
                            </tr>
                            <tr class="TableSingle">
                                <td class="auto-style101">&nbsp;</td>
                                <td colspan="4">&nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label67" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                                </td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">&nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label216" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                                </td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    &nbsp;</td>
                                <td class="autoRight">
                                    <asp:Label ID="Label257" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,121,241</asp:Label>
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
