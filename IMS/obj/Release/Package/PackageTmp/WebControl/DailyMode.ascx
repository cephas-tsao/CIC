<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DailyMode.ascx.cs" Inherits="IMS.WebControl.FirmFundMode" %>
  <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">日報管理</a></li>
                        <li><a href="DailyFill.aspx">日報填寫</a></li>
                        <li><a href="DailyView.aspx">日報檢視</a></li>
                        <li><a href="DailyWeatherView.aspx">晴雨表總覽</a></li>
                        <li><a href="DailyWorkPicView.aspx">施工照片總覽</a></li>
                        <li><a href="DailyWorkPicView.aspx">檢驗取樣記錄總覽</a></li>
                        <li><a href="DailyWorkPicView.aspx">日報常用設定</a></li>
                      
                    </ul>
                </div>
            </div>

<%--<nav>
    <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="日報填寫" PostBackUrl="~/DailyFill.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="日報檢視" PostBackUrl="~/DailyView.aspx"></asp:LinkButton><br /></li>                                                                                     
    <li><asp:LinkButton ID="BB03" runat="server" Text="晴雨表總覽" PostBackUrl="~/DailyWeatherView.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="施工照片總覽" PostBackUrl="~/DailyWorkPicView.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB05" runat="server" Text="檢驗取樣記錄總覽" PostBackUrl="~/DailyTestView.aspx"></asp:LinkButton><br /></li>  
    <li><asp:LinkButton ID="BB06" runat="server" Text="日報常用設定" PostBackUrl="~/DailySetting.aspx"></asp:LinkButton><br /></li>      
 </ul>
</nav>--%>
