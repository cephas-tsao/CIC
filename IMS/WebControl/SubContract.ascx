<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubContract.ascx.cs" Inherits="IMS.WebControl.SubContract" %>

<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">採購發包</a></li>
                        <li><a href="SubBudgetAdd.aspx">新增分包預算</a></li>
                        <li><a href="SubBudgetEdit.aspx">分包預算編修</a></li>
                        <li><a href="SubInviteAdd.aspx">新增邀標單</a></li>
                        <li><a href="SubInviteM.aspx">邀標單管理</a></li>
                        <li><a href="SubBargain.aspx">協力廠商議價議約</a></li>
                        <li><a href="SubContractAdd.aspx">新增分包合約</a></li>
                        <li><a href="SubContractM.aspx">分包合約管理</a></li>
                        <li><a href="PurchaseView.aspx">採購發包綜合檢視</a></li>
                        <li><a href="ChangeSubBudget.aspx">分包追加減</a></li>
            
                       
                    </ul>
                </div>
            </div> 

<%--<nav>
        <ul id="menu">
    <li><asp:LinkButton ID="CB01" runat="server" Text="新增分包預算" PostBackUrl="~/SubBudgetAdd.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB02" runat="server" Text="分包預算編修" PostBackUrl="~/SubBudgetEdit.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB03" runat="server" Text="新增邀標單" PostBackUrl="~/SubInviteAdd.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB04" runat="server" Text="邀標單管理" PostBackUrl="~/SubInviteM.aspx"></asp:LinkButton><br /></li>
   <li> <asp:LinkButton ID="CB05" runat="server" Text="協力廠商議價議約" PostBackUrl="~/SubBargain.aspx"></asp:LinkButton><br /></li>   
    <li><asp:LinkButton ID="CB06" runat="server" Text="新增分包合約" PostBackUrl="~/SubContractAdd.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB07" runat="server" Text="分包合約管理" PostBackUrl="~/SubContractM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB08" runat="server" Text="採購發包綜合檢視" PostBackUrl="~/PurchaseView.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="CB09" runat="server" Text="分包追加減" PostBackUrl="~/ChangeSubBudget.aspx"></asp:LinkButton><br /></li>
</ul>
</nav>--%>