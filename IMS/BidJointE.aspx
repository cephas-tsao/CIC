<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidJointE.aspx.cs" Inherits="IMS.BidJointE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop">共同投標廠商管理</td>
            </tr>
            <tr>
                <td class="Table0">
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_Add" runat="server" ForeColor="White" OnClick="LBtn_Add_Click">新增共同投標廠商</asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <table class="Table100">
                <tr>
                    <td class="Table1">廠商名稱</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DropDownList9" runat="server" CssClass="DDLlong" DataTextField="Name" DataValueField="Uid" DataSourceID="SqlDataSource2">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                    </td>
                    <td class="Table1">共同投標項目</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxJBItem" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">共同投標金額</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxJBPrice" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1" colspan="2">
                        <asp:Button ID="add" runat="server" CssClass="BtnFree" Text="確定新增" OnClick="add_Click" />
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" CssClass="BtnFree" Text="全部清空" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_Add0" runat="server" ForeColor="White">共同投標廠商清單</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2LC">
			<asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JBID" DataSourceID="SqlDataSource1" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"  Width="100%">
<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				<Columns>
					   <asp:TemplateField ShowHeader="False"  ItemStyle-Width="100px">         
                   <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  CommandArgument='<%# Container.DataItemIndex%>' Text="編輯" />
                </ItemTemplate>
               	<ControlStyle Font-Names="微軟正黑體" Font-Size="Small" CssClass="BtnFree" />    
                   <EditItemTemplate>
                <asp:Button ID="lbUpdate" runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex%>' Text="更新"></asp:Button>                |
                <asp:Button ID="lbCancelUpdate" runat="server" CommandArgument='<%# Container.DataItemIndex%>'  CommandName="Cancel" Text="取消"></asp:Button>
            </EditItemTemplate>              
            </asp:TemplateField>  
                           <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex%>' CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" />
                </ItemTemplate>
             	<ItemStyle Width="100px" CssClass="BtnFree" />
            </asp:TemplateField>     
					<asp:BoundField DataField="JBID" HeaderText="JBID" InsertVisible="False" ReadOnly="True" SortExpression="JBID" Visible="False">
					</asp:BoundField>
					  <asp:TemplateField HeaderText="共同投標廠商名稱" ItemStyle-Width="250px"> 
                     <ItemTemplate>
                        <span style="padding-left:100px"><%# Eval("共同投標廠商名稱") %>    </span>                       
                    </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:DropDownList id="Name" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" runat="server" SelectedValue='<%# Bind("FID") %>' ></asp:DropDownList>                           
                        </EditItemTemplate>          
                          </asp:TemplateField>				
                    <asp:TemplateField HeaderText="共同投標項目" ItemStyle-Width="250px">
                    <ItemTemplate>
                       <span style="padding-left:100px"> <%# Eval("共同投標項目") %></span>                  
                    </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox id="JBItem" runat="server" Text='<%# Bind("共同投標項目") %>' ></asp:TextBox>
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="共同投標金額" ItemStyle-Width="250px">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="JBPrice" Text='<%# Eval("共同投標金額") %>'></asp:Label>                        
                    </ItemTemplate>     
                         <EditItemTemplate>
                             <asp:TextBox id="JBPrice" runat="server" Text='<%# Bind("共同投標金額") %>' ></asp:TextBox>
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
			    </td>
            </tr>
        </table>
    
    </div>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" >
			</asp:SqlDataSource>
    </form>
</body>
</html>