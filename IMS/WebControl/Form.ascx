<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Form.ascx.cs" Inherits="IMS.WebControl.Form" %>
<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">品質管理</a></li>
                        <li><a href="FirmView.aspx">工程項目表</a></li>
                        <li><a href="FirmM.aspx">檢核工程</a></li>
                     
                    </ul>
                </div>
            </div> 
<%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="工程項目表" PostBackUrl="~/Form/listproject.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="檢核工程" PostBackUrl="~/Form/listplace.aspx"></asp:LinkButton><br /></li>
  
</ul>
</nav>--%>