<%@ Page Language="C#" AutoEventWireup="true" CodeFile="財管1.aspx.cs" Inherits="財管1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">財務會計用編碼編輯</td>
		</tr>
		<tr>
		<td class="Table1L" width="50%">
                                    &nbsp;
                                <asp:ImageButton ID="ImageButton212" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存修改" Width="27px" />
                                &nbsp; 
                                    </td>
		<td class="Table1R">
                                &nbsp;<asp:ImageButton ID="ImageButton210" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton211" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                &nbsp; &nbsp;</td>
		</tr>
		<tr>
		<td class="Table1L">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem>依執行預算工作項目填寫</asp:ListItem>
                                    <asp:ListItem>依執行預算資源項目填寫</asp:ListItem>
                                </asp:RadioButtonList>
                                    </td>
		<td class="Table1L">
                                1.請使用者依本身需求選擇工作項目或資源項目填寫財會編碼。<br />
                                2.填寫完畢請記得點選儲存按鈕才算完成。<br />
                                3.匯出Excel及PDF檔功能僅匯出已編寫財會編碼且儲存之項目對應清單。</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                <asp:Panel ID="Pnl_WBS" runat="server" Visible="False">
                                    <table class="Sht100">
                                        <tr class="ShtRowTop">
                                            <td class="ShtCellCC" colspan="4">項次</td>
                                            <td class="ShtCellCC">工項名稱</td>
                                            <td class="ShtCellCC">單位</td>
                                            <td class="ShtCellCC">財會編碼</td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td align="center" colspan="4" class="ShtCellCC">
                                                <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Text="壹"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Height="25px" Text="發包工程費"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCC" style="width: 3px"></td>
                                            <td align="center" class="ShtCellCC" colspan="3">
                                                <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Text="一"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label14" runat="server" Font-Names="微軟正黑體" Height="25px" Text="假設工程"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC" colspan="2">1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label19" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td align="center" class="ShtCellCC">1.1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label260" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除-機具"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label258" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td align="center" class="ShtCellCC">1.2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除-人力"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label259" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Height="25px" Text="基地及路幅開挖，未含運費"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label20" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td align="center" class="ShtCellCC" colspan="3">
                                                <asp:Label ID="Label12" runat="server" Font-Names="微軟正黑體" Text="二"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label17" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構體工程"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label21" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label26" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label27" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox9" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC" colspan="2">3</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label30" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label31" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">4</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label34" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label35" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">4.1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label268" runat="server" Font-Names="微軟正黑體" Height="25px" Text="B1-鋼筋"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label269" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">4.2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label463" runat="server" Font-Names="微軟正黑體" Height="25px" Text="1F-鋼筋"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label464" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">4.3</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label465" runat="server" Font-Names="微軟正黑體" Height="25px" Text="2F-鋼筋"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label466" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox14" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">5</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label38" runat="server" Font-Names="微軟正黑體" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label39" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox15" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">5.1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label262" runat="server" Font-Names="微軟正黑體" Height="25px" Text="B1-普通模板"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label263" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">5.2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label264" runat="server" Font-Names="微軟正黑體" Height="25px" Text="1F-普通模板"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label265" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox17" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowExecuteDeep">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">5.3</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label266" runat="server" Font-Names="微軟正黑體" Height="25px" Text="2F-普通模板"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label267" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox18" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="3">
                                                <asp:Label ID="Label41" runat="server" Font-Names="微軟正黑體" Text="三"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label42" runat="server" Font-Names="微軟正黑體" Height="25px" Text="建築門窗工程"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox19" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">1</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label44" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label45" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">2</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label48" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，還原磚，250x250mm"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label49" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC"></td>
                                            <td class="ShtCellCC" colspan="2">3</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label52" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label53" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">4</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label56" runat="server" Font-Names="微軟正黑體" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label57" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">5</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label60" runat="server" Font-Names="微軟正黑體" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label61" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC">&nbsp;</td>
                                            <td class="ShtCellCC" colspan="2">6</td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label64" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label65" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_Resource" runat="server" Visible="False">
                                    <table class="Sht100">
                                        <tr class="ShtRowTop">
                                            <td class="ShtCellCC">資源編碼</td>
                                            <td class="ShtCellCC">資源名稱</td>
                                            <td class="ShtCellCC">單位</td>
                                            <td class="ShtCellCC">財會編碼</td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label591" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工警告燈號，定光燈號，裝拆"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label108" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0156403102"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label88" runat="server" Font-Names="微軟正黑體" Height="25px" Text="施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label127" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label109" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02240A0003"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Height="25px" Text="袪水，擋抽排水"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label110" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02323A0003"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Height="25px" Text="棄土區費用(含水土保持)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label592" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0339000004"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label91" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土養護"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label130" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label112" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label593" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox31" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002421501"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Height="25px" Text="裝料機，膠輪式，1.50~1.59m3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox32" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label114" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002600004"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土泵"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox33" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000003421801"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Height="25px" Text="傾卸貨車，總重21t~21.9t，8L.M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox34" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000004417901"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox35" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005100602"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Height="25px" Text="操作手，年資6~10年"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox36" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label168" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005P00002"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label169" runat="server" Font-Names="微軟正黑體" Height="25px" Text="模版安裝工"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label170" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox37" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label172" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000006900002"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label173" runat="server" Font-Names="微軟正黑體" Height="25px" Text="混凝土作業工"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label174" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox38" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label180" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0258012134"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label181" runat="server" Font-Names="微軟正黑體" Height="25px" Text="注油電桿，杉木，雜酚油，三級，L=6.5M"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label182" runat="server" Font-Names="微軟正黑體" Text="支"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox40" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label118" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050421A3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label99" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，140kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label137" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox41" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label184" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M03050431A3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，預拌混凝土材料費，175kgf/cm2，第1型水泥，(工地交貨，含減水劑)"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label186" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox42" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label119" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0321030005"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label100" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼筋，SD280"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label138" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox43" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110a001A"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label101" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門框，烤漆選色"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label139" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox44" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label188" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08110b002A"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label189" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，鋼門扇及門樘，鍍鋅烤漆鋼門扇，45db，烤漆選色"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label190" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox45" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label192" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M08710E0008"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label193" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，門五金，不鏽鋼天地栓"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label194" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox46" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label196" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M0871150008"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label197" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，標準門鉸鏈，自動歸位型"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label198" runat="server" Font-Names="微軟正黑體" Text="組"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox47" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label200" runat="server" Font-Names="微軟正黑體" Height="25px" Text="M088100130A"></asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label201" runat="server" Font-Names="微軟正黑體" Height="25px" Text="產品，玻璃，平面，t=3mm"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label202" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox48" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label204" runat="server" Font-Names="微軟正黑體" Height="25px">M093103C00A</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label205" runat="server" Font-Names="微軟正黑體" Height="25px">產品，瓷磚，(瓷質壁磚，一級品)，200x200mm</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label206" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox49" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label208" runat="server" Font-Names="微軟正黑體" Height="25px">M093412304A</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label209" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label210" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox50" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label595" runat="server" Font-Names="微軟正黑體" Height="25px">M09341r400A</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label596" runat="server" Font-Names="微軟正黑體" Height="25px">產品，舖地磚，還原磚，250x250mm</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label597" runat="server" Font-Names="微軟正黑體" Text="塊"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox51" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Height="25px">M096342304A</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label103" runat="server" Font-Names="微軟正黑體" Height="25px">產品，花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label141" runat="server" Font-Names="微軟正黑體" Text="才"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox52" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Height="25px">W0127116004</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label104" runat="server" Font-Names="微軟正黑體" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label142" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox53" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowSingle">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Height="25px">W0127120004</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Height="25px">工具損耗</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox54" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="ShtRowDouble">
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Height="25px">W0127130004</asp:Label>
                                            </td>
                                            <td class="ShtCellCL">
                                                <asp:Label ID="Label107" runat="server" Font-Names="微軟正黑體" Height="25px">運雜費</asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:Label ID="Label144" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                            </td>
                                            <td class="ShtCellCC">
                                                <asp:TextBox ID="TextBox55" runat="server" CssClass="TBmiddle"></asp:TextBox>
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
