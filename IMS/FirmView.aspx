<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="FirmView.aspx.cs" Inherits="IMS.FirmView"  MaintainScrollPositionOnPostback="true"%>
<%@ Register TagPrefix="Area" TagName="Firm" Src="~/Webcontrol/FirmMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商管理模組-分包商資料檢視</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
    <%--  <asp:SiteMapDataSource ID="SiteMapDataSource1" Runat="server"  />
      <div class="row-fluid">
        <div class="span12" id="content">
            <div class="row-fluid">
                <br />
                <div class="navbar">
                    <div class="navbar-inner">
                        <ul class="breadcrumb">
                            <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                            <i class="icon-chevron-right show-sidebar" style="display: none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                         
                            <asp:SiteMapPath ID="SiteMapPath1" runat="server" class="divider"></asp:SiteMapPath>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <!-- block -->
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">
                            <i class="fa fa-rss"></i>分包商資料檢視
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
    <Area:Firm ID="FirmBox" runat="server" /> 
   <%-- <div style="width:90%;padding-left:200px">
    <div>--%>
    
        <table class="Table100" border="1" style="border-color:white">
            <tr>
                <td class="TableTop">分包商資料檢視</td>
            </tr>
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">條件搜尋</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Search" runat="server" Visible="false" DefaultButton="BtnSearch">
            <table class="Table100" >
                <tr>
                    <td class="Table1" style="width:15%" >廠商名稱</td>
                    <td class="Table2" style="width:30%">
                        <asp:TextBox ID="TxFirmName" runat="server" CssClass="TBfree" Width="80%"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLone">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" style="width:15%">廠商類型</td>
                    <td class="Table2" style="width:30%">
                        <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="true"  datasourceid="SqlDataSource7" DataTextField="Type" DataValueField="Type" CssClass="DDLfree">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" SelectCommand="SELECT * FROM [PublicDB].[dbo].[FrimType]">
                         <%--   <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLone">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2">
                        <asp:TextBox ID="TxSpecialty" runat="server" CssClass="TBfree" Width="80%"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLone">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Select4" runat="server" AppendDataBoundItems="true"  DataSourceID="SqlDataSource5" DataTextField="City" DataValueField="City" CssClass="DDLfree">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="SELECT * FROM [CityList]">
                           <%-- <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="6">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="BtnLargeMedium" Text="確定搜尋" OnClick="BtnSearch_Click" />
                        &nbsp;
                        <asp:Button ID="BtnClear" runat="server" CssClass="BtnLargeMedium" Text="清除條件" OnClick="BtnClear_Click" />
                        &nbsp;
                        <asp:Button ID="BtnAll" runat="server" CssClass="BtnLargeMedium" Text="顯示全部" OnClick="BtnAll_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White">分包商列表</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2C">
                                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource6" Width="100%" 
                                            ForeColor="#333333" GridLines="Horizontal" OnRowCommand="GridView4_RowCommand">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CssClass="BtnFree"  Text="資料檢視" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />--%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="廠商名稱">
                                       <ItemTemplate >
                                           <asp:Label ID="Name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:Label>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="廠商類型">
                                        <ItemTemplate>
                                            <asp:Label ID="Type" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="廠商專長／供給材料">
                                        <ItemTemplate>
                                            <asp:Label ID="SupportItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SupportItem") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Label ID="Owner" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Owner") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                  <asp:TemplateField HeaderText="所在縣市">
                                      <ItemTemplate >
                                          <asp:Label ID="Location" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Location") %>' ></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                    <asp:TemplateField HeaderText="聯絡電話">
                                    <ItemTemplate>
                                        <asp:Label ID="Tel1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Tel1") %>' ></asp:Label>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="備註">
                                        <ItemTemplate>
                                            <asp:Label ID="Notes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Notes") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server"  SelectCommand="SELECT [UID], [Name], [Type], [SupportItem], [Owner], [Location], [Tel1], [Notes] FROM [FirmM]"></asp:SqlDataSource>
                                    </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_View" runat="server" Visible="False">
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
                    <td class="Table1" rowspan="3">初<br /> 評</td>
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
                    <td class="Table1">複<br /> 評</td>
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
                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" 
                            OnRowCommand="GridView5_RowCommand" OnRowDataBound="GridView5_RowDataBound">
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
                              <%--  <asp:BoundField DataField="分包合約總金額" HeaderText="分包合約總金額" SortExpression="分包合約總金額" />
                                <asp:BoundField DataField="末次追加減後總金額" HeaderText="末次追加減後總金額" SortExpression="末次追加減後總金額" />--%>
                                <asp:BoundField DataField="分包合約種類" HeaderText="分包合約種類" SortExpression="分包合約種類" />
                                <asp:BoundField DataField="已計價次數" HeaderText="已計價次數" SortExpression="已計價次數" ReadOnly="True" />
                                   <asp:TemplateField HeaderText="已計價金額">
                                    <ItemTemplate>
                                        <asp:Label ID="已計價金額" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "已計價金額") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="已計價金額" HeaderText="已計價金額" SortExpression="已計價金額" ReadOnly="True" />--%>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server">
                      <%--      <SelectParameters>
                                <asp:SessionParameter Name="FirmID" SessionField="FirmID" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                        <asp:Panel ID="Pnl_Ckeck" runat="server" Visible="False">
                            <table class="Table100">
                                <tr>
                                    <td class="Table0" colspan="10">分包合約考核結果</td>
                                </tr>
                                <tr>
                                    <td class="Table1" rowspan="3">初<br /> 評</td>
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
                                    <td class="Table1">複<br /> 評</td>
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
<%--    
    </div>
</div>
       </div>
                </div>
                <!-- /block -->
            </div>
        </div>--%>
  <%--  </div>--%>
  </asp:Content>