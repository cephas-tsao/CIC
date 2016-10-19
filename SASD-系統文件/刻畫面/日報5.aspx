<%@ Page Language="C#" AutoEventWireup="true" CodeFile="日報5.aspx.cs" Inherits="日報5" %>

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
                <td class="TableTop">檢驗取樣記錄總覽</td>
            </tr>
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">條件搜尋</asp:LinkButton>
                                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Search" runat="server">
            <table class="Table100">
                <tr>
                    <td class="Table1">取樣日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">取報告日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">項目名稱</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">試驗類別</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" CssClass="DDLshort" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>取樣</asp:ListItem>
                            <asp:ListItem>試驗</asp:ListItem>
                            <asp:ListItem>廠驗</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">分包(供料)廠商</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">檢驗單位/實驗室</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">是否已取報告</td>
                    <td class="Table2">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>是</asp:ListItem>
                            <asp:ListItem>否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">是否全數合格</td>
                    <td class="Table2">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>是</asp:ListItem>
                            <asp:ListItem>否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table2CC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="6">
                        <asp:Button ID="Button34" runat="server" CssClass="BtnLargeMedium" OnClick="Button34_Click" Text="確定搜尋" />
                        &nbsp;
                        <asp:Button ID="Button35" runat="server" CssClass="BtnLargeMedium" Text="清除條件" />
                        &nbsp;
                        <asp:Button ID="Button37" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
        <br />
        <asp:Panel ID="Pnl_Result" runat="server" Visible="False">
        
        <table class="Table100">
            <tr>
                <td class="TableTop">
                    搜尋結果</td>
            </tr>
            <tr>
                <td class="Table2R">
                    <asp:ImageButton ID="ImageButton133" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出PDF檔" Width="27px" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                </td>
            </tr>
        </table>
            <table class="Table100">
                <tr>
                    <td class="Table2C">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Daily_SampleID,Daily_ReportID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button36" runat="server" CssClass="BtnFree" Text="詳細" OnClick="Button36_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Daily_SampleID" HeaderText="Daily_SampleID" InsertVisible="False" ReadOnly="True" SortExpression="Daily_SampleID" Visible="False" />
                                <asp:BoundField DataField="ItemName" HeaderText="項目名稱" SortExpression="ItemName" />
                                <asp:BoundField DataField="TestType" HeaderText="試驗類別" SortExpression="TestType" />
                                <asp:BoundField DataField="Location" HeaderText="取樣地點" SortExpression="Location" />
                                <asp:TemplateField HeaderText="取樣數量" SortExpression="SNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SNumber") %>'></asp:Label>
                                        (<asp:Label ID="Label12" runat="server" Text='<%# Bind("SUnit") %>'></asp:Label>
                                        )
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SUnit" HeaderText="SUnit" SortExpression="SUnit" Visible="False" />
                                <asp:TemplateField HeaderText="合格數量" SortExpression="RegularNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RegularNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RegularNumber") %>'></asp:Label>
                                        (<asp:Label ID="Label22" runat="server" Text='<%# Bind("SUnit") %>'></asp:Label>
                                        )
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LabName" HeaderText="檢驗單位/實驗室" SortExpression="LabName" />
                                <asp:BoundField DataField="Daily_ReportID" HeaderText="Daily_ReportID" InsertVisible="False" ReadOnly="True" SortExpression="Daily_ReportID" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT Daily_TestSampling.Daily_SampleID, Daily_TestSampling.ItemName, Daily_TestSampling.Unit, Daily_TestSampling.SNumber, Daily_TestSampling.SUnit, Daily_TestReport.RegularNumber, Daily_TestReport.LabName, Daily_TestReport.Daily_ReportID, Daily_TestSampling.Location, Daily_TestSampling.TestType FROM Daily_TestReport INNER JOIN Daily_TestSampling ON Daily_TestReport.Daily_SampleID = Daily_TestSampling.Daily_SampleID"></asp:SqlDataSource>
                    </td>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="TableTop" colspan="8">施工檢驗取樣資訊</td>
                                </tr>
                                <tr>
                                    <td class="Table1">登載日報日期</td>
                                    <td class="Table2CC" colspan="3">2015/10/03</td>
                                    <td class="Table1" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="Table1">項目名稱</td>
                                    <td class="Table2" colspan="3">預拌混凝土FC&#39;=245kgf/cm2</td>
                                    <td class="Table1">單位</td>
                                    <td class="Table2CCC">M3</td>
                                    <td class="Table1">取樣地點</td>
                                    <td>第四模澆置</td>
                                </tr>
                                <tr>
                                    <td class="Table1">取樣數量</td>
                                    <td class="Table2CCC">
                                        3.000(組)</td>
                                    <td class="Table1">代表數量</td>
                                    <td class="Table2CCC">1,000.00(M3)</td>
                                    <td class="Table1">取樣日期</td>
                                    <td class="Table2CCC">2015/10/03</td>
                                    <td class="Table1">試驗類別</td>
                                    <td>取樣</td>
                                </tr>
                                <tr>
                                    <td class="Table1">材料進場日期</td>
                                    <td class="Table2CCC">2015/10/03</td>
                                    <td class="Table1">預定取報告日期</td>
                                    <td class="Table2CCC">2015/10/10</td>
                                    <td class="Table1">分包(供料)廠商</td>
                                    <td class="Table2CCC">乃文預拌廠</td>
                                    <td class="Table1">檢驗單位/實驗室</td>
                                    <td>SGS南港實驗室</td>
                                </tr>
                                <tr>
                                    <td class="Table1">檢驗標準</td>
                                    <td class="Table2" colspan="3">FC&#39;=245kgf/cm2</td>
                                    <td class="Table1">取樣人員</td>
                                    <td class="Table2CCC" colspan="3">施工-陳大華，監造-王小遠</td>
                                </tr>
                                <tr>
                                    <td class="Table1">備註</td>
                                    <td class="Table2" colspan="7">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="TableTop" colspan="8">檢試驗報告紀錄資訊</td>
                                </tr>
                                <tr>
                                    <td class="Table1">登載日報日期</td>
                                    <td class="Table2CCC" colspan="3">2015/10/23</td>
                                    <td class="Table1" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="Table1">實際取報告日期</td>
                                    <td class="Table2CCC" colspan="3">2015/10/23</td>
                                    <td class="Table1">檢驗單位/實驗室</td>
                                    <td class="Table2CCC" colspan="3">SGS南港實驗室</td>
                                </tr>
                                <tr>
                                    <td class="Table1">合格數量</td>
                                    <td class="Table2CCC" colspan="3">3.000(組)</td>
                                    <td class="Table1">會驗人員</td>
                                    <td class="Table2CCC" colspan="3">施工-陳大華，監造-王小遠，業主-吳阿偉</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            </asp:Panel>
        <br />
    </div>
    </form>
</body>
</html>
