<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidView.aspx.cs" Inherits="IMS.BidView"  MaintainScrollPositionOnPostback="true"%>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案綜合檢視</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
     <style type="text/css">
          .auto-center {          
	        text-align:center;
	       
            } 
          .auto-style2 {
            font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
            height: 25px;
            }
         .table1 {
         padding-left:200px;
         }
            .auto-style0 {
	            width:100%;
            }
            .auto-style1 {
	            font-family: 微軟正黑體;
	            font-size: large;
	            background-color: #800000;
	            text-align: center;
	            color: #FFFFFF;
            }
            .auto-style3 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFF99;
	            text-align: center;
	            color: #000000;
                height:30px;
                width:200px;
            }
            .auto-style4 {
	            font-family: 微軟正黑體;
	            font-size: medium;
	            background-color: #FFFBD6;
	            text-align: left;
	            color: #000000;
            }
            .auto-style7 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                width: 306px;
                height: 21px;
            }
            .auto-style8 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                height: 21px;
            }


.center {
	text-align: center;
}
    

            .auto-style13 {
                font-family: 微軟正黑體;
                font-size: medium;
                border-style: none;
                border-width: medium;
                background-color: white;
                text-align: left;
                height: 29px;
            }


            
            .LBmed {
           
             border-top-right-radius:8px;
             border-top-left-radius:8px;
             text-decoration:none;
             padding-top:10px;
             height:30px;
             width:120px;
             text-align:center;
         } 

            
            </style>
        <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div >
    
        <p>
            <asp:Button ID="Btn_HideSelect" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="顯示搜尋面板" OnClick="Btn_HideSelect_Click" />
            &nbsp;<asp:Button ID="Btn_All" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="標案總覽" OnClick="Btn_All_Click" />
            </p>
        <asp:Panel ID="Pnl_Select" runat="server" Font-Names="微軟正黑體" HorizontalAlign="Center" Width="100%" Visible="false"  DefaultButton="Btn_SelectGO" >
            <table class="Table100" border="1" >
                <tr>
                    <td class="TableTop" colspan="5">
                        條件搜尋</td>
                </tr>
                <tr>
                    <td class="Table1" >
                        標案名稱</td>
                    <td class="auto-style2" colspan="3">
                        <asp:TextBox ID="TB_Select1" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="580px"></asp:TextBox>
                        (關鍵字)</td>              
                    <td class="auto-style2">
                        <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">
                        標案狀態</td>
                    <td class="auto-style2" colspan="3">
                        <asp:DropDownList ID="DDL_Select1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                     
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">
                        工程所在縣市</td>
                    <td class="auto-style2" colspan="3">
                        <asp:DropDownList ID="DDL_Select2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px" AutoPostBack="True" >
                        </asp:DropDownList>
                        <asp:DropDownList ID="DDL_Select3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="150px">
                        </asp:DropDownList>
                   
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DDL_Op3" runat="server" CssClass="DDLshort" Font-Size="Medium">
                            <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                            <asp:ListItem Value="OR">或</asp:ListItem>
                            <asp:ListItem Value="AND NOT">非</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">
                        預算金額</td>
                    <td class="auto-style2" colspan="4">
                        <asp:TextBox ID="TB_Select3" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="180px"></asp:TextBox>
                        <asp:DropDownList ID="DDL_Op5" runat="server" AutoPostBack="True" CssClass="DDLshort" Font-Size="Medium" OnSelectedIndexChanged="DDL_Op5_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="1">以下</asp:ListItem>
                            <asp:ListItem Value="2">以上</asp:ListItem>
                            <asp:ListItem Value="3">之間</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="TB_Select4" runat="server" CssClass="TBmiddle" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Visible="False" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" colspan="5">
                        <asp:Button ID="Btn_SelectGO" runat="server" Text="查詢" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Btn_SelectGO_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_SelectEmpty" runat="server" CssClass="mediumbutton" Text="條件清空" Font-Names="微軟正黑體" Font-Size="Medium" OnClick="Btn_SelectEmpty_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    
        <asp:Label ID="LB_Title" runat="server"  Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Font-Underline="True" ForeColor="#0000CC" Text="標案總覽"></asp:Label>
        <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True"  AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlAll" EmptyDataText="無資料" 
            ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand"  OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--<asp:ButtonField ButtonType="Button" Text="詳細資料" CommandName="Detail" CommandArgument='<%# Container.DataItemIndex%>' >
                <ControlStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                </asp:ButtonField>--%>
                  <asp:TemplateField ShowHeader="False"  ItemStyle-Width="100px">        
                   <ItemTemplate>
                    <asp:Button ID="Detailbutton" runat="server" CausesValidation="false" CommandName="Detail"  CommandArgument='<%# Container.DataItemIndex%>' Text="詳細資料" />
                </ItemTemplate>
                <ControlStyle CssClass="smallbutton" />
                      </asp:TemplateField> 
                  <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="BID" Text='<%# Eval("BID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>              
                <%--<asp:BoundField DataField="BID" HeaderText="BID" InsertVisible="False" ReadOnly="True" SortExpression="BID" Visible="False" />--%>
                <asp:BoundField DataField="標案名稱" HeaderText="標案名稱" SortExpression="標案名稱" />
                <asp:BoundField DataField="標案狀態" HeaderText="標案狀態" SortExpression="標案狀態" />
                <asp:BoundField DataField="工程所在地" HeaderText="工程所在地" SortExpression="工程所在地" ItemStyle-CssClass="auto-center"/>
                <asp:BoundField DataField="業主名稱" HeaderText="業主名稱" SortExpression="業主名稱" ItemStyle-CssClass="auto-center"/>
                <asp:BoundField DataField="開標時間" HeaderText="開標時間" SortExpression="開標時間" ItemStyle-CssClass="auto-center"/>
                <asp:BoundField DataField="預算金額" HeaderText="預算金額" SortExpression="預算金額" DataFormatString="{0:#,###.##}" ItemStyle-CssClass="auto-center" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="工程區分">
                    <ItemStyle CssClass="auto-center" />
                   <ItemTemplate>                     
                       <asp:Label runat="server" ID="LbEngType" Text='<%# Bind("工程區分") %>' CssClass="auto-center"></asp:Label>
                   </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="工程分類">
                      <ItemStyle CssClass="auto-center" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="LbEngClass" Text='<%# Bind("工程分類") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              <%--  <asp:BoundField DataField="工程區分" HeaderText="工程區分" SortExpression="工程區分" />
                <asp:BoundField DataField="工程分類" HeaderText="工程分類" SortExpression="工程分類" />--%>
                <asp:BoundField DataField="核定標價" HeaderText="核定標價" SortExpression="核定標價" DataFormatString="{0:#,###.##}" ItemStyle-CssClass="auto-center" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="標案評估" SortExpression="標案評估">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("標案評估") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="評估內容"  CommandName="access"  CommandArgument='<%# Container.DataItemIndex%>'/>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="決標紀錄" SortExpression="決標紀錄">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("決標紀錄") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="決標紀錄"  CommandName="record"  CommandArgument='<%# Container.DataItemIndex%>'/>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle BackColor="#CC3300" ForeColor="Yellow" HorizontalAlign="Center" Font-Names="微軟正黑體" Font-Size="X-Large" />
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
        <asp:SqlDataSource ID="SqlAll" runat="server" ></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSelect" runat="server" ></asp:SqlDataSource>
        <br />
        <asp:Panel ID="Pnl_Info" runat="server" Width="100%" Font-Names="微軟正黑體" Visible="false">
            <table class="Table100" style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="Table1">標案名稱</td>
                    <td class="auto-style2">
                        <asp:Label ID="LbName" runat="server" Text="標案名稱"></asp:Label>
                    </td>
                    <td class="Table1">標案狀態</td>
                    <td class="auto-style2">
                        <asp:Label ID="LbStatus" runat="server" Text="標案狀態"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:LinkButton ID="LinkButton11" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton12" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton13" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton14" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton15" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop" colspan="2">未成案訊息</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 306px">預估金額</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbForecastPrice" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 306px">預估招標日期</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbForecastBiddingDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width: 306px">備註</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbNotes" runat="server" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:LinkButton ID="LinkButton21" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton22" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton23" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton24" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton25" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                            <tr>
                                <td class="TableTop" colspan="8" style="height: 27px">公告招標資訊</td>
                            </tr>
                            <tr>
                                <td class="Table1">工程所在國家</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbEngCountry" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">工程所在縣市</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbEngLocation" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="height: 45px">電子領標</td>
                                <td class="auto-style2" style="height: 45px">
                                    <asp:Label ID="LbEGetBidNY" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 45px">電子投標</td>
                                <td class="auto-style2" style="height: 45px">
                                    <asp:Label ID="LbEBiddingNY" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 45px">截標時間</td>
                                <td class="auto-style2" colspan="3" style="height: 45px">
                                    <asp:Label ID="LbBiddingEndDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">業主名稱</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOwnerName" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">業主聯絡人</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOwnerContactPerson" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">業主地址</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOwnerAddress" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">業主聯絡電話</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOwnerContactTel" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="height: 24px">領標地址</td>
                                <td class="auto-style2" colspan="3" style="height: 24px">
                                    <asp:Label ID="LbGetBidAddress" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 24px">押圖費</td>
                                <td class="auto-style2" colspan="3" style="height: 24px">
                                    <asp:Label ID="LbIlluBond" runat="server" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">圖說費</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbIlluFee" runat="server" ></asp:Label>
                                    </td>
                                <td class="Table1">退圖期限</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbReturnIlluDeadline" runat="server" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">履約保證金</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbPerformanceBond" runat="server" ></asp:Label>
                                    </td>
                                <td class="Table1">押標金</td>
                                <td class="auto-style2" colspan="3">
                                    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LbBidBond" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">廠商投標規定</td>
                                <td class="auto-style2" colspan="7">
                                    <asp:Label ID="LbFirmQualif" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">開標地點</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOpenBidAddress" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">開標時間</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOpenBidTime" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="height: 24px">決標方式</td>
                                <td class="auto-style2" colspan="3" style="height: 24px">
                                    <asp:Label ID="LbAwardingType" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 24px">共同投標</td>
                                <td class="auto-style2" style="height: 24px">
                                    <asp:Label ID="LbJointBidNY" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 24px">已領標</td>
                                <td class="auto-style2" style="height: 24px">
                                    <asp:Label ID="LbGetBidNY" runat="server" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:LinkButton ID="LinkButton31" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton32" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton33" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton34" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton35" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel3" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="TableTop" colspan="4" style="height: 29px"><strong>合約概要</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style13" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; I.合約主資料</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width:25%">承攬方式</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbContractWay" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">業主名稱</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbOwnerName1" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">建築師/設計單位名稱</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbArchitectName" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">監造單位名稱</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbConsultantName" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">PCM名稱</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbPCMname" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">工期計算方式</td>
                                <td class="auto-style2" style="width: 300px">
                                    <asp:Label ID="LbDurationType" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">工期</td>
                                <td class="auto-style2" style="width: 300px">
                                    <asp:Label ID="LbDuration" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; II.合約明細資料</td>
                            </tr>
                            <tr>
                                <td class="Table1" colspan="4">
                                    <asp:Button ID="Punish" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="工期逾罰資料" Width="145px" OnClick="Punish_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Warranty" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約保固資料" Width="145px" OnClick="Warranty_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Payment" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="業主付款方式" Width="145px" OnClick="Payment_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Notice" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="35px" Text="合約應注意條款" Width="170px" OnClick="Notice_Click"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:LinkButton ID="LinkButton41" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton42" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton43" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton44" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton45" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="TableTop" colspan="4">工程概要</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width:20%">工程區分</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbEngType" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="width:20%">工程分類</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbEngClass" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">地下樓層數</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbDownFloorNum" runat="server" ></asp:Label>
                                    </td>
                                <td class="Table1">地上樓層數</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbUpFloorNum" runat="server" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">地下樓層面積</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbHeight" runat="server"></asp:Label>
                                    </td>
                                <td class="Table1">地上樓層面積</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbExcDepth" runat="server" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1">建物高度</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbDownFloorArea" runat="server"></asp:Label>
                                    </td>
                                <td class="Table1">開挖深度</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbUpFloorArea" runat="server" ></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table1" style="height: 26px">基礎型式</td>
                                <td class="auto-style2" style="height: 26px">
                                    <asp:Label ID="LbFoundationType" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="height: 26px">擋土措施</td>
                                <td class="auto-style2" style="height: 26px">
                                    <asp:Label ID="LbRetaining" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">施工概要備註</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbNote" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">其他工程概要</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbOther" runat="server" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:LinkButton ID="LinkButton51" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="0" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">未成案訊息</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton52" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="1" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">公告招標資訊</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton53" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="2" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">合約概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton54" runat="server" BackColor="#D2D2D2" BorderWidth="1px" CommandArgument="3" CommandName="SwitchViewByIndex" CssClass="LBmed" ForeColor="Black">工程概要</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton55" runat="server" BackColor="White" BorderWidth="1px" CommandArgument="4" CommandName="SwitchViewByIndex" CssClass="LBmed" Font-Bold="True" ForeColor="Black">投標內業資訊</asp:LinkButton>
                    <br />
                    <asp:Panel ID="Panel5" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" Height="400px" Width="100%">
                        <table style="width: 100%">
                            <tr>
                                <td class="TableTop" colspan="4">投標內業資訊</td>
                            </tr>
                            <tr>
                                <td class="Table1" style="width:20%">作業負責人</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="LbWorkManName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">完成領標日期</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbGetBidDate" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1" style="width:20%">預定估算完成日期</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbBookEstimateEndDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">標前會議時間</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbPriBidMeetTime" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">寄送標單日期</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbSendBidDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">退圖日期</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbReturnIlluDate" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">估算成本</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbEstimateCosts" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">建議標價</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbProposalPrice" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">建議利潤</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbProposalProfit" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">核定標價</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbApprovedPrice" runat="server" ></asp:Label>
                                </td>
                                <td class="Table1">核定利潤</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LbApprovedProfit" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="4">共同投標廠商明細</td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="4">
                                    <asp:GridView ID="GridView2" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JBID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" AllowPaging="True"  PageSize="5">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="JBID" HeaderText="JBID" InsertVisible="False" ReadOnly="True" SortExpression="JBID" Visible="False" />
                                            <asp:BoundField DataField="共同投標廠商名稱" HeaderText="共同投標廠商名稱" SortExpression="共同投標廠商名稱">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="共同投標項目" HeaderText="共同投標項目" SortExpression="共同投標項目">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="共同投標金額" HeaderText="共同投標金額" SortExpression="共同投標金額" DataFormatString="{0:#,###.##}">
                                            <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </asp:View>
            </asp:MultiView>
        </asp:Panel>
        <br />
    </div>

    </asp:Content>