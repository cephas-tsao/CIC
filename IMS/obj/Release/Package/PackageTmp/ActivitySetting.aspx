<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivitySetting.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="IMS.ActivitySetting" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/ProgressMode.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>進度管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <link rel="stylesheet" type="text/css" href="./css/StyleSht.css" />
    <style type="text/css">
        input{
	/* 用戶輸入框的樣式 */
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px; border:1px solid #000000;
	width:200px; padding:1px; margin:0px;
}
#popup{
	/* 提示框div塊的樣式 */
	position:absolute; width:202px;
	color:#004a7e; font-size:14px;
	font-family:Arial, Helvetica, sans-serif;
	left:88%; top:1%;
    background-color:#FFFFFF;
}
#popup.show{
	/* 顯示提示框的邊框 */	
	border:1px solid #004a7e;
}
#popup.hide{
	/* 隱藏提示框的邊框 */
	border:none;
}
/* 提示框的樣式風格 */
ul{
	list-style:none;
	margin:0px; padding:0px;
}
li.mouseOver{
	background-color:#004a7e;
	color:#FFFFFF;
}
li.mouseOut{
	background-color:#FFFFFF;
	color:#004a7e;
}  
   </style>
    <script>
        var oInputField;	//考慮到很多函數中都要使用        
        var oPopDiv;		//因此採用全局變量的形式      
        var oColorsUl;
        var xmlHttp;
        function createXMLHttpRequest() {
            if (window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            else if (window.XMLHttpRequest)
                xmlHttp = new XMLHttpRequest();
        }
        function initVars() {
            //初始化變量
            oInputField = document.forms["form1"].searcher;
           
            oPopDiv = document.getElementById("popup");
            //oPopDiv1 = document.getElementById("popup1");
            oColorsUl = document.getElementById("colors_ul");
        }
        function clearColors() {
            //清除提示內容
            for (var i = oColorsUl.childNodes.length - 1; i >= 0; i--)
                oColorsUl.removeChild(oColorsUl.childNodes[i]);
            if (oPopDiv != null) {
                oPopDiv.className = "hide";
            }
           
        }
        function setColors(the_colors) {
            //顯示提示框，傳入的參數即為匹配出來的結果組成的數組
            clearColors();	//每輸入一個字母就先清除原先的提示，再繼續
            if (oPopDiv) {
                oPopDiv.className = "show";
            }
          
            var oLi;
            for (var i = 0; i < the_colors.length; i++) {
                //將匹配的提示結果逐一顯示給用戶
                oLi = document.createElement("li");
                oColorsUl.appendChild(oLi);
                oLi.appendChild(document.createTextNode(the_colors[i]));

                oLi.onmouseover = function () {
                    this.className = "mouseOver";	//鼠標經過時高亮
                }
                oLi.onmouseout = function () {
                    this.className = "mouseOut";	//離開時恢復原樣
                }
                oLi.onclick = function () {
                    //用戶點擊某個匹配項時，設置輸入框為該項的值
                    if (oInputField) {
                        oInputField.value = this.firstChild.nodeValue;
                    }
                    else if (oInputField1) {
                        oInputField1.value = this.firstChild.nodeValue;
                    }
                    clearColors();	//同時清除提示框
                }
            }
        }
        function findWBS() {
            initVars();		//初始化變量
            if (oInputField.value.length > 0) {
                createXMLHttpRequest();		//將用戶輸入發送給服務器
                var sUrl = "../Ajax/Findkey.aspx?Activity=" + encodeURI(oInputField.value) + "&timestamp=" + new Date().getTime();
                xmlHttp.open('GET', sUrl, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        var aResult = new Array();
                        if (xmlHttp.responseText.length) {
                            aResult = xmlHttp.responseText.split(",");
                            setColors(aResult);	//顯示服務器結果
                        }
                        else
                            clearColors();
                    }
                }
                xmlHttp.send(null);
            }
            else
                clearColors();	//無輸入時清除提示框（例如用戶按del鍵）
        }
    </script>
<body>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <div>
          <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
    <table class="Table100">
        <tr>
			<td class="TableTop" colspan="2">作業項目設定</td>
		</tr>
       
		<tr>
		<td class="Table1L">
                                    &nbsp;
                                    <asp:ImageButton ID="IBtn_Save" runat="server" Height="30px" ImageUrl="~/img/Save.png" ToolTip="儲存" Width="27px"  OnClick="IBtn_Save_Click" OnClientClick="return confirm('將刪除之前排程並，以現有排程為主，確定要儲存資料資料嗎?');"/>
            &nbsp; <asp:ImageButton ID="ImageBtn_Reload" runat="server" ImageUrl="~/img/Reload.png" ToolTip="重新匯入" Width="27px" OnClick="ImageBtn_Reload_Click" OnClientClick="return confirm('是否從執行預重新匯入, 將會清除所有進度規劃版次?');"/>                   
             &nbsp; <asp:Image ID="IBtn_Lock" runat="server" Height="30px" Width="27px" TabIndex="0" Enabled="False" />
                                </td>
		<td class="Table1R">
                                新增執行預算工項：<asp:DropDownList ID="DDL_EWBS" runat="server" CssClass="DDLlong" Height="35px">
                                        <asp:ListItem Value="0">-請選擇-</asp:ListItem>
                                  <%--      <asp:ListItem>構用混凝土，預拌，2 140kgf/cm2，第1型水泥</asp:ListItem>--%>
                                    </asp:DropDownList>
                              <%-- <input type="text" name="searcher" id="searcher" onkeyup="findWBS();" style="height:30px; padding-top:10px"  />--%>
                      
                                    <asp:ImageButton ID="IBtn_AddNew" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="儲存" Width="27px" OnClick="IBtn_AddNew_Click" />
                                    </td>
                               <div id="popup" >
	                                  <ul id="colors_ul"></ul>
                                <style id="m-search"></style>  </div>           
                          
		</tr>
		</table>
      
                        <table id="ActivityTable" border="1" class="Sht100">
                            <tr class="ShtRowTop">
                                <td class="ShtCellCC">編輯</td>
                                <td class="ShtCellCC" colspan="2">執行預算工項</td>
                                <td class="ShtCellCC">作業項目名稱</td>
                                <td class="ShtCellCC">分攤工項比例</td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand" >
                                <ItemTemplate>
                                <tr class="ShtRowSingle">
                                <td class="ShtCellCC">
                                    <asp:ImageButton ID="IBtn_A1" runat="server" Height="30px" ImageUrl="~/img/AddNewItem.png" ToolTip="新增作業項目" Width="27px" CommandName="Add" CommandArgument='<%# Container.ItemIndex%>'/>
                                    <asp:ImageButton ID="IBtn_D1" runat="server" Height="30px" ImageUrl="~/img/Delete.png" ToolTip="刪除作業項目" Width="27px" CommandName="Del" CommandArgument='<%# Container.ItemIndex%>'/>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:Label ID="LbID" runat="server" Text='<%# Bind("EWID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="LbItemOrder" runat="server" Text='<%# Bind("ItemOrder") %>'></asp:Label></td>
                                <td class="ShtCellCL">
                                    <asp:Label ID="LbItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_N1" runat="server" CssClass="TBlong"></asp:TextBox>
                                </td>
                                <td class="ShtCellCC">
                                    <asp:TextBox ID="TB_P1" runat="server" CssClass="TBshort" style="text-align:center" Text="100"></asp:TextBox>
                                    ％</td>
                            </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                          
                      
                            </table>
    </div>

</body>
</html>



    </asp:Content>