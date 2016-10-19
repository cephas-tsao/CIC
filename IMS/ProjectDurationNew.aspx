<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="ProjectDurationNew.aspx.cs" Inherits="IMS.ProjectDurationNew" %>
<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>逾罰明細資料新增</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: large;
	font-family: 微軟正黑體;
	color: #FFFFFF;
	background-color: #800000;
}
.Table2 {
	font-family: 微軟正黑體;
	background-color: #FFFBD6;
}
.Table1 {
	font-family: 微軟正黑體;
	text-align: center;
	background-color: #FFFF99;
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
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>

<form id="form1" runat="server">
	<br />
    <table class="Table100">
		<tr>
			<td class="TableTop" colspan="5"><strong>逾罰明細資料新增</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px;">階段名稱</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="StageName" runat="server" Height="30px" Width="234px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px;">工期</td>
			<td class="Table2" colspan="2"  >
               <asp:RadioButtonList ID="DurationType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table"  CellSpacing="10" Width="350px"  AutoPostBack="true" OnSelectedIndexChanged="DurationType_IndexChange">

               </asp:RadioButtonList>		
           
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
		<asp:TextBox id="Notes" runat="server" Height="30px" Width="520px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" colspan="5" style="height: 45px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定新增" Width="100px"  OnClick="SaveAction"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" Width="100px"  OnClick="Clear_Click"/>
			</td>
		</tr>
	</table>
	<%--<table style="width: 57%; height: 267px">
		<tr>
			<td class="auto-style1" colspan="5"><strong>逾罰明細資料新增</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">階段名稱</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="234px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">工期</td>
			<td class="Table2" style="width: 260px">
			<input name="Radio1" type="radio" value="123" /><span class="auto-style4">西元</span><br />
		<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="220px"></asp:TextBox>
			</td>
			<td class="Table2" style="width: 132px">
			<input name="Radio1" type="radio" value="123" /><span class="auto-style4">工作天</span><br />
		<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="61px"></asp:TextBox>
			<span class="auto-style4">天</span></td>
			<td class="Table2" style="width: 132px" valign="top">
			<input name="Radio1" type="radio" value="124" /><span class="auto-style4">日曆天</span><br />
		<asp:TextBox id="TextBox4" runat="server" Height="30px" Width="61px"></asp:TextBox>
			<span class="auto-style4">天</span></td>
			<td class="Table2" style="width: 132px" valign="top">
			<input name="Radio1" type="radio" value="125" /><span class="auto-style4">其他<br />
		<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="89px"></asp:TextBox>
			</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">逾罰</td>
			<td class="Table2" style="width: 260px">
			<input name="Radio1" type="radio" value="126" /><span class="auto-style4">千分之</span><br />
		<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="180px"></asp:TextBox>
			<span class="auto-style4">/每天</span></td>
			<td class="Table2" colspan="3" valign="top">
			<input class="auto-style4" name="Radio1" type="radio" value="127" /><span class="auto-style4">一天<br />
		<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="200px"></asp:TextBox>
			元</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">說明</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="520px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style5" colspan="5" style="height: 45px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定新增" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" Width="100px" />
			</td>
		</tr>
	</table>--%>
</form>

</body>

</html>
