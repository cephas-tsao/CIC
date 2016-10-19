<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BidBudget.ascx.cs" Inherits="IMS.WebControl.BidBudget" %>
  <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">投標管理</a></li>
                        <li><a href="BidBudgetView.aspx">標案檢視</a></li>
                        <li><a href="BidLibrary.aspx">標案工料資料庫</a></li>
                        <li><a href="BidBudgetEdit.aspx">投標預算建置編修</a></li>
                        <li><a href="RFQM.aspx">詢價單管理</a></li>
                      
                    </ul>
                </div>
            </div>
 <%-- <nav>
       <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="標案檢視" PostBackUrl="~/BidBudgetView.aspx"></asp:LinkButton><br /></li>  
    <li><asp:LinkButton ID="BB02" runat="server" Text="標案工料資料庫" PostBackUrl="~/BidLibrary.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="BB03" runat="server" Text="投標預算建置編修" PostBackUrl="~/BidBudgetEdit.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="詢價單管理" PostBackUrl="~/RFQM.aspx"></asp:LinkButton><br /></li>
</ul>
</nav>--%>