<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IllMode.aspx.cs" Inherits="IMS.IllMode" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/IllMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>圖說管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
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
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
     <div>
    <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">新增合約圖說</a></li>
            <li><a href="#tabs-2">變更合約圖說</a></li>
            <li><a href="#tabs-3">查詢合約圖說</a></li>
        </ul>
        <div id="tabs-1">
            <asp:SqlDataSource ID="DocNameSelect" runat="server"></asp:SqlDataSource>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" Text="新增合約圖說"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="工程會編碼："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_PCCNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="圖號："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_DocNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="圖名："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_DocName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="圖說文件上傳："></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="圖說類型："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Type" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="圖說關聯："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Related" Enabled="false" Visible="false" runat="server"></asp:TextBox><asp:TextBox ID="TB_RelatedDoc" Enabled="false" runat="server"></asp:TextBox><asp:DropDownList ID="DDL_DocName" DataSourceID="DocNameSelect" DataTextField="IllustratedDocName" DataValueField="IllustratedDocID" AutoPostBack="true" runat="server"></asp:DropDownList><asp:Button ID="Btn_Add_Related" runat="server" Text="加入關聯" OnClick="Btn_Add_Related_Click" /><asp:Button ID="Btn_Clear_Related" runat="server" Text="清除關聯" OnClick="Btn_Clear_Related_Click" /></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label runat="server" Text="補充說明："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Remark" runat="server" Width="180px" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Btn_upload" runat="server" Text="新增" OnClick="Btn_upload_Click" />
        </div>
        <div id="tabs-2">
            <asp:SqlDataSource ID="Sql_Update" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [IllustratedDoc] WHERE [IllustratedDocID] = @original_IllustratedDocID AND [IllustratedDocFileName] = @original_IllustratedDocFileName AND [IllustratedDocName] = @original_IllustratedDocName AND (([NewDocName] = @original_NewDocName) OR ([NewDocName] IS NULL AND @original_NewDocName IS NULL)) AND [IllustratedDocNumber] = @original_IllustratedDocNumber AND (([PCCNumber] = @original_PCCNumber) OR ([PCCNumber] IS NULL AND @original_PCCNumber IS NULL)) AND [IllustratedDocVersion] = @original_IllustratedDocVersion AND [UploadDateTime] = @original_UploadDateTime AND [UploadUserID] = @original_UploadUserID AND [ProjectCode] = @original_ProjectCode AND [ReferenceID] = @original_ReferenceID AND [TheNewest] = @original_TheNewest AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL)) AND [Type] = @original_Type AND (([RelatedDocID] = @original_RelatedDocID) OR ([RelatedDocID] IS NULL AND @original_RelatedDocID IS NULL))" InsertCommand="INSERT INTO [IllustratedDoc] ([IllustratedDocFileName], [IllustratedDocName], [NewDocName], [IllustratedDocNumber], [PCCNumber], [IllustratedDocVersion], [UploadDateTime], [UploadUserID], [ProjectCode], [ReferenceID], [TheNewest], [Remark], [Type], [RelatedDocID]) VALUES (@IllustratedDocFileName, @IllustratedDocName, @NewDocName, @IllustratedDocNumber, @PCCNumber, @IllustratedDocVersion, @UploadDateTime, @UploadUserID, @ProjectCode, @ReferenceID, @TheNewest, @Remark, @Type, @RelatedDocID)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" UpdateCommand="UPDATE [IllustratedDoc] SET [IllustratedDocName] = @IllustratedDocName, [PCCNumber] = @PCCNumber, [Remark] = @Remark, [Type] = @Type, [RelatedDocID] = @RelatedDocID WHERE [IllustratedDocID] = @original_IllustratedDocID AND [IllustratedDocFileName] = @original_IllustratedDocFileName">
                <DeleteParameters>
                    <asp:Parameter Name="original_IllustratedDocID" Type="Int32" />
                    <asp:Parameter Name="original_IllustratedDocFileName" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocName" Type="String" />
                    <asp:Parameter Name="original_NewDocName" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocNumber" Type="String" />
                    <asp:Parameter Name="original_PCCNumber" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDateTime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadUserID" Type="Int32" />
                    <asp:Parameter Name="original_ProjectCode" Type="String" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_RelatedDocID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IllustratedDocFileName" Type="String" />
                    <asp:Parameter Name="IllustratedDocName" Type="String" />
                    <asp:Parameter Name="NewDocName" Type="String" />
                    <asp:Parameter Name="IllustratedDocNumber" Type="String" />
                    <asp:Parameter Name="PCCNumber" Type="String" />
                    <asp:Parameter Name="IllustratedDocVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDateTime" Type="DateTime" />
                    <asp:Parameter Name="UploadUserID" Type="Int32" />
                    <asp:Parameter Name="ProjectCode" Type="String" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="RelatedDocID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IllustratedDocFileName" Type="String" />
                    <asp:Parameter Name="IllustratedDocName" Type="String" />
                    <asp:Parameter Name="NewDocName" Type="String" />
                    <asp:Parameter Name="IllustratedDocNumber" Type="String" />
                    <asp:Parameter Name="PCCNumber" Type="String" />
                    <asp:Parameter Name="IllustratedDocVersion" Type="Int32" />
                    <asp:Parameter Name="UploadDateTime" Type="DateTime" />
                    <asp:Parameter Name="UploadUserID" Type="Int32" />
                    <asp:Parameter Name="ProjectCode" Type="String" />
                    <asp:Parameter Name="ReferenceID" Type="Int32" />
                    <asp:Parameter Name="TheNewest" Type="Boolean" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="Type" Type="String" />
                    <asp:Parameter Name="RelatedDocID" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocID" Type="Int32" />
                    <asp:Parameter Name="original_IllustratedDocFileName" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocName" Type="String" />
                    <asp:Parameter Name="original_NewDocName" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocNumber" Type="String" />
                    <asp:Parameter Name="original_PCCNumber" Type="String" />
                    <asp:Parameter Name="original_IllustratedDocVersion" Type="Int32" />
                    <asp:Parameter Name="original_UploadDateTime" Type="DateTime" />
                    <asp:Parameter Name="original_UploadUserID" Type="Int32" />
                    <asp:Parameter Name="original_ProjectCode" Type="String" />
                    <asp:Parameter Name="original_ReferenceID" Type="Int32" />
                    <asp:Parameter Name="original_TheNewest" Type="Boolean" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_RelatedDocID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="Gv_Update" runat="server" DataSourceID="Sql_Update" AutoGenerateColumns="False" DataKeyNames="IllustratedDocID" OnRowCommand="Gv_Update_RowCommand" OnRowEditing="Gv_Update_RowEditing" OnRowUpdated="Gv_Update_RowUpdated">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="IllustratedDocID" HeaderText="IllustratedDocID" InsertVisible="False" ReadOnly="True" SortExpression="IllustratedDocID" Visible="False" />
                    <asp:BoundField DataField="IllustratedDocFileName" HeaderText="圖說檔案名" SortExpression="IllustratedDocFileName" ReadOnly="True"/>
                    <asp:BoundField DataField="IllustratedDocName" HeaderText="圖說文件名" SortExpression="IllustratedDocName" />
                    <asp:BoundField DataField="NewDocName" HeaderText="NewDocName" SortExpression="NewDocName" Visible="False" />
                    <asp:BoundField DataField="IllustratedDocNumber" HeaderText="圖號" SortExpression="IllustratedDocNumber" />
                    <asp:BoundField DataField="PCCNumber" HeaderText="工程會編號" SortExpression="PCCNumber" />
                    <asp:BoundField DataField="IllustratedDocVersion" HeaderText="版次" SortExpression="IllustratedDocVersion" ReadOnly="True" />
                    <asp:TemplateField HeaderText="更新檔案" ShowHeader="false" Visible="false">
                        <EditItemTemplate>
                            <asp:FileUpload ID="Fu_UpdateFile" runat="server" />
                            <asp:TextBox ID="TB_UpdateRemark" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            <asp:Button ID="Btn_UpdateFile" runat="server" Text="檔案更新" CommandName="FileUpdate" CommandArgument='<%# Container.DataItemIndex%>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UploadDateTime" HeaderText="圖說上傳時間" SortExpression="UploadDateTime" ReadOnly="True" />
                    <asp:BoundField DataField="UploadUserID" HeaderText="上傳者" SortExpression="UploadUserID" ReadOnly="True" Visible="false" />
                    <asp:TemplateField HeaderText="上傳者">
                        <ItemTemplate>
                            <%# Show_Username_by_UID(Eval("UploadUserID")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                    <asp:CheckBoxField DataField="TheNewest" HeaderText="TheNewest" SortExpression="TheNewest" Visible="False" />
                    <asp:BoundField DataField="Remark" HeaderText="備註" SortExpression="Remark" />
                    <asp:BoundField DataField="Type" HeaderText="文件類型" SortExpression="Type" />
                    <asp:BoundField DataField="RelatedDocID" HeaderText="關聯檔案" SortExpression="RelatedDocID" Visible="false" />
                    <asp:TemplateField HeaderText="關聯圖說">
                        <ItemTemplate>
                            <%# Show_IllustratedDocName_by_IID(Eval("RelatedDocID")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TB_RelatedDocID" Visible="false" Enabled="false" runat="server" Text='<%# Bind("RelatedDocID") %>'></asp:TextBox>
                            <asp:TextBox ID="TB_RelatedDoc" Enabled="false" runat="server" Text='<%# ShowTB_IllustratedDocName_by_IID(Eval("RelatedDocID")) %>' TextMode="MultiLine"></asp:TextBox>
                            <asp:DropDownList ID="DDL_RelatedDoc" runat="server" DataSourceID="DocNameSelect" DataTextField="IllustratedDocName" DataValueField="IllustratedDocID" AutoPostBack="true"></asp:DropDownList>
                            <asp:Button ID="Btn_Add_RelatedDoc" runat="server" Text="新增" CommandName="Add_RelatedDoc" CommandArgument='<%# Container.DataItemIndex%>' />
                            <asp:Button ID="Btn_Clear_RelatedDoc" runat="server" Text="清除" CommandName="Clear" CommandArgument='<%# Container.DataItemIndex%>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="tabs-3">
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="查詢條件"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="工程會編碼："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Query_PCCNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="圖號："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Query_DocNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="圖名："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Query_DocName" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Btn_Query" runat="server" Text="查詢" OnClick="Btn_Query_Click" />
            <asp:SqlDataSource ID="Sql_Query" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="Gv_Query" runat="server" DataSourceID="Sql_Query" AutoGenerateColumns="false" DataKeyNames="IllustratedDocID" OnRowCommand="Gv_Query_RowCommand" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="IllustratedDocName" HeaderText="圖說名稱" />
                    <asp:BoundField DataField="IllustratedDocNumber" HeaderText="圖號" />
                    <asp:BoundField DataField="PCCNumber" HeaderText="工程會編碼" />
                    <asp:BoundField DataField="IllustratedDocVersion" HeaderText="版次" />
                    <asp:TemplateField HeaderText="上傳者">
                        <ItemTemplate>
                            <%# Show_Username_by_UID(Eval("UploadUserID")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UploadDateTime" HeaderText="上傳日期" />
                    <asp:BoundField DataField="Remark" HeaderText="備註說明" />
                    <asp:TemplateField HeaderText="關聯圖說">
                        <ItemTemplate>
                            <%# Show_IllustratedDocName_by_IID(Eval("RelatedDocID")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="下載">
                        <ItemTemplate>
                            <asp:Button ID="Btn_Download" runat="server" CommandArgument='<%# Container.DataItemIndex%>' CommandName="Download" Text="下載" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
         </div>
</asp:Content>
