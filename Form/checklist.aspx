﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checklist.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        function displayCalendar() {
            var datePicker = document.getElementById('datePicker');
            datePicker.style.display = 'block';
        }
    </script>
    <style type="text/css">
        #datePicker
        {
            display:none;
            position:absolute;
            border:solid 2px black;
            background-color:white;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: medium">
        歡迎 
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button4" runat="server" Text="回首頁" OnClick="Button4_Click" />

        <input type="button" onclick="javascript: window.history.go(-1);"value="返回上一頁">
        <br />
        </br>
        工地名稱：<asp:Label ID="Label1" runat="server" Text="" align="left" ></asp:Label>
        <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
        <br />
        工程名稱：<asp:Label runat="server" id="Label4"></asp:Label>
    
        <asp:Label runat="server" id="Label2"></asp:Label>
    
        <br />
        選擇日期：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
      
        <input type="button" value="日曆" onclick="displayCalendar()"/>
    
        <br />
        <div id="datePicker">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px"  onselectionchanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
    </div>
        <asp:Table ID="Table1" runat="server"  BackColor="White" BorderColor="Black" 
    BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" style="font-size: medium">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">序號</asp:TableCell>
                <asp:TableCell runat="server">項目</asp:TableCell>
                <asp:TableCell runat="server">完成度</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        
        <br />
        
        
        <asp:Button ID="Button1" runat="server" Text="檢核" OnClick="Button1_Click" Height="45px" Width="135px" />
        <asp:Label runat="server" id="Label3" />
        
        
    </div>
    </form>
</body>
</html>
