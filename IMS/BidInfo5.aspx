<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidInfo5.aspx.cs" Inherits="IMS.BidInfo5" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>投標作業資料</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>標案轉入</title>
      <link href="../CSS/Main.css" rel="stylesheet" type="text/css" />
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
</head>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>

	<br />
       <asp:HiddenField ID="ddd" Value="" runat="server" />
	<table style="width: 100%; padding-left:200px">
		<tr>
		<td class="auto-style3">請選擇標案</td>
		<td class="auto-style4" colspan="3">
			<asp:DropDownList id="DropDownList3" runat="server" Height="30px" Width="300px" AutoPostBack="true" Font-Size="Medium" DataTextField="BidName" DataValueField="Bid" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" >
		</asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BidName" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
		</td>
	</tr>
        	<tr>
			<td colspan="4" class="auto-style1">投標作業資料</td>
		</tr>
  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlEmployees" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
		<tr>
		<td class="auto-style3" style="width: 200px; height: 45px;">標案名稱</td>
			<td class="auto-style4" style="height: 45px">
                <asp:Literal ID="bid" runat="server" Visible="false"></asp:Literal>
             
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
			<td class="auto-style3">作業負責人</td>
			<td class="auto-style4" colspan="3">
                	<asp:DropDownList id="DLWorkManDep" AppendDataBoundItems="True" runat="server" Height="30px" Width="120px" Font-Size="Medium" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="DepartmentName" DataValueField="DepartmentName" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
              <%--  <asp:ListItem Value="0">-請選擇部門-</asp:ListItem>--%>
			</asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"  SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
			<asp:DropDownList id="DLWorkManName" AppendDataBoundItems="true" runat="server" Height="30px" Width="150px" Font-Size="Medium" Font-Names="微軟正黑體" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="Name" AutoPostBack="True">
                <asp:ListItem Value="0">-請選擇部門人員-</asp:ListItem>
			</asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"  SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DLWorkManDep" Name="Department" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

			<%--<asp:DropDownList id="DLWorkManDep" runat="server" Height="30px" Width="150px" Font-Size="Medium" DataTextField="DepartmentName" >
			</asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>   
			<asp:DropDownList id="DLWorkManName" runat="server" Height="30px" Width="150px" Font-Size="Medium" DataTextField="Name" >
			</asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>   --%>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">完成領標日期</td>
			<td class="auto-style4">
			<asp:TextBox id="GetBidDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
			
			</td>
			<td class="auto-style3">預定估算完成日期</td>
			<td class="auto-style4">
			<asp:TextBox id="BookEstimateEndDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">標前會議時間</td>
			<td class="auto-style4">
			<asp:TextBox id="PriBidMeetTime" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
			<td class="auto-style3">寄送標單日期</td>
			<td class="auto-style4">
			<asp:TextBox id="SendBidDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">退圖日期</td>
			<td class="auto-style4" colspan="3">
			<asp:TextBox id="ReturnIlluDate" runat="server"  Height="30px" Width="250px" onclick="WdatePicker();"></asp:TextBox>
		
			</td>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 26px">估算成本</td>
			<td class="auto-style4" style="height: 26px" colspan="3">
			<asp:TextBox id="EstimateCosts" runat="server"  Height="30px" Width="250px"  ></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">建議標價</td>
			<td class="auto-style4">
			<asp:TextBox id="ProposalPrice" runat="server"  Height="30px" Width="250px"></asp:TextBox>
			</td>
			<td class="auto-style3">建議利潤</td>
			<td class="auto-style4">
                <asp:TextBox ID="ProposalProfit" runat="server" ReadOnly="true" ></asp:TextBox>		
			</td>
		</tr>
		<tr>
			<td class="auto-style3">核定標價</td>
			<td class="auto-style4">
			<asp:TextBox id="ApprovedPrice" runat="server"  Height="30px" Width="250px" ></asp:TextBox>
			</td>
			<td class="auto-style3">核定利潤</td>
			<td class="auto-style4">	
                <asp:TextBox ID="ApprovedProfit" runat="server" ReadOnly="true" ></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5" style="padding-left:500px">
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px" OnClick="SaveAction" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" OnClick="Recovery_Click" />
			</td>
		</tr>
        <tr>
			<td colspan="4" class="auto-style5">
			<table style="width: 100%;">
				<tr>
					<td class="auto-style90" style="height: 20px"><strong>新增廠商</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標廠商名稱</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標項目</strong></td>
					<td class="auto-style91" style="height: 20px"><strong>共同投標金額</strong></td>
				</tr>
				<tr>
					<td class="auto-style10">
					<asp:Button id="add" runat="server" Text="新增"  OnClick="add_Click"/>
					</td>
					<td class="auto-style11">
			<asp:DropDownList id="DropDownList9" DataSourceID="SqlDataSource5"  DataTextField="Name" DataValueField="Uid" runat="server" Height="30px" Width="250px" Font-Size="Medium">
				
			</asp:DropDownList>          
					</td>
					<td class="auto-style11">
			<asp:TextBox id="TxJBItem" runat="server"  Height="30px" Width="250px"></asp:TextBox>
					</td>
					<td class="auto-style11">
			<asp:TextBox id="TxJBPrice" runat="server"  Height="30px" Width="250px"></asp:TextBox>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style8">
			共同投標廠商明細</td>
		</tr>
		<tr>
			<td colspan="4" class="auto-style5">
                	<table style="width: 100%;">
			<asp:GridView id="GridView1" runat="server"  AutoGenerateColumns="False" DataKeyNames="JBID"  ForeColor="#333333" GridLines ="None"
                 OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" Width="100%" >     
	
				<Columns>
					   <asp:TemplateField ShowHeader="False"  ItemStyle-Width="100px">         
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
					<asp:BoundField DataField="JBID" HeaderText="JBID" InsertVisible="False" ReadOnly="True" SortExpression="JBID" Visible="False">
					</asp:BoundField>
					  <asp:TemplateField HeaderText="共同投標廠商名稱" ItemStyle-Width="250px"> 
                     <ItemTemplate>
                        <span style="padding-left:100px"><%# Eval("共同投標廠商名稱") %>    </span>                       
                    </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:DropDownList id="Name" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="UID" runat="server" SelectedValue='<%# Bind("FID") %>' ></asp:DropDownList>                           
                        </EditItemTemplate>          
                          </asp:TemplateField>				
                    <asp:TemplateField HeaderText="共同投標項目" ItemStyle-Width="250px">
                    <ItemTemplate>
                       <span style="padding-left:100px"> <%# Eval("共同投標項目") %></span>                  
                    </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox id="JBItem" runat="server" Text='<%# Bind("共同投標項目") %>' ></asp:TextBox>
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="共同投標金額" ItemStyle-Width="250px">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="JBPrice" Text='<%# Eval("共同投標金額") %>'></asp:Label>
                        <%--<span style="padding-left:100px" ><%# Eval("共同投標金額") %> </span>          --%>        
                    </ItemTemplate>     
                         <EditItemTemplate>
                             <asp:TextBox id="JBPrice" runat="server" Text='<%# Bind("共同投標金額") %>' ></asp:TextBox>
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
                        </table>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server"  DeleteCommand="DELETE FROM [Bid_Joint] WHERE [JBID] = @JBID"  
                 >
                  <DeleteParameters>
            <asp:Parameter Name="JBID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>       
            <asp:Parameter Name="JBID" Type="Int32" />
            <asp:Parameter Name="BID" Type="Int32" /> 
            <asp:Parameter Name="FID" Type="Int32" />
            <asp:Parameter Name="JBItem" Type="String" />           
            <asp:Parameter Name="JBPrice" Type="String" />
        </UpdateParameters>
			</asp:SqlDataSource>
			</td>
		</tr>
		
	</table>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
    <script type="text/javascript">
    
        function funBlur()
        {
          
            var n1 = document.forms[0].<%=EstimateCosts.UniqueID%>.value;
            var n2 = document.forms[0].<%=ApprovedPrice.UniqueID%>.value;
            var n3 = document.forms[0].<%=ProposalPrice.UniqueID%>.value;
            
            document.forms[0].<%=ProposalProfit.UniqueID%>.value = n2 - n1;           
            document.forms[0].<%=ApprovedProfit.UniqueID%>.value = n3 - n1;
           
    }
 </script>

    </asp:Content>