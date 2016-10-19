<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResourcePriceAdjest.aspx.cs" Inherits="ResourcePriceAdjest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 33px;
            }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                }



            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
	<table style="width: 100%">
		<tr>
			<td colspan="6" class="auto-style1">單一資源項目單價調整</td>
		</tr>
		<tr>
		<td class="auto-style15">資源編碼</td>
		<td class="auto-style16">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005100602"></asp:Label>
                                </td>
		<td class="auto-style15">
		    資源名稱<br />
            </td>
		<td class="auto-style16">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Height="25px" Text="操作手，年資6~10年"></asp:Label>
                                </td>
		<td class="auto-style15">
		    單位</td>
		<td class="auto-style16">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="auto-style15">
		    原標單<br />
            工程用量</td>
		<td class="auto-style16">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Text="6.00"></asp:Label>
                                </td>
		<td class="auto-style15">
		    校核後<br />
            工程用量</td>
		<td class="auto-style16">
                                    <asp:Label ID="Label228" runat="server" Font-Names="微軟正黑體" Text="8.00"></asp:Label>
                                </td>
		<td class="auto-style15">
		    工程用量<br />
            差值</td>
		<td class="auto-style16">
		    <asp:Label ID="Label229" runat="server" Text="2.00"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style15">
		    單價</td>
		<td class="auto-style16">
		    <asp:Label ID="Label230" runat="server" Text="2,300"></asp:Label>
            </td>
		<td class="auto-style15">
		    以工程用量差值<br />
            調整單價之比例</td>
		<td class="auto-style16">
                                    <asp:TextBox ID="TextBox96" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">100</asp:TextBox>
                                ％</td>
		<td class="auto-style15">
		    小數位數設定</td>
		<td class="auto-style16">
		    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Selected="True">四捨五入至整數位</asp:ListItem>
                <asp:ListItem>無條件進入至整數位</asp:ListItem>
                <asp:ListItem>無條件捨去至整數位</asp:ListItem>
                <asp:ListItem>四捨五入至小數第二位</asp:ListItem>
                <asp:ListItem>四捨五入至小數第三位</asp:ListItem>
            </asp:RadioButtonList>
            </td>
		</tr>
		<tr>
		<td class="auto-style15" colspan="6">
                                <asp:Button ID="Button16" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="執行單價調整" Width="150px" />
                            </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>
