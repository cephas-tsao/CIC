<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Progress_New_Gantt.aspx.cs" Inherits="IMS.Progress_New_Gantt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>甘特圖</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1.1", { packages: ["gantt"] });
        google.setOnLoadCallback(drawChart);

        function daysToMilliseconds(days) {
            return days * 24 * 60 * 60 * 1000;
        }

        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Task ID');
            data.addColumn('string', 'Task Name');
            data.addColumn('date', 'Start Date');
            data.addColumn('date', 'End Date');
            data.addColumn('number', 'Duration');
            data.addColumn('number', 'Percent Complete');
            data.addColumn('string', 'Dependencies');

            data.addRows([
                <%=Gantt_String() %>
              //['1', 'A1',
              // new Date(2015, 07, 20), new Date(2015, 07, 24), daysToMilliseconds(4), 0, null],
              //['2', 'A2',
              // new Date(2015, 07, 24), new Date(2015, 07, 29), daysToMilliseconds(5), 0, '1'],
              //['3', 'B1',
              // new Date(2015, 07, 24), new Date(2015, 07, 27), daysToMilliseconds(3), 0, '1'],
              //['4', 'C1',
              // new Date(2015, 07, 29), new Date(2015, 07, 31), daysToMilliseconds(2), 0, '2,3']
            ]);


            var options = {
                height: 275,
                gantt: {
                    criticalPathEnabled: true,
                    criticalPathStyle: {
                        stroke: '#e64a19',
                        strokeWidth: 5
                    }
                }
            };

            var chart = new google.visualization.GanttChart(document.getElementById('chart_div'));

            chart.draw(data, options);
        }
        </script>
    <script>
        google.load("visualization", "1.1", { packages: ["line"] });
        google.setOnLoadCallback(drawChart2);
        function drawChart2() {
            var data2 = new google.visualization.DataTable();
            data2.addColumn('number', '天數');
            data2.addColumn('number', '最早開始Cost');
            data2.addColumn('number', '最晚開始Cost');
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
                width: 800,
                height: 300
            };

            var chart2 = new google.charts.Line(document.getElementById('SCurve_div'));

            chart2.draw(data2, options2);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label runat="server" Text="目前進度版本："></asp:Label>
        <asp:DropDownList runat="server" ID="DDL_ver" DataSourceID="Sql_DDL_ver" AutoPostBack="true" DataTextField="Version" DataValueField="Version"></asp:DropDownList>
        <asp:SqlDataSource ID="Sql_DDL_ver" runat="server"></asp:SqlDataSource>
        <div id="chart_div" style="width:600px;visibility:hidden"></div>
        <asp:PlaceHolder ID="PH1" runat="server"></asp:PlaceHolder>
        <asp:Label runat="server" Text="預定進度："></asp:Label><br />
        <div id="SCurve_div" style="width:600px;visibility:visible"></div>
    </form>
</body>
</html>
