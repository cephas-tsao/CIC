using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Excel;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using DAL;



namespace IMS
{
    public partial class BidImport : System.Web.UI.Page
    {
        
            /***Copy Start***/
            //畫面上要先擺一個FileUpload控制項

            /*** Excel Interop reference ***/
            Microsoft.Office.Interop.Excel.Application xlApp = null;
            Workbook wb = null;
            Worksheet ws = null;
            Range aRange = null;
            //*******************************/

            //要上傳Excel檔的Server端 檔案總管目錄
            string upload_excel_Dir = @"D:\asp.net\New PMS\MyFile";
            string ErrorString = "";

            protected void Page_Load(object sender, EventArgs e)
            {
                if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
                {
                    Response.Redirect("Login.aspx");
                }
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                if (!IsPostBack)
                {
                
                SqlDataSource2.SelectCommand = "Select * from XBid1DB";
                SqlDataSource4.SelectCommand = "Select * from BidM0 ";
                DDL_TopWorkItem.DataSource = SqlDataSource2;
                DDL_TopWorkItem.DataBind();
                DropDownList3.DataSource = SqlDataSource4;
                DropDownList3.DataBind();
                    ListItem LI = new ListItem();
                    LI.Text = "--請選擇--";
                    LI.Value = "0";

                    DDL_TopWorkItem.Items.Insert(0, LI);
                    DDL_TopWorkItem.SelectedIndex = 0;
                    DropDownList3.Items.Insert(0, LI);
                    DropDownList3.SelectedIndex = 0;
                    DDL_item.Items.Insert(0, LI);
                    DDL_item.SelectedIndex = 0;
                    DDL_item.Items.Insert(1,"1");
                   
                }
                DropDwonList_layer();
                string layer = DDL_layer.SelectedItem.Value;
                List<int> list = new List<int>();
                for (int i = 1; i <= int.Parse(layer); i++)
                {
                    DDL_WBSlayer.Items.Add(new ListItem(i.ToString(), i.ToString()));

                }
            }


            #region 匯入EXCEL
            //按鈕Click事件
            protected void lbtOK_Click(object sender, EventArgs e)
            {
                string excel_filePath = "";
                if (FileUpload2.HasFile)
                {
                    try
                    {
                        excel_filePath = SaveFileAndReturnPath();//先上傳EXCEL檔案給Server

                        if (this.xlApp == null)
                        {
                            this.xlApp = new Microsoft.Office.Interop.Excel.Application();
                        }
                        //打開Server上的Excel檔案
                        this.xlApp.Workbooks.Open(excel_filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                        this.wb = xlApp.Workbooks[1];//第一個Workbook
                        this.wb.Save();

                        //從第一個Worksheet讀資料
                        SaveOrInsertSheet(excel_filePath, (Worksheet)xlApp.Worksheets[1]);



                        ClientScript.RegisterClientScriptBlock(typeof(System.Web.UI.Page), "匯入完成", "alert('匯入完成');", true);

                    }
                     
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        xlApp.Workbooks.Close();
                        xlApp.Quit();
                        try
                        {
                            //刪除 Windows工作管理員中的Excel.exe 處理緒.
                            System.Runtime.InteropServices.Marshal.ReleaseComObject(this.xlApp);
                            System.Runtime.InteropServices.Marshal.ReleaseComObject(this.ws);
                            System.Runtime.InteropServices.Marshal.ReleaseComObject(this.aRange);
                        }
                        catch { }
                        this.xlApp = null;
                        this.wb = null;
                        this.ws = null;
                        this.aRange = null;


                        //是否刪除Server上的Excel檔
                        bool isDeleteFileFromServer = true;
                        if (isDeleteFileFromServer)
                        {
                            System.IO.File.Delete(excel_filePath);
                        }


                        GC.Collect();
                    }
                   
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(typeof(System.Web.UI.Page), "請選擇檔案", "alert('請選擇檔案');", true);
                }
            }
            #endregion


            #region 儲存EXCEL檔案給Server
            private string SaveFileAndReturnPath()
            {
                string return_file_path = "";//上傳的Excel檔在Server上的位置
                if (FileUpload2.FileName != "")
                {
                    return_file_path = System.IO.Path.Combine(this.upload_excel_Dir, Guid.NewGuid().ToString() + ".xls");

                    FileUpload2.SaveAs(return_file_path);
                }
                return return_file_path;
            }
            #endregion

