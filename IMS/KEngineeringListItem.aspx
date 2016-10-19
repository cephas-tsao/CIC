<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KEngineeringListItem.aspx.cs" Inherits="IMS.KEngineeringListItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <script type="text/javascript">
        document.getElementById("newtable").style.display = 'none';
    </script>
  </head>
<body>
   <div>
      <form id="form1" runat="server">
       <table class="Table100">
                <tr>
                    <td class="TableTop">
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>檢查項目列表</td>
                </tr>
            </table>
            <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click" >新增檢查項目</asp:LinkButton>
                       </td>
                </tr>
            </table>

    <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible="false">

          <table class="Table100" id="newtable" >
	
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查項目名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="NewKEngineeringListItemName" runat="server"  CssClass="TB500"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
    <!--<tr>
		<td class="Table1" style="height: 22px; width: 306px;">檢查標準</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="NewKEngineeringListItemStandard" runat="server"  CssClass="short"></asp:TextBox>
		<span class="NoteText"></span></td>
	</tr>
              -->
    <tr>
		<td class="Table1" style="height: 22px; width: 306px;">施工階段</td>
		<td class="Table2" style="height: 22px">
		<asp:DropDownList ID="phaseDropDownList" runat="server" CssClass="DDLshort">
            
            <asp:ListItem>施工前</asp:ListItem>
            <asp:ListItem>施工中</asp:ListItem>
            <asp:ListItem>施工後</asp:ListItem>
        </asp:DropDownList>
		
	</tr>
        
	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeMedium" Text="新增檢查項目"  OnClick="SaveAction" />
           		
		</td>
	</tr>
