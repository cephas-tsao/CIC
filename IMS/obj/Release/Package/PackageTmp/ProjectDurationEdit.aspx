<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDurationEdit.aspx.cs" Inherits="IMS.ProjectDurationEdit" %>

<head id="Head1" runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<title>逾罰明細資料新增</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: large;
	font-family: 微軟正黑體;
	color: #FFFFFF;
	background-color: #800000;
}

.auto-style4 {
	font-size: small;
}
.auto-style5 {
	font-family: 微軟正黑體;
	text-align: center;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="Table100" >
		<tr>
			<td class="TableTop" colspan="5"><strong>逾罰明細資料修改</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px;">階段名稱</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="StageName" runat="server" Height="30px" Width="234px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px;">工期</td>
			<td class="Table2" style="column-width:400px" colspan="2"  >
               <asp:RadioButtonList ID="DurationType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table"  CellSpacing="10" Width="500px"  AutoPostBack="true" OnSelectedIndexChanged="DurationType_IndexChange">

               </asp:RadioButtonList>		
              </td>
		
            	<td class="Table2">
            <asp:TextBox id="Duration" runat="server" Height="30px" Width="150px"></asp:TextBox></td>	
		   <td class="Table2"> <asp:literal id="ltDuration" runat="server"></asp:literal>
          </td>
         
		</tr>
		<tr>
			<td class="Table1" style="width: 200px" >逾罰</td>
			<td class="Table2" colspan="2">
                <asp:RadioButtonList ID="PunishType" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Table" CellSpacing="10" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="PunishType_IndexChange" >

                </asp:RadioButtonList></td>
			<td class="Table2"><asp:TextBox id="Punish" runat="server" Height="30px" Width="150px"></asp:TextBox></td>
              <td class="Table2"> <asp:literal id="LtPunish" runat="server"></asp:literal>
          </td>
		
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">說明</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="Notes" runat="server" Height="30px" Width="650px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" colspan="5" style="height: 45px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px"  OnClick="SaveAction"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px"  OnClick="Recovery_Click"/>
			</td>
		</tr>
	</table>
</form>

</body>
