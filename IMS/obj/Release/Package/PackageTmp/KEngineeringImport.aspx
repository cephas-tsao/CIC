<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KEngineeringImport.aspx.cs" Inherits="IMS.KEngineeringImport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="Table100">
                <tr>
                    <td class="TableTop">公有雲樣板匯入</td>
                </tr>
            </table>
        <table class="Table100">
               

        <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" GridLines="None" DataKeyNames="KEngineeringListId" DataSourceID="SqlAll" AllowPaging="True" AutoGenerateColumns="False" ForeColor="#333333" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                     <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# Eval("KEngineeringListId")%>' Visible="false" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                    <asp:TemplateField HeaderText="勾選">
                <ItemTemplate>
                    <asp:CheckBox ID="chkCtrl" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>        
                    <asp:BoundField DataField="KEngineeringListId" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="false" />
                    <asp:BoundField DataField="KEngineeringListName" HeaderText="公有雲樣板" SortExpression="公有雲樣板" ItemStyle-CssClass="auto-center">
<ItemStyle CssClass="auto-left" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="檢查項目">
                        <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="檢查項目"  CommandName="item"  CommandArgument='<%# Container.DataItemIndex%>'/>
                    </ItemTemplate>
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
         <asp:SqlDataSource ID="SqlAll" runat="server"></asp:SqlDataSource>
        
             </table>
        <table class="Table100">
                <tr>
                    <td class="Table0">
                        註：換頁前請先匯入已勾選的公有雲樣板
                       </td>
                </tr>
            </table>
         <table  class="Table100">
              <tr>
		<td class="Table1">
		<asp:Button id="Button1" runat="server" CssClass="BtnLargeMedium" Text="公有雲樣板匯入"  OnClick="SaveAction" />
            &nbsp;
		<asp:Button id="BtnBack" runat="server" CssClass="BtnLargeShort" Text="回前頁"  OnClick="BtnBack_Click1"/>
		</td>
	</tr>

            </table>
    </div>
        <asp:Label ID="Label1" runat="server" Visible="False" ></asp:Label><asp:Label ID="Label2" runat="server"  Visible="False"></asp:Label><asp:Label ID="Label3" runat="server"  Visible="False" ></asp:Label><asp:Label ID="Label4" runat="server"  Visible="False"></asp:Label><asp:Label ID="Label5" runat="server"  Visible="False"></asp:Label></asp:Label>
    </form>
</body>
</html>
