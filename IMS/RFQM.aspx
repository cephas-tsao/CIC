<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="RFQM.aspx.cs" Inherits="IMS.RFQM" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-投標預算單價填列</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">

/*.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}*/
.TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
.TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}

            .auto-style1 {
	            font-family: 微軟正黑體;
	            font-size: large;
	            background-color: #800000;
	            text-align: center;
	            color: #FFFFFF;
            }
        
.TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
            .auto-style11 {
            height: 24px;
            background-color: #97CBFF;
        }
            .auto-style2 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFD2D2;
	            text-align: left;
            height: 24px;
        }
            </style>
  <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
    
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop">詢價單管理</td>
                            </tr>
                            <tr>
                                <td class="Table1">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    DataKeyNames="UID"  DataSourceID="SqlDataSource1" Width="100%" AllowSorting="True" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="編修查詢">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢各詢價廠商之報價資料" CommandName="Select"  CommandArgument='<%# Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="UID" Text='<%# Bind("UID") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="詢價單編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="RFQ_Code" Text='<%# Bind("RFQ_Code") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="RFQ_Code" HeaderText="詢價單編號" SortExpression="RFQ_Code">
                                            </asp:BoundField>--%>
                                            <asp:TemplateField HeaderText="詢價單名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# Bind("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="Name" HeaderText="詢價單名稱" SortExpression="Name" />--%>
                                            <asp:BoundField DataField="Location" HeaderText="工程所在地" SortExpression="Location" />
                                            <asp:BoundField DataField="ReplyDate" HeaderText="報價回覆期限" SortExpression="ReplyDate" />
                                            <asp:TemplateField HeaderText="經辦人" SortExpression="WorkManDep">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WorkManDep") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WorkManDep") %>'></asp:Label>
                                                    -<asp:Label ID="Label2" runat="server" Text='<%# Bind("WorkManName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ></asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
                        <br />
                        <asp:Panel ID="Pnl_Firm" runat="server" Visible="False">
                        
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="Table1">詢價單編號</td>
                                <td class="Table2">
                                    <asp:Label ID="RFQCode" runat="server" Text='<%# Bind("RFQ_Code") %>'></asp:Label>
                                </td>
                                <td class="Table1">詢價單名稱</td>
                                <td class="Table2">
                                    <asp:Label ID="RFQName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" colspan="4">
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        DataSourceID="SqlDataSource2" Width="100%" OnRowCommand="GridView2_RowCommand" DataKeyNames="UID" >
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢/填寫報價單" OnClick="Button2_Click" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' />
                                                    &nbsp;
                                                    <asp:Button ID="Button3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button2_Click" Text="匯出詢價單" CommandName="Export" CommandArgument='<%# Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="UID" Text='<%# Bind("UID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="FirmID" Text='<%# Bind("FirmID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="RFQ_Code" Text='<%# Bind("RFQ_Code") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="RFQ_Code" HeaderText="RFQ_Code" SortExpression="RFQ_Code" Visible="False" />--%>
                                            <asp:BoundField DataField="Sort" HeaderText="Sort" SortExpression="Sort" Visible="False" />
                                            <asp:TemplateField HeaderText="詢價廠商名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# Bind("Comname") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="Name" HeaderText="詢價廠商名稱" SortExpression="Name" />--%>
                                            <%--<asp:BoundField DataField="TotalPrice" HeaderText="報價總價(不含稅)" SortExpression="TotalPrice" />--%>
                                            <asp:TemplateField HeaderText="報價總價(不含稅)">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="TotalPrice" Text='<%# Bind("TotalPrice") %>'  DataFormatString="{0:N}"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="引用此廠商報價" SortExpression="QuoteNY">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuoteNY") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"QuoteNY"))==1)? "是":"否" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="<%=Sql%>" >                                       
                                       <%-- <SelectParameters>
                                            <asp:Parameter DefaultValue="RFQ00001" Name="RFQ_Code" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            </table>
                            <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                            
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;border-color:white" border="1">
                                <tr>
                                    <td class="Table1">廠商名稱</td>
                                    <td class="Table2" colspan="3">
                                        <asp:Label runat="server" ID="UIDCom" Text='<%# Bind("UID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="LbCompany" runat="server" ></asp:Label>                                 

                                    </td>
                                    <td class="Table1" rowspan="2">報價總價(不含稅)</td>
                                    <td class="Table2" rowspan="2">
                                        <asp:Label ID="LbTprice" runat="server" Text='<%# Bind("TotalPrice") %>' Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1" >
                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="折扣百分比" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" />
                                    </td>
                                    <td class="Table2" rowspan="2">
                                        <asp:TextBox ID="TxDiscount" runat="server" Font-Size="Medium" Height="25px" Width="160px" ></asp:TextBox>
                                        <asp:Label runat="server" ID="UnitP" ></asp:Label></td>
                                    <td class="Table1">報價有效期限</td>
                                    <td class="Table2">
                                        <asp:TextBox ID="TxLimitDate" runat="server" Font-Size="Medium" Height="25px" Width="160px" onclick="WdatePicker();"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Table1">
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="約定總價上限" OnCheckedChanged="RadioButton2_CheckedChanged"  AutoPostBack="true" />
                                    </td>
                                    <td class="Table1">是否引用報價</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbYNQ" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                    </td>
                                    <td class="Table1">稅金</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbTax" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr class="TableTop">
                                        <td class="auto-style11">編碼</td>
                                        <td class="auto-style11">名稱</td>
                                        <td class="auto-style11">單位</td>
                                        <td class="auto-style11">總工程用量</td>
                                        <td class="auto-style11">報價單價</td>
                                        <td class="auto-style11">折扣單價</td>
                                        <td class="auto-style11">複價</td>
                                        <td class="auto-style11">結算方式</td>
                                        <td class="auto-style11">廠牌規格說明</td>
                                        <td class="auto-style11">備註</td>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                    <tr class="TableSingle">
                                        <td>
                                            <asp:Label ID="UID" runat="server" Visible="false" ></asp:Label>
                                            <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                                   <asp:Label runat="server" ID="PriceID"  Visible="false" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="LbProductName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="LbNumber" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="TxQuate" runat="server" Font-Size="Medium" Height="25px" Width="160px" ></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="LbDPrice" runat="server" ></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="LbCPrice" runat="server" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TxClearWay" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="LbBrand" runat="server" ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="LbNote" runat="server" ></asp:Label>
                                        </td>
                                    </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                       <asp:SqlDataSource ID="SqlDataSource4" runat="server"  >                                    
                                    </asp:SqlDataSource>
                                </table>
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr>
                                        <td class="Table1">
                                            <asp:Button ID="BtnCal" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="計算總價並儲存" OnClick="BtnCal_Click"  />
                                            &nbsp;
                                            <asp:Button ID="BtnQuate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="引用此廠商之報價" OnClick="BtnQuate_Click" />
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="TableTop2">&nbsp;&nbsp;&nbsp;&nbsp; 詢價單附件</td>
                                </tr>
                                <tr>
                                    <td class="Table1">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                                             CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource3" Width="100%"  OnRowCommand="GridView3_RowCommand">
                                            <Columns>
                                         <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="下載"  CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex %>' />                                                
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="附件名稱">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID ="Name" Text='<%# Bind("Name")%>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />--%>
                                                <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                                <%--<asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" />--%>
                                                <asp:TemplateField HeaderText="檔案路徑" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server"  ID="Path" Text='<%# Bind("Path") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            </Columns>
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
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" >
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="RFQ00001" Name="RFQ_Code" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
    
    </div>
    </body>
    </asp:Content>