<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ConIllLibrary.aspx.cs" Inherits="IMS.ConIllLibrary" MaintainScrollPositionOnPostback="True" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Usual.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>施工圖元件庫</title>
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
                            <i class="fa fa-rss"></i>分包商遴選評估(初評)
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
          <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
   <%--  <div style="padding-left:200px">--%>
         
              <table class="Table100">
            <tr>
                <td class="TableTop">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" >施工圖元件管理</asp:LinkButton>
                </td>
            </tr>
            </table>
    <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">施工圖元件下載</a></li>
            <li><a href="#tabs-2">施工圖元件上傳</a></li>
            <li><a href="#tabs-3">施工圖元件管理</a></li>
            <li><a href="#tabs-4">匯入公有雲元件</a></li>
        </ul>

        <div id="tabs-1">
            <table  rules="all"   class="Table100">
                <tr>
                    <td style="width:30%" class="Table1"><asp:Label runat="server" Text="元件名稱："></asp:Label></td><td class="Table2LC"><asp:TextBox ID="TB_Query_Name" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="元件分類："></asp:Label></td><td class="Table2LC"><asp:TextBox ID="TB_Query_Type" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="備註/說明："></asp:Label></td><td class="Table2LC"><asp:TextBox ID="TB_Query_Remark" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
          
          <tr>
                    <td class="Table1" colspan="2">
            <asp:Button ID="Btn_Query" runat="server" Text="查詢" OnClick="Btn_Query_Click" CssClass="BtnFree" Width="100px" Height="30px"/>
                        </td></tr></table>
            <asp:RadioButtonList ID="RBL_Query" runat="server" OnSelectedIndexChanged="RBL_Query_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal" Visible="False">
                <asp:ListItem Text="全元件查詢" Value="0" Selected="True"></asp:ListItem>
              <%--  <asp:ListItem Text="最新元件查詢" Value="1"></asp:ListItem>--%>
            </asp:RadioButtonList>
            <br />
            <asp:GridView ID="Gv_Query" runat="server" DataSourceID="Sql_Query" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ElementID" OnRowCommand="Gv_Query_RowCommand" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="Black">
                  <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ElementID" HeaderText="ElementID" InsertVisible="False" ReadOnly="True" SortExpression="ElementID" Visible="False" />
                   <%-- <asp:BoundField DataField="ElementFileName" HeaderText="ElementFileName" SortExpression="ElementFileName" Visible="False" />--%> 
                          
                    <asp:BoundField DataField="ElementName" HeaderText="元件名稱" SortExpression="ElementName" />
                       <asp:TemplateField HeaderText="元件檔案名">
                        <ItemTemplate>
                            <asp:Label ID="ElementFileName" runat="server"  Text='<%# Bind("ElementFileName") %>'></asp:Label>
                               <asp:Label ID="LbImgName" runat="server"  Text='<%# Bind("ImgName") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>          
                   <%--   <asp:BoundField DataField="ElementFileName" HeaderText="元件檔案名" ReadOnly="True" SortExpression="ElementFileName" />--%>
                   <%-- <asp:BoundField DataField="ElementVersion" HeaderText="版次" SortExpression="ElementVersion" />--%>
                    <asp:BoundField DataField="UploadDatetime" HeaderText="上傳時間" SortExpression="UploadDatetime" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UploadPerson" HeaderText="上傳者" SortExpression="UploadPerson" Visible="false" />
                    <asp:TemplateField HeaderText="上傳者">
                        <ItemTemplate>
                            <%# Show_Username_by_UID(Eval("UploadPerson")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="FunctionID" HeaderText="FunctionID" SortExpression="FunctionID" Visible="False" />
                    <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                    <asp:CheckBoxField DataField="TheNewest" HeaderText="TheNewest" SortExpression="TheNewest" Visible="False" />
                    <asp:BoundField DataField="Remark" HeaderText="備註/說明" SortExpression="Remark" />
                    <asp:BoundField DataField="Type" HeaderText="元件分類" SortExpression="Type" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="下載">
                        <ItemTemplate>
                            <asp:Button ID="Download" runat="server" Text="下載" CommandName="Download" CommandArgument='<%# Container.DataItemIndex%>' CssClass="BtnFree" />
                              <asp:Button ID="Btnview" runat="server" Text="預覽" CommandName="pview" CommandArgument='<%# Container.DataItemIndex%>' CssClass="BtnFree" />
                        </ItemTemplate>
                        <ControlStyle CssClass="BtnFree" />
                        <ItemStyle HorizontalAlign="Center" />
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
            <asp:SqlDataSource ID="Sql_Query" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ConstructionElement] WHERE [ElementID] = @original_ElementID AND [ElementFileName] = @original_ElementFileName AND [ElementName] = @original_ElementName AND [ElementVersion] = @original_ElementVersion AND [UploadDatetime] = @original_UploadDatetime AND [UploadPerson] = @original_UploadPerson AND [FunctionID] = @original_FunctionID AND [ReferenceID] = @original_ReferenceID AND [TheNewest] = @original_TheNewest AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL))" InsertCommand="INSERT INTO [ConstructionElement] ([ElementFileName], [ElementName], [ElementVersion], [UploadDatetime], [UploadPerson], [FunctionID], [ReferenceID], [TheNewest], [Remark], [Type]) VALUES (@ElementFileName, @ElementName, @ElementVersion, @UploadDatetime, @UploadPerson, @FunctionID, @ReferenceID, @TheNewest, @Remark, @Type)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [ConstructionElement]" UpdateCommand="UPDATE [ConstructionElement] SET [ElementFileName] = @ElementFileName, [ElementName] = @ElementName, [ElementVersion] = @ElementVersion, [UploadDatetime] = @UploadDatetime, [UploadPerson] = @UploadPerson, [FunctionID] = @FunctionID, [ReferenceID] = @ReferenceID, [TheNewest] = @TheNewest, [Remark] = @Remark, [Type] = @Type WHERE [ElementID] = @original_ElementID AND [ElementFileName] = @original_ElementFileName AND [ElementName] = @original_ElementName AND [ElementVersion] = @original_ElementVersion AND [UploadDatetime] = @original_UploadDatetime AND [UploadPerson] = @original_UploadPerson AND [FunctionID] = @original_FunctionID AND [ReferenceID] = @original_ReferenceID AND [TheNewest] = @original_TheNewest AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ElementID" Type="Int32" />
                    <asp:Parameter Name="original_ElementFileName" Type="String" />
                    <asp:Parameter Name="original_ElementName" Type="String" />
                    <asp:Parameter Name="original_ElementVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadPerson" Type="Int32" />
                    <asp:Parameter Name="original_FunctionID" Type="Int32" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ElementFileName" Type="String" />
                    <asp:Parameter Name="ElementName" Type="String" />
                    <asp:Parameter Name="ElementVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="UploadPerson" Type="Int32" />
                    <asp:Parameter Name="FunctionID" Type="Int32" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ElementFileName" Type="String" />
                    <asp:Parameter Name="ElementName" Type="String" />
                    <asp:Parameter Name="ElementVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="UploadPerson" Type="Int32" />
                    <asp:Parameter Name="FunctionID" Type="Int32" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="original_ElementID" Type="Int32" />
                    <asp:Parameter Name="original_ElementFileName" Type="String" />
                    <asp:Parameter Name="original_ElementName" Type="String" />
                    <asp:Parameter Name="original_ElementVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadPerson" Type="Int32" />
                    <asp:Parameter Name="original_FunctionID" Type="Int32" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <table><tr><td>
                <asp:Image ID="PreImage" runat="server" /></td></tr></table>
        </div>
        <div id="tabs-2">
            <table rules="all"   class="Table100">
                <tr>
                    <td style="width:30%" class="Table1"><asp:Label runat="server" Text="元件名稱："></asp:Label></td><td class="Table2LC"><asp:TextBox ID="TB_Name" runat="server" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="元件上傳："></asp:Label></td><td class="Table2LC"><asp:FileUpload ID="FileUpload1" runat="server" CssClass="TBfree" /></td>
                </tr>
                    <tr>
                    <td class="Table1"><asp:Label ID="Label1" runat="server" Text="預覽圖檔："></asp:Label></td><td class="Table2LC"><asp:FileUpload ID="FileUpload2" runat="server"  CssClass="TBfree"   />
                        <asp:Label ID="Lbfilename" runat="server"  ></asp:Label><%--<asp:Button ID="Preview" runat="server" Text="預覽" OnClick="Preview_Click" />--%></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="元件分類："></asp:Label></td><td class="Table2LC"><asp:TextBox runat="server" ID="TB_Type" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1"><asp:Label runat="server" Text="備註/說明："></asp:Label></td><td class="Table2LC"><asp:TextBox ID="TB_Remark" runat="server" TextMode="MultiLine" Rows="5" CssClass="TBfree"></asp:TextBox></td>
                </tr>
                <tr><td class="Table1"><asp:Label ID="Label2" runat="server" Text="圖片預覽："></asp:Label></td><td class="Table2LC"> <asp:Image runat="server" ID="img" /></td></tr>
            
          <tr>
                    <td class="Table1" colspan="2">
            <asp:Button ID="Btn_Upload_file" runat="server" Text="上傳" OnClick="Btn_Upload_file_Click" CssClass="BtnFree" Width="100px" Height="30px" />
                        </td></tr></table>
        </div>
        <div id="tabs-3">
            <asp:GridView ID="Gv_Manage" runat="server" DataSourceID="Sql_Manage" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ElementID" OnRowCommand="Gv_Manage_RowCommand" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="Black">
                  <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="BtnFree" ControlStyle-Width="50px" >
