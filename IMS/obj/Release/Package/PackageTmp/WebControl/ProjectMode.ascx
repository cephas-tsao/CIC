<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectMode.ascx.cs" Inherits="IMS.WebControl.ProjectMode" %>
  <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">專案管理</a></li>
                        <li><a href="ProjectNew.aspx">新增專案</a></li>
                        <li><a href="ProjectInfoM.aspx">專案資料管理</a></li>
                        <li><a href="ProjectInfoView.aspx">專案基本資料檢視</a></li>
                        <li><a href="ProLibrary.aspx">專案工料資料庫</a></li>
                        <li><a href="CalendarSetting.aspx">工作日設定</a></li>
                       
                    </ul>
                </div>
            </div> 
 <%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="PM01" runat="server" Text="標案轉入" PostBackUrl="~/ProjectBidIn.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="PM02" runat="server" Text="專案資料管理" PostBackUrl="~/ProjectInfoM.aspx"></asp:LinkButton><br /></li>
 
    <li><asp:LinkButton ID="PM03" runat="server" Text="專案基本資料檢視" PostBackUrl="~/ProjectInfoView.aspx"></asp:LinkButton><br /></li>

              <li><asp:LinkButton ID="PM04" runat="server" Text="專案工料資料庫" PostBackUrl="~/ProLibrary.aspx"></asp:LinkButton><br /></li>
</ul>
</nav>--%>