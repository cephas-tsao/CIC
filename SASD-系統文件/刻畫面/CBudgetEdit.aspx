<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CBudgetEdit.aspx.cs" Inherits="CBudgetEdit" %>

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
			<td class="TableTop" colspan="4">合約預算建置編修</td>
		</tr>
        <tr>
			<td class="Table0" colspan="4">工項編修/數量填列</td>
		</tr>
        <tr>
                <td class="Table1L">&nbsp;
                                    <asp:ImageButton ID="IBtn_Import" runat="server" Height="30px" ImageUrl="~/img/import.jpg" ToolTip="匯入合約預算" Width="27px" OnClick="ImageButton214_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_LayerSet" runat="server" Height="30px" ImageUrl="~/img/Layer.png" ToolTip="階層及編號設定" Width="27px" PostBackUrl="~/CBudgetLayerSet.aspx" OnClick="ImageButton178_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_AddNewItem" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增工項" Width="27px" PostBackUrl="~/CItemAdd.aspx" OnClick="ImageButton175_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/Price.jpg" ToolTip="前往單價填列" Width="27px" PostBackUrl="~/CResourceList.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_Caculate" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" ToolTip="總價調整" Width="27px" OnClick="ImageButton214_Click" />
                                &nbsp; <asp:ImageButton ID="IBtn_Lock" runat="server" Height="30px" Width="27px" OnClick="IBtn_Lock_Click" ImageUrl="~/img/UnLock.jpg" ToolTip="預算尚未鎖定(點選鎖定預算)" />
                                </td>
                <td class="Table1">合約預算總價</td>
                <td class="Table2CC">
                                    <asp:Label ID="Label173" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" Text="355,420"></asp:Label>
                                </td>
                <td class="Table1R">
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="IBtn_Reload" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton131" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton132" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" />
                                    &nbsp;&nbsp;
                                </td>
            </tr>
            
                        </table>
                        
                        <table class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" colspan="3" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項<br />
                                    編輯</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" rowspan="2">單價分析</td>
                                <td class="ShtCellCC" colspan="3">合約預算</td>
                                <td class="ShtCellCC" rowspan="2">備註</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td colspan="3" class="ShtCellCC">
                                    壹</td>
                                <td class="ShtCellCC" style="width: 65px">
                                    <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton215" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">發包工程費</td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td class="ShtCellCC" style="width: 3px"></td>
                                <td class="ShtCellCC" colspan="2">
                                    一</td>
                                <td class="ShtCellCC" style="width: 65px">
                                    <asp:ImageButton ID="ImageButton216" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton217" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">假設工程</td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC"></td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    1</td>
                                <td style="width: 65px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton218" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton219" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">清除及掘除</td>
                                <td class="ShtCellCC">M2</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton21" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton21_Click" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox14" runat="server" CssClass="TBshort">1680</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">16</td>
                                <td class="ShtCellCR">31,920</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">2</td>
                                <td style="width: 65px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton220" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton221" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">基地及路幅開挖，未含運費</td>
                                <td class="ShtCellCC">B.M3 </td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton22" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox16" runat="server"  CssClass="TBshort">8000</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">25</td>
                                <td class="ShtCellCR">200,000</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC" colspan="2">
                                    二</td>
                                <td style="width: 65px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton222" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton223" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">結構體工程</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCR">&nbsp;</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowDouble">
                                <td style="width: 3px" class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">&nbsp;</td>
                                <td class="ShtCellCC">
                                    1</td>
                                <td style="width: 65px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton224" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    &nbsp;<asp:ImageButton ID="ImageButton225" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">構造物開挖，(含抽排水，依設計圖說計價線)</td>
                                <td class="ShtCellCC">B.M3</td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton23" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox19" runat="server" CssClass="TBshort">3250</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">38</td>
                                <td class="ShtCellCR">123,500</td>
                                <td class="ShtCellCL">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowSingle">
                                <td class="ShtCellCC" colspan="3">貳</td>
                                <td style="width: 65px" class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButton226" runat="server" Height="30px" ImageUrl="~/img/Edit.png" ToolTip="逐項編輯" Width="27px" PostBackUrl="~/CItemEdit.aspx" />
                                    <asp:ImageButton ID="ImageButton227" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="逐項刪除" Width="27px" />
                                </td>
                                <td class="ShtCellCL">勞工安全衛生費</td>
                                <td class="ShtCellCC">式</td>
                                <td class="ShtCellCC">
                                    &nbsp;</td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TextBox20" runat="server" CssClass="TBshort">1</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                    <asp:TextBox ID="TextBox21" runat="server" CssClass="TBshort">1777</asp:TextBox>
                                </td>
                                <td class="ShtCellCR">1,777</td>
                                <td class="ShtCellCL">發包工程費*0.5%</td>
                            </tr>
                        </table>   
    </div>
    </form>
</body>
</html>