<ControlStyle CssClass="BtnFree" Width="50px"></ControlStyle>
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:Button ID="Delete" runat="server" Text="刪除" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex%>' CssClass="BtnFree" OnClientClick="return confirm('確定刪除嗎?');" Width="50px" />                             
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ElementID" HeaderText="ElementID" InsertVisible="False" ReadOnly="True" SortExpression="ElementID" Visible="False" />
                    <asp:BoundField DataField="ElementFileName" HeaderText="元件檔案名" ReadOnly="True" SortExpression="ElementFileName" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ElementName" HeaderText="元件名稱" SortExpression="ElementName" >
                    
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    
                 <%--   <asp:BoundField DataField="ElementVersion" HeaderText="版次" ReadOnly="True" SortExpression="ElementVersion" />--%>
                    <asp:BoundField DataField="UploadDatetime" HeaderText="上傳日期" ReadOnly="True" SortExpression="UploadDatetime" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UploadPerson" HeaderText="UploadPerson" SortExpression="UploadPerson" Visible="False" />
                    <asp:TemplateField HeaderText="上傳者">
                        <ItemTemplate>
                            <%# Show_Username_by_UID(Eval("UploadPerson")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                    <asp:CheckBoxField DataField="TheNewest" HeaderText="TheNewest" SortExpression="TheNewest" Visible="False" />
                    <asp:BoundField DataField="Remark" HeaderText="備註/說明" SortExpression="Remark" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="元件分類" SortExpression="Type" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
               <%--     <asp:TemplateField HeaderText="檔案更新">
                        <ItemTemplate>
                            <asp:FileUpload ID="FU" runat="server" />
                            <asp:Label runat="server" Text="備註："></asp:Label>
                            <asp:TextBox ID="TB_UpdateRemark" runat="server"></asp:TextBox>
                            <asp:Button ID="Btn_Upload" runat="server" Text="更新" CommandName="UpdateFile" CommandArgument='<%# Container.DataItemIndex%>' />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
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
            <asp:SqlDataSource ID="Sql_Manage" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ConstructionElement] WHERE [ElementID] = @original_ElementID AND [ElementFileName] = @original_ElementFileName AND [ElementName] = @original_ElementName AND [ElementVersion] = @original_ElementVersion AND [UploadDatetime] = @original_UploadDatetime AND [UploadPerson] = @original_UploadPerson AND [ReferenceID] = @original_ReferenceID AND [TheNewest] = @original_TheNewest AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL))" InsertCommand="INSERT INTO [ConstructionElement] ([ElementFileName], [ElementName], [ElementVersion], [UploadDatetime], [UploadPerson], [ReferenceID], [TheNewest], [Remark], [Type]) VALUES (@ElementFileName, @ElementName, @ElementVersion, @UploadDatetime, @UploadPerson, @ReferenceID, @TheNewest, @Remark, @Type)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * From ConstructionElement Where TheNewest = 1" UpdateCommand="UPDATE [ConstructionElement] SET [ElementName] = @ElementName, [Remark] = @Remark, [Type] = @Type WHERE [ElementID] = @original_ElementID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ElementID" Type="Int32" />
                    <asp:Parameter Name="original_ElementFileName" Type="String" />
                    <asp:Parameter Name="original_ElementName" Type="String" />
                    <asp:Parameter Name="original_ElementVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadPerson" Type="Int32" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ElementFileName" Type="String" />
                    <asp:Parameter Name="ElementName" Type="String" />
                    <asp:Parameter Name="ElementVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="UploadPerson" Type="Int32" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ElementFileName" Type="String" />
                    <asp:Parameter Name="ElementName" Type="String" />
                    <asp:Parameter Name="ElementVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="UploadPerson" Type="Int32" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="original_ElementID" Type="Int32" />
                    <asp:Parameter Name="original_ElementFileName" Type="String" />
                    <asp:Parameter Name="original_ElementName" Type="String" />
                    <asp:Parameter Name="original_ElementVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDatetime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadPerson" Type="Int32" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div id="tabs-4">
                 <asp:Table ID="Tbl_User" runat="server" Width="97%"  CssClass="TableCell1">
            <asp:TableHeaderRow ID="THR1" runat="server" Width="100%" Font-Size="Large" BackColor="#97CBFF" >
                <asp:TableHeaderCell ID="THC1" runat="server" Text="私有雲" Width="40%" ></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC2" runat="server" Width="5%"></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC3" runat="server" Text="公有雲" Width="40%" CssClass="TableCell1"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
                    <asp:TableRow ID="TableRow1" runat="server" Width="100%">
                        <asp:TableCell ID="TableCell1" runat="server" Width="40%" >
                            <asp:Label ID="Label10" runat="server" Text="私有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="250px" Height="30px"></asp:TextBox>
                              <asp:Button ID="BtnPrivateS" runat="server" Text="搜尋" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="80px" OnClick="BtnPrivateS_Click"/>
                        </asp:TableCell>
                        <asp:TableCell ID="TableCell2" runat="server" Width="5%"></asp:TableCell>
                        <asp:TableCell ID="TableCell3" runat="server" Width="40%">
                            <asp:Label ID="Label24" runat="server" Text="公有雲項目搜尋："></asp:Label><asp:TextBox ID="TextBox2" runat="server" Width="250px" Height="30px"></asp:TextBox>
                              <asp:Button ID="BtnPublicS" runat="server" Text="搜尋" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="80px" OnClick="BtnPublicS_Click"/>
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
            <asp:TableRow ID="TR2" runat="server" HorizontalAlign="Center">
                <asp:TableCell ID="TC21" runat="server">
                    <asp:Button ID="Btn_AllToPrivate" runat="server" Text="<<" OnClick="Btn_AllToPrivate_Click" CssClass="BtnFree" ToolTip="全部轉入私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR3" runat="server" HorizontalAlign="Center">
                <asp:TableCell ID="TC22" runat="server">
                    <asp:Button ID="Btn_OneToPublic" runat="server" Text=" > " OnClick="Btn_OneToPublic_Click" CssClass="BtnFree" ToolTip="選取移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR4" runat="server" HorizontalAlign="Center">
                <asp:TableCell ID="TC23" runat="server">
                    <asp:Button ID="Btn_AllToPublic" runat="server" Text=">>" OnClick="Btn_AllToPublic_Click" CssClass="BtnFree" ToolTip="全部移出私有雲"  />
                </asp:TableCell>
            </asp:TableRow>
                    
            <asp:TableRow ID="TR5" runat="server" BackColor="#97CBFF">
                <asp:TableCell ID="TCF" runat="server" ColumnSpan="3" HorizontalAlign="Center">
                    <asp:Button ID="Btn_Allsave" runat="server" Text="儲存" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px" OnClick="Btn_Allsave_Click"/>
                </asp:TableCell>
            </asp:TableRow>
                    </asp:Table>
            </div>
    </div>
      <%--   </div></div>
                    </div>
                </div>
            </div>
          </div>--%>
   
</asp:Content>
