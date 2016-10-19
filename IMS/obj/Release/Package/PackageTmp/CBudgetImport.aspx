<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site1.Master" CodeBehind="CBudgetImport.aspx.cs"  Inherits="IMS.CBudgetImport" %>

<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/CBudget.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <body>
    <title>合約預算模組</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

    <script type="text/javascript">
        function UpdtItemOrder() {

            $.ajax({
                type: "POST",

                url: '../Ajax/UpdateCBItemOrder.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function addLayerCode() {

                    $.ajax({
                        type: "POST",

                        url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                        //data: { "uid": uid },

                        dataType: 'text',
                        success: function (msg) {

                            alert("項次更新成功");


                        }

                    })

                }

            })
        }

        function addLayerCode() {

            $.ajax({
                type: "POST",

                url: '../Ajax/AddBWLayerCode.aspx?action=addsave',

                //data: { "uid": uid },

                dataType: 'text',

                success: function (msg) {

                    alert("階層碼更新成功");


                }

            })

        }

    </script>

      <style type="text/css">


        .auto-style67 {
            width: 100%;
        }
        .auto-style1 {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .auto-style2L {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: left;
	        color: #000000;
        }
        .auto-style2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #97CBFF;
	        text-align: center;
	        color: #000000;
        }
        .auto-style3 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #ECF5FF;
	        text-align:left;
	        color: #000000;
        }
        .TableUp {
            width: 100%;
            border-top:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


        .TableDown {
            width: 100%;
            border-bottom:ridge;
            border-left:ridge;
            border-right:ridge;
        }
        


            .auto-style15 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFF99;
                text-align: center;
                color: #000000;
                }
            .auto-style16 {
                font-family: 微軟正黑體;
                font-size: medium;
                background-color: #FFFBD6;
                text-align: left;
                color: #000000;
                }



            .auto-style17 {
	color: #FF0000;
    
}


        </style>


    
    <div>
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
        <br />
    
        <table class="auto-style67" style="border-color:transparent" border="1">
            <tr>
                <td class="auto-style1">代入合約預算</td>
            </tr>
            <tr>
                <td class="auto-style2L">&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">XML匯入</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Pnl_XML" runat="server" Visible="False" >
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2">請選擇檔案</td>
                                <td class="auto-style3">
                                    <asp:FileUpload ID="FileUpload1" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="479px" />
                                </td>
                                <td class="auto-style3">說明：<br /> 1.XML匯入功能僅限以<span class="auto-style17">PCCES匯出之預算書XML檔</span>匯入。<br>2.目前操作之專案將會先行清空既有合約預算項目及專案工料資料庫中之資源項目，再將XML檔之內容匯入，請使用者再次確認匯入之專案是否選擇正確。<br>3.合約預算匯入後如欲確認編修相關內容請至<asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" ForeColor="Red">合約預算編修</asp:HyperLink>
                                    進行編修。<br>4.合約預算匯入後XML檔內之資源項目將自動存入專案工料資料庫，如欲編修請至<asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="True" ForeColor="Red">專案工料資料庫</asp:HyperLink>
                                    進行編修。</br>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="3">
                                    <asp:Button ID="BtnImport" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定匯入" Width="107px" OnClick="BtnImport_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
              </table>
        <table class="auto-style67" style="border-color:transparent;" border="1">
            <tr >
                <td class="auto-style2L">
                    &nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">EXCEL格式檔案下載</asp:LinkButton>
                </td>
            </tr>
          
                    <asp:Panel ID="Panel1" runat="server" Visible="False" style="border-color:transparent" border="1">
                        <table style="width: 100%" >
                            <tr >
                                <td class="auto-style2" style="width: 15%">格式範例下載</td>
                                <td class="auto-style3">
                                    <asp:Button ID="Button1" runat="server" Font-Names="微軟正黑體" Text="下載制式格式" Width="150px" Font-Size="Large" Height="50px" OnClick="Button6_Click" />
                                    <br></br>
                                    </td>
                            </tr>
                        </table>
                    </asp:Panel>
            </table>
           <table class="auto-style67">
            <tr>
                <td class="auto-style2L">            
                    &nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">EXCEL匯入</asp:LinkButton>
                </td>
            </tr>
            </table>
             <asp:Panel ID="Pnl_EXCEL" runat="server" Visible="False">
                        <table style="width: 100%">
                            <tr>
                                <td class="auto-style2" rowspan="2">請選擇檔案</td>
                                <td class="auto-style3" rowspan="2">
                                    <asp:FileUpload ID="FileUpload2" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" Height="30px" Width="479px" />
                                    <br />
                                   </td>
                                <td class="auto-style3">說明：<br />1.僅提供由本系統制定格式之EXCEL檔進行匯入<br /> 2.目前操作之專案將會先行清空既有合約預算項目及專案工料資料庫中之資源項目，再將所選標案之投標預算內容匯入，請使用者再次確認匯入之專案是否選擇正確。<br>3.合約預算匯入後如欲確認編修相關內容請至<asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="True" ForeColor="Red">合約預算編修</asp:HyperLink>
                                    進行編修。<br>4.所選標案之資源項目亦會自動存入專案工料資料庫，如欲編修請至<asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="True" ForeColor="Red">專案工料資料庫</asp:HyperLink>
                                    進行編修。<br></br>
                                    </br>
                                    </br>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                   <%-- <asp:Button ID="Button6" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Height="45px" Text="下載制式檔案" Width="130px" OnClick="Button6_Click" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" colspan="3">
                                    <asp:Button ID="BtnImportExcel" runat="server" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" Height="53px" Text="確定匯入" Width="107px" OnClick="BtnImportExcel_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
             
    
    </div>


    </asp:Content>