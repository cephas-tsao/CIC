<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SuperSystemManage.aspx.cs" Inherits="IMS.SuperSystemManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>後台管理頁面</title>
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
    <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs" style="width:100%">
        <ul>
            <li><a href="#tabs-1">公司資料新增</a></li>
            <li><a href="#tabs-2">公司資料修改</a></li>
            <li><a href="#tabs-3">租約管理</a></li>
            <li><a href="#tabs-4">使用者新增</a></li>
            <li><a href="#tabs-5">使用者管理</a></li>
            <li><a href="#tabs-6">權限管理</a></li>
        </ul>
        <div id="tabs-1" style="width:100%">
             <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="新增公司"></asp:Label>
                    </td></tr></table>
            <table border="0" style="width:100%">
            <tr>
                <td class="Table1">
            <asp:Label ID="lbl_SNO" runat="server" Text="請輸入統一編號："></asp:Label></td><td><asp:TextBox ID="TB_SNO" runat="server" AutoPostBack="True" OnTextChanged="TB_SNO_TextChanged"></asp:TextBox><asp:Label ID="Lbl_Error1" runat="server"></asp:Label></td></tr>
            <tr>
                <td class="Table1"><asp:Label ID="lbl_NewCompany" runat="server" Text="請輸入名稱："></asp:Label></td><td><asp:TextBox ID="TB_NewCompany" runat="server"></asp:TextBox></td></tr>
               <tr>
                <td class="Table1"><asp:Label ID="Lbl_BriefCompany" runat="server" Text="請輸入公司簡稱："></asp:Label></td><td><asp:TextBox ID="TB_BCName" runat="server" AutoPostBack="true" OnTextChanged="TB_BCName_TextChanged"></asp:TextBox><asp:Label ID="Lbl_Error4" runat="server"></asp:Label></td></tr>
              <tr>
                <td class="Table1"><asp:Label ID="lbl_DatabaseName" runat="server" Text="請輸入資料庫代碼："></asp:Label></td><td><asp:TextBox ID="TB_DatabaseName" runat="server" AutoPostBack="true" OnTextChanged="TB_DatabaseName_TextChanged"></asp:TextBox><asp:Label ID="Lbl_Error3" runat="server"></asp:Label></td></tr>
              <tr>
                <td class="Table1"><asp:Label ID="lbl_Address" runat="server" Text="聯絡地址："></asp:Label></td><td><asp:TextBox ID="TB_Address" runat="server"></asp:TextBox></td></tr>
              <tr>
                <td class="Table1"><asp:Label ID="lbl_TeleNum" runat="server" Text="聯絡電話："></asp:Label></td><td><asp:TextBox ID="TB_TeleNum" runat="server"></asp:TextBox></td></tr>
              <tr>
                <td class="Table1"><asp:Label ID="lbl_Contact" runat="server" Text="聯絡人："></asp:Label></td><td><asp:TextBox ID="TB_Contact" runat="server"></asp:TextBox></td></tr>
              <tr>
                <td class="Table1"><asp:Label ID="lbl_FaxNum" runat="server" Text="傳真號碼："></asp:Label></td><td><asp:TextBox ID="TB_FaxNum" runat="server"></asp:TextBox></td></tr>
            <td class="Table1" colspan="3" > <asp:Button ID="Btn_NewCompany" runat="server" Text="新增" OnClick="Btn_NewCompany_Click" CssClass="BtnLargeShort"/></td>
           <tr><td> <asp:Label ID="Lbl_NC" runat="server"></asp:Label></td></tr>
           </table>
        </div>
        <div id="tabs-2">
              <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label9" runat="server" Text="公司管理"></asp:Label>
                    </td></tr></table>          
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [CompanyDB]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [CompanyDB] WHERE [CompanyID] = @original_CompanyID AND [CompanyName] = @original_CompanyName AND [DatabaseName] = @original_DatabaseName AND [SerialNo] = @original_SerialNo AND (([ExpiredDate] = @original_ExpiredDate) OR ([ExpiredDate] IS NULL AND @original_ExpiredDate IS NULL))" InsertCommand="INSERT INTO [CompanyDB] ([CompanyName], [DatabaseName], [SerialNo], [ExpiredDate]) VALUES (@CompanyName, @DatabaseName, @SerialNo, @ExpiredDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [CompanyDB] SET [CompanyName] = @CompanyName, [Address] = @Address, [TeleNumber] = @TeleNumber, [Contact] = @Contact, [FaxNumber] = @FaxNumber , [SerialNo] = @SerialNo WHERE [CompanyID] = @original_CompanyID "></asp:SqlDataSource>
            <asp:GridView ID="GV_Company" runat="server" AutoGenerateColumns="False" DataKeyNames="CompanyID" DataSourceID="SqlDataSource1" Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both" RowStyle-Height="30px">
                  <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" InsertVisible="False" ReadOnly="True" SortExpression="CompanyID" Visible="False" />
                    <asp:BoundField DataField="CompanyName" HeaderText="公司名稱" SortExpression="CompanyName" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="DatabaseName" HeaderText="DatabaseName" SortExpression="DatabaseName" Visible="False" />
                    <asp:BoundField DataField="SerialNo" HeaderText="統一編號" SortExpression="SerialNo" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="Address" HeaderText="公司地址" SortExpression="Address" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="TeleNumber" HeaderText="公司電話" SortExpression="TeleNumber" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="Contact" HeaderText="聯絡人" SortExpression="Contact" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="FaxNumber" HeaderText="傳真號碼" SortExpression="FaxNumber" ItemStyle-Width="10%" />
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
            <br />
        </div>
        <div id="tabs-3">
               <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label12" runat="server" Text="租約管理"></asp:Label>
                    </td></tr></table>          
            
                <asp:GridView ID="GV_Rent" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowCommand="GV_Rent_RowCommand" DataKeyNames="TransID" Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both" RowStyle-Height="30px">
                    <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="TransID" HeaderText="TransID" SortExpression="TransID" Visible="False" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="CompanyName" HeaderText="公司名稱" SortExpression="CompanyName" />
                        <asp:BoundField DataField="TrialStart" HeaderText="試用啟始日" SortExpression="TrialStart" />
                        <asp:BoundField DataField="TrialEnd" HeaderText="租約到期日" SortExpression="TrialEnd" />
                        <asp:BoundField DataField="PayDate" HeaderText="繳款日" SortExpression="PayDate" />
                        <asp:BoundField DataField="LicenseStart" HeaderText="租約啟始日" SortExpression="LicenseStart" />
                        <asp:BoundField DataField="LicenseEnd" HeaderText="租約到期日" SortExpression="LicenseEnd" />
                        <asp:ButtonField ButtonType="Button" HeaderText="歷史紀錄查詢" Text="查詢" CommandName="Query" />
                        <asp:ButtonField ButtonType="Button" HeaderText="繳費" Text="繳費" CommandName="Pay" />
                        <asp:TemplateField HeaderText="狀態">
                            <ItemTemplate>
                                <%# Eval("Status").ToString().Replace(" ","") == "1" ? "啟用" : ((Eval("Status").ToString().Replace(" ","") == "0" ? "試用" : "未啟用")) %>
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="select * from USER_Information.dbo.CompanyTransaction join USER_Information.dbo.CompanyDB on CompanyTransaction.CompanyID=CompanyDB.CompanyID"></asp:SqlDataSource>
        </div>
        <div id="tabs-4">
       
               <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label13" runat="server" Text="新增使用者"></asp:Label>
                    </td></tr></table>          
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label2" runat="server" Text="所屬公司："></asp:Label></td>
                    <td class="Table2LC"><asp:DropDownList ID="DDL_CompanyAll" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CompanyID" ></asp:DropDownList>
                        <asp:Label ID="lbl_Company" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr><td class="Table1"><asp:Label ID="Label1" runat="server" Text="是否為管理者："></asp:Label></td><td>
                    <asp:DropDownList ID="ddl_admin" runat="server">
                    <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:DropDownList></td></tr>
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label3" runat="server" Text="帳號名："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_NewUser" runat="server" OnTextChanged="TB_NewUser_TextChanged" AutoPostBack="True"></asp:TextBox><asp:Label ID="Lbl_Error2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label4" runat="server" Text="帳號密碼："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label5" runat="server" Text="姓名："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Name" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label6" runat="server" Text="電子郵件信箱："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Email" runat="server"></asp:TextBox>(發送Email用)</td>
                </tr>
                <tr>
                    <td class="Table1">
                        <asp:Label ID="Label7" runat="server" Text="連絡電話(行動電話)："></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TB_Phone1" runat="server"></asp:TextBox>(發送簡訊用)</td>
                </tr>
           
              <td class="Table1" colspan="3">
            <asp:Button ID="Btn_NewUser" runat="server" Text="新增" OnClick="Btn_NewUser_Click" CssClass="BtnLargeShort"/></td> </table>
            <asp:Label ID="Lbl_NU" runat="server"></asp:Label><br />
        </div>

        <div id="tabs-5">
               <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label15" runat="server" Text="使用者管理"></asp:Label>
                    </td></tr></table>         
            <asp:GridView ID="GV_User" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource2" Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both" RowStyle-Height="30px">
                   <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                    <asp:CommandField ShowEditButton="True" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                    <asp:BoundField DataField="Username" HeaderText="帳號名稱" ReadOnly="True" SortExpression="Username" ItemStyle-Width="110px" />
                    <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password" ItemStyle-Width="110px" />
                    <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" Visible="False" />
                    <asp:TemplateField HeaderText="帳號狀態" SortExpression="Status" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <%# Eval("Status").ToString().Replace(" ","") == "1" ? "啟用" : "禁用" %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDL_Status" runat="server" SelectedValue='<%# Bind("Status") %>'>
                                <asp:ListItem Text="啟用" Value="1"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
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

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UserDB] WHERE [UID] = @original_UID AND [Username] = @original_Username AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND [CompanyID] = @original_CompanyID AND [Status] = @original_Status" InsertCommand="INSERT INTO [UserDB] ([Username], [Password], [CompanyID], [Status]) VALUES (@Username, @Password, @CompanyID, @Status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserDB]" UpdateCommand="UPDATE [UserDB] SET [Password] = @Password, [Status] = @Status WHERE [UID] = @original_UID">
                <DeleteParameters>
                    <asp:Parameter Name="original_UID" Type="Int32" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_CompanyID" Type="Int32" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="CompanyID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="CompanyID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="original_UID" Type="Int32" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_CompanyID" Type="Int32" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div id="tabs-6" style="width:100%">
            <script>
                function chkall(input1, input2) {
                    var objForm = document.forms[input1];
                    var objLen = objForm.length;
                    for (var iCount = 0; iCount < objLen; iCount++) {
                        if (input2.checked == true) {
                            if (objForm.elements[iCount].type == "checkbox") {
                                objForm.elements[iCount].checked = true;
                            }
                        }
                        else {
                            if (objForm.elements[iCount].type == "checkbox") {
                                objForm.elements[iCount].checked = false;
                            }
                        }
                    }
                }
            </script>
             <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label14" runat="server" Text="模組權限管理"></asp:Label>
                    </td></tr></table>         
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="Table1">
            <asp:Label runat="server" Text="公司名稱  ："></asp:Label></td><td><asp:DropDownList ID="DDL_Company" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CompanyID" OnSelectedIndexChanged="DDL_Company_SelectedIndexChanged" AutoPostBack="True">
                     <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                                          </asp:DropDownList></td></tr>
            <tr>
                    <td class="Table1"> <asp:Label runat="server" Text="使用者名稱："></asp:Label></td><td><asp:DropDownList ID="DDL_User" runat="server" DataSourceID="SqlDataSource3" DataTextField="Username" DataValueField="UID" OnSelectedIndexChanged="DDL_User_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                                                                     </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource></td></tr>
           <tr>
                    <td class="Table1">
            <input type="checkbox" value="全部選取" onclick='chkall("form1", this)' /></td><td><asp:Label ID="Label10" runat="server" Text="模組頁面全部選取"></asp:Label></td></tr>
             <tr>
                    <td class="Table1">
            <asp:Label ID="Label11" runat="server" Text="專案搜尋："></asp:Label></td><td><asp:TextBox ID="TB_Project_Search" runat="server"></asp:TextBox><asp:Button ID="Btn_Project_Search" runat="server" Text="搜尋" OnClick="Btn_Project_Search_Click" /></td></tr>
             <tr>
                    <td colspan="3"><asp:Literal ID="Lit_Access" runat="server"></asp:Literal></td></tr>
             <tr>
                    <td colspan="3"><asp:PlaceHolder ID="PH_Access" runat="server"></asp:PlaceHolder></td></tr>
             <tr><td class="Table1" colspan="3">
            <asp:Button ID="Btn_LicenseUpdate" runat="server" Text="更新" OnClick="Btn_LicenseUpdate_Click" CssClass="BtnLargeShort"/></td></tr>
            <tr>
                    <td > <asp:Label ID="Lbl_access_result" runat="server"></asp:Label></td></tr>
             <tr>
                    <td ><asp:Label ID="lbl_testtest" runat="server" Text=""></asp:Label></td></tr>
                </table>
        </div>
    </div>
</asp:Content>
