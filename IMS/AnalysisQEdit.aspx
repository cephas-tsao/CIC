<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnalysisQEdit.aspx.cs" Inherits="IMS.AnalysisQEdit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
        .auto-style34A {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: center;
	color: #000000;
}
        .auto-style34 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}
        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table2 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table3 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style34A {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 35px;
        }
        .auto-style34R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: right;
            color: #000000;
            height: 35px;
        }
        .auto-style34 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 35px;
        }
        .auto-style72 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: center;
            color: #000000;
            height: 33px;
        }
        .auto-style73 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 33px;
        }
        .auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
	text-align: center;
	color: #FFFFFF;
    }
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
}
.auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    vertical-align:top;
}


        .auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFD2D2;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
            .auto-style74 {
            font-family: 微軟正黑體;
            font-size: medium;
            text-align: center;
            color: #000000;
            height: 35px;
            background-color: #E8FFC4;
        }
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
        }
            .auto-style33L {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: left;
	color: #000000;
}
        

        .auto-style63 {
            width: 100%;
            vertical-align:central;
            border:dashed;
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
            </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        

                            <table class="Table1">



                                <tr>
                                    <td class="auto-style34" colspan="4">
                                        &nbsp;
                                <asp:Button ID="Button18" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" OnClick="Button18_Click" />
                                    </td>
                                    <td class="auto-style34R" colspan="4">
                                <asp:Button ID="Save" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="Save_Click" />
                            &nbsp;&nbsp;
                                <asp:Button ID="Recovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
                                        &nbsp;&nbsp;</td>
                                </tr>
                             <tr>
                                    <td class="auto-style33">工項名稱</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td class="auto-style33">資源代碼</td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                    <td class="auto-style33">分析數量</td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbAnaNumber" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ></asp:Label>
                                    </td>
                                </tr>
                                </table>
   
                            <table class="Table2">
                                <tr>
                                    <td class="auto-style33">序號</td>
                                    <td class="auto-style33">工料項目種類</td>
                                    <td class="auto-style33">工料項目名稱</td>
                                    <td class="auto-style33">單位</td>
                                    <td class="auto-style33">單價<br />
                                        分析</td>
                                    <td class="auto-style33">資源編碼</td>
                                    <td class="auto-style33">原標單數量</td>
                                    <td class="auto-style33">校核後數量</td>
                                    <td class="auto-style33">備註</td>
                                </tr>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
                                    <ItemTemplate>
                                <tr>
                                   
                                                            
                                    <td class="auto-style34A">
                                           <asp:Label ID="id" runat="server" Visible="false" ></asp:Label>
                                    <asp:Label ID="PriceID" runat="server"  Visible="false"></asp:Label>        
                                        <asp:Label ID="UID" runat="server" Font-Size="Medium" Height="25px" Width="25
                                            px"></asp:Label>
                                        
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbKind" runat="server" Font-Size="Medium" Height="25px" Width="50px"></asp:Label>
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="LbItemName" runat="server" Font-Size="Medium" Height="25px" Width="500px"></asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbUnit1" runat="server" Font-Size="Medium" Height="25px" Width="50px"></asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                            <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton8_Click" CommandArgument='<%# Container.ItemIndex %>' />
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbCode1" runat="server" Font-Size="Medium" Height="25px" Width="150px"></asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbNumber" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                    <td class="auto-style34A">
                                 
                                     <asp:TextBox ID="TxCNumber" runat="server" ></asp:TextBox>
                                    </td>
                                    <td class="auto-style34A">
                                        <asp:Label ID="LbNote" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:Label>
                                    </td>
                                    </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                          
                                    </table>

    
    </div>

    
                        <br />

    </form>
</body>
</html>