<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CResourceList.aspx.cs" MasterPageFile="Site1.Master" Inherits="IMS.CResourceList" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/CBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>合約預算模組-合約預算建置編修</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
       <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />  

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style67 {
            width: 100%;
        }
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: right;
	        color: #000000;
        }            


        .Table1 {
            width: 100%;

            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
                


        .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
                        


        .autoLeft{
           text-align:left;
        }
            .autoRight{
           text-align:right;
        }
        
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

            .autoCenter{
           text-align:center;
        }
                


            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
            .auto-style68 {
            text-align: left;
            height: 33px;
        }
        .auto-style69 {
            text-align: center;
            height: 33px;
        }
        .auto-style70 {
            text-align: right;
            height: 33px;
        }
            </style>

<body>
   
        
    <div style="padding-left:200px">
       <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
        <table class="auto-style67">
            <tr>
                <td class="auto-style1" colspan="2">合約預算資源統計表</td>
            </tr>
            <tr>
                 <td class="Table1L" style="width: 50%">&nbsp;<asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="前往工項編輯" Width="27px" PostBackUrl="~/CBudgetEdit.aspx" />
                                &nbsp;</td>
                <td class="auto-style2R">&nbsp;<%--<asp:Button ID="Button18" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回合約預算建置編修"  OnClientClick="window.open('CBudgetEdit.aspx', 'window');window.close();" />--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                                <%--<asp:Button ID="SaveAction" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="SaveAction_Click" />--%>
                       <asp:ImageButton ID="SaveAction" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="SaveAction_Click" />
                            &nbsp;&nbsp;
                                <%--<asp:Button ID="Recovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />--%>
                      <asp:ImageButton ID="Recovery" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="Recovery_Click"/>
                            &nbsp;&nbsp;</td>
            </tr>
            </table>
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45">資源編碼</td>
                                <td class="auto-style45">工料名稱</td>
                                <td class="auto-style45">單位</td>
                                <td class="auto-style45">合約工程用量</td>
                                <td class="auto-style45">單價</td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                                <ItemTemplate>
                                     <tr class="TableSingle">
                                <td class="autoLeft">
                                    <asp:Label ID="Priceid" runat="server" Font-Names="微軟正黑體" Height="25px"  Visible="false"></asp:Label>
                                    <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px"></asp:Label>
                                </td>
                                <td class="autoLeft">
                                    <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="LbAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td class="autoCenter">
                                    <asp:TextBox ID="TxPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    
                            </table>
    
    </div>

</body>
</html>
</asp:Content>
