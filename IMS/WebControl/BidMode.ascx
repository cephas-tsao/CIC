<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="BidMode.ascx.cs" Inherits="IMS.WebControl.BidMode" %>
 <!--=========slider_scroll======================-->
            <div id="slider_scroll">
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="#">投標預算</a></li>
                        <li><a href="BidView.aspx">標案綜合檢視</a></li>
                        <li><a href="BidInfo1.aspx">未成案訊息管理</a></li>
                        <li><a href="BidInfoM.aspx">標案資訊管理</a></li>
                       <li><a href="BidPreAssess.aspx">投標評估(初評)</a></li>
                        <li><a href="BidReAssess.aspx">投標評估(複評)</a></li>
                        <li><a href="BidRecord.aspx">決標紀錄</a></li>
                        <li><a href="BidSetting.aspx">常用資料維護</a></li>
                    </ul>
                </div>
            </div>

  <%--  <nav>
    
    	<ul id="menu">
   <li class="current"> <asp:LinkButton ID="BC01" runat="server" Text="標案綜合檢視"  PostBackUrl="~/BidView.aspx"></asp:LinkButton><br /></li>
              <li> <asp:LinkButton ID="BC02" runat="server" Text="未成案訊息管理"  PostBackUrl="~/BidInfo1.aspx"></asp:LinkButton><br /></li>
             <li> <asp:LinkButton ID="BC03" runat="server" Text="標案資訊管理"  PostBackUrl="~/BidInfoM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BC04" runat="server" Text="投標評估(初評)"  PostBackUrl="~/BidPreAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BC05" runat="server" Text="投標評估(複評)"  PostBackUrl="~/BidReAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BC06" runat="server" Text="決標紀錄"  PostBackUrl="~/BidRecord.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="BC07" runat="server" Text="常用資料維護"  PostBackUrl="~/BidSetting.aspx"></asp:LinkButton><br /></li>
  
             </ul></nav>--%>

