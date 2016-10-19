<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProjectInfoM.aspx.cs" Inherits="IMS.ProjectInfoM" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/ProjectMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <body onkeydown = "return (event.keyCode!=13)">
    <title>專案管理模組-專案資料管理</title>
    <style type="text/css">
        .auto-style92 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style93 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
       <Area:Project ID="ProjectBox" runat="server" /> 
      
     <div>
     <table class="Table100"  >
            <tr>
                <td class="TableTop">專案資料管理</td>
            </tr>
            <tr>
                <td class="Table1L">&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增專案" Width="27px" OnClientClick="window.open('ProjectAdd.aspx', 'window', config='height=500,width=1300');" />
                                &nbsp;
                                    <asp:ImageButton ID="ImgSave" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="SaveAction"  />
                                &nbsp;
                                    <asp:ImageButton ID="ImgRecorvery" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="Recovery_Click" />
                                </td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_1" runat="server" ForeColor="White" OnClick="LBtn_1_Click">專案基本資料</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server">
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif; border-color:white" border="1">
                <tr>
                    <td class="Table1">專案(工程)編號</td>
                    <td class="Table2LC" colspan="2">
                        <asp:Label ID="TxProjectCode" runat="server" ></asp:Label></td>
                    <td class="Table1">專案(工程)名稱</td>
                    <td class="Table2LC">
                        <asp:Label ID="TxProjectName" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style92">專案(工程)狀態</td>
                    <td class="auto-style93" colspan="2">
                        <asp:Label ID="LtStatus" runat="server" ></asp:Label></td>
                    <td class="auto-style92">專案(工程)簡稱</td>
                    <td class="auto-style93">
                        <asp:TextBox ID="TxProjectNickname" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 104px">備註</td>
                    <td class="Table2LC" colspan="4" style="height: 104px">
                        <asp:TextBox ID="TxNote" runat="server" CssClass="TB500" TextMode="MultiLine" Height="100px" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工程所在國家</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="DDLEngCountry" runat="server" CssClass="DDLfree" AppendDataBoundItems="True">
                               <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工程所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDLEngLocation" runat="server" CssClass="DDLfree" AppendDataBoundItems="True">
                               <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工地負責人</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxSitePerson" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">工地電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxSiteTel" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工地傳真</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxSiteFax" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxOwnerName" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主聯絡人</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxOwnerContactPerson" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">業主連絡電話</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxOwnerContactTel" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主地址</td>
                    <td class="Table2LC" colspan="4">
                        <asp:TextBox ID="TxOwnerAddress" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 32px">預定開工日期</td>
                    <td class="Table2LC" colspan="2" style="height: 32px">
                        <asp:TextBox ID="TxBookOpenDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1" style="height: 32px">預定完工日期</td>
                    <td class="Table2LC" style="height: 32px">
                        <asp:TextBox ID="TxBookFinishDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                        <br />
                        <span class="NoteText">*倘工期有展延則須修改預定完工日期為展延後之日期</span></td>
                </tr>
                <tr>
                    <td class="Table1">實際開工日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxRealOpenDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1">實際完工日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxRealFinishDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">核定完工日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxApprovedFinishDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1">驗收合格日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxAcceptCheckDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">預定保固期滿日期</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxWarrantyDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1">實際保固金退還日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxWarrantyMoneyDate" runat="server" CssClass="TBmiddle" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">履約保證金</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList ID="RBPerformanceBondType" runat="server">
                       <%--     <asp:ListItem>金額</asp:ListItem>
                            <asp:ListItem>百分比</asp:ListItem>--%>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxPerformanceBond" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table2">&nbsp;</td>
                    <td class="Table2LC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 33px">工程區分</td>
                    <td class="Table2LC" colspan="2" style="height: 33px">
                        <asp:RadioButtonList ID="RBEngType" runat="server" RepeatDirection="Horizontal" Width="60%">
                           <%-- <asp:ListItem>公共工程</asp:ListItem>
                            <asp:ListItem>民間工程</asp:ListItem>--%>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table1" style="height: 33px">工程分類</td>
                    <td class="Table2LC" style="height: 33px">
                        <asp:DropDownList ID="DDLEngClass" runat="server" CssClass="DDLfree">
                          <%--     <asp:ListItem Value="0">-請選擇-</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層數</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxDownFloorNum" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        樓</td>
                    <td class="Table1">地上樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxUpFloorNum" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        樓</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層面積</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxDownFloorArea" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                    <td class="Table1">地上樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxUpFloorArea" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                </tr>
                <tr>
                    <td class="Table1">建物高度</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxHeight" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        公尺(M)</td>
                    <td class="Table1">開挖深度</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxExcDepth" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        公尺(M)</td>
                </tr>
                <tr>
                    <td class="Table1">基礎型式</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="DDLFoundationType" runat="server" CssClass="DDLfree" AppendDataBoundItems="True"  DataSourceID="SqlDataSource2" DataTextField="FoundationName" DataValueField="FoundationName">
                               <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="Select * from Foundation"></asp:SqlDataSource>   
                    </td>
                    <td class="Table1">擋土措施</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDLRetaining" runat="server" CssClass="DDLfree" AppendDataBoundItems="True"  DataSourceID="SqlDataSource1" DataTextField="RetainingName" DataValueField="RetainingName">
                               <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="Select * from Retaining"></asp:SqlDataSource>   
                    </td>
                </tr>
                <tr>
                    <td class="Table1">施工概要備註</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxConNote" runat="server" Height="100px" TextMode="MultiLine" Width="250px" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">其他工程概要</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxOther" runat="server" Height="100px" TextMode="MultiLine" Width="250px" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" OnClick="LBtn_2_Click">工程合約資料</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_2" runat="server">
            <table class="Table100" style="border-color:white" border="1">
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
                </tr>
                  <tr>
                    <td class="Table1">原合約總價</td>
                    <td class="Table2LC" colspan="3"  CssClass="TBlong">
                        <asp:Textbox ID="TxOContrctPrice" runat="server" ></asp:Textbox></td>
                </tr>
                <tr>
                    <td class="Table1">承攬方式</td>
                    <td class="Table2LC" colspan="3" style="height: 26px">
                        <asp:RadioButtonList id="RBContractWay" runat="server" RepeatDirection="Horizontal" Width="70%">
                        <%--    <asp:ListItem>實做實算</asp:ListItem>
                            <asp:ListItem>總價承攬</asp:ListItem>
                            <asp:ListItem>實做+總價</asp:ListItem>
                            <asp:ListItem>統包</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>--%>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxOwnerName1" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建築師/設計單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxArchitectName" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="width: 200px; height: 34px">監造單位名稱</td>
                    <td class="Table2LC" colspan="3" style="height: 34px">
                        <asp:TextBox id="TxConsultantName" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">PCM名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxPCMname" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工期計算方式</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DDLDurationType" runat="server" CssClass="TBlong" Font-Size="Medium">
                         <%--   <asp:ListItem Value="0">-請選擇-</asp:ListItem>--%>
                          <%--  <asp:ListItem>限期完工</asp:ListItem>
                            <asp:ListItem>工作天</asp:ListItem>
                            <asp:ListItem>日曆天</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxDuration" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.建物執照資料</td>
                </tr>
                <tr>
                    <td class="Table1">建照號碼</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="LbBuildLicense" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">建照核發日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="LbBuildLicenseDtae" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">使照號碼</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="LbUseLicense" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                    <td class="Table1">使照核發日期</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="LbUseLicenseDate" runat="server" CssClass="TBmiddle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			III.合約明細資料</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button id="punish" runat="server" Text="工期逾罰資料" CssClass="BtnFree" OnClick="punish_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Warranty" runat="server" Text="合約保固資料" CssClass="BtnFree"  OnClick="Warranty_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="BidPay" runat="server" Text="業主付款方式" CssClass="BtnFree"  OnClick="BidPay_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="BidCaution" runat="server" Text="合約應注意條款" CssClass="BtnFree" OnClick="BidCaution_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; III.聯合承攬資料</td>
                </tr>
                <tr>
                    <td class="Table1R" colspan="4">
                        <asp:ImageButton ID="ImageButton178" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" OnClick="ImageButton178_Click" ToolTip="新增聯合承攬廠商" Width="27px" />
                        &nbsp;
                        <asp:ImageButton ID="ImageButton179" runat="server" Height="30px" ImageUrl="~/img/Reload.png" OnClick="ImageButton179_Click" ToolTip="更新/返回聯合承攬列表" Width="27px" />
                    </td>
                </tr>
                <tr>
                    <td class="Table2CC" colspan="4">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JVID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>                       
                                	   <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
              <ItemStyle Width="100px" />
                   <ItemTemplate>
                    <asp:Button ID="editbutton" runat="server" CausesValidation="false" CommandName="edit"  CommandArgument='<%# Container.DataItemIndex%>' Text="編輯" />
                </ItemTemplate>
                <ControlStyle CssClass="BtnFree" />               
                   <EditItemTemplate>
                <asp:Button ID="lbUpdate" runat="server" CommandName="Update" CommandArgument='<%# Container.DataItemIndex%>' Text="更新"></asp:Button>                |
                <asp:Button ID="lbCancelUpdate" runat="server" CommandArgument='<%# Container.DataItemIndex%>'  CommandName="Cancel" Text="取消"></asp:Button>
            </EditItemTemplate>              
            </asp:TemplateField>  
                                   <asp:TemplateField ShowHeader="False" >
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex%>' CommandName="delete" OnClientClick="if (confirm('確認刪除?') == false) return false" Text="刪除" />
                </ItemTemplate>
                <ControlStyle CssClass="BtnFree" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>              
                                    <asp:TemplateField>
                                            <ItemTemplate>
                                                  <asp:Label ID="JVID" runat="server" Text='<%# Bind("JVID") %>' Visible="false" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                          
                                <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" Visible="False" />
                                <asp:TemplateField HeaderText="承攬廠商名稱" SortExpression="Name">
                              
                                         <EditItemTemplate>
                                  <asp:DropDownList id="Name" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="UID" runat="server" SelectedValue='<%# Bind("FID") %>' ></asp:DropDownList>                           
                                          </EditItemTemplate>          
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                         
                                  <asp:TemplateField HeaderText="承攬項目">
                    <ItemTemplate>
                        <%# Eval("JVItem") %>                  
                    </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox id="JVItem" runat="server" Text='<%# Bind("JVItem") %>' ></asp:TextBox>
                        </EditItemTemplate>                      
                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="承攬金額">
                    <ItemTemplate>
                        <%# Eval("JVPrice") %>                    
                    </ItemTemplate>     
                         <EditItemTemplate>
                             <asp:TextBox id="JVPrice" runat="server" Text='<%# Bind("JVPrice") %>' ></asp:TextBox>
                         </EditItemTemplate>                 
                    </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                           
                            <EmptyDataTemplate>
                              
                               
                                  
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"  DeleteCommand="DELETE FROM [ProjectM_JV] WHERE [JVID] = @JVID" InsertCommand="INSERT INTO ProjectM_JV(PID, FID, JVItem, JVPrice) VALUES (@PID, @FID, @JVItem, @JVPrice)" >
                            <DeleteParameters>
                                <asp:Parameter Name="JVID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                                <asp:Parameter Name="FID" Type="Int32" />
                                <asp:Parameter Name="JVItem" Type="String" />
                                <asp:Parameter Name="JVPrice" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FID" Type="Int32" />
                                <asp:Parameter Name="JVItem" Type="String" />
                                <asp:Parameter Name="JVPrice" Type="Decimal" />
                                <asp:Parameter Name="JVID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
             <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="JVID" DataSourceID="SqlDataSource3" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" Width="100%" Visible="false" >
                                    <AlternatingRowStyle BackColor="White" />
                                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                                    <Fields>                                  
                                        <asp:BoundField DataField="JVID" HeaderText="JVID" InsertVisible="False" ReadOnly="True" SortExpression="JVID" Visible="False" />
                                        <asp:TemplateField HeaderText="承攬廠商名稱" SortExpression="Name">
                                        
                                                 <EditItemTemplate>
                                                  <asp:DropDownList id="Name" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="UID" runat="server" SelectedValue='<%# Bind("FID") %>' >
                                                      <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                                  </asp:DropDownList>                           
                                              </EditItemTemplate>          
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="JVItem" HeaderText="承攬項目" SortExpression="JVItem" />
                                        <asp:BoundField DataField="JVPrice" HeaderText="承攬金額" SortExpression="JVPrice" />
                                        <asp:TemplateField ShowHeader="False">
                                            <InsertItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="BtnFree" OnClick="Button1_Click" Text="確定新增" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                                            </ItemTemplate>
                                            <ControlStyle CssClass="BtnFree" />
                                        </asp:TemplateField>
                                    </Fields>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource> 
        </asp:Panel>
    </div>
   </body>
    </asp:Content>
