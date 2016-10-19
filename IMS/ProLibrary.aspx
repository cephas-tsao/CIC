<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="ProLibrary.aspx.cs" Inherits="IMS.ProLibrary"  MaintainScrollPositionOnPostback="true"%>
<%@ Register TagPrefix="Area" TagName="Project" Src="~/Webcontrol/CBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-執行預算編輯</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <script type="text/javascript">

        function addLayerCode() {

            $.ajax({
                type: "POST",

                url: '../Ajax/AddLayerCode.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function (msg) {

                    alert("階層碼更新成功");
                }
            })
        }
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style67 {
            width: 100%;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
        }
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2L {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: left;
	        color: #000000;
        }
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #97CBFF;
	text-align: center;
	color: #000000;
}



        .auto-style36 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 26px;
        }



        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


        .auto-style69 {
            width: 657px;
        }
        .auto-style3C {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:center;
	        color: #000000;
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
            .auto-style63 {
            width: 100%;
            vertical-align:central;
            background-color: #ECF5FF;
        }
                
        .auto-style64 {
            width: 35%;
            vertical-align:central;
            text-align:center;
            background-color: #97CBFF;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
            text-align:center;
        }
        .auto-style70 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            width: 657px;
        }

        .border {
            padding-bottom:10px;
        }

        .auto-style2R {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align:right;
	        color: #000000;
            width:10%;
        }
        .auto-style2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: center;
	        color: #000000;
        }
        .button {
        padding-left:10px;
        }
        </style>

