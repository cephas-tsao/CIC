using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class BidLibrary : System.Web.UI.Page
    {
        string _TableName = "Bid_Library";
        string ErrorString = "";
        string SQLString = "BID,ItemName,Unit,Code,Notes,Complex,ItemKind,AnaNumber";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (DropDownList3.SelectedValue != "0" && DropDownList3.SelectedValue != "")
            {
                //showid.Style.Add("style", "display:block;");
                showid.Visible = true;
            }
            else
            {
                showid.Visible = false;
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                DDL_EdUnit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_EdUnit.DataBind();
                DDL_Unit.DataBind();
                //SqlDataSource2.SelectCommand = "select * from Bid_Library where bid=" + Session["Bid"].ToString() + "";
                if(Session["Bid"]!=null)
                {
                SqlDataSource2.SelectCommand = Sql;
                }
                DropDownList3_SelectedIndexChanged(this, null);
            }

         
            //SqlDataSource3.SelectCommand = "SELECT PriceID, PriceName, Complex, AnaNumber, Price, Unit, Code, PccCode, ReferenceID, ReferenceNumber FROM PriceAnalysis ";
            #region 搜尋條件
            string SelectString = "";
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWBS.Text));
            SelectString = (DDL_WBS.SelectedValue != "0") ? "Code like '%" + DDL_WBS.SelectedValue + "%'" : "";
          if (DDL_WBS.SelectedValue != "0" && ItemName=="")
          {
              SelectString += "";
          }
         else if (DDL_WBS.SelectedValue != "0" && ItemName != "")
          {
              SelectString += DDL_Op2.SelectedValue + " ItemName like '%" + ItemName + "%'";
          }
         else if (DDL_WBS.SelectedValue == "0" && ItemName != "")
          {
              SelectString += (ItemName != "") ? " ItemName like '%" + ItemName + "%'" : "";
          }
         
            SelectString = (SelectString.Length > 1) ? "where " + SelectString + "" : "";
         
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.SelectCommand = "SELECT PriceID, ItemName, Complex, AnaNumber, Price, Unit, Code,ItemKind FROM [PrivateResource] ";
            SqlDataSource3.SelectCommand += SelectString + " ORDER BY PriceID ASC ";
            #endregion
         
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
            if (Session["Bid"] != null)
            {
                if (Sql != "")
                {
                    SqlDataSource2.SelectCommand=Sql;
                }
                else
                {

                    SqlDataSource2.SelectCommand = "select * from Bid_Library where bid=" + Session["Bid"].ToString() + "";
                }
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
        protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
        {
            string x = TxCode.Text;
            string y = DDL_WorkItem.SelectedValue;
            string z = x;
            if ((x == ""))
            {
                if ((DDL_WorkItem.SelectedValue != "X1") && (DDL_WorkItem.SelectedValue != "X2") && (DDL_WorkItem.SelectedValue != "0"))
                { z = y + x; }
            }
            else
            {
                if ((DDL_WorkItem.SelectedValue != "X1") && (DDL_WorkItem.SelectedValue != "X2") && (DDL_WorkItem.SelectedValue != "0"))
                {
                    if ((y != x.Substring(0, 1)))
                    {
                        if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                        { z = y + x.Substring(1, x.Length - 1); }
                        else { z = y + x; }
                    }

                }
                else if ((DDL_WorkItem.SelectedValue == "X1") || (DDL_WorkItem.SelectedValue == "X2"))
                {
                    if ((x.Substring(0, 1) == "M") || (x.Substring(0, 1) == "L") || (x.Substring(0, 1) == "E") || (x.Substring(0, 1) == "W"))
                    { z = x.Substring(1, x.Length - 1); }
                    else { z = x; }
                }
            }
            TxCode.Text = z;
            //if ((DDL_WorkItem.SelectedValue != "X1") && (DDL_WorkItem.SelectedValue != "X2") && (DDL_WorkItem.SelectedValue != "0"))
            //{
            //    DDL_ComplexA.SelectedValue = "0";
            //    DDL_ComplexA.Enabled = false;
            //}
            //else
            //{
            //    DDL_ComplexA.SelectedIndex = 0;
            //    DDL_ComplexA.Enabled = true;
            //}
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            if (DropDownList3.SelectedValue != "0")
            {
                Session["Bid"] = DropDownList3.SelectedValue;
                SqlDataSource2.SelectCommand = "SELECT * FROM [Bid_Library] WHERE [BID] = " + Session["Bid"].ToString() + "";
                //EdItemName.Text = "";
                //EdCode.Text = "";
                //EdNotes.Text = "";
                //DDL_edit.SelectedValue = "0";
            }
        }

        protected void BtAdd_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            ErrorString += (TxItemName.Text) == string.Empty ? "工料名稱請填入!!\\n" : "";
            ErrorString += (DDL_WorkItem.SelectedValue) == "0" ? "工料種類請選擇!!\\n" : "";
            ErrorString += (DDL_Unit.SelectedValue) == "0" ? "單位請選擇!!\\n" : "";
            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(TxItemName.Text, DDL_Unit.SelectedValue) == false)
                    {

                      string result=  WebModel.SaveAction(database, _TableName, GetDataBox());
                        GridView1.DataBind();
                        TxItemName.Text = "";
                        TxCode.Text = "";
                        DDL_edit.SelectedValue = "0";
                        TxCode.Text = "";
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    }
                    else
                    {
                        //WebModel.EditAction_bid(database, _TableName, Session["bid"].ToString(), GetDataBox());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同名稱');", true);
                    }
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["BID"] != null)
            {
                DataTableDr["BID"] = Session["BID"].ToString();

                DataTableDr["ItemName"] = TxItemName.Text;
                DataTableDr["ItemKind"] = DDL_WorkItem.SelectedItem.Text;
                DataTableDr["Code"] = TxCode.Text;
                if(DDL_WorkItem.SelectedValue == "X1")
                {
                DataTableDr["Complex"] = 1;
                }
                else
                {
                    DataTableDr["Complex"] = 0;
                }
                if (DDL_WorkItem.SelectedValue == "X1")
                {
                    DataTableDr["AnaNumber"] = 1;
                }
                else
                {
                    DataTableDr["AnaNumber"] = 0;
                }
                DataTableDr["Notes"] = TxNotes.Text;
                DataTableDr["Unit"] = DDL_Unit.SelectedValue;

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        public bool datacheck(string data1, string unit)
        {
            string database = Session["DatabaseName"].ToString();
            //string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));            
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from " + _TableName + " a ";
            #region 搜尋條件
            string SelectString = "";
            //SelectString = (ItemName != "") ? "ItemName like @SelectKey and " : "";
            SelectString += (data1 != "") ? "ItemName ='"+SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(data1)) +"' and " : "";
            SelectString += (unit != "") ? "Unit like '"+ SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(unit)) +"'  and" : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4)+ " and bid="+Session["Bid"].ToString()+"" : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                    //SelectList.Parameters.AddWithValue("@SelectKey", "%" + ItemName + "%");
                    //SelectList.Parameters.AddWithValue("@SelectKey1", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(data1)) + "%");
                    //SelectList.Parameters.AddWithValue("@SelectKey2", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(unit)) + "%");
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
        protected void LoadContent()
        {
            
             if (Session["bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from Bid_Library where PriceID='" + Session["PriceID"].ToString() + "'";


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Session["bid"] = row["Bid"].ToString();
                        EdItemName.Text = row["ItemName"].ToString();
                        EdCode.Text = row["Code"].ToString();
                        DDL_EdUnit.SelectedValue = (row["Unit"].ToString() != "")?row["Unit"].ToString().Trim():"M";
                        //Add_anl.Visible = (row["Complex"].ToString() != "1") ? true : false;
                        DDL_edit.SelectedItem.Text = row["ItemKind"].ToString();
                        //DDL_ComplexA.SelectedValue = row["Complex"].ToString();
                        EdNotes.Text = row["Notes"].ToString();                   

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
                OpenNewWindow("AnalysisEdit.aspx");
            }
            GridView1.DataBind();
         
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=1000,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
        protected void EdConfirm_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string EditItemName =SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(EdItemName.Text));
            string EditCode = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(EdCode.Text));
            string EditNotes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(EdNotes.Text));
            string Sql = "update " + _TableName + " set BID=" + Session["bid"] + ", ";
            string SQRstring = "";
            
            SQRstring += (EditItemName != "") ? " ItemName='" + EditItemName + "' ,": "'";
            SQRstring += (DDL_EdUnit.SelectedValue != "") ? " Unit='" + DDL_EdUnit.SelectedValue +"'" : "";
            SQRstring += (EditCode != "") ? ",Code='" + EditCode +"'": "";
            SQRstring += (EditNotes != "") ? ",Notes='" + EditNotes+"'" : "";
            SQRstring += (DDL_edit.SelectedValue != "0") ? ",ItemKind='" + DDL_edit.SelectedItem.Text + "'" : "";
           
            string Sql1 = (SQRstring.Length > 1) ?Sql + SQRstring + " where PriceID= '" + Session["PriceID"].ToString() + "'" : "";
          bool result=  WebModel.SQLAction(database, Sql1);
          
            EdItemName.Text = "";
            EdCode.Text = "";
            EdNotes.Text = "";
            DDL_edit.SelectedValue = "0";
            if (result)
            {
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已修改完成');", true);
            }
            else
            {
                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
            }
            GridView1.DataBind();
          
        }

        protected void EdEnd_Click(object sender, EventArgs e)
        {
            Pnl_Edit.Visible = false;
        }

        protected void EdDelete_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString = "Select * from Bid_AnaRelation where KidID='" + Session["PriceID"].ToString() + "'";
            string SQLString1 = "Select * from Bid_WBS where PriceID='" + Session["PriceID"].ToString() + "'";

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('有下層單價分析，不能刪除');", true);
            }
            else if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('本項為工項連結項目，不能刪除');", true);
            }
            else
            {
                string Sql = "Delete " + _TableName + " where PriceID=" + Session["PriceID"] + "";
                string Delanalyst = "Delete Bid_AnaRelation where ParentID=" + Session["PriceID"] + "";
                WebModel.SQLAction(database, Sql);
                WebModel.SQLAction(database, Delanalyst);
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已刪除完成');", true);
            }
            GridView1.DataBind();
            EdItemName.Text = "";
            EdCode.Text = "";
            EdNotes.Text = "";
        }
  
        protected void ItemAdd_Click(object sender, EventArgs e)
        {
            //StringBuilder sb = new StringBuilder();
           
            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                Session["check"] = cb;
                //CheckBox cb = (CheckBox)GridView2.Rows[1].FindControl("CheckBox1");
                Label PriceName = (Label)row.FindControl("PriceName");
                Label Unit = (Label)row.FindControl("Unit");
                Label Complex =(Label)row.FindControl("Complex");
                Label Code = (Label)row.FindControl("Code");
              
                if (cb.Checked)
                {
                    ListItem myList = new ListItem();
            
                    myList.Text = PriceName.Text;
                    myList.Value = PriceName.Text + " | " + Unit.Text + " | " + Complex.Text + " | " + Code.Text;
                  
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
                for (int i = indices.Length-1; i >= 0; i--)
                {
                    ListBox1.Items.RemoveAt(indices[i]);
                }
                //ListBox1.Items.Remove(ListBox1.SelectedItem);
            }
        }

        protected void ClearAll_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
        }

        protected void SaveLibrary_Click(object sender, EventArgs e)
        {
         string database = Session["DatabaseName"].ToString();
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                string Item =ListBox1.Items[i].Value;
                DataTable DataTableBox = new DataTable();
                foreach (string DataName in Item.Split('|'))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));                    

                }                     
               
                string PriceName = DataTableBox.Columns[0].ToString();
                string unit = DataTableBox.Columns[1].ToString();
                string complex = DataTableBox.Columns[2].ToString();
                string Code = DataTableBox.Columns[3].ToString();

                if(datacheck(PriceName,unit) == true)
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同工項名稱');", true);
                }
                else
                {
                //後台功能，必需要有的欄位名稱      
                #region 內容設定

                DataTable DataTableBox1 = new DataTable();
                DataRow DataTableDr = DataTableBox1.NewRow();
                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox1.Columns.Add(DataName, typeof(string));
                }
         
                if (Session["bid"] != null)
                {
                    DataTableDr["bid"] = Session["bid"].ToString();
                    DataTableDr["ItemName"] = PriceName;
                    DataTableDr["Unit"] = unit;
                    DataTableDr["Complex"] = (complex == "是")?"1":"0";
                    DataTableDr["Code"] = Code;

                    DataTableBox1.Rows.Add(DataTableDr);
                    WebModel.SaveAction(database, _TableName, DataTableBox1);
                #endregion
                }               
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請選擇標案');", true);
                }                
                }
            }
       }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                    return "select * from Bid_Library where bid=" + Session["Bid"].ToString() + "";

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
        protected void WBSSearch_Click(object sender, EventArgs e)
        {
           
            GridView2.DataBind();            
        }

        protected void WBSAll_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "SELECT PriceID, PriceName, Complex, AnaNumber, Price, Unit, Code, PccCode, ReferenceID, ReferenceNumber FROM PriceAnalysis ";
            GridView2.DataBind();   
        }

        protected void BidSearch_Click(object sender, EventArgs e)
        {
            if (Session["Bid"] != null )
            {
                string database = Session["DatabaseName"].ToString();
                string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxBidWBS.Text));

                #region 搜尋條件
                string SelectString = "";   

                SelectString = (DDL_WBS1.SelectedValue != "0") ? " and Code like '%" + DDL_WBS1.SelectedValue + "%' " : "";

                SelectString += (ItemName != "") ? "" + DDL_Op3.SelectedValue + " ItemName like '%" + ItemName + "%' " : "";

                SelectString = (SelectString.Length > 1) ?  SelectString : "";
                SqlDataSource2.SelectCommand = "select * from Bid_Library where bid=" + Session["Bid"].ToString() + "";
                SqlDataSource2.SelectCommand = (SelectString.Length > 1) ? SqlDataSource2.SelectCommand.Substring(0, SqlDataSource2.SelectCommand.Length) : SqlDataSource2.SelectCommand;
                SqlDataSource2.SelectCommand += "" + SelectString + " ORDER BY PriceID DESC";
                Sql = SqlDataSource2.SelectCommand;
                ViewState["Sql"] = Sql;
                #endregion
              
                GridView1.DataBind();
            }
            else {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請選擇標案');", true);
            }
        }

        protected void All_Click(object sender, EventArgs e)
        {
            if (Session["Bid"] !=null)
            {
            SqlDataSource2.SelectCommand = "select * from Bid_Library where bid=" +Session["Bid"].ToString()+"";
          
            GridView1.DataBind();  
            }
        }


        protected void Del_anl_Click(object sender, EventArgs e)
        {
             string database = Session["DatabaseName"].ToString();
          
                    string delSQLstring = "Delete * from Bid_AnaRelation where ParentID='" + Session["PriceID"].ToString() + "'";
                    WebModel.SQLAction(database, delSQLstring);
                    string updateSQLstring = "update  " + _TableName + " set Complex=0 where PriceID= '" + Session["PriceID"].ToString() + "'";
                    WebModel.SQLAction(database, updateSQLstring);

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已刪除單價分析');", true);
               
        }        
    }
}