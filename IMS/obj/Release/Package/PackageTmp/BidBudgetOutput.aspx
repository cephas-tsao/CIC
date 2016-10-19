<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidBudgetOutput.aspx.cs" Inherits="IMS.BidBudgetOutput" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-投標預算檢視</title>
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
    <style type="text/css">

            .auto-style85 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
        }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
            }



            .auto-style6 {
	font-size: small;
	color: #FF0000;
}
        
.auto-style1 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #800000;
	text-align: center;
	color: #FFFFFF;
}
        .auto-styleB {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
        .auto-styleA {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 30px;
        }
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: right;
                color: #000000;
                height: 33px;
            }
          .Table2 {
            width: 85%;
            padding-left:200px;
            border-collapse:collapse;
        }   


        .Table1 {
            width: 100%;

            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
        .auto-style46 {
            width: 37px;
            }
        


        .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
        .autoRight{
           text-align:center;
        }
                


        .autoLeft{
           text-align:left;
        }
        .auto-style83 {
	height: 28px;
	text-align: center;
}
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style79 {
            height: 28px;
        }
        .TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
                

        .auto-style77 {
            height: 39px;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
}
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

        .auto-style54 {
            width: 33px;
        }
        .auto-style84 {
	width: 37px;
	text-align: center;
}
            .autoRight{
           text-align:right;
        }
        
        .auto-style43 {
            width: 37px;
        }
                

            .auto-style88 {
            width: 3px;
            height: 39px;
        }
        .auto-style89 {
            width: 37px;
            text-align: center;
            height: 39px;
        }
            .TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
            .auto-style91 {
            width: 45px;
        }
        .auto-style92 {
            height: 28px;
            text-align: center;
            width: 45px;
        }
        .auto-style93 {
            height: 39px;
            text-align: center;
            width: 45px;
        }
        .autoCenter {
            text-align: center;
        }
            .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
            </style>
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
       
	<table style="width: 100%; padding-left:200px ">
		<tr>
		<td class="auto-style85">請選擇標案</td>
		<td class="auto-style16">
		<asp:DropDownList id="DDL_BidSelect" runat="server" Height="50px" Width="300px" Font-Size="Medium" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged">
            <asp:ListItem Value="0">-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="SELECT DISTINCT Bid_WBS.BID, BidM0.BidName FROM BidM0 INNER JOIN Bid_WBS ON BidM0.BID = Bid_WBS.BID ORDER BY Bid_WBS.BID DESC"></asp:SqlDataSource>
		<span class="auto-style6">(必選)</span></td>
		</tr>
        </table>
        <asp:Panel ID="Pnl_ALL" runat="server" Visible="False" CssClass="Table2">
        
        <table style="width: 100%">
        <tr>
			<td class="auto-style1" colspan="7">投標預算合計匯出</td>
		</tr>
		<tr>
		<td class="auto-styleA">
                                原標單總價</td>
		    <td class="auto-styleB">
                <asp:Label ID="OTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="auto-styleA">校核後總價</td>
            <td class="auto-styleB">
                <asp:Label ID="CTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="auto-styleA">投標預算總價</td>
            <td class="auto-styleB">
                <asp:Label ID="BTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}"></asp:Label>
            </td>
		<td class="auto-style15">
                                <asp:Button ID="Display" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Display_Click" Text="顯示缺漏項" Width="100px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button16" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="投標預算重新總計" OnClick="Button16_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button17" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="匯出EXCEL" Width="100px" OnClick="Button17_Click" />
                            &nbsp;&nbsp;
                                </td>
		</tr>
		</table>
            
                        <table border="1" class="Table1">
                            <tr class="TableTop">
                                <td class="auto-style45" colspan="<%=LbLayerNum %>" rowspan="2">項次</td>
                                <td class="auto-style45" rowspan="2">工項名稱</td>
                                <td class="auto-style45" rowspan="2">單位</td>
                                <td class="auto-style46" rowspan="2">單價分析</td>
                                <td class="auto-style45" colspan="3">原標單</td>
                                <td class="auto-style45" colspan="2">校核後</td>
                                <td class="auto-style45" colspan="3">投標預算</td>
                                <td class="auto-style45">&nbsp;</td>
                            </tr>
                            <tr class="TableTop">
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">單價</td>
                                <td class="auto-style45">複價</td>
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">複價</td>
                                <td class="auto-style45">數量</td>
                                <td class="auto-style45">單價</td>
                                <td class="auto-style45">複價</td>
                                <td class="auto-style45">備註</td>
                            </tr>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                       
                        </table>
            </asp:Panel>
    </div>



    </asp:Content>
