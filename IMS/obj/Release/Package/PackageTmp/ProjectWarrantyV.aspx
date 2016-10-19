<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectWarrantyV.aspx.cs" Inherits="IMS.ProjectWarrantyV" %>

<!DOCTYPE html>

<head id="Head1" runat="server">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約保固資料</title>
<style type="text/css">
.auto-style4 {
	font-family: 微軟正黑體;
}
.auto-style1 {
	text-align: center;
	font-size: large;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style3 {
	text-decoration: underline;
}
.Table1 {
	text-align: center;
	background-color: #FFFF99;
}
.Table2 {
	background-color: #FFFBD6;
}
.auto-style8 {
	font-size: medium;
}
.auto-style9 {
	text-align: left;
	background-color: #FFFBD6;
}
.Table2 {
	text-align: left;
	background-color: #FFFFFF;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style12 {
	text-align: center;
	background-color: #FFFBD6;
}
</style>
</head>

<body>
 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<form id="form1" runat="server">
	<br />
	<table class="Table100" style="width: 900px">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約保固資料檢視</strong></td>
		</tr>
		<tr>
			<td class="Table0" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px">保固百分比</td>
			<td class="Table2" style="width: 500px">
		<asp:TextBox id="WarrantyPercentage" runat="server" Height="30px" Width="234px"></asp:TextBox>
			<span class="auto-style8">%</span></td>
		</tr>
		<tr>
			<td class="Table1" style="width: 200px; height: 70px">其他保固規定</td>
			<td class="Table2" style="width: 500px; height: 70px" valign="top">
		<asp:TextBox id="OtherWarranty" runat="server" Height="60px" Width="443px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="Table0" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">保固明細</span></td>
		</tr>
		<tr>
			<td colspan="2">
                
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="WarrantyID"  DataSourceID="Warranty" Width="900px"  >
         <Columns>
            <asp:TemplateField HeaderText="保固項目名稱">
                 
                 <ItemTemplate>
                    <asp:label runat="server"   ID="WarrantyItem" Text='<%# Bind("WarrantyItem") %>'/>
                     </ItemTemplate>            
             </asp:TemplateField>
             <asp:TemplateField HeaderText="保固年限(年)">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="WarrantyYear" Text='<%# Bind("WarrantyYear") %>'  /> 
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

                 <asp:SqlDataSource ID="Warranty" runat="server"  >
       
        <UpdateParameters>          
            <asp:Parameter Name="PID" Type="Int32" />
            <asp:Parameter Name="WarrantyItem" Type="String" />
            <asp:Parameter Name="WarrantyYear" Type="String" /> 
          
        </UpdateParameters>
    </asp:SqlDataSource>
			<%--<table style="width: 70%; height: 102px;" align="center">
				<tr>
					<td class="auto-style11" style="width: 220px"><strong>保固項目名稱</strong></td>
					<td class="auto-style11" style="width: 220px"><strong>
					保固年限(年)</strong></td>
				</tr>
				<tr>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
				</tr>
				<tr>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
					<td class="auto-style12" style="width: 220px">
					&nbsp;</td>
				</tr>
				</table>--%>
			</td>
		</tr>
	</table>
</form>

</body>

</html>
