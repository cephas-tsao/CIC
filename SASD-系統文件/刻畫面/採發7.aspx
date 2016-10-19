<%@ Page Language="C#" AutoEventWireup="true" CodeFile="採發7.aspx.cs" Inherits="採發7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <style type="text/css">











        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }     
                        
        
            .auto-style63 {
            width: 100%;
            vertical-align:central;
        }
        
        
            .auto-style66 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style64 {
            width: 35%;
            vertical-align:central;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
        }
                

                
            .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
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
        }
            .auto-style14 {
	font-size: medium;
}
.auto-style8 {
	font-size: small;
}
.auto-style15 {
	color: #008000;
}
            
        
            .auto-style2A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #5D7B9D;
            text-align: center;
            color: #FFFFFF;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1">分包合約管理</td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                                <table class="auto-style63">
                                                    <tr>
                                                        <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                                        <td class="auto-style64">分包合約名稱(關鍵字)</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                <asp:ListItem Value="OR">或</asp:ListItem>
                                                                <asp:ListItem Value="NOT">非</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="auto-style64">得標廠商</td>
                                                        <td class="auto-style65" rowspan="2">
                                                            <asp:Button ID="Button39" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                            <br />
                                                            <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style64">
                                                            <asp:TextBox ID="TextBox74" runat="server" Font-Size="Medium" Height="20px" Width="160px"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style64">
                                                            <asp:DropDownList ID="DropDownList34" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="160px">
                                                                <asp:ListItem>-請選擇-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [Name], [UID] FROM [FirmM]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
            </td>
		</tr>
		<tr>
		<td class="auto-style3C">
                                    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Button42" runat="server" CssClass="BtnFree" OnClick="Button42_Click" Text="編修分包合約" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="分包合約編號" HeaderText="分包合約編號" SortExpression="分包合約編號" />
                                            <asp:BoundField DataField="分包合約名稱" HeaderText="分包合約名稱" SortExpression="分包合約名稱" />
                                            <asp:BoundField DataField="得標廠商名稱" HeaderText="得標廠商名稱" SortExpression="得標廠商名稱" />
                                            <asp:BoundField DataField="預定進場時間" DataFormatString="{0:yyyy/MM/dd}" HeaderText="預定進場時間" SortExpression="預定進場時間" />
                                            <asp:BoundField DataField="分包合約總價" HeaderText="分包合約總價" SortExpression="分包合約總價" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SubContract_Main.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總價, SubContract_Main.BookInTime AS 預定進場時間, FirmM.Name AS 得標廠商名稱 FROM SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE (SubContract_Main.PID = @PID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		<td class="Table2R">
                                    註：顯示已新增之分包合約</td>
		</tr>
		</table>
        <asp:Panel ID="Pnl_Contract" runat="server" Visible="False">
            <table style="width: 100%">
                <tr>
                    <td class="Table0">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="White">分包合約主資料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_main" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2">得標廠商</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label698" runat="server" Text="老王建設"></asp:Label>
                        </td>
                        <td class="auto-style2">預定進場日期</td>
                        <td class="auto-style3">
                            <asp:Label ID="Label696" runat="server" Text="2016.1.1"></asp:Label>
                        </td>
                        <td class="auto-style2" colspan="2">合約總金額</td>
                        <td class="auto-style3">
                            50,000</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">分包合約編號</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox85" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px">SC005</asp:TextBox>
                        </td>
                        <td class="auto-style2">分包合約名稱</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox86" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px">分包合約5</asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">合約種類</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged1" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem Selected="True">工程合約</asp:ListItem>
                                <asp:ListItem>買賣合約</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">預定進場日期</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox91" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="150px">2016.6.30</asp:TextBox>
                            </td>
                        <td class="auto-style2">履約保證</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem Selected="True">銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style2" colspan="2">出廠證明提送</td>
                        <td class="auto-style3"><asp:TextBox ID="TextBox88" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">100</asp:TextBox>
                            %提送</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">請款次數</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox7" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1</asp:TextBox>
                            <span class="auto-style14">次/月</span><span class="auto-style8"> </span>
                        </td>
                        <td class="auto-style2">請款日</td>
                        <td class="auto-style3">
                            每月<asp:TextBox ID="TextBox89" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">15</asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                        <td class="auto-style2" colspan="2">
                            付款日</td>
                        <td class="auto-style3">每月<asp:TextBox ID="TextBox90" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">20</asp:TextBox>
                            日<span class="auto-style8"><span class="auto-style15"><br /> (ex.若不只一次則以半形逗號,區隔)</span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style4">工期逾罰規定</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DDL_Warranty" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請先選擇合約種類-</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4">逾罰</td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="134" />
                            <span">千分之</span><br />&nbsp;<span><asp:TextBox ID="TextBox96" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px"></asp:TextBox>
                            /每天</span></span">
                        </td>
                        <td class="auto-style3" colspan="2">
                            <input name="Radio1" type="radio" value="135" checked="true" />
                            <span>一天<br /> 
                            <asp:TextBox ID="TextBox97" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">1000</asp:TextBox>
                            元</span></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固年限</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox98" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">2</asp:TextBox>
                            年</td>
                        <td class="auto-style2">承攬範圍</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox99" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="300px"></asp:TextBox>
                        </td>
                        <td class="auto-style2" colspan="2">稅額百分比</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox100" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="50px">5</asp:TextBox>
                            %</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">備註</td>
                        <td class="auto-style3" colspan="6">
                            <asp:TextBox ID="TextBox101" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="100px" TextMode="MultiLine" Width="500px">老王綁來的標</asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="Table0">&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ForeColor="White">付款資料</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_pay" runat="server" Visible="False">
                <table style="width: 100%">
                    <tr>
                        <td class="auto-style2A" colspan="5">預付款資料</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">預付款百分比</td>
                        <td class="auto-style2">預付款現金百分比</td>
                        <td class="auto-style2">預付款期票百分比</td>
                        <td class="auto-style2">預付款期票天數</td>
                        <td class="auto-style2">預付款還款保證</td>
                    </tr>
                    <tr>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox102" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">15</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox103" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">100</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox104" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False">0</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox105" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px"></asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DropDownList36" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>銀行產物公司保證</asp:ListItem>
                                <asp:ListItem Selected="True">銀行支票保證</asp:ListItem>
                                <asp:ListItem>商業本票保證</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2A" colspan="5">工程款資料</td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td class="auto-style2">工程款現金百分比</td>
                        <td class="auto-style2">工程款期票百分比</td>
                        <td class="auto-style2">工程款期票天數</td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3C">
                            </td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox108" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">80</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox109" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False">20</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox110" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">10</asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style2A" colspan="5">保留款資料</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保留款百分比</td>
                        <td class="auto-style2">保留款現金百分比</td>
                        <td class="auto-style2">保留款期票百分比</td>
                        <td class="auto-style2">保留款期票天數</td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox111" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">10</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox112" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">50</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox113" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False">50</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox114" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">10</asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style2A" colspan="5">保固金資料</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">保固金百分比</td>
                        <td class="auto-style2">保固金現金百分比</td>
                        <td class="auto-style2">保固金期票百分比</td>
                        <td class="auto-style2">保固金期票天數</td>
                        <td class="auto-style2">保固金保留方式</td>
                    </tr>
                    <tr>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox115" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">10</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox116" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">70</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox117" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px" Enabled="False">30</asp:TextBox>
                            %</td>
                        <td class="auto-style3C">
                            <asp:TextBox ID="TextBox118" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="20px" Width="80px">10</asp:TextBox>
                            天</td>
                        <td class="auto-style3C">
                            <asp:DropDownList ID="DropDownList37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="200px">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem Selected="True">現金</asp:ListItem>
                                <asp:ListItem>銀行產物公司</asp:ListItem>
                                <asp:ListItem>商業本票</asp:ListItem>
                                <asp:ListItem>銀行支票</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="Table0">&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ForeColor="White">合約及相關文件上傳</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_file" runat="server" Visible="False">
                <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                    <tr>
                        <td class="auto-style2">檔案名稱</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TextBox120" runat="server" Height="25px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">檔案類型</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                                <asp:ListItem>-請選擇-</asp:ListItem>
                                <asp:ListItem>合約</asp:ListItem>
                                <asp:ListItem>規範</asp:ListItem>
                                <asp:ListItem>圖說</asp:ListItem>
                                <asp:ListItem>施工補充說明</asp:ListItem>
                                <asp:ListItem>廠商提送-樣品</asp:ListItem>
                                <asp:ListItem>廠商提送-型錄規範</asp:ListItem>
                                <asp:ListItem>廠商提送-大樣圖說</asp:ListItem>
                                <asp:ListItem>廠商提送-單價分析表</asp:ListItem>
                                <asp:ListItem>廠商提送-業績表</asp:ListItem>
                                <asp:ListItem>廠商提送-材料證明</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox84" runat="server" Height="25px" Visible="False" Width="100px"></asp:TextBox>
                        </td>
                        <td class="auto-style2">選擇檔案</td>
                        <td class="auto-style3">
                            <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" />
                        </td>
                        <td class="auto-style2">
                            <asp:Button ID="Button32" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="上傳" Width="71px" />
                        </td>
                        <tr>
                            <td class="auto-style3C" colspan="7">
                                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" SelectText="下載" ShowSelectButton="True">
                                        <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" Visible="False" />
                                        <asp:BoundField DataField="SCID" HeaderText="SCID" SortExpression="SCID" Visible="False" />
                                        <asp:BoundField DataField="Name" HeaderText="檔案名稱" SortExpression="Name" />
                                        <asp:BoundField DataField="Type" HeaderText="檔案類型" SortExpression="Type" />
                                        <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path" Visible="False" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [SubContract_File] WHERE ([SCID] = @SCID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="5" Name="SCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table style="width: 100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button30" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="儲存修改" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button41" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="回復原值" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button43" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Text="刪除分包合約" />
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
        <br />
    
    </div>
    </form>

</body>
</html>
