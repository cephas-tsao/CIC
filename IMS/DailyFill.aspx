<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailyFill.aspx.cs" Inherits="IMS.DailyFill" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>日報填寫</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
   <%--   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">--%>
    <script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
    <style type="text/css">
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            width: 224px;
        }
        .auto-style92 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style95 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 24px;
        }
        </style>
    <script>
        function javaScriptMyCheck() {
            if (confirm('是否要覆蓋現有檔案!')) {
                document.getElementById('cf').value = "Y";
                document.getElementById('Form1').submit();
            }
            else {
                document.getElementById('cf').value = "N";
                document.getElementById('Form1').submit();
            }
        }
</script>
    <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
        <asp:Literal ID="Literal700" runat="server"></asp:Literal>
        <table class="TableMove" style="width:100%">
            <tr>
                <td colspan="3" class="TableTop">日報填寫</td>
            </tr>
            <tr>
                <td class="Table1">請選擇日期</td>
                <td class="Table2">
                    <asp:TextBox ID="TB_Date" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px" style="text-align: center" OnTextChanged="TB_Date_TextChanged" AutoPostBack="True" onclick="WdatePicker();"></asp:TextBox>
                </td>
                <td class="Table1">
                                    <asp:Panel ID="Pnl_No" runat="server" Visible="False">
                                        <asp:Label ID="Label1" runat="server" Text="*尚未建立本日日報檔，請先新增日報檔再做填寫" ForeColor="Red"></asp:Label>
                                        <asp:Button ID="Button34" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button34_Click" Text="新增日報" />
                                    </asp:Panel>
                                    <asp:Panel ID="Pnl_Yes" runat="server" Visible="True" CssClass="Table1R">
                                        <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" Width="30px" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton9" runat="server" Height="30px" ImageUrl="~/img/PDF.png" Width="30px" />
                                    </asp:Panel>
                                </td>
            </tr>
            </table>

        <div class="TableMove">
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server" EnableViewState="False">
                    <asp:LinkButton ID="LinkButton11" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnA" Font-Bold="True" ForeColor="Black" Font-Underline="False">天氣與記事</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施作工項填報</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">人機料管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton14" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工照片</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton15" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">施工檢驗取樣</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton16" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1350px" Width="100%">
                        <asp:Panel ID="Pnl_1Top" runat="server">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">上午天氣</td>
                                    <td class="Table2">
                                        <asp:DropDownList ID="DropDownList13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">
                                            <asp:ListItem Value="0" Text="-請選擇-"></asp:ListItem>
                                            <asp:ListItem Value="晴" Text="晴天"></asp:ListItem>
                                            <asp:ListItem Value="陰" Text="陰天"></asp:ListItem>
                                            <asp:ListItem Value="雨" Text="雨天"></asp:ListItem>
                                            <asp:ListItem Value="颱風" Text="颱風"></asp:ListItem>
                                            <asp:ListItem Value="雪" Text="雪"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Table1">上午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:DropDownList ID="DropDownList14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">
                                            <asp:ListItem>-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="否"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Table1">預定完成進度</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TextBox55" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        ％</td>
                                    <td class="Table1" rowspan="2">
                                        <asp:Button ID="Button35" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="計算進度" Visible="False" />
                                    </td>
                                    <td class="Table1" rowspan="2">
                                        <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Save.png" Width="30px" OnClick="ImageButton8_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">下午天氣</td>
                                    <td class="Table2">
                                        <asp:DropDownList ID="DropDownList15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">
                                            <asp:ListItem Value="0" Text="-請選擇-"></asp:ListItem>
                                            <asp:ListItem Value="晴" Text="晴天"></asp:ListItem>
                                            <asp:ListItem Value="陰" Text="陰天"></asp:ListItem>
                                            <asp:ListItem Value="雨" Text="雨天"></asp:ListItem>
                                            <asp:ListItem Value="颱風" Text="颱風"></asp:ListItem>
                                            <asp:ListItem Value="雪" Text="雪"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Table1">下午是否計入工期</td>
                                    <td class="Table2">
                                        <asp:DropDownList ID="DropDownList16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">
                                            <asp:ListItem>-請選擇-</asp:ListItem>
                                            <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="否"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Table1">實際完成進度</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TextBox56" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                        ％</td>
                                </tr>
                                <tr>
                                    <td class="Table2" colspan="8"><font size="2">請注意！<br /> 1.填寫資料時，請確認該日是否有上級督導，如有請確實將督導資料據實填寫，以保障自身權益！<br /> 2.若督導有缺失項目，請確認缺失項目改善是否完成，如改善完成請速填寫。<br /> 3.計算進度建議於施作工項填報完成後再點擊計算。</font></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel10" runat="server">
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
                                        <asp:TextBox ID="TB_Note7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" OnTextChanged="TB_Note7_TextChanged1" TextMode="MultiLine" Width="100%"></asp:TextBox>
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
                                        <asp:TextBox ID="TB_Note10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="200px" OnTextChanged="TB_Note10_TextChanged" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                        <asp:Panel ID="Pnl_AllNote" runat="server">

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
                        <asp:SqlDataSource ID="Sql_DDL6" runat="server"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="Sql_GV_Activity" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Daily_Activity] WHERE [UID] = @original_UID" InsertCommand="INSERT INTO [Daily_Activity] ([DailyID], [EWID], [WIID], [WIName], [Version], [Unit], [BudgetNumber], [DoneNumber], [DailyNumber]) VALUES (@DailyID, @EWID, @WIID, @WIName, @Version, @Unit, @BudgetNumber, @DoneNumber, @DailyNumber)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" UpdateCommand="UPDATE [Daily_Activity] SET [DailyNumber] = @DailyNumber WHERE [UID] = @original_UID">
                            <DeleteParameters>
                                <asp:Parameter Name="original_UID" Type="Int32" />
                                <asp:Parameter Name="original_DailyID" Type="Int32" />
                                <asp:Parameter Name="original_EWID" Type="Int32" />
                                <asp:Parameter Name="original_WIID" Type="Int32" />
                                <asp:Parameter Name="original_WIName" Type="String" />
                                <asp:Parameter Name="original_Version" Type="Int32" />
                                <asp:Parameter Name="original_Unit" Type="String" />
                                <asp:Parameter Name="original_BudgetNumber" Type="Decimal" />
                                <asp:Parameter Name="original_DoneNumber" Type="Decimal" />
                                <asp:Parameter Name="original_DailyNumber" Type="Decimal" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="DailyID" Type="Int32" />
                                <asp:Parameter Name="EWID" Type="Int32" />
                                <asp:Parameter Name="WIID" Type="Int32" />
                                <asp:Parameter Name="WIName" Type="String" />
                                <asp:Parameter Name="Version" Type="Int32" />
                                <asp:Parameter Name="Unit" Type="String" />
                                <asp:Parameter Name="BudgetNumber" Type="Decimal" />
                                <asp:Parameter Name="DoneNumber" Type="Decimal" />
                                <asp:Parameter Name="DailyNumber" Type="Decimal" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="DailyID" Type="Int32" />
                                <asp:Parameter Name="EWID" Type="Int32" />
                                <asp:Parameter Name="WIID" Type="Int32" />
                                <asp:Parameter Name="WIName" Type="String" />
                                <asp:Parameter Name="Version" Type="Int32" />
                                <asp:Parameter Name="Unit" Type="String" />
                                <asp:Parameter Name="BudgetNumber" Type="Decimal" />
                                <asp:Parameter Name="DoneNumber" Type="Decimal" />
                                <asp:Parameter Name="DailyNumber" Type="Decimal" />
                                <asp:Parameter Name="original_UID" Type="Int32" />
                                <asp:Parameter Name="original_DailyID" Type="Int32" />
                                <asp:Parameter Name="original_EWID" Type="Int32" />
                                <asp:Parameter Name="original_WIID" Type="Int32" />
                                <asp:Parameter Name="original_WIName" Type="String" />
                                <asp:Parameter Name="original_Version" Type="Int32" />
                                <asp:Parameter Name="original_Unit" Type="String" />
                                <asp:Parameter Name="original_BudgetNumber" Type="Decimal" />
                                <asp:Parameter Name="original_DoneNumber" Type="Decimal" />
                                <asp:Parameter Name="original_DailyNumber" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <table class="Table100">
                            <tr>
                                <td class="Table1L">請選擇要加入之施作工項：<asp:DropDownList ID="DropDownList6" DataSourceID="Sql_DDL6" DataTextField="WIText" DataValueField="WIID" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="DDL_Save" runat="server" Text="新增施作工項" OnClick="DDL_Save_Click" CssClass="BtnFree" />
                                </td>
                                <td class="Table1">
                                    <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" ImageUrl="~/img/Save.png" Width="30px" Visible="false" />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GV_Activity" runat="server" DataSourceID="Sql_GV_Activity" AutoGenerateColumns="False" DataKeyNames="UID" CssClass="Table100" AllowPaging="True">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2CC" ButtonType="Button" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2CC" /></asp:CommandField>
                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" />
                                <asp:BoundField DataField="EWID" HeaderText="EWID" SortExpression="EWID" Visible="False" />
                                <asp:BoundField DataField="WIID" HeaderText="WIID" SortExpression="WIID" Visible="False" />
                                <asp:BoundField DataField="WIName" HeaderText="施作工項" SortExpression="WIName" ReadOnly="True" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2" /></asp:BoundField>
                                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" Visible="False" />
                                <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" ReadOnly="True" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2CC" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2CC" /></asp:BoundField>
                                <asp:BoundField DataField="BudgetNumber" HeaderText="執行預算數量" SortExpression="BudgetNumber" ReadOnly="True"  HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2R" Visible="false" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2R" /></asp:BoundField>
                                <asp:TemplateField HeaderText="執行預算數量" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2R"><ItemTemplate></ItemTemplate><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2R" /></asp:TemplateField>
                                <asp:BoundField DataField="DoneNumber" HeaderText="已完成數量" SortExpression="DoneNumber" ReadOnly="True" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2R" Visible="false" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2R" /></asp:BoundField>
                                <asp:TemplateField HeaderText="已完成數量" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2R"><ItemTemplate></ItemTemplate><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2R" /></asp:TemplateField>
                                <asp:BoundField DataField="DailyNumber" HeaderText="本日完成數量" SortExpression="DailyNumber" HeaderStyle-CssClass="Table1" ItemStyle-CssClass="Table2CC" ><HeaderStyle CssClass="Table1" /><ItemStyle CssClass="Table2CC" /></asp:BoundField>
                            </Columns>
                        </asp:GridView>
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
                                <td class="Table1R" colspan="2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="Table0">&nbsp;<asp:LinkButton ID="LinkButton78" runat="server" OnClick="LinkButton78_Click" ForeColor="White">人力項目出工管理</asp:LinkButton>
                                </td>
                                <td class="Table0" width="30%">
                                    <asp:DropDownList ID="DropDownList25" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource9" DataTextField="ItemName" DataValueField="PriceID" Height="32px" OnSelectedIndexChanged="DropDownList25_SelectedIndexChanged" style="margin-left: 0px" Width="200px" ForeColor="Black">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" SelectCommand="SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind='人力') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Labor WHERE DailyID=@DailyID))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DailyID" SessionField="DailyID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button ID="Labor_Insert" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px" Text="置入人力項目" OnClick="Labor_Insert_Click" ForeColor="Black" />

                                </td>
                            </tr>
                        </table>
                        
                        <asp:Panel ID="Pnl_L" runat="server">
                            <asp:GridView ID="GridView5" runat="server" OnRowCancelingEdit="GridView5_RowCancelingEdit" OnRowDeleting="GridView5_RowDeleting" OnRowEditing="GridView5_RowEditing" OnRowUpdating="GridView5_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" DataKeyNames="UID" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                <%--指令--%>
                                <asp:TemplateField><EditItemTemplate><asp:Button ID="update_btn" runat="server" Text="更新" CommandName="Update" /><asp:Button ID="cancel_btn" runat="server" Text="取消" CommandName="Cancel" /></EditItemTemplate><ItemTemplate><asp:Button ID="edit_btn" runat="server" Text="編輯" CommandName="Edit" /><asp:Button ID="delete_btn" runat="server" Text="刪除" CommandName="Delete" OnClientClick="return confirm('確定要刪除此筆資料嗎?');" /></ItemTemplate></asp:TemplateField>
                                <%--欄位--%>
