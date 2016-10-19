<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompletionMode.ascx.cs" Inherits="IMS.WebControl.CompletionMode" %>
 <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">竣工驗收</a></li>
                        <li><a href="CompletionFill.aspx">竣工數量填列</a></li>
                        <li><a href="AcceptanceView.aspx">驗收紀錄檢視</a></li>
                        <li><a href="AcceptanceM.aspx">驗收紀錄管理</a></li>
                      
                    </ul>
                </div>
            </div>
<%--<nav>
    <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="竣工數量填列" PostBackUrl="~/CompletionFill.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="驗收紀錄檢視" PostBackUrl="~/AcceptanceView.aspx"></asp:LinkButton><br /></li>                                                                                     
    <li><asp:LinkButton ID="BB03" runat="server" Text="驗收紀錄管理" PostBackUrl="~/AcceptanceM.aspx"></asp:LinkButton><br /></li>    
 </ul>
</nav>--%>
