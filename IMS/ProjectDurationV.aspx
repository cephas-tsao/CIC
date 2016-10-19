<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDurationV.aspx.cs" Inherits="IMS.ProjectDurationV" %>

<!DOCTYPE html>

 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工期逾罰資料</title>
<style type="text/css">
.auto-style18 {
	font-family: 微軟正黑體;
}
.auto-style4 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style2 {
	text-align: left;
}
.auto-style3 {
	text-decoration: underline;
}

.auto-style6 {
	font-size: small;
}
.auto-style7 {
	margin-top: 0px;
}
.auto-style8 {
	font-size: medium;
}
.auto-style10 {
	border-width: 0px;
}
.auto-style17 {
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style20 {
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="Table100" style="width:900px; height: 300px">
		<tr>
			<td class="TableTop" colspan="2"><strong>工期逾罰資料檢視</strong></td>
		</tr>
		<tr>
			<td class="Table0" colspan="2" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px">開工期限</td>
			<td class="Table2" style="height: 50px" valign="top">
			<span class="auto-style6">
		<%--<asp:TextBox id="TextBox8" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>--%>
                <asp:Literal ID="StartDeadlinetype" runat="server"></asp:Literal>
		<%--&nbsp;<asp:TextBox id="TextBox5" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>--%>
                <asp:Literal ID="StartDeadline" runat="server"></asp:Literal>
		&nbsp;(天)</span></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 40px">完工提報期限</td>
			<td class="Table2" style="height: 40px">
			<span class="auto-style8">完工後</span><span class="auto-style6">&nbsp;
		<%--<asp:TextBox id="CompletionEscDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>--%>
                <asp:Literal ID="CompletionEscDeadline" runat="server"></asp:Literal>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table1">工期延展<br />
			提報期限</td>
			<td class="Table2">事件發生後<span class="auto-style6"><%--<asp:TextBox id="TextBox7" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>--%>
                <asp:Literal ID="DelayEscDeadline" runat="server"></asp:Literal>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table0" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">&nbsp;逾罰明細</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">

                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="PunishID"  DataSourceID="DurationPunish" Width="900px"  >
         <Columns>
            <asp:TemplateField HeaderText="階段名稱">
                 
                 <ItemTemplate>
                    <asp:label runat="server"   ID="StageName" Text='<%# Bind("StageName") %>'/>
                     </ItemTemplate>            
             </asp:TemplateField>
             <asp:TemplateField HeaderText="工期">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="Duration" Text='<%# Bind("Duration") %>'  /> 
                     </ItemTemplate>                
           </asp:TemplateField>  
                <asp:TemplateField HeaderText="逾罰">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="Punish" Text='<%# Bind("Punish") %>'  /> 
                     </ItemTemplate>               
           </asp:TemplateField>               
                <asp:TemplateField HeaderText="說明">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="Notes" Text='<%# Bind("Notes") %>'  /> 
                     </ItemTemplate>            
           </asp:TemplateField>                                        
      </Columns>
                       <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="auto-style11" />
			        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

                 <asp:SqlDataSource ID="DurationPunish" runat="server"  >
        <DeleteParameters>
            <asp:Parameter Name="PunishID" Type="Int32" />
        </DeleteParameters>
       
        <UpdateParameters>          
            <asp:Parameter Name="PunishID" Type="Int32" />
            <asp:Parameter Name="StageName" Type="String" />
            <asp:Parameter Name="DurationType" Type="String" /> 
             <asp:Parameter Name="Duration" Type="String" /> 
             <asp:Parameter Name="PunishType" Type="String" /> 
             <asp:Parameter Name="Punish" Type="String" />           
             <asp:Parameter Name="Notes" Type="String" />           
            <asp:Parameter Name="PID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
		
			</td>
		</tr>
	</table>
</form>

</body>

</html>