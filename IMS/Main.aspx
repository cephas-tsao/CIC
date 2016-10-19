<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="IMS.Main" Culture="auto"  UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>主頁面</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/StyleMain.css" />

      <link rel="stylesheet" type="text/css" href="css/Style1.css" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height:400px;
        }
        .auto-style2 {
            width: 50%;
            height:50%;
        }
        .auto-style3 {
            width: 100%;
        }
    </style>

<body>
   
    <div>
    
        <table class="auto-style1" border="1">
            <tr>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/img/MyProjects.jpg" />

                                    <asp:Label ID="LabelT1" runat="server" Text="我的專案"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <table class="auto-style3">
                                        <tr style="height:50px">
                                            <td class="Table1" style="width:30%">
                                                <asp:Label ID="Label1" runat="server" Text="目前專案"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Image ID="ImageButton5" runat="server" Height="25px" ImageUrl="~/img/ProIcon.jpg" />
                                                <asp:Label ID="LbProjectName" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label2" runat="server" Text="選擇專案"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:DropDownList ID="Ddl_Project" runat="server" AutoPostBack="True" CssClass="DDLfree" DataSourceID="SqlDataSource1" DataTextField="CodeName" DataValueField="PID" OnSelectedIndexChanged="Ddl_Project_SelectedIndexChanged" Width="85%">
                                                </asp:DropDownList>
                                                <asp:ImageButton ID="IB_ProjectSearch" runat="server" Height="16px" ImageUrl="~/IMG/Search.gif" OnClick="IB_ProjectSearch_Click" />
                                                   
                <div >    
                
                <div id="search_area" runat="server" visible="false">
                <asp:Label ID="Label3" runat="server"  Text="關鍵字搜尋："></asp:Label>
                <asp:TextBox ID="TB_Search" runat="server" CssClass="TBfree" Width="60%"></asp:TextBox>
                <asp:Button ID="Btn_Search" runat="server" Text="搜尋" OnClick="Btn_Search_Click" />
                <br />
                </div>
            </div>
                                                </td>
                                        </tr>
                                    </table>
                                    <br />
                                            
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel2" runat="server" >
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton4" runat="server" Height="25px" ImageUrl="~/img/User.jpg" />
                                    <asp:Label ID="LabelT2" runat="server" Text="使用者登入資訊"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <table class="auto-style3">
                                        <tr>
                                            <td class="Table1" style="width:30%"><asp:Label ID="Label4" runat="server" Text="姓名"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbName" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label5" runat="server" Text="帳號"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="Lbaccount" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label6" runat="server" Text="公司名稱"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbCom" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label7" runat="server" Text="聯絡電話"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbTel" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label8" runat="server" Text="E-mail"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbEmail" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label9" runat="server" Text="是否為系統管理員"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbAdmin" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label10" runat="server" Text="使用期限"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbDeadLine" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            </table>
    
    </div>
        <%--<table class="auto-style1" border="1">
            <tr>
                <td class="auto-style2">
                    <asp:Panel ID="Panel1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/img/MyProjects.jpg" />
                                    我的專案</td>

                                    <asp:Label ID="LabelT1" runat="server" Text="我的專案"></asp:Label>
                                    </td>

                            </tr>
                            <tr>

                                <td class="Table2">                                   
                                    <asp:Image ID="ImageButton5" runat="server" Height="25px" ImageUrl="~/img/ProIcon.jpg" />
                                        <div >            
                <asp:Label ID="Label1" runat="server"  Text="目前選擇之專案："></asp:Label><asp:Label ID="LbProjectName" runat="server" ></asp:Label><br />
                <asp:DropDownList ID="Ddl_Project" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CodeName" DataValueField="PID" Width="250px" OnSelectedIndexChanged="Ddl_Project_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ImageButton ID="IB_ProjectSearch" runat="server" Height="16px" ImageUrl="~/IMG/Search.gif" OnClick="IB_ProjectSearch_Click" />
                <br />

                                <td class="Table2">
                                    <table class="auto-style3">
                                        <tr style="height:50px">
                                            <td class="Table1" style="width:30%">
                                                <asp:Label ID="Label1" runat="server" Text="目前專案"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Image ID="ImageButton5" runat="server" Height="25px" ImageUrl="~/img/ProIcon.jpg" />
                                                <asp:Label ID="LbProjectName" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label2" runat="server" Text="選擇專案"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:DropDownList ID="Ddl_Project" runat="server" AutoPostBack="True" CssClass="DDLfree" DataSourceID="SqlDataSource1" DataTextField="CodeName" DataValueField="PID" OnSelectedIndexChanged="Ddl_Project_SelectedIndexChanged" Width="85%">
                                                </asp:DropDownList>
                                                <asp:ImageButton ID="IB_ProjectSearch" runat="server" Height="16px" ImageUrl="~/IMG/Search.gif" OnClick="IB_ProjectSearch_Click" />
                                                   
                <div >    
                

                <div id="search_area" runat="server" visible="false">
                <asp:Label ID="Label3" runat="server"  Text="關鍵字搜尋："></asp:Label>
                <asp:TextBox ID="TB_Search" runat="server" CssClass="TBfree" Width="60%"></asp:TextBox>
                <asp:Button ID="Btn_Search" runat="server" Text="搜尋" OnClick="Btn_Search_Click" />
                <br />
                </div>
            </div>
                                                </td>
                                        </tr>
                                    </table>
                                    <br />
                                            
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="auto-style2">
                    <asp:Panel ID="Panel2" runat="server" >
                        <table class="auto-style1">
                            <tr>
                                <td class="TableTop_Left">
                                    <asp:Image ID="ImageButton4" runat="server" Height="25px" ImageUrl="~/img/User.jpg" />
                                    <asp:Label ID="LabelT2" runat="server" Text="使用者登入資訊"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td class="Table2">
                                    <table class="auto-style3">
                                        <tr>
                                            <td class="Table1" style="width:30%"><asp:Label ID="Label4" runat="server" Text="姓名"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbName" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label5" runat="server" Text="帳號"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="Lbaccount" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label6" runat="server" Text="公司名稱"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbCom" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label7" runat="server" Text="聯絡電話"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbTel" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label8" runat="server" Text="E-mail"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbEmail" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Table1">
                                                <asp:Label ID="Label9" runat="server" Text="是否為系統管理員"></asp:Label>
                                            </td>
                                            <td class="Table2LC">
                                                <asp:Label ID="LbAdmin" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>--%>
                  <%--  </asp:Panel>
                </td>
            </tr>
            </table>
    
    </div>--%>
 
 <%--   <asp:Label runat="server" Text="您目前選取的專案ID是"></asp:Label>--%>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:Label ID="ProjectName" runat="server" Visible="false"></asp:Label><br />
    <asp:Label ID="ProjectResource" runat="server" Visible="false"></asp:Label><br />
                     
                                    </asp:Content>
