<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidRecord.aspx.cs" Inherits="IMS.BidRecord" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>工程合約資料</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
}
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style5 {
	border-width: 0px;
	font-family: 微軟正黑體;
}

.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}

.auto-style13 {
	font-size: small;
	color: #FF0000;
}
.auto-style14 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #F5F7FB;
    text-align:right;
}
    .auto-style15 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        width: 200px;
        height: 45px;
    }
    .auto-style16 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
    }
    .auto-style17 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        height: 45px;
    }
    </style>
   
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 

    	<br />
	<table class="auto-style5" style="width: 100%;border-color:white" border="1">
		<tr>
		<td class="Table1">請選擇標案</td>
		<td class="Table2" colspan="3">
		<asp:DropDownList id="DropDownList3" AppendDataBoundItems="true" runat="server" Height="30px" Width="300px" Font-Size="Medium" AutoPostBack="True" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" >
            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
		</asp:DropDownList>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BidName" PropertyName="SelectedValue" />
            </SelectParameters>
		</asp:SqlDataSource> 	
	</tr>

		<tr>
			<td class="TableTop" colspan="4" style="height: 29px"><strong>
			    決標紀錄增修</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="Table2" style="height: 45px">
		        <asp:Label ID="LbBidName" runat="server"></asp:Label>
			</td>
			<td class="Table1">標案狀態</td>
			<td class="Table2">
			    <asp:Label ID="LbStatus" runat="server" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="TableTop" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.公告招標資訊</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="Table2" style="height: 45px">
		        <asp:Label ID="LbOwnerName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">預算金額</td>
			<td class="Table2">
		        <asp:Label ID="LbBudgetAmount" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="Table2" style="height: 45px">
		        <asp:Label ID="LbEngCountry" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">是否共同投標</td>
			<td class="Table2">
		        <asp:Label ID="LbJointBidNY" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">決標方式</td>
			<td class="Table2" style="height: 45px">
		        <asp:Label ID="LbAwardingType" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">開標時間</td>
			<td class="Table2">
		        <asp:Label ID="LbOpenBidTime" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">業主聯絡人</td>
			<td class="Table2" style="height: 45px">
		        <asp:Label ID="LbOwnerContactPerson" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">業主連絡電話</td>
			<td class="Table2">
		        <asp:Label ID="LbOwnerContactTel" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="TableTop" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.決標主紀錄</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">決標結果</td>
			<td class="Table2" style="height: 45px">
		        <asp:DropDownList ID="DropDownList4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px"  OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged"  >                    
                  <%--  <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    <asp:ListItem Value="1">得標</asp:ListItem>
                    <asp:ListItem Value="2">未得標</asp:ListItem>
                    <asp:ListItem Value="3">流標</asp:ListItem>
                    <asp:ListItem Value="4">廢標</asp:ListItem>
                    <asp:ListItem Value="5">重新招標</asp:ListItem>--%>
                </asp:DropDownList>
            </td>
			<td class="Table1">得標廠商</td>
			<td class="Table2">
			    <asp:TextBox ID="TxGetFirm" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">得標金額</td>
			<td class="Table2" style="height: 45px">
		        <asp:TextBox ID="TxAwardPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="Table1">底價金額</td>
			<td class="Table2">
			    <asp:TextBox ID="TxUpsetPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="TableTop" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; III.決標明細紀錄</td>

		</tr>
		<tr>
			<td class="Table1">參與開標人員</td>
			<td class="Table2">
		        <asp:TextBox ID="TxBidStaff" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="Table1">最初投標金額</td>
			<td class="Table2">
		        <asp:TextBox ID="TxBidPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">優先減價金額</td>
			<td class="Table2" style="height: 45px">
		        <asp:TextBox ID="TxFirstDiscountPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="Table1">最後減價金額</td>
			<td class="Table2">
		        <asp:TextBox ID="TxLastDiscountPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">備註</td>
			<td class="Table2" style="height: 45px" colspan="3">
		        <asp:TextBox ID="TxNotes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="400px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="Table1" colspan="4">
                <asp:Button id="Save" runat="server" Text="儲存修改" OnClick="SaveAction" CssClass="BtnLargeFree" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button id="Recovery" runat="server" Text="回復原值" OnClick="Recovery_Click" CssClass="BtnLargeFree" />
			    &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:LinkButton ID="zzz" runat="server" OnClick="zzz_Click" ></asp:LinkButton>
			</td>
		</tr>
		<tr>
			<td class="TableTop" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			IV.其他投標廠商紀錄</td>
		</tr>
		<tr>
			<td class="auto-style14" colspan="4">
                <asp:Button id="Button5" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="35px" Text="新增其他投標廠商紀錄" Width="200px" OnClientClick="window.open('BidFirmAdd.aspx', 'window', config='height=500,width=1000');" />
            </td>
		</tr>
		<tr>
			<td class="Table2" colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UID" DataSourceID="SqlDataSource2"  CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%"
                    OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                          <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">                          
              <ItemStyle Width="100px" />
                <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="Select"  Text="編輯" CommandArgument='<%# Container.DataItemIndex%>' />                
                </ItemTemplate>                     
<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>                     
                   
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="UID" Text='<%# Eval("UID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:BoundField DataField="BID" HeaderText="BID" SortExpression="BID" Visible="False" />                     
                        <asp:TemplateField HeaderText="廠商名稱">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="FirmName" Text='<%# Eval("FirmName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="是否合格" SortExpression="CheckNY">
                        
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"CheckNY"))==1)? "是":"否" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="是否得標" SortExpression="GetNY">                         
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"GetNY"))==1)? "是":"否" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="投標金額">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" DataFormatString="{0:N0}"  Text='<%# (DataBinder.Eval(Container.DataItem,"BidPrice")) %>'></asp:Label>
                            </ItemTemplate>                       
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="不合格/未得標原因">
                            <ItemTemplate>                          
                                 <asp:Label id="LbNoReason" runat="server"  Text='<%# Eval("NoReason")%>'></asp:Label>
                            </ItemTemplate>                         
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="標價偏低理由">
                            <ItemTemplate>
                              <%# Eval("LowReason") %>       
                            </ItemTemplate>                         
                        </asp:TemplateField>                 
                    </Columns>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    DeleteCommand="DELETE FROM [BidRecord_FirmList] WHERE [UID] = @UID"                    
                   >
                    <DeleteParameters>
                        <asp:Parameter Name="UID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BID" Type="Int32" />
                        <asp:Parameter Name="FirmName" Type="String" />
                        <asp:Parameter Name="CheckNY" Type="Int32" />
                        <asp:Parameter Name="GetNY" Type="Int32" />
                        <asp:Parameter Name="BidPrice" Type="Decimal" />
                        <asp:Parameter Name="NoReason" Type="String" />
                        <asp:Parameter Name="LowReason" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="BID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BID" Type="Int32" />
                        <asp:Parameter Name="FirmName" Type="String" />
                        <asp:Parameter Name="CheckNY" Type="Int32" />
                        <asp:Parameter Name="GetNY" Type="Int32" />
                        <asp:Parameter Name="BidPrice" Type="Decimal" />
                        <asp:Parameter Name="NoReason" Type="String" />
                        <asp:Parameter Name="LowReason" Type="String" />
                        <asp:Parameter Name="UID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
		</tr>
		</table>
    </asp:Content>