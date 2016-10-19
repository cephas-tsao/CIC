<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master"  CodeBehind="BidInfo2.aspx.cs" Inherits="IMS.BidInfo2" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>初步招標訊息</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
  <%--  <style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
.auto-style3 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFF99;
	text-align: center;
	color: #000000;
}
.auto-style4 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
	color: #000000;
}
.center {
	text-align: center;
}
.right {
	text-align: right;
}
.auto-style6 {
	font-size: small;
	color: #FF0000;
}
.largebutton {
	font-family: 微軟正黑體;
    font-size: large;
    font-weight:bold;
}


.auto-style7 {
	font-size: small;
	color: #008000;
}


</style>--%>

	<br />

 <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
 
<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif; padding-left:200px">
	<tr>
		<td class="auto-style3">請選擇標案</td>
		<td class="auto-style4" colspan="7">		
    <asp:DropDownList ID="DropDownList1"  runat="server"  Width="300px" Font-Size="20px" AutoPostBack="true" DataTextField="BidName" DataValueField="BidName"></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server">    
        </asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
  <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BIDNAME" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
		</td>
	</tr>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlEmployees" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
	<tr>
		<td class="auto-style1" colspan="8" style="height: 27px">公告招標資訊</td>
	</tr>
	<tr>
		<td class="auto-style3">標案名稱</td>
		<td class="auto-style4" colspan="3">
            <asp:Literal ID="ltName" runat="server"></asp:Literal>
	
		</td>
		<td class="auto-style3">標案狀態</td>
		<td class="auto-style4" colspan="3">
            <asp:Literal ID="LtStatus" runat="server"></asp:Literal>
	
		<%--<span class="auto-style7"><br />
		*修改標案狀態請至初步招標訊息</span>--%></td>
	</tr>
             </ItemTemplate>
    </asp:Repeater>
	<tr>
		<td class="auto-style3">工程所在國家</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="300px" Font-Size="Medium">          
		</asp:DropDownList>
		</td>
		<td class="auto-style3">工程所在縣市</td>
		<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList4" runat="server" Height="30px" Width="300px" Font-Size="Medium">            
		</asp:DropDownList>
		</td>
	</tr>

	<tr>
		<td class="auto-style3">電子領標</td>
		<td class="auto-style4">
		<asp:DropDownList id="DropDownList5" runat="server" Height="32px" Width="173px" Font-Size="Medium">
          <%--   <asp:ListItem Value="0"  Text="請選擇"></asp:ListItem>  
            <asp:ListItem Value="1">是</asp:ListItem>
              <asp:ListItem Value="2">否</asp:ListItem>--%>
		</asp:DropDownList>
		</td>
		<td class="auto-style3">
		電子投標</td>
		<td class="auto-style4">
		<asp:DropDownList id="DropDownList6" runat="server" Height="32px" Width="173px" Font-Size="Medium">
            <%--  <asp:ListItem Value="0"  Text="請選擇"></asp:ListItem>  
             <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="2">否</asp:ListItem>--%>
		</asp:DropDownList>
		</td>
		<td class="auto-style3">截標時間</td>
		<td class="auto-style4" colspan="3">      
		<asp:TextBox id="EndDate" runat="server" Height="30px" Width="150px" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true}));"></asp:TextBox>
			
	<%--	<asp:DropDownList id="DropDownList10" runat="server" Height="32px" Width="60px" Font-Size="Medium">
			<asp:ListItem>AM</asp:ListItem>
			<asp:ListItem>PM</asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox id="TextBox21" runat="server" Height="30px" Width="100px"></asp:TextBox>--%>
		</td>
	</tr>

	<tr>
		<td class="auto-style3">業主名稱</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OwnerName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
		<td class="auto-style3">業主聯絡人</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OwnerContactPerson" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="auto-style3">業主地址</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OwnerAddress" runat="server" Height="30px" Width="400px"></asp:TextBox>
			</td>
		<td class="auto-style3">業主聯絡電話</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OwnerContactTel" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
	</tr>

	<tr>
		<td class="auto-style3" style="height: 24px">領標地址</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:TextBox id="GetBidAddress" runat="server" Height="30px" Width="400px"></asp:TextBox>
		</td>
		<td class="auto-style3" style="height: 24px">押圖費</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:TextBox id="IlluBond" runat="server" Height="30px" Width="300px"></asp:TextBox>
		元</td>
	</tr>

	<tr>
		<td class="auto-style3">圖說費</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="IlluFee" runat="server" Height="30px" Width="300px"></asp:TextBox>
		元</td>
		<td class="auto-style3">退圖期限</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="ReturnIlluDeadline" runat="server" Height="30px" Width="300px" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true}));"></asp:TextBox>
		
		</td>
	</tr>
	<tr>
		<td class="auto-style3">履約保證金</td>
		<td class="auto-style4" colspan="3">
		<table style="width: 100%">
			<tr>
				<td style="width: 90px">
		<asp:RadioButtonList id="PerformanceBondType" runat="server">
			<asp:ListItem Value="0" >金額</asp:ListItem>
			<asp:ListItem Value="1" >百分比</asp:ListItem>
		</asp:RadioButtonList>
				</td>
				<td>
		<asp:TextBox id="PerformanceBond" runat="server" Height="30px" Width="200px"></asp:TextBox>
		(元)</td>
			</tr>
		</table>
		</td>
		<td class="auto-style3">押標金</td>
		<td class="auto-style4" colspan="3">
		<table style="width: 100%">
			<tr>
				<td style="width: 90px">
		<asp:RadioButtonList id="BidBondType" runat="server">
			<asp:ListItem Value="0" >金額</asp:ListItem>
			<asp:ListItem Value="1">百分比</asp:ListItem>
		</asp:RadioButtonList>
				</td>
				<td>
		<asp:TextBox id="BidBond" runat="server" Height="30px" Width="200px"></asp:TextBox>
		(元)</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">廠商投標規定</td>
		<td class="auto-style4" colspan="7">
		<asp:TextBox id="FirmQualif" runat="server" Height="100px" Width="600px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3">開標地點</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OpenBidAddress" runat="server" Height="30px" Width="400px"></asp:TextBox>
		</td>
		<td class="auto-style3">開標時間</td>
		<td class="auto-style4" colspan="3">
		<asp:TextBox id="OpenBidTime" runat="server" Height="30px" Width="150px" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true}));"></asp:TextBox>
			
	<%--	<asp:DropDownList id="DropDownList11" runat="server" Height="32px" Width="60px" Font-Size="Medium">
			<asp:ListItem>AM</asp:ListItem>
			<asp:ListItem>PM</asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox id="TextBox23" runat="server" Height="30px" Width="100px"></asp:TextBox>--%>
		</td>
	</tr>
	<tr>
		<td class="auto-style3" style="height: 24px">決標方式</td>
		<td class="auto-style4" colspan="3" style="height: 24px">
		<asp:DropDownList id="AwardingType" runat="server" Height="30px" Width="300px" Font-Size="Medium" >
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 24px">共同投標</td>
		<td class="auto-style4" style="height: 24px">
		<asp:DropDownList id="JointBidNY" runat="server" Height="32px" Width="173px" Font-Size="Medium">
     <%--          <asp:ListItem Value="0" ></asp:ListItem>  
            <asp:ListItem Value="1">是</asp:ListItem>
              <asp:ListItem Value="2">否</asp:ListItem>--%>
		</asp:DropDownList>
		</td>
		<td class="auto-style3" style="height: 24px">
		已領標</td>
		<td class="auto-style4" style="height: 24px">
		<asp:DropDownList id="GetBidNY" runat="server" Height="32px" Width="173px" Font-Size="Medium">
              <%-- <asp:ListItem Value="0"  Text="請選擇"></asp:ListItem>  
              <asp:ListItem Value="1">是</asp:ListItem>
              <asp:ListItem Value="2">否</asp:ListItem>--%>
		</asp:DropDownList>
		</td>
	</tr>
    <tr><td></td></tr> <tr><td></td></tr>
	<tr >
		<td colspan="8" class="center">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px"  OnClick="SaveAction"/>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" OnClick="Recovery_Click" />
		</td>
        </tr>
           </table>
    
		

   

    </asp:Content>