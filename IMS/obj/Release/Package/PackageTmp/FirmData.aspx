<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirmData.aspx.cs" Inherits="IMS.FirmData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .Table100 {
	        width:100%;
        }
        .Table0 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #666699;
            text-align: left;
            color: #FFFFFF;
            height: 30px;
        }
        .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .Table2LC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align:central;
        }
        .TableLeftColumn {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #0000FF;
            text-align: center;
            color: #FFFFFF;
            }
        .Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align:top;
        }
        .Table2CC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align:central;
        }
        .BtnFree {
            font-size:medium;
            font-family:微軟正黑體;
            height:30px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Pnl_View" runat="server">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="8">
                        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">分包商基本資料</asp:LinkButton>
                    </td>
                </tr>
            <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbFirmName" runat="server" ></asp:Label></td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbType" runat="server" ></asp:Label></td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbSupportItem" runat="server"></asp:Label></td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbNo" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbName" runat="server" ></asp:Label></td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbRphone" runat="server"></asp:Label></td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbCapital" runat="server" ></asp:Label>(萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbStaff" runat="server" ></asp:Label>(人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbPhone1" runat="server" ></asp:Label>
                        </td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbPhone2" runat="server" ></asp:Label></td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbFax1" runat="server" ></asp:Label></td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbFax2" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbCounty" runat="server" ></asp:Label></td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbEmail" runat="server" ></asp:Label></td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:Label ID="LbAddress" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        <asp:Label ID="LbNotes" runat="server" ></asp:Label></td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:Label ID="LbCAddress" runat="server" ></asp:Label></td>
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
                    <td class="Table2">
                        <asp:Label ID="LbItem1" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote1" runat="server" ></asp:Label></td>
                    <td class="Table1">員工數</td>
                    <td class="Table2">
                        <asp:Label ID="LbItem2" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote2" runat="server" ></asp:Label></td>
                    <td class="Table1">專業能力</td>
                    <td class="Table2">
                        <asp:Label ID="LbItem3" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote3" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">設備</td>
                    <td class="Table2">
                        <asp:Label ID="LbItem4" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote4" runat="server" ></asp:Label></td>
                    <td class="Table1">品管措施</td>
                    <td class="Table2">
                        <asp:Label ID="LbItem5" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote5" runat="server" ></asp:Label></td>
                    <td class="Table1">報價</td>
                    <td class="Table2">
                        <asp:Label ID="LbItem6" runat="server" ></asp:Label></td>
                    <td class="Table2">
                        <asp:Label ID="LbItemNote6" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">總分</td>
                    <td class="Table2">
                        <asp:Label ID="LbTotalScore" runat="server" ></asp:Label>分</td>
                    <td class="Table2">
                        <asp:Label ID="LbFirstResult" runat="server" ></asp:Label></td>
                    <td class="Table1">初評人</td>
                    <td class="Table2">
                        <asp:Label ID="LbFirstRater" runat="server" ></asp:Label></td>
                    <td class="Table2">(日期：<asp:Label ID="LbFirstDate" runat="server" ></asp:Label>)</td>
                    <td class="Table1">初評說明</td>
                    <td class="Table2" colspan="2">
                        <asp:Label ID="LbFirstNote" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="TableLeftColumn">複<br /> 評</td>
                    <td class="Table1">結果</td>
                    <td class="Table2LC" colspan="2">
                        <asp:Label ID="LbSecondResult" runat="server" ></asp:Label></td>
                    <td class="Table1">複評人</td>
                    <td class="Table2LC">
                        <asp:Label ID="LbSecondRater" runat="server" ></asp:Label></td>
                    <td class="Table2LC">(日期：<asp:Label ID="LbSecondDate" runat="server" ></asp:Label>)</td>
                    <td class="Table1">複評說明</td>
                    <td class="Table2LC" colspan="2">
                        <asp:Label ID="LbSecondNote" runat="server" ></asp:Label></td>
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
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                            OnRowCommand="GridView5_RowCommand" OnRowDataBound="GridView5_RowDataBound" Width="100%">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                  <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="SCID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SCID") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="專案編號" HeaderText="專案編號" SortExpression="專案編號" />
                                <asp:BoundField DataField="專案名稱" HeaderText="專案名稱" SortExpression="專案名稱" />
                                <asp:BoundField DataField="專案狀態" HeaderText="專案狀態" SortExpression="專案狀態" />
                                <asp:BoundField DataField="分包合約編號" HeaderText="分包合約編號" SortExpression="分包合約編號" />
                                <asp:BoundField DataField="分包合約名稱" HeaderText="分包合約名稱" SortExpression="分包合約名稱" />
                               <%-- <asp:BoundField DataField="分包合約總金額" HeaderText="分包合約總金額" SortExpression="分包合約總金額" />
                                <asp:BoundField DataField="末次追加減後總金額" HeaderText="末次追加減後總金額" SortExpression="末次追加減後總金額" />--%>
                                    <asp:TemplateField HeaderText="分包合約總金額">
                                    <ItemTemplate>
                                        <asp:Label ID="分包合約總金額" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "分包合約總金額") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="末次追加減後總金額">
                                    <ItemTemplate>
                                        <asp:Label ID="末次追加減後總金額" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "末次追加減後總金額") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="分包合約種類" HeaderText="分包合約種類" SortExpression="分包合約種類" />
                                <asp:BoundField DataField="已計價次數" HeaderText="已計價次數" SortExpression="已計價次數" ReadOnly="True" />
                               <asp:TemplateField HeaderText="已計價金額">
                                    <ItemTemplate>
                                        <asp:Label ID="已計價金額" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "已計價金額") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="考核結果">
                                    <ItemTemplate>
                                        初評：<asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstResult") %>'></asp:Label>
                                        複評：<asp:Label ID="Label2" runat="server" Text='<%# Bind("SecondResult") %>'></asp:Label>
                                        <asp:Button ID="Button38" runat="server" CssClass="BtnFree"  Text="考核內容" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>'/>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  >
                       <%--     <SelectParameters>
                                <asp:SessionParameter Name="FirmID" SessionField="FirmID" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Pnl_Ckeck" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table0" colspan="10">分包合約考核結果</td>
                                </tr>
                               <tr>
                                    <td class="TableLeftColumn" rowspan="3">初<br /> 評</td>
                                    <td class="Table1">施工品質</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem1" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote1" runat="server" ></asp:Label></td>
                                    <td class="Table1">進度控制</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem2" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote2" runat="server" ></asp:Label></td>
                                    <td class="Table1">配合度</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem3" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote3" runat="server" ></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="Table1">工地清潔</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem4" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote4" runat="server" ></asp:Label></td>
                                    <td class="Table1">勞工安全</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem5" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote5" runat="server" ></asp:Label></td>
                                    <td class="Table1">材料愛惜</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItem6" runat="server" ></asp:Label></td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAItemNote6" runat="server" ></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="Table1">總分</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbATotalScore" runat="server" ></asp:Label>分</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAFirstResult" runat="server" ></asp:Label></td>
                                    <td class="Table1">初評人</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAFirstRater" runat="server" ></asp:Label></td>
                                    <td class="Table2">(日期：<asp:Label ID="LbAFirstDate" runat="server" ></asp:Label>)</td>
                                    <td class="Table1">初評說明</td>
                                    <td class="Table2" colspan="2">
                                        <asp:Label ID="LbAFirstNote" runat="server" ></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TableLeftColumn">複<br /> 評</td>
                                    <td class="Table1">結果</td>
                                    <td class="Table2LC" colspan="2">
                                        <asp:Label ID="LbASecondResult" runat="server" ></asp:Label></td>
                                    <td class="Table1">複評人</td>
                                    <td class="Table2LC">
                                        <asp:Label ID="LbASecondRater" runat="server" ></asp:Label></td>
                                    <td class="Table2LC">(日期：<asp:Label ID="LbASecondDate" runat="server" ></asp:Label>)</td>
                                    <td class="Table1">複評說明</td>
                                    <td class="Table2LC" colspan="2">
                                        <asp:Label ID="LbASecondNote" runat="server" ></asp:Label></td>
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
