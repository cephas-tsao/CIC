<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IMS.login" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">--%>
    <title>登入頁面</title>
    <link href="/CSS/Login.css" rel="stylesheet" type="text/css" />
      <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">    
    <link rel="stylesheet" href="dist/bootstrap/css/bootstrap.min.css">        
    <link rel="stylesheet" href="dist/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="dist/css/form-elements.css">
    <link rel="stylesheet" href="dist/css/login.css">
<%-- <style type="text/css">
.text {
　　text-align: justify;
　　text-justify: inter-ideograph;
　　-ms-text-justify: inter-ideograph; /*IE9*/
　　-webkit-text-align-last: justify; /*Chrome*/
　　-moz-text-align-last: justify; /*Firefox*/

}

.text:after {
　　content: '';
　　display: inline-block;
　　width: 100%;
}
</style>--%>
<%--</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
    <%-- <div class="login_panel">
            <asp:Panel ID="Panel1" runat="server" Width="220px" Height="94px" meta:resourcekey="Panel1Resource1">
                <asp:Label runat="server" Text="登入資訊" meta:resourcekey="LabelResource1"></asp:Label><br />
                <asp:Label ID="Lbl_Name" runat="server" Text="帳號" meta:resourcekey="Lbl_NameResource1"></asp:Label>
                <asp:TextBox ID="TB_Name" runat="server" meta:resourcekey="TB_NameResource1"></asp:TextBox><br />
                <asp:Label ID="Lbl_Password" runat="server" Text="密碼" meta:resourcekey="Lbl_PasswordResource1"></asp:Label>
                <asp:TextBox ID="TB_Password" runat="server" TextMode="Password" meta:resourcekey="TB_PasswordResource1"></asp:TextBox><br />
                <asp:Button ID="Btn_submit" runat="server" Text="登入" OnClick="Btn_submit_Click" meta:resourcekey="Btn_submitResource1" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Btn_reset" runat="server" Text="重置" OnClick="Btn_reset_Click" meta:resourcekey="Btn_resetResource1" /><br />
                <asp:Label ID="Lbl_Error" runat="server" Text="錯誤訊息" Visible="False" ForeColor="Red" meta:resourcekey="Lbl_ErrorResource1"></asp:Label><br />
            </asp:Panel>
        </div>--%>
      <!-- Top content -->
<form id="form1" runat="server">
    <div class="top-content">
        <div class="inner-bg">
            <br />
            <br />
            <br />
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box" style="padding-top:230px" >
                        <div class="form-top">
                            <div class="form-top-left" >
                               <h3 style="white-space:nowrap;text-align: justify;word-spacing:15px;"> <asp:Image ID="Image2" runat="server" ImageUrl="~/img/mark.png"  Width="50px" ImageAlign="Left" CssClass="icon"/> 
                                <span style="white-space:nowrap;word-spacing:40px;text-align: justify; font-size:34px;font-weight:900;padding-top:100px;padding-bottom:50px">營 建 資 訊 雲
                                 <%--   <asp:label runat="server" text="營建資訊雲"  ></asp:label>--%>
                                    </span></br>Construction Information Cloud</h3>
                                <h3 style="padding-left:50px">登入系統</h3>
                                <p style="padding-left:50px">請輸入使用者帳號及密碼:</p>
                            </div>
                            <div class="form-top-right">
                              <%--  <i class="fa fa-lock"></i>--%>
                            </div>
                        </div>
                        <div class="form-bottom" >
                         <%--   <form role="form" action="" method="post" class="login-form">--%>
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">帳號</label>
                                        <asp:TextBox ID="TB_Name" runat="server" meta:resourcekey="TB_NameResource1" class="form-username form-control"></asp:TextBox>
                                 <%--   <input type="text" name="form-username" placeholder="Username..." class="form-username form-control" id="form-username">--%>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">密碼</label>
                                  <%--  <input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">--%>
                                     <asp:TextBox ID="TB_Password" runat="server" TextMode="Password" meta:resourcekey="TB_PasswordResource1" class="form-password form-control"></asp:TextBox>
                                </div>
                         <%--      <button type="submit" class="btn">登入</button><br />--%>
                                 <asp:Button ID="Btn_submit" class="btn" runat="server" Text="登入" OnClick="Btn_submit_Click"   /><br />
                             <asp:Label ID="Lbl_Error" runat="server" Text="錯誤訊息" Visible="False" ForeColor="Red" meta:resourcekey="Lbl_ErrorResource1"></asp:Label>
                           <%-- </form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
       <!-- Javascript -->
    <script src="dist/js/jquery-1.11.1.min.js"></script>    
    <script src="dist/bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/js/jquery.backstretch.min.js"></script>
    <script src="dist/js/login.js"></script>
<%--</asp:Content>--%>
    </form>