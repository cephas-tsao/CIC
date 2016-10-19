<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_Model4.aspx.cs" Inherits="IMS.AI_Model4" %>
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
                <td class="TableTop" colspan="11">
                    專案完工總成本預測
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
                歷時工期/變更後合約工期
                </td>
                <td class="Table2C">
                實支成本百分比(ACP)
                </td>
                <td class="Table2C">
                預算完成百分比(EVP)
                </td>
                <td class="Table2C">
               成本績效(CPI)
                </td>
                 <td class="Table2C">
               進度績效(SPI)
                        </td>
                 <td class="Table2C">
                承商計價績效(BCWP_C/AC)
                        </td>
                 <td class="Table2C">
               業主估驗績效(BCWP_C/EV*)
                        </td>
                 <td class="Table2C">         
                變更後合約金額比
                        </td>
                 <td class="Table2C">
                建築類工程營造物價指數(CCI)
                        </td>
                 <td class="Table2C">  
                可施工日工期比(1-累計雨天比)
                        </td>
                <td class="Table2C">
                待支成本比(EAC-AC)/BAC
                </td>
                               
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
               

                 <td class="Table2C">
                <asp:TextBox ID="TextBox8" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                 <td class="Table2C">
                <asp:TextBox ID="TextBox9" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                 <td class="Table2C">
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