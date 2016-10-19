<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發2.aspx.cs" Inherits="採發2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
            }
        .auto-style105 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: left;
	color: #000000;
}
.auto-style106 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #A6FFA6;
	text-align: right;
	color: #000000;
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
                <asp:Label ID="Label462" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="18,357,294"></asp:Label>
            </td>
            <td class="auto-style2">
                已分包預算總價</td>
            <td class="auto-style3">
                <asp:Label ID="Label176" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="8,111,222"></asp:Label>
            </td>
		    </tr>
		</table>
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
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">有無邀標單</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button37" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList33" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                                <asp:ListItem>-請選擇-</asp:ListItem>
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
                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SBID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Button38_Click" Text="編修此分包預算" Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"BudgetLockNY"))==1)? false:true %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SBID" HeaderText="SBID" InsertVisible="False" ReadOnly="True" SortExpression="SBID" Visible="False" />
                                            <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                            <asp:BoundField DataField="SB_Code" HeaderText="分包預算編號" SortExpression="SB_Code" />
                                            <asp:BoundField DataField="SB_Name" HeaderText="分包預算名稱" SortExpression="SB_Name" />
                                            <asp:BoundField DataField="BookInTime" HeaderText="預定進場時間" SortExpression="BookInTime" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BookContractDate" HeaderText="預定完成發包日期" SortExpression="BookContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="LastContractDate" HeaderText="最遲完成發包日期" SortExpression="LastContractDate" DataFormatString="{0:yyyy/MM/dd}" />
                                            <asp:BoundField DataField="BudgetPrice" HeaderText="預算金額" SortExpression="BudgetPrice" />
                                            <asp:TemplateField HeaderText="是否已有邀標單(預算鎖定)" SortExpression="BudgetLockNY">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BudgetLockNY") %>'></asp:TextBox>
                                                </EditItemTemplate>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY FROM SubBudgetList WHERE (PID = @PID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
            </tr>
		<tr>
		<td class="auto-style3R">
                                    註：已鎖定之預算須先刪除邀標單解除鎖定方能編輯</td>
            </tr>
		    </table>
                                    <asp:Panel ID="Pnl_SC" runat="server" BorderStyle="None" Visible="False">
                                        <table class="auto-style4">
                                            <tr>
                                                <td class="auto-style2">分包預算編號</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TextBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">SB001</asp:TextBox>
                                                </td>
                                                <td class="auto-style2">分包預算名稱</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TextBox22" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">分包預算1</asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">承攬方式</td>
                                                <td class="auto-style3">
                                                    <asp:DropDownList ID="RadioButtonList1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                                        <asp:ListItem>-請選擇&#39;-</asp:ListItem>
                                                        <asp:ListItem Selected="True">實做實算</asp:ListItem>
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
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
                                                    <asp:DropDownList ID="DropDownList8" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="Name" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                                                        <asp:ListItem>-請選擇部門人員-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList7" Name="Department" PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">預定進場日期</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">2016.5.1</asp:TextBox>
                                                </td>
                                                <td class="auto-style2">預定完成發包日期</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">2015.12.31</asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2">最遲完成發包期限</td>
                                                <td class="auto-style3">
                                                    <asp:TextBox ID="TextBox5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="200px">2016.3.31</asp:TextBox>
                                                </td>
                                                <td class="auto-style2">分包預算金額</td>
                                                <td class="auto-style3">
                                                    <asp:Label ID="Label684" runat="server" Text="6,500"></asp:Label>
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
                                                            <td class="auto-style102">工料名稱</td>
                                                            <td class="auto-style102">單位</td>
                                                            <td class="auto-style102">所屬工項</td>
                                                            <td class="auto-style102">數量</td>
                                                            <td class="auto-style102">預算單價</td>
                                                            <td class="auto-style102">預算複價</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style103">
                                                                <asp:Button ID="Button25" runat="server" Font-Names="微軟正黑體" Text="移除" />
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label667" runat="server" Font-Size="Medium" Height="25px">產品，鋼筋，SD280</asp:Label>
                                                            </td>
                                                            <td class="auto-style103">
                                                                <asp:Label ID="Label678" runat="server" Font-Size="Medium" Height="25px" Width="50px">T</asp:Label>
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label656" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                                            </td>
                                                            <td class="auto-style106">0.500</td>
                                                            <td class="auto-style106">8,000.00</td>
                                                            <td class="auto-style106">4,000.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style103">
                                                                <asp:Button ID="Button32" runat="server" Font-Names="微軟正黑體" Text="移除" />
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label668" runat="server" Font-Size="Medium" Height="25px">產品，金屬材料，鐵線</asp:Label>
                                                            </td>
                                                            <td class="auto-style103">
                                                                <asp:Label ID="Label679" runat="server" Font-Size="Medium" Height="25px" Width="50px">KG</asp:Label>
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label681" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                                            </td>
                                                            <td class="auto-style106">2.000</td>
                                                            <td class="auto-style106">22.00</td>
                                                            <td class="auto-style106">44.000</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style103">
                                                                <asp:Button ID="Button33" runat="server" Font-Names="微軟正黑體" Text="移除" />
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label669" runat="server" Font-Size="Medium" Height="25px">技術工</asp:Label>
                                                            </td>
                                                            <td class="auto-style103">
                                                                <asp:Label ID="Label677" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label682" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                                            </td>
                                                            <td class="auto-style106">0.675</td>
                                                            <td class="auto-style106">1,700.00</td>
                                                            <td class="auto-style106">1,147.500</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style103">
                                                                <asp:Button ID="Button34" runat="server" Font-Names="微軟正黑體" Text="移除" />
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label670" runat="server" Font-Size="Medium" Height="25px">小工</asp:Label>
                                                            </td>
                                                            <td class="auto-style103">
                                                                <asp:Label ID="Label676" runat="server" Font-Size="Medium" Height="25px" Width="50px">工</asp:Label>
                                                            </td>
                                                            <td class="auto-style105">
                                                                <asp:Label ID="Label683" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="壹.二.4.2.1F-鋼筋"></asp:Label>
                                                            </td>
                                                            <td class="auto-style106">0.675</td>
                                                            <td class="auto-style106">1,500.00</td>
                                                            <td class="auto-style106">1,012.500</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style103">
                                                                <asp:Button ID="Button35" runat="server" Font-Names="微軟正黑體" Text="移除" />
                                                            </td>
                                                            <td class="auto-style107">
                                                                <asp:Label ID="Label671" runat="server" Font-Size="Medium" Height="25px">零星工料，約以上項目之3.0%</asp:Label>
                                                            </td>
                                                            <td class="auto-style108">
                                                                <asp:Label ID="Label680" runat="server" Font-Size="Medium" Height="25px" Width="50px">式</asp:Label>
                                                            </td>
                                                            <td class="auto-style107"></td>
                                                            <td class="auto-style109">0.500</td>
                                                            <td class="auto-style109">592.00</td>
                                                            <td class="auto-style109">296.000</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style3">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td aria-orientation="horizontal" class="auto-style2R">
                                                                <asp:Button ID="Button36" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加分包預算工料" PostBackUrl="~/AddSubBudgetMaterial.aspx" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" colspan="2">
                                                    <asp:Button ID="Button16" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" />
                                                    &nbsp;&nbsp;
                                                    <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" />
                                                    &nbsp;
                                                    <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除分包預算" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
            </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
