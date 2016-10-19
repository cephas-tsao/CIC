<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EChangeDetail.aspx.cs" Inherits="EChangeDetail" %>

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
        .auto-style2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: right;
            color: #000000;
            height: 25px;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
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
			<td class="auto-style1" colspan="6">執行預算項目變更明細</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="3"></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項</td>
            <td class="auto-style3" colspan="3">
                                    <asp:Label ID="Label306" runat="server" Height="25px" Text="2 結構用混凝土，預拌，140kgf/cm2，第1型水泥" Font-Names="微軟正黑體"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                項次</td>
            <td class="auto-style3">
                <asp:Label ID="Label175" runat="server" Text="2.1"></asp:Label>
            </td>
            <td class="auto-style2">
                工項名稱</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label268" runat="server" Height="25px" Text="基礎底層-140混凝土" Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style3">
                <asp:Label ID="Label177" runat="server" Text="M3"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                工項備註</td>
            <td class="auto-style3" colspan="5">
                &nbsp;</td>
		</tr>
		</table>
    
        <table style="width: 100%">
		<tr>
		<td class="auto-style2" colspan="4">
                                合約預算</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                </td>
            <td class="auto-style2">
                                    數量</td>
            <td class="auto-style2">
                                    單價</td>
            <td class="auto-style2">
                                    複價</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="Label323" runat="server" Text="1,000.00" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label324" runat="server" Text="3,045" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label325" runat="server" Text="3,045,000.00" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                末次變更後</td>
            <td class="auto-style3C">
                <asp:Label ID="Label326" runat="server" Text="1,000.00" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label327" runat="server" Text="3,045" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label328" runat="server" Text="3,045,000.00" Width="150px"></asp:Label>
            </td>
		</tr>
		    <tr>
		<td class="auto-style2R" colspan="4">
                                註：若所選之執行預算工項為拆數量子項，則合約預算顯示其上層對應之合約預算工項</td>
            </tr>
		    <tr>
		<td class="auto-style2" colspan="4">
                                執行預算</td>
            </tr>
            <tr>
		<td class="auto-style2">
                                &nbsp;</td>
            <td class="auto-style2">
                                    數量</td>
            <td class="auto-style2">
                                    單價</td>
            <td class="auto-style2">
                                    複價</td>
            </tr>
		<tr>
		<td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="Label178" runat="server" Text="500.00" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label329" runat="server" Text="3,045" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label180" runat="server" Text="1,522,500.00" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更前</td>
            <td class="auto-style3C">
                <asp:Label ID="Label181" runat="server" Text="800.00" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label330" runat="server" Text="3,045" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label331" runat="server" Text="2,436,000.00" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                本次追加減</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="TB_5_TextChanged">0</asp:TextBox>
            </td>
            <td class="auto-style3C">
                &nbsp;</td>
            <td class="auto-style3C">
                                    &nbsp;</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更後</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="Label184" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="Label184_TextChanged">800.00</asp:TextBox>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label188" runat="server" Text="3,045" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label187" runat="server" Text="2,436,000.00" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註</td>
            <td class="auto-style3" colspan="3">
                                    <asp:TextBox ID="TB_6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="92px" Width="435px" AutoPostBack="True" TextMode="MultiLine"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開" PostBackUrl="~/執預3_4.aspx" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預4.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
