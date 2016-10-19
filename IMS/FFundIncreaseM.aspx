<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FFundIncreaseM.aspx.cs" Inherits="IMS.FFundIncreaseM" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/FirmFundMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商加款管理</title>
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />
        <div>   
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="3">分包商加款管理</td>
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
                <td class="Table1" width="50%">
                                    &nbsp;</td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_1" runat="server" Visible="False">
        
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">新增加款紀錄</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_Insert" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">加款事由</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Subject" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">加款類型</td>
                    <td class="Table2" colspan="2">
                        <asp:DropDownList ID="DDL_Style" runat="server" CssClass="DDLshort">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>獎金</asp:ListItem>
                            <asp:ListItem>津貼</asp:ListItem>
                            <asp:ListItem>應加金額</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">發生日期</td>
                    <td class="Table2" colspan="2">
                        <asp:TextBox ID="TB_Date" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">加款金額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Price" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">稅金</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_Tax" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">
                        <asp:Button ID="Button4" runat="server" CssClass="BtnFree" OnClick="Button4_Click" Text="5%自動計算" />
                    </td>
                    <td class="Table1">加款總額</td>
                    <td class="Table2">
                        <asp:TextBox ID="TB_SumPrice" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">
                        <asp:Button ID="Button5" runat="server" CssClass="BtnFree" OnClick="Button5_Click" Text="自動合計" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="8">
                        <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="確定新增" OnClick="Button2_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click">加款紀錄總覽</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_View" runat="server">
            <table class="Table100">
                <tr>
                    <td class="Table2C">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"  DataKeyNames="FF_MID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CssClass="BtnFree" Text="編輯/刪除" CommandName="Select" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"BelongFFID"))==0)? true:false %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:BoundField DataField="FF_MID" HeaderText="FF_MID" InsertVisible="False" ReadOnly="True" SortExpression="FF_MID" Visible="False" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Type" HeaderText="加款類型" SortExpression="FFund_Debit.Type" />
                                <asp:BoundField DataField="Subject" HeaderText="加款事由" SortExpression="FFund_Debit.Subject" />
                                <asp:BoundField DataField="Date" HeaderText="發生日期" SortExpression="FFund_Debit.Date" DataFormatString="{0:d}" HtmlEncode="False" />
                                <asp:BoundField DataField="SumPrice" HeaderText="加款總額" SortExpression="FFund_Debit.SumPrice" />
                                <asp:BoundField DataField="Recorder" HeaderText="記錄人員" SortExpression="FFund_Debit.Recorder" />
                                <asp:BoundField DataField="FF_Code" HeaderText="計價單號" SortExpression="FFund_Main.FF_Code" />
                                <asp:BoundField DataField="FF_Edition" HeaderText="計價期別" SortExpression="FFund_Main.FF_Edition" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select * From FFund_Modify LEFT OUTER JOIN FFund_Main ON FFund_Modify.BelongFFID = FFund_Main.FFID WHERE FFund_Modify.SCID = @SCID and FFund_Modify.IncreaseDebit = 'I'">
                            <SelectParameters>
                                <asp:SessionParameter Name="SCID" SessionField="SCID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="Table2R">註：已計價之加款紀錄無法編輯或刪除</td>
                </tr>
                <tr>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Update" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table0" colspan="8">
                                        <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White">編輯加款紀錄</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">加款事由</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Subject0" runat="server" CssClass="TB500"></asp:TextBox>
                                    </td>
                                    <td class="Table1">加款類型</td>
                                    <td class="Table2" colspan="2">
                                        <asp:DropDownList ID="DDL_Style0" runat="server" CssClass="DDLshort">
                                            <asp:ListItem Selected="True" Value="0">-請選擇-</asp:ListItem>
                                            <asp:ListItem>代支代付</asp:ListItem>
                                            <asp:ListItem>獎金</asp:ListItem>
                                            <asp:ListItem>津貼</asp:ListItem>
                                            <asp:ListItem>應加金額</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="Table1">發生日期</td>
                                    <td class="Table2" colspan="2">
                                        <asp:TextBox ID="TB_Date0" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">加款金額</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Price0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                    </td>
                                    <td class="Table1">稅金</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_Tax0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                    </td>
                                    <td class="Table2">
                                        <asp:Button ID="Button6" runat="server" CssClass="BtnFree" OnClick="Button6_Click" Text="5%自動計算" />
                                    </td>
                                    <td class="Table1">加款總額</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TB_SumPrice0" runat="server" CssClass="TBmiddle"></asp:TextBox>
                                    </td>
                                    <td class="Table2">
                                        <asp:Button ID="Button7" runat="server" CssClass="BtnFree" OnClick="Button7_Click" Text="自動合計" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1" colspan="8">
                                        <asp:Button ID="Button8" runat="server" CssClass="BtnLargeShort" Text="確定修改" OnClick="Button8_Click" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="Button9" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="Button9_Click" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="Button10" runat="server" CssClass="BtnLargeShort" Text="刪除紀錄" OnClick="Button10_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
    </div> 
    </div>
</asp:Content>

