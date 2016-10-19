<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProjectInfo2View.aspx.cs" Inherits="IMS.ProjectInfo2View" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-專案基本資料檢視</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:Project ID="ProjectBox" runat="server" /> 
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.auto-style5 {
	border-width: 0px;
	font-family: 微軟正黑體;
}
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
}
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.auto-style8 {
	text-decoration: underline;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style6 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: left;
	border-style: none;
	border-width: medium;
}
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style13 {
	background-color: #FFFBD6;
}
.auto-style10 {
	text-align: center;
}
</style>



	<br />
	<table class="auto-style5" style="width: 100%; height: 587px;padding-left:200px">
		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			工程合約資料</strong></td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工程編號</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox1" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxProjectCode" runat="server"></asp:Literal>
			</td>
			<td class="auto-style7" style="width: 200px">工程名稱</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox2" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxProjectName" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style8">合約基本資料</span></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">原合約總價</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<%--<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="340px" BackColor="White" BorderColor="White"></asp:TextBox>--%>
                <asp:Literal ID="TxOContrctPrice" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">承攬方式</td>
			<td class="auto-style12" colspan="3">
		<%--<asp:TextBox id="TextBox15" runat="server" Height="30px" Width="340px" BackColor="White" BorderColor="White"></asp:TextBox>--%>
                <asp:Literal ID="DDLDurationType" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">業主名稱</td>
			<td class="auto-style12" colspan="3">
		<%--<asp:TextBox id="TextBox9" runat="server" Height="30px" Width="340px"></asp:TextBox>--%>
                <asp:Literal ID="TxOwnerName" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建築師/設計單位名稱</td>
			<td class="auto-style12" colspan="3">
		<%--<asp:TextBox id="TextBox10" runat="server" Height="30px" Width="340px"></asp:TextBox>--%>
                <asp:Literal ID="TxArchitectName" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">監造單位名稱</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<%--<asp:TextBox id="TextBox11" runat="server" Height="30px" Width="340px"></asp:TextBox>--%>
                <asp:Literal ID="TxConsultantName" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">PCM名稱</td>
			<td class="auto-style12" colspan="3">
		<%--<asp:TextBox id="TextBox12" runat="server" Height="30px" Width="340px"></asp:TextBox>--%>
                <asp:Literal ID="TxPCMname" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工期計算方式</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox16" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="RBContractWay" runat="server"></asp:Literal>
			</td>
			<td class="auto-style7" style="width: 200px">工期</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxDuration" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style8">建物執照資料</span></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建照號碼</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox3" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxBuildLicense" runat="server"></asp:Literal>
			</td>
			<td class="auto-style7" style="width: 200px">建照核發日期</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox6" runat="server" Height="30px" Width="240px"></asp:TextBox>--%>
                <asp:Literal ID="TxBuildLicenseDtae" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">使照號碼</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox4" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxUseLicense" runat="server"></asp:Literal>
			</td>
			<td class="auto-style7" style="width: 200px">使照核發日期</td>
			<td class="auto-style12" style="width: 300px">
		<%--<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="240px"></asp:TextBox>--%>
                <asp:Literal ID="TxUseLicenseDate" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="Duration" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" OnClick="Duration_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Warranty" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px" OnClick="Warranty_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Pay" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px"  OnClick="Pay_Click"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Caution" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px" OnClick="Caution_Click" />
			</td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			III.聯合承攬資料</td>
		</tr>
		<tr>
			<td  colspan="4">
                	<asp:GridView id="GridView1" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" Width="1000px" DataKeyNames="JVID"  ForeColor="#333333" GridLines ="None" >     
	
				<Columns>					  
            
					<asp:BoundField DataField="JVID" HeaderText="JVID" InsertVisible="False" ReadOnly="True" SortExpression="JVID" Visible="False">
					</asp:BoundField>
					  <asp:TemplateField HeaderText="聯合承攬廠商名稱"> 
                     <ItemTemplate>
                      <span style="margin-left:150px"> <%# Eval("聯合承攬廠商名稱") %>    </span>
                    </ItemTemplate>                               
                          </asp:TemplateField>				
                    <asp:TemplateField HeaderText="承攬項目">
                    <ItemTemplate>
                        <%# Eval("承攬項目") %>                  
                    </ItemTemplate>                                  
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="合約金額">
                    <ItemTemplate>
                        <%# Eval("合約金額") %>                    
                    </ItemTemplate> 
                    </asp:TemplateField>
					
				</Columns>
                       <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="auto-style11" />
				<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
				<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
				<SortedAscendingCellStyle BackColor="#FDF5AC" />
				<SortedAscendingHeaderStyle BackColor="#4D0000" />
				<SortedDescendingCellStyle BackColor="#FCF6C0" />
				<SortedDescendingHeaderStyle BackColor="#820000" />
                <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
			</asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource4" runat="server"  DeleteCommand="DELETE FROM [ProjectM_JV] WHERE [JVID] = @JVID">
                  <DeleteParameters>
            <asp:Parameter Name="JVID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>       
            <asp:Parameter Name="JVID" Type="Int32" />
            <asp:Parameter Name="PID" Type="Int32" /> 
            <asp:Parameter Name="FID" Type="Int32" />
            <asp:Parameter Name="JVItem" Type="String" />           
            <asp:Parameter Name="JVPrice" Type="String" />
        </UpdateParameters>
			</asp:SqlDataSource>
           
			<%--<table align="center" style="width: 95%; height: 150px">
				<tr>
					<td class="auto-style11" style="height: 29px; width: 326px">
					<strong>聯合承攬廠商</strong></td>
					<td class="auto-style11" style="height: 29px; width: 328px">
					<strong>承攬項目</strong></td>
					<td class="auto-style11" style="height: 29px"><strong>合約金額</strong></td>
				</tr>
				<tr>
					<td style="width: 326px; height: 42px;" class="auto-style13">
					&nbsp;</td>
					<td style="width: 328px; height: 42px;" class="auto-style13"></td>
					<td class="auto-style13" style="height: 42px"></td>
				</tr>
				<tr>
					<td style="height: 30px; width: 326px" class="auto-style13"></td>
					<td style="height: 30px; width: 328px" class="auto-style13"></td>
					<td style="height: 30px" class="auto-style13"></td>
				</tr>
				<tr>
					<td class="auto-style13" style="width: 326px">
					&nbsp;</td>
					<td class="auto-style13" style="width: 328px">
					&nbsp;</td>
					<td class="auto-style13">
					&nbsp;</td>
				</tr>
			</table>--%>
			</td>
		</tr>
	</table>



    </asp:Content>
