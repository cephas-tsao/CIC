<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
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
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #82D900;
        width: 32px;
    }
.auto-style71 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
    width:50%;
}
    .auto-style72 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
        width: 292px;
    }
    .auto-style73 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        width: 200px;
        height: 45px;
    }
    .auto-style74 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        height: 45px;
    }
    .auto-style75 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
    }
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 85%">
		<tr>
		<td class="auto-style7" colspan="2">請選擇標案</td>
		<td class="auto-style12" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" Font-Size="Medium" Font-Names="微軟正黑體">
		</asp:DropDownList>
		<span class="auto-style13">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />
		</td>
	</tr>

		<tr>
			<td class="auto-style2" colspan="5" style="height: 29px">投標評估(複評)</td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="8">標<br />
                案<br />
                基<br />
                本<br />
                資<br />
                料</td>
			<td class="auto-style7" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="auto-style72">
		        <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主名稱"></asp:Label>
			</td>
			<td class="auto-style7">建築師/設計單位名稱</td>
			<td class="auto-style12">
			    <asp:Label ID="Label2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="建築師名稱"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="auto-style72">
		        <asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="國家-縣市"></asp:Label>
			</td>
			<td class="auto-style7">工期</td>
			<td class="auto-style12">
			    <asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XX天O天"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">截標日期</td>
			<td class="auto-style72">
		        <asp:Label ID="Label5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="截標日期"></asp:Label>
			&nbsp;</td>
			<td class="auto-style7">開標日期</td>
			<td class="auto-style12">
			    <asp:Label ID="Label6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="開標日期"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">圖說費</td>
			<td class="auto-style72">
		        <asp:Label ID="Label7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="圖說費"></asp:Label>
			</td>
			<td class="auto-style7">押圖費</td>
			<td class="auto-style12">
			    <asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="押圖費"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">履約保證金</td>
			<td class="auto-style72">
		        <asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXOO(%/元)"></asp:Label>
			</td>
			<td class="auto-style7">押標金</td>
			<td class="auto-style12">
			    <asp:Label ID="Label10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXOO(%/元)"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">樓層數</td>
			<td class="auto-style72">
		        <asp:Label ID="Label11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="地上O樓地下O樓"></asp:Label>
			</td>
			<td class="auto-style7">樓地板面積</td>
			<td class="auto-style12">
			    <asp:Label ID="Label12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="地上OM2地下OM2"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style73">基礎型式</td>
			<td class="auto-style72">
		        <asp:Label ID="Label13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="基礎型式"></asp:Label>
			</td>
			<td class="auto-style74">擋土措施</td>
			<td class="auto-style75">
			    <asp:Label ID="Label14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="擋土措施"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 45px;">開工期限</td>
			<td class="auto-style72">
		        <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXXXOO(天)"></asp:Label>
			</td>
			<td class="auto-style7">物價調整補貼</td>
			<td class="auto-style12">
			    <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="是/否"></asp:Label>
			</td>

		</tr>
		</table>
    <table class="auto-style5" style="width: 85%">
		<tr>
			<td class="auto-style71" >
		<asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="查看條件評估" Width="200px" />
			</td>
			<td class="auto-style71">
		<asp:Button id="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="查看合約條款評估" Width="200px" />
			</td>
		</tr>
		</table>
    <table class="auto-style5" style="width: 85%">
		<tr>
			<td class="auto-style14" rowspan="3" >
		        初<br />
		        評<br />
                結<br />
                果</td>
			<td class="auto-style7" >
		        評估人</td>
			<td class="auto-style72">
			    <asp:Label ID="Label19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評人"></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="auto-style7" >
		        評估建議</td>
			<td class="auto-style72">
			    <asp:Label ID="Label17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評建議"></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="auto-style7" >
		        建議說明</td>
			<td class="auto-style72">
			    <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評建議說明"></asp:Label>
		    </td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="3" >
		        複<br />
                評<br />
                結<br />
                果</td>
			<td class="auto-style7" >
		        評估建議</td>
			<td class="auto-style72">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="YES">參與競標</asp:ListItem>
                    <asp:ListItem Value="NO">不參與競標</asp:ListItem>
                </asp:RadioButtonList>
		    </td>
		</tr>
		<tr>
			<td class="auto-style7" >
		        建議說明</td>
			<td class="auto-style72">
		<asp:TextBox id="TextBox17" runat="server" Height="100px" Width="1000px" TextMode="MultiLine"></asp:TextBox>
		    </td>
		</tr>
		<tr>
			<td class="auto-style7" colspan="2" >
		<asp:Button id="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="暫存結果" Width="145px" />
		        &nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button6" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="確定送出" Width="145px" />
		        </td>
		</tr>
		</table>
</form>

</body>

</html>
