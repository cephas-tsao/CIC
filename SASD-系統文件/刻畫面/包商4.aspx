<%@ Page Language="C#" AutoEventWireup="true" CodeFile="包商4.aspx.cs" Inherits="包商4" %>

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
                <td class="TableTop" colspan="8">分包商遴選評估(複評)</td>
            </tr>
            <tr>
                <td class="Table1" colspan="4" style="width: 30%">請選擇分包商</td>
                <td class="Table2" colspan="4">
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="UID">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT FirmM.Name, FirmM.UID, Firm_Assess.FirmID FROM FirmM INNER JOIN Firm_Assess ON FirmM.UID = Firm_Assess.FirmID WHERE (Firm_Assess.FirstResult IS NOT NULL)"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="Table0" colspan="8">分包商基本資料</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">廠商名稱</td>
                <td class="Table2" style="width:15%">老王建設</td>
                <td class="Table1" style="width:10%">廠商類型</td>
                <td class="Table2" style="width:15%">建設公司</td>
                <td class="Table1" style="width:10%">負責人</td>
                <td class="Table2" style="width:15%">王老五</td>
                <td class="Table1" style="width:10%">連絡電話</td>
                <td class="Table2" style="width:15%">0912-345678</td>
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
                    <td class="ShtCellCC" style="width: 20%">評估項目</td>
                    <td class="ShtCellCC" style="width: 15%">16分</td>
                    <td class="ShtCellCC" style="width: 15%">12分</td>
                    <td class="ShtCellCC" style="width: 15%">10分</td>
                    <td class="ShtCellCC" style="width: 15%">6分</td>
                    <td class="ShtCellCC">說明</td>
                </tr>
                <tr class="ShtRowSingle">
                    <td class="ShtCellCC" style="width: 20%">資本額</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList7" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="16">>20萬</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">19萬~10萬</asp:ListItem>
                            <asp:ListItem Value="10">9萬~5萬</asp:ListItem>
                            <asp:ListItem  Value="6">5萬以下</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">員工數</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList8" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="16">>50人</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">49人~20人</asp:ListItem>
                            <asp:ListItem Value="10">19人~5人</asp:ListItem>
                            <asp:ListItem  Value="6">5人以下</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox9" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowSingle">
                    <td class="ShtCellCC" style="width: 20%">專業能力</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList9" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="16">特殊工法</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">獨到功夫</asp:ListItem>
                            <asp:ListItem Value="10">特別見解</asp:ListItem>
                            <asp:ListItem Value="6">尚可</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">設備(施工/工廠)</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList10" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="16">充分</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">齊全</asp:ListItem>
                            <asp:ListItem Value="10">尚可</asp:ListItem>
                            <asp:ListItem Value="6">不足</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox11" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowSingle">
                    <td class="ShtCellCC" style="width: 20%">品管措施</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList11" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem Value="16">制度良好</asp:ListItem>
                            <asp:ListItem Value="12" Selected="True">執行認真</asp:ListItem>
                            <asp:ListItem Value="10">尚可</asp:ListItem>
                            <asp:ListItem Value="6">欠佳</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">報價</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList12" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" Height="26px">
                            <asp:ListItem Value="16" Selected="True">有競爭力</asp:ListItem>
                            <asp:ListItem Value="12">合理</asp:ListItem>
                            <asp:ListItem Value="10">有折扣</asp:ListItem>
                            <asp:ListItem Value="6">太高</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox13" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowExecuteSoft">
                    <td class="ShtCellCC" style="width: 20%">總分70以上為合格分包商</td>
                    <td class="ShtCellCL">總分：72</td>
                    <td class="ShtCellCL">評估人：王老三</td>
                    <td class="ShtCellCL">評估日期：2016.01.01</td>
                    <td class="ShtCellCL">評估結果：合格</td>
                    <td class="ShtCellCL">說明：<asp:TextBox ID="TextBox14" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">分包商遴選評估(複評)</td>
            </tr>
            </table>
        <table class="Table100">
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
            <tr class="ShtRowExecuteSoft">
                <td class="Table1">評估結果</td>
                <td class="Table2">
                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem>合格</asp:ListItem>
                        <asp:ListItem>不合格</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="Table1">
                    說明</td>
                <td class="Table2">
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="TB500"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="Table100">
            <tr>
                <td class="Table1">
                    <asp:Button ID="Button1" runat="server" CssClass="BtnLargeShort" Text="儲存修改" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="BtnLargeShort" Text="全部清空" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
