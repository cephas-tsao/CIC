<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EReallocation2.aspx.cs" Inherits="EReallocation2" %>

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
            

        
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }    
                
        .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
            width: 66px;
        }
        .auto-style3R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align: right;
	        color: #000000;
            height: 25px;
        }    
        
        </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="8">執行預算-拆工料</td>
		</tr>
		    <tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="2">
                                    <asp:Label ID="Label182" runat="server" Text="4" ForeColor="Red"></asp:Label>
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
            <td class="auto-style3C">
                                    <asp:Label ID="Label174" runat="server" Text="4.4"></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項名稱</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label30" runat="server" Height="25px" Text="1F夾層-鋼筋" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style4">
                單位</td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label31" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style2">
                數量</td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label150" runat="server" Font-Names="微軟正黑體" Text="200"></asp:Label>
                                </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                &nbsp;</td>
		<td class="auto-style2">
                                資源項目</td>
		<td class="auto-style2">
                                類型</td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style2">
                                    上層總用量</td>
            <td class="auto-style2">
                                    執行單價</td>
            <td class="auto-style2">
                                    剩餘用量</td>
            <td class="auto-style2">
                                    新增工項用量</td>
		</tr>
		    <tr>
		<td class="auto-style3C">
                                <asp:CheckBox ID="CheckBox9" runat="server" Text=" " />
            </td>
		<td class="auto-style3">
                                    <asp:Label ID="Label270" runat="server" Height="25px" Text="產品，鋼筋，SD280" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="auto-style3C">
                                    <asp:Label ID="Label223" runat="server" Text="材料" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label224" runat="server" Text="T" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label225" runat="server" Font-Names="微軟正黑體" Text="0.2"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label271" runat="server" Font-Names="微軟正黑體" Text="8,000.00"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label227" runat="server" Font-Names="微軟正黑體" Text="0.2" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		    </tr>
            <tr>
		<td class="auto-style3C">
                                <asp:CheckBox ID="CheckBox10" runat="server" Text=" " />
            </td>
		<td class="auto-style3">
                                    <asp:Label ID="Label228" runat="server" Height="25px" Text="產品，金屬材料，鐵線" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="auto-style3C">
                                    <asp:Label ID="Label272" runat="server" Text="材料" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label230" runat="server" Text="KG" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label231" runat="server" Font-Names="微軟正黑體" Text="0.8"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label232" runat="server" Font-Names="微軟正黑體" Text="22.00"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label233" runat="server" Font-Names="微軟正黑體" Text="0.8" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		    </tr>
            <tr>
		<td class="auto-style3C">
                                <asp:CheckBox ID="CheckBox13" runat="server" Text=" " />
            </td>
		<td class="auto-style3">
                                    <asp:Label ID="Label246" runat="server" Height="25px" Text="技術工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="auto-style3C">
                                    <asp:Label ID="Label247" runat="server" Text="人力" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label248" runat="server" Text="工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label249" runat="server" Font-Names="微軟正黑體" Text="0.27"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label250" runat="server" Font-Names="微軟正黑體" Text="1,700.00"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label251" runat="server" Font-Names="微軟正黑體" Text="0.27" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		    </tr>
            <tr>
		<td class="auto-style3C">
                                <asp:CheckBox ID="CheckBox14" runat="server" Text=" " />
            </td>
		<td class="auto-style3">
                                    <asp:Label ID="Label252" runat="server" Height="25px" Text="小工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="auto-style3C">
                                    <asp:Label ID="Label253" runat="server" Text="人力" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label254" runat="server" Text="工" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label255" runat="server" Font-Names="微軟正黑體" Text="0.27"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label256" runat="server" Font-Names="微軟正黑體" Text="1,500.00"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label257" runat="server" Font-Names="微軟正黑體" Text="0.27" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		    </tr>
            <tr>
		<td class="auto-style3C">
                                <asp:CheckBox ID="CheckBox15" runat="server" Text=" " />
            </td>
		<td class="auto-style3">
                                    <asp:Label ID="Label258" runat="server" Height="25px" Text="零星工料，約以上項目之3.0%" Font-Names="微軟正黑體"></asp:Label>
                                </td>
		<td class="auto-style3C">
                                    <asp:Label ID="Label259" runat="server" Text="雜項" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:Label ID="Label260" runat="server" Text="式" Font-Names="微軟正黑體"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label261" runat="server" Font-Names="微軟正黑體" Text="0.2"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label262" runat="server" Font-Names="微軟正黑體" Text="592.00"></asp:Label>
                                </td>
            <td class="auto-style3R">
                                    <asp:Label ID="Label263" runat="server" Font-Names="微軟正黑體" Text="0.2" ForeColor="Red"></asp:Label>
                                </td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TB_20" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                    </td>
		    </tr>
            </table>
    
        <table style="width: 100%">
		<tr>
		<td class="auto-style2" colspan="2">
                                <asp:Label ID="Label184" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#006600" Text="下層新增工項"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                工項名稱</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="2">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定拆分" PostBackUrl="~/執預4.aspx" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預4.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
