<%@ Page Language="C#" AutoEventWireup="true" CodeFile="包商6.aspx.cs" Inherits="包商6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    <link rel="stylesheet" type="text/css" href="./StyleSht.css" />

    <style type="text/css">
        .RadioButtonListCssClass {}
    </style>

    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">分包商合約(複評)</td>
            </tr>
            <tr>
                <td class="Table1" style="width: 30%">請先選擇專案</td>
                <td class="Table2">
                    <asp:DropDownList ID="DDL_PID" AppendDataBoundItems="True" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="ProjectName" DataValueField="PID" AutoPostBack="True">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [PID], [ProjectName], [ProjectCode] FROM [ProjectM0]">
                    </asp:SqlDataSource>
                </td>
                <td class="Table1">
                    再選擇分包合約</td>
                <td class="Table2">
                    <asp:DropDownList ID="DDL_SCID" AppendDataBoundItems="True" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource2" DataTextField="SC_Name" DataValueField="SCID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT SubContract_Main.SCID, SubContract_Main.SC_Name FROM SubContract_Main LEFT OUTER JOIN Firm_Check ON SubContract_Main.SCID = Firm_Check.SCID WHERE (SubContract_Main.PID = @PID) AND (Firm_Check.FirstResult IS NOT NULL)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_PID" Name="PID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Main" runat="server">
        
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="8">分包合約主資料</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">分包合約編號</td>
                <td class="Table2" style="width:15%">SC005</td>
                <td class="Table1" style="width:10%">分包合約名稱</td>
                <td class="Table2" style="width:15%">分包合約5</td>
                <td class="Table1" style="width:10%">原合約總價</td>
                <td class="Table2" style="width:15%">6,500,000</td>
                <td class="Table1" style="width:10%">追加減後合約總價</td>
                <td class="Table2" style="width:15%">
                            8,520,000</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">得標廠商</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="Label698" runat="server" Text="老王建設"></asp:Label>
                </td>
                <td class="Table1" style="width:10%">合約種類</td>
                <td class="Table2" style="width:15%">工程合約</td>
                <td class="Table1" style="width:10%">預定進場日期</td>
                <td class="Table2" style="width:15%">2015.1.1</td>
                <td class="Table1" style="width:10%">預定完工日期</td>
                <td class="Table2" style="width:15%">2015.12.31</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">履約保證</td>
                <td class="Table2" style="width:15%">銀行支票保證</td>
                <td class="Table1" style="width:10%">出廠證明提送</td>
                <td class="Table2" style="width:15%">100%提送</td>
                <td class="Table1" style="width:10%">保固年限</td>
                <td class="Table2" style="width:15%">2年</td>
                <td class="Table1" style="width:10%">追加減次數</td>
                <td class="Table2" style="width:15%">5</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">請款次數</td>
                <td class="Table2" style="width:15%">2次/月</td>
                <td class="Table1" style="width:10%">請款日</td>
                <td class="Table2" style="width:15%">每月10.25日</td>
                <td class="Table1" style="width:10%">付款日</td>
                <td class="Table2" style="width:15%">每月15.30日</td>
                <td class="Table1" style="width:10%" rowspan="2">備註</td>
                <td class="Table2" style="width:15%" rowspan="2">老王綁來的標</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">工期逾罰規定</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="Label720" runat="server" Text="合約規定完工工作天數"></asp:Label>
                </td>
                <td class="Table1" style="width:10%">逾罰</td>
                <td class="Table2" style="width:15%">一天1000元</td>
                <td class="Table1" style="width:10%">承攬範圍</td>
                <td class="Table2" style="width:15%">全部都做</td>
            </tr>
            <tr>
                <td class="Table0" colspan="8">分包商基本資料</td>
            </tr>
            <tr>
                <td class="Table1">廠商名稱</td>
                <td class="Table2">老王建設</td>
                <td class="Table1">廠商類型</td>
                <td class="Table2">建設公司</td>
                <td class="Table1">負責人</td>
                <td class="Table2">王老五</td>
                <td class="Table1">連絡電話</td>
                <td class="Table2">0912-345678</td>
            </tr>
            <tr>
                <td class="Table1">統一編號</td>
                <td class="Table2">12344321</td>
                <td class="Table1">所在縣市</td>
                <td class="Table2">台北市</td>
                <td class="Table1">資本額</td>
                <td class="Table2">1,000(千元)</td>
                <td class="Table1">員工數</td>
                <td class="Table2">200(人)</td>
            </tr>
            <tr>
                <td class="Table1">傳真號碼1</td>
                <td class="Table2">02-11112222</td>
                <td class="Table1">傳真號碼2</td>
                <td class="Table2">02-22223333</td>
                <td class="Table1">公司地址</td>
                <td class="Table2" colspan="3">台北市大安區基隆路1號</td>
            </tr>
            <tr>
                <td class="Table1">連絡電話1</td>
                <td class="Table2">02-12345678</td>
                <td class="Table1">連絡電話2</td>
                <td class="Table2">02-23456789</td>
                <td class="Table1">聯絡地址</td>
                <td class="Table2" colspan="3">台北市大安區基隆路1號</td>
            </tr>
            <tr>
                <td class="Table1">E-mail</td>
                <td class="Table2" colspan="3">OldWang@mail.tw</td>
                <td class="Table1" rowspan="2">備註</td>
                <td class="Table2" colspan="3" rowspan="2">皇家包商，案子一定要給他</td>
            </tr>
            <tr>
                <td class="Table1">廠商專長/供給材料</td>
                <td class="Table2" colspan="3">甚麼都會做</td>
            </tr>
        </table>
        <table class="Table100">
            <tr>
                <td class="Table0">初評結果</td>
            </tr>
            </table>
            <asp:Panel ID="Pnl_1" runat="server" Enabled="False">
                <table class="Sht100">
                    <tr class="ShtRowTop">
                        <td class="ShtCellCC" style="width: 17%">評估項目</td>
                        <td class="ShtCellCC" style="width: 14%">16分</td>
                        <td class="ShtCellCC" style="width: 14%">12分</td>
                        <td class="ShtCellCC" style="width: 14%">8分</td>
                        <td class="ShtCellCC" style="width: 14%">4分</td>
                        <td class="ShtCellCC" style="width: 14%">0分</td>
                        <td class="ShtCellCC">說明</td>
                    </tr>
                    <tr class="ShtRowSingle">
                        <td class="ShtCellCC" style="width: 17%">施工品質</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList7" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowDouble">
                        <td class="ShtCellCC" style="width: 17%">進度控制</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList8" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowSingle">
                        <td class="ShtCellCC" style="width: 17%">配合度</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList9" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowDouble">
                        <td class="ShtCellCC" style="width: 17%">工地清潔</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList10" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowSingle">
                        <td class="ShtCellCC" style="width: 17%">勞工安全</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList11" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowDouble">
                        <td class="ShtCellCC" style="width: 17%">材料愛惜</td>
                        <td class="ShtCellCC" colspan="5">
                            <asp:RadioButtonList ID="RadioButtonList12" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem Value="16">優</asp:ListItem>
                                <asp:ListItem Selected="True" Value="12">良</asp:ListItem>
                                <asp:ListItem Value="8">可</asp:ListItem>
                                <asp:ListItem Value="4">差</asp:ListItem>
                                <asp:ListItem Value="0">劣</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="ShtCellCC">
                            <asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="ShtRowExecuteSoft">
                        <td class="ShtCellCC" style="width: 17%">總分70以上為合格分包商</td>
                        <td class="ShtCellCL">總分：72</td>
                        <td class="ShtCellCL">考核人：王老三</td>
                        <td class="ShtCellCL">考核日期：2016.1.8</td>
                        <td class="ShtCellCL">考核結果：合格</td>
                        <td class="ShtCellCL" colspan="2">說明：<asp:TextBox ID="TextBox14" runat="server" CssClass="TBlong"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="4">
                    分包商考核(複評)</td>
            </tr>
            <tr>
                <td class="Table1" style="width:15%">評估人</td>
                <td class="Table2" style="width:35%">
                    <asp:Literal ID="LtAssessor" runat="server"></asp:Literal>
                </td>
                <td class="Table1" style="width:15%">評估日期</td>
                <td class="Table2" style="width:35%">
                    <asp:Literal ID="Ltdate" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="Table1">評估結果</td>
                <td class="Table2">
                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem>合格</asp:ListItem>
                        <asp:ListItem>不合格</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="Table1">說明</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TB500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="Table1" colspan="4">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="儲存修改" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
