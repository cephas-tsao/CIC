<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="BidBudgetQEdit.aspx.cs" Inherits="IMS.BidBudgetQEdit" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標案專屬工料資料庫</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
    <%--   //隱藏TR
        function hide_tr() {
            //alert("缺漏項即將隱藏");
            var str = "<%= SQLString %>";
            var k = str.split(",");//k不指定型態
            var result_style = document.getElementById(k[i]).style;
            result_style.display = 'TableDouble';
            document.getElementById(k[i]).className = "TableSingle";
        }
        //顯示TR
        function show_tr() {
          
            var str = "<%= SQLString %>";
            var k = str.split(",");//k不指定型態
        
            for (var i = 0; i < k.length; i++) {
         
                var result_style = document.getElementById(k[i]).style;
                result_style.display = 'table-row';
                document.getElementById(k[i]).className = "TableNew";
            }
        }--%>
    
    <style type="text/css">



        .Table1 {
            width: 93%;
            padding-left:220px;
            border-collapse:collapse;
        }
.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}
.TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
.TableDouble {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: white;
	color: #000000;
}
.TableNew {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FF5809;
	color: #000000;
}
        .auto-style45 {
        }
        .auto-style46 {
            width: 37px;
            height: 46px;
        }
        


        .autoLeft{
           text-align:left;
        }
        .autoCenter{
           text-align:center;
        }
        .autoRight{
           text-align:right;
        }
        
        .auto-style43 {
            width: 37px;
        }
                

        .auto-style77 {
            height: 39px;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
                

        .auto-style55 {
        }
        .auto-style54 {
            width: 33px;
        }
        .LabelC {
            text-align:center;
            vertical-align:central;
        }
        .auto-style79 {
            height: 28px;
        }
        .auto-style81 {
            width: 37px;
            height: 28px;
        }
        .auto-style82 {
	height: 39px;
	text-align: center;
}
.auto-style83 {
	height: 28px;
	text-align: center;
}
.auto-style84 {
	width: 37px;
	text-align: center;
}
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: right;
                color: #000000;
                height: 33px;
            }
            .auto-style15L {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: left;
                color: #000000;
                height: 33px;
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
            .auto-style85 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
        }
            .auto-style86 {
            width: 3px;
            height: 23px;
        }
        .auto-style87 {
            height: 23px;
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
        .auto-style90 {
            text-align: right;
            height: 39px;
        }
          .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
            </style>

<body>
     <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
    
	<table style="width: 100%;padding-left:220px">
		<tr>
		<td class="auto-style85">請選擇標案</td>
		<td class="auto-style16">
		<asp:DropDownList id="DDL_BidSelect" runat="server" Height="50px" Width="300px" Font-Size="Medium" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged">
            <asp:ListItem>-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT DISTINCT Bid_WBS.BID, BidM0.BidName FROM BidM0 INNER JOIN Bid_WBS ON BidM0.BID = Bid_WBS.BID ORDER BY Bid_WBS.BID DESC"></asp:SqlDataSource>
		<span class="auto-style6">(必選)</span></td>
		</tr>
        </table>
        <asp:Panel ID="Pnl_ALL" runat="server" Visible="False" CssClass="Table1">
        
        <table style="width: 93%; ">
        <tr>
			<td class="auto-style1" colspan="2">投標預算數量編修</td>
		</tr>
		<tr>
		<td class="auto-style15L">
                                &nbsp;&nbsp;
                                <asp:Button ID="Display" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="顯示缺漏項" Width="100px" OnClick="Display_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Insert" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="插補缺漏項" Width="100px" OnClick="Button18_Click" />
                                &nbsp;&nbsp;
                                <asp:Button ID="Button20" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" />
                                </td>
		<td class="auto-style15">
                                <asp:Button ID="Save" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="儲存修改" Width="100px" OnClick="Save_Click" />
                            &nbsp;&nbsp;
                                <asp:Button ID="Recovery" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="回復原值" Width="100px" OnClick="Recovery_Click" />
                            &nbsp;&nbsp;
                                </td>
		</tr>
		</table>
                        <table id="table1" border="1" class="Table1" style="padding-left:220px">
                            <tr class="TableTop">
                                <td class="auto-style45" colspan="<%=LbLayerNum %>">項次</td>
                                <td class="auto-style45">工項名稱</td>
                                <td class="auto-style45">單位</td>
                                <td class="auto-style46">單價分析</td>
                                <td class="auto-style45">原標單數量</td>
                                <td class="auto-style45">校核後數量</td>
                                <td class="auto-style45">備註</td>
                            </tr>
                            <asp:PlaceHolder ID="PlaceHolder2" runat="server"  ></asp:PlaceHolder>
                       
                        </table>
            </asp:Panel>
    </div>
  
</body>
    </asp:Content>