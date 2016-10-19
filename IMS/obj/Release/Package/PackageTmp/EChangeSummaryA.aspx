<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EChangeSummaryA.aspx.cs" Inherits="IMS.EChangeSummaryA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
    <title></title>
    <style type="text/css">




        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
        }
            

        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="4">合約預算變更-新增變更摘要</td>
		</tr>
		<tr>
		<td class="auto-style2" >
                                變更次別</td>
            <td class="auto-style3" >
                <asp:Label ID="LbCNum" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}"></asp:Label>
            </td>
              <td class="auto-style2">
                                對應版本次別</td>
              <td class="auto-style3" >
             執行預算版本：<asp:DropDownList ID="DropDownList2" Width="120px" runat="server" Enabled="false"> 
                 </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           合約預算版本：<asp:DropDownList ID="DropDownList1" Width="100px" runat="server">
                <asp:ListItem Value="0">目前無版本對應</asp:ListItem>
                  </asp:DropDownList>
              
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更核定日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TxCDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" onclick="WdatePicker();" ></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更核定文號</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TxCNo" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                追加減工期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TxDuration" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更後預計完工日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TxFdate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" onclick="WdatePicker();" ></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                總追加減金額</td>
            <td class="auto-style3">
                                    <asp:Label ID="TxIDMoney" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:Label>
            </td>
            <td class="auto-style2">
                變更後合約總價</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TxCamount" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註說明</td>
            <td class="auto-style3" colspan="3">
                                    <asp:TextBox ID="TxNotes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" Width="800px" AutoPostBack="True" TextMode="MultiLine"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="BtnAdd" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增變更並離開"  OnClick="BtnAdd_Click"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" OnClientClick="return confirm('將不儲存新增資料!')" OnClick="Button4_Click" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>