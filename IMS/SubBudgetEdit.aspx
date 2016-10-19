<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="SubBudgetEdit.aspx.cs" Inherits="IMS.SubBudgetEdit" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-分包預算編修</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            border:1px solid  #ECF5FF;
            }
        .auto-style2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: right;
            color: #000000;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
            border:1px solid  #FFFFFF;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
        } 
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
	        color: #000000;
        }  
        
        .auto-style4 {
            width: 100%;
        }
            

        
        .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
            }
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            border:1px solid  #ECF5FF;
            }
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
    border:1px solid  #ECF5FF;
}
.auto-style106 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: right;
	color: #000000;
    border:1px solid  #ECF5FF;
}
        .auto-style107 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: left;
            color: #000000;
            height: 29px;
        }
        .auto-style108 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            height: 29px;
        }
        .auto-style109 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: right;
            color: #000000;
            height: 29px;
        }         

        
        .Table1 {
            width: 100%;
            border:solid;
            border-collapse:collapse;
        }
        .TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E0E0E0;
	text-align: center;
	color: #000000;
}
                


            .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
                        


        .autoLeft{
           text-align:left;
        }
                        


            .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
       
        
            .TableExecute {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFB5B5;
	color: #000000;
}         

        .autoCenter {
            text-align: center;
        }
                                
        

            .autoRight{
           text-align:center;
        }
                


            .autoRight{
           text-align:right;
        }
        
        

            .Table3 {
            width: 100%;
            border-top:solid;
            border-left:solid;
            border-right:solid;
            border-collapse:collapse;
        }
                            

        
        .Table2 {
            width: 100%;
            border-bottom:solid;
            border-left:solid;
            border-right:solid;
        }
                                                    

        
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            height: 25px;
        }
                                                

        
        .auto-style63 {
            width: 100%;
            vertical-align:central;
            border:dashed;
        }
        .auto-style66 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style64 {
            width: 35%;
            vertical-align:central;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
        }
                

                
        </style>

