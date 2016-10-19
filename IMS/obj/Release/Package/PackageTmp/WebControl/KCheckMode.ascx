<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KCheckMode.ascx.cs" Inherits="IMS.WebControl.KCheckMode" %>
 <!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                  
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">品質管理</a></li>
                        <li><a href="KEngineeringList.aspx">公司樣板管理</a></li>
                        <li><a href="KCheckListW.aspx">專案表單管理</a></li>
                        <li><a href="KCheckListC.aspx">自主檢查表管理</a></li>
                        <li><a href="KCheckListH.aspx">自主檢查表檢視</a></li>
                        <li><a href="KCheckListL.aspx">缺失改善追蹤</a></li>                      
                      
                    </ul>
                </div>
            </div> 
<nav>
   <%--   <ul id="menu">
  
      <li><asp:LinkButton ID="BB01" runat="server" Text="自主檢查表管理" PostBackUrl="~/KEngineeringList.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="BB02" runat="server" Text="自主檢查表列表" PostBackUrl="~/KCheckListW.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB03" runat="server" Text="自主檢查表日期填報" PostBackUrl="~/KCheckListC.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB04" runat="server" Text="自主檢查表檢視" PostBackUrl="~/KCheckListH.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BB05" runat="server" Text="缺失改善追蹤" PostBackUrl="~/KCheckListL.aspx"></asp:LinkButton><br /></li>  
    <%--<li><asp:LinkButton ID="BB06" runat="server" Text="統計分析" PostBackUrl="~/KCheckListS.aspx"></asp:LinkButton><br /></li> 
</ul> --%>
</nav>