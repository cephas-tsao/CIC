<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProjectInfo2Edit.aspx.cs" Inherits="IMS.ProjectInfo2Edit" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-工程合約資料編修</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:Project ID="ProjectBox" runat="server" /> 
<style type="text/css">
/*.auto-style1 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
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
.auto-style5 {
	border-width: 0px;
	font-family: 微軟正黑體;
}
.auto-style6 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: left;
	border-style: none;
	border-width: medium;
}*/
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
.auto-style9 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
}
.auto-style10 {
	text-align: center;
}
.auto-style11 {
	text-align: center;
	color: #FFFFFF;
	background-color: #800000;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
.auto-style13 {
	background-color: #FFFBD6;
	text-align: center;
}
</style>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
	<br />
       <div>
	<table class="auto-style5" style="width: 79%; height: 587px; padding-left:200px">
		<tr>
			<td class="auto-style1" colspan="4" style="height: 29px"><strong>
			工程合約資料</strong></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工程編號</td>
			<td  style="width: 300px">
		<%--<asp:TextBox id="TxProjectCode" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
                <asp:Literal ID="TxProjectCode" runat="server"></asp:Literal>
			</td>
			<td class="auto-style7" style="width: 200px">工程名稱</td>
			<td  style="width: 300px">
		<%--<asp:TextBox id="TxProjectName" runat="server" Height="30px" Width="300px"></asp:TextBox>--%>
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
		<asp:TextBox id="TxOContrctPrice" runat="server" Height="30px" Width="340px" BackColor="White" BorderColor="White"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 26px;">承攬方式</td>
			<td class="auto-style6" colspan="3" style="height: 26px">
			<asp:RadioButtonList id="RBContractWay" runat="server" RepeatDirection="Horizontal">
				<%--<asp:ListItem>實做實算</asp:ListItem>
				<asp:ListItem>總價承攬</asp:ListItem>
				<asp:ListItem>實做+總價</asp:ListItem>
				<asp:ListItem>統包</asp:ListItem>
				<asp:ListItem>其他</asp:ListItem>--%>
			</asp:RadioButtonList>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">業主名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TxOwnerName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建築師/設計單位名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TxArchitectName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px; height: 34px">監造單位名稱</td>
			<td class="auto-style12" colspan="3" style="height: 34px">
		<asp:TextBox id="TxConsultantName" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">PCM名稱</td>
			<td class="auto-style12" colspan="3">
		<asp:TextBox id="TxPCMname" runat="server" Height="30px" Width="340px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">工期計算方式</td>
			<td style="width: 300px">
		<asp:DropDownList id="DDLDurationType" runat="server" Height="30px" Width="300px">
			<%--<asp:ListItem>-請選擇-</asp:ListItem>
			<asp:ListItem>限期完工</asp:ListItem>
			<asp:ListItem>工作天</asp:ListItem>
			<asp:ListItem>日曆天</asp:ListItem>
			<asp:ListItem>其他</asp:ListItem>--%>
		</asp:DropDownList>
			</td>
			<td class="auto-style7" style="width: 200px">工期</td>
			<td  style="width: 300px">
		<asp:TextBox id="TxDuration" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="auto-style8">建物執照資料</span></td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">建照號碼</td>
			<td  style="width: 300px">
		<asp:TextBox id="TxBuildLicense" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style7" style="width: 200px">建照核發日期</td>
			<td  style="width: 300px">
		<asp:TextBox id="TxBuildLicenseDtae" runat="server" Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style7" style="width: 200px">使照號碼</td>
			<td style="width: 300px">
		<asp:TextBox id="TxUseLicense" runat="server" Height="30px" Width="300px"></asp:TextBox>
			</td>
			<td class="auto-style7" style="width: 200px">使照核發日期</td>
			<td  style="width: 300px">
		<asp:TextBox id="TxUseLicenseDate" runat="server" Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" OnClick="SaveAction"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px"  OnClick="Recovery_Click"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
		</tr>
		<tr>
			<td class="auto-style9" colspan="4">
		<asp:Button id="punish" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" OnClick="punish_Click"  />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Warranty" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px" OnClick="Warranty_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="BidPay" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px" OnClick="BidPay_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="BidCaution" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px"  OnClick="BidCaution_Click"/>
			</td>
		</tr>
     
		<tr>
			<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			III.聯合承攬資料</td>
		</tr>
      <%--  <table  style="width: 70%; padding-left:200px">--%>
				<tr>
					<td style="height: 29px; width: 143px" class="auto-style10">
					新增聯合承攬資料</td>
					<td class="auto-style11" style="height: 29px; width: 280px">
					<strong>聯合承攬廠商</strong></td>
					<td class="auto-style11" style="height: 29px; width: 282px">
					<strong>承攬項目</strong></td>
					<td class="auto-style11" style="height: 29px"><strong>合約金額</strong></td>
				</tr>
				<tr>
					<td class="auto-style10" style="width: 143px">
		<asp:Button id="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="26px" Text="新增" Width="51px" OnClick="add_Click" />
					</td>
					<td class="auto-style13" style="width: 280px">
		<asp:DropDownList id="DropDownList3" DataSourceID="SqlDataSource5"  DataTextField="Name" DataValueField="Uid" runat="server" Height="30px" Width="250px" Font-Size="Medium">
				
			</asp:DropDownList>          
					</td>
					<td class="auto-style13" style="width: 282px">
		<asp:TextBox id="TxJVItem" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
					<td class="auto-style13">
		<asp:TextBox id="TxJVPrice" runat="server" Height="30px" Width="260px"></asp:TextBox>
					</td>
				</tr>
    <%--</table>--%>
		<tr>
			<td  colspan="4">
            	<%--<table style="width: 100%; padding-left:400px">--%>
                	<asp:GridView id="GridView1" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" Width="1000px" DataKeyNames="JVID"  ForeColor="#333333" GridLines ="None" OnRowCommand="GridView1_RowCommand">     
	
				<Columns>
					   <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
              <ItemStyle Width="100px" />
                   <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  CommandArgument='<%# Container.DataItemIndex%>' Text="編輯" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />               
                   <EditItemTemplate>
                <asp:Button ID="lbUpdate" runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex%>' Text="更新"></asp:Button>                |
                <asp:Button ID="lbCancelUpdate" runat="server" CommandArgument='<%# Container.DataItemIndex%>'  CommandName="Cancel" Text="取消"></asp:Button>
            </EditItemTemplate>              
            </asp:TemplateField>  
                           <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex%>' CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>     
					<asp:BoundField DataField="JVID" HeaderText="JVID" InsertVisible="False" ReadOnly="True" SortExpression="JVID" Visible="False">
					</asp:BoundField>
					  <asp:TemplateField HeaderText="聯合承攬廠商名稱"> 
                     <ItemTemplate>
                      <span style="margin-left:150px"> <%# Eval("聯合承攬廠商名稱") %>    </span>
                    </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:DropDownList id="Name" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="UID" runat="server" SelectedValue='<%# Bind("FID") %>' ></asp:DropDownList>                           
                        </EditItemTemplate>          
                          </asp:TemplateField>				
                    <asp:TemplateField HeaderText="承攬項目">
                    <ItemTemplate>
                        <%# Eval("承攬項目") %>                  
                    </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox id="JVItem" runat="server" Text='<%# Bind("承攬項目") %>' ></asp:TextBox>
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="合約金額">
                    <ItemTemplate>
                        <%# Eval("合約金額") %>                    
                    </ItemTemplate>     
                         <EditItemTemplate>
                             <asp:TextBox id="JVPrice" runat="server" Text='<%# Bind("合約金額") %>' ></asp:TextBox>
                         </EditItemTemplate>                 
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
                 <%--   </table>--%>
		<BR />
				
			</td>
		</tr>
	</table>
     </div>
    <br /><br />
   
   </asp:Content>