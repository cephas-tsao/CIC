<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OFundModel.ascx.cs" Inherits="IMS.WebControl.OFundModel" %>

<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">業主請款</a></li>
                        <li><a href="OFundView.aspx">業主計價檢視</a></li>
                        <li><a href="OFundEdit.aspx">業主計價增修</a></li>
                        <li><a href="OFundDebitM.aspx">業主扣款管理</a></li>
                        <li><a href="OFundIncreaseM.aspx">業主加款管理</a></li>
            
                       
                    </ul>
                </div>
            </div>
<%--<nav>
 <ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="業主計價檢視" PostBackUrl="~/OFundView.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB02" runat="server" Text="業主計價增修" PostBackUrl="~/OFundEdit.aspx"></asp:LinkButton><br /></li>                                                                                     
    <li><asp:LinkButton ID="BB03" runat="server" Text="業主扣款管理" PostBackUrl="~/OFundDebitM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="業主加款管理" PostBackUrl="~/OFundIncreaseM.aspx"></asp:LinkButton><br /></li>  
 </ul>
</nav>--%>
