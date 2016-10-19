<%@ Page Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="PriceAnalysis.aspx.cs" Inherits="IMS.PriceAnalysis" MaintainScrollPositionOnPostback="True" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Usual.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>單價分析</title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
    <style type="text/css">
        .TableCell1 {
            margin-bottom: 0px;
            overflow-x:auto;
        }
        .claud {
      
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" href="CSS/Jquery-ui.theme.css" />
    <script>
        $(document).ready(function () {
            $("#tabs").tabs({
                activate: function () {
                    var selectedTab = $("#tabs").tabs('option', 'active');
                    $("#<%= hdnSelectedTab.ClientID %>").val(selectedTab);
                },
                active: $("#<%= hdnSelectedTab.ClientID %>").val()
            });
        });
    </script>
  <%--    <asp:SiteMapDataSource ID="SiteMapDataSource1" Runat="server"  />
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
                            <i class="fa fa-rss"></i>工料管理
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
       <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
     <%--<div style="padding-left:200px">--%>
           <table class="Table100">
            <tr>
                <td class="TableTop">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" >共用工料管理</asp:LinkButton>
                </td>
            </tr>
            </table>
    <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">新增工料</a></li>
          <%--  <li><a href="#tabs-2">新增拆工拆料項</a></li>--%>
            <li><a href="#tabs-3">編修工料</a></li>
          <%--  <li><a href="#tabs-4">編修拆工拆料項</a></li>--%>
            <li><a href="#tabs-5">匯入公有雲工料</a></li>
        </ul>
        <div id="tabs-1">
            <asp:Label runat="server" Text="新增工料" Visible="False"></asp:Label><br />
            <table rules="all"   class="Table100" >
                <tr>
                    <td style="width:30%" class="Table1"><asp:Label runat="server" Text="工料名稱："></asp:Label></td>
                    <td class="Table2LC"><asp:TextBox ID="TB_PriceName1" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td class="Table1"><asp:Label ID="Label3" runat="server" Text="工項種類："></asp:Label></td>
                    <td class="Table2LC"><asp:DropDownList ID="DDL_Classification" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Classification_SelectedIndexChanged" CssClass="DDLfree">
                           <asp:ListItem Text="請選擇" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="拆工拆料項" Value="拆工拆料項" ></asp:ListItem>
                        <asp:ListItem Text="連工帶料項" Value="連工帶料項" ></asp:ListItem>
                        <asp:ListItem Text="材料" Value="材料"></asp:ListItem>
                        <asp:ListItem Text="人力" Value="人力"></asp:ListItem>
                        <asp:ListItem Text="機具" Value="機具"></asp:ListItem> 
                         <asp:ListItem Text="雜項" Value="雜項"></asp:ListItem>                           
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="工料價格："></asp:Label></td>
                    <td class="Table2LC"><asp:TextBox ID="TB_Price1" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="單位："></asp:Label></td>
                    <td class="Table2LC"><asp:DropDownList ID="DDL_Unit1" runat="server" CssClass="DDLfree"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="資源編碼："></asp:Label></td>
                    <td class="Table2LC"><asp:TextBox ID="TB_Code1" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
               
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="備註："></asp:Label></td>
                    <td class="Table2LC"><asp:TextBox ID="TB_Remark_Simple" runat="server" TextMode="MultiLine" Rows="5" CssClass="TBfree"></asp:TextBox></td>
                </tr>

          <tr>
                    <td class="Table1" colspan="2">
            <asp:Button ID="Btn_Price_Add" runat="server" Text="確認" OnClick="Btn_Price_Add_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px" />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnClear" runat="server" Text="清空" OnClick="BtnClear_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px" />
                        </td></tr></table>
        </div>
       <%-- <div id="tabs-2">
            <asp:Label runat="server" Text="新增拆工拆料項"></asp:Label><br />
            <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr>
                    <td><asp:Label runat="server" Text="工料名稱："></asp:Label></td>
                    <td><asp:TextBox ID="TB_PriceName2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="單位："></asp:Label></td>
                    <td><asp:DropDownList ID="DDL_Unit2" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="分析數量："></asp:Label></td>
                    <td><asp:TextBox ID="TB_ComplexAmount" runat="server" Text="1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="資源編碼："></asp:Label></td>
                    <td><asp:TextBox ID="TB_Code2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="工項種類"></asp:Label></td>
                    <td><asp:DropDownList ID="DDL_Classification2" runat="server">                   
                        <asp:ListItem Text="拆工拆料項" Value="拆工拆料項" Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="備註"></asp:Label></td>
                    <td><asp:TextBox ID="TB_Remark_Complex" runat="server" TextMode="MultiLine" Rows="5" Width="200"></asp:TextBox></td>
                </tr>
            </table>
            
            <br />
            <asp:Label runat="server" Text="請輸入欲參照的工料數量："></asp:Label><asp:TextBox ID="TB_RefNum" runat="server"></asp:TextBox>
            <asp:Button ID="Btn_ComplexPrice_Add" runat="server" Text="新增" OnClick="Btn_ComplexPrice_Add_Click" CssClass="BtnFree"/><br />
            <asp:Table ID="Tbl_Price" runat="server" BorderStyle="Double" BorderWidth="1" Width="100%" >
                <asp:TableHeaderRow BackColor="#5D7B9D">
                    <asp:TableHeaderCell Text="刪除" Width="40px"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="工料名" Width="160px"></asp:TableHeaderCell>
                    <asp:TableHeaderCell Text="數量" Width="40px"></asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <br />
            <table style="width:100%">
          <tr>
                    <td class="Table1" colspan="3">
            <asp:Button ID="Btn_Save" runat="server" Text="儲存" OnClick="Btn_Save_Click" CssClass="BtnFree" /><br />
                       </td> </tr></table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>--%>
        <div id="tabs-3">
            <asp:Panel ID="Pnl_Select" runat="server" DefaultButton="Search"><table class="Table100"><tr><td style="width:50%" class="Table1L">
            <asp:Label runat="server" Text="單頁顯示數量："></asp:Label><asp:DropDownList ID="DDL_Gv1_pagesize" runat="server" AutoPostBack="true" CssClass="DDLshort">
                <asp:ListItem Text="10" Value="10" Selected="True"></asp:ListItem>
                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
            </asp:DropDownList></td>
            <td class="Table1R">
                <asp:TextBox ID="TBSearch" runat="server" CssClass="TBmiddle" ></asp:TextBox><asp:ImageButton ID="Search" runat="server" Height="16px" ImageUrl="~/IMG/Search.gif" OnClick="Search_Click" /> </td>
            </tr></table></asp:Panel>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PriceID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True"  RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="Black" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
               <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                   
                  <%--  <asp:BoundField DataField="ItemName" HeaderText="名稱" SortExpression="ItemName" />--%>
                 <%--   <asp:BoundField DataField="ItemKind" HeaderText="分類" SortExpression="ItemKind" />--%>
                     <%--<asp:ButtonField ButtonType="Button" Text="編輯單價分析" CommandName="Ed" />--%>                        
                    <asp:CommandField ShowEditButton="True"  ItemStyle-CssClass="BtnFree" ButtonType="Button">
                     <ControlStyle CssClass="BtnFree" />
<ItemStyle CssClass="GvCellCC"></ItemStyle>
                     </asp:CommandField>
                    <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                   
                       <asp:TemplateField HeaderText="名稱">
                        <ItemTemplate>                         
                            <asp:Label ID="complex" runat="server" Text= '<%# Eval("complex") %>' Visible="false"></asp:Label>
                            <asp:Label ID="ItemName" runat="server" Text= '<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>' Width="600px"></asp:TextBox>                           
                        </EditItemTemplate>
                           <ItemStyle CssClass="GvCellCL" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="單位" SortExpression="Unit">
                        <EditItemTemplate>
                            <asp:DropDownList ID="gvtype1" runat="server" DataSource='<%# Utility.Unitlist.UnitList() %>' SelectedValue='<%# Bind("Unit") %>'  Apenddatabounditems="true">
                                <asp:ListItem Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Unit") %>
                        </ItemTemplate>
                        <ItemStyle CssClass="GvCellCC" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Complex" HeaderText="Complex" SortExpression="Complex" Visible="False" />
                    <asp:BoundField DataField="AnaNumber" HeaderText="AnaNumber" SortExpression="AnaNumber" Visible="False" />
                         <asp:TemplateField HeaderText="種類" SortExpression="ItemKind">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ItemKind" runat="server" DataSource='<%# Utility.Unitlist.ItemKind() %>' SelectedValue='<%# Bind("ItemKind") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("ItemKind") %>
                        </ItemTemplate>
                             <ItemStyle CssClass="GvCellCC" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" >
                     <ItemStyle CssClass="GvCellCC" />
                     </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="價格" SortExpression="Price" >
                     <ItemStyle CssClass="GvCellCR" />
                     </asp:BoundField>
                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" >
                     <ItemStyle CssClass="GvCellCL" />
                     </asp:BoundField>
                     <asp:TemplateField>
                      <ItemTemplate>
                          <asp:Button ID="Analyst" Text="編輯單價分析" runat="server" CommandName="Ed" CommandArgument='<%# Container.DataItemIndex%>'/>
                      </ItemTemplate>
                         <ControlStyle CssClass="BtnFree" />
                         <ItemStyle CssClass="GvCellCC" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="<%=Sql%>"     
                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [PrivateResource] WHERE [PriceID] = @original_PriceID" 
                InsertCommand="INSERT INTO [PrivateResource] ([ItemName], [Unit], [Complex], [AnaNumber], [Code], [Price], [Notes], [ItemKind]) VALUES (@ItemName, @Unit, @Complex, @AnaNumber, @Code, @Price, @Notes, @ItemKind)" 
                OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [PrivateResource] SET [ItemName] = @ItemName, [Unit] = @Unit, [Code] = @Code, [Price] = @Price, [Notes] = @Notes, [ItemKind] = @ItemKind WHERE [PriceID] = @original_PriceID" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:Parameter Name="original_PriceID" Type="Int32" />
                    <asp:Parameter Name="original_ItemName" Type="String" />
                    <asp:Parameter Name="original_Unit" Type="String" />
                    <asp:Parameter Name="original_Complex" Type="Int32" />
                    <asp:Parameter Name="original_AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="original_Code" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Notes" Type="String" />
                    <asp:Parameter Name="original_ItemKind" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="Complex" Type="Int32" />
                    <asp:Parameter Name="AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ItemKind" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="Complex" Type="Int32" />
                    <asp:Parameter Name="AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ItemKind" Type="String" />
                    <asp:Parameter Name="original_PriceID" Type="Int32" />
                    <asp:Parameter Name="original_ItemName" Type="String" />
                    <asp:Parameter Name="original_Unit" Type="String" />
                    <asp:Parameter Name="original_Complex" Type="Int32" />
                    <asp:Parameter Name="original_AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="original_Code" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Notes" Type="String" />
                    <asp:Parameter Name="original_ItemKind" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
     <%--   <div id="tabs-4">
            <asp:Label runat="server" Text="單頁顯示數量："></asp:Label>
            <asp:DropDownList ID="DDL_Gv2_pagesize" runat="server" AutoPostBack="true">
                <asp:ListItem Text="10" Value="10" Selected="True"></asp:ListItem>
                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                <asp:ListItem Text="200" Value="200"></asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" OnRowCommand="GridView2_RowCommand" AllowPaging="True" AllowSorting="True"
                 Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both" RowStyle-Height="30px">
                    <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ItemStyle-CssClass="BtnFree" />
                    <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
              
                    <asp:TemplateField HeaderText="名稱">
                        <ItemTemplate>
                            <asp:Label ID="ItemName" runat="server" Text= '<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                          <EditItemTemplate>
                              <asp:TextBox ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>' Width="600px"></asp:TextBox>                           
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="單位" SortExpression="Unit">
                        <EditItemTemplate>
                            <asp:DropDownList ID="gvtype1" runat="server" DataSource='<%# Utility.Unitlist.UnitList() %>' SelectedValue='<%# Bind("Unit") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Unit") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Complex" HeaderText="Complex" SortExpression="Complex" Visible="False" />
                    <asp:BoundField DataField="AnaNumber" HeaderText="分析數量" SortExpression="AnaNumber" />
                    <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />                   
                    <asp:TemplateField HeaderText="價格">
                        <ItemTemplate>
                            <asp:Label ID="Price" runat="server" Text='<%# Bind("Price") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                    <asp:BoundField DataField="ItemKind" HeaderText="種類" SortExpression="ItemKind" />              
                    <asp:ButtonField ButtonType="Button" Text="編輯單價分析" CommandName="Ed" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT [PriceID],[ItemName],REPLACE(Unit,' ','') as Unit,[Complex],[AnaNumber],[Code],[Price],[Notes],REPLACE(ItemKind,' ','') as ItemKind FROM [PrivateResource] WHERE Complex=1 order by PriceID" ConflictDetection="CompareAllValues" 
                DeleteCommand="DELETE FROM [PrivateResource] WHERE [PriceID] = @original_PriceID" 
                InsertCommand="INSERT INTO [PrivateResource] ([ItemName], [Unit], [Complex], [AnaNumber], [Code], [Price], [Notes], [ItemKind]) VALUES (@ItemName, @Unit, @Complex, @AnaNumber, @Code, @Price, @Notes, @ItemKind)" 
                OldValuesParameterFormatString="original_{0}" 
                UpdateCommand="UPDATE [PrivateResource] SET [ItemName] = @ItemName, [Unit] = @Unit, [AnaNumber] = @AnaNumber, [Code] = @Code, [Notes] = @Notes, [ItemKind] = @ItemKind WHERE [PriceID] = @original_PriceID" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:Parameter Name="original_PriceID" Type="Int32" />
                    <asp:Parameter Name="original_ItemName" Type="String" />
                    <asp:Parameter Name="original_Unit" Type="String" />
                    <asp:Parameter Name="original_Complex" Type="Int32" />
                    <asp:Parameter Name="original_AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="original_Code" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Notes" Type="String" />
                    <asp:Parameter Name="original_ItemKind" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="Complex" Type="Int32" />
                    <asp:Parameter Name="AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ItemKind" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="Complex" Type="Int32" />
                    <asp:Parameter Name="AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="Code" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ItemKind" Type="String" />
                    <asp:Parameter Name="original_PriceID" Type="Int32" />
                    <asp:Parameter Name="original_ItemName" Type="String" />
                    <asp:Parameter Name="original_Unit" Type="String" />
                    <asp:Parameter Name="original_Complex" Type="Int32" />
                    <asp:Parameter Name="original_AnaNumber" Type="Decimal" />
                    <asp:Parameter Name="original_Code" Type="String" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Notes" Type="String" />
                    <asp:Parameter Name="original_ItemKind" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>--%>
          <div id="tabs-5" style="width:100%">
                <asp:Table ID="Tbl_User" runat="server" Width="97%"  CssClass="TableCell1">
            <asp:TableHeaderRow ID="THR1" runat="server" Width="100%" Font-Size="Large" BackColor="#97CBFF" >
                <asp:TableHeaderCell ID="THC1" runat="server" Text="私有雲" Width="40%" ></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC2" runat="server" Width="5%"></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC3" runat="server" Text="公有雲" Width="40%" CssClass="TableCell1"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
                    <asp:TableRow runat="server" Width="100%">
                        <asp:TableCell runat="server" Width="40%" >
                            <asp:Label ID="Label1" runat="server" Text="私有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="250px" Height="30px"></asp:TextBox>
                              <asp:Button ID="BtnPrivateS" runat="server" Text="搜尋" OnClick="BtnPrivateS_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="80px"/>
                        </asp:TableCell>
                        <asp:TableCell runat="server" Width="5%"></asp:TableCell>
                        <asp:TableCell ID="TableCell1" runat="server" Width="40%">
                            <asp:Label ID="Label2" runat="server" Text="公有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox2" runat="server" Width="250px" Height="30px"></asp:TextBox>
                              <asp:Button ID="BtnPublicS" runat="server" Text="搜尋" OnClick="BtnPublicS_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="80px"/>
                        </asp:TableCell>
                    </asp:TableRow>
            <asp:TableRow ID="TR1" runat="server">
                <asp:TableCell ID="TC1" runat="server" RowSpan="4" CssClass="TableCell"  >
                    <asp:ListBox ID="LB_Private" runat="server" Width="100%" Height="500px" SelectionMode="Multiple" CssClass="TableCell1"></asp:ListBox>
                </asp:TableCell>
                <asp:TableCell ID="TC20" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_OneToPrivate" runat="server" Text=" < " OnClick="Btn_OneToPrivate_Click" CssClass="BtnFree" ToolTip="選取轉入私有雲" />
                </asp:TableCell>

                <asp:TableCell ID="TC3" runat="server" RowSpan="4" CssClass="TableCell1" >
                   
                    <asp:ListBox ID="LB_Public" runat="server" Width="100%" Height="500px" SelectionMode="Multiple" CssClass="TableCell1"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR2" runat="server">
                <asp:TableCell ID="TC21" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_AllToPrivate" runat="server" Text="<<" OnClick="Btn_AllToPrivate_Click" CssClass="BtnFree"  ToolTip="全部轉入私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR3" runat="server">
                <asp:TableCell ID="TC22" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_OneToPublic" runat="server" Text=" > " OnClick="Btn_OneToPublic_Click" CssClass="BtnFree"  ToolTip="選取移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR4" runat="server">
                <asp:TableCell ID="TC23" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_AllToPublic" runat="server" Text=">>" OnClick="Btn_AllToPublic_Click" CssClass="BtnFree"  ToolTip="全部移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
                    
            <asp:TableRow ID="TR5" runat="server" BackColor="#97CBFF"  >
                <asp:TableCell ID="TCF" runat="server" ColumnSpan="3" HorizontalAlign="Center">
                    <asp:Button ID="Btn_Allsave" runat="server" Text="儲存" OnClick="Btn_Allsave_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px"/>
                </asp:TableCell>
            </asp:TableRow>
                    </asp:Table>
              </div>
    </div>
   <%--      </div>
                        </div>
                    </div>
                </div>
            </div>--%>
          
</asp:Content>
