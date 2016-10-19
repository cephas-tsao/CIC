<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FFundItemEdit.aspx.cs" Inherits="IMS.FFundItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>分包商計價估驗明細修改</title>
    <link rel="stylesheet" type="text/css" href="CSS/DailyReport.css" />
    <link rel="stylesheet" type="text/css" href="CSS/StyleSht.css" />
    <script type="text/javascript">
        function run(a, b, c, d, e, f, g) {
            var form1 = document.getElementById(a);
            var f1 = parseFloat(form1.value);
            var form2 = document.getElementById(b);
            var f2 = parseFloat(form2.value);
            var form3 = document.getElementById(c);
            var f3 = parseFloat(form3.value);
            var form4 = document.getElementById(d);
            var f4 = parseFloat(form4.value);
            document.getElementById(e).value = f1 * f4;
            document.getElementById(f).value = f2 + f4;
            document.getElementById(g).value = f3 + f1 * f4;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="Table100">
            <tr>
                <td class="TableTop">分包商計價估驗明細修改</td>
            </tr >
        </table >
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <table style="text-align: center" width="100%" >
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="Button2_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
