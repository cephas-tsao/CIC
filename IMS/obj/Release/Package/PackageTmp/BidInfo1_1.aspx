<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master"  CodeBehind="BidInfo1_1.aspx.cs" Inherits="IMS.BidInfo1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>初步招標訊息</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
.center {
	text-align: center;
}
.right {
	text-align: right;
}
.auto-style6 {
	font-size: small;
	color: #FF0000;
}
.largebutton {
	font-family: 微軟正黑體;
    font-size: large;
    font-weight:bold;
}


</style>
 <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>


 <asp:ScriptManager ID="ScriptManager1" runat="server" >
        </asp:ScriptManager>
<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style3">請選擇標案</td>
		
  <td>  
    <asp:DropDownList ID="DropDownList1" DataSourceID="SqlDataSource1" runat="server"  Width="300px" Font-Size="20px" AutoPostBack="true" DataTextField="BidName" DataValueField="BidName"  ></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server">  
   
        </asp:SqlDataSource>   
		</td>
	</tr>
    </table>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlEmployees" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
<table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
	<tr>
		<td class="auto-style1" colspan="2">初步招標訊息</td>
	</tr>
	<tr>
		<td class="auto-style3" style="height: 22px; width: 306px;">標案名稱</td>
		<td class="auto-style4" style="height: 22px">
		<asp:TextBox id="ltName" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="auto-style3" style="width: 306px">標案狀態</td>
		<td class="auto-style4">
		<asp:DropDownList id="DropDownList2" runat="server" Height="30px" Width="300px">
		</asp:DropDownList>
		</td>
	</tr>

	<tr>
		<td class="auto-style3" style="width: 306px">預估金額</td>
		<td class="auto-style4">
		<asp:TextBox id="ltForecastPrice" runat="server" Height="30px" Width="300px"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td class="auto-style3" style="width: 306px">預估招標日期</td>
		<td class="auto-style4">
		<asp:TextBox ID="ltForecastBiddingDate" runat="server" Height="30px" Width="300px" onclick="WdatePicker();"></asp:TextBox>
				
        </td>
	</tr>
   
	<tr>
		<td class="auto-style3" style="width: 306px">備註</td>
		<td class="auto-style4">
		<asp:TextBox id="ltNotes" runat="server" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>

	<tr>
		<td colspan="2" class="center">
    
		<asp:Button id="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存修改" Width="107px"  CommandName="edit" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button id="Button2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="回復原值" Width="107px" OnClick="Button2_Click"/>
		</td>
	</tr>
</table>
</ItemTemplate>
</asp:Repeater>
 <asp:SqlDataSource ID="sqlEmployees" runat="server">
  <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BIDNAME" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
<%--    </form>--%>
    </asp:Content>
