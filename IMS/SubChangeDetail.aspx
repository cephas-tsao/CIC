<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubChangeDetail.aspx.cs" Inherits="IMS.SubChangeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />

    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 19px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align: central;
            height: 19px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="TableTop">分包預算項目追加減明細</td>
		</tr>
		</table>
    
        <table class="Table100">
		<tr>
		<td class="Table1">
                                追加減次序</td>
		<td class="Table2CC">
                <asp:Label ID="LbEdition" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" ></asp:Label>
            </td>
              <td class="Table1">
                                    執行項次</td>
            <td class="Table2">
                                        <asp:Label ID="LbBItem" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
            <td class="Table1">
                工項/工料名稱</td>
            <td class="Table2">
                                        <asp:Label ID="LbSCID" runat="server" Font-Size="Medium" Height="25px" Visible="false"></asp:Label>
                                        <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px"></asp:Label>
            </td>
            <td class="Table1">
                單位</td>
            <td class="Table2CC">
                <asp:Label ID="LbUnit" runat="server" ></asp:Label>
            </td>
          
		</tr>
		<tr>
		<td class="Table0" colspan="8">
                                所屬工項-執行預算</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                &nbsp;</td>
            <td class="Table1" colspan="2">
                                    執行數量</td>
            <td class="Table1" colspan="2">
                                    執行單價</td>
            <td class="Table1" colspan="2">
                                    執行複價</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                原執行預算</td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbEQuantity" runat="server" ></asp:Label></td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbEPrice" runat="server" ></asp:Label></td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbEComplex" runat="server" ></asp:Label></td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                末次變更後</td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbLEQuantity" runat="server" ></asp:Label></td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbLEPrice" runat="server" ></asp:Label></td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbLEComplex" runat="server" ></asp:Label></td>
		</tr>
		<tr>
		<td class="Table0" colspan="8">
                                分包預算項目</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                &nbsp;</td>
            <td class="Table1" colspan="2">
                                    數量</td>
            <td class="Table1" colspan="2">
                                    單價</td>
            <td class="Table1" colspan="2">
                                    複價</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                原預算</td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbSubQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbSubPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbSubComplex" runat="server" Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style1" colspan="2">
                                變更前</td>
            <td class="auto-style2" colspan="2">
                <asp:Label ID="LbBCQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style2" colspan="2">
                <asp:Label ID="LbBCPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style2" colspan="2">
                <asp:Label ID="LbBCComplex" runat="server"  Width="150px"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                本次追加減</td>
            <td class="Table2CC" colspan="2">
                                    <asp:TextBox ID="TB_5" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="TB_5_TextChanged"></asp:TextBox>
            </td>
            <td class="Table2CC" colspan="2">
                &nbsp;</td>
            <td class="Table2CC" colspan="2">
                                    &nbsp;</td>
		</tr>
		<tr>
		<td class="Table1" colspan="2">
                                變更後</td>
            <td class="Table2CC" colspan="2">
                                    <asp:TextBox ID="LbACQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" OnTextChanged="Label184_TextChanged"></asp:TextBox>
            </td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbACPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="Table2CC" colspan="2">
                <asp:Label ID="LbACComplex" runat="server"  Width="150px"></asp:Label>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="Table1">
                                    <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開" OnClick="BtnSave_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁"  OnClick="BtnBack_Click" />
                                </td>
		</tr>
		</table>
    
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

