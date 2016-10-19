<%@ Page Language="C#" AutoEventWireup="true" CodeFile="日報1.aspx.cs" Inherits="日報1" %>

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
                <td colspan="3" class="TableTop">日報檢視</td>
            </tr>
            <tr>
                <td class="Table1">請選擇日期</td>
                <td class="Table2">
                    <asp:TextBox ID="TB_Date" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px" style="text-align: center" OnTextChanged="TB_Date_TextChanged" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="Table1" width="50%">
                                    <asp:Panel ID="Pnl_Yes" runat="server" CssClass="Table1R">
                                        <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" Width="30px" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton9" runat="server" Height="30px" ImageUrl="~/img/PDF.png" Width="30px" />
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_No" runat="server" Visible="False">
                                        <asp:Label ID="Label7" runat="server" Text="*尚未建立本日日報檔" ForeColor="Red"></asp:Label>
                                    </asp:Panel>
                                </td>
            </tr>
            </table>
    
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton14" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton15" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton16" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1300px" Width="100%">
                        <asp:Panel ID="Pnl_1Top" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">上午天氣</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label1" runat="server" Text="晴"></asp:Label>
                                    </td>
                                    <td class="Table1">上午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label3" runat="server" Text="是"></asp:Label>
                                    </td>
                                    <td class="Table1">預定完成進度</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label5" runat="server" Text="25.08"></asp:Label>
                                        ％</td>
                                </tr>
                                <tr>
                                    <td class="Table1">下午天氣</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label2" runat="server" Text="晴"></asp:Label>
                                    </td>
                                    <td class="Table1">下午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label4" runat="server" Text="是"></asp:Label>
                                    </td>
                                    <td class="Table1">實際完成進度</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label6" runat="server" Text="25.16"></asp:Label>
                                        ％</td>
                                </tr>
                                <tr>
                                    <td class="Table2" colspan="6"><font size="2">請注意！<br /> 1.填寫資料時，請確認該日是否有上級督導，如有請確實將督導資料據實填寫，以保障自身權益！<br /> 2.若督導有缺失項目，請確認缺失項目改善是否完成，如改善完成請速填寫。<br /> 3.計算進度建議於施作工項填報完成後再點擊計算。</font></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table class="Table100">
                            <tr>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note1" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">工地施作記事：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note2" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">重要事項紀錄：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note3" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">業主指示事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note4" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">監造指示事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note5" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">勞工安全查核事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note6" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">施工取樣試驗紀錄：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note7" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">通知分包廠商辦理事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note8" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">施工品質查核：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note9" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">備註：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Note10" runat="server" Visible="true">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">其他資訊：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton24" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton25" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton26" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table1">施作工項</td>
                                <td class="Table1">單位</td>
                                <td class="Table1">預算數量</td>
                                <td class="Table1">前已完成數量</td>
                                <td class="Table1">本日完成數量</td>
                            </tr>
                            <tr>
                                <td class="Table2">二樓樓板模板組立</td>
                                <td class="Table2CC">M2</td>
                                <td class="Table2R">300.00</td>
                                <td class="Table2R">108.05</td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox56" runat="server" CssClass="TBmiddle" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Width="200px">XXX.xx</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton34" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton35" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton36" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton78" runat="server" OnClick="LinkButton78_Click" ForeColor="White">人力項目出工管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_L" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">人力項目</td>
                                    <td class="Table1">單位</td>
                                    <td class="Table1">合約預算總用量</td>
                                    <td class="Table1">執行預算總用量</td>
                                    <td class="Table1">前已出工數量</td>
                                    <td class="Table1">本日出工數量</td>
                                    <td class="Table1">單獨計價項</td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">技術工</td>
                                    <td class="Table2CC">工</td>
                                    <td class="Table2R">100.00</td>
                                    <td class="Table2R">120.00</td>
                                    <td class="Table2R">0.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text=" " Checked="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">大工</td>
                                    <td class="Table2CC">工</td>
                                    <td class="Table2R">500.00</td>
                                    <td class="Table2R">550.00</td>
                                    <td class="Table2R">120.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Width="200px" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox2" runat="server" Text=" " Checked="True" Enabled="False" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton79" runat="server" OnClick="LinkButton79_Click" ForeColor="White">機具項目使用管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_E" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">機具項目</td>
                                    <td class="Table1">單位</td>
                                    <td class="Table1">合約預算總用量</td>
                                    <td class="Table1">執行預算總用量</td>
                                    <td class="Table1">前已使用數量</td>
                                    <td class="Table1">本日使用數量</td>
                                    <td class="Table1">單獨計價項</td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">高空作業車</td>
                                    <td class="Table2CC">時</td>
                                    <td class="Table2R">100.00</td>
                                    <td class="Table2R">120.00</td>
                                    <td class="Table2R">0.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Width="200px" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox3" runat="server" Text=" " Enabled="False" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton80" runat="server" OnClick="LinkButton80_Click" ForeColor="White">材料項目庫存管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_M" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">材料項目</td>
                                    <td class="Table1">單位</td>
                                    <td class="Table1">合約預算總用量</td>
                                    <td class="Table1">執行預算總用量</td>
                                    <td class="Table1">前已進場數量</td>
                                    <td class="Table1">前已使用數量</td>
                                    <td class="Table1">前庫存數量</td>
                                    <td class="Table1">本日進場數量</td>
                                    <td class="Table1">本日使用數量</td>
                                    <td class="Table1">單獨計價項</td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">鋼筋</td>
                                    <td class="Table2CC">T</td>
                                    <td class="Table2R">30,000.00</td>
                                    <td class="Table2R">30,500.00</td>
                                    <td class="Table2R">5,000.00</td>
                                    <td class="Table2R">2,000.00</td>
                                    <td class="Table2R">3,000.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox8" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox4" runat="server" Text=" " Enabled="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">水泥</td>
                                    <td class="Table2CC">包</td>
                                    <td class="Table2R">1,500.00</td>
                                    <td class="Table2R">1,500.00</td>
                                    <td class="Table2R">500.00</td>
                                    <td class="Table2R">300.00</td>
                                    <td class="Table2R">200.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox10" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox5" runat="server" Text=" " Checked="True" Enabled="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table2CC">預拌混凝土，210kgf/cm2</td>
                                    <td class="Table2CC">M3</td>
                                    <td class="Table2R">21,000.00</td>
                                    <td class="Table2R">21,000.00</td>
                                    <td class="Table2R">600.00</td>
                                    <td class="Table2R">600.00</td>
                                    <td class="Table2R">0.00</td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox55" runat="server" CssClass="TBshort" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" style="text-align: right">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" style="text-align: right" Enabled="False">XXX.xx</asp:TextBox>
                                    </td>
                                    <td class="Table2CC">
                                        <asp:CheckBox ID="CheckBox6" runat="server" Text=" " Enabled="False" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:LinkButton ID="LinkButton41" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton42" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton43" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton44" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton45" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton46" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table2C">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button33" runat="server" CssClass="BtnFree" OnClick="Button33_Click" Text="檢視" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" />
                                            <asp:BoundField DataField="PicTitle" HeaderText="照片標題" SortExpression="PicTitle" />
                                            <asp:BoundField DataField="PicLocation" HeaderText="照片地點" SortExpression="PicLocation" />
                                            <asp:BoundField DataField="PicDate" HeaderText="拍照日期" SortExpression="PicDate" />
                                            <asp:BoundField DataField="PicType" HeaderText="照片類型" SortExpression="PicType" />
                                            <asp:BoundField DataField="PicPeriod" HeaderText="照片期別" SortExpression="PicPeriod" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [Daily_WorkPic]"></asp:SqlDataSource>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Pic" runat="server" Visible="False">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1">照片標題</td>
                                                <td class="Table2CCC" colspan="3">襯砌澆灌1</td>
                                                <td class="Table1">拍照日期</td>
                                                <td>2015/09/30</td>
                                            </tr>
                                            <tr>
                                                <td class="Table1">照片地點</td>
                                                <td class="Table2CCC">隧道中段</td>
                                                <td class="Table1">照片類型</td>
                                                <td class="Table2CCC">進度及作業照片</td>
                                                <td class="Table1">照片期別</td>
                                                <td>施工中</td>
                                            </tr>
                                            <tr>
                                                <td class="Table1">合約項目連結</td>
                                                <td class="Table2CCC" colspan="3">280kgf/cm2混凝土</td>
                                                <td class="Table1">分包契約連結</td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td class="Table1">摘要說明</td>
                                                <td class="Table2" colspan="5">0K+100~0K+106第四模</td>
                                            </tr>
                                            <tr>
                                                <td class="Table1">照片顯示</td>
                                                <td class="Table2CC" colspan="5">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/DSC_2020.JPG" Width="500px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:LinkButton ID="LinkButton51" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton52" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton53" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton54" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton55" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton56" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel5" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table1">項目名稱</td>
                                <td class="Table1">單位</td>
                                <td class="Table1">取樣數量</td>
                                <td class="Table1">取樣單位</td>
                                <td class="Table1">代表數量</td>
                                <td class="Table1">檢驗標準</td>
                                <td class="Table1">備註</td>
                                <td class="Table1">取樣地點</td>
                                <td class="Table1">取樣人員</td>
                                <td class="Table1">材料進場日期</td>
                                <td class="Table1">預定取報告日期</td>
                                <td class="Table1">類別</td>
                                <td class="Table1">分包(供料)廠商</td>
                                <td class="Table1">檢驗單位/實驗室</td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox51" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">鋼筋，SD280</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox52" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">M2</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox16" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX.xx</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox17" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox18" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX.xx</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox19" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox21" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox23" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXXX/XX/XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox24" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXXX/XX/XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox54" runat="server" CssClass="TBshort" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium">XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox25" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox26" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <asp:LinkButton ID="LinkButton61" runat="server" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton62" runat="server" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton63" runat="server" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton64" runat="server" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton65" runat="server" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton66" runat="server" BorderWidth="1px" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel6" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table1">項目名稱</td>
                                <td class="Table1">單位</td>
                                <td class="Table1">取樣數量</td>
                                <td class="Table1">取樣單位</td>
                                <td class="Table1">備註</td>
                                <td class="Table1">合格數量</td>
                                <td class="Table1">實際取報告日期</td>
                                <td class="Table1">檢驗單位/實驗室</td>
                                <td class="Table1">會驗人員</td>
                            </tr>
                            <tr>
                                <td class="Table2">鋼筋，SD420</td>
                                <td class="Table2CC">M2</td>
                                <td class="Table2CC">3</td>
                                <td class="Table2CC">支</td>
                                <td class="Table2CC">#4-1支；#5-2支</td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox35" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX.xx</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXXX/XX/XX</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox53" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">SGS南港實驗室</asp:TextBox>
                                </td>
                                <td class="Table2CC">
                                    <asp:TextBox ID="TextBox39" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Enabled="False">XXX</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
