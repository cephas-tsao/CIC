<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XX投預1.aspx.cs" Inherits="XX投預1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>標單匯入</title>
    <style type="text/css">
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
.auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
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
    width:50%;
    vertical-align:top;
}
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
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
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 33px;
            }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
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
            border-left:ridge;
            border-right:ridge;
        }
        .Table3 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }



        .autoLeft{
           text-align:left;
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
	<table style="width: 100%">
		<tr>
			<td colspan="3" class="auto-style1">業主標單匯入</td>
		</tr>
		<tr>
		<td class="auto-style15">請選擇標案</td>
		<td class="auto-style16">
		<asp:DropDownList id="DropDownList3" AppendDataBoundItems="true" runat="server" Height="50px" Width="300px" Font-Size="Medium" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體">
            <asp:ListItem>-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
		    </td>
		<td class="auto-style16" rowspan="2">
		    說明：<br /> 1.業主標單匯入功能僅限以<span class="auto-style17">PCCES匯出之空白標單XML檔</span>匯入<br>
			2.所選標案若已有專屬工料資料庫或WBS將會清空，再將XML檔之內容匯入<br>&nbsp;&nbsp; 請使用者謹慎選擇匯入之標案<br>
			3.倘若尚未建立標案請先至<asp:HyperLink id="HyperLink1" runat="server" Font-Underline="True" ForeColor="Red">投標管理模組</asp:HyperLink>
			建立標案及相關資料<br>4.標案匯入後如欲確認編修相關內容請至<asp:HyperLink id="HyperLink2" runat="server" Font-Underline="True" ForeColor="Red">業主標單項目編修</asp:HyperLink>
			進行編修<br>5.標案匯入後XML檔內之資源項目將自動存入標案專屬工料資料庫<br>&nbsp;&nbsp; 如欲編修請至<asp:HyperLink id="HyperLink3" runat="server" Font-Underline="True" ForeColor="Red">標單工料資料庫</asp:HyperLink>
			進行編修<br />
            </td>
		</tr>
		<tr>
		<td class="auto-style15">請選擇檔案</td>
		<td class="auto-style16">
						<asp:FileUpload id="FileUpload4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="479px" />
						</td>
		</tr>
		<tr>
		<td class="auto-style15" colspan="3">
                            <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="標單匯入" Width="107px" />
                        </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>
