<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewEItem.aspx.cs" Inherits="AddNewEItem" %>

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
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
        }
            

        
        .Table2 {
            width: 100%;
        }
                

        .auto-style2C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: center;
	        color: #000000;
        }
        


        .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
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
			<td class="auto-style1">新增執行預算工項</td>
		</tr>
		</table>
                    <table class="Table2">
                        <tr>
                            <td class="auto-style4">階層</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList33" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem Selected="True">3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style4">上層工項</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList38" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem Value="1">一 結構體工程</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2C">項次</td>
                            <td class="auto-style3">
                                <asp:Label ID="Label1" runat="server" Text="6"></asp:Label>
                            </td>
                            <td class="auto-style2C">工項類型</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList36" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">主項大類</asp:ListItem>
                                    <asp:ListItem Value="workitem">工作項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2C">名稱</td>
                            <td class="auto-style3" colspan="3">
                                <asp:TextBox ID="TextBox52" runat="server" Font-Size="Medium" Height="25px" Width="500px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2C">單位</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList37" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2C">備註</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox53" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2C" colspan="4">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定新增並離開" PostBackUrl="~/執預1.aspx" />
                                &nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="關閉視窗" PostBackUrl="~/執預1.aspx" />
                                </td>
                        </tr>
                    </table>
    
    </div>
    </form>
</body>
</html>
