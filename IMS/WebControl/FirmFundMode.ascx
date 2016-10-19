<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FirmFundMode.ascx.cs" Inherits="IMS.WebControl.FirmFundMode1" %>
<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">包商計價</a></li>
                        <li><a href="FFundView.aspx">分包商計價檢視</a></li>
                        <li><a href="FFundEdit.aspx">分包商計價增修</a></li>
                        <li><a href="FFundDebitM.aspx">分包商扣款管理</a></li>
                        <li><a href="FFundIncreaseM.aspx">分包商加款管理</a></li>
                       
                    </ul>
                </div>
            </div>

<%--<nav>
    <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="分包商計價檢視" PostBackUrl="~/FFundView.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="分包商計價增修" PostBackUrl="~/FFundEdit.aspx"></asp:LinkButton><br /></li>                                                                                     
    <li><asp:LinkButton ID="BB03" runat="server" Text="分包商扣款管理" PostBackUrl="~/FFundDebitM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="分包商加款管理" PostBackUrl="~/FFundIncreaseM.aspx"></asp:LinkButton><br /></li>  
 </ul>
</nav>--%>