<body>
   <Area:Project ID="ProjectBox" runat="server" /> 
    <div>
    
        <br />
    
        <table class="auto-style67" style="border-color:transparent" border="1" >
            <tr>
                <td class="auto-style1">專案工料資料庫</td>
            </tr>
            <tr>
                <td class="auto-style2L" style="border-width:thick;border-color:transparent">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">新增工料項目</asp:LinkButton>
                </td>
            </tr>
            </table>
        <table class="auto-style67" style="border-color:transparent"  >
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Pnl_Add" runat="server" Visible="False" DefaultButton="Add">
                        <table class="TableUp" style="border-color:transparent" border="1">
                            <tr style="border-color:white">
                                <td class="auto-style33" style="width:11.5%;">工料種類</td>
                                <td class="auto-style36" style="width:15%">
                                    <asp:DropDownList ID="DDLKind" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                        <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                   
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33" style="width:15%">工料名稱</td>
                                <td class="auto-style36" style="width:40%">
                                    <asp:TextBox ID="TxItemName" runat="server" Font-Size="Medium" Height="25px" Width="90%" ></asp:TextBox>
                                </td>
                                <td class="auto-style33" style="width:15%">單位</td>
                                <td class="auto-style36">
                                    <asp:DropDownList ID="DDL_Unit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" DataSource='<%# Utility.Unitlist.UnitList() %>' Width="100%">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <table class="TableDown" style="border-color:transparent">
                            <tr>
                                <td class="auto-style33">資源編碼</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TxCode" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">備註</td>
                                <td class="auto-style36">
                                    <asp:TextBox ID="TxNotes" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                                </td>
                              <%--  <td class="auto-style33">有無單價分析</td>--%>
                                <td class="auto-style36">
                         
                                </td>
                                <td class="auto-style33">
                                    <asp:Button ID="Add" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="新增" Width="100px"  OnClick="Add_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
              </table>
          <table class="auto-style67"  style="border-color:transparent;" border="1">
            <tr >
                <td class="auto-style2L" >
                    &nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">轉入標案專屬工料資料庫之工料項目</asp:LinkButton>
                </td>
            </tr>
          </table >
        <table class="auto-style67"  style="border-color:transparent;" border="1">
        <asp:Panel ID="Pnl_Bid" runat="server" Visible="False" DefaultButton="BtnTransfer" >
          
                <tr >
                    <td class="auto-style33">請選擇標案</td>
                    <td class="auto-style36">
                        <asp:DropDownList id="DDL_Bid" AppendDataBoundItems="true" runat="server" Height="50px" Width="300px" Font-Size="Medium" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" AutoPostBack="true" Font-Names="微軟正黑體">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT * FROM [BidM0]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style33">
                        <asp:Button ID="BtnTransfer" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定轉入" Width="100px" OnClick="BtnTransfer_Click" />
                    </td>
                </tr>           
        </asp:Panel>
               </table>
        <div style="width:101%;margin-left:-15px;">
        <table class="auto-style67" style="border-color:transparent;margin-left:10px;" border="1" >
            <tr>
                <td class="auto-style2L" colspan="2" style="border-width:thick;border-color:transparent">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">匯入共用工料資料庫之工料項目</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Import" runat="server" Visible="False" DefaultButton="BtnSearch">
                        <table class="auto-style67">
                            <tr>
                                <td class="auto-style69">
                                    <asp:ListBox ID="ListBox1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="500px" Width="100%"></asp:ListBox>
                                </td>
                                <td class="auto-style3C" width="5%" rowspan="2">
                                    <asp:Button ID="ItemAdd" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&lt;&lt;" Width="50px"  OnClick="ItemAdd_Click"/>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button ID="ItemDel" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="&gt;&gt;" Width="50px"  OnClick="ItemDel_Click"/>
                                </td>
                                <td class="auto-styleD22" rowspan="2">
                                    <table class="auto-style63">
                                        <tr>
                                            <td class="auto-style64" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style65">工項種類</td>
                                            <td class="auto-style65" rowspan="2" style="width:5%">
                                                <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium" Width="100px">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style65">工項名稱(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                <br />
                                                <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style65">
                                                <asp:DropDownList ID="DDL_kind" runat="server"  Font-Size="Medium" Height="30px" Width="155px">
                                                    <asp:ListItem Value="0">不分類</asp:ListItem>
                                                   <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                   
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style65">
                                                <asp:TextBox ID="SrItemName" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                        DataKeyNames="PriceID" DataSourceID="SqlDataSource3" Width="100%" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label ID="PriceID" Text='<%# Bind("PriceID") %>' runat="server" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />--%>
                                          <%--  <asp:BoundField DataField="PriceName" HeaderText="工項名稱" SortExpression="PriceName">
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>--%>
                                            <asp:TemplateField HeaderText="工項名稱">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="PriceName" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="單位">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Unit" Text='<%# Bind("Unit") %>'></asp:Label>
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
                                            <asp:TemplateField HeaderText="資源編碼">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="Code" Text='<%# Bind("Code") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
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
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  DeleteCommand="DELETE FROM [PriceAnalysis] WHERE [PriceID] = @PriceID" 
                                        InsertCommand="INSERT INTO [PriceAnalysis] ([PriceName], [Complex], [Price], [Unit], [Code], [ReferenceID], [ReferenceNumber]) VALUES (@PriceName, @Complex, @Price, @Unit, @Code, @ReferenceID, @ReferenceNumber)" 
                                        SelectCommand='<%=Sql%>'
                                        UpdateCommand="UPDATE [PriceAnalysis] SET [PriceName] = @PriceName, [Complex] = @Complex, [Price] = @Price, [Unit] = @Unit, [Code] = @Code, [ReferenceID] = @ReferenceID, [ReferenceNumber] = @ReferenceNumber WHERE [PriceID] = @PriceID">
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
                                <td class="auto-style70">
                                    <asp:Button ID="BtnSave" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="存入專案工料資料庫" OnClick="BtnSave_Click" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="ClearAll" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="清空列表" OnClick="ClearAll_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2L" colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">工料項目搜尋</asp:LinkButton>
                </td>
            </tr>
            <tr style="border-color:transparent;border:1px">
                <td class="auto-style3" colspan="2">
                    <asp:Panel ID="Pnl_Search" runat="server" Visible="False" DefaultButton="RsSearch">
                        <table class="auto-style63" border="1" style="border-color:transparent">
                            <tr>
                                <td class="auto-style64" style="width:20%">工料種類</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:DropDownList ID="DDL_Op1" runat="server" Font-Size="Medium" Width="100px">
                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                        <asp:ListItem Value="NOT">非</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style64">工料名稱(關鍵字)</td>
                                <td class="auto-style65" rowspan="2">
                                    <asp:Button ID="RsSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="RsSearch_Click" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style65">
                                    <asp:DropDownList ID="DDL_RsKind" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                        <asp:ListItem Value="0">不分類</asp:ListItem>
                                       <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                   
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style65" style="width:40%" >
                                    <asp:TextBox ID="RsKeyWord" runat="server" Font-Size="Medium" Height="25px" Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2L" style="width:90%">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Font-Underline="True" ForeColor="Red" Text="工料項目總覽"></asp:Label>
                </td>
                <td class="auto-style2L" style="float:left;width:10%">
                                    <asp:Button ID="RsAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示全部" Width="100px" OnClick="RsAll_Click" />
                                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource4" GridLines="None" 
                                        Width="100%" ForeColor="#333333" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField  ItemStyle-CssClass="button">
                                                <ItemTemplate >
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Detail" Font-Names="微軟正黑體"   Font-Size="Medium" Text="編修工料項目" CommandArgument='<%# Container.DataItemIndex%>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="PriceId" Text='<%# Bind("PriceId") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ItemName" HeaderText="資源名稱" SortExpression="ItemName" />
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit">
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="AnaBtn" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="單價分析" CommandName="analyst" CommandArgument='<%# Container.DataItemIndex%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CPrice" HeaderText="合約單價" SortExpression="CPrice" />
                                            <asp:BoundField DataField="EPrice" HeaderText="執行單價" SortExpression="EPrice" />
                                            <asp:BoundField DataField="CAmount" HeaderText="合約工程用量" SortExpression="CAmount" />
                                            <asp:BoundField DataField="EAmount" HeaderText="執行工程用量" SortExpression="EAmount" />
                                            <asp:BoundField DataField="Notes" HeaderText="備註" SortExpression="Notes" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"  DeleteCommand="DELETE FROM [Pro_Resource] WHERE [PriceID] = @PriceID" 
                                        InsertCommand="INSERT INTO [Pro_Resource] ([Pid], [ItemName], [Unit], [Code], [Complex], [AnaNumber], [RFQ_Code], [CPrice], [EPrice], [CAmount], [EAmount], [Notes], [ItemKind], [ResourceNY]) VALUES (@pid, @ItemName, @Unit, @Code, @Complex, @AnaNumber, @RFQ_Code, @CPrice, @EPrice, @CAmount, @EAmount, @Notes, @ItemKind, @ResourceNY)"                                       
                                        UpdateCommand="UPDATE [Pro_Resource] SET [PID] = @PID, [ItemName] = @ItemName, [Unit] = @Unit, [Code] = @Code, [Complex] = @Complex, [AnaNumber] = @AnaNumber, [RFQ_Code] = @RFQ_Code, [CPrice] = @CPrice, [EPrice] = @EPrice, [CAmount] = @CAmount, [EAmount] = @EAmount, [Notes] = @Notes, [ItemKind] = @ItemKind, [ResourceNY] = @ResourceNY WHERE [PriceID] = @PriceID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PID" Type="Int32" />
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="RFQ_Code" Type="String" />
                                            <asp:Parameter Name="CPrice" Type="Decimal" />
                                            <asp:Parameter Name="EPrice" Type="Decimal" />
                                            <asp:Parameter Name="CAmount" Type="Decimal" />
                                            <asp:Parameter Name="EAmount" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                            <asp:Parameter Name="ResourceNY" Type="Int32" />
                                        </InsertParameters>                                       
                                        <UpdateParameters>
                                            <asp:Parameter Name="PID" Type="String" />
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="RFQ_Code" Type="String" />
                                            <asp:Parameter Name="CPrice" Type="Decimal" />
                                            <asp:Parameter Name="EPrice" Type="Decimal" />
                                            <asp:Parameter Name="CAmount" Type="Decimal" />
                                            <asp:Parameter Name="EAmount" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                            <asp:Parameter Name="ResourceNY" Type="Int32" />
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    </td>
            </tr>
            </table>
            </div>
        <asp:Panel ID="Pnl_Edit" runat="server" Visible="False" DefaultButton="EdConfirm">
        <table class="auto-style67"  style="border-color:transparent" border="1" >
            <tr style="background-color:transparent;border:1px">
                <td class="auto-style2L" colspan="6">
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton4" runat="server">工料項目編修</asp:LinkButton>
                </td>
            </tr>
                            <tr>
                                <td class="auto-style33" style="width:10%">工料種類</td>
                                <td class="auto-style36" style="width:15%">
                                    <asp:DropDownList ID="DDL_RsKind1" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="100%" >
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                      <asp:ListItem >拆工拆料項</asp:ListItem>
                                        <asp:ListItem >連工帶料項</asp:ListItem>                   
                                        <asp:ListItem >材料</asp:ListItem>
                                        <asp:ListItem >機具</asp:ListItem>
                                        <asp:ListItem >人力</asp:ListItem>
                                        <asp:ListItem >雜項</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33" style="width:10%">工料名稱</td>
                                <td class="auto-style36" style="width:35%">
                                    <asp:TextBox ID="TxRSName" runat="server" Font-Size="Medium" Height="25px" Width="90%"></asp:TextBox>
                                </td>
                                <td class="auto-style33" style="width:10%">單位</td>
                                <td class="auto-style36" style="width:5%">
                                    <asp:DropDownList ID="DDL_EdUnit" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" DataSource='<%# Utility.Unitlist.UnitList() %>' Width="100%">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    <table class="auto-style67" style="width:100%; border-color:transparent; vertical-align:middle" border="1"  >
                        <tr>
                            <td class="auto-style33" style="width:10%">資源編碼</td>
                            <td class="auto-style36" style="width:10%">
                                <asp:TextBox ID="TxCode1" runat="server" Font-Size="Medium" Height="25px" Width="80%"  ></asp:TextBox>
                            </td>
                            <td class="auto-style33" style="width:15%">備註</td>
                            <td class="auto-style36" style="width:7%">
                                <asp:TextBox ID="TxNote" runat="server" Font-Size="Medium" Height="25px"  ></asp:TextBox>
                            </td>
                            <td class="auto-style36" style="width:20%">
                                <%--<asp:Button ID="Add_anl" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="增加/刪除單價分析" OnClientClick="window.open('AnalysisBEdit.aspx', 'window', config='height=1000,width=1500');" Width="100%"/>--%>
                            </td>
                            <td class="auto-style36" style="width:45%"> 
                                <asp:Button ID="EdConfirm" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="確定修改"  OnClick="EdConfirm_Click" />
                                &nbsp;
                                <asp:Button ID="EdDelete" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除此項目"  OnClick="EdDelete_Click" />
                                &nbsp;
                                <asp:Button ID="EdEnd" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="結束" OnClick="EdEnd_Click" />
                            </td>
                        </tr>
            </table>
                    </asp:Panel>
                
        <br />
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="SELECT PriceID, PID, ItemName, Unit, Code, Complex, AnaNumber, RFQ_Code, CPrice, EPrice, CAmount, EAmount, Notes, ItemKind, ResourceNY FROM Pro_Resource WHERE (Pid = @Pid) ORDER BY PriceID DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PID" SessionField="Pid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    
    </div>

</body>
</html>


    </asp:Content>
