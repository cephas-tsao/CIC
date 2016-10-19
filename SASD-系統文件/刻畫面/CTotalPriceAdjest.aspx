<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CTotalPriceAdjest.aspx.cs" Inherits="CTotalPriceAdjest" %>

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
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">合約預算總價調整</td>
		</tr>
		<tr>
		<td class="auto-style2" width="70%">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">目前總金額</td>
                                <td class="auto-style3">
                                    <asp:Label ID="LB_NormalPrice" runat="server" Text="335,420"></asp:Label>
                                </td>
                                <td class="auto-style3" rowspan="3" width="50%">說明：<br /> 總價調整計算係依使用者設定之總價調整比例，調整計算各資源項目之單價，因小數位數取捨之故，實際調整後總金額與預計調整後總金額略有出入，建議使用者進行總價調整後，可針對單一資源項目進行修正單價，以更趨近預計調整後之總金額。</br>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">調整比例</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TB_Percent" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="190px" AutoPostBack="True" OnTextChanged="TB_Percent_TextChanged">100</asp:TextBox>
                                    ％</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">調整後總金額</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="TB_Price" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px" AutoPostBack="True" OnTextChanged="TB_Price_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="3">
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="計算總價調整" />
                                </td>
                            </tr>
                        </table>
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
