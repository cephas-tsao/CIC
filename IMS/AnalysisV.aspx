<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnalysisV.aspx.cs" Inherits="IMS.AnalysisV" %>
   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">


        /*.Table1 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}*/
        .auto-style34A {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: center;
	color: #000000;
}
        /*.Table2 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}*/
        /*.Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table2 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table3 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }*/
        .auto-style34A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 35px;
        }
        /*.Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 35px;
        }*/
        .auto-style72 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 33px;
        }
        .auto-style73 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 33px;
        }
        .auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
	text-align: center;
	color: #FFFFFF;
    }
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
}
.auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    vertical-align:top;
}


        .auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFD2D2;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
            .auto-style74 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: left;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
            </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    

                            <table class="Table100">
                                <tr>
                                     <td class="Table1">項次</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbItemOrder" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="Table1">工項名稱</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="Table1">單位</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="Table1">資源代碼</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="Table1">分析數量</td>
                                    <td class="Table2">
                                        <asp:Label ID="LbAnaNumber" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                </tr>
                                </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" Width="100%" DataKeyNames="uid" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                  <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label runat="server" ID="UID" Text='<%# Bind("UID") %>'></asp:Label>
                  </ItemTemplate>                
              </asp:TemplateField>
                  <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label runat="server" ID="PriceID" Text='<%# Bind("PriceID") %>'></asp:Label>
                  </ItemTemplate>                
              </asp:TemplateField>
              <asp:TemplateField HeaderText="序號" HeaderStyle-Width="3%">
                  <ItemTemplate>
                      <asp:Label runat="server" ID="SortNum" Text='<%# Bind("SortNum") %>'></asp:Label>
                  </ItemTemplate>                
              </asp:TemplateField>             
                <asp:TemplateField HeaderText="工料項目種類" HeaderStyle-Width="7%">  
                  <ItemTemplate>
                      <asp:Label runat="server" ID="Kind" ></asp:Label>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="工料項目名稱"  HeaderStyle-Width="25%">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="ItemName" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="單位"  HeaderStyle-Width="4%">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="單價分析" HeaderStyle-Width="3%">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="Complex1" ImageUrl="~/img/13.gif" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? false:true %>'  Enabled="false"   /><%--ImageUrl="~/img/Ana.jpg" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>'--%>
                        <asp:ImageButton runat="server" ID="Complex" ImageUrl="~/img/Ana.jpg" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>'  CommandArgument='<%# Container.DataItemIndex%>' CommandName="select"  /><%--ImageUrl="~/img/Ana.jpg" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>'--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="資源編碼">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Code" Text='<%# Bind("Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="數量">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Number" Text='<%# Bind("Number") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="原填列單價">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Price" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="原複價">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="CPrice" ></asp:Label>
                    </ItemTemplate>
                      </asp:TemplateField>
                  <asp:TemplateField HeaderText="投標單價">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="BPrice" Text='<%# Bind("BPrice") %>'></asp:Label>
                    </ItemTemplate>
                      </asp:TemplateField>
                 <asp:TemplateField HeaderText="投標複價">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="BCPrice" ></asp:Label>
                    </ItemTemplate>
                      </asp:TemplateField>
                 <asp:TemplateField HeaderText="備註">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Note" Text='<%# Bind("Notes") %>'></asp:Label>
                    </ItemTemplate>
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
                        
    
    </div>

                        <br />

    </form>
</body>
</html>

