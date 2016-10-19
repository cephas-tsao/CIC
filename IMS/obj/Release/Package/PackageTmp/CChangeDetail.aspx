<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CChangeDetail.aspx.cs" Inherits="IMS.CChangeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }
             .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
            height: 25px;
        }
             
        .auto-style4 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 25px;
        }
             .auto-style5 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 25px;
        }  
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="6">合約預算項目變更明細</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                變更次別</td>
            <td class="auto-style3">
                <asp:Label ID="LbEdition" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="auto-style2">
                上層工項</td>
            <td class="auto-style3">
                <asp:Label ID="LbUpItem" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">
                                項次</td>
            <td class="auto-style3">
                <asp:Label ID="LbItemOrder" runat="server"></asp:Label>
            </td>
		</tr>
		<tr>
		<td class="auto-style2">
                工項名稱</td>
            <td class="auto-style3">
                <asp:Label ID="LbItemName" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">
                單位</td>
            <td class="auto-style3">
                <asp:Label ID="LbUnit" runat="server" ></asp:Label>
            </td>
            <td class="auto-style2">
                工項備註</td>
            <td class="auto-style3">
                &nbsp;<asp:Label ID="LbNotes" runat="server" ></asp:Label></td>
		</tr>
		</table>
        <table style="width: 100%">
            	<tr>
		<td class="auto-style2" colspan="4">
                                執行預算</td>
            
		</tr>		
		<tr>
		<td class="auto-style2">
                                </td>
            <td class="auto-style2">
                                    執行數量</td>
            <td class="auto-style2">
                                    執行單價</td>
            <td class="auto-style2">
                                    執行複價</td>
	
		</tr>
		<tr>
		<td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="LbEQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbEPrice" runat="server" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbEComplex" runat="server"  Width="150px"></asp:Label>
            </td>
		
		</tr>
		<tr>
		<td class="auto-style2">
                                末次變更後</td>
            <td class="auto-style3C">
                <asp:Label ID="LbCEQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCEPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCEComplex" runat="server"  Width="150px"></asp:Label>
            </td>
	
		</tr>
		
               <tr>
		<td class="auto-style2" colspan="4">
                                合約預算</td>
            </tr>
            <tr>
                	<td class="auto-style2">
                                </td>
            <td class="auto-style2">
                                    合約數量</td>
            <td class="auto-style2">
                                    合約單價</td>
            <td class="auto-style2">
                                    合約複價</td>
            
            </tr>
            <tr>
            <td class="auto-style2">
                                原預算</td>
            <td class="auto-style3C">
                <asp:Label ID="LbQuantity" runat="server" Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCComplex" runat="server"  Width="150px"></asp:Label>
            </td>
                </tr>
            <tr>
	<td class="auto-style2">
                                變更前</td>
            <td class="auto-style3C">
                <asp:Label ID="LbCBQuantity" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCCPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbCCComplex" runat="server"  Width="150px"></asp:Label>
            </td>
            </tr>
            <tr>
<td class="auto-style2">
                                本次追加減</td>
            <td class="auto-style3C">
                                    <asp:TextBox ID="TxIDQuantity" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="150px" AutoPostBack="True" ></asp:TextBox>
            </td>
            <td class="auto-style3C">
                &nbsp;</td>
            <td class="auto-style3C">
                                    &nbsp;</td>
		</tr>
	
            <tr>
                	<td class="auto-style2">
                                變更後</td>
            <td class="auto-style3C">
               <asp:TextBox   ID="LbACQuantity" runat="server" Font-Size="Medium" Height="25px" Width="150px"></asp:TextBox>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbACPrice" runat="server"  Width="150px"></asp:Label>
            </td>
            <td class="auto-style3C">
                <asp:Label ID="LbACComplex" runat="server"  Width="150px"></asp:Label>
            </td>
            </tr>
		<tr>
		<td class="auto-style5">
                                責任歸屬</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DDL_Respond" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>業主變更及要求</asp:ListItem>
                    <asp:ListItem>投標自算與預算編列因素</asp:ListItem>
                    <asp:ListItem>設計圖面的衝突</asp:ListItem>
                    <asp:ListItem>工地需求、施工因素及工法變更</asp:ListItem>
                    <asp:ListItem>拆工料、單價、單位及發包方式變更</asp:ListItem>
                    <asp:ListItem>應扣包商款項</asp:ListItem>
                    <asp:ListItem>天然災害</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5">
                原因</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DDL_Reason" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
                    <asp:ListItem>-請選擇-</asp:ListItem>
                    <asp:ListItem>原預算未列</asp:ListItem>
                    <asp:ListItem>規格改變</asp:ListItem>
                    <asp:ListItem>用量增減</asp:ListItem>
                    <asp:ListItem>客戶變更</asp:ListItem>
                    <asp:ListItem>其他</asp:ListItem>
                </asp:DropDownList>
            </td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="4">
                                    <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="儲存變更並離開"  OnClick="BtnSave_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="返回前頁" OnClientClick="window.close()"  />
                                </td>
		</tr>
		
    	</table>
    </div>
    </form>
</body>
</html>
