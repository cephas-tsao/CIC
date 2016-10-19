﻿<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AcceptanceView.aspx.cs" Inherits="IMS.AcceptanceView" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/CompletionMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>驗收紀錄管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />
        <div style="width: 88%; float: right;">
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="AcceptID" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandName="Select" CssClass="BtnFree" Text="編修" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AcceptID" HeaderText="AcceptID" InsertVisible="False" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="AcceptID" Visible="False">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="驗收種類" ItemStyle-HorizontalAlign="Center" SortExpression="Type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Batch" HeaderText="批次" ItemStyle-HorizontalAlign="Center" SortExpression="Batch">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="驗收時間" HtmlEncode="False" ItemStyle-HorizontalAlign="Center" SortExpression="Date">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Code" HeaderText="案號及契約號" ItemStyle-HorizontalAlign="Center" SortExpression="Code">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OverNY" HeaderText="有無逾期" ItemStyle-HorizontalAlign="Center" SortExpression="OverNY">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Result" HeaderText="驗收結果" ItemStyle-HorizontalAlign="Center" SortExpression="Result">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select * From AcceptanceRecord Where PID = @PID">
                    <SelectParameters>
                        <asp:SessionParameter Name="PID" SessionField="PID" />
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
                                <asp:TextBox ID="TextBox16" runat="server" CssClass="TBmiddle"></asp:TextBox>
                            </td>
                            <td class="Table1" colspan="2">地點</td>
                            <td class="Table2">
                                <asp:TextBox ID="TextBox17" runat="server" CssClass="TBmiddle"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">案號及契約號</td>
                            <td class="Table2" colspan="4">
                                <asp:TextBox ID="TextBox18" runat="server" CssClass="TB500"></asp:TextBox>
                            </td>
                            <td class="Table1">廠商名稱</td>
                            <td class="Table2" colspan="4">
                                <asp:TextBox ID="TextBox19" runat="server" CssClass="TB500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">標的名稱及數量摘要</td>
                            <td class="Table2" colspan="4">
                                <asp:TextBox ID="TextBox20" runat="server" CssClass="TB500"></asp:TextBox>
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
                                <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle"></asp:TextBox>
                            </td>
                            <td class="Table1">完成履約日期</td>
                            <td class="Table2" colspan="2">
                                <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle" AutoPostBack="True" OnTextChanged="TextBox22_TextChanged"></asp:TextBox>
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
                                <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle" dir="rtl"></asp:TextBox>
                            </td>
                            <td class="Table1">契約變更或加減價次數</td>
                            <td class="Table2" colspan="4">
                                <asp:TextBox ID="TextBox24" runat="server" CssClass="TBshort"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">驗收經過</td>
                            <td class="Table2" colspan="9">
                                <asp:TextBox ID="TextBox25" runat="server" CssClass="TB500" Height="154px" TextMode="MultiLine" Width="640px"></asp:TextBox>
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
    </div>
</asp:Content>