<body>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="5">分包預算編修</td>
		</tr>
		    <tr>
		<td class="auto-style2L" width="40%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td class="auto-style2">
                                執行預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="LbExeTatal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="auto-style2">
                已分包預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="LbSubTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
		    </tr>
		</table>
        <asp:Panel runat="server" ID="panel1" DefaultButton="BtnSearch">
        <table style="width: 100%">
		<tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value=" and NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">有無邀標單</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                            <br />
                                                            <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TxKeyWord" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Op3" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                                <asp:ListItem Value="">-請選擇-</asp:ListItem>
                                                                <asp:ListItem Value="1">有邀標單</asp:ListItem>
                                                                <asp:ListItem Value="0">無邀標單</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                </td>
            </tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" 
                                         AllowPaging="true" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" >
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button38_Click" Text="編修此分包預算"  CommandName="Select" 
                                                      Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"BudgetLockNY"))==1)? false:true %>' CommandArgument='<%# Container.DataItemIndex%>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        
                                            <asp:TemplateField>                                          
                                                <ItemTemplate>
                                                    <%--<asp:Label runat="server" ID="SB_MID" Visible="false"  Text='<%# Bind("SB_MID") %>'></asp:Label>--%>
                                                    <asp:Label runat="server" ID="SBID" Visible="false"  Text='<%# Bind("SBID") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="LbBudgetPrice1" Visible="false" Text='<%# Bind("BudgetPrice") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="LbWorkManName" Visible="false" Text='<%# Bind("WorkManName") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="LbWorkManDep" Visible="false" Text='<%# Bind("WorkManDep") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="ContractWay" Visible="false" Text='<%# Bind("ContractWay") %>'></asp:Label>
                                                </ItemTemplate>
                                               </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算編號">                                          
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Code" Text='<%# Bind("SB_Code") %>'></asp:Label>
                                                </ItemTemplate>
                                                  </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Name" Text='<%# Bind("SB_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="預定進場時間">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookInTime" Text='<%# Bind("BookInTime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="預定完成發包日期" >
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookContractDate" Text='<%# Bind("BookContractDate") %>'></asp:Label>
                                                 </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="最遲完成發包日期">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="LastContractDate" Text='<%# Bind("LastContractDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="預算金額">
                                                <ItemTemplate>
                                                   <asp:Label runat="server" ID="BudgetPrice" Text='<%# Bind("BudgetPrice") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="是否已有邀標單(預算鎖定)" SortExpression="BudgetLockNY">                                            
                                           <%--     <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BudgetLockNY") %>'></asp:TextBox>
                                                </EditItemTemplate>--%>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"BudgetLockNY"))==1)? "是":"否" %>'></asp:Label>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  >
                                      <%--  <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
            </td>
            </tr>
		<tr>
		<td class="auto-style3R">
                                    註：已鎖定之預算，須先刪除邀標單解除鎖定，方能編輯。</td>
            </tr>
		<tr>
	<%--	<td class="auto-style3R">
                                    本表單顯示本專案所有分包預算，預算尚未鎖定者才顯示編輯該項目</td>--%>
            <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
            </tr>
            </table>
            </asp:Panel>
                                    <asp:Panel ID="Pnl_SC" runat="server" BorderStyle="None" Visible="False" DefaultButton="BtnSave">
                                        <table class="auto-style4">
                                            <tr>
                                                <td class="auto-style2">分包預算編號</td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="LbSBID" runat="server" Visible="false" ></asp:Label>
                                                    <asp:TextBox ID="TxSubNum" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px"></asp:TextBox>
                                                </td>
                                                <td class="auto-style2">分包預算名稱</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TxSubItemName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">承攬方式</td>
                                                <td class="auto-style3">
                                                    <asp:DropDownList ID="RadioButtonList1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                                        <asp:ListItem >實做實算</asp:ListItem>
                                                        <asp:ListItem>總價承攬</asp:ListItem>
                                                        <asp:ListItem>實做+總價</asp:ListItem>
                                                        <asp:ListItem>統包</asp:ListItem>
                                                        <asp:ListItem>其他</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="auto-style2">採購負責人</td>
                                                <td class="auto-style3">
                                                    <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="DepartmentName" DataValueField="DepartmentName" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged" Width="120px">
                                                        <asp:ListItem>-請選擇部門-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
                                                    <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="Name" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                                                        <asp:ListItem>-請選擇部門人員-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server"  SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList7" Name="Department" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">預定進場日期</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TxBookInTime" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px" onclick="WdatePicker();"></asp:TextBox>
                                                </td>
                                                <td class="auto-style2">預定完成發包日期</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TxBookContractDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px" onclick="WdatePicker();"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">最遲完成發包期限</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TxLastContractDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px" onclick="WdatePicker();"></asp:TextBox>
                                                </td>
                                                <td class="auto-style2">分包預算金額</td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="LbBudgetPrice" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <table class="auto-style4">
                                            <tr>
                                                <td class="auto-style2" rowspan="2">分包預算工料</td>
                                                <td class="auto-style3">
                                                    <table class="auto-style4">
                                                        <tr>
                                                            <td class="auto-style102">&nbsp;</td>
                                                             <td class="auto-style102">執行項次</td>
                                                            <td class="auto-style102">工料名稱</td>
                                                            <td class="auto-style102">單位</td>                                                           
                                                            <td class="auto-style102">數量</td>
                                                            <td class="auto-style102">預算單價</td>
                                                            <td class="auto-style102">預算複價</td>
                                                        </tr>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                                        <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                                            <ItemTemplate>                                                            
                                                        <tr>
                                                            <td class="auto-style103">
                                                                  <asp:ImageButton ID="BtnDelete" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" CommandName="Delete"  CommandArgument='<%# Container.ItemIndex%>'/>
                                                                <%--<asp:Button ID="BtnDelete" runat="server" Font-Names="微軟正黑體" Text="移除" CommandName="Delete"  CommandArgument='<%# Container.ItemIndex%>' />--%>
                                                            </td>
                                                              <td class="auto-style105">
                                                                <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label>
                                                            </td>
                                                            <td class="auto-style105">
                                                                  <asp:Label runat="server" ID="BKID"  Visible="false"></asp:Label>
                                                                  <asp:Label runat="server" ID="LbSB_MID"  Text='<%# Bind("SB_MID") %>' Visible="false"></asp:Label>
                                                                  <asp:Label runat="server" ID="SBID" Visible="false"  Text='<%# Bind("SBID") %>'></asp:Label>
                                                                <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                                            </td>
                                                            <td class="auto-style103">
                                                                <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                                            </td>
                                                          
                                                            <td class="auto-style106">
                                                                <asp:Label ID="LbQuantity" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "SCNumber") %>'></asp:Label></td>
                                                            <td class="auto-style106">
                                                                <asp:Label ID="LbBPrice" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "UnitPrice") %>' ></asp:Label></td>
                                                            <td class="auto-style106">
                                                                <asp:Label ID="LbBComplex" runat="server" ></asp:Label></td>
                                                        </tr>
                                                                </ItemTemplate>
                                                        </asp:Repeater>
                                                      
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td aria-orientation="horizontal" class="auto-style2R">
                                                                <%--<asp:Button ID="BtnAddSub" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加分包預算工料" OnClick="BtnAddSub_Click" />--%>
                                                                  <asp:ImageButton ID="BtnAddSub" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="增加分包預算工料" Width="27px" OnClick="BtnAddSub_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" colspan="2">
                                                    <asp:Button ID="BtnSave" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" OnClick="BtnSave_Click" />
                                                    &nbsp;&nbsp;
                                                    <asp:Button ID="BtnRecovery" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" OnClick="BtnRecovery_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="BtnDelSub" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除分包預算" OnClick="BtnDelSub_Click" OnClientClick="return confirm('確定刪除嗎?');" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
            </td>
		</tr>
		</table>
    
    </div>

</body>
</html>


    </asp:Content>