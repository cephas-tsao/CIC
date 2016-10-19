<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="SubContractAdd.aspx.cs" Inherits="IMS.SubContractAdd" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-新增分包合約</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #5D7B9D;
            text-align: center;
            color: #FFFFFF;
            }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
             border:1px solid #FFFFFF;
            }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
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
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }     
            .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
.auto-style15 {
	color: #008000;
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
            </style>

<body>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
       <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">新增分包合約</td>
		</tr>
		<tr>
		<td class="auto-style3C">
            <asp:Panel runat="server" ID="panel1" DefaultButton="BtnSearch">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
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
                                                            <asp:TextBox ID="TxSubBudget" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_Firm" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="160px">
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
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                                        GridLines="None" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button40_Click" Text="新增分包合約" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="LbFirmID" Text='<%# DataBinder.Eval(Container.DataItem, "FirmID") %>'  Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>'  Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="LbContractWay" Text='<%# DataBinder.Eval(Container.DataItem, "ContractWay") %>'  Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="LbWorkManName" Text='<%# DataBinder.Eval(Container.DataItem, "WorkManName") %>'  Visible="false"></asp:Label>
                                                                                           
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算編號">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Code" Text='<%# DataBinder.Eval(Container.DataItem, "SB_Code") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="分包預算名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Name" Text='<%# DataBinder.Eval(Container.DataItem, "SB_Name") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="預定進場時間">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookInTime" Text='<%# DataBinder.Eval(Container.DataItem, "BookInTime") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="預算金額">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BudgetPrice" Text='<%# DataBinder.Eval(Container.DataItem, "BudgetPrice") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="得標廠商名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>  
                                            <asp:TemplateField HeaderText="報價總價">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="TotalPrice" Text='<%# DataBinder.Eval(Container.DataItem, "TotalPrice") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="議價後總價">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="DisTotalPrice" Text='<%# DataBinder.Eval(Container.DataItem, "DisTotalPrice") %>' ></asp:Label>
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
                                       <%-- <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="GetFirmID" Type="Int32" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="Table2R">
                                    註：僅顯示已有得標廠商且尚未新增分包合約之分包預算</td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_Contract" runat="server" Visible="False">
            <table style="width: 100%;border-color:transparent" border="1">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">分包預算邀標資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_BudgetData" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">分包預算編號</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbFirmID" runat="server"  Visible="false"></asp:Label>
                            <asp:Label ID="LbSBID" runat="server"  Visible="false"></asp:Label>
                            <asp:Label ID="LbSubNum" runat="server" ></asp:Label>
                        </td>
                        <td class="auto-style2">分包預算名稱</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbSubName" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">承攬方式</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbContractWay" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style2">採購負責人</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbWorkManName" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">預定進場日期</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbBookInTime" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style4">分包預算金額</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbBudgetPrice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">得標廠商</td>
                        <td class="auto-style3">
                            <%--<asp:Label ID="LbUID" runat="server"  Visible="true"></asp:Label>--%>
                            <asp:Label ID="LbGetFirm" runat="server" ></asp:Label>
                        </td>
                        <td class="auto-style2">議價後總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbDisTotalPrice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%;border-color:transparent" border="1">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包合約主資料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server" onkeydown = "return (event.keyCode!=13)">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">分包合約編號</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxSubNum" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">分包合約名稱</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxSubName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">合約種類</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_ContractType" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged1">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>工程合約</asp:ListItem>
                                <asp:ListItem>買賣合約</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">預定進場日期</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxBookInTime" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px" onclick="WdatePicker();"></asp:TextBox>
                        </td>
                        <td class="auto-style2">履約保證</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_GuaranteeWay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem>銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2" colspan="2">出廠證明提送</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxSubmitPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %提送</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">請款次數</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxRequestNum" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            <span class="auto-style14">次/月</span><span class="auto-style8"> </span></td>
                        <td class="auto-style2">請款日</td>
                        <td class="auto-style3">每月<asp:TextBox ID="TxRequestDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                        <td class="auto-style2" colspan="2">付款日</td>
                        <td class="auto-style3">每月<asp:TextBox ID="TxPayDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style4">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Warranty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem Value="0">-請先選擇合約種類-</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4">逾罰</td>
                        <td class="auto-style3" colspan="2">
                            <%--<input name="Radio1" type="radio" value="134" />--%>
                               <asp:RadioButton ID="RadioButton1" runat="server"  OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true"/>
                            <span">千分之</span><br />&nbsp;<span><asp:TextBox ID="TxPType1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            /每天</span></td>
                        <td class="auto-style3" colspan="2">
                            <%--<input name="Radio1" type="radio" value="135" checked="true" />--%>
                               <asp:RadioButton ID="RadioButton2" runat="server"  OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true"/>
                            <span>一天<br /> 
                            <asp:TextBox ID="TxPType2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            元</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxWarrantyYear" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxScope" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">稅額百分比</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxTaxPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3" colspan="6">
                            <asp:TextBox ID="TxContractNote" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%;border-color:transparent" border="1">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">付款資料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_pay" runat="server" Visible="False" onkeydown = "return (event.keyCode!=13)">
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
                            <asp:TextBox ID="TxPrepayPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxPrepayCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxPrepayCheck" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxPrepayCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DDL_PrepayGuarantee" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem>銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
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
                        <td class="auto-style3C">
                            </td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCheck" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
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
                            <asp:TextBox ID="TxRetentionPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCheck" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
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
                            <asp:TextBox ID="TxWarrantyPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCheck" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DDL_WarrantyWay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>現金</asp:ListItem>
                                <asp:ListItem>銀行產物公司</asp:ListItem>
                                <asp:ListItem>商業本票</asp:ListItem>
                                <asp:ListItem>銀行支票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
             <table style="width: 100%;border-color:transparent" border="1">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">合約及相關文件上傳</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_file" runat="server" Visible="False" onkeydown = "return (event.keyCode!=13)">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">檔案名稱</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="AttachName" runat="server" Height="25px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">檔案類型</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_kind" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>合約</asp:ListItem>
                                <asp:ListItem>規範</asp:ListItem>
                                <asp:ListItem>圖說</asp:ListItem>
                                <asp:ListItem>施工補充說明</asp:ListItem>
                                <asp:ListItem>廠商提送-樣品</asp:ListItem>
                                <asp:ListItem>廠商提送-型錄規範</asp:ListItem>
                                <asp:ListItem>廠商提送-大樣圖說</asp:ListItem>
                                <asp:ListItem>廠商提送-單價分析表</asp:ListItem>
                                <asp:ListItem>廠商提送-業績表</asp:ListItem>
                                <asp:ListItem>廠商提送-材料證明</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox84" runat="server" Height="25px" Visible="False" Width="100px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">選擇檔案</td>
                        <td class="auto-style3">
                            <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" />
                        </td>
                        <td class="auto-style2">
                            <asp:Button ID="BtnUpload" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="上傳" Width="71px" OnClick="BtnUpload_Click" />
                        </td>
                        <tr>
                            <td class="auto-style3C" colspan="7">
                                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource3" 
                                   OnRowCommand="GridView5_RowCommand"  ForeColor="#333333" GridLines="None" Width="100%">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>                                 
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                 <asp:Button ID="BtnDowload" runat="server" CssClass="BtnFree"  Text="下載"  CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex %>' />
                                                 <asp:Button ID="BtnDel" runat="server" CssClass="BtnFree"  Text="刪除"  CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>'   Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="Path" Text='<%# DataBinder.Eval(Container.DataItem, "Path") %>'   Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>'   Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      <%--  <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                        <asp:BoundField DataField="SCID" HeaderText="SCID" SortExpression="SCID" Visible="False" />--%>
                                        <asp:BoundField DataField="Name" HeaderText="檔案名稱" SortExpression="Name" />
                                        <asp:BoundField DataField="Type" HeaderText="檔案類型" SortExpression="Type" />
                                        <%--<asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" Visible="False" />--%>
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
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"  >
                                  <%--  <SelectParameters>
                                        <asp:Parameter DefaultValue="5" Name="SCID" Type="Int32" />
                                    </SelectParameters>--%>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnAddSubC" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增分包合約" OnClick="BtnAddSubC_Click" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
        <br />
    
    </div>

</body>



</asp:Content>