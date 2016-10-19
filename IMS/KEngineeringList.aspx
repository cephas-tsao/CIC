<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KEngineeringList.aspx.cs" Inherits="IMS.KEngineeringList" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/KCheckMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>自主檢查表管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
   <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
   <style type="text/css">
          .auto-center {          
	        text-align:center;
	       
            } 
          .auto-left {          
	        text-align:left;
	       
            } 
          .table1 {
         padding-left:200px;
         }
            .auto-style0 {
	            width:100%;
            }
            .auto-style1 {
	            font-family: 微軟正黑體;
	            font-size: large;
	            background-color: #800000;
	            text-align: center;
	            color: #FFFFFF;
            }
            .auto-style3 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFF99;
	            text-align: center;
	            color: #000000;
                height:30px;
                width:200px;
            }
            .auto-style4 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: left;
	            color: #000000;
            }
            .auto-style7 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                width: 306px;
                height: 21px;
            }
            .auto-style8 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                height: 21px;
            }


.center {
	text-align: center;
}
    

                        
            .LBmed {
           
             border-top-right-radius:8px;
             border-top-left-radius:8px;
             text-decoration:none;
             padding-top:10px;
             height:30px;
             width:120px;
             text-align:center;
         } 

            
            </style>
    
    <div>
        <Area:MemberBoxUC ID="MemberBox" runat="server" />  
    <div style="width: 88%; float: right;">
            <table class="Table100">
                <tr>
                    <td class="TableTop">公司樣板管理</td>
                </tr>
            </table>
        <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click1" >公司樣板列表</asp:LinkButton>
                       </td>
                </tr>
            </table>
        <table class="Table100" style="width: 100%">
            <tr>
                <td class="Table1L">
            <asp:ImageButton ID="NewBtn" runat="server" Height="30px" ImageUrl="~/IMG/AddNewItem.png" OnClientClick="window.open('KEngineeringAdd.aspx', 'window', config='height=300,width=600');" ToolTip="新增公司樣板" Width="27px" />
          <%--<asp:ImageButton ID="Reload" runat="server" Height="30px" ImageUrl="~/IMG/Reload.png" ToolTip="重整載入" Width="27px" OnClick="Reload_Click" Visible="False" />--%>
          <asp:ImageButton ID="Import" runat="server" Height="30px" ImageUrl="~/IMG/Enter.jpg" ToolTip="公有雲樣板匯入" Width="27px" OnClientClick="window.open('KEngineeringImport.aspx', 'window', config='height=600,width=600');"  />
            </td>
                    </tr>
                </table>
          


            <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListId" DataSourceID="SqlAll" AllowPaging="True" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField  HeaderText="編輯">
                               <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium"  CssClass="button" />
                        <ItemTemplate>                             
                   <asp:ImageButton ID="ImageButton1" runat="server" 
                                 CommandName="access"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Edit.png" 
                                 ToolTip="編輯檢查項目" 
                     Height="30px" 
                    Width="27px" />


                <asp:ImageButton ID="editbutton" runat="server" CausesValidation="False"
                                 CommandName="edit"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Rename.jpg" 
                                 ToolTip="修改公司樣板名稱" 
                    Height="30px" 
                    Width="27px" />
                             <asp:ImageButton ID="BtnDelete" runat="server" 
                                 CommandName="Delete"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/Delete.png" 
                                 ToolTip="刪除公司樣板" 
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
                    <asp:BoundField DataField="KEngineeringListId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KEngineeringListName" HeaderText="公司樣板" SortExpression="公司樣板" ItemStyle-CssClass="auto-center">
<ItemStyle CssClass="auto-left" HorizontalAlign="Left"></ItemStyle>
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
     
    <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Visible="false">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server" Wrap="False">序號</asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">工程名</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
    </div>
       

        <asp:SqlDataSource ID="SqlAll" runat="server"></asp:SqlDataSource>


</div>
</asp:Content>