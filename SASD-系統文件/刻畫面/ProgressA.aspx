<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProgressA.aspx.cs" Inherits="ProgressA" %>

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
			<td class="TableTop">實際進度計算</td>
		</tr>
       
		<tr>
		<td class="Table1L">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_Draw" runat="server" Height="30px" ImageUrl="~/img/Draw.jpg" ToolTip="繪製桿狀圖" Width="27px" OnClick="IBtn_Draw_Click" />
                                </td>
		</tr>
       
		<tr>
		<td class="Table0">
                                    實際進度版本列表</td>
		</tr>
       
		<tr>
		<td class="Table2C">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5" Width="100%">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/img/Q1.png" OnClick="ImageButton1_Click" Width="30px" ToolTip="查看內容" />
                                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" ImageUrl="~/img/Edit.png" Width="30px" ToolTip="編輯版次資訊" />
                                                    <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" ImageUrl="~/img/Delete.png" Width="30px" ToolTip="刪除版次" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                            <asp:BoundField DataField="Version" HeaderText="版本" SortExpression="Version" />
                                            <asp:BoundField DataField="TotalPrice" HeaderText="合計已施作金額" SortExpression="TotalPrice" />
                                            <asp:BoundField DataField="LastDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="最後紀錄日期" SortExpression="LastDate" />
                                            <asp:BoundField DataField="Note" HeaderText="版本敘述" SortExpression="Note" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT * FROM [Progress_RVersion]"></asp:SqlDataSource>
                                </td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_Main" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="10">第<asp:Label ID="LB_Version" runat="server" Font-Bold="True" ForeColor="Yellow" Text="5" Visible="False"></asp:Label>
                        版實際進度</td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">重新載入日報資訊</td>
                    <td class="TableTop2" colspan="6">實際進度計算</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button ID="Btn_DailyReload" runat="server" CssClass="BtnFree" Text="載入日報資訊並更新至第5版" ToolTip="警告：重新載入日報資訊將會清空實際施作項目清單" />
                    </td>
                    <td class="Table1" rowspan="2">
                        <asp:Label ID="Label2" runat="server" Text="輸入日期"></asp:Label>
                    </td>
                    <td class="Table2CC" rowspan="2">
                        <asp:TextBox ID="TB_Date" runat="server" CssClass="TBmiddle">2016/8/26</asp:TextBox>
                    </td>
                    <td class="Table1" colspan="2" rowspan="2">
                        <asp:Button ID="Btn_Cal" runat="server" CssClass="BtnFree" OnClick="Button3_Click" Text="計算進度" />
                    </td>
                    <td class="Table1" colspan="2" rowspan="2">
                        <asp:Label ID="LB_Cal01" runat="server" Text="實際進度：" Visible="False"></asp:Label>
                        <asp:Label ID="LB_CalAns" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                        <asp:Label ID="LB_Cal02" runat="server" Text="％" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button ID="Btn_DailyReloadNew" runat="server" CssClass="BtnFree" Text="載入日報資訊並另存至第6版" />
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="10">新增施作項目</td>
                </tr>
                <tr>
                    <td class="Table1" rowspan="2">施作項目</td>
                    <td class="Table2CC" rowspan="2">
                        <asp:DropDownList ID="DDL_Activity" runat="server" AppendDataBoundItems="True" CssClass="DDLlong" DataSourceID="SqlDataSource3" DataTextField="WIName" DataValueField="WIID">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT [WIName], [WIID] FROM [Progress_WIINF] WHERE ([ProjectID] = @ProjectID)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="11" Name="ProjectID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1" rowspan="2">施作日期</td>
                    <td class="Table2CC" colspan="2" rowspan="2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1" colspan="2" rowspan="2">完成百分比</td>
                    <td class="Table2CC" colspan="2" rowspan="2">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TBshort"></asp:TextBox>
                        ％</td>
                    <td class="Table1">
                        <asp:Button ID="Btn_Insert" runat="server" CssClass="BtnFree" Text="新增至第5版" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1">
                        <asp:Button ID="Btn_InsertNew" runat="server" CssClass="BtnFree" Text="另存至第6版" />
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="10">實際施作項目清單</td>
                </tr>
            </table>
            <table class="Table100">
                <tr>
                    <td class="Table2CC">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="RealProgID" DataSourceID="SqlDataSource2" PageSize="50" Width="100%">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="編輯施作項目" Width="30px" />
                                        <asp:ImageButton ID="ImageButton3" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除施作項目" Width="30px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RealProgID" HeaderText="RealProgID" InsertVisible="False" ReadOnly="True" SortExpression="RealProgID" Visible="False" />
                                <asp:BoundField DataField="ProgressID" HeaderText="ProgressID" SortExpression="ProgressID" Visible="False" />
                                <asp:BoundField DataField="WIName" HeaderText="作業項目名稱" SortExpression="WIName" />
                                <asp:BoundField DataField="WorkDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="施作日期" SortExpression="WorkDate" />
                                <asp:BoundField DataField="CompleteAmount" HeaderText="完成百分比(%)" SortExpression="CompleteAmount" />
                                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" Visible="False" />
                                <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" SortExpression="ProjectID" Visible="False" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT Progress_Real.RealProgID, Progress_Real.ProgressID, Progress_Real.WorkDate, Progress_Real.CompleteAmount, Progress_Real.Version, Progress_Real.ProjectID, Progress_WIINF.WIName FROM Progress_Real INNER JOIN Progress_WIINF ON Progress_Real.ProgressID = Progress_WIINF.ProgressID WHERE (Progress_Real.Version = @Version) ORDER BY Progress_Real.WorkDate DESC">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Version" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    
    
    </div>
    </form>
</body>
</html>
