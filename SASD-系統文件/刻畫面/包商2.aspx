<%@ Page Language="C#" AutoEventWireup="true" CodeFile="包商2.aspx.cs" Inherits="包商2" %>

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
                <td class="TableTop">分包商基本資料管理</td>
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
                    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White" OnClick="LinkButton3_Click">新增分包商</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_Insert" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Subject" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select5" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource8" DataTextField="Content" DataValueField="Content">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [UsualWord] WHERE ([Type] = @Type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Date" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Tax" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_SumPrice" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu3" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select6" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource9" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [CityList] WHERE (([CountryID] = @CountryID) AND ([CityID] &lt;&gt; @CityID))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu7" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu9" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu8" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="8">
                        <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="確定新增" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
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
                                            <asp:Button ID="Button1" runat="server" CssClass="BtnFree" OnClick="Button1_Click" Text="編修" />
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
        <asp:Panel ID="Pnl_Edit" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="8">
                        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">分包商基本資料編輯</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Subject0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select7" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource10" DataTextField="Content" DataValueField="Content">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [UsualWord] WHERE ([Type] = @Type)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Date0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Tax0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_SumPrice0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu11" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu13" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu14" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu15" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select8" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource11" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [CityList] WHERE (([CountryID] = @CountryID) AND ([CityID] &lt;&gt; @CityID))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Docu17" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu18" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu19" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Docu20" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="8">
                        <asp:Button ID="Button38" runat="server" CssClass="BtnLargeShort" Text="儲存修改" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button39" runat="server" CssClass="BtnLargeShort" Text="回復原值" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
