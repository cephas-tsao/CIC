<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_Model.aspx.cs" Inherits="IMS.AI_Model" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/AI.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>人工智慧推論</title>
      <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
      <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<Area:MemberBoxUC ID="MemberBox" runat="server" />   

  <div >
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="21">
                    建築成本概算
                </td>
            </tr>
             <tr>
                <td class="TableTop" colspan="10">
                    輸入屬性值
                </td>
                <td class="TableTop">
                    推論輸出值
                </td>
            </tr>
            <tr>
                <td class="Table2C">
                基地面積(坪)
                </td>
                <td class="Table2C">
                地質狀況
                </td>
                <td class="Table2C">
                鄰房建損數(戶)
                </td>
                <td class="Table2C">
                震區
                </td>
                <td class="Table2C">
                規劃戶數(戶)</td>
                <td class="Table2C">
                總樓地板面積(坪)</td>
                <td class="Table2C">
                地上樓層數</td>
                <td class="Table2C">
                地下樓層數</td>               
                <td class="Table2C">
                裝修等級</td>
                <td class="Table2C">
                機電及設備等級</td>
                <td class="Table2C">
                工程建坪造價(元/坪)</td>               
            </tr>
            <tr>
                <td class="Table2C">
                <asp:TextBox ID="TextBox1" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                </td>
                <td class="Table2C">
                 <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="1">軟弱土質</asp:ListItem>
                        <asp:ListItem Value="2">中等土質</asp:ListItem>
                        <asp:ListItem Value="3">監硬土質</asp:ListItem>
                    </asp:DropDownList>
                     </td>
                <td class="Table2C">
                   <asp:TextBox ID="TextBox2" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                     <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="1">甲區</asp:ListItem>
                        <asp:ListItem Value="2">乙區</asp:ListItem>
                    </asp:DropDownList>
                     </td>
                <td class="Table2C">
                <asp:TextBox ID="TextBox5" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                <asp:TextBox ID="TextBox6" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                <asp:TextBox ID="TextBox7" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                <asp:TextBox ID="TextBox8" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                     <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem Value="1">一般型</asp:ListItem>
                        <asp:ListItem Value="2">基本型</asp:ListItem>
                        <asp:ListItem Value="3">豪華型</asp:ListItem>
                    </asp:DropDownList>
                     </td>
                <td class="Table2C">
                     <asp:DropDownList ID="DropDownList4" runat="server">
                         <asp:ListItem Value="1">一般型</asp:ListItem>
                        <asp:ListItem Value="2">基本型</asp:ListItem>
                        <asp:ListItem Value="3">豪華型</asp:ListItem>
                    </asp:DropDownList>
                     </td>


                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox11" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox12" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox13" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox14" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox15" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox16" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox17" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox18" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox19" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox20" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>


                <td class="Table2C">
                <asp:TextBox ID="TextBox21" runat="server" Width="150px" ReadOnly="true" style="text-align:right"></asp:TextBox>
                </td>
            </tr>
        
        </table>
        <br />
        <center> <asp:Button ID="Button2" runat="server" Text="載入專案資訊" OnClick="Button2_Click"/>
        <asp:Button ID="Button1" runat="server" Text="模式推論" OnClick="Button1_Click" /></center>
    
    </div>      

    
</asp:Content>