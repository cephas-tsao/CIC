<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wordlibrary_AllSearch.aspx.cs" Inherits="IMS.Wordlibrary_AllSearch" MaintainScrollPositionOnPostback="true" %>
<%@ Register TagPrefix="Area" TagName="MemberBoxUC" Src="~/Webcontrol/Usual.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link rel="stylesheet" type="text/css" href="./css/Style1.css" />
    <title>常用詞庫</title>
      <style type="text/css">
         .Label {
         padding-left:400px;
         font-size:large;
         font-weight:900;       
         color:blue;
      
         }
         
         
          </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <Area:MemberBoxUC ID="MemberBox" runat="server" /> 
     <div style="width:95%">
            <table class="Table100">
            <tr>
                <td class="TableTop">&nbsp;&nbsp;
                    <asp:LinkButton ID="LBtn_2" runat="server" ForeColor="White" >常用詞庫全資料搜尋</asp:LinkButton>
                </td>
            </tr>
            </table>
         <div style="margin-top:50px;">
    <asp:Button ID="btn_back" runat="server" Text="返回常用詞庫管理" Height="30px" OnClick="btn_back_Click" Font-Size="Large" Width="250px" /><br /><br />
    <asp:Label runat="server" Text="關鍵字："></asp:Label>
    <asp:TextBox ID="TB_Query_Word" runat="server" Width="200px" Height="25px"></asp:TextBox>
    <asp:Button ID="btn_seach" runat="server" Text="搜尋" OnClick="btn_seach_Click"  Font-Size="Large" Height="30px" Width="100px"/><br />
   </div>
   <%-- <asp:Label ID="LBQuery1" runat="server" Text="日報工作內容" Visible="false" CssClass="Label"></asp:Label><br /><br />--%>
          <div >
            <table class="Table100" id="table1" runat="server" visible="false">
            <tr>
                <td class="Table0">&nbsp;&nbsp;
               <asp:Label ID="LBQuery1" runat="server" Text="日報工作內容" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
    <asp:GridView ID="Gv_Query1" runat="server" DataSourceID="Sql_Query1" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
           <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" Visible="False" />
                <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                    <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
          <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                  <table class="Table100" id="table2" runat="server" visible="false">
            <tr>
                <td class="Table0">&nbsp;&nbsp;             
                       <asp:Label ID="LBQuery2" runat="server" Text="施工記事" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
 
    <asp:GridView ID="Gv_Query2" runat="server" DataSourceID="Sql_Query2" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
          <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" Visible="False" />
               <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                   <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
          <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                        <table class="Table100" id="table3" runat="server" visible="false">
            <tr>
                <td class="Table0">  
                      <asp:Label ID="LBQuery3" runat="server" Text="合約備註" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
  
    <asp:GridView ID="Gv_Query3" runat="server" DataSourceID="Sql_Query3" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
           <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" Visible="False" />
               <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                   <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
         <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                           <table class="Table100" id="table4" runat="server" visible="false">
            <tr>
                <td class="Table0">                   
                     <asp:Label ID="LBQuery4" runat="server" Text="業主建築師指示" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
   
    <asp:GridView ID="Gv_Query4" runat="server" DataSourceID="Sql_Query4" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
        <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="UnitID" SortExpression="UnitID" Visible="False" />
                <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                    <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
         <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                    <table class="Table100" id="table5" runat="server" visible="false">
            <tr>
                <td class="Table0">
                    <asp:Label ID="LBQuery5" runat="server" Text="人力機具" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
    
    <asp:GridView ID="Gv_Query5" runat="server" DataSourceID="Sql_Query5" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
           <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="單位" SortExpression="UnitID" />
               <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                   <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
          <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                   <table class="Table100" id="table6" runat="server" visible="false">
            <tr>
                <td class="Table0">
                        <asp:Label ID="LBQuery6" runat="server" Text="材料" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>

    <asp:GridView ID="Gv_Query6" runat="server" DataSourceID="Sql_Query6" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
          <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="單位" SortExpression="UnitID" />
                <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                    <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
          <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView><br />
                  <table class="Table100" id="table7" runat="server" visible="false">
            <tr>
                <td class="Table0">
                      <asp:Label ID="LBQuery7" runat="server" Text="工作項目" Visible="false" ForeColor="White"></asp:Label>
                </td>
            </tr>
            </table>
  
    <asp:GridView ID="Gv_Query7" runat="server" DataSourceID="Sql_Query7" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" Visible="false" RowStyle-Height="30px"
                Width="100%" ForeColor="#333333" BorderWidth="1px" BorderColor="#000000" GridLines="Both">
         <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
       	<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
            <asp:BoundField DataField="Content" HeaderText="常用詞" SortExpression="Content" />
            <asp:BoundField DataField="Sortnumber" HeaderText="Sortnumber" SortExpression="Sortnumber" Visible="False" />
            <asp:BoundField DataField="UnitID" HeaderText="單位" SortExpression="UnitID" />
               <asp:CommandField ButtonType="Button" HeaderText="資料異動" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px">
                   <ControlStyle CssClass="BtnFree" />
                        <ItemStyle Width="200px"></ItemStyle>
                    </asp:CommandField>
        </Columns>
         <EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
         </div>
     <asp:SqlDataSource ID="Sql_Query1" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='日報工作內容'" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" 
         UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID">  
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>

     </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query2" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='施工記事'" 
         UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
          <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query3" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='合約備註'" 
        UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query4" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='業主建築師指示'" 
        UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query5" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues"  ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='人力機具'" 
        UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query6" runat="server"  OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='材料'" 
        UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Sql_Query7" runat="server" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UsualWord] Where Type='工作項目'" 
        UpdateCommand="UPDATE [UsualWord] SET [Content] = @Content WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM [UsualWord] WHERE [ID] = @original_ID" >
         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_Type" Type="String" />
                    <asp:Parameter Name="original_Content" Type="String" />
                    <asp:Parameter Name="original_Sortnumber" Type="Int32" />
                </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
