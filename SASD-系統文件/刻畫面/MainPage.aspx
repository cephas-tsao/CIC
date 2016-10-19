<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./StyleMain.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height:400px;
        }
        .auto-style2 {
            width: 50%;
            height:50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/img/MyProjects.jpg" />
                                    我的專案</td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <asp:Image ID="ImageButton5" runat="server" Height="25px" ImageUrl="~/img/ProIcon.jpg" />
                                    <asp:LinkButton ID="LinkButton1" runat="server">台13線后豐大橋P11~A2局部改建工程</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel2" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton4" runat="server" Height="25px" ImageUrl="~/img/User.jpg" />
                                    使用者登入資訊</td>
                            </tr>
                            <tr>
                                <td class="Table2">姓名：<br /> 
                                    <br />
                                    帳號：<br /> 
                                    <br />
                                    公司名稱：<br /> 
                                    <br />
                                    聯絡電話：<br /> 
                                    <br />
                                    E-mail：<br /> 
                                    <br />
                                    是否為系統管理員：</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Panel ID="Panel5" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="Table2">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel6" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="Table2">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
