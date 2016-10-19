<%@ Page Language="C#" AutoEventWireup="true" CodeFile="合預1.aspx.cs" Inherits="合預1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        }
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                }



            .auto-style17 {
	color: #FF0000;
}


        </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <br />
    
        <table class="auto-style67">
            <tr>
                <td class="auto-style1">代入合約預算</td>
            </tr>
            <tr>
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">XML匯入</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Pnl_XML" runat="server" Visible="False">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">請選擇檔案</td>
                                <td class="auto-style3">
                                    <asp:FileUpload ID="FileUpload4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="479px" />
                                </td>
                                <td class="auto-style3">說明：<br /> 1.XML匯入功能僅限以<span class="auto-style17">PCCES匯出之預算書XML檔</span>匯入。<br>2.目前操作之專案將會先行清空既有合約預算項目及專案工料資料庫中之資源項目，再將XML檔之內容匯入，請使用者再次確認匯入之專案是否選擇正確。<br>3.合約預算匯入後如欲確認編修相關內容請至<asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" ForeColor="Red">合約預算編修</asp:HyperLink>
                                    進行編修。<br>4.合約預算匯入後XML檔內之資源項目將自動存入專案工料資料庫，如欲編修請至<asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="True" ForeColor="Red">專案工料資料庫</asp:HyperLink>
                                    進行編修。</br>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="3">
                                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定匯入" Width="107px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2L">
                    &nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">代入投標預算</asp:LinkButton>
                </td>
            </tr>
            </table>
                    <asp:Panel ID="Pnl_Bid" runat="server" Visible="False">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">請選擇標案</td>
                                <td class="auto-style3">
                                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體" Font-Size="Medium" Height="50px" Width="300px">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style3">說明：<br /> 1.目前操作之專案將會先行清空既有合約預算項目及專案工料資料庫中之資源項目，再將所選標案之投標預算內容匯入，請使用者再次確認匯入之專案是否選擇正確。<br>2.合約預算匯入後如欲確認編修相關內容請至<asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="True" ForeColor="Red">合約預算編修</asp:HyperLink>
                                    進行編修。<br>3.所選標案之資源項目亦會自動存入專案工料資料庫，如欲編修請至<asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="True" ForeColor="Red">專案工料資料庫</asp:HyperLink>
                                    進行編修。<br></br>
                                    </br>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="3">
                                    <asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定代入" Width="107px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
