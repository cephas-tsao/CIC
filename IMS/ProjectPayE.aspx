<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectPayE.aspx.cs" Inherits="IMS.ProjectPayE" %>

<!DOCTYPE html>

 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>業主付款方式</title>
<style type="text/css">
.auto-style1 {
	font-size: large;
	text-align: center;
	background-color: #800000;
}
.auto-style4 {
	color: #FFFFFF;
	background-color: #800000;
}

.auto-style8 {
	font-size: small;
}
.auto-style9 {
	font-size: large;
}


.auto-style12 {
	font-family: 微軟正黑體;
}

.auto-style14 {
	font-size: medium;
}
.auto-style15 {
	color: #008000;
}
</style>
</head>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
<script type="text/javascript">
    function ValidateFloat2(e, pnumber) {
        //if (!/^\d{1,2}\+[.]?[0-9]?$/.test(pnumber)) {
        if (!/^\d{1,2}(?:\.\d{1,2})?$/.test(pnumber)) {
            //e.value = /\d{1,2}\+[.]?[0-9]?/.exec(e.value);
            e.value = /^\d{1,2}(?:\.\d{1,2})?/.exec(e.value);
            //if(!(/^\d{11}$/g.test(phone)))

        }
        return false;
    }

  
</script>
<body>

<form id="form1" runat="server">
	<br />
	<table class="Table100">
		<tr>
			<td class="TableTop" colspan="4">
			<strong>業主付款方式編修</strong></td>
		</tr>
			<tr>
			<td class="Table1" style="width: 210px">預付款百分比</td>
			<td style="width: 190px" class="Table2">
		<asp:TextBox id="PrepayPercentage" runat="server" Height="30px" Width="125px" onkeyup="return ValidateFloat2(this,value);"></asp:TextBox><span class="auto-style9">%</span>
			</td>
			<td class="Table1" style="width: 160px">估驗頻率</td>
			<td class="Table2" style="width: 190px">&nbsp;<asp:TextBox id="EstAcceptNum" runat="server" Height="20px" Width="50px"></asp:TextBox>
			<span class="auto-style14">次/</span><span class="auto-style8">
		<asp:TextBox id="EstAcceptUnit" runat="server" Height="20px" Width="50px"></asp:TextBox>
			<br />
			<span class="auto-style15">(ex.1次/月)</span></span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">估驗日期1</td>
			<td style="width: 190px" class="Table2">
		<asp:TextBox id="EstAcceptDate1" runat="server" Height="30px" Width="125px" onclick="WdatePicker()"></asp:TextBox>
		&nbsp;
		
			</td>
			<td class="Table1" style="width: 160px">估驗日期2</td>
			<td style="width: 190px" class="Table2">
		<asp:TextBox id="EstAcceptDate2" runat="server" Height="30px" Width="125px" onclick="WdatePicker()"></asp:TextBox>
		&nbsp;
		
			</td>
		</tr>
		<tr>
			<td class="Table1" style="width: 210px">保留款百分比</td>
			<td style="width: 190px" class="Table2">
		<asp:TextBox id="RetentionPercentage" runat="server" Height="30px" Width="85px" onkeyup="return ValidateFloat2(this,value);"></asp:TextBox>
			<span class="auto-style9">%</span></td>
			<td class="Table1" style="width: 160px">物價補貼</td>
			<td style="width: 190px" class="Table2">
		<asp:DropDownList id="PriceSubsidyNY" runat="server" Height="30px" Width="85px">
			<asp:ListItem Selected="True">-請選擇-</asp:ListItem>
			<asp:ListItem Value="0">是</asp:ListItem>
			<asp:ListItem Value="1">否</asp:ListItem>
		</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="Table1" style="height: 60px; width: 210px">其他付款規定</td>
			<td class="Table2" colspan="3" style="height: 60px">
		<asp:TextBox id="OtherPayment" runat="server" Height="100px" Width="471px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table1" colspan="4" style="height: 40px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>
		</tr>
	</table>
</form>

</body>

</html>

