<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyPicConItemLink.aspx.cs" Inherits="IMS.DailyPicConItemLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>施工照片連接合約項目選擇</title>
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
    <link rel="stylesheet" type="text/css" href="CSS/StyleSht.css" />
    <script type="text/javascript">
        function SetCookie(name, value)
        {
            var Min = 1;
            var exp = new Date();
            exp.setTime(exp.getTime() + Min * 60 * 1000);
            document.cookie = "aa" + "=" + escape(name) + ";expires=" + exp.toGMTString();
            document.cookie = "bb" + "=" + escape(value) + ";expires=" + exp.toGMTString();
            window.opener.document.getElementById('ContentPlaceHolder1_Self').click(); self.close()
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table class="Table100">
            <tr>
                <td class="TableTop">施工照片連接合約項目選擇</td>
            </tr >
        </table >
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </form>
</body>
</html>
