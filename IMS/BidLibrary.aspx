<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidLibrary.aspx.cs" Inherits="IMS.BidLibrary"  MaintainScrollPositionOnPostback="true"%>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案專屬工料資料庫</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
      <style type="text/css">
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #800000;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align: center;
	        color: #000000;
        }
        .auto-style2L {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFF99;
	        text-align: left;
	        color: #000000;
        }
        .auto-style2R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:right;
	        color: #000000;
            width:10%;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #FFFBD6;
	        text-align:center;
	        color: #000000;
        }
        .auto-style63 {
            width: 100%;
            vertical-align:central;
        }
        .auto-style64 {
            width: 35%;
            vertical-align:central;
            text-align:center;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
            text-align:center;
        }
        .auto-style67 {
            width: 100%;
        }
    .auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #ECF5FF;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
     .Table3 {
            width: 100%;
            padding-left:200px;
            border-left:ridge;
            border-right:ridge;
        }
  /*             .Table2 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style68 {
            width: 6%;
        }
     
        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }*/
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        /*.Table1 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}



        .Table2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 26px;
        }*/



        .auto-style69 {
            width: 657px;
        }
        .auto-style70 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: center;
            color: #000000;
            width: 657px;
        }



        </style>
    <script>

        $(document).ready(function () {
            if (document.cookie.indexOf("open") >= 0) {
                // They've been here before.
               
            }
            else {
                // set a new cookie
                expiry = new Date();
                //expiry.setTime(date.getTime() + (10 * 60 * 1000)); // Ten minutes
                    //$("#slider_scroll").animate({ left: '-' + w + 'px' }, 800, 'swing');
                    //document.getElementById("content1").style.width = "99%";
                //// Date()'s toGMTSting() method will format the date correctly for a cookie
                document.cookie = "visited=yes; expires=" + expiry.toGMTString();
                //alert("this is your first time");
                return false;
            }
           
            //if (ca == '') {
            //    $("#slider_scroll").animate({ left: '-' + w + 'px' }, 800, 'swing');
            //    document.getElementById("content1").style.width = "99%";
                
            //}
        });
    </script>
   
   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
 
    
        <table class="Table100" style="background-color:white; border-color:white; border-width:1px" border="1">
            <tr>
                <td class="Table1" width="30%">請選擇標案</td>
                <td class="Table2">
		<asp:DropDownList id="DropDownList3" AppendDataBoundItems="true" runat="server" Height="50px" Width="300px" Font-Size="Medium" 
            DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" Font-Names="微軟正黑體" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
		        </td>
            </tr>
            </table>
       <div id="showid"  runat="server" visible="false">
        <table class="auto-style67" style="background-color:white; border-color:white; border-width:1px" border="1">
            <tr>
                <td class="TableTop" colspan="2">標案專屬工料資料庫</td>
            </tr>
            <tr>
                <td class="Table0" colspan="2" >&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="White">新增工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Add" runat="server" Visible="False" DefaultButton="BtAdd">
                        <table class="TableUp">
                            <tr>
                                <td class="Table1">工料種類</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DDL_WorkItem" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="155px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="X2">連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="Table1">工料名稱</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxItemName" runat="server" Font-Size="Medium" Height="25px" Width="800px"></asp:TextBox>
                                </td>
                                <td class="Table1">單位</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DDL_Unit" runat="server" DataSource='<%# Utility.Unitlist.UnitList() %>'  Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <table class="TableDown">
                            <tr>
                                <td class="Table1">資源編碼</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxCode" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="Table1">備註</td>
                                <td class="Table2">
                                    <asp:TextBox ID="TxNotes" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                              <%--  <td class="Table1">有無單價分析--%></td>
                                <td class="Table2">
                                 <%--   <asp:DropDownList ID="DDL_ComplexA" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" Enabled="False">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="1">有下層單價分析</asp:ListItem>
                                        <asp:ListItem Value="2">無下層單價分析</asp:ListItem>
                                    </asp:DropDownList>--%>
                                </td>
                                <td class="Table1">
                                    <asp:Button ID="BtAdd" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="100px" OnClick="BtAdd_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="Table0" colspan="2">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ForeColor="White">匯入共用工料資料庫之工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2" colspan="2" style="width:100%">
                    <asp:Panel ID="Pnl_Import" runat="server" Visible="False" DefaultButton="WBSSearch">
                        <table class="auto-style67" style="width:100%">
                            <tr>
                                <td class="auto-style69" style="width:40%">
                                    <asp:ListBox ID="ListBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="500px" Width="100%"  SelectionMode="Multiple">                                  
                                    </asp:ListBox>
                                </td>
                                <td class="Table1"  rowspan="2" style="width:10%">
                                    <asp:Button ID="ItemAdd" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&lt;&lt;" Width="50px" OnClick="ItemAdd_Click" />
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button ID="ItemDel" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&gt;&gt;" Width="50px" OnClick="ItemDel_Click" />
                                </td>
                                <td class="auto-styleD22" rowspan="2" style="width:50%">
                                    <table class="auto-style63" style="width:100%">
                                        <tr>
                                            <td class="auto-style68" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style64">工料種類</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">工料名稱(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="WBSSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="WBSSearch_Click"  />
                                                <br />
                                                <asp:Button ID="WBSAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="WBSAll_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style64">
                                                <asp:DropDownList ID="DDL_WBS" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                                                       <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="X2">連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">
                                                <asp:TextBox ID="TxWBS" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PriceID" 
                                        DataSourceID="SqlDataSource3" Width="100%" >
                                        <Columns>
                                         
                                            <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                            <asp:TemplateField HeaderText="工料名稱">
                                                <ItemTemplate>
                                                    <asp:Label ID="PriceName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          <%--  <asp:BoundField DataField="PriceName" HeaderText="工項名稱" SortExpression="PriceName">
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>--%>
                                            <asp:TemplateField HeaderText="單位">
                                                <ItemTemplate>
                                                    <asp:Label ID="Unit" Text='<%# Bind("Unit") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />--%>
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Complex" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                            <asp:TemplateField HeaderText="資源編碼">
                                               <ItemTemplate>
                                                   <asp:Label runat="server" ID="Code" Text='<%# Bind("Code") %>'></asp:Label>
                                               </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />--%>
                                            <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                            <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                            <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
                                        </Columns>
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
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"   UpdateCommand="UPDATE [PriceAnalysis] SET [PriceName] = @PriceName, [Complex] = @Complex, [Price] = @Price, [Unit] = @Unit, [Code] = @Code, [ReferenceID] = @ReferenceID, [ReferenceNumber] = @ReferenceNumber WHERE [PriceID] = @PriceID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PriceName" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PriceName" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="Table1">
                                    <asp:Button ID="SaveLibrary" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="存入標案專屬資料庫" OnClick="SaveLibrary_Click" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="ClearAll" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清空列表" OnClick="ClearAll_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="Table0" colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="White">工料項目搜尋</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="Table2" colspan="2">
                    <asp:Panel ID="Pnl_Search" runat="server" Visible="False" DefaultButton="BidSearch">
                        <table class="auto-style63">
                            <tr>
                                <td class="auto-style64">工料種類</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:DropDownList ID="DDL_Op3" runat="server" Font-Size="Medium">
                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style64">工料名稱(關鍵字)</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:Button ID="BidSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BidSearch_Click" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style64">
                                    <asp:DropDownList ID="DDL_WBS1" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                             <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="X2">連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style64">
                                    <asp:TextBox ID="TxBidWBS" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="Table0">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server"  Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Font-Underline="True" ForeColor="White" Text="工料項目總覽"></asp:Label>
                </td>
                <td class="auto-style2R">
                                    <asp:Button ID="All" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示全部" Width="100px" OnClick="All_Click" />
                                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource2"  
                                        GridLines="None" Width="100%" ForeColor="#333333" OnRowCommand="GridView1_RowCommand">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工料" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Detail"  CommandArgument='<%# Container.DataItemIndex%>' ImageUrl="~/IMG/Edit.png" Height="25px" />
                                                    <%--<asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Detail" Font-Names="微軟正黑體" Font-Size="Medium" Text="編修工料項目"  CommandArgument='<%# Container.DataItemIndex%>' />--%>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:label id="PriceID" runat="server" Text='<%# Eval("PriceID")%>' visible="false"></asp:label>                                                    
                                                 </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />--%>
                                            <asp:BoundField DataField="ItemName" HeaderText="工料名稱" SortExpression="ItemName">                                          
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                               <asp:BoundField DataField="ItemKind" HeaderText="工料種類" SortExpression="ItemKind"/>
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="BtnAnalyst" runat="server" Font-Names="微軟正黑體" CommandName="analyst" Font-Size="Medium" Text="單價分析" CommandArgument='<%# Container.DataItemIndex%>' Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="AnaNumber" HeaderText="AnaNumber" SortExpression="AnaNumber" Visible="False" />
                                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                            <asp:BoundField DataField="BPrice" HeaderText="BPrice" SortExpression="BPrice" Visible="False" />
                                            <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                            <asp:BoundField DataField="CReferenceID" HeaderText="CReferenceID" SortExpression="CReferenceID" Visible="False" />
                                            <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
                                            <asp:BoundField DataField="CReferenceNumber" HeaderText="CReferenceNumber" SortExpression="CReferenceNumber" Visible="False" />
                                            <asp:BoundField DataField="Labor" HeaderText="Labor" SortExpression="Labor" Visible="False" />
                                            <asp:BoundField DataField="Equipment" HeaderText="Equipment" SortExpression="Equipment" Visible="False" />
                                            <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" Visible="False" />
                                            <asp:BoundField DataField="MisWork" HeaderText="MisWork" SortExpression="MisWork" Visible="False" />
                                            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                            <asp:BoundField DataField="NewItem" HeaderText="NewItem" SortExpression="NewItem" Visible="False" />
                                            <asp:BoundField DataField="ItemKind" HeaderText="ItemKind" SortExpression="ItemKind" Visible="False" />
                                        </Columns>
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
                                    </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_Edit" runat="server" Visible="False" CssClass="Table3" Width="90%"  DefaultButton="EdConfirm" >
        <table class="Table100">
            <tr>
                <td class="Table0" colspan="6">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White">工料項目編修</asp:LinkButton>
                </td>
            </tr>
                            <tr>
                                <td class="Table1">工料種類</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DDL_edit" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="155px">
                                            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="X1">拆工拆料項</asp:ListItem>
                                        <asp:ListItem Value="X2">連工帶料項</asp:ListItem>                                       
                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="Table1">工料名稱</td>
                                <td class="Table2">
                                    <asp:TextBox ID="EdItemName" runat="server" Font-Size="Medium" Height="25px" Width="800px"></asp:TextBox>
                                </td>
                                <td class="Table1">單位</td>
                                <td class="Table2">
                                    <asp:DropDownList ID="DDL_EdUnit" DataSource='<%# Utility.Unitlist.UnitList() %>'  runat="server" Font-Names="微軟正黑體" Font-Size="Medium">
                                        <asp:ListItem Value="-請選擇-">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    <table class="auto-style67">
                        <tr>
                            <td class="Table1">資源編碼</td>
                            <td class="Table2">
                                <asp:TextBox ID="EdCode" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="Table1">備註</td>
                            <td class="Table2">
                                <asp:TextBox ID="EdNotes" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                            <td class="Table1">
                                <%--<asp:Button ID="Add_anl" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加單價分析" Width="150px"  OnClientClick="window.open('AnalysisEdit.aspx', 'window', config='height=1000,width=1500');"  />--%>
                                <%--<asp:Button ID="Del_anl" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除單價分析" Width="150px" OnClick="Del_anl_Click" />--%>
                            </td>
                            <td class="Table1">
                                <asp:Button ID="EdConfirm" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定修改" Width="100px" OnClick="EdConfirm_Click" />
                                &nbsp;
                                <asp:Button ID="EdDelete" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除此項目" Width="120px" OnClick="EdDelete_Click" OnClientClick="return confirm('確定刪除嗎?');"/>
                                &nbsp;
                                <asp:Button ID="EdEnd" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="結束" OnClick="EdEnd_Click" />
                            </td>
                        </tr>
            </table>
                    </asp:Panel>
                
        <br />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="<%=Sql%>">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    
    </div>



    </asp:Content>