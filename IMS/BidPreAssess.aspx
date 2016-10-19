<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidPreAssess.aspx.cs" Inherits="IMS.BidPreAssess" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>工程合約資料</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
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
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
	<br />
	<table class="Table100" style="width: 100%; border-color:white" border="1">
		<tr>
		<td class="Table1" colspan="2">請選擇標案</td>
		<td class="Table2" colspan="3">
		<asp:DropDownList id="DropDownList1" runat="server" Height="30px"  Width="300px" Font-Size="Medium" Font-Names="微軟正黑體"  AutoPostBack="true" DataTextField="BidName" DataValueField="Bid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
		</asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server">    
        </asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
  <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BIDNAME" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
		<%--<span class="auto-style13">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />--%>
		</td>
	</tr>

		<tr>
			<td class="TableTop" colspan="5" style="height: 29px">投標評估(初評)</td>
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
		        <%--<asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="業主名稱"></asp:Label>--%>
                <asp:Literal ID="LtOwnerName"  runat="server"></asp:Literal>
			</td>
			<td class="Table1">建築師/設計單位名稱</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="建築師名稱"></asp:Label>--%>
                <asp:Literal ID="LtArchitectName"  runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">工程所在國家-縣市</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="國家-縣市"></asp:Label>--%>
                <asp:Literal ID="LtCountry"  runat="server"></asp:Literal>
			</td>
			<td class="Table1">工期</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XX天O天"></asp:Label>--%>
                <asp:Literal ID="LtDuration"  runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">截標日期</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="截標日期"></asp:Label>--%>
                <asp:Literal ID="LtBiddingEndDate" runat="server"></asp:Literal>
			&nbsp;</td>
			<td class="Table1">開標日期</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="開標日期"></asp:Label>--%>
                <asp:Literal ID="LtOpenBidTime" runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">圖說費</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="圖說費"></asp:Label>--%>
                <asp:Literal ID="LtIlluFee" runat="server"></asp:Literal>
			</td>
			<td class="Table1">押圖費</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="押圖費"></asp:Label>--%>
                <asp:Literal ID="LtIlluBond" runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">履約保證金</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label9" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXOO(%/元)"></asp:Label>--%>
                <asp:Literal ID="LtPerformanceBond" runat="server"></asp:Literal>
			</td>
			<td class="Table1">押標金</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXOO(%/元)"></asp:Label>--%>
                <asp:Literal ID="LtBidBond" runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">樓層數</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="地上O樓地下O樓"></asp:Label>--%>
                <asp:Literal ID="LtUpFloorNum" runat="server"></asp:Literal>
			</td>
			<td class="Table1">樓地板面積</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="地上OM2地下OM2"></asp:Label>--%>
                <asp:Literal ID="LtUpFloorArea" runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1">基礎型式</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="基礎型式"></asp:Label>--%>
                <asp:Literal ID="LtFoundationType" runat="server"></asp:Literal>
			</td>
			<td class="Table1">擋土措施</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="擋土措施"></asp:Label>--%>
                <asp:Literal ID="LtRetaining" runat="server"></asp:Literal>
			</td>

		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 45px;">開工期限</td>
			<td class="Table2">
		        <%--<asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="XXXXXOO(天)"></asp:Label>--%>
                <asp:Literal ID="LtStartDeadline" runat="server"></asp:Literal>
			</td>
			<td class="Table1">物價調整補貼</td>
			<td class="Table2">
			    <%--<asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="是/否"></asp:Label>--%>
                <asp:Literal ID="LtPriceSubsidyNY" runat="server"></asp:Literal>
			</td>

		</tr>
		</table>
    <table class="auto-style5" style="width: 100%;border-color:white" border="1">
		<tr>
			<td class="Table1" >
		<asp:Button id="Access" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="條件評估" Width="145px" OnClick="Access_Click" />
		        <asp:Label ID="Label17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="*是否條件評估" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
			</td>
			<td class="Table1">
		<asp:Button id="Article" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約條款評估" Width="145px" OnClick="Article_Click" />
		        <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="*是否合約條款評估" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
			</td>
		</tr>
		</table>
    <table class="auto-style5" style="width: 100%;border-color:white" border="1">
		<tr>
			<td class="auto-style14" rowspan="3" >
		        初<br />
		        評<br />
                結<br />
                果</td>
			<td class="Table1" >
		        評估建議</td>
			<td class="Table2">
		        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="70%">
                    <asp:ListItem Value="0">擬積極參與競標</asp:ListItem>
                    <asp:ListItem Value="1">可嘗試競標</asp:ListItem>
                    <asp:ListItem Value="2">條件太差不擬參與</asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>
		<tr>
			<td class="Table1" >
		        建議說明</td>
			<td class="Table2">
		<asp:TextBox id="TxPreResultNote" runat="server" Height="100px" Width="80%" TextMode="MultiLine"></asp:TextBox>
		    </td>
		</tr>
		<tr>
			<td class="Table1" colspan="2" >
		<asp:Button id="Temp_save" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="結果暫存" Width="145px" OnClick="Temp_save_Click" />
		        &nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Send" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="確定送出" Width="145px" OnClick="SaveAction" />
		        </td>
		</tr>
		</table>

    </asp:Content>