</table>
         </asp:PlaceHolder>
         
          <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" >檢查項目總覽</asp:LinkButton>
                       </td>
                </tr>
            </table>

    <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label3" runat="server" Text="Label">施工前</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId"  DataSourceID="SqlAll" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField  HeaderText="編輯">
                               <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium"  CssClass="button" />
                        <ItemTemplate>                             
                   
                <asp:ImageButton ID="editbutton" runat="server" CausesValidation="False"
                                 CommandName="edit"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Edit.png" 
                                 ToolTip="修改項目名稱" 
                    Height="30px" 
                    Width="27px" />
                             <asp:ImageButton ID="BtnDelete" runat="server" 
                                 CommandName="Delete"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Delete.png" 
                                 ToolTip="刪除項目" 
                        OnClientClick="return confirm('確定刪除嗎?');"
                    Height="30px" 
                    Width="27px" />
                           
                        </ItemTemplate>                       
                   <EditItemTemplate>
                <asp:ImageButton ID="Button2" runat="server" 
                                 CommandName="Update" Text="更新" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Save.png" 
                                 ToolTip="儲存" 
                    Height="30px" 
                    Width="27px" />

                       <asp:ImageButton ID="lbCancelUpdate" runat="server" 
                                 CommandName="Cancel" Text="取消" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Cancel.jpg" 
                                 ToolTip="取消" 
                    Height="30px" 
                    Width="27px" />
            </EditItemTemplate>   
                            
                                 
                                
                              
                               <HeaderStyle Width="100px" />
                               <ItemStyle HorizontalAlign="Center" />
                            
                                 
                                
                              
                    </asp:TemplateField>     
                         
                  
                  <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# Eval("KEngineeringListId")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>         
                    <asp:TemplateField HeaderText="編號" Visible="false">
                        <ItemTemplate>
             <%#GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
           </ItemTemplate>
           <HeaderStyle Wrap="False"  />
            <ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="KEngineeringListItemId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KEngineeringListItemName" HeaderText="檢查項目" SortExpression="檢查項目" ItemStyle-CssClass="auto-center">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>

                     <asp:BoundField DataField="KEngineeringListItemStandard" HeaderText="檢查標準" SortExpression="檢查標準" ItemStyle-CssClass="auto-center"  Visible="false">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                   
                </Columns> <EmptyDataRowStyle BackColor="#CC3300" ForeColor="Yellow" HorizontalAlign="Center" Font-Names="微軟正黑體" Font-Size="X-Large" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

          <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label4" runat="server" Text="Label">施工中</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView2" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView2_RowCommand" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField  HeaderText="編輯">
                               <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium"  CssClass="button" />
                        <ItemTemplate>                             
                   
                <asp:ImageButton ID="editbutton" runat="server" CausesValidation="False"
                                 CommandName="edit"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Edit.png" 
                                 ToolTip="修改項目名稱" 
                    Height="30px" 
                    Width="27px" />
                             <asp:ImageButton ID="BtnDelete" runat="server" 
                                 CommandName="Delete"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Delete.png" 
                                 ToolTip="刪除項目" 
                        OnClientClick="return confirm('確定刪除嗎?');"
                    Height="30px" 
                    Width="27px" />
                           
                        </ItemTemplate>                       
                   <EditItemTemplate>
                <asp:ImageButton ID="Button2" runat="server" 
                                 CommandName="Update" Text="更新" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Save.png" 
                                 ToolTip="儲存" 
                    Height="30px" 
                    Width="27px" />

                       <asp:ImageButton ID="lbCancelUpdate" runat="server" 
                                 CommandName="Cancel" Text="取消" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Cancel.jpg" 
                                 ToolTip="取消" 
                    Height="30px" 
                    Width="27px" />
            </EditItemTemplate>                       
                               <HeaderStyle Width="100px" />
                               <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField> 
               
                  <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# Eval("KEngineeringListId")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>         
                    <asp:TemplateField HeaderText="編號" Visible="false">
                        <ItemTemplate>
             <%#GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
           </ItemTemplate>
           <HeaderStyle Wrap="False"  />
            <ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="KEngineeringListItemId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KEngineeringListItemName" HeaderText="檢查項目" SortExpression="檢查項目" ItemStyle-CssClass="auto-center">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>

                     <asp:BoundField DataField="KEngineeringListItemStandard" HeaderText="檢查標準" SortExpression="檢查標準" ItemStyle-CssClass="auto-center"  Visible="false">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                   
                </Columns> <EmptyDataRowStyle BackColor="#CC3300" ForeColor="Yellow" HorizontalAlign="Center" Font-Names="微軟正黑體" Font-Size="X-Large" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

          <table class="Table100">
                <tr>
                     <td class="TableTop2">
                        <asp:Label ID="Label5" runat="server" Text="Label">施工後</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView3" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView3_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField  HeaderText="編輯">
                               <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium"  CssClass="button" />
                        <ItemTemplate>                             
                   
                <asp:ImageButton ID="editbutton" runat="server" CausesValidation="False"
                                 CommandName="edit"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Edit.png" 
                                 ToolTip="修改項目名稱" 
                    Height="30px" 
                    Width="27px" />
                             <asp:ImageButton ID="BtnDelete" runat="server" 
                                 CommandName="Delete"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Delete.png" 
                                 ToolTip="刪除項目" 
                        OnClientClick="return confirm('確定刪除嗎?');"
                    Height="30px" 
                    Width="27px" />
                           
                        </ItemTemplate>                       
                   <EditItemTemplate>
               <asp:ImageButton ID="Button2" runat="server" 
                                 CommandName="Update" Text="更新" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Save.png" 
                                 ToolTip="儲存" 
                    Height="30px" 
                    Width="27px" />

                       <asp:ImageButton ID="lbCancelUpdate" runat="server" 
                                 CommandName="Cancel" Text="取消" CommandArgument='<%# Container.DataItemIndex%>'
                                 ImageUrl="~/IMG/Cancel.jpg" 
                                 ToolTip="取消" 
                    Height="30px" 
                    Width="27px" />
            </EditItemTemplate>                       
                               <HeaderStyle Width="100px" />
                               <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField> 
               
                  <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# Eval("KEngineeringListId")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>         
                    <asp:TemplateField HeaderText="編號" Visible="false">
                        <ItemTemplate>
             <%#GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
           </ItemTemplate>
           <HeaderStyle Wrap="False"  />
            <ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="KEngineeringListItemId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KEngineeringListItemName" HeaderText="檢查項目" SortExpression="檢查項目" ItemStyle-CssClass="auto-center">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>

                     <asp:BoundField DataField="KEngineeringListItemStandard" HeaderText="檢查標準" SortExpression="檢查標準" ItemStyle-CssClass="auto-center"  Visible="false">
<ItemStyle CssClass="auto-center" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                   
                </Columns> <EmptyDataRowStyle BackColor="#CC3300" ForeColor="Yellow" HorizontalAlign="Center" Font-Names="微軟正黑體" Font-Size="X-Large" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
      <asp:SqlDataSource ID="SqlAll" runat="server"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
    
    
    </form>
       </div>
</body>
</html>
