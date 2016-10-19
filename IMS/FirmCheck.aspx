<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="FirmCheck.aspx.cs" Inherits="IMS.FirmCheck1" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="Firm" Src="~/Webcontrol/FirmMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商管理模組-分包商考核(初評)</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />

    <style type="text/css">
        .RadioButtonListCssClass {}
    </style>


<body>
   <Area:Firm ID="FirmBox" runat="server" />  
    <div> 
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="4">分包合約考核(初評)</td>
            </tr>
            <tr>
                <td class="Table1" style="width: 30%">請先選擇專案</td>
                <td class="Table2">
                    <asp:DropDownList ID="DDL_PID" AppendDataBoundItems="True" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="ProjectName" DataValueField="PID" AutoPostBack="True" OnSelectedIndexChanged="DDL_PID_SelectedIndexChanged">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [PID], [ProjectName], [ProjectCode] FROM [ProjectM0]">
                    </asp:SqlDataSource>
                </td>
                <td class="Table1">
                    再選擇分包合約</td>
                <td class="Table2">
                    <asp:DropDownList ID="DDL_SCID" AppendDataBoundItems="True" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource2" DataTextField="SC_Name" DataValueField="SCID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_PID" Name="PID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Main" runat="server" Visible="False" DefaultButton="checkBtn">
        
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="8">分包合約主資料</td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">分包合約編號</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbSCode" runat="server"></asp:Label></td>
                <td class="Table1" style="width:10%">分包合約名稱</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbSubName" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">原合約總價</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbSubTotal" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">追加減後合約總價</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbCCTotal" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">得標廠商</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbGetFirm" runat="server"></asp:Label>
                </td>
                <td class="Table1" style="width:10%">合約種類</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbCType" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">預定進場日期</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbBITime" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">追加減次數</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbPDTime" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">履約保證</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbGWay" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">出廠證明提送</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbSubmitPercent" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">保固年限</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbWarrantyYear" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%" rowspan="3">備註</td>
                <td class="Table2" style="width:15%" rowspan="3">
                    <asp:Label ID="LbNote" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1" style="width:10%">請款次數</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbRequestNum" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">請款日</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbRequestDate" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">付款日</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbPayDate" runat="server" ></asp:Label></td>
          
            </tr>
            <tr>
                <td class="Table1" style="width:10%">工期逾罰規定</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbDurationRule" runat="server" ></asp:Label>
                </td>
                <td class="Table1" style="width:10%">逾罰</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbPunishType" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">承攬範圍</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbScope" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table0" colspan="8">分包商基本資料</td>
            </tr>
              <tr>
                <td class="Table1" style="width:10%">廠商名稱</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbFirmName" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">廠商類型</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbType" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">負責人</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbOwner" runat="server" ></asp:Label></td>
                <td class="Table1" style="width:10%">負責人電話</td>
                <td class="Table2" style="width:15%">
                    <asp:Label ID="LbOwnerMobile" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">統一編號</td>
                <td class="Table2">
                    <asp:Label ID="LbEIN" runat="server" ></asp:Label></td>
                <td class="Table1">所在縣市</td>
                <td class="Table2">
                    <asp:Label ID="LbLocation" runat="server" ></asp:Label></td>
                <td class="Table1">資本額</td>
                <td class="Table2">
                    <asp:Label ID="LbCapital" runat="server" ></asp:Label>(千元)</td>
                <td class="Table1">員工數</td>
                <td class="Table2">
                    <asp:Label ID="LbStaff" runat="server" ></asp:Label>(人)</td>
            </tr>
            <tr>
                <td class="Table1">傳真號碼1</td>
                <td class="Table2">
                    <asp:Label ID="LbFax1" runat="server" ></asp:Label></td>
                <td class="Table1">傳真號碼2</td>
                <td class="Table2">
                    <asp:Label ID="LbFax2" runat="server" ></asp:Label></td>
                <td class="Table1">公司地址</td>
                <td class="Table2" colspan="3">
                    <asp:Label ID="LbRAddress" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">連絡電話1</td>
                <td class="Table2">
                    <asp:Label ID="LbTel1" runat="server" ></asp:Label></td>
                <td class="Table1">連絡電話2</td>
                <td class="Table2">
                    <asp:Label ID="LbTel2" runat="server" ></asp:Label></td>
                <td class="Table1">聯絡地址</td>
                <td class="Table2" colspan="3">
                    <asp:Label ID="LbCAddress" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">E-mail</td>
                <td class="Table2" colspan="3">
                    <asp:Label ID="LbEmail" runat="server" ></asp:Label></td>
                <td class="Table1" rowspan="2">備註</td>
                <td class="Table2" colspan="3" rowspan="2">
                    <asp:Label ID="LbNotes" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="Table1">廠商專長/供給材料</td>
                <td class="Table2" colspan="3">
                    <asp:Label ID="LbSupportItem" runat="server" ></asp:Label></td>
            </tr>
        </table>
        <table class="Table100">
            <tr>
                <td class="Table0">分包商考核</td>
            </tr>
            </table>
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
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem  Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 17%">進度控制</td>
                <td class="ShtCellCC" colspan="5">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 17%">配合度</td>
                <td class="ShtCellCC" colspan="5">
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 17%">工地清潔</td>
                <td class="ShtCellCC" colspan="5">
                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowSingle">
                <td class="ShtCellCC" style="width: 17%">勞工安全</td>
                <td class="ShtCellCC" colspan="5">
                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowDouble">
                <td class="ShtCellCC" style="width: 17%">材料愛惜</td>
                <td class="ShtCellCC" colspan="5">
                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16">優</asp:ListItem>
                        <asp:ListItem Value="12">良</asp:ListItem>
                        <asp:ListItem Value="8">可</asp:ListItem>
                        <asp:ListItem Value="4">差</asp:ListItem>
                        <asp:ListItem Value="0">劣</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="ShtCellCC">
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                </td>
            </tr>
            <tr class="ShtRowExecuteSoft">
                <td class="ShtCellCC" style="width: 17%">總分70以上為合格分包商</td>
                <td class="ShtCellCL">
                    總分：<asp:Literal ID="Literal4" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    考核人：<asp:Literal ID="LtAssessor" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    考核日期：<asp:Literal ID="Ltdate" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    考核結果：<div id="show" runat="server"><asp:Literal ID="LtResult" runat="server"></asp:Literal></div>
                </td>
                <td class="ShtCellCL" colspan="2">說明：<asp:TextBox ID="TextBox7" runat="server" CssClass="TBlong"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="Table100">
            <tr>
                <td class="Table1">
                    <asp:Button ID="checkBtn" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="checkBtn_Click" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnClear" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="BtnClear_Click" />
                     <asp:LinkButton ID="BtnSave" runat="server" OnClick="BtnSave_Click"></asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>

    </asp:Content>