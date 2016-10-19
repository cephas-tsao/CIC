<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidInfo3.aspx.cs" Inherits="IMS.BidInfo3" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>工程合約資料</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
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
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.auto-style8 {
	text-decoration: underline;
}
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style13 {
	font-size: small;
	color: #FF0000;
}
.auto-style14 {
	color: #008000;
	font-size: small;
}
</style>


	<br />
	<table class="auto-style5" style="width: 100%; height: 587px; padding-left:200px">
		<tr>
		<td class="auto-style7">請選擇標案</td>
		<td class="auto-style12" colspan="3">
	   <asp:DropDownList ID="DropDownList3"  runat="server"  Width="300px" Font-Size="20px" AutoPostBack="true" DataTextField="BidName" DataValueField="BidName"></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server">    
        </asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
  <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BIDNAME" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
           <%-- <span class="auto-style13">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />--%>
		</td>
	</tr>

		   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlEmployees" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			合約概要</strong></td>
		</tr>
	<tr>
		<td class="auto-style7" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style12" style="height: 45px">
            <asp:Literal ID="ltName" runat="server"></asp:Literal>
	
		</td>
	<td class="auto-style7">標案狀態</td>
			<td class="auto-style12">
            <asp:Literal ID="LtStatus" runat="server"></asp:Literal>
	
		<%--<span class="auto-style7"><br />
		*修改標案狀態請至初步招標訊息</span>--%></td>
	</tr>
             </ItemTemplate>
    </asp:Repeater>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
		</tr>
		<tr>
				<td class="auto-style7" style="width: 200px; height: 26px;">承攬方式</td>
			<td class="auto-style12" colspan="3" style="height: 26px">
			<asp:RadioButtonList id="ContractWay" runat="server" RepeatDirection="Horizontal">
				<%--<asp:ListItem>實做實算</asp:ListItem>
				<asp:ListItem>總價承攬</asp:ListItem>
				<asp:ListItem>實做+總價</asp:ListItem>
				<asp:ListItem>統包</asp:ListItem>
				<asp:ListItem>其他</asp:ListItem>--%>
			</asp:RadioButtonList>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">業主名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="OwnerName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建築師/設計單位名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="ArchitectName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">監造單位名稱</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<asp:TextBox id="ConsultantName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">PCM名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="PCMname" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工期計算方式</td>
			<td class="auto-style12" style="width: 300px">
		<asp:DropDownList id="DurationType" runat="server" Height="30px" Width="300px">
		<%--	<asp:ListItem>-請選擇-</asp:ListItem>
			<asp:ListItem>限期完工</asp:ListItem>
			<asp:ListItem>工作天</asp:ListItem>
			<asp:ListItem>日曆天</asp:ListItem>
			<asp:ListItem>其他</asp:ListItem>--%>
		</asp:DropDownList>
			</td>
			<td class="auto-style7" style="width: 200px">工期</td>
			<td class="auto-style12" style="width: 300px">
		<asp:TextBox id="Duration" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>
		</tr>
		<tr>
			<td class="auto-style1" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="punish" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" OnClick="punish_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Warranty" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px"  OnClick="Warranty_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="BidPay" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px"  OnClick="BidPay_Click"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="BidCaution" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px" OnClick="BidCaution_Click" />
			</td>
		</tr>
		</table>


</asp:Content>
