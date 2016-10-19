<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BargainTable.aspx.cs" Inherits="BargainTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <%--<link rel="stylesheet" type="text/css" href="./StyleSB.css" />--%>
    <style type="text/css">
        .SB_Table_M {
            width:100%;
            background-color: #6C6C6C;
        }
        .SB_Row_M {
            background-color: #A6FFA6;
        }
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="5">議價呈核表</td>
            </tr>
            <tr>
                <td class="TableTop2C" style="width: 10%">分包預算編號</td>
                <td class="TableTop2" style="width: 15%">SB003</td>
                <td class="TableTop2C" style="width: 10%">分包預算名稱</td>
                <td class="TableTop2" style="width: 15%">分包預算3</td>
                <td class="TableTop2R" style="width: 50%">&nbsp;&nbsp;<asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp; <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                </td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0C" colspan="6">分包預算工項</td>
                <td class="Table1" colspan="4">育偉土木包工業<asp:ImageButton ID="ImageButton133" runat="server" Height="15px" ImageUrl="~/img/tick.png" ToolTip="目前得標廠商" Width="15px" />
                                </td>
                <td class="Table1" colspan="4">根根營造</td>
                <td class="Table1" colspan="4">老王建設</td>
                <td class="Table1" colspan="4">基基工程行</td>
            </tr>
            <tr>
                <td class="Table0C">執行項次</td>
                <td class="Table0C">工項名稱</td>
                <td class="Table0C">單位</td>
                <td class="Table0C">分包數量</td>
                <td class="Table0C">預算單價</td>
                <td class="Table0C">預算複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
            </tr>
            <tr>
                                            <td class="Table2C">壹.一.3.1</td>
                                            <td class="Table2">
                                                                B2F-挑高模板支撐架</td>
                                            <td class="Table2C">M3</td>
                                            <td class="Table2R">1,000</td>
                                            <td class="Table2R">80</td>
                                            <td class="Table2R">80,000</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
            </tr>
            <tr>
                                            <td class="Table2C">壹.一.4.2</td>
                                            <td class="Table2">
                                                                280kgf/cm2預拌混凝土材料</td>
                                            <td class="Table2C">M3</td>
                                            <td class="Table2R">272</td>
                                            <td class="Table2R">1,480</td>
                                            <td class="Table2R">402,560</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
            </tr>
            <tr>
                                            <td class="Table2C">壹.一.9.1.2</td>
                                            <td class="Table2">
                                                                280kgf/cm2預拌混凝土材料</td>
                                            <td class="Table2C">M3</td>
                                            <td class="Table2R">1,008</td>
                                            <td class="Table2R">1,480</td>
                                            <td class="Table2R">1,491,840</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
            </tr>
            <tr>
                                            <td class="Table2C">[全]</td>
                                            <td class="Table2">
                                                                預拌混凝土澆置工資</td>
                                            <td class="Table2C">工</td>
                                            <td class="Table2R">595.2</td>
                                            <td class="Table2R">3,200</td>
                                            <td class="Table2R">1,904,640</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
                    <td class="Table2R">xxx.xxx</td>
            </tr>
            <tr>
                <td class="Table2">&nbsp;</td>
                <td class="Table2">總計</td>
                <td class="Table2">&nbsp;</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">3,879,040</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
                <td class="Table2R">&nbsp;</td>
                <td class="Table2R">xx,xxx</td>
            </tr>
            <tr class="ShtRowExecuteDeep">
                <td class="ShtCellCC" colspan="6">得標廠商</td>
                <td class="ShtCellCC" colspan="4">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="指定為得標廠商" />
                </td>
                <td class="ShtCellCC" colspan="4">
                    <asp:Button ID="Button2" runat="server" CssClass="BtnFree" Text="指定為得標廠商" />
                </td>
                <td class="ShtCellCC" colspan="4">
                    <asp:Button ID="Button3" runat="server" CssClass="BtnFree" Text="指定為得標廠商" />
                </td>
                <td class="ShtCellCC" colspan="4">
                    <asp:Button ID="Button4" runat="server" CssClass="BtnFree" Text="指定為得標廠商" />
                </td>
            </tr>
            <tr>
                <td class="Table0C" rowspan="13">議<br />
                    約<br />
                    資<br />
                    訊</td>
                <td class="Table1" colspan="5">合約種類</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">履約保證</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxx</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">出廠證明提送</td>
                <td class="Table2" colspan="4">xxxx％提送</td>
                <td class="Table2" colspan="4">xxxx％提送</td>
                <td class="Table2" colspan="4">xxxx％提送</td>
                <td class="Table2" colspan="4">xxxx％提送</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="5">請款次數及請付款日期</td>
                <td class="auto-style2" colspan="4">X次/月；xx日請款；xx日付款</td>
                <td class="auto-style2" colspan="4">X次/月；xx日請款；xx日付款</td>
                <td class="auto-style2" colspan="4">X次/月；xx日請款；xx日付款</td>
                <td class="auto-style2" colspan="4">X次/月；xx日請款；xx日付款</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">工程逾罰規定</td>
                <td class="Table2" colspan="4">xxxxxxx；千分之xx/天</td>
                <td class="Table2" colspan="4">xxxxxxx；千分之xx/天</td>
                <td class="Table2" colspan="4">xxxxxxx；千分之xx/天</td>
                <td class="Table2" colspan="4">xxxxxxx；千分之xx/天</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">保養保固年限</td>
                <td class="Table2" colspan="4">保固X年；保養X年；再保固X年</td>
                <td class="Table2" colspan="4">保固X年；保養X年；再保固X年</td>
                <td class="Table2" colspan="4">保固X年；保養X年；再保固X年</td>
                <td class="Table2" colspan="4">保固X年；保養X年；再保固X年</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">稅額百分比</td>
                <td class="Table2" colspan="4">xxxx％</td>
                <td class="Table2" colspan="4">xxxx％</td>
                <td class="Table2" colspan="4">xxxx％</td>
                <td class="Table2" colspan="4">xxxx％</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">承攬範圍</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxx</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">備註</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">xxxxxxxxxxxxxxxx</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">預付款</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；還款保證：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；還款保證：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；還款保證：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；還款保證：xxxxxxxxxxxx</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">工程款</td>
                <td class="Table2" colspan="4">現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">現金xx％；票xx％(xx天)</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">保留款</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)</td>
            </tr>
            <tr>
                <td class="Table1" colspan="5">保固金</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；保留方式：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；保留方式：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；保留方式：xxxxxxxxxxxx</td>
                <td class="Table2" colspan="4">佔xx％；現金xx％；票xx％(xx天)；保留方式：xxxxxxxxxxxx</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
