<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseView.aspx.cs" MasterPageFile="Site1.Master" Inherits="IMS.PurchaseView"  MaintainScrollPositionOnPostback="true"%>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-採購發包綜合檢視</title>
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
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }     
                        
        
            .auto-style63 {
            width: 100%;
            vertical-align:central;
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
                

                

            .auto-style4 {
            width: 100%;
        }
            

        
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            border:1px solid #FFFFFF;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
            border:1px solid #FFFFFF;
        }
                    

        
        .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
             border:1px solid #FFFFFF;
            }
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            border:1px solid #FFFFFF;
            }
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
    border:1px solid #FFFFFF;
}
.auto-style106 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: right;
	color: #000000;
    border:1px solid #FFFFFF;
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

        
        .auto-style110 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            }
                            

            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
            
        
            .auto-style2A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #5D7B9D;
            text-align: center;
            color: #FFFFFF;
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

<body>

      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">採購發包綜合檢視</td>
		</tr>
		<tr>
		<td class="auto-style3C">
            <asp:Panel runat="server" ID="panel10" DefaultButton="BtnSearch">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Sub" runat="server" AppendDataBoundItems="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="200px">
                                                                <asp:ListItem Value="SB_Name">分包預算名稱(關鍵字)</asp:ListItem>
                                                                <asp:ListItem Value="SC_Name">分包合約名稱(關鍵字)</asp:ListItem>
                                                            </asp:DropDownList>
                                                            </td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">得標廠商</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                            <br />
                                                            <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TxSrSubName" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Firm" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="160px">
                                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"  SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                </asp:Panel>
            </td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                                       OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"   ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button44" runat="server" CssClass="BtnFree" OnClick="Button44_Click" Text="綜合檢視" Font-Names="微軟正黑體" Font-Size="Medium" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SBID"  Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>'   Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="SCID"  Text='<%# DataBinder.Eval(Container.DataItem, "SCID") %>'   Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Code" Text='<%# DataBinder.Eval(Container.DataItem, "SB_Code") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="分包預算名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Name" Text='<%# DataBinder.Eval(Container.DataItem, "SB_Name") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="預定進場時間">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookInTime" Text='<%# DataBinder.Eval(Container.DataItem, "BookInTime") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="預算金額">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BudgetPrice" Text='<%# DataBinder.Eval(Container.DataItem, "BudgetPrice") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="分包合約編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="分包預算編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SC_Code" Text='<%# DataBinder.Eval(Container.DataItem, "SC_Code") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="分包合約名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SC_Name" Text='<%# DataBinder.Eval(Container.DataItem, "SC_Name") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="合約(得標)金額">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="TotalPrice" Text='<%# DataBinder.Eval(Container.DataItem, "TotalPrice") %>'  ></asp:Label>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server">
                                      <%--  <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
    
 
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0" Visible="False">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BackColor="White"  BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BackColor="#D2D2D2"  BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1">分包預算資訊</td>
                            </tr>
                        </table>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style2">分包預算編號</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbSCID" runat="server" Visible="true" ></asp:Label>
                                    <asp:Label ID="LbSB_Code" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算名稱</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbSB_Name" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">承攬方式</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbContractWay" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">採購負責人</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbWorkManName" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style110">預定進場日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBookInTime" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style110">預定完成發包日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBookContractDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">最遲完成發包期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbLastContractDate" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算金額</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBudgetPrice" runat="server" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style2">分包預算工料</td>
                                <td class="auto-style3">
                                    <table class="auto-style4">
                                        <tr>
                                            <td class="auto-style102">工料名稱</td>
                                            <td class="auto-style102">單位</td>
                                            <td class="auto-style102">所屬工項</td>
                                            <td class="auto-style102">數量</td>
                                            <td class="auto-style102">預算單價</td>
                                            <td class="auto-style102">預算複價</td>
                                        </tr>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource6" OnItemDataBound="Repeater1_ItemDataBound">
                                            <ItemTemplate>
                                        <tr>
                                            <td class="auto-style105">
                                                <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>' ></asp:Label>
                                            </td>
                                            <td class="auto-style103">
                                                <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                            </td>
                                            <td class="auto-style105">
                                                <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label>
                                            </td>
                                            <td class="auto-style106">
                                                <asp:Label ID="LbQuantity" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SCNumber") %>'></asp:Label></td>
                                            <td class="auto-style106">
                                                <asp:Label ID="LbBPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UnitPrice") %>'></asp:Label></td>
                                            <td class="auto-style106">
                                                <asp:Label ID="LbBComplex" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ComplexPrice") %>'></asp:Label></td>
                                        </tr>
                                                  </ItemTemplate>
                                        </asp:Repeater>
                                    
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="2000px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1" style="height: 27px">邀標單資訊</td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">分包預算編號</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbSB_Code1" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算名稱</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbSB_Name1" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">承攬方式</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbContractWay1" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">採購負責人</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbWorkManName1" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">預定進場日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBookInTime1" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">預定完成發包日期</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBookContractDate1" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">最遲完成發包期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbLastContractDate1" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">分包預算金額</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbBudgetPrice1" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">邀標單回覆期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbRFQ_ReplyDate" runat="server" ></asp:Label>
                                </td>
                                <td class="auto-style2">保固期限</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LbRFQ_Warranty" runat="server" ></asp:Label>
                                    年</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">補充說明</td>
                                <td class="auto-style3" colspan="3">
                                    <asp:Label ID="LbRFQ_Notes" runat="server" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">廠商應檢附項目</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_attach" runat="server" Visible="False">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox1" runat="server"  Enabled="False" Text="樣　品" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox2" runat="server"  Enabled="False" Text="型錄規範" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox3" runat="server"  Enabled="False" Text="大樣圖說" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox4" runat="server"  Enabled="False" Text="單價分析表" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox5" runat="server" Enabled="False" Text="業績表" />
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:CheckBox ID="CheckBox6" runat="server"  Enabled="False" Text="材料證明" />
                                    </td>
                                    <td class="auto-style3C" colspan="2">
                                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="True" Enabled="False" Text="其他" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">邀標單附件</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_file" runat="server" Visible="False">
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" 
                               OnRowCommand="GridView2_RowCommand"  ForeColor="#333333" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField>
                                            <ItemTemplate>
                                                 <asp:Button ID="BtnDowload" runat="server" CssClass="BtnFree" OnClick="Button42_Click" Text="下載"  CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex %>' />                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>                                               
                                                <asp:Label runat="server" ID="Path" Text='<%# DataBinder.Eval(Container.DataItem, "Path") %>'   Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>'   Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                    <asp:BoundField DataField="Path" HeaderText="檔案路徑" SortExpression="Path" Visible="False" />
                                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ></asp:SqlDataSource>
                        </asp:Panel>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">廠商報價資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_InviteQ" runat="server" Visible="false">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource3" 
                                           OnRowCommand="GridView3_RowCommand"  ForeColor="#333333" GridLines="None" Width="100%">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Button42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button42_Click" Text="檢視廠商報價" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>' Visible="false"></asp:Label>
                                                        <asp:Label runat="server" ID="FirmID" Text='<%# DataBinder.Eval(Container.DataItem, "FirmID") %>' Visible="false"></asp:Label>
                                                        <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="廠商名稱">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="報價總價(不含稅)">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="TotalPrice" Text='<%# DataBinder.Eval(Container.DataItem, "TotalPrice")%>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="回覆期限">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="RFQ_ReplyDate" Text='<%# DataBinder.Eval(Container.DataItem, "RFQ_ReplyDate")%>' ></asp:Label>
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
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Pnl_Detail" runat="server" Visible="False">
                                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                    <tr>
                                        <td class="auto-style2">廠商名稱</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbFrim" runat="server" ></asp:Label>
                                        </td>
                                        <td class="auto-style2">報價總價(不含稅)</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbTotalPrice" runat="server" Font-Bold="True" ForeColor="Red" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">報價有效期限</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbExpiretionDate" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                        </td>
                                        <td class="auto-style2">議價後總價(不含稅)</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbDisTotalPrice" runat="server" Font-Bold="True" ForeColor="Red" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">是否為得標廠商</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbGetNY" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                        </td>
                                        <td class="auto-style2">稅金</td>
                                        <td class="auto-style3">
                                            <asp:Label ID="LbTax" runat="server" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">議價內容</td>
                                        <td class="auto-style3" colspan="3">
                                            <asp:Label ID="LbDisContent" runat="server" ></asp:Label></td>
                                    </tr>
                                </table>
                                <table class="auto-style4">
                                    <tr>
                                        <td class="auto-style102">工料名稱</td>
                                        <td class="auto-style102">單位</td>
                                        <td class="auto-style102">所屬工項</td>
                                        <td class="auto-style102">數量</td>
                                        <td class="auto-style102">報價單價</td>
                                        <td class="auto-style102">報價複價</td>
                                        <td class="auto-style102">議價後單價</td>
                                        <td class="auto-style102">議價後複價</td>
                                    </tr>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource7"  OnItemDataBound="Repeater2_ItemDataBound">
                                        <ItemTemplate>                                       
                                    <tr>
                                        <td class="auto-style105">
                                            <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" Text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                        </td>
                                        <td class="auto-style103">
                                            <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                                        </td>
                                        <td class="auto-style105">
                                            <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label>
                                        </td>
                                        <td class="auto-style106">
                                            <asp:Label ID="LbSCNumber" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SCNumber") %>'></asp:Label></td>
                                        <td class="auto-style106">
                                            <asp:Label ID="LbUnitPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UnitPrice") %>'></asp:Label></td>
                                        <td class="auto-style106">
                                            <asp:Label ID="LbComplexPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ComplexPrice") %>' ></asp:Label></td>
                                        <td class="auto-style106">
                                            <asp:Label ID="LbDisUnitPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DisUnitPrice") %>'></asp:Label></td>
                                        <td class="auto-style106">
                                            <asp:Label ID="LbDisComplexPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DisComplexPrice") %>'></asp:Label></td>
                                    </tr>
                                             </ItemTemplate>
                                    </asp:Repeater>
                                
                                </table>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">分包預算資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">邀標單資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">分包合約資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="1000px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style1" style="height: 29px"><strong>分包合約資訊</strong></td>
                            </tr>
                        </table>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包合約主資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_main" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2">得標廠商</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="LbFirm" runat="server" ></asp:Label>
                                    </td>
                                    <td class="auto-style2">原合約總價</td>
                                    <td class="auto-style3"><span class="auto-style14">
                                        <asp:Label ID="LbTotalPrice1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                        </span></td>
                                    <td class="auto-style2">追加減後合約總價</td>
                                    <td class="auto-style3"><span class="auto-style14">
                                        <asp:Label ID="LbLastTotalPrice" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                                        </span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">分包合約編號</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbSC_Code" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">分包合約名稱</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbSC_Name" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">合約種類</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="LbContractType" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">預定完工日期</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbBookInTime2" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">履約保證</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbGuaranteeWay" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">出廠證明提送</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbSubmitPercent" runat="server" ></asp:Label>
                                        </span>%提送</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">請款次數</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbRequestNum" runat="server" ></asp:Label>
                                        次/月</span><span class="auto-style8"> </span></td>
                                    <td class="auto-style2">請款日</td>
                                    <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="LbRequestDate" runat="server" ></asp:Label>
                                        </span>日</td>
                                    <td class="auto-style2">付款日</td>
                                    <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="LbPayDate" runat="server" ></asp:Label>
                                        </span>日</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">工期逾罰規定</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="LbDurationRule" runat="server" Text="合約規定完工工作天數"></asp:Label>
                                    </td>
                                    <td class="auto-style2">逾罰</td>
                                    <td class="auto-style3" colspan="3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbPunishType" runat="server" Text="一天1000元"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保固年限</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbWarrantyYear" runat="server" ></asp:Label>
                                        </span>年</td>
                                    <td class="auto-style2">承攬範圍</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="LbScope" runat="server"></asp:Label> &nbsp;</td>
                                    <td class="auto-style2">稅額百分比</td>
                                    <td class="auto-style3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbTaxPercent" runat="server" ></asp:Label>
                                        </span>%</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">備註</td>
                                    <td class="auto-style3" colspan="3">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbContractNote" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                    <td class="auto-style2">追加減次數</td>
                                    <td class="auto-style3">
                                        <asp:Label ID="LbLastEdition" runat="server" ></asp:Label></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton34" runat="server" OnClick="LinkButton34_Click">付款資料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_pay" runat="server" Visible="False">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2A" colspan="5">預付款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">預付款百分比</td>
                                    <td class="auto-style2">預付款現金百分比</td>
                                    <td class="auto-style2">預付款期票百分比</td>
                                    <td class="auto-style2">預付款期票天數</td>
                                    <td class="auto-style2">預付款還款保證</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbPrepayPercent" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbPrepayCash" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbPrepayCheck" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbPrepayCheckDay" runat="server"></asp:Label></td>
                                    <td class="auto-style3C">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbPrepayGuarantee" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">工程款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"></td>
                                    <td class="auto-style2">工程款現金百分比</td>
                                    <td class="auto-style2">工程款期票百分比</td>
                                    <td class="auto-style2">工程款期票天數</td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C"></td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbFundCash" runat="server" Text="Label"></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbFundCheck" runat="server" Text="Label"></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbFundCheckDay" runat="server" Text="Label"></asp:Label>天</td>
                                    <td class="auto-style3C"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">保留款資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保留款百分比</td>
                                    <td class="auto-style2">保留款現金百分比</td>
                                    <td class="auto-style2">保留款期票百分比</td>
                                    <td class="auto-style2">保留款期票天數</td>
                                    <td class="auto-style2"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbRetentionPercent" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbRetentionCash" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbRetentionCheck" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbRetentionCheckDay" runat="server" ></asp:Label>天</td>
                                    <td class="auto-style3C"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2A" colspan="5">保固金資料</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">保固金百分比</td>
                                    <td class="auto-style2">保固金現金百分比</td>
                                    <td class="auto-style2">保固金期票百分比</td>
                                    <td class="auto-style2">保固金期票天數</td>
                                    <td class="auto-style2">保固金保留方式</td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbWarrantyPercent" runat="server"></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbWarrantyCash" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbWarrantyCheck" runat="server" ></asp:Label>%</td>
                                    <td class="auto-style3C">
                                        <asp:Label ID="LbWarrantyCheckDay" runat="server" ></asp:Label>天</td>
                                    <td class="auto-style3C">
                                        <span class="auto-style14">
                                        <asp:Label ID="LbWarrantyWay" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton35" runat="server" OnClick="LinkButton35_Click">合約及相關文件</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_file0" runat="server" Visible="False">
                            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                                
                                    </tr>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3C">
                                                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource4" 
                                                   OnRowCommand="GridView4_RowCommand"  ForeColor="#333333" GridLines="None" Width="100%">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button45" runat="server" Text="下載" CssClass="BtnFree" CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Path" Text='<%# DataBinder.Eval(Container.DataItem, "Path") %>' Visible="false"></asp:Label>
                                                                <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="檔案名稱">
                                                           <ItemTemplate>
                                                               <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' ></asp:Label>
                                                           </ItemTemplate>
                                                        </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="檔案類型">
                                                           <ItemTemplate>
                                                               <asp:Label runat="server" ID="Type" Text='<%# DataBinder.Eval(Container.DataItem, "Type") %>' ></asp:Label>
                                                           </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />--%>
                                                      <%--  <asp:BoundField DataField="Name" HeaderText="檔案名稱" SortExpression="Name" />
                                                        <asp:BoundField DataField="Type" HeaderText="檔案類型" SortExpression="Type" />--%>
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
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" >
                                                </asp:SqlDataSource>
                                            </td>
                                            </td>
                                    </tr>
                            </table>
                        </asp:Panel>
                        <table style="width: 100%;border-color:transparent" border="1">
                            <tr>
                                <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton36" runat="server" OnClick="LinkButton36_Click">分包合約工料</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Pnl_Material" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style2">選擇顯示之變更次別</td><%--<td class="auto-style3" ><span  >  <asp:CheckBox ID="check" runat="server" Text="原分包合約預算" Checked="true" Enabled="false" /></span></td>--%>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" Width="800px">
                                         <asp:ListItem Value="0" Selected="True">原分包合約預算</asp:ListItem>
                                      
                                        </asp:CheckBoxList>
                                    </td>
                                    <td class="auto-style2" rowspan="2">
                                        <asp:Button ID="BtnReload" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px"  Text="重新載入" OnClick="BtnReload_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">選擇顯示之欄位</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal" Width="300px">
                                            <asp:ListItem Value="1">數量</asp:ListItem>
                                            <asp:ListItem Value="2" >複價</asp:ListItem>
                                            <asp:ListItem Value="3">備註</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                      <td class="auto-style3"></td>
                                </tr>
                            </table>
                      
                        
                            <table class="auto-style4">
                                      <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                       
                            </table>
                        </asp:Panel>
                        <br />
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
       </div>
</body>
</html>

</asp:Content>
