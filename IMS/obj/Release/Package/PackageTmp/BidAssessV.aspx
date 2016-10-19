<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidAssessV.aspx.cs" Inherits="IMS.BidAssessV" %>


<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<style type="text/css">
.auto-style2 {
	  font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
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
    .auto-style14 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #82D900;
        width: 32px;
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
			<td class="Table1" width="30%">標案名稱</td>
			<td class="auto-style2" ><asp:Label ID="LbBidName" runat="server" Text="標案名稱"></asp:Label>
                </td>
		</tr>
		</table>
    <table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="TableTop" colspan="6" style="height: 29px">投標評估檢視</td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="9">條<br />
                件<br />
                評<br />
                估</td>
			<td class="Table1" style="width: 200px; height: 45px;">1.施工技術能力</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition1" runat="server" Text="條件評估結果1"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote1" runat="server" Text="條件評估說明1"></asp:Label>
			</td>
			<td class="auto-style14" rowspan="9">合<br />
                約<br />
                條<br />
                款<br />
                評<br />
                估</td>
			<td class="Table1" style="width: 200px; height: 45px;">1.開工期限合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract1" runat="server" Text="合約條款評估結果1"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote1" runat="server" Text="合約條款評估說明1"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">2.人力機具負荷</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition2" runat="server" Text="條件評估結果2"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote2" runat="server" Text="條件評估說明2"></asp:Label>
			</td>
			<td class="Table1" style="width: 200px; height: 45px;">2.工期合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract2" runat="server" Text="合約條款評估結果2"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote2" runat="server" Text="合約條款評估說明2"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">3.規範圖說</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition3" runat="server" Text="條件評估結果3"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote3" runat="server" Text="條件評估說明3"></asp:Label>
			</td>
			<td class="Table1" style="width: 200px; height: 45px;">3.工期階段管制合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract3" runat="server" Text="合約條款評估結果3"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote3" runat="server" Text="合約條款評估說明3"></asp:Label>
                </td>

		</tr>
		<tr>
			<td class="Table1">4.工址現況</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition4" runat="server" Text="條件評估結果4"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote4" runat="server" Text="條件評估說明4"></asp:Label>
			</td>
			<td class="Table1">4.保固合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract4" runat="server" Text="合約條款評估結果4"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote4" runat="server" Text="合約條款評估說明4"></asp:Label>
			    </td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">5.估算時間</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition5" runat="server" Text="條件評估結果5"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote5" runat="server" Text="條件評估說明5"></asp:Label>
			</td>
			<td class="Table1" style="width: 200px; height: 45px;">5.承攬方式合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract5" runat="server" Text="合約條款評估結果5"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote5" runat="server" Text="合約條款評估說明5"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1">6.特殊限制約定</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbCondition6" runat="server" Text="條件評估結果6"></asp:Label>
                <br />
                說明：<asp:Label ID="LbConditionNote6" runat="server" Text="條件評估說明6"></asp:Label>
			</td>
			<td class="Table1" style="width: 200px; height: 45px;">6.付款辦法合理性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract6" runat="server" Text="合約條款評估結果6"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote6" runat="server" Text="合約條款評估說明6"></asp:Label>
                </td>

		</tr>
		<tr>
			<td class="auto-style2" colspan="2" rowspan="3">&nbsp;</td>
			<td class="Table1" style="width: 200px; height: 45px;">7.物價補貼</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract7" runat="server" Text="合約條款評估結果7"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote7" runat="server" Text="合約條款評估說明7"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">8.對我不利條文</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract8" runat="server" Text="合約條款評估結果8"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote8" runat="server" Text="合約條款評估說明8"></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">9.合約條款適法性</td>
			<td class="auto-style2">
		        評估：<asp:Label ID="LbContract9" runat="server" Text="合約條款評估結果9"></asp:Label>
                <br />
                說明：<asp:Label ID="LbContractNote9" runat="server" Text="合約條款評估說明9"></asp:Label>
			</td>

		</tr>
		</table>
    
    <table class="auto-style5" style="width: 100%">
		<tr>
			<td class="auto-style14" rowspan="3" >
		        初<br />
		        評<br />
                結<br />
                果</td>
			<td class="Table1" width="30%">
		        評估人</td>
			<td class="auto-style2">
			    <asp:Label ID="LbPreMan" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評人"></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="Table1" >
		        評估建議</td>
			<td class="auto-style2">
			    <asp:Label ID="LbPreSuggestion" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評建議"></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="Table1" >
		        建議說明</td>
			<td class="auto-style2">
			    <asp:Label ID="LbPreResultNote" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="初評建議說明"></asp:Label>
		    </td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="3" >
		        複<br />
                評<br />
                結<br />
                果</td>
			<td class="Table1" >
		        評估人</td>
			<td class="auto-style2">
			    <asp:Label ID="LbReMan" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="複評人"></asp:Label>
		    </td>
		</tr>
		<tr>
			<td class="Table1" >
		        評估建議</td>
			<td class="auto-style2">
			    <asp:Label ID="LbResult" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="複評建議"></asp:Label>
		    </td>
		</tr>
		<tr>
			<td class="Table1" >
		        建議說明</td>
			<td class="auto-style2">
			    <asp:Label ID="LbResultNote" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="複評建議說明"></asp:Label>
		        <br />
		    </td>
		</tr>
		</table>
</form>

</body>

</html>
