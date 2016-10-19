<%@ Page Language="C#" AutoEventWireup="true" CodeFile="日報4.aspx.cs" Inherits="日報4" %>

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
                <td class="TableTop">施工照片總覽</td>
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
                    <td class="Table1">日報日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">拍照日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
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
                    <td class="Table1">照片標題</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">照片地點</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">照片類型</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList7" runat="server" CssClass="DDLshort">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem>進度作業照片</asp:ListItem>
                            <asp:ListItem>工安及重大事故照片</asp:ListItem>
                            <asp:ListItem>長官視察</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">照片期別</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList8" runat="server" CssClass="DDLshort">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem>施工前</asp:ListItem>
                            <asp:ListItem>施工中</asp:ListItem>
                            <asp:ListItem>施工後</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">合約項目</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <asp:Button ID="Button23" runat="server" CssClass="BtnLargeMedium" Text="選擇連結工項" OnClick="Button23_Click" />
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">分包契約</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList9" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="SC_Name" DataValueField="SC_Name">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NTUSTConnectionString %>" SelectCommand="SELECT [SC_Name], [SC_Code] FROM [SubContract_Main]"></asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">摘要說明</td>
                    <td class="Table2" colspan="2">
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table1" colspan="3">
                        <asp:Button ID="Button34" runat="server" CssClass="BtnLargeMedium" OnClick="Button34_Click" Text="確定搜尋" />
                        &nbsp;
                        <asp:Button ID="Button35" runat="server" CssClass="BtnLargeMedium" Text="清除條件" />
                        &nbsp;
                        <asp:Button ID="Button36" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" />
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
                    <asp:ImageButton ID="ImageButton133" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出PDF檔" Width="27px" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton134" runat="server" Height="30px" ImageUrl="~/img/PowerPoint_2013.png" ToolTip="匯出PDF檔" Width="27px" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                </td>
            </tr>
        </table>
            <table class="Table100">
                <tr>
                    <td class="Table2C">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="檢視">
                                    <ItemTemplate>
                                        <asp:Button ID="Button33" runat="server" CssClass="BtnFree" OnClick="Button33_Click" Text="檢視" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                <asp:BoundField DataField="DailyID" HeaderText="DailyID" SortExpression="DailyID" Visible="False" />
                                <asp:BoundField DataField="PicTitle" HeaderText="照片標題" SortExpression="PicTitle" />
                                <asp:BoundField DataField="PicLocation" HeaderText="照片地點" SortExpression="PicLocation" />
                                <asp:BoundField DataField="PicDate" HeaderText="拍照日期" SortExpression="PicDate" />
                                <asp:BoundField DataField="PicType" HeaderText="照片類型" SortExpression="PicType" />
                                <asp:BoundField DataField="PicPeriod" HeaderText="照片期別" SortExpression="PicPeriod" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [Daily_WorkPic]"></asp:SqlDataSource>
                    </td>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Pic" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">照片標題</td>
                                    <td class="Table2CCC" colspan="3">襯砌澆灌1</td>
                                    <td class="Table1">拍照日期</td>
                                    <td>2015/09/30</td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片地點</td>
                                    <td class="Table2CCC">隧道中段</td>
                                    <td class="Table1">照片類型</td>
                                    <td class="Table2CCC">進度及作業照片</td>
                                    <td class="Table1">照片期別</td>
                                    <td>施工中</td>
                                </tr>
                                <tr>
                                    <td class="Table1">合約項目連結</td>
                                    <td class="Table2CCC" colspan="3">280kgf/cm2混凝土</td>
                                    <td class="Table1">分包契約連結</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td class="Table1">摘要說明</td>
                                    <td class="Table2" colspan="5">0K+100~0K+106第四模</td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片顯示</td>
                                    <td class="Table2CC" colspan="5">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/DSC_2020.JPG" Width="500px" />
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
    </form>
</body>
</html>
