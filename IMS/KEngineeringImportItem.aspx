<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KEngineeringImportItem.aspx.cs" Inherits="IMS.KEngineeringImportItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="Table100">
                <tr>
                    <td class="TableTop">
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>檢查項目列表</td>
                </tr>
            </table>
        <table class="Table100">
                <tr>
                     <td class="Table0">
                        <asp:Label ID="Label3" runat="server" Text="Label">施工前</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId"  DataSourceID="SqlAll" AutoGenerateColumns="False" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                 
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
<ItemStyle CssClass="auto-center" HorizontalAlign="Left" ></ItemStyle>
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
                     <td class="Table0">
                        <asp:Label ID="Label4" runat="server" Text="Label">施工中</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView2" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" ForeColor="#333333"  >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    
               
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
                   <asp:BoundField DataField="KEngineeringListItemStandard" HeaderText="檢查標準" SortExpression="檢查標準" ItemStyle-CssClass="auto-center">
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
                     <td class="Table0">
                        <asp:Label ID="Label5" runat="server" Text="Label">施工後</asp:Label>
                       </td>
                </tr>
            </table>
     <asp:GridView ID="GridView3" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListItemId" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" ForeColor="#333333" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                  
               
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

                    <asp:BoundField DataField="KEngineeringListItemStandard" HeaderText="檢查標準" SortExpression="檢查標準" ItemStyle-CssClass="auto-center">
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
    
    </div>
    </form>
</body>
</html>
