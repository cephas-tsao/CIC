<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DailyWorkPicView.aspx.cs" Inherits="IMS.DailyWorkPicView" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/DailyMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>施工照片總覽</title>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    </div>
        <div >   
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
                    <td class="Table1">拍照日期</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                        ～<asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle" Height="25px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
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
                    <td class="Table1">照片標題</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">照片地點</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">照片類型</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList7" runat="server" CssClass="DDLshort" Height="32px" Width="155px" DataSourceID="SqlDataSource3" DataTextField="WP_Type" DataValueField="WP_Type" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT * FROM [WorkPicType]">
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">照片期別</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList8" runat="server" CssClass="DDLshort" Height="32px" Width="155px">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                            <asp:ListItem>施工前</asp:ListItem>
                            <asp:ListItem>施工中</asp:ListItem>
                            <asp:ListItem>施工後</asp:ListItem>
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
                    <td class="Table1">合約項目</td>
                    <td class="Table2">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        <asp:Button ID="Button23" runat="server" CssClass="BtnLargeMedium" Text="選擇連結工項" OnClick="Button23_Click" Height="32px" />
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">分包契約</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DropDownList9" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="DDLlong" Height="32px" Width="330px" DataSourceID="SqlDataSource1" DataTextField="SC_Name" DataValueField="SCID">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM SubContract_Main WHERE PID=@PID">
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="32px">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">摘要說明</td>
                    <td class="Table2" colspan="2">
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle" Height="25px" Width="150px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table1" colspan="3">
                        <asp:Button ID="Button34" runat="server" CssClass="BtnLargeMedium" OnClick="Button34_Click" Text="確定搜尋" Height="32px" />
                        &nbsp;
                        <asp:Button ID="Button35" runat="server" CssClass="BtnLargeMedium" Text="清除條件" OnClick="Button35_Click" Height="32px" />
                        &nbsp;
                        <asp:Button ID="Button36" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" OnClick="Button36_Click" Height="32px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
        <br />
        <asp:Panel ID="Pnl_Result" runat="server" Visible="False">
        
        <table class="Table100">
            <tr>
                <td class="TableTop"  colspan="3">
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
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="UID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowdatabound="GridView1_RowDataBound" EmptyDataText="搜尋結果尚無資料">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button40" runat="server" CommandName="Select" CssClass="BtnFree" Enabled="true" Text="檢視" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UID" HeaderText="UID" SortExpression="UID" Visible="false" />
                                <asp:BoundField DataField="PicTitle" HeaderText="照片標題" SortExpression="PicTitle" />
                                <asp:BoundField DataField="PicLocation" HeaderText="照片地點" SortExpression="PicLocation" />
                                <asp:BoundField DataField="PicDate" HeaderText="拍照日期" SortExpression="PicDate" DataFormatString="{0:d}" HtmlEncode="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT * FROM [Daily_WorkPic]"></asp:SqlDataSource>
                    </td>
                    <td class="Table2C">
                        <asp:Panel ID="Pnl_Pic" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table1">照片標題</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">拍照日期</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片地點</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片類型</td>
                                    <td class="Table2CCC">
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">照片期別</td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">合約項目連結</td>
                                    <td class="Table2CCC" colspan="3">
                                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td class="Table1">分包契約連結</td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">摘要說明</td>
                                    <td class="Table2" colspan="5">
                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">照片顯示</td>
                                    <td class="Table2CC" colspan="5">
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal> 
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
        <br />   
    </div>
</asp:Content>
