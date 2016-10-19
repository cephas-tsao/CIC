<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KCheckListLContent.aspx.cs" Inherits="IMS.KCheckListLContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <style type="text/css">
        .Table2CC {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: center;
            color: #000000;
            vertical-align: central;
        }

        .TableRow {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #507CD1;
            text-align: center;
            color: #FFFFFF;
            vertical-align: central;
        }

        .BtnLargeMediumm {
            font-size: medium;
            font-family: 微軟正黑體;
            height: 35px;
            width: 150px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" OnClick="LinkButton2_Click">新增檢查項目</asp:LinkButton>
                    </td>
                </tr>
            </table>

            <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible="true">

                <table class="Table100" id="newtable">

                    <tr>
                        <td class="Table1" style="height: 22px; width: 306px;">改善狀態：</td>
                        <td class="Table2" style="height: 22px">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DDLshort">
                                <asp:ListItem>改善前</asp:ListItem>
                                <asp:ListItem>改善中</asp:ListItem>
                                <asp:ListItem>改善後</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>

                    <tr>
                        <td class="Table1" style="height: 22px; width: 306px;">說明：</td>
                        <td class="Table2" style="height: 22px">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <span class="NoteText"></span></td>
                    </tr>
                    <tr>
                        <td class="Table1" style="height: 22px; width: 306px;"></td>
                        <td class="Table2" style="height: 22px">
                            <asp:FileUpload ID="FU1" runat="server" />
                            <span class="NoteText"></span></td>
                    </tr>


                    <tr>
                        <td colspan="2" class="Table1">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="上傳" CssClass="BtnLargeShort" />

                              <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:PlaceHolder>

            <table class="Table100">
                <tr>
                    <td class="Table0">
                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White">檢查項目總覽</asp:LinkButton>
                    </td>
                </tr>
            </table>


            <asp:Table ID="Table1" runat="server" BorderWidth="1px" ForeColor="Black" GridLines="Both" BorderStyle="Solid" Width="100%">

                <asp:TableRow runat="server" CssClass="TableRow">
                    
                    <asp:TableCell runat="server">改善階段</asp:TableCell>
                    <asp:TableCell runat="server">上傳日期</asp:TableCell>
                    <asp:TableCell runat="server">說明</asp:TableCell>
                    <asp:TableCell runat="server">照片</asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>

    </form>
</body>
</html>
