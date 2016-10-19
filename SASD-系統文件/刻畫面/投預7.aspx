<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投預7.aspx.cs" Inherits="投預7" %>

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
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop">詢價單管理</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="編修查詢">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢各詢價廠商之報價資料" OnClick="Button1_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RFQ_Code" HeaderText="詢價單編號" SortExpression="RFQ_Code">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Name" HeaderText="詢價單名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="Location" HeaderText="工程所在地" SortExpression="Location" />
                                            <asp:BoundField DataField="ReplyDate" HeaderText="報價回覆期限" SortExpression="ReplyDate" />
                                            <asp:TemplateField HeaderText="經辦人" SortExpression="WorkManDep">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WorkManDep") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WorkManDep") %>'></asp:Label>
                                                    -<asp:Label ID="Label2" runat="server" Text='<%# Bind("WorkManName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#330099" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT DISTINCT [RFQ_Code], [Location], [ReplyDate], [WorkManDep], [WorkManName], [Name] FROM [RFQ]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
                        <br />
                        <asp:Panel ID="Pnl_Firm" runat="server" Visible="False">
                        
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table1">詢價單編號</td>
                                <td class="Table2">
                                    <asp:Label ID="Label3" runat="server" Text="RFQ00001"></asp:Label>
                                </td>
                                <td class="Table1">詢價單名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="Label4" runat="server" Text="鋼筋"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9" colspan="4">
                                    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" Width="100%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢/填寫報價單" OnClick="Button2_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="Button3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button2_Click" Text="匯出詢價單" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RFQ_Code" HeaderText="RFQ_Code" SortExpression="RFQ_Code" Visible="False" />
                                            <asp:BoundField DataField="Sort" HeaderText="Sort" SortExpression="Sort" Visible="False" />
                                            <asp:BoundField DataField="Name" HeaderText="詢價廠商名稱" SortExpression="Name" />
                                            <asp:BoundField DataField="TotalPrice" HeaderText="報價總價(不含稅)" SortExpression="TotalPrice" />
                                            <asp:TemplateField HeaderText="引用此廠商報價" SortExpression="QuoteNY">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuoteNY") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"QuoteNY"))==1)? "是":"否" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#330099" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT RFQ.RFQ_Code, RFQ.Sort, FirmM.Name, RFQ.DiscountPercent, RFQ.TotalPrice, RFQ.QuoteNY FROM FirmM INNER JOIN RFQ ON FirmM.UID = RFQ.FirmID WHERE (RFQ.RFQ_Code = @RFQ_Code)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="RFQ00001" Name="RFQ_Code" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
                            <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                            
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">廠商名稱</td>
                                    <td class="Table2LC" colspan="3">
                                        <asp:Label ID="Label5" runat="server" Text="老王包工業"></asp:Label>
                                    </td>
                                    <td class="Table1" rowspan="2">報價總價(不含稅)</td>
                                    <td class="Table2LC" rowspan="2">
                                        <asp:Label ID="Label6" runat="server" Text="4,500" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1" align="center">
                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="折扣百分比" Checked="True" />
                                    </td>
                                    <td class="Table2LC" rowspan="2">
                                        <asp:TextBox ID="TextBox24" runat="server" CssClass="TBshort">90</asp:TextBox>
                                        ％</td>
                                    <td class="Table1">報價有效期限</td>
                                    <td class="Table2LC">
                                        <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle">2016.03.30</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="約定總價上限" />
                                    </td>
                                    <td class="Table1">是否引用報價</td>
                                    <td class="Table2LC">
                                        <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Text="否"></asp:Label>
                                    </td>
                                    <td class="Table1">稅金</td>
                                    <td class="Table2LC">
                                        <asp:Label ID="Label7" runat="server" Text="225"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">編碼</td>
                                        <td class="ShtCellCC">名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">總工程用量</td>
                                        <td class="ShtCellCC">報價單價</td>
                                        <td class="ShtCellCC">折扣單價</td>
                                        <td class="ShtCellCC">複價</td>
                                        <td class="ShtCellCC">結算方式</td>
                                        <td class="ShtCellCC">廠牌規格說明</td>
                                        <td class="ShtCellCC">備註</td>
                                    </tr>
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                            &nbsp;</td>
                                        <td class="ShtCellCL">
                                            鷹架爬梯</td>
                                        <td align="center" class="ShtCellCC">
                                            支</td>
                                        <td align="right" class="ShtCellCR">
                                            1</td>
                                        <td align="right" class="ShtCellCC">
                                            <asp:TextBox ID="TextBox25" runat="server"  CssClass="TBshort">5000</asp:TextBox>
                                        </td>
                                        <td align="right" class="ShtCellCR">
                                            4,500</td>
                                        <td align="right" class="ShtCellCR">
                                            4,500</td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TextBox26" runat="server"  CssClass="TBmiddle"></asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            A級品</td>
                                        <td class="ShtCellCC">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr>
                                        <td class="Table1">
                                            <asp:Button ID="Button25" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="計算總價並儲存" />
                                            &nbsp;
                                            <asp:Button ID="Button26" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="引用此廠商之報價" />
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="Table0">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單附件</td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource9" Width="100%">
                                            <Columns>
                                                <asp:CommandField ButtonType="Button" SelectText="下載" ShowSelectButton="True">
                                                <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                                <ItemStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                                <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                                <asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" />
                                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            </Columns>
                                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                            <RowStyle BackColor="White" ForeColor="#330099" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [UID], [Name], [Type], [Path] FROM [RFQ_File] WHERE ([RFQ_Code] = @RFQ_Code)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="RFQ00001" Name="RFQ_Code" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
    
    </div>
    </form>
</body>
</html>
