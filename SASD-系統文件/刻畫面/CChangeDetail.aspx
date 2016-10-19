<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CChangeDetail.aspx.cs" Inherits="CChangeDetail" %>

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
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }
            

        
        .auto-style5 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style6 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
            

        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="6">合約預算項目變更明細</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="5"></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項</td>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="Label174" runat="server" Text="一 假設工程"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                項次</td>
            <td class="auto-style3">
                <asp:Label ID="Label175" runat="server" Text="1"></asp:Label>
            </td>
            <td class="auto-style2">
                工項名稱</td>
            <td class="auto-style3">
                <asp:Label ID="Label176" runat="server" Text="清除及掘除"></asp:Label>
            </td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style3">
                <asp:Label ID="Label177" runat="server" Text="M2"></asp:Label>
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
		<td class="auto-style5" colspan="4">
                                執行預算</td>
            
		</tr>
		<tr>
		<td class="auto-style5">
                                </td>
            <td class="auto-style2">
                                    數量</td>
            <td class="auto-style2">
                                    單價</td>
            <td class="auto-style2">
                                    複價</td>
            
		</tr>
		<tr>
		<td class="auto-style5">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="Label189" runat="server" Text="1,680" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label191" runat="server" Text="16" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label193" runat="server" Text="26,880" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style5">
                                末次變更後</td>
            <td class="auto-style3C">
                <asp:Label ID="Label190" runat="server" Text="1,980" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label192" runat="server" Text="16" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label194" runat="server" Text="31,680" Width="150px"></asp:Label>
            </td>
		</tr>
		    <tr>
		<td class="auto-style5" colspan="4">
                                合約預算</td>
            </tr>
            <tr>
		<td class="auto-style6">
                                </td>
            <td class="auto-style6">
                                    數量</td>
            <td class="auto-style6">
                                    單價</td>
            <td class="auto-style6">
                                    複價</td>
		    </tr>
		<tr>
		<td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="Label178" runat="server" Text="1,680" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label179" runat="server" Text="16" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label180" runat="server" Text="26,880" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更前</td>
            <td class="auto-style3C">
                <asp:Label ID="Label181" runat="server" Text="1,680" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label182" runat="server" Text="16" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label183" runat="server" Text="26,880" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style5">
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
		<td class="auto-style5">
                                變更後</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="Label184" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="Label184_TextChanged">1,680</asp:TextBox>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label188" runat="server" Text="16" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label187" runat="server" Text="26,880" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style5">
                                責任歸屬</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>業主變更及要求</asp:ListItem>
                    <asp:ListItem>投標自算與預算編列因素</asp:ListItem>
                    <asp:ListItem>設計圖面的衝突</asp:ListItem>
                    <asp:ListItem>工地需求、施工因素及工法變更</asp:ListItem>
                    <asp:ListItem>拆工料、單價、單位及發包方式變更</asp:ListItem>
                    <asp:ListItem>應扣包商款項</asp:ListItem>
                    <asp:ListItem>天然災害</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                原因</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>原預算未列</asp:ListItem>
                    <asp:ListItem>規格改變</asp:ListItem>
                    <asp:ListItem>用量增減</asp:ListItem>
                    <asp:ListItem>客戶變更</asp:ListItem>
                    <asp:ListItem>其他</asp:ListItem>
                </asp:DropDownList>
            </td>
		</tr>
		<tr>
		<td class="auto-style5" colspan="4">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開" PostBackUrl="~/合預4-1.aspx" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/合預4-1.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
