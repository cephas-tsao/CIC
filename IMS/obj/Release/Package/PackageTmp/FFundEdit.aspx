<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FFundEdit.aspx.cs" Inherits="IMS.FFundEdit" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/FirmFundMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商計價增修</title>
    <style type="text/css">
        .auto-style92 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 82px;
        }
    </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />  
        <div >
        <table class="Table100">
            <tr>
                <td colspan="3" class="TableTop">分包商計價增修</td>
            </tr>
            <tr>
                <td class="Table1">請選擇分包契約</td>
                <td class="Table2">
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server" AutoPostBack="True" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="SC_Name" DataValueField="SCID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM SubContract_Main WHERE PID=@PID">
                        <SelectParameters>
                            <asp:SessionParameter Name="PID" SessionField="PID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="Table1" width="50%"></td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server" Visible="False">   
        <table class="Table100">
            <tr>
                <td class="Table0">計價總覽</td>
                <td class="Table0R" width="20%">
                    <asp:Button ID="Button15" runat="server" CssClass="BtnFree" Text="新增計價單" OnClick="Button15_Click" />
                </td>
            </tr>
        </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="FFID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" AllowPaging="True" EmptyDataText="搜尋結果尚無資料">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CommandName="Select" CssClass="BtnFree" Text="編輯" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FFID" HeaderText="FFID" InsertVisible="False" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="FFID" Visible="False">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FF_Edition" HeaderText="計價期別" ItemStyle-HorizontalAlign="Center" SortExpression="FF_Edition" />
                    <asp:BoundField DataField="FF_Code" HeaderText="計價單號" ItemStyle-HorizontalAlign="Center" SortExpression="FF_Code" />
                    <asp:BoundField DataField="StartDate" HeaderText="估驗起始日期" ItemStyle-HorizontalAlign="Center" SortExpression="StartDate" DataFormatString="{0:d}" HtmlEncode="False" />
                    <asp:BoundField DataField="EndDate" HeaderText="估驗截止日期" ItemStyle-HorizontalAlign="Center" SortExpression="EndDate" DataFormatString="{0:d}" HtmlEncode="False" />
                    <asp:BoundField DataField="FundDate" HeaderText="計價日期" ItemStyle-HorizontalAlign="Center" SortExpression="FundDate" DataFormatString="{0:d}" HtmlEncode="False" />
                    <asp:BoundField DataField="PayDate" HeaderText="付款日期" ItemStyle-HorizontalAlign="Center" SortExpression="PayDate" DataFormatString="{0:d}" HtmlEncode="False" />
                    <asp:BoundField DataField="Item12" HeaderText="實付金額" ItemStyle-HorizontalAlign="Center" SortExpression="Item12" />
                    <asp:BoundField DataField="Note" HeaderText="備註說明" ItemStyle-HorizontalAlign="Center" SortExpression="Note" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select * From FFund_Main Where PID=@PID and SCID=@SCID">
                <SelectParameters>
                    <asp:SessionParameter Name="PID" SessionField="PID" />
                    <asp:SessionParameter Name="SCID" SessionField="SCID" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:Panel ID="Pnl_2" runat="server" Visible="False">    
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="5">編輯計價明細</td>
                <td class="Table0R">
                    <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImageButton131_Click" />
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImageButton132_Click" />
                    &nbsp; </td>
            </tr>
            <tr>
                <td class="Table1">計價單號</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle" ></asp:TextBox>
                </td>
                <td class="Table1">計價期別</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBshort" Enabled="False" ></asp:TextBox>
                </td>
                <td class="Table1" rowspan="3">備註說明</td>
                <td class="Table2LC" rowspan="3">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TBfree" Height="75px" TextMode="MultiLine" Width="220px"></asp:TextBox>
                </td>
            </tr>

                    <tr>
                        <td class="Table1">估驗起算日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                        </td>
                        <td class="Table1">估驗截止日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">計價日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                        </td>
                        <td class="Table1">付款日期</td>
                        <td class="Table2">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="Table1">分包合約金額(變更後)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">稅金</td>
                        <td class="Table2R">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">總額</td>
                        <td class="Table2R">
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="Table1">預付款</td>
                        <td class="Table2R">
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">保留款</td>
                        <td class="Table2R">
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                        </td>
                        <td class="Table1">付款方式</td>
                        <td class="Table2R">
                            <asp:Label ID="Label6" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="Table100">
                    <tr>
                        <td class="Table1">項次</td>
                        <td class="Table1">項目</td>
                        <td class="Table1">前期累計</td>
                        <td class="Table1">本期計價</td>
                        <td class="Table1">至本期累計</td>
                        <td class="Table1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">1</td>
                        <td class="Table2">估驗金額</td>
                        <td class="Table2R">
                            <asp:Label ID="Label7" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle" Enabled="False" style="text-align:right"></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label19" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:Button ID="Button4" runat="server" CssClass="BtnFree" Text="估驗明細" OnClick="Button4_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">2</td>
                        <td class="Table2">預付款(+)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label8" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox20" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label20" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">3</td>
                        <td class="Table2">扣回預付款(-)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label9" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox21" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label21" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C"></td>
                    </tr>
                    <tr>
                        <td class="Table2C">4</td>
                        <td class="Table2">應付金額</td>
                        <td class="Table2R">
                            <asp:Label ID="Label10" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox22" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label22" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">5</td>
                        <td class="Table2">營業稅</td>
                        <td class="Table2R">
                            <asp:Label ID="Label11" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox23" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label23" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">應付金額*<asp:TextBox ID="TextBox36" runat="server" CssClass="TBshort" dir="rtl" Width="25px">5</asp:TextBox>
                            ％</td>
                    </tr>
                    <tr>
                        <td class="Table2C">6</td>
                        <td class="Table2">保留款(-)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label12" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox24" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label24" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">7</td>
                        <td class="Table2">扣款/罰款(-)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label13" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox25" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label25" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:Button ID="Button10" runat="server" CssClass="BtnFree" Text="扣款指定" OnClick="Button10_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">8</td>
                        <td class="Table2">加款(+)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label14" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox26" runat="server" CssClass="TBmiddle" style="text-align:right" Enabled="False" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label26" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:Button ID="Button11" runat="server" CssClass="BtnFree" Text="加款指定" OnClick="Button11_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Table2C">9</td>
                        <td class="Table2">退還保留款(+)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label15" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox27" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label27" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">10</td>
                        <td class="Table2">物價指數補貼(+)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label16" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox28" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label28" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">11</td>
                        <td class="Table2">工程保險費(+)</td>
                        <td class="Table2R">
                            <asp:Label ID="Label17" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox29" runat="server" CssClass="TBmiddle" style="text-align:right" ></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label29" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table2C">12</td>
                        <td class="Table2">實付金額</td>
                        <td class="Table2R">
                            <asp:Label ID="Label18" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">
                            <asp:TextBox ID="TextBox30" runat="server" CssClass="TBmiddle" Enabled="False" style="text-align:right"></asp:TextBox>
                        </td>
                        <td class="Table2R">
                            <asp:Label ID="Label30" runat="server"></asp:Label>
                        </td>
                        <td class="Table2C">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="Table1" colspan="6">
                            <asp:Button ID="Button12" runat="server" CssClass="BtnLargeShort" Text="自動計算" OnClick="Button12_Click" />
                            &nbsp;
                            <asp:Button ID="Button13" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="Button13_Click" />
                            &nbsp;
                            <asp:Button ID="Button14" runat="server" CssClass="BtnLargeMedium" Text="自動計算並儲存" OnClick="Button14_Click" />
                            &nbsp;
                            <asp:Button ID="Button16" runat="server" CssClass="BtnLargeMedium" Text="刪除計價單" OnClick="Button16_Click" OnClientClick="return confirm('確定要刪除此筆資料嗎?');"/>
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
        </asp:Panel>
        </asp:Panel>
        </div>
    </div>
</asp:Content>
