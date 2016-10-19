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
    public partial class PublicAnalysisEdit : System.Web.UI.Page
    {
        string _TableName = "Pro_Resource";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PriceID"] = Request.QueryString["ID"];
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
            SqlDataSource2.SelectCommand = Sql;
          
            
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
                string SQLString = "Select * from PrivateResource where PriceID='" + Session["PriceID"].ToString() + "'";
                string SQLString1 = "Select * from PrivateResource a left join PrivateAnalysis b on a.PriceID=b.KidID where b.ParentID='" + Session["PriceID"].ToString() + "'";
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

            string SQLString = "PriceID,SortNum,ItemKind,ItemName,Unit,Complex,Code,AnaNumber,Notes,Price,Kind,WorkRate";
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
                //DataTableDr["BID"] = Session["BID"].ToString();
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
            string SQLString = "PriceID,ItemKind,ItemName,Unit,Complex,Code,Notes";
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
                       //DataTableDr["Bid"] = Session["Bid"].ToString();
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
                                string SQLString2 = "Delete from Pro_Analysis where ParentID=" + Session["PriceID"].ToString() + "";

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
                                result3 = WebModel.SaveAction(database, "Pro_Resource", DataTableBox);
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
                                    int sid = WebModel.MaxID(database, "Pro_Resource") - 1;
                                    string Sql2 = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + sid + "','" + Quantity.Text + "')";
                                    result1 = WebModel.SQLAction(database, Sql2);
                                }
                                else if (Kind.Text == "1")
                                {

                                    string Sql2 = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + PriceID.Text + "','" + Quantity.Text + "')";
                                    result1 = WebModel.SQLAction(database, Sql2);


                                }
                                else
                                {
                                    string Sql2 = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + PriceID.Text + "','" + Quantity.Text + "')";
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
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入工項各項內容');", true);
                        }
              
                      
                    }
                   
                   

            }
         
            //更新父項單價
            if (TxAnaNumber.Text!="")
            {
            decimal Price1 = TotalPrice / decimal.Parse(TxAnaNumber.Text);
              string Sql3 = "update  " + _TableName + " set Complex=1,Price='" + Price1 + "' where PriceID= '" + Session["PriceID"].ToString() + "'";
              bool result4 = WebModel.SQLAction(database, Sql3);
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('("+ItemName.Text+")已有相同名稱');", true);
            }
            
            
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
            string database = Session["DatabaseName"].ToString();
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
                      Label AnaNumber = (Label)GridView1.Rows[ID_class].FindControl("AnaNumber");
                   
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
                      //DataTableDr["BID"] = Session["Bid"].ToString();
                      DataTableDr["ItemName"] = ItemName.Text;
                      DataTableDr["Unit"] = Unit.Text.Trim();
                      DataTableDr["Complex"] = (Complex.Text == "有")? "1" :(Complex.Text == "無")? "2":"0";
                      DataTableDr["Code"] = Code.Text;
                      DataTableDr["ItemKind"] = ItemKind.Text;
                      DataTableDr["WorkRate"] = AnaNumber.Text !=""?AnaNumber.Text:"0";
                      DataTableDr["Kind"] = "1";
                      DataTableBox.Rows.Add(DataTableDr);
                      Session["DataTable"] = DataTableBox;
                      ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;
                      if (Complex.Text == "有")
                    {
                          string KidID = "";
                          string SQLSelectAnalysis = "Select * from [PrivateAnalysis] where ParentID=" + PriceID.Text;
                          
                          DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelectAnalysis);
                          
                        for (int i = 0; i < Dtvs.Rows.Count; i++)
                        {
                           DataRow vsDr = Dtvs.Rows[i];
                            KidID=vsDr["KidID"].ToString();
                            string SQLSelectKidID = "Select * from [PrivateResource] where PriceID=" + KidID;
                            DataTable Dtvs1 = WebModel.LoadSetContentData(database, SQLSelectKidID);
                            for (int j = 0; j < Dtvs1.Rows.Count; j++)
                            {
                                DataRow vsDr1 = Dtvs1.Rows[j];
                                string KidItemName = vsDr1["ItemName"].ToString();
                                string KidUnit = vsDr1["Unit"].ToString();
                                string KidComplex = vsDr1["Complex"].ToString();
                                string KidAnaNumber = vsDr1["AnaNumber"].ToString();
                                string KidCode = vsDr1["Code"].ToString();
                                string KidPrice = vsDr1["Price"].ToString();
                                string KidNotes = vsDr1["Notes"].ToString();
                                string KidItemKind = vsDr1["ItemKind"].ToString();

                                DataTableDr = DataTableBox.NewRow();

                                DataTableDr["SortNum"] = NextNum+i+1;
                                DataTableDr["PriceID"] = KidID;
                                //DataTableDr["BID"] = Session["Bid"].ToString();
                                DataTableDr["ItemName"] = KidItemName;
                                DataTableDr["Unit"] = KidUnit;
                                DataTableDr["Complex"] = KidComplex;
                                DataTableDr["Code"] = KidCode;
                                DataTableDr["ItemKind"] = KidItemKind;
                                DataTableDr["WorkRate"] = KidAnaNumber !=""?KidAnaNumber:"0";
                                DataTableDr["Kind"] = "1";
                                DataTableBox.Rows.Add(DataTableDr);
                                Session["DataTable"] = DataTableBox;
                                ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;

                            }
                        }

                    }
                  GridView2.DataSource = DataTableBox;
               
                  GridView2.DataBind();
              }
           
           
        }
       
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                   
                        //return "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["PriceID"].ToString() + ") and PriceID<>" + Session["PriceID"].ToString() + " ";
                    return "Select * from PrivateResource";//
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
            //string database = "[PublicDB].[dbo].[PublicResource]";
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
            SqlDataSource2.SelectCommand = "";
            Sql = "Select * from PrivateResource";
            //if (Session["bid"] != null)
            //{
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
                             
               // SelectString = (SelectString.Length > 1) ? " where " + SelectString + " ORDER BY [PriceID]" : "";
                //SelectString.Substring(0,SelectString.Length-4)
                if (SelectString != "")
                {
                    SqlDataSource2.SelectCommand = Sql +"where "+ SelectString;
                }
                else
                {
                    SqlDataSource2.SelectCommand = Sql;
                }
               
                Sql = SqlDataSource2.SelectCommand;
                //GridView2.DataSource = (DataTable)Session["DataTable"];
                GridView1.DataBind();
          
          
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT * FROM [PrivateResource] ORDER BY [PriceID]";
            GridView1.DataBind();
          
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ItemKind = (DropDownList)e.Row.FindControl("ItemKind");

                string com = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString();

                ItemKind.SelectedItem.Text = com;
             
                

            }
        }
    }
}