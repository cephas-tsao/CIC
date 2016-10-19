<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CResourceList.aspx.cs" Inherits="CResourceList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />  

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="2">合約預算建置編修</td>
            </tr>
            <tr>
                <td class="Table0" colspan="2">單價填列</td>
            </tr>
            <tr>
                <td class="Table1L" style="width: 50%">&nbsp;<asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="前往工項編輯" Width="27px" PostBackUrl="~/CBudgetEdit.aspx" />
                                &nbsp;</td>
                <td class="Table1R">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                    &nbsp; </td>
            </tr>
            </table>
                        <table class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">資源編碼</td>
                                <td class="ShtCellCC">資源名稱</td>
                                <td class="ShtCellCC">單位</td>
                                <td class="ShtCellCC">合約工程用量</td>
                                <td class="ShtCellCC">單價</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label109" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02240A0003"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label89" runat="server" Font-Names="微軟正黑體" Height="25px" Text="袪水，擋抽排水"></asp:Label>
                                </td>
                                <td align="center" class="ShtCellCC">
                                    <asp:Label ID="Label128" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label147" runat="server" Font-Names="微軟正黑體" Text="3,250.00"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox85" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">8</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label110" runat="server" Font-Names="微軟正黑體" Height="25px" Text="02323A0003"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label90" runat="server" Font-Names="微軟正黑體" Height="25px" Text="棄土區費用(含水土保持)"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label129" runat="server" Font-Names="微軟正黑體" Text="M3"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label148" runat="server" Font-Names="微軟正黑體" Text="201.60"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox88" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">50</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label113" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000002421501"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label94" runat="server" Font-Names="微軟正黑體" Height="25px" Text="裝料機，膠輪式，1.50~1.59m3"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label132" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label151" runat="server" Font-Names="微軟正黑體" Text="2.02"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox91" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">832</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label115" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000003421801"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label96" runat="server" Font-Names="微軟正黑體" Height="25px" Text="傾卸貨車，總重21t~21.9t，8L.M3"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label134" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label153" runat="server" Font-Names="微軟正黑體" Text="10.08"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox93" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">481.95</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label116" runat="server" Font-Names="微軟正黑體" Height="25px" Text="E000004417901"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label97" runat="server" Font-Names="微軟正黑體" Height="25px" Text="開挖機，履帶式，0.70~0.79m3，90~99KW"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label135" runat="server" Font-Names="微軟正黑體" Text="時"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label154" runat="server" Font-Names="微軟正黑體" Text="290.85"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox94" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">661.5</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label164" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000005100602"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label165" runat="server" Font-Names="微軟正黑體" Height="25px" Text="操作手"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label166" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label167" runat="server" Font-Names="微軟正黑體" Text="6.00"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox95" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">2300</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label176" runat="server" Font-Names="微軟正黑體" Height="25px" Text="L000006000002"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label177" runat="server" Font-Names="微軟正黑體" Height="25px" Text="其他普通工及勞力工"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label178" runat="server" Font-Names="微軟正黑體" Text="工"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label179" runat="server" Font-Names="微軟正黑體" Text="1,049.50"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox98" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">1590</asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label124" runat="server" Font-Names="微軟正黑體" Height="25px">W0127120004</asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label106" runat="server" Font-Names="微軟正黑體" Height="25px">工具損耗</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="Label143" runat="server" Font-Names="微軟正黑體" Text="式"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:Label ID="Label162" runat="server" Font-Names="微軟正黑體">9,124.2</asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    -</td>
                            </tr>
                            </table>
    
    </div>
    </form>
</body>
</html>
