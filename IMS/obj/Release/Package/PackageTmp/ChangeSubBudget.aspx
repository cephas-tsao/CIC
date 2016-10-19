<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeSubBudget.aspx.cs" MasterPageFile="Site1.Master" Inherits="IMS.ChangeSubBudget" %>

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
             border:1px solid #FFFFFF;
        } 
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
	        color: #000000;
            height: 25px;
             border:1px solid #FFFFFF;
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
                

                
            .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
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
                    

        
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
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
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
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
            background-color: #A6FFA6;
            text-align: center;
            color: #000000;
            height: 34px;
        }
        .auto-style111 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: left;
            color: #000000;
            height: 34px;
        }
        .auto-style112 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: right;
            color: #000000;
            height: 34px;
        }

        
            .BtnFree {
            font-size:medium;
            font-family:微軟正黑體;
            height:30px;
        }
        .auto-style113 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }

        
            </style>

<body>

     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">分包合約變更</td>
		</tr>
		<tr>
		<td class="auto-style3C">
            <asp:Panel runat="server" ID="panel1" DefaultButton="BtnSearch">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包合約名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="AND NOT">非</asp:ListItem>
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
                                                            <asp:TextBox ID="TxSubBudget" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Firm" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="160px">
                                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                </asp:Panel>
            </td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                                      OnRowCommand="GridView1_RowCommand"  OnRowDataBound="GridView1_RowDataBound" GridLines="None" Width="100%">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button42" runat="server" CssClass="BtnFree" OnClick="Button42_Click" Text="編修分包合約"  CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SCID" Text='<%# DataBinder.Eval(Container.DataItem, "SCID") %>'  Visible="false" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="分包合約編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SC_Code" Text='<%# DataBinder.Eval(Container.DataItem, "SC_Code") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="分包合約名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SC_Name" Text='<%# DataBinder.Eval(Container.DataItem, "SC_Name") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="得標廠商名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField  HeaderText="預定進場時間">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookInTime" Text='<%# DataBinder.Eval(Container.DataItem, "BookInTime") %>'  ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField  HeaderText="分包合約總價">
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  >                               
                                    </asp:SqlDataSource>
            </td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_SubContract" runat="server" Visible="False">
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
                            <asp:Label ID="SCID" runat="server"  Visible="false"></asp:Label>
                            <asp:Label ID="LbGetFirm" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style2">原合約總價</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbTotalPrice" runat="server" Font-Bold="True" ForeColor="Red" Text="6,500"></asp:Label>
                            </span></td>
                        <td class="auto-style2">前次追加減後總價</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label752" runat="server" Font-Bold="True" ForeColor="Red" Text="7,500"></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">分包合約編號</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbSubNum" runat="server" ></asp:Label>
                            </span></td>
                        <td class="auto-style2">分包合約名稱</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbSubName" runat="server" ></asp:Label>
                            </span></td>
                        <td class="auto-style2">合約種類</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbContractType" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style113">預定完工日期</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="Label733" runat="server" Text="2016.6.30"></asp:Label>
                            </span></td>
                        <td class="auto-style113">履約保證</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbGuaranteeWay" runat="server" ></asp:Label>
                            </span></td>
                        <td class="auto-style113">出廠證明提送</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbSubmitPercent" runat="server" Text="100"></asp:Label>
                            </span>%提送</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">請款次數</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbRequestNum" runat="server" ></asp:Label>
                            次/月</span><span class="auto-style8"> </span></td>
                        <td class="auto-style2">請款日</td>
                        <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="LbRequestDate" runat="server"></asp:Label>
                            </span>日</td>
                        <td class="auto-style2">付款日</td>
                        <td class="auto-style3">每月<span class="auto-style14"><asp:Label ID="LbPayDate" runat="server" ></asp:Label>
                            </span>日</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbDurationRule" runat="server" ></asp:Label>
                        </td>
                        <td class="auto-style2">逾罰</td>
                        <td class="auto-style3" colspan="3"><span class="auto-style14">
                            <asp:Label ID="LbPunishType" runat="server" ></asp:Label>
                            </span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbWarrantyYear" runat="server" ></asp:Label>
                            </span>年</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbScope" runat="server" ></asp:Label></td>
                        <td class="auto-style2">稅額百分比</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbTaxPercent" runat="server" Text="5"></asp:Label>
                            </span>%</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbContractNote" runat="server" ></asp:Label>
                            </span></td>
                        <td class="auto-style2">本次追加減次序</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbLastEdition" runat="server" Font-Bold="True" ForeColor="Red" ></asp:Label>
                            </span></td>
                        <td class="auto-style2">本次追加減後總價</td>
                        <td class="auto-style3"><span class="auto-style14">
                            <asp:Label ID="LbSubAmount" runat="server" Font-Bold="True" ForeColor="Red" Text="-"></asp:Label>
                            </span></td>
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
                                    <td class="auto-style2">選擇顯示之變更次別</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="0"  Selected="True">原分包合約預算</asp:ListItem>
                                         <%--   <asp:ListItem>第1次追加減</asp:ListItem>
                                            <asp:ListItem>第2次追加減</asp:ListItem>
                                            <asp:ListItem Selected="True">第3次追加減</asp:ListItem>
                                            <asp:ListItem Selected="True">第4次追加減</asp:ListItem>--%>
                                        </asp:CheckBoxList>
                                    </td>
                                    <td class="auto-style2" rowspan="2">
                                        <asp:Button ID="BtnReload" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px"  Text="重新載入" OnClick="BtnReload_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">選擇顯示之欄位</td>
                                    <td class="auto-style3">
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1" Selected="True">數量</asp:ListItem>
                                            <asp:ListItem Value="2" Selected="True">複價</asp:ListItem>
                                            <asp:ListItem Value="3">備註</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                                 <table class="auto-style4">
                                      <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                       
                            </table>
                            <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
                            <table style="width: 100%">
                                <tr>
                                    <td class="auto-style3R">
                                        <%--<asp:Button ID="BtnAdd" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加新工料" Width="120px" OnClick="BtnAdd_Click" />--%>
                                          <asp:ImageButton ID="BtnAddSub" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="增加分包預算工料" Width="27px" OnClick="BtnAdd_Click" />
                                    </td>
                                </tr>
                            </table>
                </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;<%--<asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="計算" Width="120px" />--%>&nbsp;
                        <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="計算並儲存" Width="120px" OnClick="BtnSave_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnRecovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="40px" Text="回復原值" Width="120px" OnClick="BtnRecovery_Click" />
                    </td>
                </tr>
            </table>
            </asp:Panel>
    
    </div>
    </form>
</body>
</html>

    </asp:Content>
