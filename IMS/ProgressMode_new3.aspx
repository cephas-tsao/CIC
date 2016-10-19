<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProgressMode_new3.aspx.cs" Inherits="IMS.ProgressMode_new3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>進度管理</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
        google.load("visualization", "1.1", { packages: ["line"] });
        google.setOnLoadCallback(drawChart2);
        function drawChart2() {
            var data2 = new google.visualization.DataTable();
            data2.addColumn('number', '天數');
            data2.addColumn('number', '預定進度完成度(%)');
            data2.addColumn('number', '實際進度完成度(%)');
            data2.addColumn('number', '預定進度完成日');
            data2.addRows([
                <%=LString() %>
                //[1, 100, 100],
                //[2, 200, 400],
                //[3, 500, 500]
            ]);

            var options2 = {
                chart: {
                    title: 'S-Curve'
                },
                width: 600,
                height: 300
            };

            var chart2 = new google.charts.Line(document.getElementById('SCurve_div'));

            chart2.draw(data2, options2);
        }
    </script>


    <asp:SqlDataSource ID="Sql_DDL_Version" runat="server"></asp:SqlDataSource>
    
    <asp:Button ID="Btn_LoadReport" runat="server" Text="載入日報資訊" OnClick="Btn_LoadReport_Click" />
    <asp:Label runat="server" Text="警告：重新載入日報會清除目前所有實際施作項目" ForeColor="Red"></asp:Label>
    <br />
    <asp:label runat="server" Text="版本控制"></asp:label><br />
    <asp:Label runat="server" Text="實際進度版本："></asp:Label>
    <asp:DropDownList ID="DDL_Version" runat="server" DataSourceID="Sql_DDL_Version" DataTextField="Version" DataValueField="Version" AutoPostBack="true" OnSelectedIndexChanged="DDL_Version_SelectedIndexChanged"></asp:DropDownList>
    <asp:Label runat="server" Text="預排進度版本："></asp:Label>
    <asp:DropDownList ID="DDL_PreVersion" runat="server" DataSourceID="Sql_DDL_PreVersion" DataTextField="Version" DataValueField="Version" AutoPostBack="true"></asp:DropDownList>
    <asp:SqlDataSource ID="Sql_DDL_PreVersion" runat="server"></asp:SqlDataSource>
    <br />
    <asp:label ID="Label1" runat="server" Text="新增項目"></asp:label>
    <br />
    <asp:Label runat="server" Text="實際施作項目："></asp:Label>
    <asp:DropDownList ID="DDL_Activities" runat="server" DataSourceID="Sql_DDL_Activities" DataTextField="WIName" DataValueField="ProgressID"></asp:DropDownList>
    <asp:SqlDataSource ID="Sql_DDL_Activities" runat="server"></asp:SqlDataSource>
    <asp:Label runat="server" Text="施作日期："></asp:Label>
    <asp:TextBox ID="TB_Date" runat="server" onclick="WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));"></asp:TextBox>
    <asp:Label runat="server" Text="本次進度："></asp:Label>
    <asp:TextBox ID="TB_Prog" runat="server"></asp:TextBox>
    <asp:Button ID="Btn_Add" runat="server" Text="新增實際施作項目" OnClick="Btn_Add_Click" />
    <asp:Button ID="Btn_NewVersionAdd" runat="server" Text="新增項目至新版本" OnClick="Btn_NewVersionAdd_Click" />
    <asp:SqlDataSource ID="Sql_DDL_Gv_Activities" runat="server"></asp:SqlDataSource>
    <br />
    <asp:Label runat="server" Text="實際日報編輯區"></asp:Label><br />
    <asp:GridView ID="Gv_Prog" runat="server" DataSourceID="Sql_Gv_Prog" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RealProgID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RealProgID" HeaderText="RealProgID" InsertVisible="False" ReadOnly="True" SortExpression="RealProgID" Visible="False" />
            <asp:BoundField DataField="ProgressID" HeaderText="ProgressID" SortExpression="ProgressID" Visible="False" />
            <asp:TemplateField HeaderText="作業名稱">
                <ItemTemplate>
                    <%# Get_WiName_By_ProgressID(Eval("ProgressID")) %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDL_Gv_Activities" runat="server" DataSourceID="Sql_DDL_Gv_Activities" DataTextField="tt" DataValueField="ProgressID" selectedValue='<%# Bind("ProgressID") %>'></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="WorkDate" HeaderText="WorkDate" SortExpression="WorkDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="CompleteAmount" HeaderText="本次施作完成度" SortExpression="CompleteAmount" />
            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" Visible="False" />
            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" SortExpression="ProjectID" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Sql_Gv_Prog" runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Progress_Real] WHERE [RealProgID] = @original_RealProgID" InsertCommand="INSERT INTO [Progress_Real] ([ProgressID], [WorkDate], [CompleteAmount], [Version], [ProjectID]) VALUES (@ProgressID, @WorkDate, @CompleteAmount, @Version, @ProjectID)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Progress_Real]" UpdateCommand="UPDATE [Progress_Real] SET [ProgressID] = @ProgressID, [WorkDate] = @WorkDate, [CompleteAmount] = @CompleteAmount WHERE [RealProgID] = @original_RealProgID">
        <DeleteParameters>
            <asp:Parameter Name="original_RealProgID" Type="Int32" />
            <asp:Parameter Name="original_ProgressID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_WorkDate" />
            <asp:Parameter Name="original_CompleteAmount" Type="Int32" />
            <asp:Parameter Name="original_Version" Type="Int32" />
            <asp:Parameter Name="original_ProjectID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProgressID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="WorkDate" />
            <asp:Parameter Name="CompleteAmount" Type="Int32" />
            <asp:Parameter Name="Version" Type="Int32" />
            <asp:Parameter Name="ProjectID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProgressID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="WorkDate" />
            <asp:Parameter Name="CompleteAmount" Type="Int32" />
            <asp:Parameter Name="Version" Type="Int32" />
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="original_RealProgID" Type="Int32" />
            <asp:Parameter Name="original_ProgressID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_WorkDate" />
            <asp:Parameter Name="original_CompleteAmount" Type="Int32" />
            <asp:Parameter Name="original_Version" Type="Int32" />
            <asp:Parameter Name="original_ProjectID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label runat="server" Text="實際進度桿狀圖"></asp:Label><br />
    <asp:Table ID="Tbl_RP" runat="server"></asp:Table>
    <br />
    <asp:Label runat="server" Text="預定進度實際進度比較桿狀圖"></asp:Label><br />
    <asp:Table ID="Tbl_Compare" runat="server"></asp:Table>
    <br />
    <div id="SCurve_div" style="width:600px;visibility:visible"></div>
</asp:Content>
