<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BargainTable.aspx.cs" Inherits="IMS.BargainTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="../css/StyleSht.css" />
    <%--<link rel="stylesheet" type="text/css" href="./css/StyleSB.css" />--%>
</head>
     <style type="text/css">
         .Table0C {
    font-family: 微軟正黑體;
    font-size: medium;
    background-color: #666699;
    text-align: center;
    color: #FFFFFF;
}
        .SB_Table_M {
            width:100%;
            background-color: #6C6C6C;
        }
        .SB_Row_M {
            background-color: #A6FFA6;
        }
        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 24px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            vertical-align: top;
            height: 24px;
        }
    </style>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="Table100">
            <tr>
                <td class="TableTop" colspan="5">議價呈核表</td>
            </tr>
            <tr>
                <td class="TableTop2C" style="width: 10%">分包預算編號</td>
                <td class="TableTop2" style="width: 15%">
                    <asp:Label ID="LbSubNum" runat="server" Text="Label"></asp:Label></td>
                <td class="TableTop2C" style="width: 10%">分包預算名稱</td>
                <td class="TableTop2" style="width: 15%">
                    <asp:Label ID="LbSubName" runat="server" Text="Label"></asp:Label></td>
                <td class="TableTop2R" style="width: 50%">&nbsp;&nbsp;<asp:ImageButton ID="ImgExcel" runat="server" Height="30px" ImageUrl="~/img/Excel_2013.png" ToolTip="匯出EXCEL檔" Width="27px" OnClick="ImgExcel_Click"  />
                                &nbsp; <asp:ImageButton ID="ImgPDF" runat="server" Height="30px" ImageUrl="~/img/PDF.png" ToolTip="匯出PDF檔" Width="27px" OnClick="ImgPDF_Click" />
                                </td>
            </tr>
            </table>
        <table class="Table100">
         
            <tr>
              <td class="Table0C" colspan="6">分包預算工項</td>
              <%--    <td class="Table1" colspan="4">育偉土木包工業<asp:ImageButton ID="ImageButton133" runat="server" Height="15px" ImageUrl="~/img/tick.png" ToolTip="目前得標廠商" Width="15px" />
                                </td>
                <td class="Table1" colspan="4">根根營造</td>
                <td class="Table1" colspan="4">老王建設</td>
                <td class="Table1" colspan="4">基基工程行</td>--%>
                   <asp:Literal ID="DateListString" runat="server"></asp:Literal>
            </tr>
            <tr>
                <td class="Table0C">執行項次</td>
                <td class="Table0C">工項名稱</td>
                <td class="Table0C">單位</td>
                <td class="Table0C">分包數量</td>
                <td class="Table0C">預算單價</td>
                <td class="Table0C">預算複價</td>
                <asp:Literal ID="DateListString1" runat="server"></asp:Literal>
                <%--  <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>
                <td class="Table1">報價單價</td>
                <td class="Table1">報價複價</td>
                <td class="Table1">議價後單價</td>
                <td class="Table1">議價後複價</td>--%>
            </tr>
         
                <asp:Literal ID="DateListString2" runat="server"></asp:Literal>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <asp:Literal ID="DateListString3" runat="server"></asp:Literal>
      
        </table>
    
    </div>
    </form>
</body>
</html>
