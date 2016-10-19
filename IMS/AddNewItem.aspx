<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewItem.aspx.cs" Inherits="IMS.AddNewItem" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
   
    <script type="text/javascript">
     
         function addLayerCode() {

             $.ajax({
                 type: "POST",

                 url: '../Ajax/AddLayerCode.aspx?action=addsave',

                 //data: { "uid": uid },

                 dataType: 'text',

                 //success: function (UpdtItemOrder) {

                 //    $.ajax({
                 //        type: "POST",

                 //        url: '../Ajax/UpdateBidItemOrder.aspx?action=addsave',

                 //        //data: { "uid": uid },

                 //        dataType: 'text',

                 success: function (msg) {

                     alert("更新成功");

                 }
             })
         }
        function addLayerCode1() {

            $.ajax({
                type: "POST",

                url: '../Ajax/AddLayerCode.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function (UpdtItemOrder) {

                    $.ajax({
                        type: "POST",

                        url: '../Ajax/UpdateBidItemOrder.aspx?action=addsave',

                        //data: { "uid": uid },

                        dataType: 'text',

                        success: function (msg) {

                            alert("更新成功");

                        }
                    })
                }
            })
        }

    </script>

    <style type="text/css">

     
        .auto-style75 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            height: 24px;
        }
        


        .auto-style63 {
            width: 100%;
            vertical-align:central;
            border:dashed;
        }
     
        .auto-style64 {
            width: 35%;
            vertical-align:central;
        }
        .auto-style65 {
            width: 15%;
            vertical-align:central;
        }
                    
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
.auto-style11 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #666699;
	text-align: center;
	color: #FFFFFF;
}
            .auto-style76 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #BB3D00;
            text-align: center;
            color: #FFFFFF;
            height: 27px;
        }
       
            </style>
</head>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 100%">
                <tr>
                    <td class="TableTop">插入缺漏項</td>
                </tr>
            </table>
        <asp:Panel ID="Pnl_WBS" runat="server" >
            
            <table style="width: 100%">
                <tr>
                    <td class="auto-style11" colspan="5">WBS缺漏項插補</td>
                </tr>
                <tr>
                    <td class="Table1" style="width:150px">插補位置<br /> (原工項之後)</td>
                    <td class="Table2" colspan="3">
                        <asp:DropDownList ID="DDLItemName" AppendDataBoundItems="True" runat="server"  Font-Size="Medium" Height="30px" Width="300px" ><%--DataSourceID="SqlDataSource1" DataTextField="FullName" DataValueField="UID"--%>
                            <asp:ListItem>-請選擇-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>
                    </td>
                    <td class="Table1" rowspan="2">
                        <asp:Button ID="AddLoss" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" OnClick="AddLoss_Click" />
                        <br />
                        <asp:Button ID="BtnClose" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="關閉視窗" Width="100px" OnClick="BtnClose_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1">缺漏項名稱</td>
                    <td class="Table2">
                        <asp:TextBox ID="TxItemLoss" runat="server" Width="500px" Height="30px"></asp:TextBox>
                        <%--<asp:Label ID="Label7" runat="server" Text="缺漏項工項名稱" Width="200px"></asp:Label>--%>
                    </td>
                    <td class="Table1">單位</td>
                    <td class="Table2">
                        <%--<asp:Label ID="Label6" runat="server" Text="缺漏項單位"></asp:Label>--%>
                          <asp:DropDownList ID="DDL_EdUnit" DataSource='<%# Utility.Unitlist.UnitList() %>'  runat="server" Font-Names="微軟正黑體" Font-Size="Medium"></asp:DropDownList>
                    </td>
                
                </tr>
            </table>
        </asp:Panel>
    
        <asp:Panel ID="Pnl_Analysis" runat="server" Visible="true">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style11"" colspan="7">單價分析表缺漏項插補</td>
                </tr>
                <tr>
                    <td class="Table1">父項名稱</td>
                    <td class="Table2" colspan="3">
                        <asp:Label ID="LbName" runat="server"  Width="200px"></asp:Label>
                    </td>
                    <td class="Table1">單位</td>
                    <td class="Table2">
                        <asp:Label ID="LbUnit" runat="server" ></asp:Label>
                    </td>
                    <td class="Table1" rowspan="2">
                        <asp:Button ID="InsertLoss" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px"  OnClick="InsertLoss_Click"/>
                        <br />
                        <asp:Button ID="Button27" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="關閉視窗" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1">缺漏項名稱</td>
                    <td class="Table2">
                        <asp:Label ID="LbPrice" runat="server"  Width="200px"></asp:Label>
                        <asp:Label ID="LossName" runat="server"  Width="200px"></asp:Label>
                    </td>
                    <td class="Table1">單位</td>
                    <td class="Table2">
                        <asp:Label ID="LossUnit" runat="server"></asp:Label>
                    </td>
                    
                    <td class="Table2" colspan="2">
                        <asp:Label ID="LossComplex" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                                        <asp:Panel ID="Pnl_Import" runat="server">
                                            <table class="Table100">
                                                <tr>
                                                    <td class="auto-style11">標案專屬工料資料庫</td>
                                                </tr>
                                                <tr>
                                                    <td class="Table2">
                                                        <table class="auto-style63">
                                                            <tr>
                                                                <td class="Table1" rowspan="2">搜<br /> 尋</td>
                                                                <td class="auto-style64">工項種類</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                     <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                                        <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                                        <asp:ListItem Value="OR">或</asp:ListItem>
                                                                        <asp:ListItem Value="and NOT">非</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">工項名稱(關鍵字)</td>
                                                                <td class="auto-style65" rowspan="2">
                                                                  <asp:Button ID="BtnSearch" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" OnClick="BtnSearch_Click" />
                                                                    <br />
                                                                    <asp:Button ID="BtnAll" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" OnClick="BtnAll_Click"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style64">
                                                                  <asp:DropDownList ID="DDL_WBS" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                                        <asp:ListItem Value="0">不分類</asp:ListItem>
                                                                        <asp:ListItem Value="X">工項</asp:ListItem>
                                                                        <asp:ListItem Value="M">材料</asp:ListItem>
                                                                        <asp:ListItem Value="E">機具</asp:ListItem>
                                                                        <asp:ListItem Value="L">人力</asp:ListItem>
                                                                        <asp:ListItem Value="W">雜項</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="auto-style64">
                                                                    <asp:TextBox ID="TxSearch" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                                                            DataKeyNames="PriceID" DataSourceID="SqlDataSource2" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand" >
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                                    <ItemTemplate>
                                                                             <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="插入工項" CommandArgument='<%# Container.DataItemIndex%>' />                                                                        
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                 <asp:TemplateField Visible="false">
                                                                    <ItemTemplate>                                                                  
                                                                      <asp:Label ID="PriceID" runat="server" Text='<%# Bind("PriceID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="工項名稱">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>                                                              
                                                                <asp:TemplateField HeaderText="單位">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Unit" runat="server" Text='<%# Bind("Unit") %>' ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="資源編碼">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Code" runat="server" Text='<%# Bind("Code") %>' ></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                              
                                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                                            
                                                                <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                            
                                                                <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                                                <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="Complex" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Complex" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Text="查詢單價分析"  CommandArgument='<%# Container.DataItemIndex %>'
                                                                            Visible='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? true:false %>'  CommandName="analyst"/>
                                                                    </ItemTemplate>
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
                                        </asp:Panel>
    
    </div>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="BID" SessionField="BID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
    </form>
</body>
</html>
