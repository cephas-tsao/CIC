<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectInfoM.aspx.cs" Inherits="ProjectInfoM" %>

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
                <td class="TableTop">專案資料管理</td>
            </tr>
            <tr>
                <td class="Table1R">&nbsp;<asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                &nbsp;
                                </td>
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
                    <td class="Table2LC" colspan="2">
                        NTUSTCEE</td>
                    <td class="Table1">專案(工程)名稱</td>
                    <td class="Table2LC">
                        <span style="color: rgb(0, 0, 0); font-family: 'Times New Roman'; font-size: medium; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none;">希艾熙社區活動中心建築工程</span></td>
                </tr>
                <tr>
                    <td class="Table1">專案(工程)狀態</td>
                    <td class="Table2LC" colspan="2">未開工</td>
                    <td class="Table1">專案(工程)簡稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox44" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 104px">備註</td>
                    <td class="Table2LC" colspan="4" style="height: 104px">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TB500" TextMode="MultiLine" Height="100px" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工程所在國家</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="DropDownList15" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工程所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工地負責人</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox45" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">工地電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工地傳真</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox46" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox47" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主聯絡人</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox48" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">業主連絡電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox49" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主地址</td>
                    <td class="Table2LC" colspan="4">
                        <asp:TextBox ID="TextBox50" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 32px">預定開工日期</td>
                    <td class="Table2LC" colspan="2" style="height: 32px">
                        <asp:TextBox ID="TextBox51" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1" style="height: 32px">預定完工日期</td>
                    <td class="Table2LC" style="height: 32px">
                        <asp:TextBox ID="TextBox52" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <br />
                        <span class="NoteText">*倘工期有展延則須修改預定完工日期為展延後之日期</span></td>
                </tr>
                <tr>
                    <td class="Table1">實際開工日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox53" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">實際完工日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox54" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">核定完工日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">驗收合格日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox55" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">預定保固期滿日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox56" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">實際退還保固金日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox19" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">履約保證金</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                            <asp:ListItem>金額</asp:ListItem>
                            <asp:ListItem>百分比</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox57" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">&nbsp;</td>
                    <td class="Table2LC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 33px">工程區分</td>
                    <td class="Table2LC" colspan="2" style="height: 33px">
                        <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>公共工程</asp:ListItem>
                            <asp:ListItem>民間工程</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table1" style="height: 33px">工程分類</td>
                    <td class="Table2LC" style="height: 33px">
                        <asp:DropDownList ID="DropDownList16" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層數</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox58" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        樓</td>
                    <td class="Table1">地上樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox59" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        樓</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層面積</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox60" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                    <td class="Table1">地上樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox61" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                </tr>
                <tr>
                    <td class="Table1">建物高度</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox62" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        公尺(M)</td>
                    <td class="Table1">開挖深度</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox63" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        公尺(M)</td>
                </tr>
                <tr>
                    <td class="Table1">基礎型式</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="DropDownList17" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">擋土措施</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DropDownList18" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">施工概要備註</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TextBox64" runat="server" Height="100px" TextMode="MultiLine" Width="250px" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">其他工程概要</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox65" runat="server" Height="100px" TextMode="MultiLine" Width="250px" CssClass="TBmiddle"></asp:TextBox>
                    </td>
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
                        <asp:TextBox ID="TextBox70" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">承攬方式</td>
                    <td class="Table2LC" colspan="3" style="height: 26px">
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>實做實算</asp:ListItem>
                            <asp:ListItem>總價承攬</asp:ListItem>
                            <asp:ListItem>實做+總價</asp:ListItem>
                            <asp:ListItem>統包</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox23" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建築師/設計單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox24" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="width: 200px; height: 34px">監造單位名稱</td>
                    <td class="Table2LC" colspan="3" style="height: 34px">
                        <asp:TextBox id="TextBox25" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">PCM名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox26" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工期計算方式</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DropDownList1" runat="server" CssClass="DDLfree" Font-Size="Medium">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem>限期完工</asp:ListItem>
                            <asp:ListItem>工作天</asp:ListItem>
                            <asp:ListItem>日曆天</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.建物執照資料</td>
                </tr>
                <tr>
                    <td class="Table1">建照號碼</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox66" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">建照核發日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox68" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">使照號碼</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox67" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">使照核發日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TextBox69" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; III.合約明細資料</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button id="Button3" runat="server" Text="工期逾罰資料" CssClass="BtnFree" OnClick="Button3_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button4" runat="server" Text="合約保固資料" CssClass="BtnFree"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button5" runat="server" Text="業主付款方式" CssClass="BtnFree" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button6" runat="server" Text="合約應注意條款" CssClass="BtnFree"  />
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; IV.聯合承攬資料</td>
                </tr>
                <tr>
                    <td class="Table1R" colspan="4">
                        <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" OnClick="ImageButton178_Click" ToolTip="新增聯合承攬廠商" Width="27px" />
                        &nbsp;
                        <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Reload.png" OnClick="ImageButton179_Click" ToolTip="更新/返回聯合承攬列表" Width="27px" />
                    </td>
                </tr>
                <tr>
                    <td class="Table2CC" colspan="4">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JVID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                                <ControlStyle CssClass="BtnFree" />
                                </asp:CommandField>
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
                            <EmptyDataTemplate>
                                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="JVID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>
                                        <asp:BoundField DataField="JVID" HeaderText="JVID" InsertVisible="False" ReadOnly="True" SortExpression="JVID" Visible="False" />
                                        <asp:TemplateField HeaderText="承攬廠商名稱" SortExpression="Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="DropDownList20" runat="server" AppendDataBoundItems="True" CssClass="DDLfree" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="UID" SelectedValue='<%# Bind("FID") %>'>
                                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="JVItem" HeaderText="承攬項目" SortExpression="JVItem" />
                                        <asp:BoundField DataField="JVPrice" HeaderText="承攬金額" SortExpression="JVPrice" />
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="BtnFree" OnClick="Button1_Click" Text="確定新增" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                                            </ItemTemplate>
                                            <ControlStyle CssClass="BtnFree" />
                                        </asp:TemplateField>
                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>
                            </EmptyDataTemplate>
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
