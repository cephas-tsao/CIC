<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidOutputSetting.aspx.cs" Inherits="IMS.BidOutputSetting" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">



.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
            height: 27px;
        }
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #BBBB00;
	text-align: center;
	color: black;
            height: 27px;
        }
            


            .auto-style17 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 33px;
            width: 151px;
        }



            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                }



            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 33px;
            }
            </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
	<table style="width: 100%">
		<tr >
			<td class="auto-style1" colspan="4">匯出Excel設定</td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">檔案路徑設定</td>
		</tr>
		<tr>
		<%--<td class="auto-style17">存放路徑</td>
		<td class="auto-style16">
                                    <asp:TextBox ID="TextBox103" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px"></asp:TextBox>
            <asp:FileUpload ID="saveFileDialog1" runat="server" />
                                    <asp:Button ID="Button17" runat="server" Font-Names="微軟正黑體" Text="瀏覽" />
                                </td>--%>
		<td class="auto-style15" >
		    檔案名稱</td>
		<td class="auto-style16">
		    <asp:TextBox ID="TxFileName" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px"></asp:TextBox>
                                </td><td class="auto-style16"  colspan="2">
		    </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
		    表頭表尾設定</td>
		</tr>
		<tr>
		<td class="auto-style17">
		    機關/公司名稱</td>
		<td class="auto-style16">
                                    <asp:TextBox ID="TxCompany"  runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px"></asp:TextBox>
            </td>
		<td class="auto-style15">
		    預算表尾</td>
		<td class="auto-style16">
		    <asp:TextBox ID="TextBox101" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="300px">計算                    審核                    複核</asp:TextBox>
                                </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2" colspan="5">
		    EXCEL格式設定</td>
		</tr>
		<tr>
		<td class="auto-style16">
		    <asp:CheckBox ID="CheckBox1" runat="server" Text="列印日期" Checked="True" />
            <asp:TextBox ID="TxDate" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="120px" onclick="WdatePicker();"></asp:TextBox>
            </td>
		<td class="auto-style16">
		    <asp:CheckBox ID="CheckBox3" runat="server" Text="縮小字型以符合欄寬" Checked="True" />
            </td>
		<td class="auto-style16">
		    <asp:CheckBox ID="CheckBox2" runat="server" Text="折行項目不畫中間線" Checked="True" />
            </td>
		<td class="auto-style16">
		    <asp:CheckBox ID="CheckBox4" runat="server" Text="單價分析表允許使用半頁格式" Checked="True" />
            </td>
		<td class="auto-style16">
		    使用字型：<asp:DropDownList ID="DDL_font" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px">
                <asp:ListItem Selected="True" Value="1">新細明體</asp:ListItem>
                <asp:ListItem Value="2">標楷體</asp:ListItem>
            </asp:DropDownList>
                                </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2">
		    總<br />
            表</td>
		<td class="auto-style15">
		    列印層數</td>
		<td class="auto-style16">
                                <asp:DropDownList ID="DropDownList14" runat="server" Font-Size="Medium" Height="25px">
                                    <asp:ListItem Selected="True">1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                </asp:DropDownList>
                            </td>
		<td class="auto-style2">
                                    明<br />
                                    細<br />
                                    表</td>
		<td class="auto-style15">
		    備註欄</td>
		<td class="auto-style16">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Selected="True">備註</asp:ListItem>
                                        <asp:ListItem>階層碼</asp:ListItem>
                                        <asp:ListItem Selected="True">單價分析標記(*)</asp:ListItem>
                                    </asp:CheckBoxList>
            </td>
		</tr>
		</table>
        <table style="width: 100%">
		<tr>
		<td class="auto-style2" colspan="4">
		    單價分析表</td>
		</tr>
		<tr>
		<td class="auto-style15">
		    備註欄</td>
		<td class="auto-style16">
                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Selected="True">備註</asp:ListItem>
                                        <asp:ListItem>資源代碼</asp:ListItem>
                                        <asp:ListItem Selected="True">單價分析標記(*)</asp:ListItem>
                                    </asp:CheckBoxList>
            </td>
		<td class="auto-style15">
                                    重複項目</td>
		<td class="auto-style16">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True">
                                        <asp:ListItem>重複列印</asp:ListItem>
                                        <asp:ListItem Selected="True">不重複列印</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
		</tr>
		<tr>
		<td class="auto-style15" colspan="4">
                                <asp:Button ID="Export" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="匯出EXCEL檔" Width="150px" OnClick="Export_Click" />
                            </td>
		</tr>
		</table>

    </div>
    </form>
</body>
</html>