<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EChangeSummaryV.aspx.cs" Inherits="IMS.EChangeSummaryV" %>

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
   <asp:sqldatasource ID="Sqldatasource1" runat="server"></asp:sqldatasource> 
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="4">合約預算變更摘要</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="LbNum" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更核定日期</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbDate" runat="server" ></asp:Label>
            </td>
            <td class="auto-style2">
                變更核定文號</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbNo" runat="server" ></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                追加減工期</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbDuration" runat="server" ></asp:Label>
            </td>
            <td class="auto-style2">
                變更後預計完工日期</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbPredict" runat="server" ></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                總追加減金額</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbIdMoney" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">
                變更後合約總價</td>
            <td class="auto-style3">
                                    <asp:Label ID="LbCAmount" runat="server" ></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註說明</td>
            <td class="auto-style3" colspan="3">
                                    <asp:Label ID="LbNotes" runat="server" ></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    &nbsp;<asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" OnClientClick="window.close()" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>