<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="Site1.Master" CodeBehind="BidImport.aspx.cs" Inherits="IMS.BidImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>標單匯入</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>標單匯入</title>
    <style type="text/css">
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
}
.auto-style4 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
	color: #000000;
}
.auto-style5 {
	text-align: center;
}


.auto-style6 {
	font-size: small;
	color: #FF0000;
}
.auto-style7 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
	vertical-align:top;
	color: #000000;
}



.auto-style8 {
	color: #FF0000;
}
.auto-style11 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #BB3D00;
	text-align: center;
	color: #FFFFFF;
}
.auto-style13 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFAF60;
	text-align: center;
	color: #000000;
}
.auto-style14 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFE4CA;
	text-align: left;
	color: #000000;
}

.auto-style31 {
	font-family: 微軟正黑體;
	font-size: large;
	background-color: #64A600;
	text-align: center;
	color: #FFFFFF;
}
.auto-style33 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #B7FF4A;
	text-align: center;
	color: #000000;
}
.auto-style34 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #E8FFC4;
	text-align: left;
	color: #000000;
}
.auto-styleD11 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #3A006F;
	text-align: center;
	color: #FFFFFF;
    width:50%;
}
.auto-styleD12 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #F1E1FF;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
.auto-styleD21 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #930000;
	text-align: center;
	color: #FFFFFF;
    width:50%;
}
.auto-styleD22 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFD2D2;
	text-align: center;
	color: #000000;
    width:50%;
    vertical-align:top;
}
            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                height: 33px;
            }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                height: 33px;
            }



            .auto-style22 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #BB3D00;
            text-align: center;
            color: #FFFFFF;
            height: 27px;
        }
.auto-style04 {
	font-family: 微軟正黑體;
	font-size: medium;
	background-color: #FFFBD6;
	text-align: left;
    vertical-align:top;
	color: #000000;
}



        .auto-style23 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            width: 195px;
        }

        .auto-style24 {
            width: 100%;
            border:ridge;
        }

        .Table1 {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        .Table2 {
            width: 100%;
            border-left:ridge;
            border-right:ridge;
        }
        .Table3 {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }



        .auto-style36 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 26px;
        }



        .auto-style37 {
            width: 27px;
        }
        .auto-style40 {
        }



        .auto-style43 {
            width: 37px;
        }
        .auto-style44 {
            width: 27px;
            height: 46px;
        }
        .auto-style45 {
            height: 46px;
        }
        .auto-style46 {
            width: 37px;
            height: 46px;
        }
        .auto-style48 {
            width: 27px;
            height: 39px;
        }
        .auto-style51 {
            width: 37px;
            height: 39px;
        }
        .auto-style54 {
            width: 33px;
        }
        .auto-style55 {
            width: 3px;
        }
.autoLeft{
           text-align:left;
        }


        .auto-style56 {
            height: 39px;
            width: 8px;
        }
        .auto-style57 {
            width: 8px;
        }
        

        .auto-style61 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #B7FF4A;
            text-align: center;
            color: #000000;
            height: 30px;
        }
        .auto-style62 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 30px;
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
        .auto-style66 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #3A006F;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style67 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #930000;
            text-align: center;
            color: #FFFFFF;
            width: 5%;
        }
        .auto-style68 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #E8FFC4;
            text-align: left;
            color: #000000;
            height: 26px;
            width: 21px;
        }
        .auto-style69 {
            font-family: 微軟正黑體;
            font-size: large;
            background-color: #64A600;
            text-align: center;
            color: #FFFFFF;
            height: 27px;
        }
        .auto-style77 {
            height: 39px;
        }
        .auto-style78 {
            text-align: left;
            height: 39px;
        }
        </style>


