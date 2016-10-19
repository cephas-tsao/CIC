<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidLayerSet.aspx.cs" Inherits="BidLayerSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />      
    <style type="text/css">

.auto-style13 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFAF60;
	text-align: center;
	color: #000000;
}
.auto-style14 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFE4CA;
	text-align: left;
	color: #000000;
}



        .auto-style8 {
	color: #FF0000;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">投標預算-編號及階層設定</td>
            </tr>
            <tr>
                <td class="Table1">項次編號方式</td>
                <td class="Table2LC">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem>獨立編號</asp:ListItem>
                                    <asp:ListItem>組合編號</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                <td class="Table2LC">
                                <asp:Label ID="Label1" runat="server" Height="30px" Text="加入組合符號："></asp:Label>
                                <asp:DropDownList ID="DropDownList5" runat="server" Enabled="False" Font-Size="Medium" Height="30px" Width="50px">
                                    <asp:ListItem>.</asp:ListItem>
                                    <asp:ListItem>-</asp:ListItem>
                                    <asp:ListItem>,</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                <td class="Table2" rowspan="2">說明：<br /> 
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">獨立編號</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">組合編號</asp:LinkButton>
                                <asp:Panel ID="Pnl_Note1" runat="server" Visible="False">
                                    <span class="auto-style8">&quot;獨立編號&quot;</span>是依照您所設定的各階層編號直接獨立來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：一, 二, 三,...<br /> 第三階：1, 2, 3,...<br /> ...以此類推</asp:Panel>
                                <asp:Panel ID="Pnl_Note2" runat="server" Visible="False">
                                    <span class="auto-style8">&quot;組合編號&quot;</span>則是依照您所設定的各階層編號，以累加方式來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：壹.一, 壹.二, 壹.三,...<br /> 第三階：壹.一.1, 壹.一.2, 壹.一.3,...<br /> ...以此類推</asp:Panel>
                            </td>
            </tr>
            <tr>
                <td class="Table1">項次編號設定</td>
                <td class="Table2R" colspan="2">
                                <table style="width: 100%">
                                    <tr>
                                        <td class="auto-style13">第一階</td>
                                        <td class="auto-style14">
                                            <asp:DropDownList ID="DropDownList28" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px">
                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [LayerOrder] WHERE ([OrderNum] = @OrderNum) ORDER BY [Kind]">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="0" Name="OrderNum" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            <br />
                                <asp:Button ID="Button2" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="+階層" Width="100px" />
                            </td>
            </tr>
            <tr>
                <td class="Table1" colspan="4">
                    <asp:Button ID="Button3" runat="server" CssClass="BtnLargeShort" PostBackUrl="~/BidBudgetEdit.aspx" Text="儲存設定" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