            #region 把Excel資料Insert into Table
            private void SaveOrInsertSheet(string excel_filename, Worksheet ws)
            {

                //要開始讀取的起始列(微軟Worksheet是從1開始算)
                int rowIndex = 1;
                System.Data.DataTable dt = new System.Data.DataTable();
                //取得一列的範圍
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "J" + rowIndex.ToString());
                dt.Columns.Add("項次", typeof(string));
                dt.Columns.Add("工項名稱", typeof(string));
                dt.Columns.Add("單位", typeof(string));
                dt.Columns.Add("數量", typeof(string));
                dt.Columns.Add("單價", typeof(string));
                dt.Columns.Add("複價", typeof(string));
                dt.Columns.Add("工項類型", typeof(string));
                dt.Columns.Add("工項種類", typeof(string));
                dt.Columns.Add("資源編碼", typeof(string));
                dt.Columns.Add("備註", typeof(string));

                string t1 = First.SelectedItem.Value;
                string t2 =RadioButtonList3.SelectedItem.Value;
                //dt.Rows.Add("xx3", typeof(string)); 
                //判斷Row範圍裡第1格有值的話，迴圈就往下跑
                while (((object[,])this.aRange.Value2)[1, 1] != null)//用this.aRange.Cells[1, 1]來取值的方式似乎會造成無窮迴圈？
                {
                   
                   
                   string cell0 =  ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() :"";
                    //範圍裡第1格的值
                    string cell1 = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";

                    //範圍裡第2格的值
                    string cell2 = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";

                    //範圍裡第3格的值
                    string cell3 = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
                    string cell4 = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
                    string cell5 = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
                    string cell6 = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
                    string cell7 = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
                    string cell8 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
                    string cell9 = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";
                   

                    //再對各Cell處理完商業邏輯後，Insert into Table...(略

                   
                    //DataRow drAddItem;
                    System.Data.DataRow dr = dt.NewRow();
                    //for (int i = 0; i < dt.Rows.Count; i++)
                    //{
                    //    dr = dt.NewRow();
                    //    dr[0] = dt.Rows[i].ToString();
                    //    dr[1] = dt.Rows[i].ToString();//Student Name
                    //    dr[2] = dt.Rows[i].ToString();//Roll No

                       

                    //}

                  
                    // 第一格資料
                    if (t2 == "0")
                    {
                        dr[0] = cell0;
                    }
                    else
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dr[0] =  ((object[,])this.aRange.Value2)[1, 1] ;
                        }
                    }
                   
                    // 第二格資料
                    dr[1] = cell1;
                    // 第三格資料
                    dr[2] = cell2;
                    dr[3] = cell3;
                    dr[4] = cell4;
                    dr[5] = cell5;
                    dr[6] = cell6;
                    dr[7] = cell7;
                    dr[8] = cell8;
                    dr[9] = cell9;
                   
                    // 加入到表格內
                    dt.Rows.Add(dr);




