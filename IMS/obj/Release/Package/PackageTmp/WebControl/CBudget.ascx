<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CBudget.ascx.cs" Inherits="IMS.WebControl.CBudget" %>
 <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">合約預算</a></li>
                        <li><a href="CBudgetImport.aspx">代入合約預算</a></li>
						<li><a href="ProLibrary.aspx">合約工料資料庫</a></li>
                        <li><a href="CBudgetEdit.aspx">合約預算建置編修</a></li>
                        <li><a href="CBudgetView.aspx">合約預算檢視</a></li>
                       <li><a href="ChangeCBudget.aspx">合約預算變更</a></li>
                       
                    </ul>
                </div>
            </div> 
<%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="代入合約預算" PostBackUrl="~/CBudgetImport.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="合約預算建置編修" PostBackUrl="~/CBudgetEdit.aspx"></asp:LinkButton><br /></li>
  <li><asp:LinkButton ID="BB03" runat="server" Text="合約預算檢視" PostBackUrl="~/CBudgetView.aspx"></asp:LinkButton><br /></li>
      <li><asp:LinkButton ID="BB04" runat="server" Text="合約預算變更" PostBackUrl="~/ChangeCBudget.aspx"></asp:LinkButton><br /></li>

</ul>
</nav>--%>