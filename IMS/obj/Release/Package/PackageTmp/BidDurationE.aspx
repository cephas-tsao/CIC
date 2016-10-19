<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="BidDurationE.aspx.cs" Inherits="IMS.BidDurationE" %>

    <title>工期逾期罰資料</title>



    <style type="text/css">
.auto-style1 {
	text-align: center;
}
.auto-style2 {
	text-align: left;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style4 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style6 {
	font-size: small;
}
.auto-style7 {
	margin-top: 0px;
}
.auto-style8 {
	font-size: medium;
}
.auto-style10 {
	border-width: 0px;
}
.auto-style16 {
	border-style: none;
	border-width: medium;
}
.auto-style17 {
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style18 {
	font-family: 微軟正黑體;
}
.auto-style19 {
	background-color: #FFFBD6;
}
.auto-style20 {
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
</style>
<link rel="stylesheet" type="text/css" href="./css/Style1.css" />
   <form id="form1" runat="server">
	<br />
	<table class="auto-style18" style="width: 100%; height: 300px">
		<tr>
			<td class="TableTop" colspan="2"><strong>工期逾罰資料編修</strong></td>
		</tr>
		<tr>
			<td class="TableTop2" colspan="2" style="height: 24px">
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px">開工期限</td>
			<td class="Table2" style="height: 50px" valign="top">
                <asp:RadioButtonList ID="StartDeadlinetype" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" OnSelectedIndexChanged="DurationType_IndexChange" AutoPostBack="true" ></asp:RadioButtonList>
		
          <span style="padding-left:300PX;margin-bottom:-150PX" >      <asp:TextBox id="StartDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>&nbsp;<asp:label runat="server" id="ltDuration" ></asp:label></span></td>
		
		</tr>
		<tr>
			<td class="Table1" style="height: 40px">完工提報期限</td>
			<td class="Table2" style="height: 40px">
			<span class="auto-style8">完工後</span><span class="auto-style6">&nbsp;
		<asp:TextBox id="CompletionEscDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table1">工期延展<br />
			提報期限</td>
			<td class="Table2">事件發生後<span class="auto-style6"><asp:TextBox id="DelayEscDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table1" colspan="2">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click"/>
                 <%--   <asp:linkbutton ID="callback" runat="server" OnClick="callback"></asp:linkbutton>--%>
                    <asp:LinkButton ID="callback" runat="server" OnClick="callback_Click"></asp:LinkButton>
			</td>
		</tr>
		<tr>
			<td class="TableTop2" colspan="2">
			<span class="auto-style3">逾罰明細</span>
		<span style="float:right"><asp:Button id="add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增逾罰明細資料" Width="175px"  OnClick="add_Click"  /></span>
			</td>
		</tr>
     
<%--		<tr>
			<td colspan="2">--%>
			<table class="Table100" style="width: 100%">
				<tr>
					<td class="Table1" style="width: 115px">&nbsp;</td>
					<td class="Table1" style="width: 266px"><strong>階段名稱</strong></td>
					<td class="Table1" style="width: 120px"><strong>工期</strong></td>
					<td class="Table1" style="width: 120px"><strong>逾罰</strong></td>
					<td class="Table1"><strong>說明</strong></td>
				</tr>
                </table>
                   <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
            <ItemTemplate>
                  <asp:Panel ID="plItem" runat="server">
                <table class="auto-style10" style="width: 100%">
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;
		<asp:Button id="edit" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="編輯" Width="51px"  CommandName="Edit" CommandArgument='<%#Eval("PunishID") %>'/>
		<asp:Button id="delete_Click" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="刪除" Width="51px"  CommandName="Delete"  OnClientClick="return confirm('確定刪除嗎?');" CommandArgument='<%#Eval("PunishID") %>'/>
					</td>
                   <%-- <td class="auto-style20" style="width: 266px"><asp:Literal ID="PunishID" runat="server" Visible="false" ></asp:Literal></td>--%>
					<td class="Table2" style="width: 266px"><asp:Literal ID="StageName" runat="server"></asp:Literal></td>
					<td class="Table2" style="width: 120px"><asp:Literal ID="Duration" runat="server"></asp:Literal></td>
					<td class="Table2" style="width: 120px"><asp:Literal ID="Punish" runat="server"></asp:Literal></td>
					<td class="Table2" ><asp:Literal ID="Notes" runat="server"></asp:Literal></td>
				</tr>
		
			</table>              
		</asp:Panel>
                 <asp:Panel ID="plEdit" runat="server">
  <table class="auto-style10" style="width: 100%">
				<tr>
					<td class="auto-style16" style="width: 115px">&nbsp;
                 
		<asp:Button  ID="lbtUpdate" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="更新" Width="51px" CommandName="Update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PunishID")%>'  />
		<asp:Button ID="lbtCancel" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="取消" Width="51px"  CommandName="Cancel"  CommandArgument='<%#Eval("PunishID") %>'/>
					</td>
                  <%--  <td class="auto-style20" style="width: 266px"><asp:TextBox ID="Literal1" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem,"PunishID") %>'></asp:TextBox></td>--%>
					<td class="Table2" style="width: 266px"><asp:TextBox ID="TxStageName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem,"StageName") %>'></asp:TextBox></td>
					<td class="Table2" style="width: 120px"><asp:TextBox ID="TxDuration" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem,"Duration") %>'></asp:TextBox></td>
					<td class="Table2" style="width: 120px"><asp:TextBox ID="TxPunish" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem,"Punish") %>'></asp:TextBox></td>
					<td class="Table2" ><asp:TextBox ID="TxNotes" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem,"Notes") %>'></asp:TextBox></td>
				</tr>
		
			</table>              
                     </asp:Panel>
                  </ItemTemplate>
                </asp:Repeater>
	</table>

</form>