<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OFundItemView.aspx.cs" Inherits="OFundItemView" %>

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
    <asp:Panel ID="Panel1" runat="server">
        <table class="Table100">
            <tr>
                <td class="TableTop">業主請款單-估驗明細檢視</td>
            </tr>
            </table>
        <table class="Sht100">
            <tr class="ShtRowTop">
                <td class="ShtCellCC" colspan="3">項次</td>
                <td class="ShtCellCC">工項名稱</td>
                <td class="ShtCellCC">單位</td>
                <td class="ShtCellCC">合約數量</td>
                <td class="ShtCellCC">合約單價</td>
                <td class="ShtCellCC">合約複價</td>
                <td class="ShtCellCC">日報記錄數量</td>
                <td class="ShtCellCC">前期累計數量</td>
                <td class="ShtCellCC">前期累計金額</td>
                <td class="ShtCellCC">本期請款數量</td>
                <td class="ShtCellCC">本期請款金額</td>
                <td class="ShtCellCC">本期核撥數量</td>
                <td class="ShtCellCC">本期核撥金額</td>
                <td class="ShtCellCC">備註</td>
            </tr>
            <tr class="ShtRowSingle">
                <td align="center" class="ShtCellCC" colspan="3">
                    <asp:Label ID="Label325" runat="server" Font-Names="微軟正黑體" Text="壹"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label342" runat="server" Font-Names="微軟正黑體" Height="25px" Text="發包工程費"></asp:Label>
                </td>
                <td class="ShtCellCC"></td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 3px"></td>
                <td align="center" class="ShtCellCC" colspan="2">
                    <asp:Label ID="Label326" runat="server" Font-Names="微軟正黑體" Text="一"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label343" runat="server" Font-Names="微軟正黑體" Height="25px" Text="假設工程"></asp:Label>
                </td>
                <td class="ShtCellCC"></td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label327" runat="server" Font-Names="微軟正黑體" Text="1"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label344" runat="server" Font-Names="微軟正黑體" Height="25px" Text="清除及掘除"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label360" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label373" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="1,680"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label374" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="16"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label375" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="31,920"></asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox31" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label328" runat="server" Font-Names="微軟正黑體" Text="2"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label345" runat="server" Font-Names="微軟正黑體" Height="25px" Text="基地及路幅開挖，未含運費"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label361" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label376" runat="server" Font-Names="微軟正黑體" Text="8,000"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label377" runat="server" Font-Names="微軟正黑體" Format="{0:N4}" Text="25"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label378" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">200,000</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox32" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td align="center" class="ShtCellCC" colspan="2">
                    <asp:Label ID="Label329" runat="server" Font-Names="微軟正黑體" Text="二"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label346" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構體工程"></asp:Label>
                </td>
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label330" runat="server" Font-Names="微軟正黑體" Text="1"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label347" runat="server" Font-Names="微軟正黑體" Height="25px" Text="構造物開挖，(含抽排水，依設計圖說計價線)"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label362" runat="server" Font-Names="微軟正黑體" Text="B.M3"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label379" runat="server" Font-Names="微軟正黑體" Text="3,250"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label380" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">38</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label381" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">123,500</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox33" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label331" runat="server" Font-Names="微軟正黑體" Text="2"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label348" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，140kgf/cm2，第1型水泥"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label363" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label382" runat="server" Font-Names="微軟正黑體" Text="1,000"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label383" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label384" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,045,000</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox34" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC"></td>
                <td class="ShtCellCC"></td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label332" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label349" runat="server" Font-Names="微軟正黑體" Height="25px" Text="結構用混凝土，預拌，175kgf/cm2，第1型水泥"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label364" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label385" runat="server" Font-Names="微軟正黑體" Text="180"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label386" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,170</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label387" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">566,640</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox13" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox35" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox14" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label333" runat="server" Font-Names="微軟正黑體" Text="4"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label350" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label365" runat="server" Font-Names="微軟正黑體" Text="KG"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label388" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label389" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">13</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label390" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">8,889</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox15" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 3px">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label334" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label351" runat="server" Font-Names="微軟正黑體" Height="25px" Text="普通模板，(乙種，擋土牆，橋台，車行箱涵，排水箱涵等)"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label366" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label391" runat="server" Font-Names="微軟正黑體" Text="3,450"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label392" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">585</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label393" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,004,450</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox17" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox37" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox18" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC" colspan="2">
                    <asp:Label ID="Label335" runat="server" Font-Names="微軟正黑體" Text="三"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label352" runat="server" Font-Names="微軟正黑體" Height="25px" Text="建築門窗工程"></asp:Label>
                </td>
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label336" runat="server" Font-Names="微軟正黑體" Text="1"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label353" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋁窗，(推射式，氣密窗)，（膠合玻璃，氣密性120等級）"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label367" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label394" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label395" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">104,359</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label396" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">310,857</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox19" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox38" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label337" runat="server" Font-Names="微軟正黑體" Text="2"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label354" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，還原磚，250x250mm"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label368" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label397" runat="server" Font-Names="微軟正黑體" Text="1,580"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label398" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">2,199</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label399" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,449,140</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox21" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox39" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC"></td>
                <td class="ShtCellCC"></td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label338" runat="server" Font-Names="微軟正黑體" Text="3"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label355" runat="server" Font-Names="微軟正黑體" Height="25px" Text="舖地磚，(石質地磚，一級品)，200x200mm，硬底抹縫"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label369" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label400" runat="server" Font-Names="微軟正黑體" Text="542"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label401" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,995</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label402" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">1,073,702</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox23" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox40" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label339" runat="server" Font-Names="微軟正黑體" Text="4"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label356" runat="server" Font-Names="微軟正黑體" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label370" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label403" runat="server" Font-Names="微軟正黑體" Text="55"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label404" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">6,856</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label405" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">374,385</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox25" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox41" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label340" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label357" runat="server" Font-Names="微軟正黑體" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label371" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label406" runat="server" Font-Names="微軟正黑體" Text="1,530"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label407" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">3,030</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label408" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">4,603,770</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox27" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox42" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCC">&nbsp;</td>
                <td align="center" class="ShtCellCC">
                    <asp:Label ID="Label341" runat="server" Font-Names="微軟正黑體" Text="6"></asp:Label>
                </td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label358" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm"></asp:Label>
                </td>
                <td class="ShtCellCC">
                    <asp:Label ID="Label372" runat="server" Font-Names="微軟正黑體" Text="樘"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label409" runat="server" Font-Names="微軟正黑體" Text="5"></asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label410" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">44,199</asp:Label>
                </td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label411" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">219,430</asp:Label>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox29" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">
                    <asp:TextBox ID="TextBox43" runat="server" CssClass="TBshort">xxx.xx</asp:TextBox>
                </td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" colspan="3">&nbsp;</td>
                <td class="ShtCellCL">
                    <asp:Label ID="Label359" runat="server" Font-Names="微軟正黑體" Height="25px" Text="合計"></asp:Label>
                </td>
                <td class="ShtCellCC">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">
                    <asp:Label ID="Label412" runat="server" Font-Names="微軟正黑體" Format="{0:N4}">16,117,881</asp:Label>
                </td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCR">&nbsp;</td>
                <td class="ShtCellCR">xxx.xx</td>
                <td class="ShtCellCC">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
    
    </form>
</body>
</html>
