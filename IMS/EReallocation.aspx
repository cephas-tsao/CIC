<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EReallocation.aspx.cs" Inherits="IMS.EReallocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSB.css" />
    
</head>
      <script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
     <script type="text/javascript">
         function showProgress() {
             var updateProgress = $get("<%= UpdateProgress.ClientID %>");
             updateProgress.style.display = "block";
         }
         function hideProgress() {
             var updateProgress = $get("<%= UpdateProgress.ClientID %>");
                 updateProgress.style.display = "none";
             }
             window.onbeforeunload = myunload;

             var succeed = false;
             function myunload() {
                 if (succeed == true) {
                     window.event.returnValue = "更新尚未完成，是否離開?";//關閉時,彈出視窗的訊息
                 }
             }
             function addLayerCode() {

                 $.ajax({
                     type: "POST",

                     url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

                     //data: { "uid": uid },

                     dataType: 'text',

                     success: function (msg) {

                         alert("更新成功");

                     }
                 })
             }
             function addLayerCode1() {

                 $.ajax({
                     type: "POST",

                     url: '../Ajax/AddEBLayerCode.aspx?action=addsave',

                     //data: { "uid": uid },

                     dataType: 'text',

                     success: function (UpdtItemOrder) {

                         $.ajax({
                             type: "POST",

                             url: '../Ajax/UpdateItemOrder.aspx?action=addsave',

                             //data: { "uid": uid },

                             dataType: 'text',

                             success: function (msg) {

                                 alert("更新成功");

                             }
                         })
                     }
                 })
             }
    </script>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table style="width: 100%">
        <tr>
			<td class="TableTop" colspan="2">執行預算-拆工料</td>
		</tr>
        <tr>
			<td class="Table2C">
        <table style="width: 100%">
		    <tr>
		<td class="Table1">
                                變更次別</td>
            <td class="Table2CC">
                                    <asp:Label ID="LbVersion" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="Table1L" colspan="5">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                上層工項(拆工料母項)</td>
		</tr>
		<tr>
		<td class="Table1">
                                項次</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="LbItemOrder" runat="server" ></asp:Label>
            </td>
            <td class="Table1">
                工項名稱</td>
            <td class="Table2" colspan="3">
                                    <asp:Label ID="LbUPItemName" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="Table1">
                單位</td>
            <td class="Table2" colspan="2">
                                    <asp:Label ID="LbUPUnit" runat="server" Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="Table1">
                數量</td>
            <td class="Table2">
                                    <asp:Label ID="LbUPENumber" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
            <td class="Table1">
                單價</td>
            <td class="Table2">
                                 <asp:Label ID="LbPrice" runat="server" Font-Names="微軟正黑體" ></asp:Label>   </td>
		</tr>
		<tr>
		<td class="TableTop2" colspan="7">
                                下層新增工項(拆工料子項)</td>
		</tr>
		<tr>
		<td class="Table2C" colspan="7">
                                <table class="Sht100">
                                    <tr class="ShtRowTop">
                                        <td class="ShtCellCC">&nbsp;</td>
                                        <td class="ShtCellCC">工項名稱</td>
                                        <td class="ShtCellCC">單位</td>
                                        <td class="ShtCellCC">數量</td>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server"  OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                        <ItemTemplate>                                     
                                    <tr class="ShtRowSingle">
                                        <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton188" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="移除子項" Width="27px" CommandName="Delete"  CommandArgument='<%# Container.ItemIndex%>'/>
                                    <asp:ImageButton ID="ImgUP" runat="server" Height="30px" ImageUrl="~/img/ArrowUP.jpg" ToolTip="上移" Width="27px"  Visible="false" CommandName="Up"  CommandArgument='<%# Container.ItemIndex%>'/>
                                    <asp:ImageButton ID="ImgDown" runat="server" Height="30px" ImageUrl="~/img/ArrowDOWN.jpg" ToolTip="下移" Width="27px"  Visible="false" CommandName="Down"  CommandArgument='<%# Container.ItemIndex%>'/>
                                            </td>
                                        <td class="ShtCellCC">
                                            <asp:Label ID="LbResourceCode" runat="server" Text='<%# Bind("ResourceCode") %>' Visible="false" ></asp:Label>
                                            <asp:TextBox ID="TxItemName" runat="server" CssClass="TBlong" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:DropDownList ID="DDLUnit" runat="server" CssClass="DDLfree" DataSource='<%# Utility.Unitlist.UnitList() %>' Text='<%# Bind("Unit") %>'>
                                                <asp:ListItem>-請選擇-</asp:ListItem>                                         
                                            </asp:DropDownList>
                                        </td>
                                        <td class="ShtCellCC">
                                            <asp:TextBox ID="TxQuantity" runat="server" CssClass="TBshort" Text='<%# Bind("ENumber") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                               </ItemTemplate>
                                    </asp:Repeater>
                               
                                </table>
            </td>
		</tr>
		<tr>
		<td class="Table2R" colspan="7">
                                    <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增子項" Width="27px"  OnClick="ImgAdd_Click" />
                                            </td>
		</tr>
		</table>
            </td>
			<td class="Table2C" width="35%">
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                    <table class="SB_Table_A">
                                        <tr class="SB_RowTop_M">
                                            <td colspan="3">工項引用</td>
                                        </tr>
                                          <tr>
                                    <td class="TableTop2" colspan="3">
                                        <asp:RadioButtonList ID="Radio_Ref" runat="server" OnSelectedIndexChanged="Radio_Ref_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="true">
                                            <asp:ListItem  Value="Private">共用工料庫</asp:ListItem>
                                            <asp:ListItem Value="Execute">執行預算工料庫</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                      <tr>
                                            <td class="SB_Cell1C_A">
                                                <asp:Panel ID="Pnl_Private" runat="server" Visible="false">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A" rowspan="2">搜<br /> 尋</td>
                                                            <td class="SB_Cell0C_A">工料名稱(關鍵字)</td>
                                                            <td class="SB_Cell0C_A" rowspan="2">
                                                                <asp:Button ID="BtnSearchRe" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearchRe_Click" />
                                                                <br />
                                                                <asp:Button ID="BtnReAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px"  OnClick="BtnReAll_Click"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">
                                                                <asp:TextBox ID="TxReItamName" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td class="SB_Cell1C_A" colspan="3">
                                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource1" Width="100%" 
                                                                    AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="5" OnRowCommand="GridView1_RowCommand">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="引用">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowLEFT.jpg" CommandName="Select" Width="27px" CommandArgument='<%# Container.DataItemIndex%>'/>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="工料名稱">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="ItemName" Text='<%# Bind("ItemName") %>' ></asp:Label>
                                                                                <asp:Label runat="server" ID="PriceID" Text='<%# Bind("PriceID") %>' Visible="false"></asp:Label>
                                                                                  
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="單位">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>' ></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                      <%--  <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                                                        <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName" />
                                                                        <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#7C6F57" />
                                                                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#E3EAEB" />
                                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"  SelectCommand="<%=Sql%>"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                              <%--   <tr>
                                            <td class="SB_Cell1C_A">引用</td>                                      
                                            <td class="SB_Cell0C_A">工料名稱</td>
                                            <td class="SB_Cell0C_A">單位</td>                                        
                                           </tr>                   
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand" >
                                            <ItemTemplate>                                          
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px"  CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>'/>
                                            </td>
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="LbPriceID" runat="server" Height="25px"  Font-Names="微軟正黑體" text='<%# DataBinder.Eval(Container.DataItem, "PriceID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="LbItemName" runat="server" Height="25px"  Font-Names="微軟正黑體" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="LbUnit" runat="server"  Font-Names="微軟正黑體" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                </td>
                                     
                                        </tr>
                                                  </ItemTemplate>
                                        </asp:Repeater>
                     </td>
                                                        </tr>--%>
                                                    </table>
                                                </asp:Panel>
          <asp:Panel ID="Pnl_Execute" runat="server" Visible="False">
                                                    <table class="SB_Table_A">
                                                        <tr>
                                                            <td class="SB_Cell0C_A" rowspan="2">搜<br /> 尋</td>
                                                            <td class="SB_Cell0C_A">工料名稱(關鍵字)</td>
                                                            <td class="SB_Cell0C_A" rowspan="2">
                                                                <asp:Button ID="BtnWBSSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnWBSSearch_Click" />
                                                                <br />
                                                                <asp:Button ID="BtnWBSAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnWBSAll_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SB_Cell0C_A">
                                                                <asp:TextBox ID="TxWBSSearch" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td class="SB_Cell1C_A" colspan="3">
                                                                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EWID" DataSourceID="SqlDataSource2" Width="100%" 
                                                                    AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="5" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound">
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="引用">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButton190" runat="server" Height="30px" ImageUrl="~/img/ArrowLEFT.jpg" ToolTip="下移" Width="27px" CommandArgument='<%# Container.DataItemIndex%>' CommandName="Select"/>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                      <%--  <asp:BoundField DataField="EWID" HeaderText="EWID" InsertVisible="False" ReadOnly="True" SortExpression="EWID" Visible="False" />
                                                                        <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName" />
                                                                        <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                                                        <asp:TemplateField HeaderText="工料名稱">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="LbResourceCode" Text='<%# Bind("ResourceCode") %>' Visible="false" ></asp:Label>
                                                                                <asp:Label runat="server" ID="PriceID" Text='<%# Bind("PriceID") %>' Visible="false" ></asp:Label>
                                                                                <asp:Label runat="server" ID="ItemName" Text='<%# Bind("ItemName") %>' ></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="單位">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>' ></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EditRowStyle BackColor="#7C6F57" />
                                                                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                                    <RowStyle BackColor="#E3EAEB" />
                                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="<%=Sql1 %>"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                  <%--      <tr>
                                                        
                                            <td class="SB_Cell1C_A">引用</td>
                                      
                                            <td class="SB_Cell0C_A">工料名稱</td>
                                            <td class="SB_Cell0C_A">單位</td>
                                       
                                        </tr>                                     
                                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater3_ItemCommand" >
                                            <ItemTemplate>                                          
                                        <tr>
                                            <td class="SB_Cell1C_A">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/ArrowLeft.jpg" ToolTip="單項引用" Width="27px"  CommandName="Select"  CommandArgument='<%# Container.ItemIndex%>'/>
                                            </td>
	
		<td class="SB_Cell1L_A">
                                    <asp:Label ID="LbItemName" runat="server" Height="25px"  Font-Names="微軟正黑體" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                </td>
            <td class="SB_Cell1C_A">
                                    <asp:Label ID="LbUnit" runat="server"  Font-Names="微軟正黑體" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                </td>
                                  
                                        </tr>
                                                  </ItemTemplate>
                                        </asp:Repeater>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="SELECT [EWID], [ItemName], [Unit] FROM [EBudget_WBS]"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>--%>
                                                    </table>
                                                </asp:Panel>
                                        <%--    </td>
                                        </tr>
                                        </table>
            </td>
		</tr>--%>
                                                   </table>
        <tr>
			<td class="Table1" colspan="2">
                   <asp:UpdateProgress ID="UpdateProgress"    AssociatedUpdatePanelID="UpdatePanel1"    runat="server">
        <ProgressTemplate>         
   <div id="LoadingImage" style=" background-color: transparent; z-index:999;   position:absolute;   left:45%;  top:55%;" ><img src="../IMG/waiting.gif" /></div>   
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                                    <asp:Button ID="BtnDivide" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分"  OnClick="BtnDivide_Click" OnClientClick="showProgress()"/>
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁"  OnClientClick="window.close()" />
                           </ContentTemplate>
                <Triggers>
                <asp:PostBackTrigger ControlID="BtnDivide" />
                </Triggers>
                    </asp:UpdatePanel>        
                        </td>
		</tr>
		    </table>
    
    </div>
    </form>
</body>
</html>