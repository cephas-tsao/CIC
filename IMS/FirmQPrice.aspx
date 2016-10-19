<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirmQPrice.aspx.cs" Inherits="IMS.FirmQPrice" %>
<%@ Register TagPrefix="Area" TagName="Firm" Src="~/Webcontrol/FirmMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商報價管理</title>
    <style type="text/css">
        
        .auto-style3 {
        }

        .auto-style5 {
            height: 19px;
        }

        .auto-style6 {
            width: 720px;
        }

        .auto-style7 {
            height: 19px;
            width: 720px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<link rel="Stylesheet" type="text/css" href="./CSS/Normal.css" />--%>
               <%--<link href="./CSS/Normal.css" rel="stylesheet" type="text/css" />--%>
      <Area:Firm ID="FirmBox" runat="server" /> 
     <div style="padding-left:200px;">
    <p>
        <asp:Button ID="Btn_Add" runat="server" CssClass="largebutton" Text="新增報價資料" OnClick="Btn_Add_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_AllView" runat="server" CssClass="largebutton" Text="報價資料總覽" OnClick="Btn_AllView_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
    <asp:Button ID="Btn_Back" runat="server" CssClass="largebutton" PostBackUrl="~/FirmMode.aspx" Text="回協力廠商管理模組" />
    </p>
   
    <p align="left">
        <asp:Button ID="Btn_HideSelect" runat="server" CssClass="smallbutton" Text="隱藏搜尋面板" OnClick="Btn_HideSelect_Click" />
        &nbsp;
    </p>

    <asp:Panel ID="PanelSelect" runat="server" HorizontalAlign="Center">
        <table border="1" >
            <tr>
                <td class="auto-style3" colspan="2" align="center">
                    <asp:Label ID="LB_SelectTop" runat="server" CssClass="LBmed" Font-Bold="True" Font-Underline="True" ForeColor="#0000CC" Text="條件搜尋"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" align="left">
                    <asp:Label ID="LB_Select1" runat="server" CssClass="LBmed" Text="報價廠商名稱："></asp:Label>
                    <asp:DropDownList ID="DDL_Select1" runat="server" AppendDataBoundItems="True" CssClass="DDLmiddle" DataTextField="Name" DataValueField="UID" DataSourceID="SqlDataSource3">
                        <asp:ListItem Value=""> 不限廠商 </asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="SELECT DISTINCT * FROM [FirmM]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort">
                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                        <asp:ListItem Value="OR">或</asp:ListItem>
                        <asp:ListItem Value="NOT">非</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" align="left">
                    <asp:Label ID="LB_Select2" runat="server" CssClass="LBmed" Text="工料項目(關鍵字)："></asp:Label>
                    <asp:TextBox ID="TB_Select21" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    <asp:DropDownList ID="DDL_Op2in" runat="server" CssClass="DDLshort">
                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                        <asp:ListItem Value="OR">或</asp:ListItem>
                        <asp:ListItem Value="NOT">非</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TB_Select22" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort">
                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                        <asp:ListItem Value="OR">或</asp:ListItem>
                        <asp:ListItem Value="NOT">非</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" align="left">
                    <asp:Label ID="LB_Select3" runat="server" CssClass="LBmed" Text="價格："></asp:Label>
                    <asp:TextBox ID="TB_Select31" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    <asp:DropDownList ID="DDL_Op3in" runat="server" AutoPostBack="True" CssClass="DDLshort" Width="80px">
                        <asp:ListItem Selected="True" Value="&lt;">以下</asp:ListItem>
                        <asp:ListItem Value="&gt;">以上</asp:ListItem>
                        <asp:ListItem Value="Between">之間</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TB_Select32" runat="server" CssClass="TBmiddle" Visible="False"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLshort">
                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                        <asp:ListItem Value="OR">或</asp:ListItem>
                        <asp:ListItem Value="NOT">非</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="2" align="left">
                    <asp:Label ID="LB_Select4" runat="server" CssClass="LBmed" Text="報價有效期限："></asp:Label>
                    <asp:TextBox ID="TB_Select4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    <asp:ImageButton ID="IBtn_Select4" runat="server" Height="25px" ImageUrl="~/img/calendar.jpg" Width="25px" />
                </td>
            </tr>
            <tr>
                <td align="left" class="auto-style6" colspan="2">
                    <asp:CheckBox ID="CB_Select5" runat="server" CssClass="LBmed" Font-Names="微軟正黑體" Text="不顯示已過期之報價" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Button ID="Btn_SelectGO" runat="server" CssClass="mediumbutton" Text="查詢" OnClick="Btn_SelectGO_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_SelectEmpty" runat="server" CssClass="mediumbutton" Text="條件清空" OnClick="Btn_SelectEmpty_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="LB_Status" runat="server" BackColor="#FFFF99" CssClass="LBmed" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="#0000CC"></asp:Label>
    <asp:Label ID="LB_EmptyData" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="XX-Large" ForeColor="Red" Text="-查無結果-" Visible="False"></asp:Label>
    &nbsp;
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1023px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="詳細">
                <ControlStyle CssClass="smallbutton" />
                <FooterStyle Width="20px" />
                <ItemStyle Width="20px" />
            </asp:CommandField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
            <asp:BoundField DataField="FirmID" HeaderText="FirmID" SortExpression="FirmID" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="報價廠商名稱" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="MItem" HeaderText="工料項目" SortExpression="MItem" />
            <asp:BoundField DataField="Price" HeaderText="價格" SortExpression="Price" />
            <asp:BoundField DataField="ExpiretionDate" HeaderText="報價有效期限" SortExpression="ExpiretionDate" DataFormatString="{0:yyyy/MM/dd}" />
            <asp:BoundField DataField="TransNum" HeaderText="交易數量" SortExpression="TransNum" Visible="False" />
            <asp:BoundField DataField="Distance" HeaderText="運距" SortExpression="Distance" Visible="False" />
            <asp:BoundField DataField="PaymentCondition" HeaderText="付款條件" SortExpression="PaymentCondition" Visible="False" />
            <asp:BoundField DataField="Tax" HeaderText="稅" SortExpression="Tax" Visible="False" />
            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
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
    <asp:SqlDataSource ID="SQLadd3" runat="server" DeleteCommand="DELETE FROM [FirmM] WHERE [UID] = @UID" InsertCommand="INSERT INTO [FirmM] ([Name], [EIN], [Type], [SupportItem], [Owner], [OwnerMobile], [Capital], [StaffAmount], [Location], [Tel1], [Tel2], [Fax1], [Fax2], [Email], [ContectAddress], [RegisteredAddress], [Notes]) VALUES (@Name, @EIN, @Type, @SupportItem, @Owner, @OwnerMobile, @Capital, @StaffAmount, @Location, @Tel1, @Tel2, @Fax1, @Fax2, @Email, @ContectAddress, @RegisteredAddress, @Notes)" SelectCommand="SELECT * FROM [FirmM]" UpdateCommand="UPDATE [FirmM] SET [Name] = @Name, [EIN] = @EIN, [Type] = @Type, [SupportItem] = @SupportItem, [Owner] = @Owner, [OwnerMobile] = @OwnerMobile, [Capital] = @Capital, [StaffAmount] = @StaffAmount, [Location] = @Location, [Tel1] = @Tel1, [Tel2] = @Tel2, [Fax1] = @Fax1, [Fax2] = @Fax2, [Email] = @Email, [ContectAddress] = @ContectAddress, [RegisteredAddress] = @RegisteredAddress, [Notes] = @Notes WHERE [UID] = @UID">
        <DeleteParameters>
            <asp:Parameter Name="UID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EIN" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="SupportItem" Type="String" />
            <asp:Parameter Name="Owner" Type="String" />
            <asp:Parameter Name="OwnerMobile" Type="String" />
            <asp:Parameter Name="Capital" Type="Double" />
            <asp:Parameter Name="StaffAmount" Type="Int32" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Fax1" Type="String" />
            <asp:Parameter Name="Fax2" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContectAddress" Type="String" />
            <asp:Parameter Name="RegisteredAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EIN" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="SupportItem" Type="String" />
            <asp:Parameter Name="Owner" Type="String" />
            <asp:Parameter Name="OwnerMobile" Type="String" />
            <asp:Parameter Name="Capital" Type="Double" />
            <asp:Parameter Name="StaffAmount" Type="Int32" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Fax1" Type="String" />
            <asp:Parameter Name="Fax2" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContectAddress" Type="String" />
            <asp:Parameter Name="RegisteredAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="UID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLadd4" runat="server" SelectCommand="SELECT DISTINCT * FROM [PriceAnalysis]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HeaderText="報價詳細資料" Height="50px" Width="500px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
            <asp:TemplateField HeaderText="報價廠商名稱" SortExpression="Name">
                <EditItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="工料項目" SortExpression="MItem">
                <EditItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("MItem") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("MItem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Price" HeaderText="價格" SortExpression="Price" />
            <asp:TemplateField HeaderText="報價有效期限" SortExpression="ExpiretionDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ExpiretionDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    <asp:ImageButton ID="IBtn_Update1" runat="server" Height="25px" ImageUrl="~/img/calendar.jpg" OnClick="IBtn_Update1_Click" Width="25px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ExpiretionDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TransNum" HeaderText="交易數量" SortExpression="TransNum" />
            <asp:BoundField DataField="Distance" HeaderText="運距" SortExpression="Distance" />
            <asp:BoundField DataField="PaymentCondition" HeaderText="付款條件" SortExpression="PaymentCondition" />
            <asp:BoundField DataField="Tax" HeaderText="稅" SortExpression="Tax" />
            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
            <asp:CommandField ButtonType="Button" EditText="修改" ShowEditButton="True" UpdateText="儲存修正">
                <ControlStyle CssClass="mediumbutton" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#FFFFCC" BorderColor="White" BorderWidth="1px" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="SQLadd1" runat="server" DeleteCommand="DELETE FROM [FirmM] WHERE [UID] = @UID" InsertCommand="INSERT INTO [FirmM] ([Name], [EIN], [Type], [SupportItem], [Owner], [OwnerMobile], [Capital], [StaffAmount], [Location], [Tel1], [Tel2], [Fax1], [Fax2], [Email], [ContectAddress], [RegisteredAddress], [Notes]) VALUES (@Name, @EIN, @Type, @SupportItem, @Owner, @OwnerMobile, @Capital, @StaffAmount, @Location, @Tel1, @Tel2, @Fax1, @Fax2, @Email, @ContectAddress, @RegisteredAddress, @Notes)" SelectCommand="SELECT * FROM [FirmM]" UpdateCommand="UPDATE [FirmM] SET [Name] = @Name, [EIN] = @EIN, [Type] = @Type, [SupportItem] = @SupportItem, [Owner] = @Owner, [OwnerMobile] = @OwnerMobile, [Capital] = @Capital, [StaffAmount] = @StaffAmount, [Location] = @Location, [Tel1] = @Tel1, [Tel2] = @Tel2, [Fax1] = @Fax1, [Fax2] = @Fax2, [Email] = @Email, [ContectAddress] = @ContectAddress, [RegisteredAddress] = @RegisteredAddress, [Notes] = @Notes WHERE [UID] = @UID">
        <DeleteParameters>
            <asp:Parameter Name="UID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EIN" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="SupportItem" Type="String" />
            <asp:Parameter Name="Owner" Type="String" />
            <asp:Parameter Name="OwnerMobile" Type="String" />
            <asp:Parameter Name="Capital" Type="Double" />
            <asp:Parameter Name="StaffAmount" Type="Int32" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Fax1" Type="String" />
            <asp:Parameter Name="Fax2" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContectAddress" Type="String" />
            <asp:Parameter Name="RegisteredAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="EIN" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="SupportItem" Type="String" />
            <asp:Parameter Name="Owner" Type="String" />
            <asp:Parameter Name="OwnerMobile" Type="String" />
            <asp:Parameter Name="Capital" Type="Double" />
            <asp:Parameter Name="StaffAmount" Type="Int32" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Fax1" Type="String" />
            <asp:Parameter Name="Fax2" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ContectAddress" Type="String" />
            <asp:Parameter Name="RegisteredAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="UID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HeaderText="新增報價資料" Height="50px" Width="500px" DefaultMode="Insert" Visible="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
            <asp:TemplateField HeaderText="報價廠商名稱" SortExpression="Name">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server" DataSourceID="SQLadd1" DataTextField="Name" DataValueField="UID" SelectedValue='<%# Bind("FirmID") %>'>
                        <asp:ListItem Value=""> 請選擇 </asp:ListItem>
                    </asp:DropDownList>

                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="工料項目" SortExpression="MItem">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("MItem") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" Style="height: 19px" AutoPostBack="True" CssClass="DDLmiddle" DataSourceID="SqlDataSource1" DataTextField="FullNmae" DataValueField="FullNmae" SelectedValue='<%# Bind("MItem") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PriceName + '(' + Unit + ')' AS FullNmae FROM PriceAnalysis"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MItem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Price" HeaderText="價格" SortExpression="Price" />
            <asp:TemplateField HeaderText="報價有效期限" SortExpression="ExpiretionDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ExpiretionDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ExpiretionDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    <asp:ImageButton ID="IBtn_Add1" runat="server" Height="25px" ImageUrl="~/img/calendar.jpg" OnClick="IBtn_Add1_Click" Width="25px" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExpiretionDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TransNum" HeaderText="交易數量" SortExpression="TransNum" />
            <asp:BoundField DataField="Distance" HeaderText="運距" SortExpression="Distance" />
            <asp:BoundField DataField="PaymentCondition" HeaderText="付款條件" SortExpression="PaymentCondition" />
            <asp:BoundField DataField="Tax" HeaderText="稅" SortExpression="Tax" />
            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
            <asp:CommandField ButtonType="Button" InsertText="儲存新增" ShowInsertButton="True">
                <ControlStyle CssClass="mediumbutton" />
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle BackColor="#FFFFCC" BorderColor="White" BorderWidth="1px" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [FirmQPrice] WHERE [UID] = @UID" InsertCommand="INSERT INTO [FirmQPrice] ([FirmID], [MItem], [Price], [ExpiretionDate], [TransNum], [Distance], [PaymentCondition], [Tax], [Notes]) VALUES (@FirmID, @MItem, @Price, @ExpiretionDate, @TransNum, @Distance, @PaymentCondition, @Tax, @Notes)" SelectCommand="SELECT FirmQPrice.UID, FirmQPrice.FirmID, FirmQPrice.MItem, FirmQPrice.Price, FirmQPrice.ExpiretionDate, FirmQPrice.TransNum, FirmQPrice.Distance, FirmQPrice.PaymentCondition, FirmQPrice.Tax, FirmQPrice.Notes, FirmM.Name FROM FirmQPrice INNER JOIN FirmM ON FirmQPrice.FirmID = FirmM.UID ORDER BY FirmQPrice.ExpiretionDate" UpdateCommand="UPDATE [FirmQPrice] SET [FirmID] = @FirmID, [MItem] = @MItem, [Price] = @Price, [ExpiretionDate] = @ExpiretionDate, [TransNum] = @TransNum, [Distance] = @Distance, [PaymentCondition] = @PaymentCondition, [Tax] = @Tax, [Notes] = @Notes WHERE [UID] = @UID">
        <DeleteParameters>
            <asp:Parameter Name="UID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirmID" Type="Int32" />
            <asp:Parameter Name="MItem" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ExpiretionDate" />
            <asp:Parameter Name="TransNum" Type="String" />
            <asp:Parameter Name="Distance" Type="String" />
            <asp:Parameter Name="PaymentCondition" Type="String" />
            <asp:Parameter Name="Tax" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirmID" Type="Int32" />
            <asp:Parameter Name="MItem" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ExpiretionDate" />
            <asp:Parameter Name="TransNum" Type="String" />
            <asp:Parameter Name="Distance" Type="String" />
            <asp:Parameter Name="PaymentCondition" Type="String" />
            <asp:Parameter Name="Tax" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="UID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSelect" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [FirmQPrice] WHERE [UID] = @original_UID AND (([FirmID] = @original_FirmID) OR ([FirmID] IS NULL AND @original_FirmID IS NULL)) AND (([MItem] = @original_MItem) OR ([MItem] IS NULL AND @original_MItem IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([ExpiretionDate] = @original_ExpiretionDate) OR ([ExpiretionDate] IS NULL AND @original_ExpiretionDate IS NULL)) AND (([TransNum] = @original_TransNum) OR ([TransNum] IS NULL AND @original_TransNum IS NULL)) AND (([Distance] = @original_Distance) OR ([Distance] IS NULL AND @original_Distance IS NULL)) AND (([PaymentCondition] = @original_PaymentCondition) OR ([PaymentCondition] IS NULL AND @original_PaymentCondition IS NULL)) AND (([Tax] = @original_Tax) OR ([Tax] IS NULL AND @original_Tax IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL))" InsertCommand="INSERT INTO [FirmQPrice] ([FirmID], [MItem], [Price], [ExpiretionDate], [TransNum], [Distance], [PaymentCondition], [Tax], [Notes]) VALUES (@FirmID, @MItem, @Price, @ExpiretionDate, @TransNum, @Distance, @PaymentCondition, @Tax, @Notes)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT FirmQPrice.UID, FirmQPrice.FirmID, FirmQPrice.MItem, FirmQPrice.Price, FirmQPrice.ExpiretionDate, FirmQPrice.TransNum, FirmQPrice.Distance, FirmQPrice.PaymentCondition, FirmQPrice.Tax, FirmQPrice.Notes, FirmM.Name FROM FirmQPrice INNER JOIN FirmM ON FirmQPrice.FirmID = FirmM.UID WHERE (FirmQPrice.UID = @UID)" UpdateCommand="UPDATE [FirmQPrice] SET [FirmID] = @FirmID, [MItem] = @MItem, [Price] = @Price, [ExpiretionDate] = @ExpiretionDate, [TransNum] = @TransNum, [Distance] = @Distance, [PaymentCondition] = @PaymentCondition, [Tax] = @Tax, [Notes] = @Notes WHERE [UID] = @original_UID">
        <DeleteParameters>
            <asp:Parameter Name="original_UID" Type="Int32" />
            <asp:Parameter Name="original_FirmID" Type="Int32" />
            <asp:Parameter Name="original_MItem" Type="String" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_ExpiretionDate" />
            <asp:Parameter Name="original_TransNum" Type="String" />
            <asp:Parameter Name="original_Distance" Type="String" />
            <asp:Parameter Name="original_PaymentCondition" Type="String" />
            <asp:Parameter Name="original_Tax" Type="String" />
            <asp:Parameter Name="original_Notes" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirmID" Type="Int32" />
            <asp:Parameter Name="MItem" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ExpiretionDate" />
            <asp:Parameter Name="TransNum" Type="String" />
            <asp:Parameter Name="Distance" Type="String" />
            <asp:Parameter Name="PaymentCondition" Type="String" />
            <asp:Parameter Name="Tax" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="UID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirmID" Type="Int32" />
            <asp:Parameter Name="MItem" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="ExpiretionDate" />
            <asp:Parameter Name="TransNum" Type="String" />
            <asp:Parameter Name="Distance" Type="String" />
            <asp:Parameter Name="PaymentCondition" Type="String" />
            <asp:Parameter Name="Tax" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="original_UID" Type="Int32" />
            <asp:Parameter Name="original_FirmID" Type="Int32" />
            <asp:Parameter Name="original_MItem" Type="Int32" />
            <asp:Parameter Name="original_Price" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_ExpiretionDate" />
            <asp:Parameter Name="original_TransNum" Type="String" />
            <asp:Parameter Name="original_Distance" Type="String" />
            <asp:Parameter Name="original_PaymentCondition" Type="String" />
            <asp:Parameter Name="original_Tax" Type="String" />
            <asp:Parameter Name="original_Notes" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
