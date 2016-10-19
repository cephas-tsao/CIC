<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FirmMode.ascx.cs" Inherits="IMS.WebControl.FirmMode" %>
<!--=========slider_scroll======================-->
            <div id="slider_scroll" >
                <div id="slider_tab">
                    <span>子</span><span>選</span><span>單</span><span>功</span><span>能</span>
                    <%--<i class="fa fa-leaf"></i>--%>
                </div>
                <div id="slider_content">
                    <%--<iframe id="iframe1" src="iframe11.aspx" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100%; height: 100%;" allowtransparency="true"></iframe>--%>
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse" id="sidenav">
                        <li class="active"><a href="FirmMode.aspx">分包商管理模組</a></li>
                        <li><a href="FirmView.aspx">分包商資料檢視</a></li>
                        <li><a href="FirmM.aspx">分包商基本資料管理</a></li>
                        <li><a href="FirmAssess.aspx">遴選評估(初評)</a></li>
                        <li><a href="FirmSecAssess.aspx">遴選評估(複評)</a></li>
                        <li><a href="FirmCheck.aspx">分包商考核(初評)</a></li>
                        <li><a href="FirmSecCheck.aspx">分包商考核(複評)</a></li>
                       
                    </ul>
                </div>
            </div>
  <%-- <nav>	
    <ul id="menu">
   <li><asp:LinkButton ID="F01" runat="server" Text="基本資料管理" PostBackUrl="~/FirmView.aspx"></asp:LinkButton><br /></li> 
    <li><asp:LinkButton ID="F02" runat="server" Text="包商資料管理" PostBackUrl="~/FirmM.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F03" runat="server" Text="遴選評估(初評)" PostBackUrl="~/FirmAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F04" runat="server" Text="遴選評估(複評)" PostBackUrl="~/FirmSecAssess.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F05" runat="server" Text="分包商考核(初評)" PostBackUrl="~/FirmCheck.aspx"></asp:LinkButton><br /></li>
    <li><asp:LinkButton ID="F06" runat="server" Text="分包商考核(複評)" PostBackUrl="~/FirmSecCheck.aspx"></asp:LinkButton><br /></li>
            </ul>
         </nav>--%>
