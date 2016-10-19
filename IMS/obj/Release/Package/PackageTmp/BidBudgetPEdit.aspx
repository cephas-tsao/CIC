<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidBudgetPEdit.aspx.cs" Inherits="IMS.BidBudgetPEdit1" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案管理模組</title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
    //隱藏TR
    function hide_tr() {
        //alert("缺漏項即將隱藏");
        var str = "<%= ShowString %>";
          var k = str.split(",");//k不指定型態
          for (var i = 0; i < k.length; i++) {
              var result_style = document.getElementById(k[i]).style;
              //result_style.display = 'TableDouble';
              result_style.display = 'none';
              //document.getElementById(k[i]).className = "TableSingle";
          }
      }
      //顯示TR
      function show_tr() {

          var str = "<%= ShowString %>";
            var k = str.split(",");//k不指定型態

            for (var i = 0; i < k.length; i++) {

                var result_style = document.getElementById(k[i]).style;
                result_style.display = 'table-row';
                document.getElementById(k[i]).className = "TableNew";
            }
        }


</script>
       <Area:MemberBoxUC ID="MemberBox" runat="server" />    
       <div style="width: 90%;padding-left:200px">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>       
    <table class="Table100" >
            <tr>
                <td class="TableTop" colspan="4">投標預算建置編修</td>
            </tr>
            <tr>
                <td class="Table0" colspan="4">單價填列</td>
            </tr>
            <tr>
                <td class="Table1L">&nbsp;
                                    <asp:ImageButton ID="IBtn_PriceFill" runat="server" Height="30px" ImageUrl="~/img/WorkItem.png" ToolTip="前往工項編輯" Width="27px"  OnClick="IBtn_PriceFill_Click" />
                                &nbsp;
                                    <asp:ImageButton ID="Display" runat="server" Height="30px" ImageUrl="~/img/UnSee.png" ToolTip="顯示缺漏項(目前隱藏)" Width="27px" OnClick="Display_Click" />
                                </td>
                <td class="Table1R">
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" OnClick="Save_Click"/>
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" OnClick="Recovery_Click" />
                                    &nbsp;&nbsp;
                                </td>
                <td width="80px" class="Table1">選擇標案</td>
                <td width="300px" class="Table2CC">
		<asp:DropDownList id="DDL_BidSelect" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged" AutoPostBack="true">
		  <asp:ListItem Value="0">-請選擇-</asp:ListItem>
        </asp:DropDownList>
                                </td>
            </tr>
        </table>
            
                        <table class="Sht100" >
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">資源編碼</td>
                                <td class="ShtCellCC">資源名稱</td>
                                <td class="ShtCellCC">單位</td>
                                <td class="ShtCellCC">原標單<br /> 工程用量</td>
                                <td class="ShtCellCC">校核後<br /> 工程用量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC" colspan="2">調整後單價</td>
                                <td class="ShtCellCC">詢報價作業</td>
                            </tr>
                        
                                 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
                                <ItemTemplate>
                            <tr class="ShtRowSingle" id="trID" runat="server">                                 
                                <td class="ShtCellCL">
                                <%--    <asp:Label ID="Label87" runat="server" Font-Names="微軟正黑體" Height="25px" Text="0155682024"></asp:Label>--%>
                                      <asp:Label ID="PriceID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                    <asp:Label ID="RFQ_Code" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                    <asp:Label ID="UID" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>

                                    <asp:Label ID="NewItem" runat="server" Font-Names="微軟正黑體" Height="25px" Visible="false"></asp:Label>
                                    <asp:Label ID="LbCode" runat="server" Font-Names="微軟正黑體" Height="25px"></asp:Label>
                                </td>
                                <td class="ShtCellCL">
                                  <asp:Label ID="LbItemName" runat="server" Font-Names="微軟正黑體" Height="25px" ></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                      <asp:Label ID="LbUnit" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                       <asp:Label ID="LbAmount" runat="server" Font-Names="微軟正黑體" ></asp:Label>
                                </td>
                                <td class="ShtCellCR">
                                        <asp:Label ID="LbCAmount" runat="server" Font-Names="微軟正黑體"></asp:Label>
                                </td>
                                <td class="ShtCellCC">
                                  
                                      <asp:TextBox ID="TxPrice" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="ShtCellCR">
                                       <asp:Label ID="LbAPrice" runat="server" Font-Names="微軟正黑體"></asp:Label></td>
                                <td class="ShtCellCC">
                                         <asp:ImageButton ID="ImageButtonCal" runat="server" Height="30px" ImageUrl="~/img/Calculate.jpg" Width="30px" ToolTip="新增詢價單" CommandName="require"  CommandArgument='<%# Container.ItemIndex%>' /></td>
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="ImageButtonAdd" runat="server" Height="30px" ImageUrl="~/img/PAsk.jpg" Width="30px" ToolTip="新增詢價單" CommandName="add" CommandArgument='<%# Container.ItemIndex%>' />
                                    <asp:ImageButton ID="ImageButtonReQ" runat="server" Height="30px" ImageUrl="~/img/Q1.png" ToolTip="查詢詢報價作業" Width="27px" CommandName="ReQ" CommandArgument='<%# Container.ItemIndex%>' />
                                </td>
                            </tr>
                                              </ItemTemplate>
                                </asp:Repeater>
                      
                        </table>
            <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>
    </div>
    </asp:Content>
