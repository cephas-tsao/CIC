<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectInfoView.aspx.cs" Inherits="ProjectInfoView" %>

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
                <td class="TableTop">專案資料檢視</td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_1" runat="server" ForeColor="White" OnClick="LBtn_1_Click">專案基本資料</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server">
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="Table1">專案(工程)編號</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">專案(工程)名稱</td>
                    <td class="Table2LC">
                        xxxxxxxxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">專案(工程)狀態</td>
                    <td class="Table2LC">xxxxxxxxxxxx</td>
                    <td class="Table1">專案(工程)簡稱</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 104px">備註</td>
                    <td class="Table2LC" colspan="3" style="height: 104px">
                        xxxxxxxx<br /> xxxxxxxx<br /> xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">工程所在國家</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">工程所在縣市</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">工地負責人</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">工地電話</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">工地傳真</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">業主聯絡人</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">業主連絡電話</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">業主地址</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxxxxxxxxxxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 32px">預定開工日期</td>
                    <td class="Table2LC" style="height: 32px">
                        xxxxxxxx</td>
                    <td class="Table1" style="height: 32px">預定完工日期</td>
                    <td class="Table2LC" style="height: 32px">
                        xxxxxxxx<br />
                        <span class="NoteText">*倘工期有展延則須修改預定完工日期為展延後之日期</span></td>
                </tr>
                <tr>
                    <td class="Table1">實際開工日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">實際完工日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">核定完工日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">驗收合格日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">預定保固期滿日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">實際保固金退還日期</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">履約保證金</td>
                    <td class="Table2LC">
                        金額/百分比xxxxxxx元/%</td>
                    <td class="Table2">&nbsp;</td>
                    <td class="Table2LC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 33px">工程區分</td>
                    <td class="Table2LC" style="height: 33px">
                        公共工程/民間工程</td>
                    <td class="Table1" style="height: 33px">工程分類</td>
                    <td class="Table2LC" style="height: 33px">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層數</td>
                    <td class="Table2LC">
                        xxxxxxxx樓</td>
                    <td class="Table1">地上樓層數</td>
                    <td class="Table2LC">
                        xxxxxxxx樓</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層面積</td>
                    <td class="Table2LC">
                        xxxxxxxx平方公尺(M<sup>2</sup>)</td>
                    <td class="Table1">地上樓層面積</td>
                    <td class="Table2LC">
                        xxxxxxxx平方公尺(M<sup>2</sup>)</td>
                </tr>
                <tr>
                    <td class="Table1">建物高度</td>
                    <td class="Table2LC">
                        xxxxxxxx公尺(M)</td>
                    <td class="Table1">開挖深度</td>
                    <td class="Table2LC">
                        xxxxxxxx公尺(M)</td>
                </tr>
                <tr>
                    <td class="Table1">基礎型式</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">擋土措施</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">施工概要備註</td>
                    <td class="Table2LC">
                        xxxxxxxx<br /> xxxxxxxx<br /> xxxxxxxx</td>
                    <td class="Table1">其他工程概要</td>
                    <td class="Table2LC">
                        xxxxxxxx<br /> xxxxxxxx<br /> xxxxxxxx</td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" OnClick="LBtn_2_Click">工程合約資料</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_2" runat="server">
            <table class="Table100">
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約基本資料</td>
                </tr>
                <tr>
                    <td class="Table1">原合約總價</td>
                    <td class="Table2LC" colspan="3" style="height: 26px">
                        x,xxx,xxx元</td>
                </tr>
                <tr>
                    <td class="Table1">承攬方式</td>
                    <td class="Table2LC" colspan="3" style="height: 26px">實做實算/總價承攬/實做+總價/統包/其他</td>
                </tr>
                <tr>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">建築師/設計單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">監造單位名稱</td>
                    <td class="auto-style2" colspan="3">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">PCM名稱</td>
                    <td class="Table2LC" colspan="3">
                        xxxxxxxx</td>
                </tr>
                <tr>
                    <td class="Table1">工期計算方式</td>
                    <td class="Table2LC">
                        xxxxxxxx</td>
                    <td class="Table1">工期</td>
                    <td class="Table2LC">
                        xxxxxxxx(天)</td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.建物執照資料</td>
                </tr>
                <tr>
                    <td class="Table1">建照號碼</td>
                    <td class="Table2LC">xxxxxxxx</td>
                    <td class="Table1">建照核發日期</td>
                    <td class="Table2LC">xxxx/xx/xx</td>
                </tr>
                <tr>
                    <td class="Table1">使照號碼</td>
                    <td class="Table2LC">xxxxxxxx</td>
                    <td class="Table1">使照核發日期</td>
                    <td class="Table2LC">xxxx/xx/xx</td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; III.合約明細資料</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button id="Button3" runat="server" Text="工期逾罰資料檢視" CssClass="BtnFree" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button4" runat="server" Text="合約保固資料檢視" CssClass="BtnFree"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button5" runat="server" Text="業主付款方式檢視" CssClass="BtnFree" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button6" runat="server" Text="合約應注意條款檢視" CssClass="BtnFree"  />
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; IV.聯合承攬資料</td>
                </tr>
                <tr>
                    <td class="Table2CC" colspan="4">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JVID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="JVID" HeaderText="JVID" InsertVisible="False" ReadOnly="True" SortExpression="JVID" Visible="False" />
                                <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                <asp:TemplateField HeaderText="承攬廠商名稱" SortExpression="Name">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList19" runat="server" CssClass="DDLfree" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="UID" SelectedValue='<%# Bind("FID") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="JVItem" HeaderText="承攬項目" SortExpression="JVItem" />
                                <asp:BoundField DataField="JVPrice" HeaderText="承攬金額" SortExpression="JVPrice" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" DeleteCommand="DELETE FROM [ProjectM_JV] WHERE [JVID] = @JVID" InsertCommand="INSERT INTO ProjectM_JV(PID, FID, JVItem, JVPrice) VALUES (@PID, @FID, @JVItem, @JVPrice)" SelectCommand="SELECT ProjectM_JV.JVID, ProjectM_JV.PID, ProjectM_JV.FID, ProjectM_JV.JVItem, ProjectM_JV.JVPrice, FirmM.Name FROM ProjectM_JV INNER JOIN FirmM ON ProjectM_JV.FID = FirmM.UID WHERE (ProjectM_JV.PID = @PID)" UpdateCommand="UPDATE [ProjectM_JV] SET  [FID] = @FID, [JVItem] = @JVItem, [JVPrice] = @JVPrice WHERE [JVID] = @JVID">
                            <DeleteParameters>
                                <asp:Parameter Name="JVID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                                <asp:Parameter Name="FID" Type="Int32" />
                                <asp:Parameter Name="JVItem" Type="String" />
                                <asp:Parameter Name="JVPrice" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FID" Type="Int32" />
                                <asp:Parameter Name="JVItem" Type="String" />
                                <asp:Parameter Name="JVPrice" Type="Decimal" />
                                <asp:Parameter Name="JVID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
    </div>
    </form>
</body>
</html>
