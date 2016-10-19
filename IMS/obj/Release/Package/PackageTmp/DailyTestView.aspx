<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailyTestView.aspx.cs" Inherits="IMS.DailyTestView1" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>檢驗取樣記錄總覽</title>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    </div>
    <div style="width:88%;float:right;">  
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
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">取報告日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">項目名稱</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">試驗類別</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" CssClass="DDLshort" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px" Width="155px">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>取樣</asp:ListItem>
                            <asp:ListItem>試驗</asp:ListItem>
                            <asp:ListItem>廠驗</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">分包(供料)廠商</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">檢驗單位/實驗室</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
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
                        <asp:DropDownList ID="DDL_Op10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
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
                        <asp:Button ID="Button34" runat="server" CssClass="BtnLargeMedium" OnClick="Button34_Click" Text="確定搜尋" Height="32px" />
                        &nbsp;
                        <asp:Button ID="Button35" runat="server" CssClass="BtnLargeMedium" Text="清除條件" Height="32px" OnClick="Button35_Click" />
                        &nbsp;
                        <asp:Button ID="Button37" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" Height="32px" OnClick="Button37_Click" />
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
                    <asp:ImageButton ID="ImageButton133" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton133_Click" />
                    &nbsp;
                    </td>
            </tr>
        </table>
            <table class="Table100" style="width:100%;">
                <tr>
                    <td class="Table2C">
                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Daily_SampleID" AllowPaging="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button36" runat="server" CssClass="BtnFree" Enabled="true" CommandName="Select" Text="詳細" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Daily_SampleID" HeaderText="Daily_SampleID" InsertVisible="False" ReadOnly="True" SortExpression="Daily_SampleID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ItemName" HeaderText="項目名稱" SortExpression="ItemName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TestType" HeaderText="試驗類型" SortExpression="TestType" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Location" HeaderText="取樣地點" SortExpression="Location" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SNumber" HeaderText="取樣數量" SortExpression="SNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RegularNumber" HeaderText="合格數量" SortExpression="RegularNumber" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LabName" HeaderText="檢驗單位/實驗室" SortExpression="LabName" ItemStyle-HorizontalAlign="Center">
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
                    </td>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                            <table class="Table100" style="width:880px;">
                                <tr>
                                    <td class="TableTop" colspan="8">施工檢驗取樣資訊</td>
                                </tr>
                                <tr>
                                    <td class="Table1">登載日報日期</td>
                                    <td class="Table2CC" colspan="3">
                                        <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="Table1">項目名稱</td>
                                    <td class="Table2" colspan="3">
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">單位</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">取樣地點</td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">取樣數量</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">代表數量</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">取樣日期</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">試驗類別</td>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">材料進場日期</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">預定取報告日期</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">分包(供料)廠商</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">檢驗單位/實驗室</td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">檢驗標準</td>
                                    <td class="Table2" colspan="3">
                                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">取樣人員</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">備註</td>
                                    <td class="Table2" colspan="7">
                                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible="False">
                                <table class="Table101" style="width:880px;">
                                <tr>
                                    <td class="TableTop" colspan="8">檢試驗報告紀錄資訊</td>
                                </tr>
                                <tr>
                                    <td class="Table1">登載日報日期</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="Table1">實際取報告日期</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">檢驗單位/實驗室</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">合格數量</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">會驗人員</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table2CCC" colspan="6">
                                        <asp:Button id="Button1" Text="檢試驗報告下載" CssClass="BtnFree" OnClick="LinkButton_Click" runat="server"/>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            </asp:Panel>
        <br />
    </div>
</asp:Content>