<%--                                   <asp:TemplateField HeaderText="UID">
                                        <ItemTemplate>
                                            <asp:Label ID="UID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UID") %>'  Visible="true"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID" ItemStyle-HorizontalAlign="Center" Visible="False" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="ItemName" HeaderText="人力項目" ReadOnly="True" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" ReadOnly="True" SortExpression="Unit" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" ReadOnly="True" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" ReadOnly="True" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Summation_DailyNumber" HeaderText="已出工數量" ReadOnly="True" SortExpression="Summation_DailyNumber" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:TemplateField HeaderText="今日出工數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="T_DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:CheckBox ID="ValucationNY" runat="server" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>'  /></ItemTemplate><EditItemTemplate><asp:CheckBox ID="C_ValucationNY" runat="server"></asp:CheckBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
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
                                <td class="Table0" width="30%">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource4" DataTextField="ItemName" DataValueField="PriceID" Height="32px" OnSelectedIndexChanged="DropDownList25_SelectedIndexChanged" style="margin-left: 0px" Width="200px" ForeColor="Black">
                                        <asp:ListItem Value="-請選擇-">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind= '機具') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Equipment WHERE DailyID=@DailyID))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DailyID" SessionField="DailyID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button ID="Btn_Note10" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px" Text="置入機具項目" OnClick="Btn_Note10_Click" ForeColor="Black" />

                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_E" runat="server" >
                            <asp:GridView ID="GridView2" runat="server" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" DataKeyNames="UID" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                <%--指令--%>
                                <asp:TemplateField><EditItemTemplate><asp:Button ID="update_btn" runat="server" Text="更新" CommandName="Update" /><asp:Button ID="cancel_btn" runat="server" Text="取消" CommandName="Cancel" /></EditItemTemplate><ItemTemplate><asp:Button ID="edit_btn" runat="server" Text="編輯" CommandName="Edit" /><asp:Button ID="delete_btn" runat="server" Text="刪除" CommandName="Delete" OnClientClick="return confirm('確定要刪除此筆資料嗎?');" /></ItemTemplate></asp:TemplateField>
                                <%--欄位--%>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID" ItemStyle-HorizontalAlign="Center" Visible="False" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="ItemName" HeaderText="機具項目" ReadOnly="True" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" ReadOnly="True" SortExpression="Unit" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" ReadOnly="True" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" ReadOnly="True" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Summation_DailyNumber" HeaderText="已使用數量" ReadOnly="True" SortExpression="Summation_DailyNumber" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:TemplateField HeaderText="今日使用數量" ItemStyle-HorizontalAlign="Center" ><ItemTemplate><asp:Label ID="DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="T_DailyNumber" runat="server" Text='<%#Bind("DailyNumber") %>'>
                                            </asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center" ><ItemTemplate><asp:CheckBox ID="ValucationNY" runat="server" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>' /></ItemTemplate><EditItemTemplate><asp:CheckBox ID="C_ValucationNY" runat="server"></asp:CheckBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
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
                                <td class="Table0" width="30%">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource6" AppendDataBoundItems="True" DataTextField="ItemName" DataValueField="PriceID" Height="32px" OnSelectedIndexChanged="DropDownList25_SelectedIndexChanged" style="margin-left: 0px" Width="200px" ForeColor="Black">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" SelectCommand="SELECT PriceID, ItemName FROM Pro_Resource WHERE (ItemKind= '材料') AND (PriceID NOT IN (SELECT PriceID FROM Daily_Material  WHERE DailyID=@DailyID))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DailyID" SessionField="DailyID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button ID="Btn_Note11" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px" Text="置入材料項目" OnClick="Btn_Note11_Click" ForeColor="Black" />

                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_M" runat="server">
                            <asp:GridView ID="GridView7" runat="server" OnRowCancelingEdit="GridView7_RowCancelingEdit" OnRowDeleting="GridView7_RowDeleting" OnRowEditing="GridView7_RowEditing" OnRowUpdating="GridView7_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="GridView7_SelectedIndexChanged" DataKeyNames="UID" EmptyDataText="搜尋結果尚無資料">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <%--指令--%>
                                    <asp:TemplateField><EditItemTemplate><asp:Button ID="update_btn" runat="server" Text="更新" CommandName="Update" /><asp:Button ID="cancel_btn" runat="server" Text="取消" CommandName="Cancel" /></EditItemTemplate><ItemTemplate><asp:Button ID="edit_btn" runat="server" Text="編輯" CommandName="Edit" /><asp:Button ID="delete_btn" runat="server" Text="刪除" CommandName="Delete" OnClientClick="return confirm('確定要刪除此筆資料嗎?');" /></ItemTemplate></asp:TemplateField>
                                    <%--欄位--%>
                                    <asp:BoundField DataField="UID" HeaderText="UID"  ReadOnly="True" SortExpression="UID"  ItemStyle-HorizontalAlign="Center" Visible="False" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="ItemName" HeaderText="材料項目" ReadOnly="True" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Unit" HeaderText="單位" ReadOnly="True" SortExpression="Unit" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="CAmount" HeaderText="合約預算總用量" ReadOnly="True" SortExpression="CAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="EAmount" HeaderText="執行預算總用量" ReadOnly="True" SortExpression="EAmount" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Summation_DailyInNumber" HeaderText="已進場數量" ReadOnly="True" SortExpression="Summation_DailyInNumber" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="Summation_DailyOutNumber" HeaderText="已使用數量" ReadOnly="True" SortExpression="Summation_DailyOutNumber" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:BoundField DataField="DailyNumber" HeaderText="庫存數量" ReadOnly="True" SortExpression="DailyNumber" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                    <asp:TemplateField HeaderText="本日進場數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="DailyInNumber" runat="server" Text='<%#Bind("DailyInNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="T_DailyInNumber" runat="server" Text='<%#Bind("DailyInNumber") %>'></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                    <asp:TemplateField HeaderText="本日使用數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="DailyOutNumber" runat="server" Text='<%#Bind("DailyOutNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="T_DailyOutNumber" runat="server" Text='<%#Bind("DailyOutNumber") %>'></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                    <asp:TemplateField HeaderText="單獨計價項" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:CheckBox ID="ValucationNY" runat="server" Checked='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ValucationNY"))==1)? true:false %>' /></ItemTemplate><EditItemTemplate><asp:CheckBox ID="C_ValucationNY" runat="server"></asp:CheckBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
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
                    <asp:LinkButton ID="LinkButton46" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;"  CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnB" ForeColor="Black" Font-Underline="False">檢試驗報告紀錄</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="800px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="auto-style2">選擇上傳照片檔</td>
                                <td class="Table2">
                                    <asp:FileUpload ID="FileUpload1"  AllowMultiple="True" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px" Width="300px" />
                                </td>
                                <td class="Table1">拍照日期</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TB_PicDate" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" style="text-align: center" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">照片標題</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="Table1">照片地點</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox14" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">照片類型</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DropDownList7" AppendDataBoundItems="true" runat="server" CssClass="DDLshort" DataSourceID="SqlDataSource3" DataTextField="WP_Type" DataValueField="WP_Type" Height="32px" Width="155px">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT [WP_Type] FROM [WorkPicType] ORDER BY [UID]"></asp:SqlDataSource>
                                    <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="#009900" Text="*修改照片類型內容請至日報常用設定"></asp:Label>
                                </td>
                                <td class="Table1">施工期別</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DropDownList8" runat="server" CssClass="DDLshort" Height="32px" Width="155px">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                        <asp:ListItem>施工前</asp:ListItem>
                                        <asp:ListItem>施工中</asp:ListItem>
                                        <asp:ListItem>施工後</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">合約項目連結</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox54" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                                    <asp:Button ID="Button23" runat="server" CssClass="BtnLargeMedium" Text="選擇連結工項" OnClick="Button23_Click" Height="32px" />
                                </td>
                                <td class="Table1">分包契約連結</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DropDownList9" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="DDLlong" Height="32px" Width="155px" DataSourceID="SqlDataSource1" DataTextField="SC_Name" DataValueField="SCID">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM SubContract_Main WHERE PID=@PID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">摘要說明</td>
                                <td class="Table2" colspan="3">
                                    <asp:TextBox ID="TextBox15" runat="server" CssClass="TBmiddle" Height="100px" TextMode="MultiLine" Width="303px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" colspan="4">
                                    <asp:Button ID="Button32" runat="server" CssClass="BtnLargeShort" Text="上傳" OnClick="Button32_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel31" runat="server">
                        <table class="Table100">
                            <tr>
                                <td class="Table2C">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField><ItemTemplate><asp:Button ID="Button33" runat="server" CssClass="BtnFree" CommandName="Select" Text="檢視" /><asp:Button ID="Button34" runat="server" CssClass="BtnFree" CommandArgument='<%#Eval("PicTitle")%>' OnClick="Button34_Click" OnClientClick="return confirm('確定刪了喔？')" Text="刪除" /></ItemTemplate></asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="PicTitle" HeaderText="照片標題" SortExpression="PicTitle" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="PicLocation" HeaderText="照片地點" SortExpression="PicLocation" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="PicDate" HeaderText="拍照日期" SortExpression="PicDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" HtmlEncode="False"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="PicType" HeaderText="照片類型" SortExpression="PicType" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="PicPeriod" HeaderText="照片期別" SortExpression="PicPeriod" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [Daily_WorkPic]"></asp:SqlDataSource>
                                </td>
                                <td class="Table2C">
                                    <asp:Panel ID="Pnl_Pic" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">照片標題</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">拍照日期</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片地點</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片類型</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片期別</td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">合約項目連結</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">分包契約連結</td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style92">摘要說明</td>
                                    <td class="auto-style95" colspan="5">
                                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
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
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
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
                        <table class="Table100">
                            <tr>
                                <td class="Table1L">請選擇檢驗取樣之資源項目：<asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged" Width="300px" DataSourceID="SqlDataSource7" DataTextField="ItemName" DataValueField="ItemName" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" SelectCommand="SELECT [ItemName] FROM [Pro_Resource] WHERE ([ItemKind] = @ItemKind)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="材料" Name="ItemKind" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView3" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView3_RowCancelingEdit" OnRowDeleting="GridView3_RowDeleting" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" Width="100%" DataKeyNames="Daily_SampleID" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <%--指令--%>
                                            <asp:TemplateField><EditItemTemplate><asp:ImageButton ID="update_btn" runat="server" CommandName="Update" Tooltip="更新" Height="20px" ImageUrl="~/IMG/Save.png" Width="20px" /><asp:ImageButton ID="cancel_btn" runat="server" CommandName="Cancel" Tooltip="取消" Height="20px" ImageUrl="~/IMG/Cancel.jpg" Width="20px" /></EditItemTemplate><ItemTemplate><asp:ImageButton ID="edit_btn" runat="server" CommandName="Edit" Tooltip="編輯" Height="20px" ImageUrl="~/IMG/Edit.png" Width="20px" /><asp:ImageButton ID="delete_btn" runat="server" CommandName="Delete" OnClientClick="return confirm('確定要刪除此筆資料嗎?');" Tooltip="刪除" Height="20px" ImageUrl="~/IMG/Delete.png" Width="20px" /></ItemTemplate></asp:TemplateField>
                                            <%--欄位--%>
                                            <asp:BoundField DataField="Daily_SampleID" HeaderText="Daily_SampleID" ReadOnly="True" SortExpression="Daily_SampleID" ItemStyle-HorizontalAlign="Center" Visible="False"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="ItemName" HeaderText="項目名稱" ReadOnly="True" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="Unit" HeaderText="單位" ReadOnly="True" SortExpression="Unit" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:TemplateField HeaderText="取樣數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae1" runat="server" Text='<%#Bind("SNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name1" runat="server" Text='<%#Bind("SNumber") %>'></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="取樣單位" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae2" runat="server" Text='<%#Bind("SUnit") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name2" runat="server" Text='<%#Bind("SUnit") %>'></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="代表數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae3" runat="server" Text='<%#Bind("PNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name3" runat="server" Text='<%#Bind("PNumber") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="代表單位" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae4" runat="server" Text='<%#Bind("PUnit") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name4" runat="server" Text='<%#Bind("PUnit") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="檢驗標準" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae5" runat="server" Text='<%#Bind("Standard") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name5" runat="server" Text='<%#Bind("Standard") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="備註" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae6" runat="server" Text='<%#Bind("Notes") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name6" runat="server" Text='<%#Bind("Notes") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="取樣地點" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae7" runat="server" Text='<%#Bind("Location") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name7" runat="server" Text='<%#Bind("Location") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="取樣人員" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae8" runat="server" Text='<%#Bind("SamplingMan") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name8" runat="server" Text='<%#Bind("SamplingMan") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="材料進場日期" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae9" runat="server" Text='<%#Bind("MaterailInDate") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name9" runat="server" Text='<%#Bind("MaterailInDate") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="預定取報告日期" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae10" runat="server" Text='<%#Bind("BookReportDate") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name10" runat="server" Text='<%#Bind("BookReportDate") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="類型" ItemStyle-HorizontalAlign="Center"><EditItemTemplate><asp:DropDownList ID="lb_Nmae11" runat="server" SelectedValue='<%#Bind("TestType") %>' CssClass="DDLshort"><asp:ListItem Value="取樣">取樣</asp:ListItem><asp:ListItem Value="試驗">試驗</asp:ListItem><asp:ListItem Value="廠驗">廠驗</asp:ListItem><asp:ListItem Value="0">0</asp:ListItem></asp:DropDownList></EditItemTemplate><ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("TestType") %>'></asp:Label>
                                                </ItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包(供料)廠商" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae12" runat="server" Text='<%#Bind("FirmName") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name12" runat="server" Text='<%#Bind("FirmName") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="檢驗單位/實驗室" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae13" runat="server" Text='<%#Bind("LabName") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name13" runat="server" Text='<%#Bind("LabName") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
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
                                </td>
                            </tr>
                        </table>
                   
                        <br />
                              
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
                        <table class="Table100">
                            <tr>
                                <td class="Table1L">請選擇前已送驗之資源項目：<asp:DropDownList ID="DropDownList11" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList11_SelectedIndexChanged" Width="300px" AppendDataBoundItems="True" DataSourceID="SqlDataSource8" DataTextField="ItemName" DataValueField="Daily_SampleID">
                                    <asp:ListItem Value="-請選擇-">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" SelectCommand="SELECT Daily_SampleID, ItemName FROM Daily_TestSampling WHERE (DailyID = @DailyID) AND (Daily_SampleID NOT IN (SELECT Daily_SampleID FROM Daily_TestReport WHERE (DailyID = @DailyID)))">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DailyID" SessionField="DailyID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>                                   
                            </tr>
                        </table>
                                    <asp:GridView ID="GridView4" runat="server" AllowCustomPaging="True" DataKeyNames="Daily_ReportID" OnRowCancelingEdit="GridView4_RowCancelingEdit" OnRowDeleting="GridView4_RowDeleting" OnRowEditing="GridView4_RowEditing" OnRowUpdating="GridView4_RowUpdating" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField><EditItemTemplate><asp:ImageButton ID="update_btn" runat="server" CommandName="Update" Tooltip="更新" Height="20px" ImageUrl="~/IMG/Save.png" Width="20px" /><asp:ImageButton ID="cancel_btn" runat="server" CommandName="Cancel" Tooltip="取消" Height="20px" ImageUrl="~/IMG/Cancel.jpg" Width="20px" /></EditItemTemplate><ItemTemplate><asp:ImageButton ID="edit_btn" runat="server" CommandName="Edit" Tooltip="編輯" Height="20px" ImageUrl="~/IMG/Edit.png" Width="20px" /><asp:ImageButton ID="delete_btn" runat="server" CommandName="Delete" OnClientClick="return confirm('確定要刪除此筆資料嗎?');" Tooltip="刪除" Height="20px" ImageUrl="~/IMG/Delete.png" Width="20px" /></ItemTemplate></asp:TemplateField>
                                            <asp:BoundField DataField="Daily_ReportID" HeaderText="Daily_ReportID" ReadOnly="True" SortExpression="Daily_ReportID" ItemStyle-HorizontalAlign="Center" Visible="False" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="ItemName" HeaderText="項目名稱" ReadOnly="true" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center" ><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="Unit" HeaderText="單位" ReadOnly="true" SortExpression="Unit" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="SNumber" HeaderText="取樣數量" ReadOnly="true" SortExpression="SNumber" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="SUnit" HeaderText="取樣單位" ReadOnly="true" SortExpression="SUnit" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:BoundField DataField="Notes" HeaderText="備註" ReadOnly="true" SortExpression="Notes" ItemStyle-HorizontalAlign="Center"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                                            <asp:TemplateField HeaderText="合格數量" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae41" runat="server" Text='<%#Bind("RegularNumber") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name41" runat="server" Text='<%#Bind("RegularNumber") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="實際取報告日期" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae42" runat="server" Text='<%#Bind("RealReportDate") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name42" runat="server" Text='<%#Bind("RealReportDate") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="檢驗單位/實驗室名稱" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae43" runat="server" Text='<%#Bind("LabName") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name43" runat="server" Text='<%#Bind("LabName") %>' CssClass="TBmiddle"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="會驗人員" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Label ID="lb_Nmae44" runat="server" Text='<%#Bind("TestMan") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="tbx_Name44" runat="server" Text='<%#Bind("TestMan") %>' CssClass="TBshort"></asp:TextBox></EditItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                                            <asp:TemplateField HeaderText="上傳檔案" ItemStyle-HorizontalAlign="Center"><itemtemplate><asp:FileUpload ID="FileUpload3" runat="server" CssClass="TBmiddle" /><asp:Button ID="Button55" OnClick="Button55_Click" runat="server" CommandArgument='<%#Eval("Daily_ReportID")%>' Width='50' Text="送出" CssClass="TBmiddle" /></itemtemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="檔案下載" ItemStyle-HorizontalAlign="Center"><ItemTemplate><asp:Button id="LinkButton1" Text="下載"  CommandArgument='<%#Eval("TestReportPath")%>' OnClick="LinkButton_Click" Enabled='<%# (DataBinder.Eval(Container.DataItem,("TestReportPath"))=="0")? false:true %>' runat="server" CssClass="BtnFree"/></ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
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
                                    <br />
                    </asp:Panel>   
                    <br />
                </asp:View>
            </asp:MultiView>
             <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
            </div>
        <br />
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://yuku-t.com/jquery-textcomplete/media/javascripts/jquery.textcomplete.js"></script>
    <script src="http://yuku-t.com/jquery-textcomplete/media/javascripts/main.js"></script>
</asp:Content>