<body>
  
    <div>
    <br />
	<table style="width: 100%">
		<tr>
			<td colspan="2" class="auto-style1">業主標單建置</td>
		</tr>
		<tr>
		<td class="auto-style15">請選擇標案</td>
		<td class="auto-style16">
		<asp:DropDownList id="DropDownList3"  DataTextField="BidName" DataValueField="Bid" runat="server" Height="50px" Width="300px" Font-Size="Medium">
		</asp:DropDownList>
		<span class="auto-style6">(必選)</span></td>
               <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>   
             <asp:SqlDataSource ID="sqlEmployees" runat="server">
             <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="BidName" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
		</tr>
		<tr>
			<td class="auto-style3" style="height: 45px;">請選擇匯入格式</td>
			<td class="auto-style4" style="height: 45px">
			<asp:RadioButtonList id="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
				<asp:ListItem Value="0">逐項建置</asp:ListItem>
				<asp:ListItem Value="1">EXCEL(DIY)</asp:ListItem>
				<asp:ListItem Value="2">XML(PCCES)</asp:ListItem>
			</asp:RadioButtonList>
			</td>
			
		</tr>
       
		<tr>
			<td class="auto-style7" colspan="2">
			<asp:Panel id="Pnl_Build" runat="server" BorderColor="Maroon" BorderStyle="Solid" Visible="False">
				<table style="width: 100%">
					<tr>
						<td class="auto-style11">逐項建置</td>
					</tr>
				</table>
                <asp:Panel ID="Pnl_LayerSet" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td class="auto-style23">標單階層數</td>
                            <td class="auto-style4" colspan="2">
                                <asp:DropDownList ID="DDL_layer" runat="server" Font-Size="Medium" Height="30px" Width="155px" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style04" rowspan="3">說明：<br /> <span class="auto-style8">&quot;獨立編號&quot;</span>是依照您所設定的各階層編號直接獨立來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：一, 二, 三,...<br /> 第三階：1, 2, 3,...<br /> ...以此類推<br /> <span class="auto-style8">&quot;組合編號&quot;</span>則是依照您所設定的各階層編號，以累加方式來做項次編號使用，範例如下：<br /> 第一階：壹, 貳, 參,...<br /> 第二階：壹.一, 壹.二, 壹.三,...<br /> 第三階：壹.一.1, 壹.一.2, 壹.一.3,...<br /> ...以此類推</td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="width: 195px">項次編號方式</td>
                            <td class="auto-style4" style="width: 186px; vertical-align:bottom">
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem Value="0">獨立編號</asp:ListItem>
                                    <asp:ListItem Value="1">組合編號</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="auto-style4" style="width: 315px; vertical-align:bottom">
                                <asp:Label ID="Label1" runat="server" Height="30px" Text="加入組合符號："></asp:Label>
                                <asp:DropDownList ID="DDL_symbol" runat="server" Font-Size="Medium" Height="30px" Width="50px">
                                    <asp:ListItem Value="1">.</asp:ListItem>
                                    <asp:ListItem Value="2">-</asp:ListItem>
                                    <asp:ListItem Value="3">,</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="width: 195px">項次編號設定</td>
                            <td class="auto-style4" colspan="2">
                                    
                                <table style="width: 100%">
                                    <asp:Panel ID="Panel1" runat="server">                                    
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    </asp:Panel>
                                  
                                     <%--  <tr>
                                        <td class="auto-style13">第一階</td>
                                        <td class="auto-style14">
                                            <asp:DropDownList ID="DDL_first" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px">
                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>--%>
                                  

                                 
                                   <%-- <tr>
                                        <td class="auto-style13">第二階</td>
                                        <td class="auto-style14">
                                            <asp:DropDownList ID="DDL_Second" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px">
                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style13">第三階</td>
                                        <td class="auto-style14">
                                            <asp:DropDownList ID="DDL_third" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px">
                                                <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>--%>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5" colspan="4">
                                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="30px" OnClick="Button1_Click" Text="階層及編號設定鎖定" Width="235px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
         
                
                <asp:Panel ID="Pnl_WBS" runat="server" HorizontalAlign="Center" Visible="False">
                    <table class="Table1">
                        <tr>
                            <td class="auto-style69" colspan="10">WBS新增項目</td>
                        </tr>
                        <tr>
                            <td class="auto-style61">階層</td>
                            <td class="auto-style62">
                                <asp:DropDownList ID="DDL_WBSlayer" runat="server" Font-Size="Medium" Height="30px" Width="155px" AutoPostBack="True">
                                <%--    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>--%>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style61">上層工項</td>
                            <td class="auto-style62">
                                <asp:DropDownList ID="DDL_TopWorkItem" runat="server" DataTextField="Item" DataValueField="UID" Font-Size="Medium" Height="30px" Width="155px">
                                 <%--   <asp:ListItem Value="1;1">一 假設工程</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="1;2">二 結構體工程</asp:ListItem>--%>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style61">項次</td>
                            <td class="auto-style62">
                                <asp:DropDownList ID="DDL_item" runat="server" Font-Size="Medium" Height="30px" Width="155px">
                               <%--     <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Selected="True">2</asp:ListItem>--%>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style62">&nbsp;</td>
                            <td class="auto-style62">&nbsp;</td>
                            <td class="auto-style61">項目屬性</td>
                            <td class="auto-style62">
                                <asp:DropDownList ID="DDL_attri" runat="server" Font-Size="Medium" AutoPostBack="True" Height="30px" Width="155px"  OnSelectedIndexChanged="DropDownList16_SelectedIndexChanged">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="1">主項大類</asp:ListItem>
                                    <asp:ListItem Value="2">工作項目</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="Table1">
                        <tr>
                            <td class="auto-style33">工項種類</td>
                            <td class="auto-style68">
                                <asp:DropDownList ID="DropDownList32" runat="server"  Enabled="False"  Font-Size="Medium" Height="30px" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" Width="155px">
                                    <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    <asp:ListItem Value="X">工項</asp:ListItem>
                                    <asp:ListItem Value="M">材料</asp:ListItem>
                                    <asp:ListItem Value="E">機具</asp:ListItem>
                                    <asp:ListItem Value="L">人力</asp:ListItem>
                                    <asp:ListItem Value="W">雜項</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style33">工項名稱</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TxWorkName"  Enabled="False" runat="server" Font-Size="Medium" Height="25px" Width="800px"></asp:TextBox>
                            </td>
                            <td class="auto-style33">工項備註</td>
                            <td class="auto-style36">
                                <asp:TextBox ID="TxNotes" runat="server" Font-Size="Medium" Height="25px" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="Pnl_NewItem" runat="server" Visible="False">
                        <table class="Table2">
                            <tr>
                                <td class="auto-style33">單位</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Height="25px" Width="50px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">數量</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Height="25px" Width="100px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">資源編碼</td>
                                <td class="auto-style34">
                                    <asp:TextBox ID="TxResource" runat="server" Font-Size="Medium" Height="25px" Width="150px"></asp:TextBox>
                                </td>
                                <td class="auto-style33">單價分析</td>
                                <td class="auto-style34">
                                    <asp:DropDownList ID="DropDownList31" runat="server" Font-Size="Medium" Height="30px" Width="155px" OnSelectedIndexChanged="DropDownList31_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>-請選擇-</asp:ListItem>
                                        <asp:ListItem Value="1">有下層單價分析</asp:ListItem>
                                        <asp:ListItem Value="0">無下層單價分析</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style33">
                                    <asp:Button ID="Button24" runat="server" Enabled="False" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" OnClick="Button24_Click" Text="單價分析" Width="100px" />
                                </td>
                            </tr>
                        </table>
                        <table class="Table2">
                            <tr>
                                <td class="auto-styleD11">標案專屬工料資料庫</td>
                                <td class="auto-styleD21">共用工料資料庫</td>
                            </tr>
                            <tr>
                                <td class="auto-styleD12">
                                    <table class="auto-style63">
                                        <tr>
                                            <td class="auto-style66" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style64">工項種類</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op1" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">工項名稱(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="Button17" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                <br />
                                                <asp:Button ID="Button19" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style64">
                                                <asp:DropDownList ID="DropDownList33" runat="server"  Font-Size="Medium" Height="30px" Width="155px">
                                                    <asp:ListItem Value="0">不分類</asp:ListItem>
                                                    <asp:ListItem Value="X">工項</asp:ListItem>
                                                    <asp:ListItem Value="M">材料</asp:ListItem>
                                                    <asp:ListItem Value="E">機具</asp:ListItem>
                                                    <asp:ListItem Value="L">人力</asp:ListItem>
                                                    <asp:ListItem Value="W">雜項</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">
                                                <asp:TextBox ID="TextBox22" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                  
                                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="PriceID" DataSourceID="SqlDataSource2" GridLines="None" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="代入工項" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                            <asp:BoundField DataField="ItemName" HeaderText="工項名稱" SortExpression="ItemName">
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
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
                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  DeleteCommand="DELETE FROM [Bid1DB_Library] WHERE [PriceID] = @PriceID" InsertCommand="INSERT INTO [Bid1DB_Library] ([ItemName], [Unit], [Type], [Code], [PccCode], [Complex], [AnaNumber], [Price], [BPrice], [ReferenceID], [CReferenceID], [ReferenceNumber], [CReferenceNumber], [Labor], [Equipment], [Material], [MisWork], [Notes], [NewItem], [ItemKind]) VALUES (@ItemName, @Unit, @Type, @Code, @PccCode, @Complex, @AnaNumber, @Price, @BPrice, @ReferenceID, @CReferenceID, @ReferenceNumber, @CReferenceNumber, @Labor, @Equipment, @Material, @MisWork, @Notes, @NewItem, @ItemKind)" SelectCommand="SELECT * FROM [Bid1DB_Library] ORDER BY [PriceID]" UpdateCommand="UPDATE [Bid1DB_Library] SET [ItemName] = @ItemName, [Unit] = @Unit, [Type] = @Type, [Code] = @Code, [PccCode] = @PccCode, [Complex] = @Complex, [AnaNumber] = @AnaNumber, [Price] = @Price, [BPrice] = @BPrice, [ReferenceID] = @ReferenceID, [CReferenceID] = @CReferenceID, [ReferenceNumber] = @ReferenceNumber, [CReferenceNumber] = @CReferenceNumber, [Labor] = @Labor, [Equipment] = @Equipment, [Material] = @Material, [MisWork] = @MisWork, [Notes] = @Notes, [NewItem] = @NewItem, [ItemKind] = @ItemKind WHERE [PriceID] = @PriceID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="PccCode" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="BPrice" Type="Decimal" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="CReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                            <asp:Parameter Name="CReferenceNumber" Type="String" />
                                            <asp:Parameter Name="Labor" Type="Decimal" />
                                            <asp:Parameter Name="Equipment" Type="Decimal" />
                                            <asp:Parameter Name="Material" Type="Decimal" />
                                            <asp:Parameter Name="MisWork" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="NewItem" Type="Int32" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ItemName" Type="String" />
                                            <asp:Parameter Name="Unit" Type="String" />
                                            <asp:Parameter Name="Type" Type="String" />
                                            <asp:Parameter Name="Code" Type="String" />
                                            <asp:Parameter Name="PccCode" Type="String" />
                                            <asp:Parameter Name="Complex" Type="Int32" />
                                            <asp:Parameter Name="AnaNumber" Type="Decimal" />
                                            <asp:Parameter Name="Price" Type="Decimal" />
                                            <asp:Parameter Name="BPrice" Type="Decimal" />
                                            <asp:Parameter Name="ReferenceID" Type="String" />
                                            <asp:Parameter Name="CReferenceID" Type="String" />
                                            <asp:Parameter Name="ReferenceNumber" Type="String" />
                                            <asp:Parameter Name="CReferenceNumber" Type="String" />
                                            <asp:Parameter Name="Labor" Type="Decimal" />
                                            <asp:Parameter Name="Equipment" Type="Decimal" />
                                            <asp:Parameter Name="Material" Type="Decimal" />
                                            <asp:Parameter Name="MisWork" Type="Decimal" />
                                            <asp:Parameter Name="Notes" Type="String" />
                                            <asp:Parameter Name="NewItem" Type="Int32" />
                                            <asp:Parameter Name="ItemKind" Type="String" />
                                            <asp:Parameter Name="PriceID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="auto-styleD22">
                                    <table class="auto-style63">
                                        <tr>
                                            <td class="auto-style67" rowspan="2">搜<br /> 尋</td>
                                            <td class="auto-style64">工項種類</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:DropDownList ID="DDL_Op2" runat="server" CssClass="DDLshort" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" Value="AND">且</asp:ListItem>
                                                    <asp:ListItem Value="OR">或</asp:ListItem>
                                                    <asp:ListItem Value="NOT">非</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">工項名稱(關鍵字)</td>
                                            <td class="auto-style65" rowspan="2">
                                                <asp:Button ID="Button18" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="搜尋" Width="71px" />
                                                <br />
                                                <asp:Button ID="Button20" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="ALL" Width="71px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style64">
                                                <asp:DropDownList ID="DropDownList34" runat="server" AutoPostBack="True" Font-Size="Medium" Height="30px" Width="155px">
                                                    <asp:ListItem Value="0">不分類</asp:ListItem>
                                                    <asp:ListItem Value="X">工項</asp:ListItem>
                                                    <asp:ListItem Value="M">材料</asp:ListItem>
                                                    <asp:ListItem Value="E">機具</asp:ListItem>
                                                    <asp:ListItem Value="L">人力</asp:ListItem>
                                                    <asp:ListItem Value="W">雜項</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="auto-style64">
                                                <asp:TextBox ID="TextBox23" runat="server" Font-Size="Medium" Height="25px" Width="160px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PriceID" DataSourceID="SqlDataSource3" Width="100%" PageSize="5">
                                        <Columns>
                                            <asp:TemplateField HeaderText="選取工項" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Font-Names="微軟正黑體" Font-Size="Small" Text="代入工項" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="PriceID" HeaderText="PriceID" InsertVisible="False" ReadOnly="True" SortExpression="PriceID" Visible="False" />
                                            <asp:BoundField DataField="PriceName" HeaderText="工項名稱" SortExpression="PriceName">
                                            <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Unit" HeaderText="單位" SortExpression="Unit" />
                                            <asp:TemplateField HeaderText="單價分析" SortExpression="Complex">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Complex") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Complex"))==1)? "有":"無" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" Visible="False" />
                                            <asp:BoundField DataField="Code" HeaderText="資源編碼" SortExpression="Code" />
                                            <asp:BoundField DataField="PccCode" HeaderText="PccCode" SortExpression="PccCode" Visible="False" />
                                            <asp:BoundField DataField="ReferenceID" HeaderText="ReferenceID" SortExpression="ReferenceID" Visible="False" />
                                            <asp:BoundField DataField="ReferenceNumber" HeaderText="ReferenceNumber" SortExpression="ReferenceNumber" Visible="False" />
                                        </Columns>
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                        <RowStyle BackColor="White" ForeColor="#330099" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"  DeleteCommand="DELETE FROM [PriceAnalysis] WHERE [PriceID] = @PriceID" InsertCommand="INSERT INTO [PriceAnalysis] ([PriceName], [Complex], [Price], [Unit], [Code], [ReferenceID], [ReferenceNumber]) VALUES (@PriceName, @Complex, @Price, @Unit, @Code, @ReferenceID, @ReferenceNumber)" SelectCommand="SELECT * FROM [PriceAnalysis] ORDER BY [PriceID]" UpdateCommand="UPDATE [PriceAnalysis] SET [PriceName] = @PriceName, [Complex] = @Complex, [Price] = @Price, [Unit] = @Unit, [Code] = @Code, [ReferenceID] = @ReferenceID, [ReferenceNumber] = @ReferenceNumber WHERE [PriceID] = @PriceID">
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
                        </table>
                    </asp:Panel>
                    <table class="Table3">
                        <tr>
                            <td>
                                <asp:Button ID="add" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="30px" Text="確定新增" Width="104px" OnClick="add_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button11" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="30px" Text="重新輸入" Width="104px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                WBS已建立之項目</td>
                        </tr>
                        <tr>
                            <td class="auto-style33">
                                <asp:Button ID="Button12" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="修改勾選項目" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button14" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="刪除勾選項目" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button13" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="取消勾選" Width="120px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button15" runat="server" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Text="WBS清空" Width="120px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="1" class="auto-style24">
                                    <tr class="auto-style33">
                                        <td class="auto-style44"></td>
                                        <td class="auto-style45" colspan="3">項次</td>
                                        <td class="auto-style45">工項名稱</td>
                                        <td class="auto-style45">單位</td>
                                        <td class="auto-style46">單價分析</td>
                                        <td class="auto-style45">數量</td>
                                        <td class="auto-style45">資源編碼</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="TextBox37" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">壹</asp:TextBox>
                                        </td>
                                        <td class="autoLeft">
                                            <asp:TextBox ID="TextBox8" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">發包工程費</asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td class="auto-style43">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style48">
                                            <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                                        </td>
                                        <td class="auto-style56"></td>
                                        <td class="auto-style77" colspan="2">
                                            <asp:TextBox ID="TextBox38" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="32px">一</asp:TextBox>
                                        </td>
                                        <td class="auto-style78">
                                            <asp:TextBox ID="TextBox10" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">假設工程</asp:TextBox>
                                        </td>
                                        <td class="auto-style77"></td>
                                        <td class="auto-style51"></td>
                                        <td class="auto-style77"></td>
                                        <td class="auto-style77"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            <asp:CheckBox ID="CheckBox3" runat="server" Text=" " />
                                        </td>
                                        <td class="auto-style57">&nbsp;</td>
                                        <td class="auto-style55">&nbsp;</td>
                                        <td class="auto-style54">
                                            <asp:TextBox ID="TextBox39" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">1</asp:TextBox>
                                        </td>
                                        <td class="autoLeft">
                                            <asp:TextBox ID="TextBox11" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">清除及掘除</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox13" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">M2</asp:TextBox>
                                        </td>
                                        <td class="auto-style43">
                                            <asp:ImageButton ID="ImageButton7" runat="server" Height="30px" ImageUrl="../img/Ana.jpg" Width="30px" OnClick="ImageButton7_Click" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox14" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">1680</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox48" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">00001</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            <asp:CheckBox ID="CheckBox4" runat="server" Text=" " />
                                        </td>
                                        <td class="auto-style57">&nbsp;</td>
                                        <td class="auto-style55">&nbsp;</td>
                                        <td class="auto-style54">
                                            <asp:TextBox ID="TextBox40" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">2</asp:TextBox>
                                        </td>
                                        <td class="autoLeft">
                                            <asp:TextBox ID="TextBox12" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">基地及路幅開挖，未含運費</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox15" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:TextBox>
                                        </td>
                                        <td class="auto-style43">
                                            <asp:ImageButton ID="ImageButton8" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" OnClick="ImageButton8_Click" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox16" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">8000</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox49" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">00002</asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            <asp:CheckBox ID="CheckBox5" runat="server" Text=" " />
                                        </td>
                                        <td class="auto-style57">&nbsp;</td>
                                        <td class="auto-style40" colspan="2">
                                            <asp:TextBox ID="TextBox42" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="32px">二</asp:TextBox>
                                        </td>
                                        <td class="autoLeft">
                                            <asp:TextBox ID="TextBox17" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">結構體工程</asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td class="auto-style43">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            <asp:CheckBox ID="CheckBox6" runat="server" Text=" " />
                                        </td>
                                        <td class="auto-style57">&nbsp;</td>
                                        <td class="auto-style55">&nbsp;</td>
                                        <td class="auto-style40">
                                            <asp:TextBox ID="TextBox41" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="18px">1</asp:TextBox>
                                        </td>
                                        <td class="autoLeft">
                                            <asp:TextBox ID="TextBox20" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="500px">構造物開挖，(含抽排水，依設計圖說計價線)</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox18" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="50px">B.M3</asp:TextBox>
                                        </td>
                                        <td class="auto-style43">
                                            <asp:ImageButton ID="ImageButton10" runat="server" Height="30px" ImageUrl="~/img/Ana.jpg" Width="30px" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox19" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">3250</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox50" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="25px" Width="100px">00003</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br/>
			</asp:Panel>
			<asp:Panel id="Pnl_ExcelDIY" runat="server" BorderColor="Maroon" BorderStyle="Solid" Visible="False">
				<table style="width: 100%">
					<tr>
						<td class="auto-style22" colspan="4">匯入EXCEL檔(DIY格式)</td>
					</tr>
					<tr>
						<td  class="auto-style3" style="width: 195px">請選擇檔案</td>
						<td class="auto-style4" colspan="1">
						    <asp:FileUpload ID="FileUpload2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" />
						</td>
                        <td> <asp:Button ID="Button5" runat="server" Font-Names="微軟正黑體" Text="下載DIY格式檔案" Font-Size="Medium" Height="30px" Width="167px" /></td>
						<td class="auto-style04" rowspan="4">說明：<br /> 
						<span class="auto-style8">"獨立編號"</span>是依照您所設定的各階層編號直接獨立來做項次編號使用，範例如下：<br /> 
						第一階：壹, 貳, 參,...<br /> 第二階：一, 二, 三,...<br /> 第三階：1, 2, 
						3,...<br /> ...以此類推<br /> <span class="auto-style8">
						    &quot;組合編號&quot;</span>則是依照您所設定的各階層編號，以累加方式來做項次編號使用，範例如下：<br /> 
						第一階：壹, 貳, 參,...<br /> 第二階：壹.一, 壹.二, 壹.三,...<br /> 
						第三階：壹.一.1, 壹.一.2, 壹.一.3,...<br /> ...以此類推</td>
					</tr>
					<tr>
						<td class="auto-style3" style="height: 24px; width: 195px">標單階層數</td>
						<td class="auto-style4" style="height: 24px" colspan="2">
						<asp:DropDownList id="DropDownList1" runat="server" Font-Size="Medium" Height="30px" Width="155px" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
							<asp:ListItem Value="0">-請選擇-</asp:ListItem>
							<asp:ListItem>1</asp:ListItem>
							<asp:ListItem>2</asp:ListItem>
							<asp:ListItem>3</asp:ListItem>
							<asp:ListItem>4</asp:ListItem>
							<asp:ListItem>5</asp:ListItem>
							<asp:ListItem>6</asp:ListItem>
							<asp:ListItem>7</asp:ListItem>
						</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td class="auto-style3" style="width: 195px">項次編號方式</td>
						<td class="auto-style4" style="width: 186px; vertical-align:bottom">
						<asp:RadioButtonList id="RadioButtonList3" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
							<asp:ListItem Value="0">獨立編號</asp:ListItem>
							<asp:ListItem Value="1">組合編號</asp:ListItem>
						</asp:RadioButtonList>
						</td>
						<td class="auto-style4" style="width: 315px; vertical-align:bottom">
						    <asp:Label ID="Label2" runat="server" Height="30px" Text="加入組合符號："></asp:Label>
						<asp:DropDownList id="DropDownList2" runat="server" Font-Size="Medium" Height="30px" Width="50px" Enabled="False" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
							<asp:ListItem Value="1">.</asp:ListItem>
							<asp:ListItem Value="2">-</asp:ListItem>
							<asp:ListItem Value="3">,</asp:ListItem>
						</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td class="auto-style3" style="width: 195px">項次編號設定</td>
						<td class="auto-style4" colspan="2">
						<table style="width: 100%">
                        
							<tr>
								<td class="auto-style13">第一階</td>
								<td class="auto-style14">
								<asp:DropDownList id="First" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" AutoPostBack="true" DataTextField="OrderName" DataValueField="Kind" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
									<asp:ListItem Value="0">-請選擇-</asp:ListItem>
								</asp:DropDownList>
								    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  SelectCommand="SELECT * FROM [LayerOrder] WHERE ([OrderNum] = @OrderNum) ORDER BY [Kind]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="0" Name="OrderNum" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
								</td>
							</tr>
							<tr>
								<td class="auto-style13">第二階</td>
								<td class="auto-style14">
								    <asp:DropDownList ID="Second" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" AutoPostBack="true" DataValueField="Kind" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td class="auto-style13">第三階</td>
								<td class="auto-style14">
								    <asp:DropDownList ID="Third" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" AutoPostBack="true" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td class="auto-style13">第四階</td>
								<td class="auto-style14">
								    <asp:DropDownList ID="Forth" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderName" DataValueField="Kind" AutoPostBack="true" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="148px" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                    </asp:DropDownList>
								</td>
							</tr>
						</table>
						</td>
					</tr>
                    <tr>
                        <td class="auto-style5" colspan="4">
                            <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="標單匯入" Width="107px" OnClick="lbtOK_Click" />
                        </td>
                    </tr>
                     <asp:GridView ID="GridView1" runat="server"></asp:GridView>
			    </asp:Panel>
			<asp:Panel id="Pnl_XML" runat="server" BorderColor="Maroon" BorderStyle="Solid" Visible="False">
				<table style="width: 100%">
					<tr>
						<td class="auto-style11" colspan="2">匯入XML檔(PCCES格式)</td>
					</tr>
					<tr>
						<td  class="auto-style3" style="width: 195px">請選擇檔案</td>
						<td class="auto-style4">
						<asp:FileUpload id="FileUpload3" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" />
						</td>
					</tr>
					<tr>
						<td class="auto-style5" colspan="2">
                            <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="標單匯入" Width="107px" />
                        </td>
					</tr>
				</table>
			</asp:Panel>

			</td>
		</tr>
		</table>

    </div>

</body>
</html>


    </asp:Content>
