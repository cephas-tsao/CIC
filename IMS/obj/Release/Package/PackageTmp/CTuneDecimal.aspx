﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CTuneDecimal.aspx.cs" Inherits="IMS.TuneDecimal" %>

<!DOCTYPE html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
	    <br />
    
	<table  class="Table100">
		<tr>
			<td class="TableTop" colspan="8">合約預算計算設定</td>
		</tr>
		<tr>
		<td class="Table1">數<br />
            量</td>
		<%--<td class="Table1">計算方式</td>
		<td class="Table2" colspan="3">
                                    <asp:RadioButtonList ID="RBLNum" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="0">沿用業主標單數量</asp:ListItem>
                                        <asp:ListItem Value="1">依業主標單數量調整小數位數</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>--%>
		<td class="Table1">
		    小數位數設定</td>
		<td class="Table2">
		    <asp:RadioButtonList ID="RBLRule1" runat="server"  OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="0">四捨五入</asp:ListItem>
                <asp:ListItem Value="1">無條件進入</asp:ListItem>
                <asp:ListItem Value="2">無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="Table2">
                                    至小數點後<asp:TextBox ID="TxDec1" runat="server" Height="20px" Width="25px" ></asp:TextBox>
                                    位</td>
		</tr>
		<tr>
		<td class="Table1">
		    單<br />
            價</td>
		<%--<td class="Table1">
		    計算方式</td>
		<td class="Table2" colspan="3">
                                    <asp:RadioButtonList ID="RBLPrice" AutoPostBack="True" runat="server" OnSelectedIndexChanged="RBLPrice_SelectedIndexChanged"> 
                                        <asp:ListItem Value="0" Selected="True">沿用原填列單價</asp:ListItem>
                                        <asp:ListItem Value="1">依校核後總價進行總價調整</asp:ListItem>
                                    </asp:RadioButtonList>
            </td>--%>
		<td class="Table1">
		    小數位數設定</td>
		<td class="Table2">
		    <asp:RadioButtonList ID="RBLRule2" runat="server"  >
                <asp:ListItem Selected="True" Value="0">四捨五入</asp:ListItem>
                <asp:ListItem Value="1">無條件進入</asp:ListItem>
                <asp:ListItem Value="2">無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="Table2">
                                    至小數點後<asp:TextBox ID="TxDec2" runat="server" Height="20px" Width="25px"></asp:TextBox>
                                    位</td>
		</tr>
		<tr>
		<td class="Table1">
		    複<br />
            價</td>
		<td class="Table1">
		    小數位數設定</td>
		<td class="Table2">
		    <asp:RadioButtonList ID="RBLRule3" runat="server" >
                <asp:ListItem Selected="True" Value="0">四捨五入</asp:ListItem>
                <asp:ListItem Value="1">無條件進入</asp:ListItem>
                <asp:ListItem Value="2">無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="Table2">
                                    至小數點後<asp:TextBox ID="TxDec3" runat="server" Height="20px" Width="25px"></asp:TextBox>
                                    位</td>
		
		</tr>
        <%--<tr>
            <td class="Table1">
                                    總<br />
                                    價</td>
		<td class="Table1">
		    小數位數設定</td>
		<td class="Table2">
		    <asp:RadioButtonList ID="RBLRule4" runat="server" >
                <asp:ListItem Selected="True" Value="0">四捨五入</asp:ListItem>
                <asp:ListItem Value="1">無條件進入</asp:ListItem>
                <asp:ListItem Value="2">無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="Table2">
                                    至小數點後<asp:TextBox ID="TxDec4" runat="server" Height="20px" Width="25px"></asp:TextBox>
                                    位</td>
        </tr>--%>
		<tr>
		<td class="Table1">
                                &nbsp;</td>
		<td class="Table1" colspan="7">
                                <asp:Button ID="ReCal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="執行重新總計" Width="150px" OnClick="ReCal_Click" />
                            </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>