<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="CalendarSetting.aspx.cs" Inherits="IMS.CalendarSetting" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>系統管理</title>
    <link href="CSS/SystemManage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
     <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    
 <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
     <table class="Table100">
            <tr>
                <td class="TableTop">工作日設定</td>
            </tr>
         </table>
    
    <div style="width:20%;float:left"><asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" 
        ForeColor="Black"  NextPrevFormat="ShortMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="200%" OnDayRender="Calendar1_DayRender" >        
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="Red" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
        
              </asp:Calendar>
  <%--  <div id="div1"></div>--%>
        <br /><div style="text-align:center">
       <br /></div>
        
    </div>
    <table style="width:80%;margin-left:5%"  >
        <tr><td class="Table1">選擇專案</td><td  colspan="4"> <asp:DropDownList ID="Ddl_Project" runat="server" AutoPostBack="True" CssClass="DDLfree"  DataTextField="CodeName" DataValueField="PID" OnSelectedIndexChanged="Ddl_Project_SelectedIndexChanged" Width="85%">
        <asp:ListItem Selected="True" Value="0">-請選擇-</asp:ListItem>                                        
        </asp:DropDownList></td></tr>
        <tr>
            <td class="Table1" style="width:20%">起始日設定</td>
            <td style="width:20%">
                <asp:TextBox ID="TxStart" class="Wdate"  runat="server" onclick="WdatePicker();"></asp:TextBox></td>
            <td class="Table1">結束日設定</td><td><asp:TextBox ID="TxEnd" class="Wdate" runat="server" onclick="WdatePicker();"></asp:TextBox></td>
        </tr>
        <tr><td class="Table1">一週休假日數</td><td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="0">週休一日</asp:ListItem><asp:ListItem Value="1">週休二日</asp:ListItem></asp:RadioButtonList></td>
        </tr>
        <tr><td class="Table1">非工作日選擇</td><td colspan="3"><asp:Label id="LbNonWorkdate" runat="server" /></td></tr>
        <tr><td class="Table1" >工作日總數</td><td colspan="3">
            <asp:Label ID="LbWorkDate" runat="server" ></asp:Label></td></tr>
        <tr>
            <td class="Table1">備註</td><td colspan="4">工作日已扣除春節5日、元旦、清明節、端午節、中秋節等日(共9日)。</td>
        </tr>
        <tr><td class="Table1" colspan="4">
         <asp:Button ID="BtnClear" runat="server" Text="清除日期選擇" OnClick="BtnClear_Click"  CssClass="BtnLargeShort" Width="150px" /> &nbsp; &nbsp; &nbsp;     <asp:Button ID="Button1" runat="server" Text="設定" CssClass="BtnLargeShort" OnClick="Button1_Click"/></td></tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
       <script>
           WdatePicker({ eCont: 'div1', onpicked: function (dp) { alert('你選擇的日期是:' + dp.cal.getDateStr()) } })
          
</script>
    </asp:Content>
