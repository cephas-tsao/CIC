<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidInfo1.aspx.cs" Inherits="IMS.BidInfo11" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案轉入</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--<link href="../CSS/Main.css" rel="stylesheet" type="text/css" />--%>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
	 <body>
    <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
<div>
    
<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
    <asp:Panel ID="Panel2" runat="server" Visible="true">
	<tr>
		<td class="TableTop">未成案訊息總覽</td>
	</tr>
        <tr>
            <td>	 <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增未成案訊息" Width="27px" OnClick="New_Click"/></td>
        </tr>
	<tr>
		<td>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>            
                    <asp:TemplateField>
                               <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium"  CssClass="button" />
                        <ItemTemplate>                             
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  Text="編輯" CommandArgument='<%# Container.DataItemIndex%>'/>
                </ItemTemplate>                       
                   <EditItemTemplate>
                <asp:Button ID="Button2" runat="server" CommandName="Update" Text="更新" CommandArgument='<%# Container.DataItemIndex%>'></asp:Button>                |
                <asp:Button ID="lbCancelUpdate" runat="server"  CommandName="Cancel" Text="取消" CommandArgument='<%# Container.DataItemIndex%>'></asp:Button>
            </EditItemTemplate>                  
                    </asp:TemplateField>     
                         <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                              <%--   <asp:Button ID="btnEdit" runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex%>' Text="編輯"></asp:Button>  --%>
                                  <asp:Button ID="BtnDelete" runat="server" CommandName="delete" CommandArgument='<%# Container.DataItemIndex%>' Text="刪除" OnClientClick="return confirm('確定刪除嗎?');"></asp:Button>  
                                <asp:Button ID="lbUpdate" runat="server" CommandName="New" CommandArgument='<%# Container.DataItemIndex%>' Text="轉標案"></asp:Button>  
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                    <asp:BoundField DataField="ForecastName" HeaderText="預估名稱" SortExpression="Name">
                           <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                    <asp:BoundField DataField="ForecastPrice" DataFormatString="{0:0,000.##}" HeaderText="預估金額" SortExpression="ForecastPrice">
                       <ItemStyle HorizontalAlign="center" />
                    </asp:BoundField>
                    <asp:TemplateField  HeaderText="預估招標日期">
                           <ItemStyle HorizontalAlign="center" />
                       
                        <ItemTemplate>   <asp:Label ID="LbForecastBiddingDate" runat="server" Text='<%# Eval("ForecastBiddingDate") %>' ></asp:Label></ItemTemplate>
                        <EditItemTemplate>
                     <asp:TextBox id="LbForecastBiddingDate" runat="server" Text='<%# Bind("ForecastBiddingDate")%>' onclick="WdatePicker();" ></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                 
                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes">
                           <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                </Columns>
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
        </td>
	</tr>
    <tr>
		<td class="center">
	<%--	<asp:Button id="New" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增未成案訊息" Width="107px" OnClick="New_Click" />--%>
	
		</td>
	</tr>
        </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
	<tr>
		<td class="TableTop" colspan="2">新增未成案訊息</td>
	</tr>
	<tr>
		<td class="Table1" style="height: 22px; width: 306px;">預估名稱</td>
		<td class="Table2" style="height: 22px">
		<asp:TextBox id="ForecastName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		<span class="auto-style6">(必填)</span></td>
	</tr>

	<tr>
		<td class="Table1" style="width: 306px">預估金額</td>
		<td class="Table2">
		<asp:TextBox id="ForecastPrice" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="Table1" style="width: 306px">預估招標日期</td>
		<td class="Table2">
		<asp:TextBox id="ForecastBiddingDate" runat="server" Height="30px" Width="300px" onclick="WdatePicker();"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="Table1" style="width: 306px">備註</td>
		<td class="Table2">
		<asp:TextBox id="Notes" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="Table1">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定新增" Width="107px" OnClick="add_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="clear" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="全部清空" Width="107px" OnClick="clear_Click"/>
		</td>
	</tr>
        </asp:Panel>
</table>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" >
        <DeleteParameters>
            <asp:Parameter Name="UID" Type="Int32" />
             <asp:Parameter Name="status" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ForecastName" Type="String" />
            <asp:Parameter Name="ForecastPrice" Type="Decimal" />
            <asp:Parameter Name="ForecastBiddingDate" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="status" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ForecastName" Type="String" />
            <asp:Parameter Name="ForecastPrice" Type="Decimal" />
            <asp:Parameter Name="ForecastBiddingDate" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="UID" Type="Int32" />
             <asp:Parameter Name="status" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
         </body>
    </asp:Content>
