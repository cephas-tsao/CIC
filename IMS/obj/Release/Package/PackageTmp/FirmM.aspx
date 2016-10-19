<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="FirmM.aspx.cs" Inherits="IMS.FirmM1" %>
<%@ Register TagPrefix="Area" TagName="Firm" Src="~/Webcontrol/FirmMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商管理模組-分包商資料管理</title>
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <asp:SiteMapDataSource ID="SiteMapDataSource1" Runat="server"  />
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
                            <i class="fa fa-rss"></i>分包商遴選評估(初評)
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
       <Area:Firm ID="FirmBox" runat="server" /> 
   <%-- <div style="width:90%;padding-left:200px">
     <div>--%>
    
        <table class="Table100" border="1" style="border-color:white">
            <tr>
                <td class="TableTop">分包商基本資料管理</td>
            </tr>
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">條件搜尋</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Search" runat="server" Visible="False" DefaultButton="BtnSearch">
            <table class="Table100" border="1" style="border-color:white">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2">
                        <asp:TextBox ID="TxFirmName" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="true" datasourceid="SqlDataSource7" DataTextField="Type" DataValueField="Type">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"  SelectCommand="SELECT * FROM [PublicDB].[dbo].[FrimType]">
                           <%-- <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2">
                        <asp:TextBox ID="TxSpecialty" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="Table2CC">
                        <asp:DropDownList ID="DDL_Op3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="and NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2">
                        <asp:DropDownList ID="DDL_Select4" runat="server" AppendDataBoundItems="true"  DataSourceID="SqlDataSource5" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"  SelectCommand="SELECT * FROM [CityList]">
                      <%--      <SelectParameters>
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
        <table class="Table100" border="1" style="border-color:white">
            <tr>
                <td class="Table0">
                    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White" OnClick="LinkButton3_Click">新增分包商</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Pnl_Insert" runat="server" Visible="False" DefaultButton="BtnAdd">
            <table class="Table100">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_FirmName" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select5" runat="server" AppendDataBoundItems="true" CssClass="DDLshort" datasourceid="SqlDataSource8" DataTextField="Type" DataValueField="Type">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server"  SelectCommand="SELECT * FROM [PublicDB].[dbo].[FrimType]">
                         <%--   <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_SupportItem" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_No" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Owner" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_OwnerMobile" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Capital" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Staff" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Tel1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Tel2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Fax1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Fax2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select6" runat="server" AppendDataBoundItems="true" CssClass="DDLshort1" Width="165" datasourceid="SqlDataSource9" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server"  SelectCommand="SELECT * FROM [CityList]">
                          <%--  <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TB_Email" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Caddress" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_Notes" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TB_RAddress" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="8">
                        <asp:Button ID="BtnAdd" runat="server" CssClass="BtnLargeShort" Text="確定新增" OnClick="BtnAdd_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnClear1" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="BtnClear_Click1" />
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
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CssClass="BtnFree"  Text="編修" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>' ></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />--%>
                                    <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="廠商類型" SortExpression="Type" />
                                    <asp:BoundField DataField="SupportItem" HeaderText="廠商專長／供給材料" SortExpression="SupportItem" />
                                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" Visible="False" />
                                    <asp:BoundField DataField="Location" HeaderText="所在縣市" SortExpression="Location" />
                                    <asp:BoundField DataField="Tel1" HeaderText="聯絡電話" SortExpression="Tel1" />
                                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
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
        <asp:Panel ID="Pnl_Edit" runat="server" Visible="False" DefaultButton="BtnSaveEdit">
            <table class="Table100">
                <tr>
                    <td class="Table0" colspan="8">
                        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">分包商基本資料編輯</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:Label runat="server" ID="UID1"  Visible="false"></asp:Label>
                        <asp:TextBox ID="TBE_FirmName" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">廠商類型</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select7" runat="server" AppendDataBoundItems="true" CssClass="DLshort1" datasourceid="SqlDataSource10" DataTextField="Type" DataValueField="Type">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" SelectCommand="SELECT * FROM [PublicDB].[dbo].[FrimType]">
                         <%--   <SelectParameters>
                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">廠商專長/供給項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_SupportItem" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">統一編號</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_EIN" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">負責人姓名</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Owner" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">負責人電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_OwnerMobile" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">資本額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Capital" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (萬元)</td>
                    <td class="Table1">員工數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Staff" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        (人)</td>
                </tr>
                <tr>
                    <td class="Table1">連絡電話1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Tel1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">連絡電話2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Tel2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼1</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Fax1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">傳真號碼2</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Fax2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_Select8" runat="server" AppendDataBoundItems="true" CssClass="DLshort1" Width="165" datasourceid="SqlDataSource11" DataTextField="City" DataValueField="City">
                            <asp:ListItem Value="0"> 請選擇 </asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server"  SelectCommand="SELECT * FROM [CityList] ">
                          <%--  <SelectParameters>
                                <asp:Parameter DefaultValue="ROC" Name="CountryID" Type="String" />
                                <asp:Parameter DefaultValue="0" Name="CityID" Type="Int32" />
                            </SelectParameters>--%>
                        </asp:SqlDataSource>
                    </td>
                    <td class="Table1">E-mail</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TBE_Email" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">聯絡地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TBE_CAddress" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">備註</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TBE_Notes" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                    <td class="Table1">公司登記地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox ID="TBE_RAddress" runat="server" CssClass="TB500"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="8">
                        <asp:Button ID="BtnSaveEdit" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="BtnSaveEdit_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnReEdit" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="BtnReEdit_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    <%--</div>
</div>
                    </div>
                </div>
            </div>
          </div>--%>
    

    </asp:Content>