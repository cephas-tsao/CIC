<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CChangeSummaryE.aspx.cs" Inherits="IMS.CChangeSummaryE" %>

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
            height: 25px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="4">合約預算變更-變更摘要編輯</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="LbNum" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更核定日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更核定文號</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbNo" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="250px" ></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                追加減工期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbDuration" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更後預計完工日期</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbPredict" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                總追加減金額</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbIdMoney" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" ></asp:TextBox>
            </td>
            <td class="auto-style2">
                變更後合約總價</td>
            <td class="auto-style3">
                                    <asp:TextBox ID="LbCAmount" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px"></asp:TextBox>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註說明</td>
            <td class="auto-style3" colspan="3">
                                    <asp:TextBox ID="LbNotes" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" Width="800px"  TextMode="MultiLine"></asp:TextBox>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開"  OnClick="BtnSave_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁"  OnClick="BtnBack_Click" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
