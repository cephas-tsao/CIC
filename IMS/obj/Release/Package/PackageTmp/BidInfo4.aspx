<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidInfo4.aspx.cs" Inherits="IMS.BidInfo4" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>工程概要</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<head>
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
      <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
<title>標案轉入</title>
<style type="text/css">
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
.auto-style5 {
	text-align: center;
}


.auto-style6 {
	font-size: small;
	color: #FF0000;
}


.auto-style7 {
	font-size: small;
	color: #008000;
}


</style>
</head>

<body>

<%--<form id="form1" runat="server">--%>

	<br />

	<table style="width: 100%; padding-left:200px">
		<tr>
		<td class="auto-style3">請選擇標案</td>
	<td class="auto-style4" colspan="3">
		<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" AutoPostBack="true" Font-Size="Medium" DataTextField="BidName" DataValueField="BidName">
		</asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BIDNAME" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
	<%--	<span class="auto-style6">(必選)</span><asp:Button ID="Btn_7" runat="server" PostBackUrl="~/BidInfo3.aspx" Text="選擇" Height="25px" Width="56px" Font-Names="微軟正黑體" Font-Size="Medium" />--%>
		</td>
	</tr>
   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlEmployees" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
		<tr>
			<td colspan="8" class="auto-style1">工程概要</td>
		</tr>
		<tr>
		<td class="auto-style3" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style4" style="height: 45px">
            <asp:Literal ID="ltName" runat="server"></asp:Literal>
	
		</td>
		<td class="auto-style3">標案狀態</td>
			<td class="auto-style4">
            <asp:Literal ID="LtStatus" runat="server"></asp:Literal>
	
		<%--<span class="auto-style7"><br />
		*修改標案狀態請至初步招標訊息</span>--%></td>
	</tr>
             </ItemTemplate>
    </asp:Repeater>
		<tr>
			<td class="auto-style3">工程區分</td>
			<td class="auto-style4">
			<asp:RadioButtonList id="RBEngType" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="0">公共工程</asp:ListItem>
				<asp:ListItem Value="1">民間工程</asp:ListItem>
			</asp:RadioButtonList>
			</td>
			<td class="auto-style3">工程分類</td>
			<td class="auto-style4">
			<asp:DropDownList id="DLEngClass" runat="server" Height="30px" Width="300px" >
			</asp:DropDownList>             
			</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="DownFloorNum" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
			<td class="auto-style3">地上樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="UpFloorNum" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="Height" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
			<td class="auto-style3">地上樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="ExcDepth" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
		</tr>
		<tr>
			<td class="auto-style3">建物高度</td>
			<td class="auto-style4">
			<asp:TextBox id="DownFloorArea" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
			<td class="auto-style3">開挖深度</td>
			<td class="auto-style4">
			<asp:TextBox id="UpFloorArea" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 26px">基礎型式</td>
			<td class="auto-style4" style="height: 26px">
			<asp:DropDownList id="DLFoundationType" runat="server" Height="30px" Width="300px" Font-Size="Medium" DataTextField="FoundationName" DataValueField="FoundationName">
			</asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>   
         <%--    <asp:SqlDataSource ID="Sql_FoundationType" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DLFoundationType" Name="FoundationName" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>--%>
			<br />
			<span class="auto-style7">*如欲增修基礎型式之內容請至常用資料維護功能</span></td>
			<td class="auto-style3" style="height: 26px">擋土措施</td>
			<td class="auto-style4" style="height: 26px">
			<asp:DropDownList id="DLRetaining" runat="server" Height="30px" Width="300px" Font-Size="Medium" DataTextField="RetainingName" DataValueField="RetainingName">
			</asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>   
           <%--  <asp:SqlDataSource ID="Sql_Retaining" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DLRetaining" Name="RetainingName" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>--%>
			<br />
			<span class="auto-style7">*如欲增修擋土措施之內容請至常用資料維護功能</span></td>
		</tr>
		<tr>
			<td class="auto-style3">施工概要備註</td>
			<td class="auto-style4">
			<asp:TextBox id="Note" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="auto-style3">其他工程概要</td>
			<td class="auto-style4">
			<asp:TextBox id="Other" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px"  OnClick="Recovery_Click"/>
			</td>
		</tr>
	</table>

<%--</form>--%>

</body>

</asp:content>
