<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidWarrantyE.aspx.cs" EnableEventValidation="false"  Inherits="IMS.BidWarrantyE" %>

<head id="Head1" runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>合約保固資料</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: large;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style4 {
	font-family: 微軟正黑體;
}
.auto-style5 {
	text-align: center;
	background-color: #FFFF99;
}
.auto-style6 {
	background-color: #FFFBD6;
}
.auto-style7 {
	text-align: left;
	background-color: #FFFFFF;
}
.auto-style8 {
	font-size: medium;
}
.auto-style9 {
	text-align: left;
	background-color: #FFFBD6;
}
.auto-style10 {
	text-align: center;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style13 {
	text-align: center;
	background-color: #FFFBD6;
}
</style>
</head>

<body>


<SCRIPT language=javascript>
<!--
    //只可輸入整數
    function TextBoxNumCheck_Int() {
        if (event.keyCode < 48 || window.event.keyCode > 57) event.returnValue = false;
      
    }
    // -->
</SCRIPT>
<link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<form id="form1" runat="server">
	<br />
	<table class="auto-style4" style="width: 50%">
		<tr>
			<td class="TableTop" colspan="2"><strong>合約保固資料編修</strong></td>
		</tr>
		<tr>
			<td class="TableTop2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<td class="Table1" colspan="2">
		<asp:Button id="save" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="recovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>
		</tr>
        	<tr>
			<td colspan="2">
			<table style="width: 1000px">
				<tr>
					<td class="auto-style10" style="width: 110px">新增保固明細</td>
					<td class="Table1" style="width: 220px"><strong>保固項目名稱</strong></td>
					<td class="Table1" style="width: 220px"><strong>
					保固年限(年)</strong></td>
				</tr>
				<tr>
					<td class="auto-style10" style="width: 110px">
		<asp:Button id="add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="新增" Width="51px" OnClick="add_Click" />
					</td>
					<td class="Table2" style="width: 220px">
		<asp:TextBox id="WarrantyItem" runat="server" Height="23px" Width="228px"></asp:TextBox>
					</td>
					<td class="Table2" style="width: 220px">
		<asp:TextBox id="WarrantyYear" runat="server" Height="23px" Width="228px" onkeypress="TextBoxNumCheck_Int();" maxLength=2 ></asp:TextBox>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td class="TableTop2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">保固明細</span></td>
		</tr>
		<tr>
			<td colspan="4">
			<table style="width: 100%">
			
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="WarrantyID" DataSourceID="BidWarranty" Width="1000px" OnRowUpdating="GridView1_RowUpdating" >
         <Columns>
          
            <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
              <ItemStyle Width="100px" />
                   <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  Text="編輯" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
               
                   <EditItemTemplate>
                <asp:Button ID="lbUpdate" runat="server" CommandName="Update" Text="更新"></asp:Button>                |
                <asp:Button ID="lbCancelUpdate" runat="server"  CommandName="Cancel" Text="取消"></asp:Button>
            </EditItemTemplate>
              
            </asp:TemplateField>  
       
            <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>
             <asp:TemplateField Visible="false">
                 <ItemTemplate>
                    <asp:label runat="server" ID="WarrantyID" SortExpression="WarrantyID" Visible="False" />
                 </ItemTemplate>
                
                 </asp:TemplateField>
                  <%--  <asp:BoundField DataField="BID" HeaderText="BID" SortExpression="BID" Visible="False" />--%>
             <asp:TemplateField HeaderText="保固項目名稱">
                 <ItemTemplate>
                    <asp:label runat="server"   ID="WarrantyItem" Text='<%# Bind("WarrantyItem") %>'/>
                     </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox runat="server" ID="WarrantyItem" Text='<%# Bind("WarrantyItem") %>' ></asp:TextBox>                      
             </EditItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="保固年限(年)">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="WarrantyYear" Text='<%# Bind("WarrantyYear") %>'  /> 
                     </ItemTemplate>
                   <EditItemTemplate>
                     <asp:TextBox runat="server" ID="WarrantyYear" Text='<%# Bind("WarrantyYear") %>' ></asp:TextBox>
               </EditItemTemplate>
           </asp:TemplateField>                  
      </Columns>
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

                 <asp:SqlDataSource ID="BidWarranty" runat="server" DeleteCommand="DELETE FROM [BidM_Warranty] WHERE [WarrantyID] = @WarrantyID"  SelectCommand="SELECT * FROM [BidM_Warranty]" 
                     UpdateCommand="UPDATE [BidM_Warranty] SET [WarrantyItem] = @WarrantyItem, [WarrantyYear] = @WarrantyYear WHERE [WarrantyID] = @WarrantyID">
        <DeleteParameters>
            <asp:Parameter Name="WarrantyID" Type="Int32" />
        </DeleteParameters>
       
        <UpdateParameters>          
            <asp:Parameter Name="WarrantyID" Type="Int32" />
            <asp:Parameter Name="WarrantyItem" Type="String" />
            <asp:Parameter Name="WarrantyYear" Type="String" />           
            <asp:Parameter Name="BID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
         
				</table>
             
			</td>
		</tr>
	
	</table>
</form>

</body>
