<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ExeBudgetPEdit.aspx.cs" Inherits="IMS.ExeBudgetPEdit" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/ExeBudget.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-執行預算編輯</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2L {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: left;
            color: #000000;
            height: 25px;
        }
        .auto-style2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: right;
            color: #000000;
            height: 25px;
        }
                    


        .Table1 {
            width: 88%;
            margin-left:220px;
            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E0E0E0;
	text-align: center;
	color: #000000;
}
                


        .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
                        


        .autoLeft{
           text-align:left;
        }
        .auto-style83 {
	height: 28px;
	text-align: center;
}
            .autoRight{
           text-align:right;
        }
        
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
}
            .autoCenter{
           text-align:center;
        }
                


            .auto-style91 {
            text-align: left;
            height: 27px;
        }
        .auto-style92 {
            text-align: center;
            height: 27px;
        }
        .auto-style93 {
            text-align: right;
            height: 27px;
        }
                    
        .auto-style90 {
            text-align: right;
            height: 39px;
        }
            .auto-style94 {
            text-align: left;
            height: 28px;
        }
        .auto-style95 {
            text-align: right;
            height: 28px;
        }
            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
                        

        
        </style>

<body>
  <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
    
        <table style="width: 100%;padding-left:220px">
        <tr>
			<td class="auto-style1" colspan="2">執行預算單價填列</td>
		</tr>
		<tr>
		
		<td class="auto-style2L">
                         &nbsp;<asp:ImageButton ID="ImgWorkItem" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="返回工項編輯" Width="27px"  OnClick="ImgWorkItem_Click" OnClientClick="return confirm('請確認頁面資料是否存檔?確認返回工項編輯嗎?');" />        
                     &nbsp; <asp:ImageButton ID="ImgSAve" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存修改" Width="27px" OnClick="ImgSAve_Click" />
                                &nbsp; <asp:ImageButton ID="ImgRecovery" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="ImgRecovery_Click" />
                                &nbsp;&nbsp;
                 
                              
                              
		</td>
            <td class="auto-style2R" width="50%">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click" />
                                &nbsp; <asp:ImageButton ID="ImgPDF" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPDF_Click" />
                                </td>
		</tr>
		</table>
    
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <%--<td class="auto-style45">資源編碼</td>--%>
                                <td class="auto-style45">工料名稱</td>
                                <td class="auto-style45">單位</td>
                                <td class="auto-style45">合約預算<br /> 數量</td>
                                <td class="auto-style45">執行預算<br /> 數量</td>
                                <td class="auto-style45">合約預算<br />
                                    單價</td>
                                <td class="auto-style45">投標預算<br />
                                    單價</td>
                                <td class="auto-style45">歷史發包<br />
                                    最近單價</td>
                                <td class="auto-style45">執行預算<br />
                                    單價</td>
                            </tr>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            <asp:Repeater runat="server" ID="Repeater1"  DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                          
                            <tr class="TableSingle" id="trID" runat="server">
                               <%-- <td class="autoLeft">
                                     
                                    <asp:Label ID="LbReCode" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>--%>
                                <td class="autoLeft">
                                     <asp:Label ID="LbResourceCode" runat="server" Visible="false"></asp:Label>
                                     <asp:Label ID="LbPriceID" runat="server" Visible="false"></asp:Label>
                                     <asp:Label ID="LbEWID" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td class="auto-style83">
                                    <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="LbCAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td class="autoRight">
                                    <asp:Label ID="LbEAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td class="autoRight">
                                   <asp:Label ID="LbCPrice" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                                <td class="autoRight">
                                    <asp:Label ID="LbBPrice" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                                <td class="autoRight">
                                    <asp:LinkButton ID="LinkBtnAPrice" runat="server" CommandName="Select" CommandArgument='<%# Container.ItemIndex%>' ></asp:LinkButton>
                                </td>
                                <td class="auto-style83">
                                    <asp:TextBox ID="TxEPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                                      </ItemTemplate>
                            </asp:Repeater>
                         
                        </table>
    
                        <br />
    
    </div>

    </asp:Content>