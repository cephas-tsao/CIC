<%@ Page Language="C#" AutoEventWireup="true" CodeFile="投管0.aspx.cs" Inherits="投管0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style0 {
            width:100%;
        }
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #FF5809;
            text-align: center;
            color: #FFFFFF;
            font-weight:bolder;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #0080FF;
            text-align: left;
            color: #FFFFFF;
            font-weight:bold;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #97CBFF;
            text-align: left;
            text-indent:30pt;
            color: #000000;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style0">
            <tr>
                <td class="auto-style1">投標管理模組</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    0.<asp:HyperLink ID="HyperLink1" runat="server">標案總覽</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">1.<asp:HyperLink ID="HyperLink2" runat="server">未成案資訊</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">+新增未成案資訊</td>
            </tr>
            <tr>
                <td class="auto-style3">+編修未成案資訊</td>
            </tr>
            <tr>
                <td class="auto-style3">+已成案轉標案</td>
            </tr>
            <tr>
                <td class="auto-style2">2.<asp:HyperLink ID="HyperLink3" runat="server">新增標案</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">3.編修標案資訊</td>
            </tr>
            <tr>
                <td class="auto-style3">3.1<asp:HyperLink ID="HyperLink4" runat="server">公告招標資訊</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">3.2<asp:HyperLink ID="HyperLink5" runat="server">合約概要</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">3.3<asp:HyperLink ID="HyperLink6" runat="server">工程概要</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">4.<asp:HyperLink ID="HyperLink7" runat="server">投標評估</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">5.<asp:HyperLink ID="HyperLink8" runat="server">投標內業資訊</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">6.<asp:HyperLink ID="HyperLink9" runat="server">決標紀錄</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">A.<asp:HyperLink ID="HyperLink10" runat="server">常用資料維護</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
