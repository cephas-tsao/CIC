<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailySetting.aspx.cs" Inherits="IMS.DailySetting" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="width:88%;float:right;">
    
        <table class="Table100">
            <tr>
                <td class="TableTop">日報常用設定</td>
            </tr>
        </table>
    
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" ForeColor="Black" Font-Underline="False">施工照片類型設定</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" ForeColor="Black" Font-Underline="False">常用詞庫管理</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <table class="Table100">
                            <tr>
                                <td class="Table0" colspan="3">新增施工照片類型</td>
                            </tr>
                            <tr>
                                <td class="Table1">照片類型名稱</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="Table1">
                                    <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" CssClass="BtnFree" OnClick="Button3_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="Table0" colspan="3">搜尋施工照片類型</td>
                            </tr>
                            <tr>
                                <td class="Table1">照片類型名稱(關鍵字)</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="Table1">
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" CssClass="BtnFree" OnClick="Button4_Click"/>
                                    &nbsp;
                                    <asp:Button ID="Button8" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button8_Click" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="Table0" colspan="3">刪修既有施工照片類型</td>
                            </tr>
                            <tr>
                                <td class="Table2C" colspan="3">
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource1" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="WP_Type" HeaderText="照片類型" SortExpression="WP_Type" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [WorkPicType] WHERE [UID] = @original_UID AND (([WP_Type] = @original_WP_Type) OR ([WP_Type] IS NULL AND @original_WP_Type IS NULL))" InsertCommand="INSERT INTO [WorkPicType] ([WP_Type]) VALUES (@WP_Type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [WorkPicType]" UpdateCommand="UPDATE [WorkPicType] SET [WP_Type] = @WP_Type WHERE [UID] = @original_UID AND (([WP_Type] = @original_WP_Type) OR ([WP_Type] IS NULL AND @original_WP_Type IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_UID" Type="Int32" />
                                            <asp:Parameter Name="original_WP_Type" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="WP_Type" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="WP_Type" Type="String" />
                                            <asp:Parameter Name="original_UID" Type="Int32" />
                                            <asp:Parameter Name="original_WP_Type" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" ForeColor="Black" Font-Underline="False">施工照片類型設定</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" ForeColor="Black" Font-Underline="False">常用詞庫管理</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <br />
                        <asp:MultiView ID="MultiView0" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View8" runat="server">
                                <asp:LinkButton ID="LinkButton78" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton79" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton80" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton81" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton82" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton83" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton84" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton127" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel8" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增工地施作記事常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button9" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button9_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋工地施作記事常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button10" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button10_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button11" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button11_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有工地施作記事常用詞句</td>
                                        </tr>
                                        <tr>
                                        <td class="Table2C" colspan="3">
                                        <asp:GridView ID="GridView9" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource2" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="工地施作記事" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View9" runat="server">
                                <asp:LinkButton ID="LinkButton85" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton86" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton87" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton88" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton89" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton90" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton91" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton128" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel9" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增重要事項記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button12" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button12_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋重要事項記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button13" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button13_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button14" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button14_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有重要事項記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource3" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET  UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="重要事項紀錄" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View10" runat="server">
                                <asp:LinkButton ID="LinkButton92" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton93" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton94" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton95" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton96" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton97" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton98" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton129" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel10" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增業主指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button15" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button15_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋業主指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button16" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button16_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button17" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button17_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有業主指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource4" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="業主指示事項" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View11" runat="server">
                                <asp:LinkButton ID="LinkButton99" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton100" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton101" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton102" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton103" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton104" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton105" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton130" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel11" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增監造指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button18" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button18_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋監造指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button19" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button19_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button20" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button20_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有監造指示事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource5" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="勞工安全查核事項" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View12" runat="server">
                                <asp:LinkButton ID="LinkButton106" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton107" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton108" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton109" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton110" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton111" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton112" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton131" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel12" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增勞工安全查核事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button21" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button21_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋勞工安全查核事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button22" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button22_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button23" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button23_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有勞工安全查核事項常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                       <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource6" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="勞工安全查核事項" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View13" runat="server">
                                <asp:LinkButton ID="LinkButton113" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton114" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton115" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton116" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton117" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton118" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton119" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton132" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel13" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增施工取樣試驗記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button24" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button24_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋施工取樣試驗記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox20" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button25" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button25_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button26" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button26_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有施工取樣試驗記錄常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource7" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="施工取樣試驗記錄" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View14" runat="server">
                                <asp:LinkButton ID="LinkButton120" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton121" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton122" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton123" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton124" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton125" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton126" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Bold="True" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton133" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel14" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增通知分包廠商辦理常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox21" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button27" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button27_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋通知分包廠商辦理常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button28" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button28_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button29" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button29_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有通知分包廠商辦理常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                        <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource8" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConflictDetection="CompareAllValues"  DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="UW_Type" Type="String" />
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="Sort" Type="Int32" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="通知分包廠商辦理" Name="UW_Type" Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="UW_Content" Type="String" />
                                                        <asp:Parameter Name="original_UID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                            <asp:View ID="View15" runat="server">
                                <asp:LinkButton ID="LinkButton134" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">工地施作記事</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton135" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">重要事項記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton136" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">業主指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton137" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">監造指示事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton138" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">勞工安全查核事項</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton139" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="5" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Underline="False" ForeColor="Black">施工取樣試驗記錄</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton140" runat="server" BorderWidth="0.5px" style="background-color:#77DDFF;" CommandArgument="6" CommandName="SwitchViewByIndex" CssClass="LinkBtnBLong" Font-Bold="True" Font-Underline="False" ForeColor="Black">通知分包廠商辦理</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton141" runat="server" BorderWidth="0.5px" style="background-color:#007799;" CommandArgument="7" CommandName="SwitchViewByIndex" CssClass="LinkBtnALong" Font-Underline="False" ForeColor="Black">施工品質查核</asp:LinkButton>
                                <br />
                                <asp:Panel ID="Panel15" runat="server" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                                    <table class="Table100">
                                        <tr>
                                            <td class="Table0" colspan="3">新增施工品質查核常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox23" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button30" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="新增" OnClick="Button30_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">搜尋施工品質查核常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">常用詞句內容(關鍵字)</td>
                                            <td class="Table2">
                                                <asp:TextBox ID="TextBox24" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
                                            </td>
                                            <td class="Table1">
                                                <asp:Button ID="Button31" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="搜尋" OnClick="Button31_Click" />
                                                &nbsp;
                                                <asp:Button ID="Button32" runat="server" CssClass="BtnFree" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="ALL" OnClick="Button32_Click" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table0" colspan="3">刪修既有施工品質查核常用詞句</td>
                                        </tr>
                                        <tr>
                                            <td class="Table2C" colspan="3">
                                                                                        <asp:GridView ID="GridView8" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="SqlDataSource9" EmptyDataText="搜尋結果尚無資料">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                                <ControlStyle CssClass="BtnFree" />
                                                <ItemStyle CssClass="BtnFree" />
                                                <ItemStyle Width="150px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="UW_Content" HeaderText="常用詞句內容" SortExpression="UW_Content" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                                                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM Daily_UsualWord WHERE (UID = @original_UID)" InsertCommand="INSERT INTO [Daily_UsualWord] ([UW_Type], [UW_Content], [Sort]) VALUES (@UW_Type, @UW_Content, @Sort)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Daily_UsualWord] WHERE ([UW_Type] = @UW_Type)" UpdateCommand="UPDATE Daily_UsualWord SET UW_Content = @UW_Content WHERE (UID = @original_UID)">
                                                                                            <DeleteParameters>
                                                                                                <asp:Parameter Name="original_UID" Type="Int32" />
                                                                                            </DeleteParameters>
                                                                                            <InsertParameters>
                                                                                                <asp:Parameter Name="UW_Type" Type="String" />
                                                                                                <asp:Parameter Name="UW_Content" Type="String" />
                                                                                                <asp:Parameter Name="Sort" Type="Int32" />
                                                                                            </InsertParameters>
                                                                                            <SelectParameters>
                                                                                                <asp:Parameter DefaultValue="施工品質查核" Name="UW_Type" Type="String" />
                                                                                            </SelectParameters>
                                                                                            <UpdateParameters>
                                                                                                <asp:Parameter Name="UW_Content" Type="String" />
                                                                                                <asp:Parameter Name="original_UID" Type="Int32" />
                                                                                            </UpdateParameters>
                                                                                        </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </asp:View>
                        </asp:MultiView>
                        </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>   
    </div>
</asp:Content>
