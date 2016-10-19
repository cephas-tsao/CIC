<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Usual.ascx.cs" Inherits="IMS.WebControl.Usual" %>
  <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">共用功能</a></li>
                        <li><a href="PriceAnalysis.aspx">共用工料管理</a></li>
                        <li><a href="WordLibrary.aspx">常用詞庫管理</a></li>
                        <li><a href="ConIllLibrary.aspx">施工圖元件管理</a></li>
                       
                    </ul>
                </div>
            </div>
<%-- <nav>
        <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="工料管理" PostBackUrl="~/PriceAnalysis.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="BB02" runat="server" Text="常用辭庫" PostBackUrl="~/WordLibrary.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB03" runat="server" Text="施工元件" PostBackUrl="~/ConIllLibrary.aspx"></asp:LinkButton><br /></li>

</ul>
</nav>--%>