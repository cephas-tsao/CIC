<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_Model2.aspx.cs" Inherits="IMS.AI_Model2" %>
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
                <td class="TableTop" colspan="8">
                    深開挖壁體變位預測
                </td>
            </tr>
             <tr>
                <td class="TableTop" colspan="7">
                    輸入屬性值
                </td>
                <td class="TableTop">
                    推論輸出值
                </td>
            </tr>
            <tr>
                <td class="Table2C">
                連續壁厚度(cm)
                </td>
                <td class="Table2C">
                開挖面深度(m)
                </td>
                <td class="Table2C">
                等值土層SPT-N值參數
                </td>
                <td class="Table2C">
                觀測點深度參數(目前深度/預計開挖深度)
                </td>
                <td class="Table2C">
                觀測點前一開挖階段之實際壁體變位(mm)</td>
                <td class="Table2C">
                觀測點前二開挖階段之實際壁體變位(mm)</td>
                <td class="Table2C">
                觀測點前三開挖階段之實際壁體變位(mm)</td>
                <td class="Table2C">
                觀測點壁體變位(mm)</td>
                               
            </tr>
            <tr>
                <td class="Table2C">
                <asp:TextBox ID="TextBox1" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                </td>
                <td class="Table2C">
                   <asp:TextBox ID="TextBox2" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C">
                   <asp:TextBox ID="TextBox3" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
               <td class="Table2C">
                   <asp:TextBox ID="TextBox4" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
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
               

                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox8" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox9" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                <td class="Table2C" style="display:none">
                <asp:TextBox ID="TextBox10" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
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