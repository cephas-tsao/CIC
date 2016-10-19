﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HistoryEPrice.aspx.cs" Inherits="HistoryEPrice" %>

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
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
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
			<td class="auto-style1" colspan="8">歷史發包單價</td>
		</tr>
		    <tr>
		<td class="auto-style2">
                                專案編號</td>
            <td class="auto-style2">
                                    專案名稱</td>
            <td class="auto-style2">
                                    資源編碼</td>
            <td class="auto-style2">
                                    資源名稱</td>
            <td class="auto-style2">
                                    單位</td>
            <td class="auto-style2">
                                    報價廠商</td>
            <td class="auto-style2">
                                    報價單價</td>
            <td class="auto-style2">
                                    報價有效期限</td>
            </tr>
		    <tr>
		<td class="auto-style3C">
                                <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103CIC001"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label93" runat="server" Font-Names="微軟正黑體" Height="25px" Text="CIC研究室整修工程"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label112" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                </td>
            <td class="auto-style3">
                                    <asp:Label ID="Label92" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label131" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Height="25px" Text="育偉土木包工業"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Height="25px" Text="985"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label95" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103.06.30"></asp:Label>
                                </td>
            </tr>
		    <tr>
		<td class="auto-style3C">
                                <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103CIC001"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label114" runat="server" Font-Names="微軟正黑體" Height="25px" Text="CIC研究室整修工程"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                </td>
            <td class="auto-style3">
                                    <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label117" runat="server" Font-Names="微軟正黑體" Height="25px" Text="老王營造"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label118" runat="server" Font-Names="微軟正黑體" Height="25px" Text="960"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label119" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103.07.31"></asp:Label>
                                </td>
            </tr>
            <tr>
		<td class="auto-style3C">
                                <asp:Label ID="Label120" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103CIC001"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label121" runat="server" Font-Names="微軟正黑體" Height="25px" Text="CIC研究室整修工程"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label122" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0406131003"></asp:Label>
                                </td>
            <td class="auto-style3">
                                    <asp:Label ID="Label123" runat="server" Font-Names="微軟正黑體" Height="25px" Text="水泥砂漿，1:3，第1型水泥"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label133" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Height="25px" Text="乃文預拌廠"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label125" runat="server" Font-Names="微軟正黑體" Height="25px" Text="1,100"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label126" runat="server" Font-Names="微軟正黑體" Height="25px" Text="103.12.31"></asp:Label>
                                </td>
            </tr>
		    </table>
    
    </div>
    </form>
</body>
</html>
