<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IllMode.ascx.cs" Inherits="IMS.WebControl.IllMode" %>
<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">圖說管理</a></li>
                        <li><a href="IllMode.aspx">圖說管理</a></li>
                                           
                    </ul>
                </div>
            </div> 
<%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="圖說管理" PostBackUrl="~/IllMode.aspx"></asp:LinkButton><br /></li>
   
</ul>
</nav>--%>