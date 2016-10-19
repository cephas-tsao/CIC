<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投管1.aspx.cs" Inherits="投管1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>標案綜合檢視</title>
        <style type="text/css">
            .auto-style0 {
	            width:100%;
            }
            .auto-style1 {
	            font-family: 微軟正黑體;
	            font-size: large;
	            background-color: #800000;
	            text-align: center;
	            color: #FFFFFF;
            }
            .auto-style3 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFF99;
	            text-align: center;
	            color: #000000;
                height:30px;
                width:200px;
            }
            .auto-style4 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: left;
	            color: #000000;
            }
            .auto-style14 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: center;
	            color: #000000;
            }
            .auto-style5 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 42px;
            }
            .auto-style7 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                width: 306px;
                height: 21px;
            }
            .auto-style8 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                height: 21px;
            }


.center {
	text-align: center;
}
    

            .auto-style13 {
                font-family: 微軟正黑體;
                font-size: medium;
                border-style: none;
                border-width: medium;
                background-color: white;
                text-align: left;
                height: 29px;
            }


            
            .auto-style14 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 24px;
            }
            

            
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p>
            <asp:Button ID="Btn_HideSelect" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="隱藏搜尋面板" OnClick="Btn_HideSelect_Click" />
            &nbsp;<asp:Button ID="Btn_All" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="標案總覽" OnClick="Btn_All_Click" />
            </p>
        <asp:Panel ID="Pnl_Select" runat="server" Font-Names="微軟正黑體" HorizontalAlign="Center" Width="100%">
            <table class="auto-style0" border="1">
                <tr>
                    <td class="auto-style1" colspan="5">
                        條件搜尋</td>
                </tr>
                <tr>
                    <td class="auto-style3" >
                        標案名稱</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TB_Select1" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="180px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DDL_Op4" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TB_Select2" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="180px"></asp:TextBox>
                        (關鍵字)</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        標案狀態</td>
                    <td class="auto-style4" colspan="3">
                        <asp:DropDownList ID="DDL_Select1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                            <asp:ListItem Value=""> -請選擇 -</asp:ListItem>
                            <asp:ListItem>已成案未領標</asp:ListItem>
                            <asp:ListItem>已領標</asp:ListItem>
                            <asp:ListItem>不領標</asp:ListItem>
                            <asp:ListItem>已領標評估中</asp:ListItem>
                            <asp:ListItem>不進行備標</asp:ListItem>
                            <asp:ListItem>備標中</asp:ListItem>
                            <asp:ListItem>標前會議決議不投標</asp:ListItem>
                            <asp:ListItem>備標完成</asp:ListItem>
                            <asp:ListItem>得標</asp:ListItem>
                            <asp:ListItem>未得標</asp:ListItem>
                            <asp:ListItem>流標</asp:ListItem>
                            <asp:ListItem>廢標</asp:ListItem>
                            <asp:ListItem>重新招標</asp:ListItem>
                            <asp:ListItem>已轉專案</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        工程所在縣市</td>
                    <td class="auto-style4" colspan="3">
                        <asp:DropDownList ID="DDL_Select2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Country" DataValueField="CountryID">
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDL_Select3" runat="server" DataSourceID="SqlDataSource2" DataTextField="City" DataValueField="City" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [CityList] WHERE ([CountryID] = @CountryID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Select2" Name="CountryID" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [CountryCode]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        預算金額</td>
                    <td class="auto-style4" colspan="4">
                        <asp:TextBox ID="TB_Select3" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="180px"></asp:TextBox>
                        <asp:DropDownList ID="DDL_Op5" runat="server" AutoPostBack="True" CssClass="DDLshort" Font-Size="Medium" OnSelectedIndexChanged="DDL_Op5_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="&lt;">以下</asp:ListItem>
                            <asp:ListItem Value="&gt;">以上</asp:ListItem>
                            <asp:ListItem Value="Between">之間</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="TB_Select4" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Visible="False" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="5">
                        <asp:Button ID="Btn_SelectGO" runat="server" Text="查詢" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Btn_SelectGO_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_SelectEmpty" runat="server" CssClass="mediumbutton" Text="條件清空" Font-Names="微軟正黑體" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
        <asp:Label ID="LB_Title" runat="server" BackColor="#FFFF99" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Font-Underline="True" ForeColor="#0000CC" Text="標案總覽"></asp:Label>
        <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlAll" EmptyDataText="無資料" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ButtonField ButtonType="Button" Text="詳細資料">
                <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                </asp:ButtonField>
                <asp:BoundField DataField="BID" HeaderText="BID" InsertVisible="False" ReadOnly="True" SortExpression="BID" Visible="False" />
                <asp:BoundField DataField="標案名稱" HeaderText="標案名稱" SortExpression="標案名稱" />
                <asp:BoundField DataField="標案狀態" HeaderText="標案狀態" SortExpression="標案狀態" />
                <asp:BoundField DataField="工程所在地" HeaderText="工程所在地" SortExpression="工程所在地" />
                <asp:BoundField DataField="業主名稱" HeaderText="業主名稱" SortExpression="業主名稱" />
                <asp:BoundField DataField="開標時間" HeaderText="開標時間" SortExpression="開標時間" />
                <asp:BoundField DataField="預算金額" HeaderText="預算金額" SortExpression="預算金額" DataFormatString="{0:#,###.##}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="工程區分" HeaderText="工程區分" SortExpression="工程區分" />
                <asp:BoundField DataField="工程分類" HeaderText="工程分類" SortExpression="工程分類" />
                <asp:BoundField DataField="核定標價" HeaderText="核定標價" SortExpression="核定標價" DataFormatString="{0:#,###.##}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="標案評估" SortExpression="標案評估">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("標案評估") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="評估內容" Visible='<%# (DataBinder.Eval(Container.DataItem,"標案評估")=="YES")? true:false %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="決標紀錄" SortExpression="決標紀錄">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("決標紀錄") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="決標紀錄" Visible='<%# (DataBinder.Eval(Container.DataItem,"決標紀錄")=="0")? false:true %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle BackColor="#CC3300" ForeColor="Yellow" HorizontalAlign="Center" Font-Names="微軟正黑體" Font-Size="X-Large" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlAll" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT BidM0.BID, BidM0.BidName AS 標案名稱, BidM0.Status AS 標案狀態, BidM2.EngLocation AS 工程所在地, BidM2.OwnerName AS 業主名稱, BidM2.OpenBidTime AS 開標時間, BidM2.BudgetAmount AS 預算金額, BidM4.EngType AS 工程區分, BidM4.EngClass AS 工程分類, BidM5.ApprovedPrice AS 核定標價, BidAssess.Result AS 標案評估, BidRecord.Result AS 決標紀錄 FROM BidM0 FULL OUTER JOIN BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN BidM2 ON BidM0.BID = BidM2.BID FULL OUTER JOIN BidM4 ON BidM0.BID = BidM4.BID FULL OUTER JOIN BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN BidRecord ON BidM0.BID = BidRecord.BID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT BidM0.BID, BidM0.BidName AS 標案名稱, BidM0.Status AS 標案狀態, BidM2.EngLocation AS 工程所在地, BidM2.OwnerName AS 業主名稱, BidM2.OpenBidTime AS 開標時間, BidM2.BudgetAmount AS 預算金額, BidM4.EngType AS 工程區分, BidM4.EngClass AS 工程分類, BidM5.ApprovedPrice AS 核定標價, BidAssess.Result AS 標案評估, BidRecord.Result AS 決標紀錄 FROM BidM0 FULL OUTER JOIN BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN BidM2 ON BidM0.BID = BidM2.BID FULL OUTER JOIN BidM4 ON BidM0.BID = BidM4.BID FULL OUTER JOIN BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN BidRecord ON BidM0.BID = BidRecord.BID"></asp:SqlDataSource>
        <br />
        <asp:Panel ID="Pnl_Info" runat="server" Width="100%" Font-Names="微軟正黑體">
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="auto-style3">標案名稱</td>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="標案名稱"></asp:Label>
                    </td>
                    <td class="auto-style3">標案狀態</td>
                    <td class="auto-style4">
                        <asp:Label ID="Label3" runat="server" Text="標案狀態"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton14" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton15" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1" colspan="2">未成案訊息</td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 306px">預估金額</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label5" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 306px">預估招標日期</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label6" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="width: 306px">備註</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label7" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton24" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton25" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="auto-style1" colspan="8" style="height: 27px">公告招標資訊</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">工程所在國家</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label10" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">工程所在縣市</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label11" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="height: 45px">電子領標</td>
                                <td class="auto-style4" style="height: 45px">
                                    <asp:Label ID="Label12" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 45px">電子投標</td>
                                <td class="auto-style4" style="height: 45px">
                                    <asp:Label ID="Label13" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 45px">截標時間</td>
                                <td class="auto-style4" colspan="3" style="height: 45px">
                                    <asp:Label ID="Label14" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">業主名稱</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label15" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">業主聯絡人</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label16" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">業主地址</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label17" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">業主聯絡電話</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label18" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="height: 24px">領標地址</td>
                                <td class="auto-style4" colspan="3" style="height: 24px">
                                    <asp:Label ID="Label19" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 24px">押圖費</td>
                                <td class="auto-style4" colspan="3" style="height: 24px">
                                    <asp:Label ID="Label20" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    元</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">圖說費</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label21" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    元</td>
                                <td class="auto-style3">退圖期限</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label22" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">履約保證金</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label31" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    </td>
                                <td class="auto-style3">押標金</td>
                                <td class="auto-style4" colspan="3">
                                    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label24" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">廠商投標規定</td>
                                <td class="auto-style4" colspan="7">
                                    <asp:Label ID="Label25" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">開標地點</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label26" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">開標時間</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label27" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="height: 24px">決標方式</td>
                                <td class="auto-style4" colspan="3" style="height: 24px">
                                    <asp:Label ID="Label28" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 24px">共同投標</td>
                                <td class="auto-style4" style="height: 24px">
                                    <asp:Label ID="Label29" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 24px">已領標</td>
                                <td class="auto-style4" style="height: 24px">
                                    <asp:Label ID="Label30" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton34" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton35" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style1" colspan="4" style="height: 29px"><strong>合約概要</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style13" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">承攬方式</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label32" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">業主名稱</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label33" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">建築師/設計單位名稱</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label34" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">監造單位名稱</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label35" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">PCM名稱</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label36" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">工期計算方式</td>
                                <td class="auto-style4" style="width: 300px">
                                    <asp:Label ID="Label37" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">工期</td>
                                <td class="auto-style4" style="width: 300px">
                                    <asp:Label ID="Label38" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.合約明細資料</td>
                            </tr>
                            <tr>
                                <td class="auto-style14" colspan="4">
                                    <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button6" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:LinkButton ID="LinkButton41" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton42" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton43" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton44" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton45" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style1" colspan="4">工程概要</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">工程區分</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label39" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">工程分類</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label40" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">地下樓層數</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label41" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    樓</td>
                                <td class="auto-style3">地上樓層數</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label42" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    樓</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">地下樓層面積</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label43" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    平方公尺(M<sup>2</sup>)</td>
                                <td class="auto-style3">地上樓層面積</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label44" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    平方公尺(M<sup>2</sup>)</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">建物高度</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label45" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    公尺(M)</td>
                                <td class="auto-style3">開挖深度</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label46" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                    公尺(M)</td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="height: 26px">基礎型式</td>
                                <td class="auto-style4" style="height: 26px">
                                    <asp:Label ID="Label47" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3" style="height: 26px">擋土措施</td>
                                <td class="auto-style4" style="height: 26px">
                                    <asp:Label ID="Label48" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">施工概要備註</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label49" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">其他工程概要</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label50" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:LinkButton ID="LinkButton51" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton52" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton53" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton54" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton55" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel5" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style1" colspan="4">投標內業資訊</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">作業負責人</td>
                                <td class="auto-style4" colspan="3">
                                    <asp:Label ID="Label51" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">完成領標日期</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label52" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">預定估算完成日期</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label53" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">標前會議時間</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label54" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">寄送標單日期</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label55" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">退圖日期</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label56" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">估算成本</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label57" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">建議標價</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label58" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">建議利潤</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label59" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">核定標價</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label60" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                                <td class="auto-style3">核定利潤</td>
                                <td class="auto-style4">
                                    <asp:Label ID="Label61" runat="server" Text="XXXXXXXXXX"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8" colspan="4">共同投標廠商明細</td>
                            </tr>
                            <tr>
                                <td class="auto-style4" colspan="4">
                                    <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JBID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="5">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="JBID" HeaderText="JBID" InsertVisible="False" ReadOnly="True" SortExpression="JBID" Visible="False" />
                                            <asp:BoundField DataField="共同投標廠商名稱" HeaderText="共同投標廠商名稱" SortExpression="共同投標廠商名稱">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="共同投標項目" HeaderText="共同投標項目" SortExpression="共同投標項目">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="共同投標金額" HeaderText="共同投標金額" SortExpression="共同投標金額" DataFormatString="{0:#,###.##}">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=WANG-PC\SQLEXPRESS;Initial Catalog=CICIMS;User ID=CICIMS;Password=ntustCIC419" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
        </asp:Panel>
        <br />
    </form>
</body>
</html>
