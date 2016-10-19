<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="AI_Model6.aspx.cs" Inherits="IMS.AI_Model6" %>
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
                <td class="TableTop" colspan="13">
                    營造廠專業協力廠商評鑑
                </td>
            </tr>
             <tr>
                <td class="TableTop" colspan="12">
                    輸入屬性值(0~10分)
                </td>
                <td class="TableTop">
                    推論輸出值
                </td>
            </tr>
            <tr>
                <td class="Table2C">
               工程施工水準
                </td>
                <td class="Table2C">
                對工程時限之控制
                </td>
                <td class="Table2C">
                與工地人員配合情形
                </td>
                <td class="Table2C">
               對使用公司材料之愛惜情形
                </td>
                 <td class="Table2C">
               工作完成後偶發事件之服務
                        </td>
                 <td class="Table2C">
               與其他承包工人配合情形
                        </td>
                 <td class="Table2C">
               工作施作之安全防護
                        </td>
                 <td class="Table2C">         
                借用公司工具之愛惜情形
                        </td>
                 <td class="Table2C">
                工作場所是否維持清潔
                        </td>
                 <td class="Table2C">  
                承包人之管理能力
                        </td>
                 <td class="Table2C">   
                承包人之個人性情
                        </td>
                 <td class="Table2C"> 
               承包人之經濟基礎
                        </td>
               
                <td class="Table2C">
                廠商評鑑總分
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
                  <td class="Table2C">
                <asp:TextBox ID="TextBox11" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                  <td class="Table2C">
                <asp:TextBox ID="TextBox12" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                  <td class="Table2C"  style="display:none">
                <asp:TextBox ID="TextBox13" runat="server" Width="50px" style="text-align:right"></asp:TextBox>
                     </td>
                  <td class="Table2C"  style="display:none">
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