using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;

namespace IMS
{
    public partial class ProLibrary : System.Web.UI.Page
    {
        string ErrorString = "";
        string SQLString = "PID,ItemKind,ItemName,Unit,Notes,Complex";
        string _TableName = "Pro_Resource";
        protected void Page_Load(object sender, EventArgs e)
        {

            
           
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案或是您的權限不足');location.href='Main.aspx';</script>");

            }
            else
            {

                //SqlDataSource3.SelectCommand = "SELECT PriceID, PriceName, Complex, AnaNumber, Price, Unit, Code, PccCode, ReferenceID, ReferenceNumber FROM PriceAnalysis";
                if (Session["ProjectCode"] != null)
                {
                    SqlDataSource4.SelectCommand = Sql1;
                }
                SqlDataSource3.SelectCommand = Sql;
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());   
            if (!IsPostBack)
            {
                SqlDataSource3.SelectCommand = Sql;
                GridView2.DataBind();
                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataBind();
                DDL_EdUnit.DataSource = Utility.Unitlist.UnitList();
                DDL_EdUnit.DataBind();

            }
                
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                    return "SELECT * FROM PrivateResource";

                }
                else
                {
                    return ViewState["Sql"].ToString();
                }
            }
            set
            {
                ViewState["Sql"] = value;
            }
        }
        protected string Sql1
        {
            get
            {
                if (ViewState["Sql1"] == null)
                {
                    return "SELECT * FROM [Pro_Resource] WHERE [PID] =" + Session["ProjectCode"].ToString() + " ORDER BY [PriceID] DESC";

                }
                else
                {
                    return ViewState["Sql1"].ToString();
                }
            }
            set
            {
                ViewState["Sql1"] = value;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Add.Visible == true))
            {
                Pnl_Add.Visible = false;
            }
            else if ((Pnl_Add.Visible == false))
            {
                Pnl_Add.Visible = true;
            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if ((Pnl_Import.Visible == true))
            {
                Pnl_Import.Visible = false;
            }
            else if ((Pnl_Import.Visible == false))
            {
                Pnl_Import.Visible = true;
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_Search.Visible == true))
            {
                Pnl_Search.Visible = false;
            }
            else if ((Pnl_Search.Visible == false))
            {
                Pnl_Search.Visible = true;
            }
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if ((Pnl_Bid.Visible == true))
            {
                Pnl_Bid.Visible = false;
            }
            else if ((Pnl_Bid.Visible == false))
            {
                Pnl_Bid.Visible = true;
            }
        }
        protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
        {
            string x = TxCode.Text;
            string y = DDLKind.SelectedValue;
            string z = x;
            if ((x == ""))
            {
                if ((DDLKind.SelectedValue != "X1") && (DDLKind.SelectedValue != "X2") && (DDLKind.SelectedValue != "0"))
                { z = y + x; }
            }
            else
            {
                if ((DDLKind.SelectedValue != "X1") && (DDLKind.SelectedValue != "X2") && (DDLKind.SelectedValue != "0"))
                {
                    if ((y != x.Substring(0, 1)))
                    {
                        if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                        { z = y + x.Substring(1, x.Length - 1); }
                        else { z = y + x; }
                    }

                }
                else if ((DDLKind.SelectedValue == "X1") || (DDLKind.SelectedValue == "X2"))
                {
                    if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                    { z = x.Substring(1, x.Length - 1); }
                    else { z = x; }
                }
            }
            TxCode.Text = z;
            //if ((DDLKind.SelectedValue != "X") && (DDLKind.SelectedValue != "0"))
            //{
            //    DropDownList31.SelectedValue = "0";
            //    DropDownList31.Enabled = false;
            //}
            //else
            //{
            //    DropDownList31.SelectedIndex = 0;
            //    DropDownList31.Enabled = true;
            //}

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Pnl_Edit.Visible = true;
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
                #region 內容設定
                if (Session["ProjectCode"] != null)
                {
                    DataTableDr["pid"] = Session["ProjectCode"].ToString();
                    DataTableDr["ItemKind"] = DDLKind.SelectedValue;
                    DataTableDr["ItemName"] = ItemName;
                    if (DDLKind.SelectedValue =="x1")
                    {
                        DataTableDr["Complex"] = 1;

                    }
                    else
                    {

                          DataTableDr["Complex"] =0;
                    }
                    DataTableDr["Unit"] = DDL_Unit.SelectedValue;
                    DataTableDr["Notes"] = Notes;

                    //SortNum = int.Parse(DDLNext.SelectedValue);
                    DataTableBox.Rows.Add(DataTableDr);
                #endregion
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }               
          
            return DataTableBox;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string datatable = "Pro_Resource";

            ErrorString += (DDLKind.SelectedValue) == "0" ? "請輸入工項類型!!\\n" : "";
            ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            bool select = datacheck(ItemName,DDL_Unit.SelectedValue);
            if (select == true)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已有相同工料名稱');", true);
            }
            else
            {

                //確認是否全選
                if (ErrorString == "")
                {
                    WebModel.SaveAction(database, datatable, GetDataBox());

                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼

                }
                else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }
                TxItemName.Text = "";
                DDLKind.SelectedValue = "0";
                TxNotes.Text = "";
            }
        }
        public bool datacheck(string data1, string unit)
        {
            string database = Session["DatabaseName"].ToString();
            //string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));            
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from Pro_Resource a ";
            #region 搜尋條件
            string SelectString = "";
            //SelectString = (ItemName != "") ? "ItemName like @SelectKey and " : "";
            SelectString += (data1 != "") ? "ItemName ='" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(data1)) + "' and " : "";
            SelectString += (unit != "") ? "Unit like '" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(unit)) + "'  and" : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) + " and Pid=" + Session["ProjectCode"].ToString() + "" : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                   
                    SelectList.CommandType = CommandType.Text;
                    L_Conn.Open();
                    SqlDataReader SelectList_read = SelectList.ExecuteReader();
                    DataTableBox = new DataTable();
                    DataTableBox.Load(SelectList_read);
                }
            }
            #endregion

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {

                return true;
            }
            else
            {

                return false;
            }

        }
      
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Button AnaBtn = (Button)e.Row.FindControl("AnaBtn");

                string com = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();

                AnaBtn.Visible = com == "1" ? (AnaBtn.Visible = true) : com == "" ? (AnaBtn.Visible == false) : com == "0" ? (AnaBtn.Visible == false) : false;
              

            }

        }

        protected void BtnTransfer_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string datatable = "Pro_Resource";
            string bid=DDL_Bid.SelectedValue;
            string SQLBId = "Select * from Bid_Library where bid=" + bid;
            string ItemName = "";
          
            string SQLString = "Pid,ItemName,Unit,Complex,Code,Notes";
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLBId);
            DataTable DataTableBox1 = new DataTable();
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox1.Columns.Add(DataName, typeof(string));
            }
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {
                     ItemName = row["ItemName"].ToString();
                    
                    bool select = WebModel.ItemName(Session["DatabaseName"].ToString(), datatable, ItemName);
                    if (select == false)
                    {
                        DataRow DataTableDr = DataTableBox1.NewRow();
                        //DataTableDr["PriceID"] = row["PriceID"].ToString();
                        DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                        DataTableDr["ItemName"] = row["ItemName"].ToString();
                        DataTableDr["Unit"] = row["Unit"].ToString();
                        DataTableDr["Code"] = row["Code"].ToString();
                        DataTableDr["Complex"] = row["Complex"].ToString();
                        DataTableBox1.Rows.Add(DataTableDr);                    
                         //string InsertSQL = "insert into  [Pro_Resource]  ([PID],[ItemName],[Unit],[Code],[Complex]) VALUES(" + Session["ProjectCode"].ToString() + "," + ItemName + "," + Unit + "," + Code + "," + Complex + ")";
                         //WebModel.SQLAction(database, InsertSQL);
                        //WebModel.SaveAction(database, datatable, GetDataBox());
                        WebModel.SaveAction(database, datatable, DataTableBox1);
                        DataTableBox1.Rows.Clear();
                    }
                
                }
               
            }
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已轉入完畢');", true);

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(SrItemName.Text));
            
            string SelectString = "";
            Sql = "SELECT *  FROM PrivateResource ";
            SelectString = (DDL_kind.SelectedValue != "0") ? "ItemKind = '" + DDL_kind.SelectedValue + "' " + DDL_Op2.SelectedValue + "" : " ";
            SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%' and" : "";
            SelectString = (SelectString.Length > 1) ? " Where " + SelectString.Substring(0,SelectString.Length-4) + " ORDER BY PriceID DESC" : "";

            Sql += SelectString;
            SqlDataSource3.SelectCommand = Sql;
            GridView2.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "SELECT * FROM PrivateResource ORDER BY [PriceID] DESC";
            GridView2.DataBind();
        }

        protected void ItemAdd_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                Session["check"] = cb;
                //CheckBox cb = (CheckBox)GridView2.Rows[1].FindControl("CheckBox1");
                Label PriceID = (Label)row.FindControl("PriceID");
                Label PriceName = (Label)row.FindControl("PriceName");
                Label Unit = (Label)row.FindControl("Unit");
                Label Complex = (Label)row.FindControl("Complex");
                Label Code = (Label)row.FindControl("Code");

                if (cb.Checked)
                {
                    ListItem myList = new ListItem();

                    myList.Text = PriceName.Text;
                    myList.Value =  PriceName.Text + " | " + Unit.Text + " | " + Complex.Text + " | " + Code.Text + " | " + PriceID.Text ;

                    ListBox1.Items.Add(myList);

                }

                else if (cb.Checked == false)
                {
                    ListBox1.Items.Remove(PriceName.Text);
                }
            }
        }

        protected void ItemDel_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem.Text != "")
            {
                int[] indices = ListBox1.GetSelectedIndices();
                for (int i = indices.Length - 1; i >= 0; i--)
                {
                    ListBox1.Items.RemoveAt(indices[i]);
                }
               
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                string Item = ListBox1.Items[i].Value;
                DataTable DataTableBox = new DataTable();
                foreach (string DataName in Item.Split('|'))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));

                }

                string PriceName = DataTableBox.Columns[0].ToString();
                string unit = DataTableBox.Columns[1].ToString();
                string complex = DataTableBox.Columns[2].ToString();
                string Code = DataTableBox.Columns[3].ToString();
                string PriceID = DataTableBox.Columns[4].ToString();
                bool check = WebModel.PriceName(database, "PriceAnalysis", PriceName);
                if (check)
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同工項名稱');", true);
                }
                else
                {
                    //後台功能，必需要有的欄位名稱      
                    #region 內容設定

                    DataTable DataTableBox1 = new DataTable();
                    DataRow DataTableDr = DataTableBox1.NewRow();
                    string SQLString1 = "PriceName,Complex,Unit,Code";
                    foreach (string DataName in SQLString1.Split(','))
                    {
                        DataTableBox1.Columns.Add(DataName, typeof(string));
                    }


                        DataTableDr["PriceName"] = PriceName;
                        DataTableDr["Unit"] = unit;
                        DataTableDr["Complex"] = (complex == "是") ? "1" : "0";
                        DataTableDr["Code"] = Code;

                        DataTableBox1.Rows.Add(DataTableDr);
                        WebModel.SaveAction(database, "Pro_Resource", DataTableBox1);
                    //若有下層工項則找出並儲存    
                    if (complex=="1")
                    {

                    }
                    #endregion
                   
                }
            }
        }

        protected void ClearAll_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
        }

        protected void RsSearch_Click(object sender, EventArgs e)
        {
            Sql1 = "";
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(RsKeyWord.Text));
           
            string SelectString = "";
            Sql1 = "SELECT * FROM [Pro_Resource] WHERE [PID] =" + Session["ProjectCode"].ToString() + "";
            SelectString = (DDL_RsKind.SelectedValue != "0") ? "ItemKind = '" + DDL_RsKind.SelectedValue + "' " + DDL_Op1.SelectedValue + "" : " ";
            SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%'  and" : "";
            SelectString = (SelectString.Length > 1) ? "and " + SelectString.Substring(0,SelectString.Length-4) + " ORDER BY PriceID Asc" : "";

            Sql1 += SelectString;
            SqlDataSource4.SelectCommand = Sql1;
            GridView1.DataBind();
        }

        protected void RsAll_Click(object sender, EventArgs e)
        {
            Sql1="SELECT * FROM [Pro_Resource] WHERE [PID] =" + Session["ProjectCode"].ToString() + " ORDER BY [PriceID] Asc";
            SqlDataSource4.SelectCommand = Sql1;
            GridView1.DataBind();
        }
        protected void LoadContent()
        {

            if (Session["ProjectCode"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from Pro_Resource where PriceID='" + Session["PriceID"].ToString() + "'";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        //Session["bid"] = row["Bid"].ToString();
                        TxRSName.Text = row["ItemName"].ToString();
                        TxCode1.Text = row["Code"].ToString();
                        DDL_EdUnit.SelectedValue = (row["Unit"].ToString() != "") ? row["Unit"].ToString().Trim() : "M";
                        //Add_anl.Visible = (row["Complex"].ToString() != "1") ? true : false;
                        DDL_RsKind1.SelectedValue = row["ItemKind"].ToString() !=""?row["ItemKind"].ToString():"0";
                        TxNote.Text = row["Notes"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Detail")
            {
                Pnl_Edit.Visible = true;
                string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                Session["PriceID"] = PriceID;
                LoadContent();
            }
            if (e.CommandName == "analyst")
            {
                string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                Session["PriceID"] = PriceID;
                OpenNewWindow("AnalysisBEdit.aspx");
            }
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=1000,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void EdConfirm_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string EditItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRSName.Text));
            string EditCode = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxCode1.Text));
            string EditNotes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNote.Text));
            string Sql = "update " + _TableName + " set PID=" + Session["ProjectCode"] + ", ";
            string SQRstring = "";

            SQRstring += (EditItemName != "") ? " ItemName='" + EditItemName + "'" : "'";
            SQRstring += (DDL_EdUnit.SelectedValue != "") ? ", Unit='" + DDL_EdUnit.SelectedValue + "'" : "";
            SQRstring += (EditCode != "") ? ",Code='" + EditCode+"'" : "";
            SQRstring += (EditNotes != "") ? ",Notes='" + EditNotes+"'" : "";

            string Sql1 = (SQRstring.Length > 1) ? Sql + SQRstring + " where PriceID= '" + Session["PriceID"].ToString() + "'" : "";
            WebModel.SQLAction(database, Sql1);

            TxRSName.Text = "";
            TxCode1.Text = "";
            TxNote.Text = "";
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已修改完成');", true);
            GridView1.DataBind();
        }

        protected void EdDelete_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString = "Select * from Pro_Analysis where KidID='" + Session["PriceID"].ToString() + "'";
            string SQLString1 = "Select * from EBudget_WBS where PriceID='" + Session["PriceID"].ToString() + "'";

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('有下層單價分析，不能刪除');", true);
            }
            else if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('本工料為工項引用，不能刪除');", true);
            }
            else
            {
                string Sql = "Delete " + _TableName + " where PriceID=" + Session["PriceID"] + "";
                string Delanalyst = "Delete Pro_Analysis where ParentID=" + Session["PriceID"] + "";
                WebModel.SQLAction(database, Sql);
                WebModel.SQLAction(database, Delanalyst);
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已刪除完成');", true);
            }
            GridView1.DataBind();
            TxRSName.Text = "";
            TxCode1.Text = "";
            TxNote.Text = "";
        }

        protected void EdEnd_Click(object sender, EventArgs e)
        {
            Pnl_Edit.Visible = false;
        }
    }
}