<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EChangeSummaryV.aspx.cs" Inherits="EChangeSummaryV" %>

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
            

        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="4">執行預算變更摘要</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="3"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更核定日期</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label174" runat="server" Text="2015/8/8"></asp:Label>
            </td>
            <td class="auto-style2">
                變更核定文號</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label175" runat="server" Text="工程變字第104080800001號"></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                追加減工期</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label178" runat="server" Text="0"></asp:Label>
            </td>
            <td class="auto-style2">
                變更後預計完工日期</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label176" runat="server" Text="2015/12/31"></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                總追加減金額</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label179" runat="server" Text="+2257013"></asp:Label>
            </td>
            <td class="auto-style2">
                變更後合約總價</td>
            <td class="auto-style3">
                                    <asp:Label ID="Label177" runat="server" Text="18,374,894"></asp:Label>
                                    </td>
		</tr>
		<tr>
		<td class="auto-style2">
                                備註說明</td>
            <td class="auto-style3" colspan="3">
                                    <asp:Label ID="Label180" runat="server" Text="第四次變更設計"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    &nbsp;<asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" PostBackUrl="~/執預2.aspx" />
                                </td>
		</tr>
		</table>
    
    </div>
    </form>
</body>
</html>
