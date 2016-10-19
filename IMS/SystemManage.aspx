<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SystemManage.aspx.cs" Inherits="IMS.SystemManage" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>系統管理</title>
    <link href="CSS/SystemManage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="JS/UI/external/jquery/jquery.js"></script>
    <script src="JS/UI/jquery-ui.js"></script>
    <link rel="stylesheet" href="CSS/Jquery-ui.theme.css" />
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">
          .TableCell {
	       padding-left:150PX;
	        text-align: center;
	      
        }
 .TableCell1 {
	       margin-right:350PX;
	        text-align: center;
	      
        }
        .auto-style1 {
            color: #CC3300;
        }
    </style>
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
     <table class="Table100">
            <tr>
                <td class="TableTop">系統管理</td>
            </tr>
         </table>
    <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">使用者新增</a></li>
            <li><a href="#tabs-2">使用者管理</a></li>
            <li><a href="#tabs-3">權限管理(使用者導向)</a></li>
            <li><a href="#tabs-4">權限管理(模組功能導向)</a></li>
        </ul>
 
    <div id="tabs-1"  >
          <table class="Table100" >
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label runat="server" Text="新增使用者"></asp:Label>
                    </td></tr></table>
        <table border="1" style="width:100%">
            <tr style="height:40px">
                <td class="Table1">
                    <asp:Label runat="server" Text="所屬公司"></asp:Label></td>
                <td class="Table2LC">
                    <asp:Label ID="lbl_Company" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">
                    <asp:Label runat="server" Text="帳號"></asp:Label></td>
                <td class="Table2LC">
                    <asp:TextBox ID="TB_NewUser" runat="server" CssClass="TBfree" OnTextChanged="TB_NewUser_TextChanged" AutoPostBack="True"></asp:TextBox><span class="auto-style1">*</span><asp:Label ID="Lbl_Error2" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">
                    <asp:Label runat="server" Text="密碼"></asp:Label></td>
                <td class="Table2LC">
                    <asp:TextBox ID="TB_Password" runat="server" CssClass="TBfree"></asp:TextBox><span class="auto-style1">*</span></td>
            </tr>
            <tr>
                <td class="Table1">
                    <asp:Label runat="server" Text="姓名"></asp:Label></td>
                <td class="Table2LC">
                    <asp:TextBox ID="TB_Name" runat="server" CssClass="TBfree"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="Table1">
                    <asp:Label runat="server" Text="電子郵件信箱"></asp:Label></td>
                <td class="Table2LC">
                    <asp:TextBox ID="TB_Email" runat="server" CssClass="TBfree"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="Table1">
                    <asp:Label runat="server" Text="連絡電話"></asp:Label></td>
                <td class="Table2LC">
                    <asp:TextBox ID="TB_Phone1" runat="server" CssClass="TBfree"></asp:TextBox></td>
            </tr>
          <tr>
                    <td class="Table1" colspan="2">
       <asp:Button ID="Btn_NewUser" runat="server" Text="新增" OnClick="Btn_NewUser_Click" CssClass="BtnLargeShort" /><br />
        
                        </td></tr></table>
        <asp:Label ID="Lbl_NU" runat="server"></asp:Label>
    </div>
    <div id="tabs-2" >
          <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="使用者管理"></asp:Label>
                    </td></tr></table>
        <asp:GridView ID="GV_User" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource2" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="Black">
             <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" ShowDeleteButton="True"  >
                <ControlStyle CssClass="BtnFree" />
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:CommandField>
                <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                <asp:BoundField DataField="Username" HeaderText="帳號" ReadOnly="True" SortExpression="Username" >
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password" >
<ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="E-mail" SortExpression="Email" />
                <asp:BoundField DataField="Tel" HeaderText="連絡電話" SortExpression="Tel" />
                <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" Visible="False" />
                <asp:TemplateField HeaderText="帳號狀態" SortExpression="Status">
                    <ItemTemplate>
                        <%# Eval("Status").ToString().Replace(" ","") == "1" ? "啟用" : "禁用" %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDL_Status" CssClass="DDLfree" runat="server" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem Text="啟用" Value="1"></asp:ListItem>
                            <asp:ListItem Text="禁用" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="系統管理員" SortExpression="Admin">
                    <ItemTemplate>
                        <%# Eval("Admin").ToString().Replace(" ","") == "1" ? "是" : "否" %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDL_Admin" CssClass="DDLfree" runat="server" SelectedValue='<%# Bind("Admin") %>'>
                            <asp:ListItem Text="是" Value="1"></asp:ListItem>
                            <asp:ListItem Text="否" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
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

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UserDB] WHERE [UID] = @original_UID" InsertCommand="INSERT INTO [UserDB] ([Username], [Password], [CompanyID], [Status], [Name], [Email], [Tel], [Admin]) VALUES (@Username, @Password, @CompanyID, @Status, @Name, @Emailm, @Tel, @Admin)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserDB]" UpdateCommand="UPDATE [UserDB] SET [Password] = @Password, [Status] = @Status, [Name] = @Name, [Email] = @Email, [Tel] = @Tel, [Admin] = @Admin WHERE [UID] = @original_UID">
            <DeleteParameters>
                <asp:Parameter Name="original_UID" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_CompanyID" Type="Int32" />
                <asp:Parameter Name="original_Status" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Tel" Type="String" />
                <asp:Parameter Name="original_Admin" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="CompanyID" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Admin" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="CompanyID" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Admin" Type="Int32" />
                <asp:Parameter Name="original_UID" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_CompanyID" Type="Int32" />
                <asp:Parameter Name="original_Status" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Tel" Type="String" />
                <asp:Parameter Name="original_Admin" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div id="tabs-3">
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
          <table class="Table100" border="1">
            <tr>
                <td class="Table0" >&nbsp;&nbsp;
        <asp:Label runat="server" Text="權限管理(使用者導向)"></asp:Label></td></tr></table>
         <table class="Table100">
            <tr style="height:40px">
                <td class="Table1">
        <asp:Label runat="server" Text="公司名稱"></asp:Label></td><td class="Table2LC"><asp:Label ID="lbl_Company2" runat="server" Text=""></asp:Label></td></tr>
         <tr>
                <td class="Table1"> <asp:Label runat="server" Text="專案名稱"></asp:Label></td><td class="Table2LC"><asp:DropDownList ID="DDL_Project" CssClass="DDLfree" runat="server" DataSourceID="SqlDataSource3" DataTextField="CodeName" DataValueField="PID" OnSelectedIndexChanged="DDL_Project_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
       </td></tr>
 <tr>
                <td class="Table1">
        <asp:Label runat="server" Text="使用者帳號"></asp:Label></td><td class="Table2LC"><asp:DropDownList ID="DDL_UserSelect" runat="server" DataSourceID="SqlData_User" CssClass="DDLfree" DataTextField="Username" DataValueField="UID" OnSelectedIndexChanged="DDL_UserSelect_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
     
        <asp:SqlDataSource runat="server" ID="SqlData_User"></asp:SqlDataSource></td></tr>
       
        <tr><td class="Table2LC" colspan="2" style="padding-left:400px">
        <asp:Literal ID="Lit_Access" runat="server"></asp:Literal><br /></td></tr>
        <tr>
                <td class="TableTop2" colspan="2"> 
        <input type="checkbox" value="全部選取" onclick='chkall("form1", this)' /><asp:Label ID="Label3" runat="server" Text="模組頁面全部選取"></asp:Label></td>
      </tr>
       <tr><td class="Table2LC" colspan="2" style="padding-left:400px"><asp:PlaceHolder ID="PH_Access" runat="server"></asp:PlaceHolder>
        </td></tr> 
        <tr>  <td class="Table1" colspan="2"><asp:Button ID="Btn_LicenseUpdate" runat="server" Text="更新" OnClick="Btn_LicenseUpdate_Click" CssClass="BtnLargeShort"/> </td></tr> 
        <tr><td><asp:Label ID="Lbl_access_result" runat="server"></asp:Label> </td></tr> 
       <tr><td> <asp:Label ID="lbl_testtest" runat="server" Text=""></asp:Label> </td></tr> 
                </table>
        </div>
        <div id="tabs-4">
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
        <asp:Label ID="Label2" runat="server" Text="權限管理(模組功能導向)"></asp:Label>
                    </td></tr></table>
              <table class="Table100">
            <tr style="height:40px">
                <td class="Table1">      
        <asp:Label runat="server" Text="公司名稱"></asp:Label></td><td class="Table2LC"><asp:Label ID="lbl_Company3" runat="server" Text=""></asp:Label></td></tr>
         <tr>
                <td class="Table1">   
                 <asp:Label runat="server" Text="專案名稱"></asp:Label></td><td class="Table2LC"><asp:DropDownList ID="DDL_Project2" CssClass="DDLfree" runat="server" DataSourceID="SqlDataSource3" DataTextField="CodeName" DataValueField="PID" OnSelectedIndexChanged="DDL_Project2_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        </td></tr>
                   <tr>
                <td class="Table1">
        <asp:Label runat="server" Text="頁面名稱"></asp:Label></td><td class="Table2LC"><asp:DropDownList ID="DDL_Module" CssClass="DDLfree" runat="server" DataSourceID="Sql_DDL_Module" DataTextField="PageName" DataValueField="PageID" OnSelectedIndexChanged="DDL_Module_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

        <asp:SqlDataSource runat="server" ID="Sql_DDL_Module"></asp:SqlDataSource>
      </td></tr>
        <%--<input type="checkbox" value="全部選取" onclick='chkall("form1", this)' /><asp:Label ID="Label1" runat="server" Text="使用者全部選取"></asp:Label>--%>
       <tr><td class="Table2LC" colspan="3" style="padding-left:400px">
        <asp:PlaceHolder ID="PH_Module_User" runat="server"></asp:PlaceHolder></td></tr>
        <%--<asp:Button ID="Btn_LicenseUpdate2" runat="server" Text="更新" OnClick="Btn_LicenseUpdate2_Click" /><br />--%>
      </table>
                   <asp:Table ID="Tbl_User" runat="server" Width="100%"  CssClass="TableCell1">
            <asp:TableHeaderRow ID="THR1" runat="server"  >
                <asp:TableHeaderCell ID="THC1" runat="server" Text="允許名單" Width="100" ></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC2" runat="server" Width="20"></asp:TableHeaderCell>
                <asp:TableHeaderCell ID="THC3" runat="server" Text="拒絕名單" Width="100" CssClass="TableCell1"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow ID="TR1" runat="server">
                <asp:TableCell ID="TC1" runat="server" RowSpan="4" CssClass="TableCell">
                    <asp:ListBox ID="LB_Access" runat="server" Width="300" Height="500"></asp:ListBox>
                </asp:TableCell>
                <asp:TableCell ID="TC20" runat="server">
                    <asp:Button ID="Btn_OneToAccess" runat="server" Text=" < " OnClick="Btn_OneToAccess_Click" />
                </asp:TableCell>
                <asp:TableCell ID="TC3" runat="server" RowSpan="4">
                    <asp:ListBox ID="LB_Unaccess" runat="server" Width="300" Height="500"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR2" runat="server">
                <asp:TableCell ID="TC21" runat="server">
                    <asp:Button ID="Btn_AllToAccess" runat="server" Text="<<" OnClick="Btn_AllToAccess_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR3" runat="server">
                <asp:TableCell ID="TC22" runat="server">
                    <asp:Button ID="Btn_OneToUnaccess" runat="server" Text=" > " OnClick="Btn_OneToUnaccess_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TR4" runat="server">
                <asp:TableCell ID="TC23" runat="server">
                    <asp:Button ID="Btn_AllToUnaccess" runat="server" Text=">>" OnClick="Btn_AllToUnaccess_Click" />
                </asp:TableCell>
            </asp:TableRow>
                    
            <asp:TableRow ID="TR5" runat="server" class="Table1" >
                <asp:TableCell ID="TCF" runat="server" ColumnSpan="3" HorizontalAlign="Center">
                    <asp:Button ID="Btn_Allsave" runat="server" Text="儲存" OnClick="Btn_Allsave_Click" CssClass="BtnLargeShort"/>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        </div>
        </div>
</asp:Content>
