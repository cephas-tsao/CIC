<%@ Page Language="C#" AutoEventWireup="true" CodeFile="竣工2.aspx.cs" Inherits="竣工2" %>

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
                <td class="TableTop">驗收紀錄檢視</td>
            </tr>
            </table>
    
    <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click">驗收紀錄總覽</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_View" runat="server">
            <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AcceptID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button3" runat="server" CssClass="BtnFree" Text="檢視" OnClick="Button3_Click" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="AcceptID" HeaderText="AcceptID" InsertVisible="False" ReadOnly="True" SortExpression="AcceptID" Visible="False" />
                    <asp:BoundField DataField="Type" HeaderText="驗收種類" SortExpression="Type" />
                    <asp:TemplateField HeaderText="批次" SortExpression="AllPart">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AllPart") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("AllPart") %>'></asp:Label>
                            (<asp:Label ID="Label2" runat="server" Text='<%# Bind("Batch") %>'></asp:Label>
                            )
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Date" HeaderText="驗收時間" SortExpression="Date" />
                    <asp:BoundField DataField="Code" HeaderText="案號及契約號" SortExpression="Code" />
                    <asp:BoundField DataField="OverNY" HeaderText="有無逾期" SortExpression="OverNY" />
                    <asp:BoundField DataField="Result" HeaderText="驗收結果" SortExpression="Result" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [AcceptanceRecord] WHERE ([PID] = @PID) ORDER BY [AcceptID]">
                <SelectParameters>
                    <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        
            <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                <table class="Table100">
                    <tr>
                        <td class="Table0" colspan="10">
                            <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">單筆驗收紀錄檢視</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">驗收種類</td>
                        <td class="Table2">
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DDLshort">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>初驗</asp:ListItem>
                                <asp:ListItem Selected="True">驗收</asp:ListItem>
                                <asp:ListItem>複驗</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="Table2">
                            <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">全部驗收</asp:ListItem>
                                <asp:ListItem>部分驗收</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="Table1">驗收批次</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox15" runat="server" CssClass="TBshort"></asp:TextBox>
                        </td>
                        <td class="Table1">日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle">2015.12.31</asp:TextBox>
                        </td>
                        <td class="Table1" colspan="2">地點</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox17" runat="server" CssClass="TBmiddle">NTUST</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">案號及契約號</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox18" runat="server" CssClass="TB500">11223344</asp:TextBox>
                        </td>
                        <td class="Table1">廠商名稱</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox19" runat="server" CssClass="TB500">台科測試台</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">標的名稱及數量摘要</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="TB500">更換RFID大門一只</asp:TextBox>
                        </td>
                        <td class="Table1">採購金額</td>
                        <td class="Table2" colspan="4">
                            <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>未達公告金額</asp:ListItem>
                                <asp:ListItem Selected="True">公告金額以上未達查核金額</asp:ListItem>
                                <asp:ListItem>查核金額以上未達巨額</asp:ListItem>
                                <asp:ListItem>巨額</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">履約期限</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle">2015.11.30</asp:TextBox>
                        </td>
                        <td class="Table1">完成履約日期</td>
                        <td class="Table2" colspan="2">
                            <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle">2015.11.29</asp:TextBox>
                        </td>
                        <td class="Table2" colspan="2">
                            <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>逾期</asp:ListItem>
                                <asp:ListItem Selected="True">未逾期</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">契約金額</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle" dir="rtl">1000000.000</asp:TextBox>
                        </td>
                        <td class="Table1">契約變更或加減價次數</td>
                        <td class="Table2" colspan="4">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="TBshort">3</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">驗收經過</td>
                        <td class="Table2" colspan="9">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="TB500" Height="154px" TextMode="MultiLine" Width="640px">其他未查驗及隱蔽部份，由監造及施工單位負責。</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">驗收結果</td>
                        <td class="Table2" colspan="9">
                            <asp:RadioButtonList ID="RadioButtonList8" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList8_SelectedIndexChanged">
                                <asp:ListItem Selected="True">與契約、圖說、貨樣規定相符</asp:ListItem>
                                <asp:ListItem>與契約、圖說、貨樣規定不符及其情形：</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:TextBox ID="TB_ResultNO2" runat="server" CssClass="TB500" Height="154px" TextMode="MultiLine" Visible="False" Width="640px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">改善期限</td>
                        <td class="Table2" colspan="9">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="TB500" Height="154px" TextMode="MultiLine" Width="640px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">備註</td>
                        <td class="Table2" colspan="9">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TB500" Height="154px" TextMode="MultiLine" Width="640px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
