<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="ProjectDurationE.aspx.cs" Inherits="IMS.ProjectDurationE" %>

    <style type="text/css">
.auto-style1 {
	text-align: center;
}
.auto-style2 {
	text-align: left;
}
.auto-style3 {
	text-decoration: underline;
}
.auto-style4 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
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
.auto-style16 {
	border-style: none;
	border-width: medium;
}
.auto-style17 {
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style18 {
	font-family: 微軟正黑體;
}

.auto-style20 {
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
</style>
 <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
  <form id="form1" runat="server">
	<br />
	<table class="Table100" >
		<tr>
			<td class="TableTop" colspan="2"><strong>工期逾罰資料編修</strong></td>
		</tr>
		<tr>
			<td class="Table0" colspan="2" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">基本資料</span></td>
		</tr>
		<tr>
			<td class="Table1" style="height: 50px">開工期限</td>
			<td class="Table2" style="height: 50px" valign="top">
                  <asp:RadioButtonList ID="StartDeadlinetype" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" autopostback="true" OnSelectedIndexChanged="StartDeadlinetype_SelectedIndexChanged" ></asp:RadioButtonList>
		
          <span style="padding-left:300PX;margin-bottom:-150PX">      <asp:TextBox id="StartDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>&nbsp;<asp:label runat="server" id="Itemname" ></asp:label></span></td>

		
		</tr>
		<tr>
			<td class="Table1" style="height: 40px">完工提報期限</td>
			<td class="Table2" style="height: 40px">
			<span class="auto-style8">完工後</span><span class="auto-style6">&nbsp;
		<asp:TextBox id="CompletionEscDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table1">工期延展<br />
			提報期限</td>
			<td class="Table2">事件發生後<span class="auto-style6"><asp:TextBox id="DelayEscDeadline" runat="server" Height="30px" Width="100px" CssClass="auto-style7"></asp:TextBox>
			</span><span class="auto-style8">天內提報</span></td>
		</tr>
		<tr>
			<td class="Table1" colspan="2">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
			</td>
		</tr>
		<tr>
			<td class="Table0" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style3">&nbsp;逾罰明細</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增逾罰明細資料" Width="175px" OnClick="add_Click" />
			</td>
		</tr>
    
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="PunishID"  DataSourceID="DurationPunish"  OnRowCommand="GridView1_RowCommand" width="100%" OnRowDataBound="GridView1_RowDataBound" >
         <Columns>
          
            <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
              <ItemStyle Width="100px" />
                   <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  Text="編輯" CommandArgument='<%# Container.DataItemIndex%>'/>
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" /> 
            </asp:TemplateField>  
       
            <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" CommandArgument='<%# Container.DataItemIndex%>'/>
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>     
            
             <asp:TemplateField HeaderText="階段名稱">                 
                 <ItemTemplate>
                    <asp:label runat="server"   ID="StageName" Text='<%# Bind("StageName") %>'/>
                     </ItemTemplate>            
             </asp:TemplateField>
             <asp:TemplateField HeaderText="工期">
                 <ItemTemplate>
                  <asp:label  runat="server" ID="DurationType" Text='<%# Bind("DurationType") %>' visible="false"  /> 
                    <asp:label  runat="server" ID="Duration" Text='<%# Bind("Duration") %>'  /> 
                     </ItemTemplate>              
           </asp:TemplateField>  
                <asp:TemplateField HeaderText="逾罰">
                 <ItemTemplate>
                    <asp:label  runat="server" ID="PunishType" Text='<%# Bind("PunishType") %>'  visible="false" /> 
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

                 <asp:SqlDataSource ID="DurationPunish" runat="server"  SelectCommand="SELECT * FROM [ProjectM_DurationPunish]" >
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
		
	</table>
</form>

