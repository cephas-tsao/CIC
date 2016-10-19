<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PurchaseMode.aspx.cs" Inherits="PurchaseMode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>採購發包模組</title>
    <link rel="stylesheet" type="text/css" href="./Style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:justify; text-justify:auto;">
    <table class="Table100" style="text-align: center;vertical-align:bottom;">
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button2" runat="server" CssClass="ModeBtn" PostBackUrl="SubBudgetAdd.aspx" Text="新增分包預算" />
                </td>
                <td>
        <asp:Button ID="Button3" runat="server" CssClass="ModeBtn" PostBackUrl="SubBudgetEdit.aspx" Text="分包預算編修" />
    
                </td>
                <td>
        <asp:Button ID="Button4" runat="server" CssClass="ModeBtn" PostBackUrl="SubInviteAdd.aspx" Text="新增邀標單" />
    
                </td>
            </tr>
            
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button5" runat="server" CssClass="ModeBtn" PostBackUrl="SubInviteM.aspx" Text="邀標單管理" />
                </td>
                <td>
        <asp:Button ID="Button6" runat="server" CssClass="ModeBtn" PostBackUrl="SubBargain.aspx" Text="協力廠商議價議約" />
    
                </td>
                <td>
        <asp:Button ID="Button7" runat="server" CssClass="ModeBtn" PostBackUrl="SubContractAdd.aspx" Text="新增分包合約" />
    
                </td>
            </tr>
            
            <tr style="height:300px;">
                <td>
        <asp:Button ID="Button8" runat="server" CssClass="ModeBtn" PostBackUrl="SubContractM.aspx" Text="分包合約管理" />
                </td>
                <td>
        <asp:Button ID="Button9" runat="server" CssClass="ModeBtn" PostBackUrl="PurchaseView.aspx" Text="採購發包綜合檢視" />
    
                </td>
                <td>
        <asp:Button ID="Button10" runat="server" CssClass="ModeBtn" PostBackUrl="ChangeSubBudget.aspx" Text="分包追加減" />
    
                </td>
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>
