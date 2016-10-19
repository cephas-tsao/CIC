<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListSView.aspx.cs" Inherits="IMS.KCheckListSView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Chart ID="ColumnChart" runat="server" BackColor="#D3DFF0" BackGradientStyle="TopBottom" BackSecondaryColor="White" BorderColor="26, 59, 105" BorderlineDashStyle="Solid" BorderWidth="2" Height="300px" Palette="BrightPastel" Width="400px">
            <%--圖表的標題文字--%>
            <Titles>
                <asp:Title Font="Times New Roman, 14pt, style=Bold" ForeColor="26,59,105" ShadowColor="32,0,0,0" ShadowOffset="3" Text="總缺失統計圖">
                </asp:Title>
            </Titles>
            <%--圖表的說明內容--%>
            <Legends>
                <asp:Legend BackColor="Transparent" Enabled="false" Font="Times New Roman, 10pt, style=Bold" IsTextAutoFit="false" Name="Column">
                </asp:Legend>
            </Legends>
            <%--圖表的外觀--%>
            <BorderSkin />
            <%--圖表的資料數據--%>
            <Series>
                <asp:Series BorderColor="180, 26, 59, 105" ChartArea="ColumnChartArea" CustomProperties="LabelStyle=Bottom" IsValueShownAsLabel="true" LabelFormat="" Name="Column">
                </asp:Series>
            </Series>
            <%--圖表的顯示區域--%>
            <ChartAreas>
                <asp:ChartArea BackColor="64,165,191,228" BackGradientStyle="TopBottom" BackSecondaryColor="White" BorderColor="64,64,64,64" BorderDashStyle="Solid" Name="ColumnChartArea" ShadowColor="Transparent">
                    <Area3DStyle Enable3D="false" Inclination="15" IsClustered="false" IsRightAngleAxes="false" Perspective="10" Rotation="10" WallWidth="0" />
                    <AxisY ArrowStyle="Triangle" IsLabelAutoFit="false" LineColor="64,64,64,64">
                        <LabelStyle Font="Times New Roman, 10pt, style=Bold" Format="" />
                        <MajorGrid LineColor="64,64,64,64" />
                    </AxisY>
                    <AxisX ArrowStyle="Triangle" Interval="1" IsLabelAutoFit="true" LineColor="64,64,64,64">
                        <LabelStyle Font="Times New Roman, 10pt, style=Bold" IsStaggered="true" />
                        <MajorGrid LineColor="64,64,64,64" />
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </div>
    </form>
</body>
</html>
