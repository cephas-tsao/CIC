<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExeBudget.ascx.cs" Inherits="IMS.WebControl.ExeBudget" %>
 <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">執行預算</a></li>
                        <li><a href="ExeBudgetEdit.aspx">執行預算編輯</a></li>
                        <li><a href="ExeBudgetView.aspx">執行預算檢視</a></li>
                        <li><a href="ChangeEBudget.aspx">執行預算變更</a></li>
                       
                    </ul>
                </div>
            </div>
<%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="執行預算編輯" PostBackUrl="~/ExeBudgetEdit.aspx"></asp:LinkButton><br /></li>
                                                                      
    <li><asp:LinkButton ID="BB03" runat="server" Text="執行預算檢視" PostBackUrl="~/ExeBudgetView.aspx"></asp:LinkButton><br /></li>
   <li><asp:LinkButton ID="BB04" runat="server" Text="執行預算變更" PostBackUrl="~/ChangeEBudget.aspx"></asp:LinkButton><br /></li>

</ul>
</nav>--%>