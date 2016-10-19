<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BidInfoM.aspx.cs" Inherits="BidInfoM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="3">標案資訊管理</td>
            </tr>
            <tr>
                <td class="Table1L">&nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton175" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增標案" Width="27px" PostBackUrl="~/BidAdd.aspx" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton176" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存變更" Width="27px" />
                                &nbsp;
                                    <asp:ImageButton ID="ImageButton177" runat="server" Height="30px" ImageUrl="~/img/Reload.png" ToolTip="回復原值" Width="27px" />
                                </td>
                <td class="Table1" width="80px">選擇標案</td>
                <td class="Table2CC" width="300px">
		<asp:DropDownList id="DDL_Bid" runat="server" CssClass="DDLlong" DataSourceID="SqlDataSource1" DataTextField="BidName" DataValueField="BID">
		</asp:DropDownList>
                                </td>
            </tr>
            </table>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_1" runat="server" ForeColor="White" OnClick="LBtn_1_Click">公告招標資訊</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_1" runat="server">
            <table style="width: 100%; font: 微軟正黑體 normal normal 100% serif;">
                <tr>
                    <td class="Table1">標案名稱</td>
                    <td class="Table2LC" colspan="3">
                        &nbsp;</td>
                    <td class="Table1">標案狀態</td>
                    <td class="Table2LC" colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1">工程所在國家</td>
                    <td class="Table2LC" colspan="3">
                        <asp:DropDownList id="DropDownList2" runat="server" CssClass="DDLlong" Font-Size="Medium">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工程所在縣市</td>
                    <td class="Table2LC" colspan="3">
                        <asp:DropDownList id="DropDownList4" runat="server" CssClass="DDLlong" Font-Size="Medium">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 45px">電子領標</td>
                    <td class="Table2LC" style="height: 45px">
                        <asp:DropDownList ID="DropDownList11" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" style="height: 45px">電子投標</td>
                    <td class="Table2LC" style="height: 45px">
                        <asp:DropDownList ID="DropDownList12" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" style="height: 45px">截標時間</td>
                    <td class="Table2LC" colspan="3" style="height: 45px">
                        <asp:TextBox id="TextBox3" runat="server" CssClass="TBlong"></asp:TextBox>
                        <span class="NoteText">(必填)</span></td>
                </tr>
                <tr>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox7" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">業主聯絡人</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox8" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主地址</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox9" runat="server" Height="30px" Width="400px"></asp:TextBox>
                    </td>
                    <td class="Table1">業主聯絡電話</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox10" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 24px">領標地址</td>
                    <td class="Table2LC" colspan="3" style="height: 24px">
                        <asp:TextBox id="TextBox11" runat="server" Height="30px" Width="400px"></asp:TextBox>
                    </td>
                    <td class="Table1" style="height: 24px">押圖費</td>
                    <td class="Table2LC" colspan="3" style="height: 24px">
                        <asp:TextBox id="TextBox12" runat="server" CssClass="TBlong"></asp:TextBox>
                        元</td>
                </tr>
                <tr>
                    <td class="Table1">圖說費</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox13" runat="server" CssClass="TBlong"></asp:TextBox>
                        元</td>
                    <td class="Table1">退圖期限</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox14" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">履約保證金</td>
                    <td class="Table2LC" colspan="3">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 90px">
                                    <asp:RadioButtonList id="RadioButtonList1" runat="server">
                                        <asp:ListItem>金額</asp:ListItem>
                                        <asp:ListItem>百分比</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox id="TextBox15" runat="server" Height="30px" Width="200px"></asp:TextBox>
                                    (元)</td>
                            </tr>
                        </table>
                    </td>
                    <td class="Table1">押標金</td>
                    <td class="Table2LC" colspan="3">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 90px">
                                    <asp:RadioButtonList id="RadioButtonList2" runat="server">
                                        <asp:ListItem>金額</asp:ListItem>
                                        <asp:ListItem>百分比</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:TextBox id="TextBox20" runat="server" Height="30px" Width="200px"></asp:TextBox>
                                    (元)</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">廠商投標規定</td>
                    <td class="Table2LC" colspan="7">
                        <asp:TextBox id="TextBox17" runat="server" CssClass="TBfree" Height="100px" Width="1000px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">開標地點</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox18" runat="server" Height="30px" Width="400px"></asp:TextBox>
                    </td>
                    <td class="Table1">開標時間</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox22" runat="server" CssClass="TBlong"></asp:TextBox>
                        <span class="NoteText">(必填)</span></td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 24px">決標方式</td>
                    <td class="Table2LC" colspan="3" style="height: 24px">
                        <asp:DropDownList id="DropDownList9" runat="server" CssClass="TBlong" Font-Size="Medium">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" style="height: 24px">共同投標</td>
                    <td class="Table2LC" style="height: 24px">
                        <asp:DropDownList ID="DropDownList10" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" style="height: 24px">已領標</td>
                    <td class="Table2LC" style="height: 24px">
                        <asp:DropDownList id="DropDownList8" runat="server" CssClass="DDLfree">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                        <span class="NoteText">(必選)</span></td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" OnClick="LBtn_2_Click">合約概要</asp:LinkButton>
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
                    <td class="Table2LC" colspan="3" style="height: 26px">
                        <asp:RadioButtonList id="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>實做實算</asp:ListItem>
                            <asp:ListItem>總價承攬</asp:ListItem>
                            <asp:ListItem>實做+總價</asp:ListItem>
                            <asp:ListItem>統包</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">業主名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox23" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建築師/設計單位名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox24" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="width: 200px; height: 34px">監造單位名稱</td>
                    <td class="Table2LC" colspan="3" style="height: 34px">
                        <asp:TextBox id="TextBox25" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">PCM名稱</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox26" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">工期計算方式</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DropDownList1" runat="server" CssClass="TBlong" Font-Size="Medium">
                            <asp:ListItem>-請選擇-</asp:ListItem>
                            <asp:ListItem>限期完工</asp:ListItem>
                            <asp:ListItem>工作天</asp:ListItem>
                            <asp:ListItem>日曆天</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="Table1">工期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox5" runat="server" CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="TableTop2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
			II.合約明細資料</td>
                </tr>
                <tr>
                    <td class="Table1" colspan="4">
                        <asp:Button id="Button3" runat="server" Text="工期逾罰資料" CssClass="BtnFree" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button4" runat="server" Text="合約保固資料" CssClass="BtnFree"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button5" runat="server" Text="業主付款方式" CssClass="BtnFree" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button id="Button6" runat="server" Text="合約應注意條款" CssClass="BtnFree"  />
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_3" runat="server" ForeColor="White" OnClick="LBtn_3_Click">工程概要</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_3" runat="server">
            <table style="width: 100%">
                <tr>
                    <td class="Table1">工程區分</td>
                    <td class="Table2LC">
                        <asp:RadioButtonList id="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>公共工程</asp:ListItem>
                            <asp:ListItem>民間工程</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="Table1">工程分類</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DropDownList13" runat="server" CssClass="TBlong" Font-Size="Medium">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox21" runat="server"  CssClass="TBlong"></asp:TextBox>
                        樓</td>
                    <td class="Table1">地上樓層數</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox29" runat="server"  CssClass="TBlong"></asp:TextBox>
                        樓</td>
                </tr>
                <tr>
                    <td class="Table1">地下樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox30" runat="server"  CssClass="TBlong"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                    <td class="Table1">地上樓層面積</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox31" runat="server"  CssClass="TBlong"></asp:TextBox>
                        平方公尺(M<sup>2</sup>)</td>
                </tr>
                <tr>
                    <td class="Table1">建物高度</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox32" runat="server"  CssClass="TBlong"></asp:TextBox>
                        公尺(M)</td>
                    <td class="Table1">開挖深度</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox33" runat="server"  CssClass="TBlong"></asp:TextBox>
                        公尺(M)</td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 26px">基礎型式</td>
                    <td class="Table2LC" style="height: 26px">
                        <asp:DropDownList id="DropDownList5" runat="server" CssClass="TBlong" Font-Size="Medium">
                        </asp:DropDownList>
                        <br />
                        <span class="NoteText">*如欲增修基礎型式之內容請至常用資料維護功能</span></td>
                    <td class="Table1" style="height: 26px">擋土措施</td>
                    <td class="Table2LC" style="height: 26px">
                        <asp:DropDownList id="DropDownList6" runat="server" CssClass="TBlong" Font-Size="Medium">
                        </asp:DropDownList>
                        <br />
                        <span class="NoteText">*如欲增修擋土措施之內容請至常用資料維護功能</span></td>
                </tr>
                <tr>
                    <td class="Table1">施工概要備註</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox27" runat="server" CssClass="TBfree" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="Table1">其他工程概要</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox28" runat="server" CssClass="TBfree" Height="100px" Width="300px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            
          
        </asp:Panel>
        <table class="Table100">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_4" runat="server" ForeColor="White" OnClick="LBtn_4_Click">投標內業資訊</asp:LinkButton>
                </td>
            </tr>
            </table>
        <asp:Panel ID="Pnl_4" runat="server">
            <table style="width: 100%">
                <tr>
                    <td class="Table1">作業負責人</td>
                    <td class="Table2LC">
                        <asp:DropDownList id="DropDownList7" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                        <asp:DropDownList id="DropDownList14" runat="server" CssClass="DDLfree">
                        </asp:DropDownList>
                    </td>
                    <td class="Table1" colspan="2">
                        <asp:Button ID="Button7" runat="server" CssClass="BtnFree" Text="共同投標廠商管理" />
                    </td>
                </tr>
                <tr>
                    <td class="Table1">完成領標日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox34" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">預定估算完成日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox35" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">標前會議時間</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox36" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">寄送標單日期</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox37" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">退圖日期</td>
                    <td class="Table2LC" colspan="3">
                        <asp:TextBox id="TextBox38" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1" style="height: 26px">估算成本</td>
                    <td class="Table2LC" style="height: 26px" colspan="3">
                        <asp:TextBox id="TextBox39" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Table1">建議標價</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox40" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">建議利潤</td>
                    <td class="Table2LC">&nbsp;</td>
                </tr>
                <tr>
                    <td class="Table1">核定標價</td>
                    <td class="Table2LC">
                        <asp:TextBox id="TextBox42" runat="server"  CssClass="TBlong"></asp:TextBox>
                    </td>
                    <td class="Table1">核定利潤</td>
                    <td class="Table2LC">&nbsp;</td>
                </tr>
            </table>
            
        </asp:Panel>
    
    </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CICIMSConnectionString %>" SelectCommand="SELECT [BID], [BidName] FROM [BidM0]"></asp:SqlDataSource>
    </form>
</body>
</html>
