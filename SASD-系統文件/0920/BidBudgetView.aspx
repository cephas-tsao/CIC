<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidBudgetView.aspx.cs" MasterPageFile="Site1.Master" Inherits="IMS.WebControl.BidBudgetView" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/BidBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>專案管理模組-投標預算檢視</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />  
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
	background-color: #000079;
	text-align: center;
	color: #FFFFFF;
}
        .auto-styleA {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 30px;
        }
            .auto-styleB {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
        }
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #97CBFF;
                text-align: right;
                color: #000000;
                height: 33px;
            }
            


        /*.Table1 {
            width: 92%;
            padding-left:200px;
            border-collapse:collapse;
        }*/
/*.TableTop {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: gold;
	text-align: center;
	color: #000000;
}*/
        .auto-style46 {
            width: 37px;
            }
        


            .auto-style91 {
            width: 45px;
        }
                


        .TableSingle {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: aliceblue;
	color: #000000;
}
                        


        .autoLeft{
         text-align:left;
           height:100%;
           line-height:100%;          
           vertical-align:middle;
           padding-left:5px;            
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
        .auto-style92 {
            height: 28px;
            text-align: center;
            width: 45px;
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
                

        .auto-style93 {
            height: 39px;
            text-align: center;
            width: 45px;
        }
                        

        .auto-style54 {
            width: 33px;
        }
        .autoCenter {
            text-align: center;
        }
            .auto-style84 {
	width: 37px;
	text-align: center;
}
            .autoRight{
           text-align:right;
        }
        
        .autoRight{
           text-align:center;
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
                .itemframe {
	        border-right-width:0px;
            border-collapse:collapse;
            border-right-style:none;
        } 
            </style>
  <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <div>
 <%--   <link rel="stylesheet" type="text/css" href="./css/Style1.css" />--%> 
	<table style="width: 100%">
		<tr>
		<td class="TableFun1C">請選擇標案</td>
		<td class="auto-styleB">
		<asp:DropDownList id="DDL_BidSelect" runat="server" Height="50px" Width="300px" Font-Size="Medium" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BidName" DataValueField="BID" OnSelectedIndexChanged="DDL_BidSelect_SelectedIndexChanged">
            <asp:ListItem>-請選擇-</asp:ListItem>
		</asp:DropDownList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT DISTINCT Bid_WBS.BID, BidM0.BidName FROM BidM0 INNER JOIN Bid_WBS ON BidM0.BID = Bid_WBS.BID ORDER BY Bid_WBS.BID DESC"></asp:SqlDataSource>
		<span class="TableFun2L">(必選)</span></td>
		</tr>
        </table>
        <asp:Panel ID="Pnl_ALL" runat="server" Visible="False">
        
        <table class="Table100">
        <tr>
			<td class="TableTop" colspan="7">投標預算檢視</td>
		</tr>
		<tr>
		<td class="TableFun1C">
                                原標單總價</td>
		    <td class="TableFun2C">
                <asp:Label ID="OTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}"></asp:Label>
            </td>
            <td class="TableFun1C">校核後總價</td>
            <td class="TableFun2C">
                <asp:Label ID="CTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
            <td class="TableFun1C">投標預算總價</td>
            <td class="TableFun2C">
                <asp:Label ID="BTotal" runat="server" Font-Bold="True" Font-Names="微軟正黑體" ForeColor="Red" Format="{0:N4}" ></asp:Label>
            </td>
		<td class="TableFun1C">
                                <asp:Button ID="Display" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Display_Click" Text="顯示缺漏項" Width="100px" />
                                &nbsp;</td>
		</tr>
		    <tr>
                <td class="TableFun1L" colspan="7">選擇顯示階層：<asp:DropDownList ID="DDL_LayerSelect" runat="server" AutoPostBack="True" CssClass="DDLshort">
                    <asp:ListItem Value="3">3(ALL)</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
		</table>
                        <table border="1" class="Sht100" style="width: 100%">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC" colspan="<%=LbLayerNum %>" rowspan="2">項次</td>
                                <td class="ShtCellCC" rowspan="2">工項名稱</td>
                                <td class="ShtCellCC" rowspan="2">單位</td>
                                <td class="ShtCellCC" rowspan="2">單價分析</td>
                                <td class="ShtCellCC" colspan="3">原標單</td>
                                <td class="ShtCellCC" colspan="2">校核後</td>
                                <td class="ShtCellCC" colspan="3">投標預算</td>
                                <td class="ShtCellCC">&nbsp;</td>
                            </tr>
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">數量</td>
                                <td class="ShtCellCC">單價</td>
                                <td class="ShtCellCC">複價</td>
                                <td class="ShtCellCC">備註</td>
                            </tr>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                       
                        </table>
            </asp:Panel>
    </div>

        </asp:Content>