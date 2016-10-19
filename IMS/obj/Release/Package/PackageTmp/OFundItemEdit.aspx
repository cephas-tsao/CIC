<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OFundItemEdit.aspx.cs" Inherits="IMS.OFundItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>業主請款單-估驗明細修改</title>
    <link rel="stylesheet" type="text/css" href="CSS/Style1.css" />
    <link rel="stylesheet" type="text/css" href="CSS/StyleSht.css" />
    <script type="text/javascript">
        function run1(a, b, c) {
            var form1 = document.getElementById(a);
            var f1 = parseFloat(form1.value);
            var form2 = document.getElementById(b);
            var f2 = parseFloat(form2.value);
            document.getElementById(c).value = f1 * f2;

            //var sum_1 = 0;
            //for (i = 1; i <= 200; i = i + 1) {
            //    var str = "Text_2_";
            //    var form3 = document.getElementById(str.concat(i));
            //    var f3 = parseFloat(form3.value);
            //    sum_1 = sum_1 + f3;
            //}
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table class="Table100">
            <tr>
                <td class="TableTop">業主請款單-估驗明細修改</td>
            </tr >
        </table >
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
    <br /> 
    <div style="text-align: center" >
        <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="Button1_Click" OnClientClick="return confirm('確定要儲存資料資料嗎?');"/>
        &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="回復原值" OnClick="Button2_Click" OnClientClick="return confirm('確定是否重新載入頁面?');"/>
    </div>
    </form>
</body>
</html>
