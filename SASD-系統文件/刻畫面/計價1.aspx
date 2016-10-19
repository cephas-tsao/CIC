<%@ Page Language="C#" AutoEventWireup="true" CodeFile="計價1.aspx.cs" Inherits="計價1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    
   
    
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td colspan="3" class="TableTop">分包商計價檢視</td>
            </tr>
            <tr>
                <td class="Table1">請選擇分包契約</td>
                <td class="Table2">
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server" AutoPostBack="True" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="SC_Name" DataValueField="SCID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [SCID], [SC_Name] FROM [SubContract_Main] WHERE ([PID] = @PID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="Table1" width="50%">
                                    &nbsp;</td>
            </tr>
            </table>
    
        <asp:Panel ID="Pnl_1" runat="server" Visible="False">
        
    
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="9">計價總覽</td>
            </tr>
            <tr>
                <td class="Table1">&nbsp;</td>
                <td class="Table1">計價期別</td>
                <td class="Table1">計價單號</td>
                <td class="Table1">估驗起始日期</td>
                <td class="Table1">估驗截止日期</td>
                <td class="Table1">計價日期</td>
                <td class="Table1">付款日期</td>
                <td class="Table1">實付金額</td>
                <td class="Table1">備註說明</td>
            </tr>
            <tr>
                <td class="Table2CC">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="明細" />
                </td>
                <td class="Table2CC">1</td>
                <td class="Table2CC">TC001X05001</td>
                <td class="Table2CC">2015/06/01</td>
                <td class="Table2CC">2015/06/30</td>
                <td class="Table2CC">2015/07/01</td>
                <td class="Table2CC">2015/07/10</td>
                <td class="Table2R">195,300</td>
                <td class="Table2"></td>
            </tr>
            <tr>
                <td class="Table2C">
                    <asp:Button ID="Button2" runat="server" CssClass="BtnFree" Text="明細" />
                </td>
                <td class="Table2C">2</td>
                <td class="Table2C">TC001X05002</td>
                <td class="Table2C">2015/07/01</td>
                <td class="Table2CC">2015/07/31</td>
                <td class="Table2C">2015/08/01</td>
                <td class="Table2C">2015/08/10</td>
                <td class="Table2R">90,300</td>
                <td class="Table2"></td>
            </tr>
            <tr>
                <td class="Table2C">
                    <asp:Button ID="Button3" runat="server" CssClass="BtnFree" Text="明細" OnClick="Button3_Click" />
                </td>
                <td class="Table2C">3</td>
                <td class="Table2C">TC001X05003</td>
                <td class="Table2C">2015/08/01</td>
                <td class="Table2CC">2015/08/31</td>
                <td class="Table2C">2015/09/01</td>
                <td class="Table2C">2015/09/10</td>
                <td class="Table2R">90,300</td>
                <td class="Table2"></td>
            </tr>
        </table>
            <asp:Panel ID="Pnl_2" runat="server" Visible="False">
            
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="6">計價明細</td>
            </tr>
            <tr>
                <td class="Table1">計價單號</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle" >TC001X05003</asp:TextBox>
                </td>
                <td class="Table1">計價期別</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" >3</asp:TextBox>
                </td>
                <td class="Table1" rowspan="3">備註說明</td>
                <td class="Table2LC" rowspan="3">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TBfree" Height="75px" TextMode="MultiLine" Width="220px"></asp:TextBox>
                </td>
            </tr>

                    <tr>
                        <td class="Table1">估驗起算日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle" >2015/08/01</asp:TextBox>
                        </td>
                        <td class="Table1">估驗截止日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" >2015/08/31</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">計價日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle" >2015/09/01</asp:TextBox>
                        </td>
                        <td class="Table1">付款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" >2015/09/10</asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="Table1">分包合約金額(變更後)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label1" runat="server" Text="1,000,000"></asp:Label>
                        </td>
                        <td class="Table1">稅金</td>
                        <td class="Table2R">
                            <asp:Label ID="Label2" runat="server" Text="50,000"></asp:Label>
                        </td>
                        <td class="Table1">總額</td>
                        <td class="Table2R">
                            <asp:Label ID="Label3" runat="server" Text="1,050,000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">預付款</td>
                        <td class="Table2R">10.00%</td>
                        <td class="Table1">保留款</td>
                        <td class="Table2R">10.00%</td>
                        <td class="Table1">付款方式</td>
                        <td class="Table2">現金票(30天)</td>
                    </tr>
                </table>
                <table class="Table100">
                    <tr>
                        <td class="Table1">項次</td>
                        <td class="Table1">項目</td>
                        <td class="Table1">前期累計</td>
                        <td class="Table1">本期計價</td>
                        <td class="Table1">至本期累計</td>
                        <td class="Table1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">1</td>
                        <td class="Table2">估驗金額</td>
                        <td class="Table2R">192,000</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"  dir="rtl" Enabled="False">96,000</asp:TextBox>
                        </td>
                        <td class="Table2R">288,000</td>
                        <td class="Table2C">
                            <asp:Button ID="Button4" runat="server" CssClass="BtnFree" Text="估驗明細" OnClick="Button4_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">2</td>
                        <td class="Table2">預付款(+)</td>
                        <td class="Table2R">100,000</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">100,000</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">3</td>
                        <td class="Table2">扣回預付款(-)</td>
                        <td class="Table2R">20,000</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle" dir="rtl" >10,000</asp:TextBox>
                        </td>
                        <td class="Table2R">30,000</td>
                        <td class="Table2C"></td>
                    </tr>
                    <tr>
                        <td class="Table2C">4</td>
                        <td class="Table2">應付金額</td>
                        <td class="Table2R">272,000</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle" dir="rtl" >86,000</asp:TextBox>
                        </td>
                        <td class="Table2R">358,000</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">5</td>
                        <td class="Table2">營業稅</td>
                        <td class="Table2R">13,600</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >4,300</asp:TextBox>
                        </td>
                        <td class="Table2R">17,900</td>
                        <td class="Table2C">應付金額*<asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort" dir="rtl" Width="25px">5</asp:TextBox>
                            ％</td>
                    </tr>
                    <tr>
                        <td class="Table2C">6</td>
                        <td class="Table2">保留款(-)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">7</td>
                        <td class="Table2">扣款/罰款(-)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:Button ID="Button10" runat="server" CssClass="BtnFree" Text="扣款明細" OnClick="Button10_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">8</td>
                        <td class="Table2">加款(+)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle" dir="rtl" Enabled="False" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:Button ID="Button11" runat="server" CssClass="BtnFree" Text="加款明細" OnClick="Button11_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">9</td>
                        <td class="Table2">退還保留款(+)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">10</td>
                        <td class="Table2">物價指數補貼(+)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">11</td>
                        <td class="Table2">工程保險費(+)</td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle" dir="rtl" >0</asp:TextBox>
                        </td>
                        <td class="Table2R">0</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">12</td>
                        <td class="Table2">實付金額</td>
                        <td class="Table2R">285,600</td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle" dir="rtl" >90,300</asp:TextBox>
                        </td>
                        <td class="Table2R">375,900</td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                </table>
        </asp:Panel>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
