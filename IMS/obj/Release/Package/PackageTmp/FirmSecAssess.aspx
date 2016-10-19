<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="FirmSecAssess.aspx.cs" Inherits="IMS.FirmSecAssess" %>
<%@ Register TagPrefix="Area" TagName="Firm" Src="~/Webcontrol/FirmMode.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商管理模組-分包商遴選評估(複評)</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <link rel="stylesheet" type="text/css" href="./CSS/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./CSS/StyleSht.css" />

    <style type="text/css">
        .RadioButtonListCssClass {}
    </style>

<body>
    <%--   <asp:SiteMapDataSource ID="SiteMapDataSource1" Runat="server"  />
      <div class="row-fluid">
        <div class="span12" id="content">
            <div class="row-fluid">
                <br />
                <div class="navbar">
                    <div class="navbar-inner">
                        <ul class="breadcrumb">
                            <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                            <i class="icon-chevron-right show-sidebar" style="display: none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                         
                            <asp:SiteMapPath ID="SiteMapPath1" runat="server" class="divider"></asp:SiteMapPath>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <!-- block -->
                <div class="block">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">
                            <i class="fa fa-rss"></i>分包商遴選評估(複評)
                        </div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="row-fluid padd-bottom">--%>
    <Area:Firm ID="FirmBox" runat="server" />
  
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="8">分包商遴選評估(複評)</td>
            </tr>
            <tr>
                <td class="Table1" colspan="4" style="width: 30%">請選擇分包商</td>
                <td class="Table2" colspan="4">
                    <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" AutoPostBack="true" DataTextField="Name" DataValueField="UID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ></asp:SqlDataSource>
                </td>
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
                          <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                         <asp:ListItem Value="16"><span  style="margin-right:16px;">>20萬</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:-20px">19萬~10 萬</span></asp:ListItem>
                            <asp:ListItem Value="10">9 萬~5萬</asp:ListItem>
                            <asp:ListItem Value="6">5 萬以下</asp:ListItem>
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">員工數</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                          <asp:ListItem Value="16"><span  style="margin-right:12px;">>50人</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:-4px;">49~20人</span></asp:ListItem>
                            <asp:ListItem Value="10"><span  style="margin-right:8px;">19~5人</span></asp:ListItem>
                            <asp:ListItem Value="6">5人以下</asp:ListItem>                       
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowSingle">
                    <td class="ShtCellCC" style="width: 20%">專業能力</td>
                    <td class="ShtCellCL" colspan="4">
                         <asp:RadioButtonList ID="RadioButtonList3" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                              <asp:ListItem Value="16"><span  style="margin-right:-3px;">特殊工法</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:-1px;">獨到功夫</span></asp:ListItem>
                            <asp:ListItem Value="10"><span  style="margin-right:2px;">特別見解</span></asp:ListItem>
                            <asp:ListItem Value="6"><span  style="margin-right:28px;">尚可</span></asp:ListItem>     
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">設備(施工/工廠)</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                          <asp:ListItem Value="16"><span  style="margin-right:-3px;">充分</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:-2px;">齊全</span></asp:ListItem>
                            <asp:ListItem Value="10"><span  style="margin-right:0px;">尚可</span></asp:ListItem>
                            <asp:ListItem Value="6"><span  style="margin-right:-4px;">不足</span></asp:ListItem>      
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowSingle">
                    <td class="ShtCellCC" style="width: 20%">品管措施</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList5" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="16"><span  style="margin-right:-4px;">制度良好</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:-2px;">執行認真</span></asp:ListItem>
                            <asp:ListItem Value="10"><span  style="margin-right:34px;">尚可</span></asp:ListItem>
                            <asp:ListItem Value="6"><span  style="margin-right:26px;">欠佳</span></asp:ListItem>           
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowDouble">
                    <td class="ShtCellCC" style="width: 20%">報價</td>
                    <td class="ShtCellCL" colspan="4">
                        <asp:RadioButtonList ID="RadioButtonList6" runat="server" AutoPostBack="true" CssClass="RadioButtonListCssClass" RepeatDirection="Horizontal" Width="100%" Height="26px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"> 
                          <asp:ListItem Value="16"><span  style="margin-right:-14px;">有競爭力</span></asp:ListItem>
                            <asp:ListItem Value="12"><span  style="margin-right:20px;">合理</span></asp:ListItem>
                            <asp:ListItem Value="10"><span  style="margin-right:7px;">有折扣</span></asp:ListItem>
                            <asp:ListItem Value="6"><span  style="margin-right:16px;">太高</span></asp:ListItem>   
                    </asp:RadioButtonList>
                    </td>
                    <td class="ShtCellCC">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr class="ShtRowExecuteSoft">
                    <td class="ShtCellCC" style="width: 20%">總分70以上為合格分包商</td>
                    <td class="ShtCellCL">
                    總分：<asp:Literal ID="Literal4" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    評估人：<asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    評估日期：<asp:Literal ID="Literal2" runat="server"></asp:Literal>
                </td>
                <td class="ShtCellCL">
                    評估結果：<div id="show" runat="server"><asp:Literal ID="LtResult" runat="server"></asp:Literal></div>
                </td>
                <td class="ShtCellCL">
                    說明：<asp:TextBox ID="TextBox8" runat="server" CssClass="TBmiddle"></asp:TextBox>
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
                    <asp:Button ID="checkBtn" runat="server" CssClass="BtnLargeShort" Text="儲存修改" OnClick="checkBtn_Click" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnClear" runat="server" CssClass="BtnLargeShort" Text="全部清空" OnClick="BtnClear_Click" />
                    <asp:LinkButton ID="BtnSave" runat="server" OnClick="BtnSave_Click"></asp:LinkButton>
                </td>
            </tr>
        </table>
  <%--  </div>
    </div>
</div>
       </div>
                </div>
                <!-- /block -->
            </div>--%>
  </body>
    </asp:Content>