                    //往下抓一列Excel範圍
                    rowIndex++;
                    this.aRange = ws.get_Range("A" + rowIndex.ToString(), "J" + rowIndex.ToString());
                }
                 // 連結表格的資料到 GridView內
                dt.Rows.RemoveAt(0);
                GridView1.DataSource = dt;
                // 並繫結資料
                GridView1.DataBind();
            }
       
        #endregion
            //判断输入是否为中文
            public static bool HasChinese(string content)
            {
                //判断是不是中文
                string regexstr = @"[\u4e00-\u9fa5]";

                if (Regex.IsMatch(content, regexstr))
                {
                    //Log("HasChinese");
                    return true;
                }
                else
                {
                    //Log("Has Not Chinese");
                    return false;
                }
            }

            //判断是不是数字
            public static bool isInterger(string str)
            {
                if (str == "")
                {
                    return false;
                }
                else
                {
                    foreach (char c in str)
                    {
                        if (char.IsNumber(c))
                        {
                            continue;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
                return true;

            }
         protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (RadioButtonList1.SelectedIndex)
        {
            case 0:
                Pnl_Build.Visible = true;
                Pnl_ExcelDIY.Visible = false;
                Pnl_XML.Visible = false;
                break;
            case 1:
                Pnl_Build.Visible = false;
                Pnl_ExcelDIY.Visible = true;
                //import.Visible = true;
                Pnl_XML.Visible = false;
                break;
            case 2:
                Pnl_Build.Visible = false;
                Pnl_ExcelDIY.Visible = false;
                Pnl_XML.Visible = true;
                break;
        }
    }
    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    { 
        if ((RadioButtonList3.SelectedIndex == 1)) {
            DropDownList2.Enabled = true;
        }
        else {
            DropDownList2.Enabled = false;
        }

        if (First.SelectedItem != null)
        {
            string s1 = First.SelectedItem.Text;
        }
        if (Second.SelectedItem != null)
        {
            string s2 = Second.SelectedItem.Text;
        }
        if (Third.SelectedItem != null)
        {
            string s3 = Third.SelectedItem.Text;
        }
        if (Forth.SelectedItem != null)
        {
            string s4 = Forth.SelectedItem.Text;
        }
    }
    protected void DropDwonList_layer()
    {

        string layer = DDL_layer.SelectedItem.Value;
        //StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < int.Parse(layer); i++)
        {
            DropDownList ddl = new DropDownList();
            ddl.ID = i.ToString();

            ddl.DataSourceID = "SqlDataSource1";
            ddl.DataTextField = "OrderName";
            ddl.DataValueField = "Kind";
            //ddl.AppendDataBoundItems = true;
            ddl.SelectedIndexChanged +=RadioButtonList2_SelectedIndexChanged;
            ddl.Items.Insert(0, new ListItem("-請選擇-", "0"));
            ddl.AutoPostBack=true;
            //ddl.SelectedItem.Value
            int y = i + 1;
            PlaceHolder1.Controls.Add(new LiteralControl("<tr><td class=\"auto-style13\">第 " + y + " 階</td><td class=\"auto-style14\">"));

            PlaceHolder1.Controls.Add(ddl);
            ddl.DataBind();
            PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));
        }
    
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        var num = DDL_layer.SelectedValue;
        string[] temp = new string[int.Parse(num)];
        for (int i = 0; i < int.Parse(num); i++)
        {
            
            DropDownList ddl = (DropDownList)PlaceHolder1.FindControl(i.ToString());
          
            temp[i] = ddl.SelectedItem.Value;
          
        }

        //if ((RadioButtonList2.SelectedIndex == 1))
        //{
        //    DDL_layer.Enabled = true;
        //}
        //else
        //{
        //    DDL_layer.Enabled = true;
        //}

        //DropDwonList_layer();
        //  string layer = DDL_layer.SelectedItem.Value;

        //List<int> list = new List<int>();
        //for (int i = 1; i <= int.Parse(layer); i++)
        //{
        //    DropDownList14.Items.Add(new ListItem(i.ToString(), i.ToString()));
         
        //}
        //StringBuilder sBuilder = new StringBuilder();
        //for (int i = 1; i <= int.Parse(layer); i++)
        //{
        //    DropDownList ddl = new DropDownList();
        //    ddl.ID = i.ToString();
        //    //ddl.SelectedIndexChanged += dynamicDDL_SelectedIndexChanged;
        //    //ddl.Items.Add(new ListItem("test1", "test1"));
        //    //ddl.Items.Add(new ListItem("test2", "test2"));
        //    //ddl.Items.Add(new ListItem("test3", "test3"));
        //    ddl.DataSourceID = "SqlDataSource1";
        //    ddl.DataTextField = "OrderName";
        //    ddl.DataValueField = "Kind";
        //    ddl.AppendDataBoundItems = true;
            
        //    ddl.Items.Insert(0, new ListItem("-請選擇-", "0"));


        //    PlaceHolder1.Controls.Add(new LiteralControl("<tr><td class=\"auto-style13\">第 " + i + " 階</td><td class=\"auto-style14\">"));
        //    //  sb.Append("<input type='hidden' name='" + aa.Key + "' value='" + aa.Value + "'>").AppendLine();
        //    //sBuilder.AppendLine(@"" += ddl.DataBind() + "");
           
        //    PlaceHolder1.Controls.Add(ddl);
        //    ddl.DataBind();
        //    PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));
            
         
        //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((Button1.Text == "階層及編號設定鎖定"))
        {
            Button1.Text = "已鎖定";
            Pnl_WBS.Visible = true;
            Pnl_LayerSet.Enabled=false;
        }

        //string first = DDL_first.SelectedItem.Value;
        //string Second = DDL_Second.SelectedItem.Value;
        //string third = DDL_third.SelectedItem.Value;
        string symbol = DDL_symbol.SelectedItem.Value;
        string number = (RadioButtonList2.SelectedIndex) == -1 ? "": RadioButtonList2.SelectedItem.Value;        
     
    }
    protected void DropDownList16_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DDL_attri.SelectedValue == "2"))
        { 
            Pnl_NewItem.Visible = true;
            DropDownList32.Enabled = true;
            TxWorkName.Enabled = true;
        }
        else if ((DDL_attri.SelectedValue == "1"))
        { 
            Pnl_NewItem.Visible = false;
            DropDownList32.Enabled = false;
            TxWorkName.Enabled = true;
        }
        else
        {
            Pnl_NewItem.Visible = false;
            DropDownList32.Enabled = false;
            TxWorkName.Enabled = false;
        }
    }
    protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = TxResource.Text;
        string y = DropDownList32.SelectedValue;
        string z = x;
        if ((x == ""))
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            { z = y+x; }
        }
        else
        {
            if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
            {
                if ((y != x.Substring(0, 1)))
                {
                    if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                    { z = y + x.Substring(1, x.Length - 1); }
                    else { z = y + x; }
                }

            }
            else if ((DropDownList32.SelectedValue == "X"))
            {
                if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                { z = x.Substring(1, x.Length - 1); }
                else { z = x; }
            }
        }
        TxResource.Text = z;
        if ((DropDownList32.SelectedValue != "X") && (DropDownList32.SelectedValue != "0"))
        {
            DropDownList31.SelectedValue = "0";
            DropDownList31.Enabled = false;
        }
        else 
        {
            DropDownList31.SelectedIndex = 0;
            DropDownList31.Enabled = true;
        }
    }
    protected void DropDownList31_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((DropDownList31.SelectedValue == "1"))
        {
            Button24.Enabled = true;
        }
        else { Button24.Enabled = false; }
    }
    protected void Button24_Click(object sender, EventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx","A");
    }

    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx", ImageButton7.ID);
    }

    public void OpenNewWindow(string url,string Tgr)
    {

        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        OpenNewWindow("AnalysisEdit.aspx", ImageButton8.ID);
    }
    //protected void BuildDynamicDropDown()
    //{
    //    DropDownList ddl = new DropDownList();
    //    ddl.ID = "newDDL";
    //    ddl.SelectedIndexChanged += dynamicDDL_SelectedIndexChanged;
    //    ddl.Items.Add(new ListItem("test1", "test1"));
    //    ddl.Items.Add(new ListItem("test2", "test2"));
    //    ddl.Items.Add(new ListItem("test3", "test3"));
    //    ddl.AutoPostBack = true;
    //    Panel1.Controls.Add(ddl);
    //}

    //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;



    //        Literal ltName = (Literal)e.Item.FindControl("ltName");
    //        Literal LtStatus = (Literal)e.Item.FindControl("LtStatus");
    //        Literal bid = (Literal)e.Item.FindControl("bid");

    //        ltName.Text = vsDr["BidName"].ToString();
    //        LtStatus.Text = vsDr["Status"].ToString();
    //        bid.Text = vsDr["bid"].ToString();
    //        Session["bid"] = vsDr["BID"].ToString();
    //        Session["bidname"] = vsDr["BidName"].ToString();
    //        //GridView1.DataBind();


    //    }
    //}

    protected void add_Click(object sender, EventArgs e)
    {
         string database = Session["DatabaseName"].ToString();
         string _TableNameadd = "";
             //檢查標題文字
         ErrorString += (TxWorkName.Text) == string.Empty ? "工項名稱請填入!!\\n" : "";
         ErrorString += (DropDownList32.SelectedIndex) == 0 ? "工項種類請選擇!!\\n" : "";
         ErrorString += (DDL_attri.SelectedIndex) == 0 ? "項目屬性請選擇!!\\n" : "";


             //確認是否全選
             if (ErrorString == "")
             {
                 //確認選項是否存在或過期           
                 if (Session["uid"] == null)
                 {
                     ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                 }
                 else
                 {

                     WebModel.SaveAction(database, _TableNameadd, GetDataBox_add());

                     ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                     GridView1.DataBind();
                     TxWorkName.Text = "";
                     TxNotes.Text = "";
                 }
             }
             else
             {

                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

             }
         }

         //取得建入資料
    protected System.Data.DataTable GetDataBox_add()
         {
             string add_SQLString = "UID,LayerCode,ItemOrder,Item,Unit,ItemType,Number,UnitPrice,ComplexPrice,CNumber,CComplexPrice,BNumber,BUnitPrice,BComplexPrice,ItemCode,Notes,Labor,Equipment,Material,MisWork,NewItem";
             System.Data.DataTable DataTableBox = new System.Data.DataTable();

             foreach (string DataName in add_SQLString.Split(','))
             {
                 DataTableBox.Columns.Add(DataName, typeof(string));
             }


             //後台功能，必需要有的欄位名稱               

             DataRow DataTableDr = DataTableBox.NewRow();

             #region 內容設定
             if (Session["Uid"] != null)
             {
                 DataTableDr["Uid"] = Session["Uid"].ToString();
                 DataTableDr["LayerCode"] = DDL_WBSlayer.SelectedItem.Value;
                 DataTableDr["Item"] = TxWorkName.Text;
                 DataTableDr["Notes"] = TxNotes.Text;
              


                 DataTableBox.Rows.Add(DataTableDr);
             #endregion


             }
             else
             {
                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
             }
             return DataTableBox;
         }
   
    }
}