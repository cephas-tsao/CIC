<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidReAssess.aspx.cs" Inherits="IMS.BidReAssess" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-工程合約資料編修</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        font-weight: 700;
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
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <Area:MemberBoxUC ID="MemberBox" runat="server" />
	<br />
	<table class="Table100" style="width: 100%;border-color:white" border="1">
		<tr>
		<td class="Table1" colspan="2">請選擇標案</td>
		<td class="Table2" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" DataTextField="BidName" DataValueField="Bid" AutoPostBack="true"  Height="30px" Width="300px" Font-Size="Medium" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
		</asp:DropDownList>
	<%--	<span class="auto-style13">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />--%>
	 <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BidName" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
            	</td>
	</tr>

		<tr>
			<td class="TableTop" colspan="5" style="height: 29px">投標評估(複評)</td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="8">標<br />
                案<br />
                基<br />
                本<br />
                資<br />
                料</td>
			<td class="Table1" style="width: 200px; height: 45px;">業主名稱</td>
			<td class="Table2">
		        <asp:Label ID="LbOwnerName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">建築師/設計單位名稱</td>
			<td class="Table2">
			    <asp:Label ID="LbArchitectName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="Table2">
		        <asp:Label ID="LbEngCountry" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">工期</td>
			<td class="Table2">
			    <asp:Label ID="LbDuration" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">截標日期</td>
			<td class="Table2">
		        <asp:Label ID="LbBiddingEndDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			&nbsp;</td>
			<td class="Table1">開標日期</td>
			<td class="Table2">
			    <asp:Label ID="LbOpenBidTime" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">圖說費</td>
			<td class="Table2">
		        <asp:Label ID="LbIlluFee" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">押圖費</td>
			<td class="Table2">
			    <asp:Label ID="LbIlluBond" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">履約保證金</td>
			<td class="Table2">
		        <asp:Label ID="LbPerformanceBond" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">押標金</td>
			<td class="Table2">
			    <asp:Label ID="LbBidBond" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">樓層數</td>
			<td class="Table2">
		        <asp:Label ID="LbUpFloorNum" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">樓地板面積</td>
			<td class="Table2">
			    <asp:Label ID="LbUpFloorArea" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1">基礎型式</td>
			<td class="Table2">
		        <asp:Label ID="LbFoundationType" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">擋土措施</td>
			<td class="Table2">
			    <asp:Label ID="LbRetaining" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">開工期限</td>
			<td class="Table2">
		        <asp:Label ID="LbStartDeadline" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>
			<td class="Table1">物價調整補貼</td>
			<td class="Table2">
			    <asp:Label ID="LbPriceSubsidyNY" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
			</td>

		</tr>
		</table>
    <table class="Table100" style="width: 100%;border-color:white" border="1">
		<tr>
			<td class="Table1" >
		<asp:Button id="Condition" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="查看條件評估" Width="200px"  OnClientClick="window.open('ConditionV.aspx', 'window', config='height=400,width=900');" />
			</td>
			<td class="Table1">
		<asp:Button id="Contract" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="查看合約條款評估" Width="200px" OnClientClick="window.open('ContractV.aspx', 'window', config='height=520,width=900');"/>
			</td>
		</tr>
		</table>
    <table class="Table100" style="width: 100%;border-color:white" border="1">
		<tr>
			<td class="auto-style14" rowspan="3" style="width:4%" >
		        初<br />
		        評<br />
                結<br />
                果</td>
			<td class="Table1" style="width:20%">
		        評估人</td>
			<td class="Table2" style="width:76%">
			    <asp:Label ID="LbPreMan" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="Table1" style="width:300px">
		        評估建議</td>
			<td class="Table2" style="width:400px">
			    <asp:Label ID="LbPreSuggestion" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
            </td>
		</tr>
		<tr>
			<td class="Table1" style="width:300px">
		        建議說明</td>
			<td class="Table2" style="width:400px">
			    <asp:Label ID="LbPreResultNote" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
		    </td>
		</tr>
		<tr>
			<td class="auto-style14" rowspan="3" style="width:30px">
		        複<br />
                評<br />
                結<br />
                果</td>
			<td class="Table1" style="width:300px">
		        評估建議</td>
			<td class="Table2" style="width:400px">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="50%">
                    <asp:ListItem Value="0">參與競標</asp:ListItem>
                    <asp:ListItem Value="1">不參與競標</asp:ListItem>
                </asp:RadioButtonList>
		    </td>
		</tr>
		<tr>
			<td class="Table1" style="width:300px">
		        建議說明</td>
			<td class="Table2" style="width:400px">
		<asp:TextBox id="TxResultNote" runat="server" Height="100px" Width="80%" TextMode="MultiLine"></asp:TextBox>
		    </td>
		</tr>
		<tr>
			<td class="Table1" colspan="2" style="width:100%" >
		<asp:Button id="Temp_result" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="暫存結果" Width="145px" OnClick="Temp_result_Click" />
		        &nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Send" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="確定送出" Width="145px" OnClick="Send_Click" />
		        </td>
		</tr>
		</table>


    </asp:Content>
   
