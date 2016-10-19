<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KCheckListH.aspx.cs" Inherits="IMS.KCheckListH" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/WebControl/KCheckMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>自主檢查表檢視</title>
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
                    <td class="TableTop">自主檢查表檢視</td>
                </tr>
            </table>
        <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White"  >自主檢查表列表</asp:LinkButton>
                       </td>
                </tr>
            </table>
       <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KCheckListTimeId" DataSourceID="SqlCheckList" AllowPaging="True" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# Eval("KCheckListTimeId")%>' Visible="false"></asp:Label>
                                <asp:Label runat="server" ID="datetime" Text='<%# Eval("DateTime")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>         
                    <asp:TemplateField HeaderText="編號" Visible="false">
                        <ItemTemplate>
             <%#GridView1.PageIndex * GridView1.PageSize + GridView1.Rows.Count + 1%>
           </ItemTemplate>
           <HeaderStyle Wrap="False"  />
            <ItemStyle  HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="KCheckListId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KCheckListEngineeringList" HeaderText="自主檢查表" SortExpression="自主檢查表" ItemStyle-CssClass="auto-left">
                    <HeaderStyle HorizontalAlign="Left" />
<ItemStyle CssClass="auto-left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Location" HeaderText="檢查位置" SortExpression="檢查位置" ItemStyle-CssClass="auto-left">
                    <HeaderStyle HorizontalAlign="Left" />
<ItemStyle CssClass="auto-left"></ItemStyle>
                    </asp:BoundField>
                      <asp:BoundField DataField="DateTime" HeaderText="檢查時間" SortExpression="datetime" ItemStyle-CssClass="auto-left">
                    <HeaderStyle HorizontalAlign="Left" />
<ItemStyle CssClass="auto-left"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Person" HeaderText="檢查人員" SortExpression="Person" ItemStyle-CssClass="auto-left">
                    <HeaderStyle HorizontalAlign="Left" />
<ItemStyle CssClass="auto-left"></ItemStyle>
                    </asp:BoundField>
                    
                    
                    <asp:TemplateField HeaderText="自主檢查表檢視">
                        <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="檢查紀錄"  CommandName="history"  CommandArgument='<%# Container.DataItemIndex%>'/>
                    </ItemTemplate>
                        <HeaderStyle Width="175px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="輸出PDF">
                        <ItemTemplate>
                        <asp:ImageButton ID="BtnPDF" runat="server" 
                                 CommandName="createPDF"
                                 CommandArgument="<%# Container.DataItemIndex %>"
                                 ImageUrl="~/IMG/PDF.png" 
                                 ToolTip="輸出PDF" 
                        
                    Height="30px" 
                    Width="27px" />
                    </ItemTemplate>
                                        <HeaderStyle Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>     
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
            <asp:SqlDataSource ID="SqlCheckList" runat="server"></asp:SqlDataSource>
          <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
            
            
            
             </div>

</div>

    </asp:Content>