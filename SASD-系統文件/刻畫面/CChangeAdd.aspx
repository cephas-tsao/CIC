<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CChangeAdd.aspx.cs" Inherits="CChangeAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">

        .Table100 {
	        width:100%;
        }
        .TableTop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
            height: 30px;
        }
        .Table0 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #666699;
            text-align: left;
            color: #FFFFFF;
            height: 30px;
        }
        .Table1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            }
        .Table2CC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align:central;
        }
        
        .BtnFree {
            font-size:medium;
            font-family:微軟正黑體;
            height:30px;
        }
        .Table2R {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: right;
            color: #000000;
            vertical-align:top;
        }
        .Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align:top;
        }
        .DDLshort {
            font-size:medium;
            font-family:微軟正黑體;
            width:150px;
            height:25px;
        }
        .TB500 {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:500px;
        }
        

        .TBshort {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:75px;
        }
        .TBmiddle {
            font-size:medium;
            font-family:微軟正黑體;
            height:25px;
            width:150px;
            }
        .BtnLargeMedium {
            font-size:medium;
            font-family:微軟正黑體;
            height:35px;
            width:150px;
        }
                    

        
        .auto-style5 {
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
        </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table class="Table100">
        <tr>
			<td class="TableTop">合約預算變更-新增工項</td>
		</tr>
		</table>
       
            <table style="width: 100%">
                <tr>
                    <td class="Table0" width="25%">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="White">執行預算變更新增工項列表</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Pnl_ExeAdd" runat="server" Visible="False">
            
            <table style="width: 100%">
                <tr>
                    <td class="Table1">&nbsp;</td>
                    <td class="Table1">項次</td>
                    <td class="Table1">名稱</td>
                    <td class="Table1">單位</td>
                    <td class="Table1">工項類型</td>
                    <td class="Table1">執行數量</td>
                    <td class="Table1">備註</td>
                </tr>
                <tr>
                    <td class="Table2CC">
                        <asp:Button ID="Button18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="引用" CssClass="BtnFree" />
                    </td>
                    <td class="Table2CC">壹.二.4</td>
                    <td class="Table2CC">
                        <asp:Label ID="Label354" runat="server" Font-Names="微軟正黑體" Height="25px" Text="花崗石地坪，厚20mm，印度黑(印度)濕式地坪施工(含1:3水泥砂漿及工資)"></asp:Label>
                    </td>
                    <td class="Table2CC">
                        <asp:Label ID="Label355" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                    </td>
                    <td class="Table2CC">明細項目</td>
                    <td class="Table2R">100.00</td>
                    <td class="Table2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table2CC">
                        <asp:Button ID="Button19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="引用" CssClass="BtnFree" />
                    </td>
                    <td class="Table2CC">壹.二.5</td>
                    <td class="Table2CC">
                        <asp:Label ID="Label359" runat="server" Font-Names="微軟正黑體" Height="25px" Text="瓷磚，(瓷質壁磚，一級品)，200x200mm"></asp:Label>
                    </td>
                    <td class="Table2CC">
                        <asp:Label ID="Label356" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                    </td>
                    <td class="Table2CC">明細項目</td>
                    <td class="Table2R">101.00</td>
                    <td class="Table2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table2CC">
                        <asp:Button ID="Button20" runat="server" Text="引用" CssClass="BtnFree" />
                    </td>
                    <td class="Table2CC">壹.二.6</td>
                    <td class="Table2CC">
                        <asp:Label ID="Label364" runat="server" Font-Names="微軟正黑體" Height="25px" Text="鋼門扇及門樘，甲種防火門，W1800xH2400mm"></asp:Label>
                    </td>
                    <td class="Table2CC">
                        <asp:Label ID="Label357" runat="server" Font-Names="微軟正黑體" Text="M2"></asp:Label>
                    </td>
                    <td class="Table2CC">明細項目</td>
                    <td class="Table2R">105.00</td>
                    <td class="Table2">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
       
        
 
                    <table class="Table100">
                        <tr>
                            <td class="Table0" colspan="8">新增合約預算工項</td>
                        </tr>
                        <tr>
                            <td class="Table1">變更次別</td>
                            <td class="Table2" colspan="3">
                    <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="4"></asp:Label>
                            </td>
                            <td class="Table1">階層</td>
                            <td class="Table2">
                                <asp:DropDownList ID="DropDownList33" runat="server" AutoPostBack="True" CssClass="DDLshort" Width="50px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem Selected="True">3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">上層工項</td>
                            <td class="Table2">
                                <asp:DropDownList ID="DropDownList34" runat="server" CssClass="DDLshort">
                                    <asp:ListItem Value="1">一 假設工程</asp:ListItem>
                                    <asp:ListItem Value="2">二 結構體工程</asp:ListItem>
                                    <asp:ListItem Value="3">三 建築門窗工程</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">項次</td>
                            <td class="Table2">
                                <asp:DropDownList ID="DropDownList35" runat="server" CssClass="DDLshort">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem Selected="True">3</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">工項類型</td>
                            <td class="Table2">
                                <asp:DropDownList ID="DropDownList36" runat="server" CssClass="DDLshort">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="mainitem">統計項目</asp:ListItem>
                                    <asp:ListItem Value="workitem">明細項目</asp:ListItem>
                                    <asp:ListItem Value="formula">公式計算項</asp:ListItem>
                                    <asp:ListItem Value="subtotal">計項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">工項名稱</td>
                            <td class="Table2" colspan="3">
                                <asp:TextBox ID="TextBox52" runat="server" CssClass="TB500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">單位</td>
                            <td class="Table2">
                                <asp:DropDownList ID="DropDownList37" runat="server" CssClass="DDLshort">
                                    <asp:ListItem>-請選擇-</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="Table1">
                                數量</td>
                            <td class="Table2">
                                <asp:TextBox ID="TextBox54" runat="server" CssClass="TBshort"></asp:TextBox>
                            </td>
                            <td class="Table1">備註</td>
                            <td class="Table2">
                                <asp:TextBox ID="TextBox53" runat="server" CssClass="TBmiddle"></asp:TextBox>
                            </td>
                            <td class="Table1" colspan="2">
                                    <asp:Button ID="Button17" runat="server" Text="設定工料連結" OnClick="Button17_Click" CssClass="BtnFree" />
                            </td>
                        </tr>
                        <tr>
                            <td class="Table1">責任歸屬</td>
                            <td class="Table2" colspan="3">
                <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
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
                            <td class="Table1">原因</td>
                            <td class="Table2" colspan="3">
                <asp:DropDownList ID="DropDownList2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="300px">
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
                            <td class="Table1" colspan="8">
                                    <asp:Button ID="Button5" runat="server" Text="確定新增並離開" PostBackUrl="~/合預4-1.aspx" CssClass="BtnLargeMedium" />
                                &nbsp;
                                    <asp:Button ID="Button4" runat="server" Text="返回前頁" PostBackUrl="~/合預4-1.aspx" CssClass="BtnLargeMedium" />
                                </td>
                        </tr>
                    </table>
    
    </div>
    </form>
</body>
</html>
