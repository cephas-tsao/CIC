<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>

<script runat="server">

    protected void DDL_CheckNY_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_CheckNY.SelectedValue == "1"))
        {
            DDL_Check.Visible = false;
            DDL_Get.Visible = true;
            TB_Other.Visible = false;
            DDL_GetNY.Enabled = true;
        }
        else if ((DDL_CheckNY.SelectedValue == "0"))
        { 
            DDL_Check.Visible = true;
            DDL_Get.Visible = false;
            TB_Other.Visible = false;
            DDL_GetNY.Enabled = false;
        }
    }

    protected void DDL_Check_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_Check.SelectedValue == "Other"))
        {
            TB_Other.Visible = true;
            TB_Other.Text = "";
        }
        else {
            TB_Other.Visible = false;
        }
    }

    protected void DDL_Get_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_Get.SelectedValue == "Other"))
        {
            TB_Other.Visible = true;
            TB_Other.Text = "";
        }
        else
        {
            TB_Other.Visible = false;
        }
    }

    protected void DDL_GetNY_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_GetNY.SelectedValue == "1"))
        {
            DDL_Check.Visible = false;
            DDL_Get.Visible = false;
            TB_Other.Visible = false;
        }
        else if ((DDL_GetNY.SelectedValue == "0"))
        {
            DDL_Check.Visible = false;
            DDL_Get.Visible = true;
            TB_Other.Visible = false;
        }
    }
</script>

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta content="zh-tw" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>工程合約資料</title>
<style type="text/css">
.auto-style2 {
	font-family: 微軟正黑體;
	font-size: large;
	text-align: center;
	color: #FFFFFF;
	border-style: none;
	border-width: medium;
	background-color: #800000;
}
.auto-style5 {
	border-width: 0px;
	font-family: 微軟正黑體;
}
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	text-align: center;
	border-style: none;
	border-width: medium;
	background-color: #FFFF99;
}
.auto-style12 {
	font-family: 微軟正黑體;
	font-size: medium;
	border-style: none;
	border-width: medium;
	background-color: #FFFBD6;
}
    .auto-style13 {
        font-family: 微軟正黑體;
        font-size: medium;
        text-align: center;
        border-style: none;
        border-width: medium;
        background-color: #FFFF99;
        height: 45px;
        width: 201px;
    }
    .auto-style14 {
        font-family: 微軟正黑體;
        font-size: medium;
        border-style: none;
        border-width: medium;
        background-color: #FFFBD6;
        height: 45px;
    }
</style>
</head>

<body>

<form id="form1" runat="server">
	<br />
	<table class="auto-style5" style="width: 100%">
		
		<tr>
			<td class="auto-style2" colspan="4" style="height: 29px"><strong>
			    修改其他投標廠商紀錄</strong></td>
		</tr>
		<tr>
			<td class="auto-style13">廠商名稱</td>
			<td class="auto-style12" style="height: 45px">
			    <asp:TextBox ID="TextBox3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>
			<td class="auto-style7">投標金額</td>
			<td class="auto-style12">
			    <asp:TextBox ID="TextBox4" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style13">是否合格</td>
			<td class="auto-style12" style="height: 45px">
		        <asp:DropDownList ID="DDL_CheckNY" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="DDL_CheckNY_SelectedIndexChanged">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:DropDownList>
			</td>
			<td class="auto-style7">是否得標</td>
			<td class="auto-style12">
		        <asp:DropDownList ID="DDL_GetNY" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="100px" OnSelectedIndexChanged="DDL_GetNY_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:DropDownList>
			</td>

		</tr>
		<tr>
			<td class="auto-style13">不合格/未得標原因</td>
			<td class="auto-style14" colspan="3">
		        <asp:DropDownList ID="DDL_Check" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="750px" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="DDL_Check_SelectedIndexChanged">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>未依招標文件規定投標</asp:ListItem>
                    <asp:ListItem>押標金未繳或不符合規定</asp:ListItem>
                    <asp:ListItem>資格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>規格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>價格文件未附或不符合規定</asp:ListItem>
                    <asp:ListItem>投標文件為空白文件、無關文件或標封內空無一物</asp:ListItem>
                    <asp:ListItem>借用或冒用他人名義或證件，或以偽造、變造之文件投標</asp:ListItem>
                    <asp:ListItem>偽造、變造投標文件</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：投標文件內容由同一人或同一廠商繕寫或備具者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：押標金由同一人或同一廠商繳納或申請退還者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：投標標封或通知機關信函號碼連號，顯係同一人或同一廠商所為者</asp:ListItem>
                    <asp:ListItem>政府採購法第50條第1項第5款：廠商地址、電話號碼、傳真機號碼、聯絡人或電子郵件網址相同者</asp:ListItem>
                    <asp:ListItem>屬採購法第103條第1項不得參加投標或作為決標對象之情形</asp:ListItem>
                    <asp:ListItem>違反採購法施行細則第33條之情形</asp:ListItem>
                    <asp:ListItem>屬採購法施行細則第38條第1項規定之情形</asp:ListItem>
                    <asp:ListItem Value="Other">其他</asp:ListItem>
                </asp:DropDownList>
		        <asp:DropDownList ID="DDL_Get" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="750px" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="DDL_Get_SelectedIndexChanged">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>資格、規格合於招標文件但非最低(高)標</asp:ListItem>
                    <asp:ListItem>標價偏低不合理且未繳納差額保證金</asp:ListItem>
                    <asp:ListItem Value="Other">其他</asp:ListItem>
                </asp:DropDownList>
			    <asp:TextBox ID="TB_Other" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="400px" Visible="False"></asp:TextBox>
			</td>

		</tr>
		<tr>
			<td class="auto-style13">標價偏低理由</td>
			<td class="auto-style12" style="height: 45px" colspan="3">
			    <asp:TextBox ID="TB_Lowest" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="400px"></asp:TextBox>
            </td>

		</tr>
		<tr>
			<td class="auto-style7" style="height: 45px;" colspan="4">
                <asp:Button id="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="儲存修改" Width="100px" />
		&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button id="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="回復原值" Width="100px" />
			    </td>

		</tr>
		</table>
</form>

</body>

</html>
