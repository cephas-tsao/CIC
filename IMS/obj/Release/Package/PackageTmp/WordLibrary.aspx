<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WordLibrary.aspx.cs" Inherits="IMS.WordLibrary" MaintainScrollPositionOnPostback="True" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Usual.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>常用詞庫</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
    <link rel="stylesheet" href="CSS/Jquery-ui.theme.css" />
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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
   <%--   <div class="row-fluid">
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
                            <i class="fa fa-rss"></i>常用詞庫
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
<%--    <div style="width:90%;padding-left:200px">--%>
              <table class="Table100">
            <tr>
                <td class="TableTop">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" >常用詞庫管理</asp:LinkButton>
                </td>
            </tr>
            </table>
          <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li ><a href="#tabs-1" runat="server"  onload="tabs_1_Click">日報工作內容</a></li>
            <li ><a href="#tabs-2" runat="server" onload="tabs_2_Click">施工記事</a></li>
            <li><a href="#tabs-3" runat="server" onload="tabs_3_Click">合約備註</a></li>
            <li><a href="#tabs-4" runat="server" onload="tabs_4_Click">業主建築師指示</a></li>
            <li><a href="#tabs-5" runat="server" onload="tabs_5_Click">人力機具</a></li>
             <li><a href="#tabs-6" runat="server" onload="tabs_6_Click">材料</a></li>
             <li><a href="#tabs-7" runat="server" onload="tabs_7_Click">工作項目</a></li>
             <li><a href="#tabs-8" runat="server" >全資料搜尋</a></li>
             <li><a href="#tabs-9" runat="server" >匯入公有雲詞庫</a></li>
           <%-- <li style="display:inline;"><asp:Button ID="tabs_1" runat="server" Text="日報工作內容" OnClick="tabs_1_Click" Width="120px" Height="30px" Font-Size="Large" /></li>
            <li style="display:inline;"><asp:Button ID="tabs_2" runat="server" Text="施工記事" OnClick="tabs_2_Click" Width="120px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_3" runat="server" Text="合約備註" OnClick="tabs_3_Click" Width="120px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_4" runat="server" Text="業主建築師指示" OnClick="tabs_4_Click" Width="140px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_5" runat="server" Text="人力機具" OnClick="tabs_5_Click" Width="120px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_6" runat="server" Text="材料" OnClick="tabs_6_Click" Width="120px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_7" runat="server" Text="工作項目" OnClick="tabs_7_Click" Width="120px" Height="30px" Font-Size="Large"/></li>
            <li style="display:inline;"><asp:Button ID="tabs_8" runat="server" Text="全資料搜尋" OnClick="tabs_8_Click" Width="120px" Height="30px" Font-Size="Large"/></li>--%>
        </ul>
      <%--  <div id="tabs_A" style="display:none" runat="server">--%>
         <div id="tabs-1">
            <asp:Label runat="server" Text=" 新增常用詞"></asp:Label><br />
             <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label runat="server" Text="分類："></asp:Label></td><td>
            <asp:Label ID="lbl_type1" runat="server" Text=""></asp:Label></td></tr>
             <tr><td ><asp:Label runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt" runat="server" Width="40%" Height="20px"></asp:TextBox></td></tr>
            <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn" runat="server" Text="新增" OnClick="WordAdd_btn_Click" CssClass="BtnFree" Width="100px"/></td></tr>
          <tr><td >
            <asp:Label runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type11" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td ><asp:Label runat="server" Text="搜尋常用詞："></asp:Label></td><td>
            <asp:TextBox ID="TB_UsualWord1" runat="server" Height="20px"></asp:TextBox><asp:Button ID="btn_select1" runat="server" Text="搜尋" OnClick="btn_select1_Click" CssClass="BtnFree" Width="70px"/></td></tr></table>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test1" PageSize="15" AllowPaging="True" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="Black"  OnRowDataBound="GridView1_OnRowDataBound" >
              <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:CommandField>
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

            <asp:SqlDataSource ID="Sql_test1" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
         <div id="tabs-2">
            <asp:Label ID="Label1" runat="server" Text=" 新增常用詞"></asp:Label><br />
             <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label ID="Label2" runat="server" Text="分類："></asp:Label></td><td>
            <asp:Label ID="lbl_type2" runat="server" Text=""></asp:Label></td></tr>
             <tr><td ><asp:Label ID="Label4" runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt2" runat="server" Width="40%" Height="20px"></asp:TextBox></td></tr>
            <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn2" runat="server" Text="新增" OnClick="WordAdd_btn2_Click" CssClass="BtnFree"/></td></tr>
          <tr><td >
            <asp:Label ID="Label5" runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type12" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td ><asp:Label ID="Label7" runat="server" Text="搜尋常用詞："></asp:Label></td><td>
            <asp:TextBox ID="TB_UsualWord2" runat="server" Height="20px"></asp:TextBox><asp:Button ID="btn_select2" runat="server" Text="搜尋" OnClick="btn_select2_Click" CssClass="BtnFree"/></td></tr></table>

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test2" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound" >
              <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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

            <asp:SqlDataSource ID="Sql_test2" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
         <div id="tabs-3">
            <asp:Label ID="Label8" runat="server" Text=" 新增常用詞"></asp:Label><br />
             <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label ID="Label9" runat="server" Text="分類："></asp:Label></td><td>
            <asp:Label ID="lbl_type3" runat="server" Text=""></asp:Label></td></tr>
             <tr><td ><asp:Label ID="Label11" runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt3" runat="server" Width="40%" Height="20px"></asp:TextBox></td></tr>
            <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn3" runat="server" Text="新增" OnClick="WordAdd_btn3_Click" CssClass="BtnFree"/></td></tr>
          <tr><td >
            <asp:Label ID="Label12" runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type13" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td ><asp:Label ID="Label14" runat="server" Text="搜尋常用詞："></asp:Label></td><td>
            <asp:TextBox ID="TB_UsualWord3" runat="server" Height="20px"></asp:TextBox><asp:Button ID="btn_select3" runat="server" Text="搜尋" OnClick="btn_select3_Click" CssClass="BtnFree"/></td></tr></table>

            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test3" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound" >
              <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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

            <asp:SqlDataSource ID="Sql_test3" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
          <div id="tabs-4">
            <asp:Label ID="Label15" runat="server" Text=" 新增常用詞"></asp:Label><br />
             <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label ID="Label16" runat="server" Text="分類："></asp:Label></td><td>
            <asp:Label ID="lbl_type4" runat="server" Text=""></asp:Label></td></tr>
             <tr><td ><asp:Label ID="Label18" runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt4" runat="server" Width="40%" Height="20px"></asp:TextBox></td></tr>
            <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn4" runat="server" Text="新增" OnClick="WordAdd_btn4_Click" CssClass="BtnFree"/></td></tr>
          <tr><td >
            <asp:Label ID="Label19" runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type14" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td ><asp:Label ID="Label21" runat="server" Text="搜尋常用詞："></asp:Label></td><td>
            <asp:TextBox ID="TB_UsualWord4" runat="server" Height="20px"></asp:TextBox><asp:Button ID="btn_select4" runat="server" Text="搜尋" OnClick="btn_select4_Click" CssClass="BtnFree"/></td></tr></table>

            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test4" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound" >
              <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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

            <asp:SqlDataSource ID="Sql_test4" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
            <div id="tabs-5">
            <asp:Label ID="Label22" runat="server" Text=" 新增常用詞"></asp:Label><br />
             <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label ID="Label23" runat="server" Text="分類："></asp:Label></td><td>
            <asp:Label ID="lbl_type5" runat="server" Text=""></asp:Label></td></tr>
             <tr><td ><asp:Label ID="Label25" runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt5" runat="server" Width="40%" Height="20px"></asp:TextBox></td></tr>
            <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn5" runat="server" Text="新增" OnClick="WordAdd_btn5_Click" CssClass="BtnFree"/></td></tr>
          <tr><td >
            <asp:Label ID="Label26" runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type15" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td ><asp:Label ID="Label28" runat="server" Text="搜尋常用詞："></asp:Label></td><td>
            <asp:TextBox ID="TB_UsualWord5" runat="server" Height="20px"></asp:TextBox><asp:Button ID="btn_select5" runat="server" Text="搜尋" OnClick="btn_select5_Click" CssClass="BtnFree"/></td></tr></table>

            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test5" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound" >
              <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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

            <asp:SqlDataSource ID="Sql_test5" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
      <%--  <div id="tabs_B" style="display:none" runat="server">--%>
         <div id="tabs-6" style="width:100%">
            <asp:Label runat="server" Text=" 新增常用詞"></asp:Label><br />
              <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label runat="server" Text="分類："></asp:Label></td>
              <td><asp:Label ID="lbl_type6" runat="server" Text=""></asp:Label></td></tr>
             <tr><td><asp:Label runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt6" runat="server" Width="20%" Height="20px"></asp:TextBox></td></tr>
             <tr><td><asp:Label runat="server" Text="單位："></asp:Label></td><td><asp:DropDownList ID="Unit_DDL" runat="server" Height="20px"></asp:DropDownList></td></tr>
             <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn6" runat="server" Text="新增" OnClick="WordAdd_btn6_Click" CssClass="BtnFree" /></td></tr>
            <tr><td>
            <asp:Label runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type16" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td><asp:Label runat="server" Text="搜尋常用詞："></asp:Label></td><td><asp:TextBox ID="TB_UsualWord6" runat="server"></asp:TextBox><asp:Button ID="btn_select6" runat="server" Text="搜尋" OnClick="btn_select6_Click" CssClass="BtnFree"/></td></tr>
                  </table>
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test6" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound">
                <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="單位" ItemStyle-Width="40px">
                        <ItemStyle Width="40px" />
                        <ItemTemplate>
                            <%# Eval("UnitID") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Unit_DDL2" runat="server" DataSource='<%# Utility.Unitlist.UnitList() %>' SelectedValue='<%# Bind("UnitID") %>'></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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
            <asp:SqlDataSource ID="Sql_test6" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is not null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content, [UnitID] = @UnitID WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="UnitID" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_UnitID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div id="tabs-7" style="width:100%">
            <asp:Label ID="Label3" runat="server" Text=" 新增常用詞"></asp:Label><br />
              <table style="width:100%;border:5px #cccccc solid;" rules="all"   class="Table100">
                <tr><td >
            <asp:Label ID="Label6" runat="server" Text="分類："></asp:Label></td>
              <td><asp:Label ID="lbl_type7" runat="server" Text=""></asp:Label></td></tr>
             <tr><td><asp:Label ID="Label13" runat="server" Text="常用詞："></asp:Label></td><td><asp:TextBox ID="WordAdd_txt7" runat="server" Width="20%" Height="20px"></asp:TextBox></td></tr>
             <tr><td><asp:Label ID="Label17" runat="server" Text="單位："></asp:Label></td><td><asp:DropDownList ID="Unit_DDL1" runat="server" Height="20px"></asp:DropDownList></td></tr>
             <tr><td class="Table1" colspan="3"> <asp:Button ID="WordAdd_btn7" runat="server" Text="新增" OnClick="WordAdd_btn7_Click" CssClass="BtnFree" /></td></tr>
            <tr><td>
            <asp:Label ID="Label20" runat="server" Text="常用詞庫編輯("></asp:Label><asp:Label ID="lbl_type17" runat="server" Text=")"></asp:Label></td></tr>
            <tr><td><asp:Label ID="Label27" runat="server" Text="搜尋常用詞："></asp:Label></td><td><asp:TextBox ID="TB_UsualWord7" runat="server"></asp:TextBox><asp:Button ID="btn_select7" runat="server" Text="搜尋" OnClick="btn_select7_Click" CssClass="BtnFree"/></td></tr>
                  </table>
            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Sql_test7" PageSize="15" AllowPaging="true" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"  OnRowDataBound="GridView1_OnRowDataBound">
                <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" ItemStyle-Width="200px">
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="單位" ItemStyle-Width="40px">
                        <ItemStyle Width="40px" />
                        <ItemTemplate>
                            <%# Eval("UnitID") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="Unit_DDL3" runat="server" DataSource='<%# Utility.Unitlist.UnitList() %>' SelectedValue='<%# Bind("UnitID") %>'></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
                    <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:CommandField>
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
            <asp:SqlDataSource ID="Sql_test7" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [UsualWord] ([Type], [Content], [Sortnumber]) VALUES (@Type, @Content, @Sortnumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UsualWord] WHERE UnitID is not null ORDER BY Sortnumber ASC" UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content, [UnitID] = @UnitID WHERE [ID] = @original_ID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="Content" Type="String" />
                    <asp:Parameter Name="Sortnumber" Type="Int32" />
                    <asp:Parameter Name="UnitID" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                    <asp:Parameter Name="original_UnitID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
           <div id="tabs-8" style="width:100%">
               <asp:Button ID="Button7" runat="server" Text="全資源搜尋" OnClick="tabs_8_Click" BorderColor="#CC3300" BorderWidth="2px" CssClass="BtnFree" Font-Bold="True" />
               </div>
           <div id="tabs-9" style="width:100%">
             <asp:Table ID="Tbl_User" runat="server" Width="97%"  CssClass="TableCell1">
            <asp:TableHeaderRow ID="THR1" runat="server" Width="100%" Font-Size="Large" BackColor="#97CBFF" >
                <asp:TableHeaderCell ID="THC1" runat="server" Text="私有雲" Width="40%" ></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC2" runat="server" Width="5%"></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC3" runat="server" Text="公有雲" Width="40%" CssClass="TableCell1"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
                    <asp:TableRow ID="TableRow1" runat="server" Width="100%">
                        <asp:TableCell ID="TableCell1" runat="server" Width="40%" >
                            <asp:Label ID="Label10" runat="server" Text="私有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="250px" Height="30px"></asp:TextBox>
                              <asp:Button ID="BtnPrivateS" runat="server" Text="搜尋" OnClick="BtnPrivateS_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="80px"/>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell2" runat="server" Width="5%"></asp:TableCell>
                        <asp:TableCell ID="TableCell3" runat="server" Width="40%">
                            <asp:Label ID="Label24" runat="server" Text="公有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox2" runat="server" Width="250px" Height="30px"></asp:TextBox>
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
                    <asp:Button ID="Btn_AllToPrivate" runat="server" Text="<<" OnClick="Btn_AllToPrivate_Click"  CssClass="BtnFree" ToolTip="全部轉入私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR3" runat="server">
                <asp:TableCell ID="TC22" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_OneToPublic" runat="server" Text=" > " OnClick="Btn_OneToPublic_Click"  CssClass="BtnFree" ToolTip="選取移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR4" runat="server">
                <asp:TableCell ID="TC23" runat="server" HorizontalAlign="Center">
                    <asp:Button ID="Btn_AllToPublic" runat="server" Text=">>" OnClick="Btn_AllToPublic_Click"  CssClass="BtnFree" ToolTip="全部移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
                    
            <asp:TableRow ID="TR5" runat="server" BackColor="#97CBFF" >
                <asp:TableCell ID="TCF" runat="server" ColumnSpan="3" HorizontalAlign="Center">
                    <asp:Button ID="Btn_Allsave" runat="server" Text="儲存" OnClick="Btn_Allsave_Click" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px"/>
                </asp:TableCell>
            </asp:TableRow>
                    </asp:Table>
               </div>
    </div>
    
    <%--     </div>
                              </div>
                    </div>
                </div>
                <!-- /block -->
            </div>
        </div>
    </div>--%>
</asp:Content>