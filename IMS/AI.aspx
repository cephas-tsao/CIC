<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI.aspx.cs" Inherits="IMS.AI" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/AI.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>人工智慧推論</title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<Area:MemberBoxUC ID="MemberBox" runat="server" />   

  <div >
        <table class="Table100">
            <tr>
                <td class="TableTop">
                    人工智慧推論模式列表
                </td>
            </tr>
            <tr>
                <td class="Table2C">
                                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AIid" DataSourceID="SqlDataSource1" Width="100%" 
                                            ForeColor="#333333" GridLines="Horizontal">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
<%--                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CssClass="BtnFree"  Text="資料檢視" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="AIid" Text='<%# DataBinder.Eval(Container.DataItem, "AIid") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="人工智慧推論模式名稱">
                                       <ItemTemplate >
                                           <asp:Label ID="AIName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AIName") %>'></asp:Label>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="影響因子數">
                                        <ItemTemplate>
                                            <asp:Label ID="ParamentNum" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ParamentNum") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField >                        
                          
                                  
                             
                                    <asp:TemplateField HeaderText="模式最後更新時間">
                                        <ItemTemplate>
                                            <asp:Label ID="ParamentNum" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UpdateTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                          
                                  
                             
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT [AIid], [AIName], [gamma], [C], [ParamentNum],[UpdateTime] FROM AI_Module order by [Sequ]"></asp:SqlDataSource>
                                    </td>
            </tr>
        </table>
        
    </div>     

    
</asp:Content>