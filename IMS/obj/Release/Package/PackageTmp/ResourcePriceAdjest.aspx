<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourcePriceAdjest.aspx.cs" Inherits="IMS.ResourcePriceAdjest" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
      

            </style>
</head>
        <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>
    <form id="form1" runat="server">
    <div>
    
	<table style="width: 100%">
		<tr>
			<td colspan="6" class="TableTop">單一資源項目單價調整</td>
		</tr>
		<tr>
		<td class="Table1">資源編碼</td>
		<td class="Table2">
                                    <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
		<td class="Table1">
		    資源名稱<br />
            </td>
		<td class="Table2">
                                    <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
		<td class="Table1">
		    單位</td>
		<td class="Table2">
                                    <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
		</tr>
		<tr>
		<td class="Table1">
		    原標單<br />
            工程用量</td>
		<td class="Table2">
                                    <asp:Label ID="LbAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
		<td class="Table1">
		    校核後<br />
            工程用量</td>
		<td class="Table2">
                                    <asp:Label ID="LbCAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
		<td class="Table1">
		    工程用量<br />
            差值</td>
		<td class="Table2">
		    <asp:Label ID="LbCAmountAmount" runat="server" ></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="Table1">
		    單價</td>
		<td class="Table2">
		    <asp:Label ID="LbPrice" runat="server"></asp:Label>
            </td>
		<td class="Table1">
		    以工程用量差值<br />
            調整單價之比例</td>
		<td class="Table2">
                                    <asp:TextBox ID="TxTune" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                ％</td>
		<td class="Table1">
		    小數位數設定</td>
		<td class="Table2">
		    <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                <asp:ListItem Selected="True" Value="1">四捨五入至整數位</asp:ListItem>
                <asp:ListItem Value="2">無條件進入至整數位</asp:ListItem>
                <asp:ListItem Value="3">無條件捨去至整數位</asp:ListItem>
                <asp:ListItem Value="4">四捨五入至小數第二位</asp:ListItem>
                <asp:ListItem Value="5">四捨五入至小數第三位</asp:ListItem>
            </asp:RadioButtonList>
            </td>
		</tr>
		<tr>
		<td class="Table1" colspan="6">
                                <asp:Button ID="BtExcute" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="執行單價調整" Width="150px" OnClick="BtExcute_Click" />
                            </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>