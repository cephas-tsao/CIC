<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="FirmCheckQuery.aspx.cs" Inherits="IMS.FirmCheckQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分包商考核項目查詢</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">

        .RadioButtonListCssClass  
        {  
            
            /*font-family:Comic Sans MS;*/  
            font-size:16px;
            width:780px;
            /*padding-left:20px;*/
            } 
    
    </style>  
    
     <div style="margin-left:300px;margin-top:50px"> 
  <asp:ScriptManager ID="ScriptManager1" runat="server" >
        </asp:ScriptManager>
    <asp:Panel ID="Panel1" runat="server" Visible="true">    
  
       <span style="padding-left:300px;font-size:20px;">搜尋公司：<asp:TextBox ID="Keyword" runat="server"></asp:TextBox>  <asp:Button ID="SelectActionButton" runat="server" Text="搜尋"  OnClick="SelectActionButton_Click"  />    </span>
  <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Font-Size="20px" CssClass="radiobutton" CellPadding="15">            
            </asp:RadioButtonList>

    </asp:Panel>
    <asp:Repeater ID="gvEmps" runat="server"  OnItemDataBound="gvEmps_ItemDataBound" >
            <ItemTemplate>
                <table border="1" style="width:1100px">     
             <caption style="font-size:20px;background-color:lightblue"> 分包商考核(初核)</caption>
            <tr><td style="width:10%">廠商名稱：</td><td style="width:20%"><asp:Literal ID="uid" runat="server" Visible="false"></asp:Literal><asp:Literal ID="ltName" runat="server"></asp:Literal></td>
                <td style="width:10%">負責人：</td><td style="width:10%"><asp:Literal ID="ltOwner" runat="server"></asp:Literal></td>
                <td style="width:10%">負責人行動：</td><td colspan="3"><asp:Literal ID="ltOwnerMobile" runat="server"></asp:Literal></td>
             <tr>
                <td style="width:10%">統一編號：</td><td style="width:20%"><asp:Literal ID="ltEIN" runat="server"></asp:Literal></td>
                <td style="width:10%">電話號碼：</td><td style="width:10%"><asp:Literal ID="ltTEL1" runat="server"></asp:Literal></td>
                <td style="width:10%">電話號碼2：</td><td colspan="3"><asp:Literal ID="ltTEL2" runat="server"></asp:Literal></td>
             </tr>
                    <tr><td style="width:10%" >傳真號碼：</td><td style="width:20%"><asp:Literal ID="ltFax1" runat="server"></asp:Literal></td>
                        <td style="width:10%">傳真號碼２：</td><td style="width:15%"><asp:Literal ID="ltFax2" runat="server"></asp:Literal></td>
                        <td style="width:10%">資本額：</td><td style="width:5%"><asp:Literal ID="ltCapital" runat="server"></asp:Literal></td>
                        <td style="width:7%">員工數：</td><td style="width:10%"><asp:Literal ID="ltStaffAmount" runat="server"></asp:Literal></td>
                    </tr>
                    <tr><td colspan="2">公司地址：</td><td style="width:30%"><asp:Literal ID="ltRegisteredAddress" runat="server"></asp:Literal></td>
                        <td colspan="2">聯絡人：</td><td colspan="3" style="padding-left:60px"><asp:Button ID="Button1" runat="server" Text="一覽表" /></td>
                    </tr>
                    <tr><td colspan="2">通訊地址：</td><td style="width:20%"><asp:Literal ID="ltContectAddress" runat="server"></asp:Literal></td>
                        <td colspan="2">營業項目：</td><td colspan="3" style="padding-left:60px"><asp:Button ID="Button2" runat="server" Text="一覽表" /></td>
                    </tr>
                </ItemTemplate>

        </asp:Repeater>
                <asp:Panel ID="com1" runat="server" Visible="false">
                    <table border="1" style="width:1100px">
                   <tr><td style="width:20%">種類</td><td style="width:20%">分數<td style="width:60%">說明</td></td></tr>
                <tr><td>施工品質</td><td><asp:Literal ID="Literal1" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal2" runat="server"></asp:Literal></td></tr>
                <tr><td>進度控制</td><td><asp:Literal ID="Literal3" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal4" runat="server"></asp:Literal></td></tr>
                <tr><td>配合度</td><td><asp:Literal ID="Literal5" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal6" runat="server"></asp:Literal></td></tr>
                <tr><td>工地清潔</td><td><asp:Literal ID="Literal7" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal8" runat="server"></asp:Literal></td></tr>
                <tr><td>勞工安全</td><td><asp:Literal ID="Literal9" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal10" runat="server"></asp:Literal></td></tr>
                <tr><td>材料愛惜</td><td><asp:Literal ID="Literal11" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal12" runat="server"></asp:Literal></td></tr>
                        </table>
                </asp:Panel>
                    <asp:Panel ID="com2" runat="server" Visible="false">
             <table border="1" style="width:1100px">
                   <tr><td style="width:20%">種類</td><td style="width:20%">分數<td style="width:60%">說明</td></td></tr>
                <tr><td>材料品質</td><td><asp:Literal ID="Literal14" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal15" runat="server"></asp:Literal></td></tr>
                <tr><td>送貨時效</td><td><asp:Literal ID="Literal16" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal17" runat="server"></asp:Literal></td></tr>
                <tr><td>配合度</td><td><asp:Literal ID="Literal18" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal19" runat="server"></asp:Literal></td></tr>
                <tr><td>售後服務</td><td><asp:Literal ID="Literal20" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal21" runat="server"></asp:Literal></td></tr>
                <tr><td>缷貨場所維持清潔</td><td><asp:Literal ID="Literal22" runat="server"></asp:Literal></td><td colspan="6"><asp:Literal ID="Literal23" runat="server"></asp:Literal></td></tr>          
                 </table>
        </asp:Panel>
         <asp:Panel ID="result" runat="server" Visible="false">
      <table border="1" style="width:1100px;margin-left:300px"> 
                <tr><td style="width:20%">流程</td><td style="width:20%">評估人</td><td style="width:20%">評估結果</td><td style="width:40%">說明</td></tr>
                 <tr><td><asp:Literal ID="Literal13" runat="server"></asp:Literal></td>
                     <td><asp:Literal ID="LtAssessor" runat="server"></asp:Literal></td>
                     <td> <asp:Literal ID="LtResult" runat="server"></asp:Literal></td>
                     <td colspan="5"><asp:Literal ID="LtExplan" runat="server"></asp:Literal></td></tr>
            </table>
         </asp:Panel>            


     </div>

    </asp:Content>
