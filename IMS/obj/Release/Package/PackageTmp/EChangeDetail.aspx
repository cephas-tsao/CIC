<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EChangeDetail.aspx.cs" Inherits="IMS.EChangeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            

        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="8">執行預算項目變更明細</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3">
                <asp:Label ID="LbEdition" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項</td>
            <td class="auto-style3" colspan="5">
                                    <asp:Label ID="LbUpItem" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                項次</td>
            <td class="auto-style3">
                <asp:Label ID="LbItemOrder" runat="server" ></asp:Label>
            </td>
            <td class="auto-style2">
                工項名稱</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbItemName" runat="server" Height="25px"  Font-Names="微軟正黑體"></asp:Label>
            </td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style3">
                <asp:Label ID="LbUnit" runat="server" ></asp:Label>
            </td>
            <td class="auto-style2">
                工項備註</td>
            <td class="auto-style3">
                &nbsp;<asp:Label ID="LbNotes" runat="server" ></asp:Label></td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                    選擇顯示之變更次別</td>
             <td class="auto-style3" style="width:100px" ><span style="width:100px" colspan="2">  <asp:CheckBox ID="check" runat="server" Text="原合約預算" Checked="true" Enabled="false" /></span></td>
                  <td class="auto-style3"> <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal"  ></asp:CheckBoxList> </td>
            <td class="auto-style2">
                                    <asp:Button ID="ReLoad" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="重新載入" OnClick="ReLoad_Click" />
                                </td>
		</tr>
		</table>
    
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                </td>
            <td class="auto-style2">
                                    合約數量</td>
            <td class="auto-style2">
                                    合約單價</td>
            <td class="auto-style2">
                                    合約複價</td>
            <td class="auto-style2">
                                    執行數量</td>
            <td class="auto-style2">
                                    執行單價</td>
            <td class="auto-style2">
                                    執行複價</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="LbCQuantity" runat="server"></asp:Label></td>
            <td class="auto-style3C">
               <asp:Label ID="LbCPrice" runat="server" ></asp:Label></td>
            <td class="auto-style3C">
                <asp:Label ID="LbCComplex" runat="server"></asp:Label></td>
            <td class="auto-style3C">
                <asp:Label ID="LbEQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbEPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbEComplex" runat="server"  Width="150px"></asp:Label>
            </td>
		</tr>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
	<%--	<tr>
		<td class="auto-style2">
                                第3次變更後</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                <asp:Label ID="Label181" runat="server" Text="203.78" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label182" runat="server" Text="13" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="Label183" runat="server" Text="2,649" Width="150px"></asp:Label>
            </td>
		</tr>--%>
		<tr>
		<td class="auto-style2">
                                本次追加減</td>
            <td class="auto-style3C">
                                    -</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                                    -</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TxIDQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="TxACQuantity_TextChanged">0</asp:TextBox>
            </td>
            <td class="auto-style3C">
                &nbsp;</td>
            <td class="auto-style3C">
                                    &nbsp;</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更後</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                -</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TxACQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="TxACQuantity_TextChanged"></asp:TextBox>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbAEPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbAComplex" runat="server"  Width="150px"></asp:Label>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開" OnClick="BtnSave_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" OnClientClick="window.close()"  />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>