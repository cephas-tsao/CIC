<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AI.ascx.cs" Inherits="IMS.WebControl.AI" %>
<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">決策支援</a></li>
                        <li><a href="AI.aspx">人工智慧模式管理</a></li>
                        <li><a href="AI_model.aspx">建築成本概算</a></li>
                        <li><a href="AI_model2.aspx">深開挖壁體變位預測</a></li>
                       <li><a href="AI_model3.aspx">專案現金流量預測</a></li>
                        <li><a href="AI_model4.aspx">專案完工總成本預測</a></li>
                        <li><a href="AI_model5.aspx">專案完工工期推論</a></li>
                        <li><a href="AI_model6.aspx">營造廠專業協力廠商評鑑</a></li>
                        <li><a href="AI_CBR_SIM.aspx">工程爭議案例推論</a></li>
                    </ul>
                </div>
            </div>
<%--<nav>
<ul id="menu">
    <li><asp:LinkButton ID="BB01" runat="server" Text="人工智慧模式管理" PostBackUrl="~/AI.aspx"></asp:LinkButton><br/></li> 
    <%--<li><asp:LinkButton ID="BB02" runat="server" Text="公有雲案例管理" PostBackUrl="~/AI_Add.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="BB03" runat="server" Text="私有雲案例管理" PostBackUrl="~/AI_Private.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="建築成本概算" PostBackUrl="~/AI_model.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="BB05" runat="server" Text="深開挖壁體變位預測" PostBackUrl="~/AI_model2.aspx"></asp:LinkButton><br/></li>
     <li><asp:LinkButton ID="LinkButton2" runat="server" Text="專案現金流量預測" PostBackUrl="~/AI_model3.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="LinkButton3" runat="server" Text="專案完工總成本預測" PostBackUrl="~/AI_model4.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="LinkButton4" runat="server" Text="專案完工工期推論" PostBackUrl="~/AI_model5.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="LinkButton5" runat="server" Text="營造廠專業協力廠商評鑑" PostBackUrl="~/AI_model6.aspx"></asp:LinkButton><br/></li>
    <li><asp:LinkButton ID="BB06" runat="server" Text="工程爭議案例推論" PostBackUrl="~/AI_CBR_SIM.aspx"></asp:LinkButton><br/></li>
    
  


</ul>
</nav>--%>