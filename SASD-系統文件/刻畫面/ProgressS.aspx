<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProgressS.aspx.cs" Inherits="ProgressS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">預定進度規劃</td>
		</tr>
       
		<tr>
		<td class="Table1L" colspan="2">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_CPM" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="要徑法計算並儲存計算結果" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_Draw" runat="server" Height="30px" ImageUrl="~/img/Draw.jpg" ToolTip="顯示甘特圖" Width="27px" OnClick="IBtn_Draw_Click" />
                                &nbsp; 
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存預計開始/結束時間" Width="27px" />
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" TabIndex="0" OnClick="IBtn_Lock_Click" />
                                </td>
		</tr>
       
		<tr>
		<td class="Table1L">
                                    預計開工日期：<asp:TextBox ID="TextBox1" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
		<td class="Table1R">
                                    單位：天</td>
		</tr>
		</table>
    
    
    
                        <table id="ActivityTable" border="1" class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" rowspan="2">作業<br />
                                    編號</td>
                                <td class="ShtCellCC" rowspan="2">作業項目名稱</td>
                                <td class="ShtCellCC" rowspan="2">工期</td>
                                <td class="ShtCellCC" rowspan="2">前置作業編號</td>
                                <td class="ShtCellCC" rowspan="2">前置時間</td>
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
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    1</td>
                                <td class="ShtCellCL">
                                    構造物開挖，(含抽排水，依設計圖說計價線)</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D1" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F1" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T1" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S1" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E1" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    2</td>
                                <td class="ShtCellCL">
                                    結構用混凝土，預拌，140kgf/cm2，第1型水泥</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D2" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F2" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T2" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S2" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E2" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    3</td>
                                <td class="ShtCellCL">
                                    B1F-175混凝土</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D3" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F3" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T3" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S3" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E3" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    4</td>
                                <td class="ShtCellCL">
                                    1F-175混凝土</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D4" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F4" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T4" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S4" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E4" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    5</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label268" runat="server" Height="25px" Text="B1-鋼筋" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D5" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F5" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T5" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S5" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E5" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    6</td>
                                <td class="ShtCellCL">
                                    1F-鋼筋</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D6" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F6" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T6" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S6" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E6" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    7</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label262" runat="server" Height="25px" Text="B1-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D7" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F7" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T7" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S7" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E7" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    8</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label264" runat="server" Height="25px" Text="1F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D8" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F8" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T8" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S8" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E8" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    9</td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="Label266" runat="server" Height="25px" Text="2F-普通模板" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D9" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F9" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T9" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S9" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E9" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC">
                                    10</td>
                                <td class="ShtCellCL">
                                    鋼製模板</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_D10" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_F10" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_T10" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_S10" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_E10" runat="server" CssClass="TBshort"></asp:TextBox>
                                </td>
                            </tr>
                            </table>
    </div>
    </form>
</body>
</html>
