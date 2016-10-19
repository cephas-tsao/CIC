<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="Site1.Master" CodeBehind="ProjectInfo1Edit.aspx.cs" Inherits="IMS.ProjectInfo1Edit" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-新增專案</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:Project ID="ProjectBox" runat="server" /> 


<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
	<table style="width: 100%; padding-left:200px">
		<tr>
			<td colspan="5" class="auto-style1">專案基本資料</td>
		</tr>
		<tr>
			<td class="auto-style3">專案(工程)編號</td>
			<td class="auto-style4" colspan="2">
                <asp:Literal ID="TxProjectCode" runat="server"></asp:Literal>
		<%--	<asp:TextBox id="TxProjectCode" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>--%>
			</td>
			<td class="auto-style3">專案(工程)名稱</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TxProjectName" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>--%>
                <asp:Literal ID="TxProjectName" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
		<%--	<td class="auto-style3">專案(工程)狀態</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxProjectStatus" runat="server"  Height="30px" Width="300px">改Label</asp:TextBox>
			</td>--%>          
			<td class="auto-style3">專案(工程)簡稱</td>
			<td class="auto-style4">
			<asp:TextBox id="TxProjectNickname" runat="server"  Height="30px" Width="300px" ReadOnly="true"></asp:TextBox>
			</td>
             <td class="auto-style4"></td> <td class="auto-style4"></td> <td class="auto-style4"></td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 104px">備註</td>
			<td colspan="4" class="auto-style4" style="height: 104px">
			<asp:TextBox id="TxNote" runat="server"  Height="100px" Width="600px" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工程所在國家</td>
			<td class="auto-style4" colspan="2">
			<asp:DropDownList id="DDLEngCountry" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
			<td class="auto-style3">工程所在縣市</td>
			<td class="auto-style4">
			<asp:DropDownList id="DDLEngLocation" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地負責人</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxSitePerson" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">工地電話</td>
			<td class="auto-style4">
			<asp:TextBox id="TxSiteTel" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地傳真</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxSiteFax" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">業主名稱</td>
			<td class="auto-style4">
			<asp:TextBox id="TxOwnerName" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主聯絡人</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxOwnerContactPerson" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style3">業主連絡電話</td>
			<td class="auto-style4">
			<asp:TextBox id="TxOwnerContactTel" runat="server"  Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主地址</td>
			<td class="auto-style4" colspan="4">
			<asp:TextBox id="TxOwnerAddress" runat="server"  Height="30px" Width="600px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 32px">預定開工日期</td>
			<td class="auto-style4" colspan="2" style="height: 32px">
			<asp:TextBox id="TxBookOpenDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
			<td class="auto-style3" style="height: 32px">預定完工日期</td>
			<td class="auto-style4" style="height: 32px">
			<asp:TextBox id="TxBookFinishDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
			
			<br />
			<span class="auto-style6">*倘工期有展延則須修改預定完工日期為展延後之日期</span></td>
		</tr>
		<tr>
			<td class="auto-style3">實際開工日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxRealOpenDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
			<td class="auto-style3">實際完工日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TxRealFinishDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">核定完工日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxApprovedFinishDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
	
			</td>
			<td class="auto-style3">驗收合格日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TxAcceptCheckDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">預定保固期滿日期</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxWarrantyDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
			<td class="auto-style3">實際保固金退還日期</td>
			<td class="auto-style4">
			<asp:TextBox id="TxWarrantyMoneyDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">履約保證金</td>
			<td class="auto-style4">
			<asp:RadioButtonList id="RBPerformanceBondType" runat="server">
			<%--	<asp:ListItem>金額</asp:ListItem>
				<asp:ListItem>百分比</asp:ListItem>--%>
			</asp:RadioButtonList>
			</td>
			<td class="auto-style4">
			<asp:TextBox id="TxPerformanceBond" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style4">&nbsp;</td>
			<td class="auto-style4">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 33px">工程區分</td>
			<td class="auto-style4" colspan="2" style="height: 33px">
			<asp:RadioButtonList id="RBEngType" runat="server" RepeatDirection="Horizontal">
				<%--<asp:ListItem>公共工程</asp:ListItem>
				<asp:ListItem>民間工程</asp:ListItem>--%>
			</asp:RadioButtonList>
			</td>
			<td class="auto-style3" style="height: 33px">工程分類</td>
			<td class="auto-style4" style="height: 33px">
			<asp:DropDownList id="DDLEngClass" runat="server" Height="30px" Width="300px">
			</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層數</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxDownFloorNum" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
			<td class="auto-style3">地上樓層數</td>
			<td class="auto-style4">
			<asp:TextBox id="TxUpFloorNum" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			樓</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層面積</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxDownFloorArea" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
			<td class="auto-style3">地上樓層面積</td>
			<td class="auto-style4">
			<asp:TextBox id="TxUpFloorArea" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			平方公尺(M<sup>2</sup>)</td>
		</tr>
		<tr>
			<td class="auto-style3">建物高度</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxHeight" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
			<td class="auto-style3">開挖深度</td>
			<td class="auto-style4">
			<asp:TextBox id="TxExcDepth" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			公尺(M)</td>
		</tr>
		<tr>
			<td class="auto-style3">基礎型式</td>
			<td class="auto-style4" colspan="2">
			<asp:DropDownList id="DDLFoundationType" runat="server" Height="30px" Width="300px" DataTextField="FoundationName" DataValueField="FoundationName">
			</asp:DropDownList>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>   
			</td>
			<td class="auto-style3">擋土措施</td>
			<td class="auto-style4">
			<asp:DropDownList id="DDLRetaining" runat="server" Height="30px" Width="300px" DataTextField="RetainingName" DataValueField="RetainingName">
			</asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>   
			</td>
		</tr>
		<tr>
			<td class="auto-style3">施工概要備註</td>
			<td class="auto-style4" colspan="2">
			<asp:TextBox id="TxConNote" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
			<td class="auto-style3">其他工程概要</td>
			<td class="auto-style4">
			<asp:TextBox id="TxOther" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="5" class="auto-style5" style="padding-left:500px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" OnClick="Recovery_Click"/>
			</td>
		</tr>
	</table>


    </asp:Content>