<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="SubBargain.aspx.cs" Inherits="IMS.SubBargain" MaintainScrollPositionOnPostback="true" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-邀標單管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSB.css" />
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
             border:1px solid  #ECF5FF;
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
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
	        color: #000000;
            height: 25px;
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
            width: 100%;
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
                

                
            .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
            }
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
     border:1px solid  #ECF5FF;
}
        .auto-style103 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #A6FFA6;
            text-align: center;
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
        
        
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
.auto-style15 {
	color: #008000;
}
            
        
                            
            .auto-style110 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
        }
            
        
                            
            </style>

<body>
   <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
        <table class="auto-style4">
            <tr>
                <td class="auto-style1">協力廠商議價議約</td>
            </tr>
            <tr>
                <td class="auto-style3C">
                    <asp:Panel runat="server" ID="panel1" DefaultButton="BtnSearch">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包預算名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium" Font-Names="微軟正黑體">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DDL_date" runat="server" Font-Size="Medium" Height="30px" Width="155px" Font-Names="微軟正黑體">
                                                                <asp:ListItem Value="BookInTime">預定進場時間</asp:ListItem>
                                                                <asp:ListItem Value="BookContractDate">預定完成發包日期</asp:ListItem>
                                                                <asp:ListItem Value="LastContractDate">最遲完成發包日期</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
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
                                                            <asp:TextBox ID="TxDate1" runat="server" Font-Size="Medium" Height="20px" Width="120px" onclick="WdatePicker();"></asp:TextBox>
                                                            <asp:DropDownList ID="DDL_Op3" runat="server" Font-Size="Medium" AutoPostBack="True" Font-Names="微軟正黑體" OnSelectedIndexChanged="DDL_Op3_SelectedIndexChanged">
                                                                  <asp:ListItem Selected="True" Value="<=">之前</asp:ListItem>
                                                                <asp:ListItem Value=">=">之後</asp:ListItem>
                                                                <asp:ListItem Value="Between">之間</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="TxDate2" runat="server" Font-Size="Medium" Height="20px" Width="120px" Visible="False" onclick="WdatePicker();"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                        </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style3C">
                                    <asp:GridView ID="GV_SB" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="Sql_SB" 
                                        ForeColor="#333333" GridLines="None" OnRowCommand="GV_SB_RowCommand" OnRowDataBound="GV_SB_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                           <%-- <asp:CommandField ButtonType="Button" SelectText="查詢已回傳報價之廠商" ShowSelectButton="True">
                                            <ControlStyle CssClass="BtnFree" />
                                            </asp:CommandField>--%>
                                              <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button40" runat="server"  CssClass="BtnFree" Font-Names="微軟正黑體" Font-Size="Medium"  CommandName="select" CommandArgument='<%# Container.DataItemIndex %>'  Text="查詢已回傳報價之廠商" />
                                                    &nbsp;
                                                    <asp:Button ID="Button41" runat="server"  CssClass="BtnFree" Font-Names="微軟正黑體" Font-Size="Medium"  CommandName="edit" CommandArgument='<%# Container.DataItemIndex %>' Text="檢視議價呈核表"   />
                                                </ItemTemplate>
                                            </asp:TemplateField>              
                                           <%-- <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button44" runat="server" CssClass="BtnFree" OnClick="Button44_Click" Text="檢視議價呈核表" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField>
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>' Visible="false"></asp:Label>
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
                                                 <asp:Label runat="server" ID="BookInTime" Text='<%# DataBinder.Eval(Container.DataItem, "BookInTime") %>'  ></asp:Label>
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="預定完成發包時間">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="BookContractDate" Text='<%# DataBinder.Eval(Container.DataItem, "BookContractDate") %>' ></asp:Label>
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="最遲完成發包時間">
                                             <ItemTemplate>
                                                 <asp:Label runat="server" ID="LastContractDate" Text='<%# DataBinder.Eval(Container.DataItem, "LastContractDate") %>' ></asp:Label>
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="SBID" HeaderText="SBID" InsertVisible="False" ReadOnly="True" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                            <asp:BoundField DataField="SB_Code" HeaderText="分包預算編號" SortExpression="SB_Code" />
                                            <asp:BoundField DataField="SB_Name" HeaderText="分包預算名稱" SortExpression="SB_Name" />
                                            <asp:BoundField DataField="BookInTime" HeaderText="預定進場時間" SortExpression="BookInTime" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BookContractDate" HeaderText="預定完成發包時間" SortExpression="BookContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="LastContractDate" HeaderText="最遲完成發包時間" SortExpression="LastContractDate" DataFormatString="{0:yyyy/MM/dd}" />--%>
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
                                    <asp:SqlDataSource ID="Sql_SB" runat="server" >
                                     <%--   <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="BudgetLockNY" Type="Int32" />
                                            <asp:Parameter DefaultValue="0" Name="GetFirmID" Type="Int32" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3R">
                                    註：僅顯示尚未決定得標廠商之分包預算</td>
            </tr>
            <tr>
                <td class="auto-style3C">
                                    <asp:GridView ID="GV_Firm" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="Sql_Detail" ForeColor="#333333" GridLines="None" 
                                        AllowPaging="True" AllowSorting="True" OnRowCommand="GV_Firm_RowCommand" OnRowDataBound="GV_Firm_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button45" runat="server" CssClass="BtnFree" OnClick="Button45_Click" Text="增修議約議價內容" CommandArgument='<%# Container.DataItemIndex %>' CommandName="select" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="FirmID" Text='<%# DataBinder.Eval(Container.DataItem, "FirmID") %>' Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>' Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="ExpiretionDate" Text='<%# DataBinder.Eval(Container.DataItem, "ExpiretionDate") %>' Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="GetNY" Text='<%# DataBinder.Eval(Container.DataItem, "GetNY") %>' Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="UID" Text='<%# DataBinder.Eval(Container.DataItem, "UID") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                       
                                            <asp:TemplateField HeaderText="廠商名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="報價總價">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="TotalPrice" Text='<%# DataBinder.Eval(Container.DataItem, "TotalPrice") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                       
                                            <asp:TemplateField HeaderText="折扣後總價" SortExpression="DiscountTotal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DiscountTotal") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="DiscountTotal" runat="server" Text='<%# Bind("DiscountTotal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
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
                                    <asp:SqlDataSource ID="Sql_Detail" runat="server"  >
                                      <%--  <SelectParameters>
                                            <asp:ControlParameter ControlID="GV_SB" Name="SBID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>--%>
                                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Bargain" runat="server" Visible="False">
            <table class="auto-style4">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">議價資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Price" runat="server" Visible="False" onkeydown = "return (event.keyCode!=13)">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">廠商名稱</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbUID" runat="server"  Visible="false"></asp:Label>
                            <asp:Label ID="LbFirmID" runat="server"  Visible="false"></asp:Label>
                            <asp:Label ID="LbFirmName" runat="server" ></asp:Label>
                        </td>
                        <td class="auto-style2">預算金額</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbBPrice" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">報價有效期限</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbExDate" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                        </td>
                        <td class="auto-style2">報價總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbTotalPrice" runat="server" Font-Bold="True" ForeColor="Red" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">是否為得標廠商</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbGetNY" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                        </td>
                        <td class="auto-style2">議價後總價(不含稅)</td>
                        <td class="auto-style3">
                            <asp:Label ID="LbDisPrice" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">議價內容</td>
                        <td class="auto-style3" colspan="3">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="500px">
                                <asp:ListItem Value="1">約定總價上限</asp:ListItem>
                                <asp:ListItem Value="2">約定折扣百分比</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:TextBox ID="TB_Bargain" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Visible="False" Width="150px" AutoPostBack="true" OnTextChanged="TB_Bargain_TextChanged"></asp:TextBox>
                            <asp:Label ID="LB_Unit" runat="server" Text="元" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="auto-style4">
                    <tr>
                          <td class="auto-style110">執行項次</td>
                        <td class="auto-style110">工料名稱</td>
                        <td class="auto-style110">單位</td>
                      
                        <td class="auto-style110">數量</td>
                        <td class="auto-style110">報價單價</td>
                        <td class="auto-style110">報價複價</td>
                        <td class="auto-style110">議價後單價</td>
                        <td class="auto-style110">議價後複價</td>
                        <td class="auto-style110">廠牌規格說明</td>
                        <td class="auto-style110">備註</td>
                    </tr>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1">
                        <ItemTemplate>

                    <tr>
                             <td class="auto-style105">
                            <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="LbSB_MID" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "SB_MID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LbSBID" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                        </td>
                   
                        <td class="auto-style106">
                            <asp:Label ID="LbQuantity" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "SCNumber") %>'></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbBPrice" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "UnitPrice") %>'></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbBComplex" runat="server" ></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbDisPrice" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "DisUnitPrice") %>'></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbDisComplex" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "DisComplexPrice") %>'></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbBrand" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Explan") %>' ></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbNotes" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Note") %>'></asp:Label></td>
                    </tr>                            
                        </ItemTemplate>
                    </asp:Repeater>
               
                </table>
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="BtnCalSave" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="計算並儲存" OnClick="BtnCalSave_Click"  />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">議約資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Contract" runat="server" Visible="False" onkeydown = "return (event.keyCode!=13)">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">合約種類</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Warranty" runat="server"  Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged" Width="200px">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>工程合約</asp:ListItem>
                                <asp:ListItem>買賣合約</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2">履約保證</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Garnty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="200px">
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
                        <td class="auto-style2">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_DurationRule" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="200px">
                                <asp:ListItem Value="0">-請先選擇合約種類-</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2">逾罰</td>
                        <td class="auto-style3" colspan="2">
                            <%--<input name="Radio1" id="Radio1" type="radio" value="1" runat="server" onchange="RadioChange" />--%>
                            <asp:RadioButton ID="RadioButton1" runat="server"  OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" />
                            <span">千分之</span><br />&nbsp;<span><asp:TextBox ID="TxPType1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            /每天</span></span">
                        </td>
                        <td class="auto-style3" colspan="2">
                            <asp:RadioButton ID="RadioButton2" runat="server" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true"/>
                            <%--<input name="Radio2" id="Radio2" type="radio" value="2"  runat="server" />--%>
                            <span>一天<br /> 
                            <asp:TextBox ID="TxPType2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            元</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxWarrantyYear" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2">保養年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxMaintainYear" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                        <td class="auto-style2" colspan="2">再保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxReWarrantyYear" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            年</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">稅額百分比</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxTaxPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            %</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3" colspan="4">
                            <asp:TextBox ID="TxScope" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3" colspan="6">
                            <asp:TextBox ID="TxNotes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
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
                            <asp:TextBox ID="TxPrepayCheck" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxPrepayCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DDL_PWanty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="200px">
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
                        <td class="auto-style3C"></td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCheck" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxFundCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
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
                            <asp:TextBox ID="TxRetentionPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCheck" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxRetentionCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
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
                            <asp:TextBox ID="TxWarrantyPercent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCash" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCheck" runat="server" Enabled="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TxWarrantyCheckDay" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DDL_RType" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="200px">
                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                <asp:ListItem>現金</asp:ListItem>
                                <asp:ListItem>銀行產物公司</asp:ListItem>
                                <asp:ListItem>商業本票</asp:ListItem>
                                <asp:ListItem>銀行支票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="BtnSave" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="儲存" Width="100px" OnClick="BtnSave_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnRecovery" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="回復原值" Width="100px" OnClick="BtnRecovery_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
        </asp:Panel>
    
    </div>

</body>
</html>

    </asp:Content>
