﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubInviteAdd.aspx.cs" MasterPageFile="Site1.Master" Inherits="IMS.SubInviteAdd" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/SubContract.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>採購發包模組-新增邀標單</title>
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
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 25px;
            width: 100%;
        }
            
        .auto-style102 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #00A600;
            text-align: center;
            color: #FFFFFF;
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
       .button {
          margin-bottom:10px
        }          

                
            </style>
    <body>
    <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">新增邀標單</td>
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
                                                            <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLshort" Font-Size="Medium" AutoPostBack="True" Font-Names="微軟正黑體" OnSelectedIndexChanged="DDL_Op3_SelectedIndexChanged">
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
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                                  AllowPaging="true" PageSize="10"      OnRowCommand="GridView1_RowCommand"  OnRowDataBound="GridView1_RowDataBound">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" CommandName="select" CommandArgument='<%# Container.DataItemIndex %>' OnClick="Button38_Click" Text="新增此分包預算之邀標單" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="WorkManName" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "WorkManName") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="ContractWay" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "ContractWay") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="SBID" Visible="false" text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算編號">
                                              <ItemTemplate>
                                                  <asp:Label runat="server" ID="SB_Code" text='<%# DataBinder.Eval(Container.DataItem, "SB_Code") %>'></asp:Label>
                                              </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="分包預算名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SB_Name" Text='<%# DataBinder.Eval(Container.DataItem, "SB_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField  HeaderText="預定進場時間" >
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookInTime" Text='<%# DataBinder.Eval(Container.DataItem, "BookInTime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="預定完成發包日期">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BookContractDate" Text='<%# DataBinder.Eval(Container.DataItem, "BookContractDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="最遲完成發包日期">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="LastContractDate" Text='<%# DataBinder.Eval(Container.DataItem, "LastContractDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="預算金額">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="BudgetPrice" Text='<%# DataBinder.Eval(Container.DataItem, "BudgetPrice") %>'></asp:Label>
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
		</table>
        <asp:Panel ID="Pnl_IAdd" runat="server" Visible="False" onkeydown = "return (event.keyCode!=13)">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">分包預算/邀標單資訊</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server">
                <table style="width: 100%">
                <tr>
                    <td class="auto-style2">分包預算編號</td>
                    <td class="auto-style3">
                        <asp:Label ID="LbSBID" runat="server" Visible="false" ></asp:Label>
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
                        <asp:Label ID="LbWorkManName" runat="server" Text="採購部-陳大華"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">預定進場日期</td>
                    <td class="auto-style3">
                        <asp:Label ID="LbBookInTime" runat="server" ></asp:Label>
                    </td>
                    <td class="auto-style2">預定完成發包日期</td>
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
                <tr>
                    <td class="auto-style2">邀標單回覆期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TxRFQ_ReplyDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="auto-style2">保固期限</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TxRFQ_Warranty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                        年</td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">補充說明</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TxRFQ_Notes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="150px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">檢視分包預算工項</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_Material" runat="server" Visible="False">
                <table class="auto-style4">
                    <tr>
                        <td class="auto-style102">執行項次</td>
                        <td class="auto-style102">工料名稱</td>
                        <td class="auto-style102">單位</td>
                        <%--<td class="auto-style102">所屬工項</td>--%>
                        <td class="auto-style102">數量</td>
                        <td class="auto-style102">預算單價</td>
                        <td class="auto-style102">預算複價</td>
                    </tr>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>

                    <tr>
                         <td class="auto-style105">                        
                            <asp:Label ID="LbItemOrder" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label>
                        </td>
                        <td class="auto-style105">
                            <asp:Label ID="LbSB_MID" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "SB_MID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" text='<%# DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </td>
                        <td class="auto-style103">
                            <asp:Label ID="LbUnit" runat="server" Font-Size="Medium" Height="25px" Width="50px" text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>
                        </td>
                       <%-- <td class="auto-style105">
                            <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" text='<%# DataBinder.Eval(Container.DataItem, "BelongItem") %>'></asp:Label><%--Text="壹.二.4.2.1F-鋼筋"
                        </td>--%>
                        <td class="auto-style106">
                            <asp:Label ID="LbQuantity" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "SCNumber") %>' ></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbBPrice" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "UnitPrice") %>'></asp:Label></td>
                        <td class="auto-style106">
                            <asp:Label ID="LbBComplex" runat="server" ></asp:Label></td>
                    </tr>                           
                        </ItemTemplate>
                    </asp:Repeater>
                 
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">廠商應檢附項目</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_attach" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="樣　品" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="型錄規範" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="大樣圖說" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox4" runat="server" Text="單價分析表" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox5" runat="server" Text="業績表" />
                    </td>
                    <td class="auto-style3C">
                        <asp:CheckBox ID="CheckBox6" runat="server" Text="材料證明" />
                    </td>
                    <td class="auto-style3C" colspan="2">
                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox7_CheckedChanged" Text="其他" />
                        <asp:TextBox ID="TextBox6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Visible="False" Width="200px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">邀標單附件</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_file" runat="server" Visible="False">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">附件名稱</td>
                            <td class="auto-style3">
                            <asp:TextBox ID="AttachName" runat="server" Height="25px" Width="150px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">附件類型</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DDL_kind" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem>圖說</asp:ListItem>
                                    <asp:ListItem>規範</asp:ListItem>
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
                                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource2" 
                                        Width="100%" ForeColor="#333333" GridLines="None" OnRowCommand="GridView5_RowCommand">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                           <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="刪除"  CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' />                                                
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="SBID" Text='<%# DataBinder.Eval(Container.DataItem, "SBID") %>' Visible="false" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="SBID" HeaderText="SBID" SortExpression="SBID" Visible="False" />--%>
                                           <%-- <asp:BoundField DataField="Name" HeaderText="附件名稱" SortExpression="Name" />--%>
                                            <asp:BoundField DataField="Type" HeaderText="附件類型" SortExpression="Type" />
                                            <%--<asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" Visible="False" />--%>
                                            <asp:TemplateField HeaderText="附件名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Name" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <asp:TemplateField>
                                               <ItemTemplate>
                                                   <asp:Label runat="server" ID="Path" Text='<%# DataBinder.Eval(Container.DataItem, "Path") %>' Visible="false"></asp:Label>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                              <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="下載"  CommandName="DownLoad" CommandArgument='<%# Container.DataItemIndex %>' />                                                
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
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server">
                                        <DeleteParameters>
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="SBID" Type="Int32" />
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="SBID" Type="Int32" />
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Path" Type="String" />
                                            <asp:Parameter Name="UID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">選擇邀標廠商</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_firm" runat="server" Visible="False">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style3">
                            <table class="auto-style63">
                                <tr>
                                    <td class="auto-style2" rowspan="2">搜<br /> 尋</td>
                                    <td class="auto-style2">廠商類型</td>
                                    <td class="auto-style3C" rowspan="2">
                                        <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                            <asp:ListItem Value="OR">或</asp:ListItem>
                                            <asp:ListItem Value="NOT">非</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style2">廠商專長/供給項目(關鍵字)</td>
                                    <td class="auto-style3C" rowspan="2">
                                        <asp:Button ID="BtnFSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnFSearch_Click" CssClass="button" />
                                        <br /><span style="":120px">
                                        <asp:Button ID="BtnFAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnFAll_Click" /></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C">
                                        <asp:DropDownList ID="DDL_Select2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="Content" DataValueField="Content" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Width="150px">
                                            <asp:ListItem Value="">-請選擇 -</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"  SelectCommand="SELECT [Content] FROM [UsualWord] WHERE ([Type] = @Type)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="協力廠商類型" Name="Type" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="auto-style3C">
                                        <asp:TextBox ID="TxPro" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3C" colspan="5">
                                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource4" Width="100%" 
                                            ForeColor="#333333" GridLines="None" OnRowCommand="GridView4_RowCommand">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="選擇">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBoxSF" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label runat ="server" ID="UID" Visible="false"  Text='<%# Bind("UID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />--%>
                                    <asp:BoundField DataField="Name" HeaderText="廠商名稱" SortExpression="Name" />
                                    <asp:BoundField DataField="Type" HeaderText="廠商類型" SortExpression="Type" />
                                    <asp:BoundField DataField="SupportItem" HeaderText="廠商專長／供給材料" SortExpression="SupportItem" />
                                    <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" Visible="False" />
                                    <asp:BoundField DataField="Location" HeaderText="所在縣市" SortExpression="Location" />
                                    <asp:BoundField DataField="Tel1" HeaderText="聯絡電話" SortExpression="Tel1" />
                                    <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                       <asp:TemplateField HeaderText="詳細資料">
                                        <ItemTemplate>
                                            <asp:Button ID="BtnDetail" runat="server" Text="詳細資料" CssClass="BtnFree" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>'/>
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
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" SelectCommand="SELECT [UID], [Name], [Type], [SupportItem], [Owner], [Location], [Tel1], [Notes] FROM [FirmM]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnRequire" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="確定新增邀標單" OnClick="BtnRequire_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    
    
    
    </body>
     </asp:Content>