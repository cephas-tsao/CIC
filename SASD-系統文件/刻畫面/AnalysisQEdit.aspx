<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnalysisQEdit.aspx.cs" Inherits="AnalysisQEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />       

</head>
<body>
    <form id="form2" runat="server">
    <div>
    

                            <table class="Table100">
                                <tr>
                                    <td class="TableTop" colspan="2">
                                        投標預算-單價分析表校核</td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell0L_A">
                                        &nbsp;
                                    <asp:ImageButton ID="ImageButton197" runat="server" Height="30px" ImageUrl="~/img/Enter.jpg" ToolTip="插補缺漏項" Width="27px" OnClick="ImageButton197_Click" />
                                    </td>
                                    <td class="SB_Cell0R_A">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                &nbsp;&nbsp;</td>
                                </tr>
                                </table>
                            <table class="SB_Table_A">
                                <tr>
                                    <td class="SB_Cell0C_A">工項名稱</td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label1" runat="server" CssClass="TBshort" Font-Size="Medium" Text="清除及掘除"></asp:Label>
                                    </td>
                                    <td class="SB_Cell0C_A">單位</td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label2" runat="server" CssClass="TBshort" Font-Size="Medium" Text="M2"></asp:Label>
                                    </td>
                                    <td class="SB_Cell0C_A">資源代碼</td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label3" runat="server" CssClass="TBshort" Font-Size="Medium" Text="00001"></asp:Label>
                                    </td>
                                    <td class="SB_Cell0C_A">分析數量</td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label4" runat="server" CssClass="TBshort" Font-Size="Medium" Text="10000"></asp:Label>
                                    </td>
                                </tr>
                                </table>
                            <table class="SB_Table_A">
                                <tr>
                                    <td class="SB_Cell0C_A">序號</td>
                                    <td class="SB_Cell0C_A">工料項目種類</td>
                                    <td class="SB_Cell0C_A">資源編碼</td>
                                    <td class="SB_Cell0C_A">工料項目名稱</td>
                                    <td class="SB_Cell0C_A">單位</td>
                                    <td class="SB_Cell0C_A">單價<br />
                                        分析</td>
                                    <td class="SB_Cell0C_A">原標單數量</td>
                                    <td class="SB_Cell0C_A">校核後數量</td>
                                    <td class="SB_Cell0C_A">備註</td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label57" runat="server">1</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label212" runat="server">工項</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label67" runat="server">00011</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label65" runat="server">施工圍籬，2.1m ≦高度＜ 2.4m，含臨時照明</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label66" runat="server">M</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                            <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton8_Click" />
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label68" runat="server">1000</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox51" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label69" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label58" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px">2</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label213" runat="server">工項</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label27" runat="server">00012</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label25" runat="server">棄土區費用(含水土保持)</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label26" runat="server">M3</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label28" runat="server">1200</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox52" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label45" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label59" runat="server">3</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label214" runat="server">機具</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label34" runat="server">E00001</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label30" runat="server">推土機，140~149KW</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label32" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label36" runat="server">12</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox53" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label47" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label60" runat="server">4</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label215" runat="server">機具</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="A" runat="server">E00002</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label111" runat="server">裝料機，膠輪式，1.50~1.59m3</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label211" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label41" runat="server">12</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox54" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label61" runat="server">5</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label216" runat="server">機具</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label8" runat="server">E00003</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label6" runat="server">傾卸貨車，總重21t~21.9t，8L.M3</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label7" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        </td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label9" runat="server">60</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox55" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label62" runat="server">6</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label217" runat="server">人力</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label13" runat="server">L00001</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label11" runat="server">操作手</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label12" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label14" runat="server">12</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox56" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label15" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label63" runat="server">7</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label218" runat="server">人力</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label18" runat="server">L00002</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label16" runat="server">駕駛</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label17" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label19" runat="server">60</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox57" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label20" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label70" runat="server">8</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label219" runat="server">人力</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label23" runat="server">L00099</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label21" runat="server">其他普通工及勞力工</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label22" runat="server">時</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label24" runat="server">60</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox58" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label29" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label64" runat="server">9</asp:Label>
                                        </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label220" runat="server">雜項</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label35" runat="server">W00002</asp:Label>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label31" runat="server">工具損耗</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        <asp:Label ID="Label33" runat="server">式</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                        &nbsp;</td>
                                    <td class="SB_Cell1R_A">
                                        <asp:Label ID="Label37" runat="server">1</asp:Label>
                                    </td>
                                    <td class="SB_Cell1C_A">
                                    <asp:TextBox ID="TextBox59" runat="server" CssClass="TBshort"></asp:TextBox>
                                    </td>
                                    <td class="SB_Cell1L_A">
                                        <asp:Label ID="Label38" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                    </table>

    
    </div>

    
                        <br />

    </form>
</body>
</html>
