<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidInfoM.aspx.cs" Inherits="IMS.BidInfoM" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案管理模組</title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js">  
 </script> 
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
 <body>
   <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="3">標案資訊管理</td>
            </tr>
            <tr>
                <td class="TableFun1L" style="width: 50%">&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImgAdd" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增標案" Width="27px" OnClientClick="window.open('BidAdd.aspx', 'window', config='height=300,width=600');" />
                                &nbsp;
                                    <asp:ImageButton ID="ImgSave" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="ImgSave_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="ImgRecovery" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="ImgRecovery_Click" />
                       <asp:LinkButton ID="Self" runat="server" OnClick="Self_Click"></asp:LinkButton>
                                </td>
                <td class="TableFun1C">選擇標案</td>
                <td class="TableFun2C">
		<asp:DropDownList id="DDL_Bid" runat="server" CssClass="DDLfree" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" AutoPostBack="true" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_Bid_SelectedIndexChanged">
            <asp:ListItem Value="0"> -請選擇-</asp:ListItem>
		</asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ></asp:SqlDataSource>
                                </td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_1" runat="server" OnClick="LBtn_1_Click" CssClass="LBtnStyle">公告招標資訊</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server">
            <table class="Table100">
                <tr>
                    <td class="Table1" style="height: 45px">標案名稱</td>
                    <td class="Table2LC" colspan="2" style="height: 45px">
                        &nbsp;<asp:Label ID="LbBidName" runat="server" ></asp:Label></td>
                    <td class="Table1" style="height: 45px">標案狀態</td>
                    <td class="Table2LC" style="height: 45px">
                        <asp:Label ID="LbStatus" runat="server" ></asp:Label>&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1">工程所在國家</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList id="DropDownList2" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工程所在縣市</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DropDownList4" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">電子領標</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="DDL_EGetBidNY" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                           <%-- <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">電子投標</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="DDL_EBiddingNY" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <%-- <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">截標時間<span class="NoteText">(必填)</span></td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxDeadTime" runat="server" CssClass="TBfree" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true}));"></asp:TextBox>
                    </td>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxOwner" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主聯絡人</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxContact" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                    <td class="Table1">業主地址</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxAddress" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主聯絡電話</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxTel" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                    <td class="Table1">領標地址</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxBidAddrss" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">押圖費</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxPicFee" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        元</td>
                    <td class="Table1">圖說費</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxIllFee" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        元</td>
                </tr>
                <tr>
                    <td class="Table1">履約保證金</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="RBLstyle" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Value="0">金額</asp:ListItem>
                            <asp:ListItem Value="1">百分比</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxGnFee" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <asp:Label ID="LbGnFee" runat="server"></asp:Label>
                        </td>
                    <td class="Table1">
                        退圖期限</td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxReturnIlluDeadline" runat="server" CssClass="TBfree" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">押標金</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" Font-Bold="False" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                            <asp:ListItem Value="0">金額</asp:ListItem>
                            <asp:ListItem Value="1">百分比</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                    <td class="Table2LC">
                        <asp:TextBox ID="TxBidBond" runat="server" CssClass="TBmiddle"></asp:TextBox>
                        <asp:Label ID="LbBidBond" runat="server"></asp:Label>
                        </td>
                    <td class="Table1" rowspan="2">廠商投標規定</td>
                    <td class="Table2LC" rowspan="2">
                        <asp:TextBox ID="TxFirmQualif" runat="server" CssClass="TBfree" Height="100px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">開標地點</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxOpenBidAddress" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">開標時間</td>
                    <td class="Table2LC" colspan="2">
                        <asp:TextBox ID="TxOpenBidAddTime" runat="server" CssClass="TBfree" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true}));"></asp:TextBox>
                        <span class="NoteText">(必填)</span></td>
                    <td class="Table1">決標方式</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="AwardingType" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                       <td class="Table1">共同投標</td>
                    <td class="Table2LC" colspan="2">
                        <asp:DropDownList ID="ddl_JointBidNY" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <%--   <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>--%>
                        </asp:DropDownList>
                       </td>
                    <td class="Table1">已領標</td>
                    <td class="Table2LC">
                        <asp:DropDownList ID="ddl_GetBidNY" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <%--  <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>--%>
                        </asp:DropDownList>
                        <span class="NoteText">(必選)</span></td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" OnClick="LBtn_2_Click" CssClass="LBtnStyle">合約概要</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_2" runat="server">
            <table class="Table100">
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
                </tr>
                <tr>
                    <td class="Table1">承攬方式</td>
                    <td class="Table2LC" colspan="3">
                        <asp:RadioButtonList id="ContractWay" runat="server" RepeatDirection="Horizontal">                          
                       <%--     <asp:ListItem>實做實算</asp:ListItem>
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
                        <asp:TextBox id="TxOwner1" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建築師/設計單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxArchitectName" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">監造單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxConsultantName" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">PCM名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxPCMname" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工期計算方式</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DurationType" runat="server" CssClass="DDLfree" Font-Size="Medium">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        <%--    <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem>限期完工</asp:ListItem>
                            <asp:ListItem>工作天</asp:ListItem>
                            <asp:ListItem>日曆天</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxDuration" runat="server" CssClass="TBfree"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
                </tr>
                <tr>
                    <td class="Table1">
                     
                        <asp:Button id="punish" runat="server" Text="工期逾罰資料" CssClass="BtnLargeFree" OnClick="punish_Click" />
                    </td>
                    <td class="Table1">
                        <asp:Button ID="Warranty" runat="server" CssClass="BtnLargeFree" OnClick="Warranty_Click" Text="合約保固資料" />
                    </td>
                    <td class="Table1">
                        <asp:Button ID="BidPay" runat="server" CssClass="BtnLargeFree" OnClick="BidPay_Click" Text="業主付款方式" />
                    </td>
                    <td class="Table1">
                        <asp:Button ID="BidCaution" runat="server" CssClass="BtnLargeFree" OnClick="BidCaution_Click" Text="合約應注意條款" />
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_3" runat="server" OnClick="LBtn_3_Click" CssClass="LBtnStyle">工程概要</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_3" runat="server">
            <table  class="Table100">
                <tr>
                    <td class="Table1">工程區分</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList id="RadioButtonList4" runat="server" RepeatDirection="Horizontal" Width="200px">
                            <asp:ListItem Value="1">公共工程</asp:ListItem>
                            <asp:ListItem Value="2">民間工程</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table1">工程分類</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DLEngClass" runat="server" CssClass="TBlong" Font-Size="Medium">
                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxDownFloorNum" runat="server"  CssClass="TBlong"></asp:TextBox>
                        樓</td>
                    <td class="Table1">地上樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxUpFloorNum" runat="server"  CssClass="TBlong"></asp:TextBox>
                        樓</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxDownFloorArea" runat="server"  CssClass="TBlong"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                    <td class="Table1">地上樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxUpFloorArea" runat="server"  CssClass="TBlong"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                </tr>
                <tr>
                    <td class="Table1">建物高度</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxHeight" runat="server"  CssClass="TBlong"></asp:TextBox>
                        公尺(M)</td>
                    <td class="Table1">開挖深度</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxExcDepth" runat="server"  CssClass="TBlong"></asp:TextBox>
                        公尺(M)</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 26px">基礎型式</td>
                    <td class="Table2LC" style="height: 26px">
                     <%--   <asp:DropDownList id="DropDownList5" runat="server" CssClass="TBlong" Font-Size="Medium">
                        </asp:DropDownList>--%>
                        <asp:DropDownList id="DLFoundationType" runat="server" Height="30px" Width="300px" Font-Size="Medium" CssClass="TBlong"  DataTextField="FoundationName" DataValueField="FoundationName">
                                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
			</asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>   
                        <br />
                        <span class="NoteText">*如欲增修基礎型式之內容請至常用資料維護功能</span></td>
                    <td class="Table1" style="height: 26px">擋土措施</td>
                    <td class="Table2LC" style="height: 26px">                  
                        	<asp:DropDownList id="DLRetaining" runat="server" Height="30px" Width="300px" Font-Size="Medium" DataTextField="RetainingName" CssClass="TBlong" DataValueField="RetainingName">
                                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
			</asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>   
                        <br />
                        <span class="NoteText">*如欲增修擋土措施之內容請至常用資料維護功能</span></td>
                </tr>
                <tr>
                    <td class="Table1">施工概要備註</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxNote" runat="server" CssClass="TBfree" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="Table1">其他工程概要</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxOther" runat="server" CssClass="TBfree" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            
          
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_4" runat="server" OnClick="LBtn_4_Click" CssClass="LBtnStyle">投標內業資訊</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_4" runat="server">
            <table style="width: 100%; border-color:white" border="1">
                <tr>
                    <td class="Table1">作業負責人</td>
                    <td class="Table2LC">                
                        <asp:DropDownList id="DLWorkManDep" AppendDataBoundItems="True" CssClass="DDLfree" runat="server" Height="30px" Width="120px" Font-Size="Medium" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="DepartmentName" 
                            DataValueField="DepartmentName" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                              <asp:ListItem Value="0">-請選擇部門-</asp:ListItem>           
			            </asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource6" runat="server"   SelectCommand="SELECT DISTINCT * FROM [DepartmentList]"></asp:SqlDataSource>
			            <asp:DropDownList id="DLWorkManName" AppendDataBoundItems="true" CssClass="DDLfree" runat="server" Height="30px" Width="150px" Font-Size="Medium" Font-Names="微軟正黑體" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="Name" AutoPostBack="True">
                            <asp:ListItem Value="0">-請選擇部門人員-</asp:ListItem>
			            </asp:DropDownList>
			                        <asp:SqlDataSource ID="SqlDataSource7" runat="server"  SelectCommand="SELECT * FROM [StaffInfo] WHERE ([Department] = @Department)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DLWorkManDep" Name="Department" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                    </td>
                    <td class="Table1" colspan="2">
                        <asp:Button ID="Button7" runat="server" CssClass="BtnFree" Text="共同投標廠商管理" OnClientClick="window.open('BidjointE.aspx', 'window', config='height=500,width=1200');"/>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">完成領標日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxGetBidDate" runat="server"  CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1">預定估算完成日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxBookEstimateEndDate" runat="server"  CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">標前會議時間</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxPriBidMeetTime" runat="server"  CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td class="Table1">寄送標單日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxSendBidDate" runat="server"  CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">退圖日期</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TxReturnIlluDate" runat="server"  CssClass="TBlong" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 26px">估算成本</td>
                    <td class="Table2LC" style="height: 26px" colspan="3">
                        <asp:TextBox id="TxEstimateCosts" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建議標價</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxProposalPrice" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">建議利潤</td>
                    <td class="Table2LC"><asp:TextBox id="TxProposalProfit" runat="server"  CssClass="TBlong"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="Table1">核定標價</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TxApprovedPrice" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">核定利潤</td>
                    <td class="Table2LC">  <asp:TextBox id="TxApprovedProfit" runat="server"  CssClass="TBlong"></asp:TextBox></td>
                </tr>
            </table>
            
        </asp:Panel>
    
    </div>
                            


</body>

</asp:Content>