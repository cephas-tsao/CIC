<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OFundView.aspx.cs" Inherits="IMS.OFundView" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/OFundModel.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>業主請款檢視</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />
        <div > 
        <table class="Table100">
            <tr>
                <td class="TableTop">業主請款檢視</td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="9">請款總覽</td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_1" runat="server" Visible="True"> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"  DataKeyNames="OFID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" AllowPaging="True" EmptyDataText="搜尋結果尚無資料">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandName="Select" CssClass="BtnFree" Text="明細"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OFID" HeaderText="OFID" InsertVisible="False" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="OFID" Visible="False">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OF_Edition" HeaderText="請款期別" ItemStyle-HorizontalAlign="Center" SortExpression="OF_Edition">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OF_Code" HeaderText="請款單號" ItemStyle-HorizontalAlign="Center" SortExpression="OF_Code">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="估驗起始日期" HtmlEncode="False" ItemStyle-HorizontalAlign="Center" SortExpression="StartDate">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EndDate" DataFormatString="{0:d}" HeaderText="估驗截止日期" HtmlEncode="False" ItemStyle-HorizontalAlign="Center" SortExpression="EndDate">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FundDate" DataFormatString="{0:d}" HeaderText="請款日期" HtmlEncode="False" ItemStyle-HorizontalAlign="Center" SortExpression="FundDate">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PayDate" DataFormatString="{0:d}" HeaderText="領款日期" HtmlEncode="False" ItemStyle-HorizontalAlign="Center" SortExpression="PayDate">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AItem14" HeaderText="實付金額" ItemStyle-HorizontalAlign="Center" SortExpression="AItem14">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Note" HeaderText="備註說明" ItemStyle-HorizontalAlign="Center" SortExpression="Note">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select * From OFund_Main Where PID= @PID">
                <SelectParameters>
                    <asp:SessionParameter Name="PID" SessionField="PID" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:Panel ID="Pnl_2" runat="server" Visible="False">          
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="5">請款明細</td>
                <td class="Table0R">
                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImageButton131_Click" />
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton132_Click" />
                </td>
            </tr>
            <tr>
                <td class="Table1">請款單號</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                </td>
                <td class="Table1">請款期別</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" ></asp:TextBox>
                </td>
                <td class="Table1" rowspan="3">備註說明</td>
                <td class="Table2LC" rowspan="3">
                    <asp:TextBox ID="TextBox32" runat="server" CssClass="TBfree" Height="75px" TextMode="MultiLine" Width="220px"></asp:TextBox>
                </td>
            </tr>
       
                    <tr>
                        <td class="Table1">請款起算日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                        </td>
                        <td class="Table1">請款截止日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">請款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                        </td>
                        <td class="Table1">領款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                        </td>
                    </tr>
            
                    <tr>
                        <td class="Table1">原合約總價</td>
                        <td class="Table2R">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">末次變更版次</td>
                        <td class="Table2R">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">末次變更後合約總價</td>
                        <td class="Table2R">
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">履約保證金</td>
                        <td class="Table2R">
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">預付款百分比</td>
                        <td class="Table2R">
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">保留款百分比</td>
                        <td class="Table2R">
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="Table100">
                    <tr>
                        <td class="Table1" rowspan="2">項次</td>
                        <td class="Table1" rowspan="2">項目</td>
                        <td class="Table1" rowspan="2">前期累計(核撥)</td>
                        <td class="Table1" colspan="2">本期</td>
                        <td class="Table1" rowspan="2">至本期累計(核撥)</td>
                        <td class="Table1" rowspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table1">
                            請款</td>
                        <td class="Table1">核撥</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">1</td>
                        <td class="Table2">估驗金額</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label7" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox37" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label21" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:Button ID="Button4" runat="server" CssClass="BtnFree" OnClick="Button4_Click" Text="估驗明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">2</td>
                        <td class="Table2">預付款(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label8" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox38" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label22" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">3</td>
                        <td class="Table2">扣回預付款(-)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label9" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox39" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label23" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC"></td>
                    </tr>
                    <tr>
                        <td class="Table2CC">4</td>
                        <td class="Table2">到場材料(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label10" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox33" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox40" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label24" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">5</td>
                        <td class="Table2">扣除已請材料(-)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label11" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox41" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label25" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">6</td>
                        <td class="Table2LC">應請金額</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label12" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox34" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox42" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label26" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">7</td>
                        <td class="Table2">營業稅</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label13" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox35" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox43" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label27" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">應請金額*<asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort" dir="rtl" Width="25px">5</asp:TextBox>
                            ％</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">8</td>
                        <td class="Table2">保留款(-)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label14" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox44" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label28" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC"></td>
                    </tr>
                    <tr>
                        <td class="Table2CC">9</td>
                        <td class="Table2">扣款/罰款(-)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label15" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox45" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label29" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:Button ID="Button10" runat="server" CssClass="BtnFree" OnClick="Button10_Click" Text="扣款明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">10</td>
                        <td class="Table2">加款(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label16" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox46" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label30" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:Button ID="Button11" runat="server" CssClass="BtnFree" OnClick="Button11_Click" Text="加款明細" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2CC">11</td>
                        <td class="Table2">退還保留款(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label17" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox47" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label31" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">12</td>
                        <td class="Table2">物價指數補貼(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label18" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox48" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label32" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">13</td>
                        <td class="Table2">工程保險費(+)</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label19" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox49" runat="server" CssClass="TBmiddle" style="text-align:right"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label33" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2CC">14</td>
                        <td class="Table2">實請金額</td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label20" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="Table2CC">
                            <asp:TextBox ID="TextBox50" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False"></asp:TextBox>
                        </td>
                        <td style="font-family:微軟正黑體;font-size:medium;background-color:#ECF5FF;text-align:right;color:#000000;vertical-align:central;">
                            <asp:Label ID="Label34" runat="server"></asp:Label>
                        </td>
                        <td class="Table2CC">&nbsp;</td>
                    </tr>
                </table>
        </asp:Panel>

        </asp:Panel>
        </div>
    </div>
</asp:Content>

