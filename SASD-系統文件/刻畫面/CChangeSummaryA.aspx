<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CChangeSummaryA.aspx.cs" Inherits="CChangeSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="5"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更核定日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True"></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更核定文號</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True"></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                追加減工期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True">0</asp:TextBox>
            </td>
            <td class="auto-style2">
                變更後預計完工日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True"></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                總追加減金額</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True"></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更後合約總價</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True"></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註說明</td>
            <td class="auto-style3" colspan="3">
                                    <asp:TextBox ID="TB_7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" Width="800px" AutoPostBack="True" TextMode="MultiLine"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="新增變更並離開" PostBackUrl="~/合預4-2.aspx" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/合預4-1.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
