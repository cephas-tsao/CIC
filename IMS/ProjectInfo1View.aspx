<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="Site1.Master" CodeBehind="ProjectInfo1View.aspx.cs" Inherits="IMS.ProjectInfo1View" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-專案基本資料檢視</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:Project ID="ProjectBox" runat="server" /> 


	<table style="width: 100%;padding-left:200px">
		<tr>
			<td colspan="5" class="auto-style1">專案基本資料</td>
		</tr>
		<tr>
			<td class="auto-style3">專案(工程)編號</td>
			<td class="auto-style4" colspan="2">
                <asp:Literal ID="TxProjectCode" runat="server"  ></asp:Literal>
		<%--	<asp:TextBox id="TextBox1" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
			</td>
			<td class="auto-style3">專案(工程)名稱</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox2" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
            <asp:Literal ID="TxProjectName" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">專案(工程)狀態</td>
			<td class="auto-style4" colspan="2">
		<%--	<asp:TextBox id="TextBox32" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                 <span style="color:red;font-weight:bolder">  <asp:Literal ID="LtStatus" runat="server" ></asp:Literal></span>
			</td>
			<td class="auto-style3">專案(工程)簡稱</td>
			<td class="auto-style4">
		<%--	<asp:TextBox id="TextBox3" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                 <asp:Literal ID="TxProjectNickname" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 104px">備註</td>
			<td colspan="4" class="auto-style4" style="height: 104px">
			<%--<asp:TextBox id="TextBox4" runat="server"  Height="100px" Width="600px" TextMode="MultiLine"></asp:TextBox>--%>
                 <asp:Literal ID="TxNote" runat="server"   ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工程所在國家</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox33" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
            <asp:Literal ID="DDLEngCountry" runat="server"  ></asp:Literal>
			</td>
			<td class="auto-style3">工程所在縣市</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox34" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="DDLEngLocation" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地負責人</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox5" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxSitePerson" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">工地電話</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox6" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxSiteTel" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">工地傳真</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox9" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxSiteFax" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">業主名稱</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox7" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxOwnerName" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主聯絡人</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox10" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxOwnerContactPerson" runat="server"></asp:Literal>
			</td>
			<td class="auto-style3">業主連絡電話</td>
			<td class="auto-style4">
			
                <asp:Literal ID="TxOwnerContactTel" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">業主地址</td>
			<td class="auto-style4" colspan="4">
			<%--<asp:TextBox id="TextBox11" runat="server"  Height="30px" Width="600px"></asp:TextBox>--%>
                <asp:Literal ID="TxOwnerAddress" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">預定開工日期</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox12" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxBookOpenDate" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">預定完工日期</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox13" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
              <asp:Literal ID="TxBookFinishDate" runat="server"   ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">實際開工日期</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox14" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxRealOpenDate" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">實際完工日期</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox15" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxRealFinishDate" runat="server"  ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">核定完工日期</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox16" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxApprovedFinishDate" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">驗收合格日期</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox18" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxAcceptCheckDate" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">保固期滿日期</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox17" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxWarrantyDate" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">保固金退還日期</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox19" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxWarrantyMoneyDate" runat="server"  ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">履約保證金</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox29" runat="server"  Height="30px" Width="80px"></asp:TextBox>--%>
                <asp:Literal ID="RBPerformanceBondType" runat="server"  ></asp:Literal>
			</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox20" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxPerformanceBond" runat="server"  ></asp:Literal>
			</td>
			<td class="auto-style4">&nbsp;</td>
			<td class="auto-style4">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style3">工程區分</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox30" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="RBEngType" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">工程分類</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox31" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="DDLEngClass" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層數</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox21" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxDownFloorNum" runat="server" ></asp:Literal>
			樓</td>
			<td class="auto-style3">地上樓層數</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox22" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxUpFloorNum" runat="server"  ></asp:Literal>
			樓</td>
		</tr>
		<tr>
			<td class="auto-style3">地下樓層面積</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox23" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxDownFloorArea" runat="server"></asp:Literal>
			平方公尺(M<sup>2</sup>)</td>
			<td class="auto-style3">地上樓層面積</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox24" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxUpFloorArea" runat="server"  ></asp:Literal>
			平方公尺(M<sup>2</sup>)</td>
		</tr>
		<tr>
			<td class="auto-style3">建物高度</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox25" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxHeight" runat="server"></asp:Literal>
			公尺(M)</td>
			<td class="auto-style3">開挖深度</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox26" runat="server"  Height="30px" Width="250px"></asp:TextBox>--%>
                <asp:Literal ID="TxExcDepth" runat="server" ></asp:Literal>
			公尺(M)</td>
		</tr>
		<tr>
			<td class="auto-style3">基礎型式</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox35" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="DDLFoundationType" runat="server"  ></asp:Literal>
			</td>
			<td class="auto-style3">擋土措施</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox36" runat="server"  Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="DDLRetaining" runat="server" ></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">施工概要備註</td>
			<td class="auto-style4" colspan="2">
			<%--<asp:TextBox id="TextBox27" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="TxConNote" runat="server" ></asp:Literal>
			</td>
			<td class="auto-style3">其他工程概要</td>
			<td class="auto-style4">
			<%--<asp:TextBox id="TextBox28" runat="server"  Height="100px" Width="250px" TextMode="MultiLine"></asp:TextBox>--%>
                <asp:Literal ID="TxOther" runat="server"></asp:Literal>

			</td>
		</tr>
		</table>



 </asp:Content>
