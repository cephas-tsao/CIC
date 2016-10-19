<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="BidDurationNew.aspx.cs" Inherits="IMS.BidDurationNew" %>


    <title>逾罰明細資料新增</title>


    <style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: large;
	font-family: 微軟正黑體;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style2 {
	font-family: 微軟正黑體;
	background-color: #FFFBD6;
}
.auto-style3 {
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
        .auto-style6 {
            font-family: 微軟正黑體;
            text-align: center;
            background-color: #FFFF99;
          
        }
        .auto-style7 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
           
        }
        .auto-style8 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
           
        }
        .auto-style10 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
          
        }
        .auto-style11 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
          
        }
        .auto-style13 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
          
        }
        .auto-style14 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
            width: 163px;
        }
        .auto-style15 {
            font-family: 微軟正黑體;
            background-color: #FFFBD6;
            
        }
    </style>
<link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<form id="form1" runat="server">
	<br />
	<table style="width: 100%; height: 267px">
		<tr>
			<td class="TableTop" colspan="5"><strong>逾罰明細資料新增</strong></td>
		</tr>
		<tr>
			<td class="Table1" style="width:200px;text-align:center">階段名稱</td>
			<td class="Table2" colspan="4">
		<asp:TextBox id="StageName" runat="server" Height="30px" Width="234px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px;">工期</td>
			<td class="Table2" colspan="2"  >
               <asp:RadioButtonList ID="DurationType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table"  CellSpacing="10" Width="350px"  AutoPostBack="true" OnSelectedIndexChanged="DurationType_IndexChange">

               </asp:RadioButtonList>
		
                <%--<input name="Radio1" type="radio" value="123" /><span class="auto-style4">西元</span>--%></td>
		<%--</tr>
        <tr>--%>
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
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定新增" Width="100px"  OnClick="SaveAction"  />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="全部清空" Width="100px"  OnClick="Clear_Click" />
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="關閉" Width="100px" OnClientClick="window.close()" />
            
		</tr>
	</table>

</form>




