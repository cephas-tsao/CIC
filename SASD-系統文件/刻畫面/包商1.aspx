<%@ Page Language="C#" AutoEventWireup="true" CodeFile="包商1.aspx.cs" Inherits="包商1" %>

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
    
        <table class="Table100">
            <tr>
                <td class="TableTop">分包商資料檢視</td>
            </tr>
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">條件搜尋</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Search" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource7" DataTextField="Content" DataValueField="Content">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [UsualWord] WHERE ([Type] = @Type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
                    <td class="Table1">廠商專長/供給項目</td>
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
                    <td class="Table1">所在縣市</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Select4" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" DataSourceID="SqlDataSource5" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [CityList] WHERE (([CountryID] = @CountryID) AND ([CityID] &lt;&gt; @CityID))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="6">
                        <asp:Button ID="Button34" runat="server" CssClass="BtnLargeMedium" Text="確定搜尋" />
                        &nbsp;
                        <asp:Button ID="Button35" runat="server" CssClass="BtnLargeMedium" Text="清除條件" />
                        &nbsp;
                        <asp:Button ID="Button37" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White">分包商列表</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2C">
                                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource6" Width="100%" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CssClass="BtnFree" OnClick="Button1_Click" Text="資料檢視" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                    <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="廠商類型" SortExpression="Type" />
                                    <asp:BoundField DataField="SupportItem" HeaderText="廠商專長／供給材料" SortExpression="SupportItem" />
                                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" Visible="False" />
                                    <asp:BoundField DataField="Location" HeaderText="所在縣市" SortExpression="Location" />
                                    <asp:BoundField DataField="Tel1" HeaderText="聯絡電話" SortExpression="Tel1" />
                                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [UID], [Name], [Type], [SupportItem], [Owner], [Location], [Tel1], [Notes] FROM [FirmM]"></asp:SqlDataSource>
                                    </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_View" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="8">
                        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">分包商基本資料</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        xxxx-xxxxxx</td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        xx,xxx(萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        xxx(人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        xx-xxxxxxxx</td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        xx-xxxxxxxx</td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        xx-xxxxxxxx</td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        xx-xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        xxx</td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        xxxxxx@xxxx.xx</td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        x$@^#*$^!</td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</td>
                </tr>
            </table>
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="10">
                        <asp:LinkButton ID="LinkButton5" runat="server" ForeColor="White">分包商遴選評估結果</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="TableLeftColumn" rowspan="3">初<br /> 評</td>
                    <td class="Table1">資本額</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                    <td class="Table1">專業能力</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">設備</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                    <td class="Table1">品管措施</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                    <td class="Table1">報價</td>
                    <td class="Table2">XXXX</td>
                    <td class="Table2">xxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">總分</td>
                    <td class="Table2">XX分</td>
                    <td class="Table2">合格/不合格</td>
                    <td class="Table1">初評人</td>
                    <td class="Table2">XXX</td>
                    <td class="Table2">(日期：xxxx.xx.xx)</td>
                    <td class="Table1">初評說明</td>
                    <td class="Table2" colspan="2">xxxxxxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="TableLeftColumn">複<br /> 評</td>
                    <td class="Table1">結果</td>
                    <td class="Table2LC" colspan="2">合格/不合格</td>
                    <td class="Table1">複評人</td>
                    <td class="Table2LC">XXX</td>
                    <td class="Table2LC">(日期：xxxx.xx.xx)</td>
                    <td class="Table1">複評說明</td>
                    <td class="Table2LC" colspan="2">xxxxxxxxxxxxxx</td>
                </tr>
            </table>
            <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton6" runat="server" ForeColor="White">分包商承攬紀錄</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Table2CC">
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="專案編號" HeaderText="專案編號" SortExpression="專案編號" />
                                <asp:BoundField DataField="專案名稱" HeaderText="專案名稱" SortExpression="專案名稱" />
                                <asp:BoundField DataField="專案狀態" HeaderText="專案狀態" SortExpression="專案狀態" />
                                <asp:BoundField DataField="分包合約編號" HeaderText="分包合約編號" SortExpression="分包合約編號" />
                                <asp:BoundField DataField="分包合約名稱" HeaderText="分包合約名稱" SortExpression="分包合約名稱" />
                                <asp:BoundField DataField="分包合約總金額" HeaderText="分包合約總金額" SortExpression="分包合約總金額" />
                                <asp:BoundField DataField="末次追加減後總金額" HeaderText="末次追加減後總金額" SortExpression="末次追加減後總金額" />
                                <asp:BoundField DataField="分包合約種類" HeaderText="分包合約種類" SortExpression="分包合約種類" />
                                <asp:BoundField DataField="已計價次數" HeaderText="已計價次數" SortExpression="已計價次數" ReadOnly="True" />
                                <asp:BoundField DataField="已計價金額" HeaderText="已計價金額" SortExpression="已計價金額" ReadOnly="True" />
                                <asp:TemplateField HeaderText="考核結果">
                                    <ItemTemplate>
                                        初評：<asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstResult") %>'></asp:Label>
                                        複評：<asp:Label ID="Label2" runat="server" Text='<%# Bind("SecondResult") %>'></asp:Label>
                                        <asp:Button ID="Button38" runat="server" CssClass="BtnFree" OnClick="Button38_Click" Text="考核內容" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT ProjectM0.ProjectCode AS 專案編號, ProjectM0.ProjectName AS 專案名稱, ProjectM0.ProjectStatus AS 專案狀態, SubContract_Main.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總金額, SubContract_Main.LastTotalPrice AS 末次追加減後總金額, SubContract_Main.ContractType AS 分包合約種類, MAX(FFund_Main.FF_Edition) AS 已計價次數, SUM(FFund_Main.Item12) AS 已計價金額, Firm_Check.FirstResult, Firm_Check.SecondResult FROM Firm_Check RIGHT OUTER JOIN SubContract_Main ON Firm_Check.SCID = SubContract_Main.SCID LEFT OUTER JOIN ProjectM0 ON SubContract_Main.PID = ProjectM0.PID LEFT OUTER JOIN FFund_Main ON SubContract_Main.SCID = FFund_Main.SCID WHERE (SubContract_Main.FirmID = @FirmID) GROUP BY FFund_Main.SCID, ProjectM0.ProjectCode, ProjectM0.ProjectName, ProjectM0.ProjectStatus, SubContract_Main.SC_Code, SubContract_Main.SC_Name, SubContract_Main.TotalPrice, SubContract_Main.LastTotalPrice, SubContract_Main.ContractType, Firm_Check.FirstResult, Firm_Check.SecondResult ORDER BY FFund_Main.SCID DESC">
                            <SelectParameters>
                                <asp:SessionParameter Name="FirmID" SessionField="FirmID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Pnl_Ckeck" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table0" colspan="10">分包合約考核結果</td>
                                </tr>
                                <tr>
                                    <td class="TableLeftColumn" rowspan="3">初<br /> 評</td>
                                    <td class="Table1">施工品質</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                    <td class="Table1">進度控制</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                    <td class="Table1">配合度</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                </tr>
                                <tr>
                                    <td class="Table1">工地清潔</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                    <td class="Table1">勞工安全</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                    <td class="Table1">材料愛惜</td>
                                    <td class="Table2">X</td>
                                    <td class="Table2">xxxxxxxxxx</td>
                                </tr>
                                <tr>
                                    <td class="Table1">總分</td>
                                    <td class="Table2">XX分</td>
                                    <td class="Table2">合格/不合格</td>
                                    <td class="Table1">初評人</td>
                                    <td class="Table2">XXX</td>
                                    <td class="Table2">(日期：xxxx.xx.xx)</td>
                                    <td class="Table1">初評說明</td>
                                    <td class="Table2" colspan="2">xxxxxxxxxxxxxx</td>
                                </tr>
                                <tr>
                                    <td class="TableLeftColumn">複<br /> 評</td>
                                    <td class="Table1">結果</td>
                                    <td class="Table2LC" colspan="2">合格/不合格</td>
                                    <td class="Table1">複評人</td>
                                    <td class="Table2LC">XXX</td>
                                    <td class="Table2LC">(日期：xxxx.xx.xx)</td>
                                    <td class="Table1">複評說明</td>
                                    <td class="Table2LC" colspan="2">xxxxxxxxxxxxxx</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
