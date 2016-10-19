<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XENumberBD.aspx.cs" Inherits="XENumberBD" %>

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
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
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
			<td class="auto-style1" colspan="8">執行預算-拆數量</td>
		</tr>
		    <tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="2">
                                    <asp:Label ID="Label182" runat="server" Text="0" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style2L" colspan="5">
                                    PS.0表示原預算</td>
            </tr>
		<tr>
		<td class="auto-style2" colspan="8">
                                <asp:Label ID="Label183" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#006600" Text="上層工項"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                項次</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label174" runat="server" Text="4"></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項名稱</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label34" runat="server" Height="25px" Text="鋼筋，鋼筋續接器，(D6mm，光面)，工廠交貨" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label35" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style2">
                合約預算數量</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="683.78"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                &nbsp;</td>
		<td class="auto-style2">
                                已拆分數量</td>
		<td class="auto-style3">
                                    <asp:Label ID="Label185" runat="server" Font-Names="微軟正黑體" Text="203.78" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style2">
                剩餘數量</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label181" runat="server" Font-Names="微軟正黑體" Text="480" ForeColor="Red"></asp:Label>
                                </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2" colspan="4">
                                <asp:Label ID="Label184" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#006600" Text="下層新增工項"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                工項名稱</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px"></asp:TextBox>
            </td>
            <td class="auto-style2">
                數量</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_6" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" PostBackUrl="~/執預1.aspx" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預1.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
