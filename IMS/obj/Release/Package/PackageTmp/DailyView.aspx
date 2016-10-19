<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailyView.aspx.cs" Inherits="IMS.DailyView" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>日報檢視</title>
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
        <table class="TableMove"  style="width:100%">
            <tr>
                <td colspan="3" class="TableTop">日報檢視</td>
            </tr>
            <tr>
                <td class="Table1">請選擇日期</td>
                <td class="Table2">
                    <asp:TextBox ID="TB_Date" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px" style="text-align: center" OnTextChanged="TB_Date_TextChanged" AutoPostBack="True" onclick="WdatePicker();"></asp:TextBox>
                </td>
                <td class="Table1">
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
    <div class="TableMove">
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton14" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton15" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton16" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <asp:Panel ID="Pnl_1Top" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">上午天氣</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                    </td>
                                    <td class="Table1">上午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                    </td>
                                    <td class="Table1">預定完成進度</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                        ％</td>
                                </tr>
                                <tr>
                                    <td class="Table1">下午天氣</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </td>
                                    <td class="Table1">下午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label4" runat="server"></asp:Label>
                                    </td>
                                    <td class="Table1">實際完成進度</td>
                                    <td class="Table2">
                                        <asp:Label ID="Label6" runat="server"></asp:Label>
                                        ％</td>
                                </tr>
                                <tr>
                                    <td class="Table2" colspan="6"><font size="2">請注意！<br /> 1.填寫資料時，請確認該日是否有上級督導，如有請確實將督導資料據實填寫，以保障自身權益！<br /> 2.若督導有缺失項目，請確認缺失項目改善是否完成，如改善完成請速填寫。<br /> 3.計算進度建議於施作工項填報完成後再點擊計算。</font></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel7" runat="server">
                        <table class="Table100">
                            <tr>
                                <td class="Table1L">請選擇要檢視的項目：<asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" Width="300px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>工地施作記事</asp:ListItem>
                                    <asp:ListItem>重要事項紀錄</asp:ListItem>
                                    <asp:ListItem>業主指示事項</asp:ListItem>
                                    <asp:ListItem>監造指示事項</asp:ListItem>
                                    <asp:ListItem>勞工安全查核事項</asp:ListItem>
                                    <asp:ListItem>施工取樣試驗紀錄</asp:ListItem>
                                    <asp:ListItem>通知分包廠商辦理事項</asp:ListItem>
                                    <asp:ListItem>施工品質查核</asp:ListItem>
                                    <asp:ListItem>備註</asp:ListItem>
                                    <asp:ListItem>其他資訊</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                        <asp:Panel ID="Pnl_AllNote" runat="server">

                                    <asp:Panel ID="Pnl_Note1" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">工地施作記事：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note2" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">重要事項紀錄：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note3" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">業主指示事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note4" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">監造指示事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%" style="margin-top: 0px"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note5" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">勞工安全查核事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note6" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">施工取樣試驗紀錄：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note7" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">通知分包廠商辦理事項：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note8" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">施工品質查核：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note9" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">備註：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Note10" runat="server" Visible="false">
                                        <table class="Table100">
                                            <tr>
                                                <td class="Table1L">其他資訊：</td>
                                            </tr>
                                        </table>
                                        <asp:TextBox ID="TB_Note10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton24" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton25" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton26" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="EWID" HeaderText="EWID" SortExpression="EWID" Visible="False" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="WIID" HeaderText="WIID" SortExpression="WIID" Visible="False" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="WIName" HeaderText="施作工項" SortExpression="WIName" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" Visible="False" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="BudgetNumber" HeaderText="預算數量" SortExpression="BudgetNumber" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="DoneNumber" HeaderText="已完成數量" SortExpression="DoneNumber" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="DailyNumber" HeaderText="本日完成數量" SortExpression="DailyNumber" ItemStyle-HorizontalAlign="Center"/>
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
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" SelectCommand="SELECT * FROM [Daily_Activity] WHERE ([DailyID] = @DailyID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="DailyID" SessionField="DailyID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton34" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton35" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton36" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton78" runat="server" OnClick="LinkButton78_Click" ForeColor="White">人力項目出工管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_L" runat="server">
                            <asp:GridView ID="GridView5" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID" Visible="False"  ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="ItemName" HeaderText="人力項目" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Summation_DailyNumber" HeaderText="已出工數量" SortExpression="Summation_DailyNumber" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:TemplateField HeaderText="今日出工數量" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ValucationNY" runat="server" ReadOnly="True" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                        </asp:Panel>
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton79" runat="server" OnClick="LinkButton79_Click" ForeColor="White">機具項目使用管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_E" runat="server">
                            <asp:GridView ID="GridView6" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID" Visible="False" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ItemName" HeaderText="機具項目" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Summation_DailyNumber" HeaderText="已使用數量" SortExpression="Summation_DailyNumber" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:TemplateField HeaderText="今日使用數量" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ValucationNY" runat="server" ReadOnly="True" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                        </asp:Panel>
                        <table class="Table100">
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton80" runat="server" OnClick="LinkButton80_Click" ForeColor="White">材料項目庫存管理</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_M" runat="server">
                            <asp:GridView ID="GridView7" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID" Visible="False"  ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="ItemName" HeaderText="材料項目" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Summation_DailyInNumber" HeaderText="已進場數量" SortExpression="Summation_DailyInNumber" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="Summation_DailyOutNumber" HeaderText="已使用數量" SortExpression="Summation_DailyOutNumber" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="DailyNumber" HeaderText="庫存數量" SortExpression="DailyNumber" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:TemplateField HeaderText="本日進場數量" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="DailyInNumber" runat="server" Text='<%#Bind("DailyInNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="本日使用數量" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="DailyOutNumber" runat="server" Text='<%#Bind("DailyOutNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ValucationNY" runat="server" ReadOnly="True" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                        </asp:Panel>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:LinkButton ID="LinkButton41" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton42" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton43" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton44" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton45" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton46" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table2C">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource5" Width="100%" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button33" runat="server" CssClass="BtnFree" CommandName="Select" Text="檢視" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PicTitle" HeaderText="照片標題" SortExpression="PicTitle" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PicLocation" HeaderText="照片地點" SortExpression="PicLocation" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PicDate" HeaderText="拍照日期" SortExpression="PicDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PicType" HeaderText="照片類型" SortExpression="PicType" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PicPeriod" HeaderText="照片期別" SortExpression="PicPeriod" ItemStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
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
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="SELECT * FROM [Daily_WorkPic] WHERE ([DailyID] = @DailyID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DailyID" SessionField="DailyID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [Daily_WorkPic]"></asp:SqlDataSource>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Pic" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">照片標題</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">拍照日期</td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片地點</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片類型</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片期別</td>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">合約項目連結</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">分包契約連結</td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">摘要說明</td>
                                    <td class="Table2" colspan="5">
                                        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片顯示</td>
                                    <td class="Table2CC" colspan="5">
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal> 
                                    </td>
                                </tr>
                            </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                         </asp:Panel>
                        </asp:Panel>
                        </table>
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:LinkButton ID="LinkButton51" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton52" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton53" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton54" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton55" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton56" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel5" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Daily_SampleID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Daily_SampleID" HeaderText="Daily_SampleID" InsertVisible="False" ReadOnly="True" SortExpression="Daily_SampleID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PriceID" HeaderText="PriceID" SortExpression="PriceID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ItemName" HeaderText="項目名稱" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SNumber" HeaderText="取樣數量" SortExpression="SNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUnit" HeaderText="取樣單位" SortExpression="SUnit" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PNumber" HeaderText="代表數量" SortExpression="PNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PUnit" HeaderText="代表單位" SortExpression="PUnit" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Standard" HeaderText="檢驗標準" SortExpression="Standard" ItemStyle-HorizontalAlign="Center" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Location" HeaderText="取樣地點" SortExpression="Location" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SamplingMan" HeaderText="取樣人員" SortExpression="SamplingMan" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MaterailInDate" HeaderText="材料進場日期" SortExpression="MaterailInDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BookReportDate" HeaderText="預定取報告日期" SortExpression="BookReportDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TestType" HeaderText="類別" SortExpression="TestType" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FirmName" HeaderText="分包(供料)廠商" SortExpression="FirmName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LabName" HeaderText="檢驗單位/實驗室" SortExpression="LabName" ItemStyle-HorizontalAlign="Center" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT * FROM [Daily_TestSampling] WHERE ([DailyID] = @DailyID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="DailyID" SessionField="DailyID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <asp:LinkButton ID="LinkButton61" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton62" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton63" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton64" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton65" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton66" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel6" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="項目名稱" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SNumber" HeaderText="取樣數量" SortExpression="SNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUnit" HeaderText="取樣單位" SortExpression="SUnit" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RegularNumber" HeaderText="合格數量" SortExpression="RegularNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RealReportDate" HeaderText="實際取報告日期" SortExpression="RealReportDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LabName" HeaderText="檢驗單位/實驗室" SortExpression="LabName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TestMan" HeaderText="會驗人員" SortExpression="TestMan" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT 
        [Daily_TestSampling].[ItemName]
	   ,[Daily_TestSampling].[Unit]
	   ,[Daily_TestSampling].[SNumber]
	   ,[Daily_TestSampling].[SUnit]
	   ,[Daily_TestSampling].[Notes]
       ,[Daily_TestReport].[RegularNumber]
       ,[Daily_TestReport].[TestMan]
       ,[Daily_TestReport].[RealReportDate]
       ,[Daily_TestReport].[LabName]
  FROM  [Daily_TestReport],[Daily_TestSampling]
  WHERE [Daily_TestReport].[DailyID]=@DailyID AND [Daily_TestReport].[Daily_SampleID]=[Daily_TestSampling].[Daily_SampleID]">
                            <SelectParameters>
                                <asp:SessionParameter Name="DailyID" SessionField="DailyID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
    </div>
    </div>
</asp:Content>