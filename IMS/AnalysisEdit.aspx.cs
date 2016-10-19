using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class AnalysisEdit : System.Web.UI.Page
    {
        string _TableName = "Bid_Library";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["PriceID"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ViewState["i"] = 0;
                Session["DataTable"] = null;
                LoadContent();
                SqlDataSource2.SelectCommand = Sql;
             //Session["DataTable"] = null;
            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (Session["bid"] != null)
            {
                //SqlDataSource2.SelectCommand = "SELECT * FROM [Bid_Library] where bid="+Session["Bid"].ToString();
                SqlDataSource2.SelectCommand = Sql;
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇標案');", true);
            }
            if (Session["DataTable"] != null)
           {
            GridView2.DataSource = (DataTable)Session["DataTable"];
           }
        }

        protected void LoadContent()
        {

            if (Session["PriceID"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select * from Bid_Library where PriceID='" + Session["PriceID"].ToString() + "'";
                string SQLString1 = "Select * from Bid_Library a left join Bid_AnaRelation b on a.PriceID=b.KidID where b.ParentID='" + Session["PriceID"].ToString() + "' and a.bid="+Session["bid"].ToString();
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                DataTableBox1.Columns.Add("Kind");
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbItemName.Text = row["ItemName"].ToString();
                        LbUnit.Text = row["Unit"].ToString();
                        LbCode.Text = row["Code"].ToString();

                        TxAnaNumber.Text = row["AnaNumber"].ToString();

                    }
                    //DataTableBox.Dispose(); //釋放Table資源
                }
                if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                {
                    GridView2.DataSource = DataTableBox1;
                    GridView2.DataBind();
                    Session["DataTable"] = DataTableBox1;
                }

            }

        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if ((Pnl_Import.Visible == false))
            {
                Pnl_Import.Visible = true;
            }
            else if ((Pnl_Import.Visible == true))
            {
                Pnl_Import.Visible = false;
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            //string _TableName = "Bid_Library";
            string AnaNumber = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxAnaNumber.Text));
            string Sql = "update " + _TableName + " set AnaNumber=" + AnaNumber + " where PriceID= '" + Session["PriceID"].ToString() + "'";
            WebModel.SQLAction(database, Sql);
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已修改完成');", true);
        }
        //新增空白資料
        protected DataTable GetDataBox(int status)
        {

            string SQLString = "Bid,PriceID,SortNum,ItemKind,ItemName,Unit,Complex,Code,Number,Notes,Price,Kind";
                DataTable DataTableBox = new DataTable();
             
               

                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                 if (Session["DataTable"] != null)           
                {
                    DataTableBox = (DataTable)Session["DataTable"];
                }
                
            //後台功能，必需要有的欄位名稱               

           
            ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;
            #region 內容設定
            //for (int i = 0; i < Convert.ToInt32(ViewState["i"]); i++)
            //{
           
            if (status == 0)
            {
                int NextNum;
                DataRow DataTableDr = DataTableBox.NewRow();
              
                int count = GridView2.Rows.Count;
                if (count != 0)
                {
                    string NowNum = ((TextBox)GridView2.Rows[count - 1].FindControl("TxSort")).Text.Trim();
                    NextNum = int.Parse(NowNum) + 1;
                }
                else
                {
                    NextNum = 1;
                }
                DataTableDr["SortNum"] = NextNum;
                DataTableDr["Kind"] = "0";
                DataTableDr["BID"] = Session["BID"].ToString();
                DataTableDr["ItemName"] = "";
                DataTableDr["Unit"] = "M";
                DataTableDr["Complex"] = "0";
                DataTableDr["Code"] = "";
                //DataTableDr["Number"] = "";
                DataTableDr["Notes"] = "";

               
                    DataTableBox.Rows.Add(DataTableDr);
                    Session["DataTable"] = DataTableBox;
                }
            #endregion

            //}
            return DataTableBox;
        }
        protected void AddRow_Click(object sender, EventArgs e)
        {
           
            GridView2.DataSource = GetDataBox(0);
            GridView2.DataSource = Session["DataTable"];
            GridView2.DataBind();

            
        }
     
        protected void SaveWBS_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            bool result = false;
            bool result1 = false;
            bool result2 = false;
            string result3 = "";
            bool delfalg=false;
            decimal TotalPrice = 0;
            string SQLString = "PriceID,Bid,ItemKind,ItemName,Unit,Complex,Code,Notes";
            DataTable DataTableBox = new DataTable();
            DataRow DataTableDr = DataTableBox.NewRow();
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            //後台功能，必需要有的欄位名稱              
            
          
            #region 內容設定
            foreach (GridViewRow row in GridView2.Rows)
            {
                Label PriceID = (Label)row.FindControl("PriceID");
                TextBox TxSort = (TextBox)row.FindControl("TxSort");
                DropDownList ItemKind = (DropDownList)row.FindControl("ItemKind");
                TextBox ItemName = (TextBox)row.FindControl("ItemName");
                DropDownList DDL_EdUnit = (DropDownList)row.FindControl("DDL_EdUnit");
                ImageButton Complex = (ImageButton)row.FindControl("Complex");
                TextBox Code = (TextBox)row.FindControl("Code");
                TextBox Quantity = (TextBox)row.FindControl("Quantity");
                TextBox Notes = (TextBox)row.FindControl("Notes");
                Label Price = (Label)row.FindControl("Price");
                Label Kind = (Label)row.FindControl("Kind");
                //if (datacheck(ItemName.Text, DDL_EdUnit.SelectedValue) == false)
                //{
                if (Quantity.Text != "" && Price.Text != "")
                {
                    TotalPrice += decimal.Parse(Quantity.Text) * decimal.Parse(Price.Text);
                }
                     DataTableBox.Rows.Clear();
                    if (DataTableBox.Rows.Count != 0 || ItemName.Text != "")
                    {
                       
                       DataTableDr["PriceID"] = PriceID.Text;      
                       DataTableDr["Bid"] = Session["Bid"].ToString();
                       DataTableDr["ItemKind"] = ItemKind.SelectedItem.Text;
                        DataTableDr["ItemName"] = ItemName.Text;
                        DataTableDr["Unit"] = DDL_EdUnit.SelectedValue;
                        DataTableDr["Complex"] = (Complex.Visible == true) ? "1" : (Complex.Visible == false) ? "2" : "0";
                        DataTableDr["Code"] = Code.Text;
                        //DataTableDr["Number"] = Quantity.Text;
                        DataTableDr["Notes"] = Notes.Text;

                        DataTableBox.Rows.Add(DataTableDr);

            #endregion

                        if (TxSort.Text != "" && ItemName.Text != "" && Quantity.Text != "")
                        {
                            //string SQLString1 = "Select * from Bid_AnaRelation where KidID=" + PriceID.Text + " and ParentID="+ Session["PriceID"].ToString() +"";
                            if (!delfalg)
                            {
                                string SQLString2 = "Delete from Bid_AnaRelation where ParentID=" + Session["PriceID"].ToString() + "";

                                result = WebModel.SQLAction(database, SQLString2);
                                delfalg = true;
                            }
                            //更新父項內容                     
                            //string addImport = Code.Text.Split('ξ')[1];
                            //Regex reg = new Regex("ξ");
                            //Match m = reg.Match(Code.Text);

                            //var isContain = Regex.Match("HELLO,IamAString", "string", RegexOptions.IgnoreCase).Success;
                            //if (m.Success)
                            if (Kind.Text == "0")
                            {
                                DataTableBox.Columns.Remove("PriceID");
                                //DataTableDr["Bid"] = Session["Bid"].ToString();
                                result3 = WebModel.SaveAction(database, "Bid_Library", DataTableBox);
                                DataTableBox.Columns.Add("PriceID");
                            }
                            else
                            {
                                result2 = WebModel.EditAction_Anyid(database, _TableName, PriceID.Text, "PriceID", DataTableBox);
                            }
                            if (Session["PriceID"].ToString() != PriceID.Text)
                            {
                                if (Kind.Text == "0" )
                                {
                                    int sid = WebModel.MaxID(database, "Bid_Library") - 1;
                                    string Sql2 = "insert into  Bid_AnaRelation  ([SortNum],[ParentID],[KidID],[Number]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + sid + "','" + Quantity.Text + "')";
                                    result1 = WebModel.SQLAction(database, Sql2);
                                }
                                else if (Kind.Text == "1")
                                {

                                    string Sql2 = "insert into  Bid_AnaRelation  ([SortNum],[ParentID],[KidID],[Number]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + PriceID.Text + "','" + Quantity.Text + "')";
                                    result1 = WebModel.SQLAction(database, Sql2);


                                }
                                else
                                {
                                    string Sql2 = "insert into  Bid_AnaRelation  ([SortNum],[ParentID],[KidID],[Number]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + PriceID.Text + "','" + Quantity.Text + "')";
                                    result1 = WebModel.SQLAction(database, Sql2);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入工項各項內容');", true);
                            }
                            if (result1)
                            {
                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('工項已全儲存完畢');", true);
                            }
                            else
                            {

                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('工項儲存失敗');", true);
                            }

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入工項');", true);
                        }
              
                      
                    }
                   
                   

            }
         
            //更新父項單價  
            decimal Price1 = TotalPrice / decimal.Parse(TxAnaNumber.Text);
              string Sql3 = "update  " + _TableName + " set Complex=1,Price='" + Price1 + "' where PriceID= '" + Session["PriceID"].ToString() + "'";
              bool result4 = WebModel.SQLAction(database, Sql3);
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('("+ItemName.Text+")已有相同名稱');", true);
            //}
            
            
        }
        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
           
                DataTable DataTableBox = WebModel.LoadSetContentData(database,data);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    return true;
                }
                else
                {

                    return false;
                }

            //}
            //return false;

        }
        //public bool datacheck(string data1, string unit)
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    //string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));            
        //    DataTable DataTableBox = new DataTable(); //建立表格
        //    string SQLString = "select * from " + _TableName + " a ";
        //    #region 搜尋條件
        //    string SelectString = "";
        //    //SelectString = (ItemName != "") ? "ItemName like @SelectKey and " : "";
        //    SelectString += (data1 != "") ? "ItemName like @SelectKey1 and " : "";
        //    SelectString += (unit != "") ? "Unit like @SelectKey2 and " : "";
        //    SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) : "";
        //    #endregion

        //    #region 找出總筆數

        //    //搜尋資料表

        //    //int AllList = 0;
        //    using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
        //    {
        //        using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
        //        {
        //            //SelectList.Parameters.AddWithValue("@SelectKey", "%" + ItemName + "%");
        //            SelectList.Parameters.AddWithValue("@SelectKey1", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(data1)) + "%");
        //            SelectList.Parameters.AddWithValue("@SelectKey2", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(unit)) + "%");
        //            SelectList.CommandType = CommandType.Text;
        //            L_Conn.Open();
        //            SqlDataReader SelectList_read = SelectList.ExecuteReader();
        //            DataTableBox = new DataTable();
        //            DataTableBox.Load(SelectList_read);
        //        }
        //    }
        //    #endregion

        //    if (DataTableBox != null && DataTableBox.Rows.Count > 0)
        //    {

        //        return true;
        //    }
        //    else
        //    {

        //        return false;
        //    }

        //}
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Earse")
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];


                //DataTableBox.Rows[ID_class].Delete();
                //string priceid = DataTableBox.Rows[ID_class].ItemArray[0].ToString();
                DataTableBox.Rows.RemoveAt(ID_class);
                   //DataTableBox.Rows.Remove(DataTableDr);
                   ViewState["i"] = Convert.ToInt32(ViewState["i"]) - 1;
                  
                   GridView2.DataSource = DataTableBox;
                   Session["DataTable"] = DataTableBox;
                   GridView2.DataBind();
                 
              
            }
        }

        protected void ClearWBSAll_Click(object sender, EventArgs e)
        {
            //if (Session["DataTable"].ToString() != "" && Session["DataTable"] != null)
           if (Session["DataTable"] != null)
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];
                DataTableBox.Rows.Clear();
                GridView2.DataSource = DataTableBox;
                GridView2.DataBind();
                ViewState["i"] = 0;
                Session["DataTable"] = null;
               
            }
        }
      
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(Session["BID"] != null)
            {
            int ID_class = Convert.ToInt32(e.CommandArgument);
              ID_class = ID_class % GridView1.PageSize;
              if (e.CommandName == "Select")
              {
                  DataTable DataTableBox = GetDataBox(1);

                      int NextNum;
                      int UID = (int)GridView1.DataKeys[ID_class].Value;
                      Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                      Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                      Label Code = (Label)GridView1.Rows[ID_class].FindControl("Code");
                      Label Unit = (Label)GridView1.Rows[ID_class].FindControl("Unit");
                      Label Complex = (Label)GridView1.Rows[ID_class].FindControl("Complex");
                      Label Price = (Label)GridView1.Rows[ID_class].FindControl("Price");
                      Label ItemKind = (Label)GridView1.Rows[ID_class].FindControl("ItemKind");
                      Label Kind = (Label)GridView1.Rows[ID_class].FindControl("Kind");
                   
                      DataRow DataTableDr = DataTableBox.NewRow();

                      int count = GridView2.Rows.Count;
                      if (count != 0)
                      {
                          string NowNum = ((TextBox)GridView2.Rows[count - 1].FindControl("TxSort")).Text.Trim();
                          NextNum = int.Parse(NowNum) + 1;
                      }
                      else
                      {
                          NextNum = 1;
                      }                     
                      DataTableDr["SortNum"] = NextNum;
                      DataTableDr["PriceID"] = PriceID.Text;
                      DataTableDr["BID"] = Session["Bid"].ToString();
                      DataTableDr["ItemName"] = ItemName.Text;
                      DataTableDr["Unit"] = Unit.Text.Trim();
                      DataTableDr["Complex"] = (Complex.Text == "有")? "1" :(Complex.Text == "無")? "2":"0";
                      DataTableDr["Code"] = Code.Text;
                      DataTableDr["ItemKind"] = ItemKind.Text;
                      DataTableDr["Kind"] = "1";
                      DataTableBox.Rows.Add(DataTableDr);
                      Session["DataTable"] = DataTableBox;
                      ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;
                
                  GridView2.DataSource = DataTableBox;
               
                  GridView2.DataBind();
              }
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇標案');", true);
            }
           
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null && Session["PriceID"] != null)
                {
                   
                        //return "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["PriceID"].ToString() + ") and PriceID<>" + Session["PriceID"].ToString() + " ";
                        return "SELECT * FROM [Bid_Library] where bid=" + Session["Bid"].ToString();
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
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
            SqlDataSource2.SelectCommand = "";
            Sql = "SELECT * FROM [Bid_Library] where bid=" + Session["Bid"].ToString();
            if (Session["bid"] != null)
            {
                string SelectString = "";
                //SelectString = (DDL_WBS.SelectedValue != "0") ? "Code like '%" + DDL_WBS.SelectedValue + "%' " + DDL_Op2.SelectedValue + "" : "";
                SelectString = (DDL_WBS.SelectedItem.Text != "" && DDL_WBS.SelectedItem.Text != "-請選擇-") ? "ItemKind like '%" + DDL_WBS.SelectedItem.Text + "%'" : "";
                if ((DDL_WBS.SelectedItem.Text != "" && DDL_WBS.SelectedItem.Text != "-請選擇-") && FdSearch == "")
                {
                    SelectString += "";
                }
                else if ((DDL_WBS.SelectedItem.Text != "" && DDL_WBS.SelectedItem.Text != "-請選擇-") && FdSearch != "")
                {
                    SelectString += DDL_Op2.SelectedValue + " ItemName like '%" + FdSearch + "%'";
                }
                else if ((DDL_WBS.SelectedItem.Text == "" || DDL_WBS.SelectedItem.Text == "-請選擇-") && FdSearch != "" && DDL_Op2.SelectedValue == "and NOT")
                {
                    SelectString += (FdSearch != "") ?  " not ItemName like '%" + FdSearch + "%'" : "";
                }
                else if ((DDL_WBS.SelectedItem.Text == "" || DDL_WBS.SelectedItem.Text == "-請選擇-") && FdSearch != "" )
                {
                    SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%'" : "";
                }
                //SelectString += (DDL_WBS.SelectedItem.Text != "" && DDL_WBS.SelectedItem.Text != "-請選擇-") ?   " ItemKind like '%" + DDL_WBS.SelectedItem.Text + "%' and" : "";
                //SelectString += (DDL_WBS.SelectedItem.Text != "" && DDL_WBS.SelectedItem.Text != "-請選擇-" || FdSearch != "" && DDL_Op2.SelectedValue == "NOT") ? DDL_Op2.SelectedValue : "";
                //SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%' " : "";
               
               // SelectString = (SelectString.Length > 1) ? " where " + SelectString + " ORDER BY [PriceID]" : "";
                //SelectString.Substring(0,SelectString.Length-4)
                if (SelectString != "")
                {
                    SqlDataSource2.SelectCommand = Sql + " and " + SelectString;
                }
                else
                {
                    SqlDataSource2.SelectCommand = Sql;
                }
               
                Sql = SqlDataSource2.SelectCommand;
                //GridView2.DataSource = (DataTable)Session["DataTable"];
                GridView1.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇標案');", true);
            }
          
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT * FROM [Bid_Library] where Bid="+Session["Bid"].ToString()+" ORDER BY [PriceID]";
            GridView1.DataBind();
          
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ItemKind = (DropDownList)e.Row.FindControl("ItemKind");

                string com = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString();

                ItemKind.SelectedItem.Text = com;
             
                 //int rowIndex = 0;
                 //if (Session["DataTable"] != null)
                 //{
                 //    DataTable dt = (DataTable)Session["DataTable"];
                 //    if (dt.Rows.Count > 0)
                 //    {
                 //        //string SQLString = "PriceID,Bid,ItemKind,ItemName,Unit,Complex,Code,Notes";
                 //        for (int i = 1; i < dt.Rows.Count; i++)
                 //        {
                 //            DataRow DataTableDr = dt.NewRow();
                 //            if (DataTableDr["Kind"] == "1")
                 //            {
                 //                Label PriceID = (Label)GridView2.Rows[rowIndex].Cells[1].FindControl("PriceID");
                 //                Label TxSort = (Label)GridView2.Rows[rowIndex].Cells[2].FindControl("TxSort");
                 //                DropDownList ItemKind = (DropDownList)GridView2.Rows[rowIndex].Cells[3].FindControl("ItemKind");
                 //                Label ItemName = (Label)GridView2.Rows[rowIndex].Cells[4].FindControl("ItemName");
                 //                DropDownList DDL_EdUnit = (DropDownList)GridView2.Rows[rowIndex].Cells[5].FindControl("DDL_EdUnit");
                 //                ImageButton Complex = (ImageButton)GridView2.Rows[rowIndex].Cells[6].FindControl("Complex");
                 //                Label Code = (Label)GridView2.Rows[rowIndex].Cells[7].FindControl("Code");
                 //                Label Quantity = (Label)GridView2.Rows[rowIndex].Cells[8].FindControl("Quantity");
                 //                Label Notes = (Label)GridView2.Rows[rowIndex].Cells[9].FindControl("Notes");
                 //                TextBox Price = (TextBox)GridView2.Rows[rowIndex].Cells[10].FindControl("TextBox");
                 //                //Label Kind = (Label)GridView2.Rows[rowIndex].Cells[11].FindControl("Code");


                 //                PriceID.Text = dt.Rows[i]["PriceID"].ToString();
                 //                TxSort.Text = dt.Rows[i]["SortNum"].ToString();
                 //                ItemKind.SelectedValue = dt.Rows[i]["ItemKind"].ToString();
                 //                ItemName.Text = dt.Rows[i]["ItemName"].ToString();
                 //                DDL_EdUnit.Text = dt.Rows[i]["Unit"].ToString();
                 //                Complex.Visible = dt.Rows[i]["Complex"].ToString() == "1" ? true : false;
                 //                Code.Text = dt.Rows[i]["Code"].ToString();
                 //                Quantity.Text = dt.Rows[i]["Quantity"].ToString();
                 //                Notes.Text = dt.Rows[i]["Notes"].ToString();
                 //                Price.Text = dt.Rows[i]["Price"].ToString();

                 //                rowIndex++;
                 //            }
                 //            else if (DataTableDr["Kind"] == "0")
                 //            {




                 //            }
                 //        }
                 //    }
                 //}

            }
        }
    }
}