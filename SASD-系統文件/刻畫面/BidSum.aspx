<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidSum.aspx.cs" Inherits="BidSum" %>

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
            height: 27px;
        }
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #BBBB00;
	text-align: center;
	color: black;
            height: 27px;
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



            .auto-style17 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 33px;
            width: 151px;
        }



            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
	    <br />
    
	<table style="width: 100%">
		<tr>
			<td class="auto-style1" colspan="8">投標預算計算設定</td>
		</tr>
		<tr>
		<td class="auto-style2">數<br />
            量</td>
		<td class="auto-style17">計算方式</td>
		<td class="auto-style16" colspan="3">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">沿用業主標單數量</asp:ListItem>
                                        <asp:ListItem>依業主標單數量調整小數位數</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
		<td class="auto-style15">
		    小數位數設定</td>
		<td class="auto-style16">
		    <asp:RadioButtonList ID="RadioButtonList3" runat="server" Enabled="False">
                <asp:ListItem Selected="True">四捨五入</asp:ListItem>
                <asp:ListItem>無條件進入</asp:ListItem>
                <asp:ListItem>無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="auto-style16">
                                    至小數點後<asp:TextBox ID="TextBox97" runat="server" Height="20px" Width="25px" Enabled="False">0</asp:TextBox>
                                    位</td>
		</tr>
		<tr>
		<td class="auto-style2">
		    單<br />
            價</td>
		<td class="auto-style17">
		    計算方式</td>
		<td class="auto-style16" colspan="3">
                                    <asp:RadioButtonList ID="RadioButtonList6" runat="server">
                                        <asp:ListItem>沿用原填列單價</asp:ListItem>
                                        <asp:ListItem>依校核後總價進行總價調整</asp:ListItem>
                                    </asp:RadioButtonList>
            </td>
		<td class="auto-style15">
		    小數位數設定</td>
		<td class="auto-style16">
		    <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                <asp:ListItem Selected="True">四捨五入</asp:ListItem>
                <asp:ListItem>無條件進入</asp:ListItem>
                <asp:ListItem>無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="auto-style16">
                                    至小數點後<asp:TextBox ID="TextBox99" runat="server" Height="20px" Width="25px">0</asp:TextBox>
                                    位</td>
		</tr>
		<tr>
		<td class="auto-style2">
		    複<br />
            價</td>
		<td class="auto-style15">
		    小數位數設定</td>
		<td class="auto-style16">
		    <asp:RadioButtonList ID="RadioButtonList7" runat="server">
                <asp:ListItem Selected="True">四捨五入</asp:ListItem>
                <asp:ListItem>無條件進入</asp:ListItem>
                <asp:ListItem>無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="auto-style16">
                                    至小數點後<asp:TextBox ID="TextBox100" runat="server" Height="20px" Width="25px">0</asp:TextBox>
                                    位</td>
		<td class="auto-style2">
                                    總<br />
                                    價</td>
		<td class="auto-style15">
		    小數位數設定</td>
		<td class="auto-style16">
		    <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                <asp:ListItem Selected="True">四捨五入</asp:ListItem>
                <asp:ListItem>無條件進入</asp:ListItem>
                <asp:ListItem>無條件捨去</asp:ListItem>
            </asp:RadioButtonList>
                                </td>
		<td class="auto-style16">
                                    至小數點後<asp:TextBox ID="TextBox98" runat="server" Height="20px" Width="25px">0</asp:TextBox>
                                    位</td>
		</tr>
		<tr>
		<td class="auto-style15">
                                &nbsp;</td>
		<td class="auto-style15" colspan="7">
                                <asp:Button ID="Button16" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="執行重新總計" Width="150px" />
                            </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>
