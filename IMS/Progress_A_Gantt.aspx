<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Progress_A_Gantt.aspx.cs" Inherits="IMS.Progress_A_Gantt" %>

<!DOCTYPE html>
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
        google.load("visualization", "1.1", { packages: ["line"] });
        google.setOnLoadCallback(drawChart2);
        function drawChart2() {
            var data2 = new google.visualization.DataTable();
            data2.addColumn('number', '天數');
            data2.addColumn('number', '預定進度完成度(%)');
            data2.addColumn('number', '實際進度完成度(%)');
            data2.addColumn('number', '預定進度完成日');
            data2.addRows([
                <%=LString() %>
                //[1, 100, 100],
                //[2, 200, 400],
                //[3, 500, 500]
            ]);

            var options2 = {
                chart: {
                    title: 'S-Curve'
                },
                width: 600,
                height: 300
            };

            var chart2 = new google.charts.Line(document.getElementById('SCurve_div'));

            chart2.draw(data2, options2);
        }
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="Table1">預定進度版本</td>
                <td class="Table2LC">
                    <asp:DropDownList ID="DDL_PreVersion" runat="server" CssClass="DDLshort">
                      <%--  <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem Selected="True">3</asp:ListItem>--%>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="Table1">實際進度版本</td>
                <td class="Table2LC">
                    <asp:DropDownList ID="DDL_Version" runat="server" CssClass="DDLshort">                  
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="2">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnFree" OnClick="Button1_Click" Text="桿狀圖繪製" />
                </td>
            </tr>
        </table><br />
       <Table ID="Table1" runat="server"> <tr><td style="width:30px;background-color:gold"></td><td>目前時間</td><td style="width:30px;background-color:Gray"></td><td>預定進度</td><td style="width:30px;background-color:Navy"></td><td>實際進度</td></tr></Table>
       <br /><asp:Label ID="Label1" runat="server" CssClass="LinkBtnA" Text="實際進度桿狀圖" Visible="False"></asp:Label>
        <br />
     <asp:Table ID="Tbl_RP" runat="server" Width="100%"></asp:Table>
        <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Gantt1.png" Width="500px" Visible="False" />--%>
        <br />
        <asp:Label ID="Label2" runat="server" CssClass="LinkBtnA" Text="預定進度VS實際進度桿狀圖" Visible="False"></asp:Label>
        <br />
        <%--<asp:Image ID="Image2" runat="server" ImageUrl="~/Gantt3.png" Width="500px" Visible="False" />--%>
     <asp:Table ID="Tbl_Compare" runat="server" Width="100%"></asp:Table>
    </div>
    </form>
</body>
</html>