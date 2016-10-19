<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ProgressS.aspx.cs" Inherits="IMS.ProgressS" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/ProgressMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>進度管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
     <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>

<body>

    <div>
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">預定進度規劃</td>
		</tr>
       
		<tr>
		<td class="Table1L" colspan="2">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_CPM" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="要徑法計算並儲存計算結果" Width="27px" OnClick="IBtn_CPM_Click" />
                               
                                &nbsp; 
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存預計開始/結束時間" Width="27px" OnClick="IBtn_Save_Click" />
                                 &nbsp;
                                    <asp:ImageButton ID="IBtn_Draw" runat="server" Height="30px" ImageUrl="~/img/Draw.jpg" ToolTip="顯示甘特圖" Width="27px"  OnClick="IBtn_Draw_Click"/>
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" TabIndex="0" OnClick="IBtn_Lock_Click" />
                                </td>
		</tr>
       
		<tr>
		<td class="Table1L">
                                    預計開工日期：<asp:TextBox ID="TB_RSdate" runat="server" CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox><asp:Button ID="SetDate" runat="server" Text="重新排程" OnClick="SetDate_Click" />
                                </td>
		<td class="Table1R">
                                    單位：天</td>
		</tr>
		</table>
    
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        <table id="ActivityTable" border="1" class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2">作業<br />
                                    編號</td>
                                <td class="ShtCellCC" rowspan="2">作業項目名稱</td>
                                <td class="ShtCellCC" rowspan="2">工期</td>
                                <td class="ShtCellCC" rowspan="2">前置作業編號</td>
                                <td class="ShtCellCC" rowspan="2">前置時間</td>
                                <td class="ShtCellCC" rowspan="2">分攤工<br />項比例</td>
                                <td class="ShtCellCC" colspan="2">開始時間</td>
                                <td class="ShtCellCC" colspan="2">結束時間</td>
                                <td class="ShtCellCC" rowspan="2">浮時(F)</td>
                                <td class="ShtCellCC" rowspan="2">要徑</td>
                                <td class="ShtCellCC" colspan="2">預計時間</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">最早(ES)</td>
                                <td class="ShtCellCC">最晚(LS)</td>
                                <td class="ShtCellCC">最早(EF)</td>
                                <td class="ShtCellCC">最晚(LF)</td>
                                <td class="ShtCellCC">開始</td>
                                <td class="ShtCellCC">結束</td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1" >
                                <ItemTemplate>
                                     <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbWIID" runat="server" Text='<%# Bind("WIID") %>'></asp:Label></td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="LbWBSID" runat="server" Text='<%# Bind("WBSID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="LbWIName" runat="server" Text='<%# Bind("WIName") %>'></asp:Label>
                                    <asp:Label ID="LbWBSName" runat="server" Text='<%# Bind("WBSName") %>' Visible="false"></asp:Label></td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D1" runat="server" CssClass="TBshort" Text='<%# Bind("Duration") %>'></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F1" runat="server" CssClass="TBshort" Text='<%# Bind("PreWorkID") %>'></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T1" runat="server" CssClass="TBshort"  Text='<%# Bind("FTime") %>'></asp:TextBox>
                                </td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="LbRate" runat="server" Text='<%# Bind("Amount") %>'></asp:Label></td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbES" runat="server" Text='<%# Bind("ES") %>'></asp:Label>&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbLS" runat="server" Text='<%# Bind("LS") %>'></asp:Label> &nbsp;</td>
                                <td class="ShtCellCC">
                                   <asp:Label ID="LbEF" runat="server" Text='<%# Bind("EE") %>'></asp:Label> &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbLF" runat="server" Text='<%# Bind("LE") %>'></asp:Label>&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbFTime" runat="server" ></asp:Label>&nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbCP" runat="server" Text='<%# Bind("CP") %>'></asp:Label> &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S1" runat="server" CssClass="TBshort" Text='<%# Bind("StartDate") %>' onclick="WdatePicker();" ></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E1" runat="server" CssClass="TBshort" Text='<%# Bind("EndDate") %>' onclick="WdatePicker();" ></asp:TextBox>
                                </td>
                            </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                           
                       
                            </table>
    </div>

</body>
</html>

    </asp:Content>