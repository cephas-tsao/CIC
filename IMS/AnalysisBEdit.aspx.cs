using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class AnalysisBEdit : System.Web.UI.Page
    {
        string _TableName = "Pro_Resource";
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

                //Session["DataTable"] = null;
            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
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
                string SQLString = "Select * from Pro_Resource where PriceID='" + Session["PriceID"].ToString() + "'";
                string SQLString1 = "Select * from Pro_Resource a left join Pro_Analysis b on a.PriceID=b.KidID where b.ParentID='" + Session["PriceID"].ToString() + "'";
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                DataTableBox1.Columns.Add("Kinds");//分別新增或原有工項
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
                    foreach (DataRow row in DataTableBox1.Rows)
                    {
                                             
                       string LbUnit = row["Unit"].ToString().Trim();
                       row["Unit"] = LbUnit.ToUpper();

                    }
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

            string SQLString = "Pid,PriceID,SortNum,Kind,ItemName,Unit,Complex,Code,WorkRate,Notes,Kinds";
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
                DataTableDr["Kinds"] = "0";
                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                DataTableDr["ItemName"] = "";
                DataTableDr["Unit"] = "M";
                DataTableDr["Complex"] = "2";
                DataTableDr["Code"] = "";
                DataTableDr["WorkRate"] = "";
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
            bool result4 = false;
            string result3 = "";
            bool delfalg = false;
            //string SQLString = "PriceID,SortNum,Kind,ItemName,Unit,Complex,Code,WorkRate,Notes";
            string SQLString = "Pid,PriceID,ItemKind,ItemName,Unit,Complex,Code,AnaNumber,Notes";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            //後台功能，必需要有的欄位名稱              


            #region 內容設定
            foreach (GridViewRow row in GridView2.Rows)
            {
                Label PriceID = (Label)row.FindControl("PriceID");
                Label Kinds = (Label)row.FindControl("Kinds");
                TextBox TxSort = (TextBox)row.FindControl("TxSort");
                DropDownList Kind = (DropDownList)row.FindControl("Kind");
                TextBox ItemName = (TextBox)row.FindControl("ItemName");
                DropDownList DDL_EdUnit = (DropDownList)row.FindControl("DDL_EdUnit");
                ImageButton Complex = (ImageButton)row.FindControl("Complex");
                TextBox Code = (TextBox)row.FindControl("Code");
                TextBox Quantity = (TextBox)row.FindControl("Quantity");
                TextBox Notes = (TextBox)row.FindControl("Notes");
                //if (datacheck(ItemName.Text, DDL_EdUnit.SelectedValue) == false)
                //{
               
                DataRow DataTableDr = DataTableBox.NewRow();
                DataTableBox.Clear();
                if (DataTableBox.Rows.Count != 0 || ItemName.Text != "")
                {
                   
                    DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                    DataTableDr["PriceID"] = PriceID.Text;
                    //DataTableDr["SortNum"] = TxSort.Text;
                    DataTableDr["ItemKind"] = Kind.SelectedValue;
                    DataTableDr["ItemName"] = ItemName.Text;
                    DataTableDr["Unit"] = DDL_EdUnit.SelectedValue;
                    DataTableDr["Complex"] = (Complex.Visible == true) ? "1" : (Complex.Visible == false) ? "2" : "0";
                    DataTableDr["Code"] = Code.Text;
                    DataTableDr["AnaNumber"] = Quantity.Text;
                    DataTableDr["Notes"] = Notes.Text;

                    DataTableBox.Rows.Add(DataTableDr);

            #endregion
                    
                    //插入關係資料表建立關係
                    if (TxSort.Text != "" && ItemName.Text != "" && Quantity.Text != "")
                    {
                        if (!delfalg)
                        {
                            string SQLString2 = "Delete from Pro_Analysis where ParentID=" + Session["PriceID"].ToString() + "";

                            result = WebModel.SQLAction(database, SQLString2);
                            delfalg = true;
                        }

                        if (Kinds.Text == "0")
                        {
                            DataTableBox.Columns.Remove("PriceID");
                            //DataTableDr["Bid"] = Session["Bid"].ToString();
                            result3 = WebModel.SaveAction(database, "Pro_Resource", DataTableBox);
                            DataTableBox.Columns.Add("PriceID");
                        }
                        else
                        {

                            DataTableBox.Columns.Remove("PriceID");
                            result1 = WebModel.EditAction_Anyid(database, _TableName, PriceID.Text, "PriceID", DataTableBox);
                            DataTableBox.Columns.Add("PriceID");
                        }

                        if (Session["PriceID"].ToString() != PriceID.Text)
                        {
                            if (Kinds.Text == "0")
                            {
                                int sid = WebModel.MaxID(database, "Pro_Resource") - 1;
                                string Sql2 = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + sid + "','" + Quantity.Text + "')";
                                result1 = WebModel.SQLAction(database, Sql2);
                            }
                            else if (Kinds.Text == "1")
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
                                GridView2.DataBind();
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
            //            string Sql2 = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + TxSort.Text + "','" + Session["PriceID"].ToString() + "', '" + PriceID.Text + "','" + Quantity.Text + "')";
            //            result2= WebModel.SQLAction(database, Sql2);

            //            //更新有單價分析
            //            string Sql3 = "update  " + _TableName + " set Complex=1 where PriceID= '" + Session["PriceID"].ToString() + "'";
            //           result4=  WebModel.SQLAction(database, Sql3);

            //          if (result && result1)
            //          {

            //              ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('工料已全儲存完畢');", true);
            //          }
            //          else
            //          {

            //              ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('工料儲存失敗');", true);

            //          }
            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入工料各項內容');", true);
            //        }


                }
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入工料');", true);
            }
                       
        }

      
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Earse")
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];

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
            if (Session["ProjectCode"] != null)
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
                    DataTableDr["PID"] = Session["ProjectCode"].ToString();
                    DataTableDr["ItemName"] = ItemName.Text;
                    DataTableDr["Unit"] = Unit.Text.Trim();
                    DataTableDr["Complex"] = (Complex.Text == "有") ? "1" : (Complex.Text == "無") ? "2" : "0";
                    DataTableDr["Code"] = Code.Text;

                    DataTableBox.Rows.Add(DataTableDr);
                    Session["DataTable"] = DataTableBox;
                    ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;

                    GridView2.DataSource = DataTableBox;

                    GridView2.DataBind();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);
            }

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));

            string SelectString = "";
            SelectString = (DDL_WBS.SelectedValue != "0") ? "Code like '%" + DDL_WBS.SelectedValue + "%' " + DDL_Op2.SelectedValue + "" : "";
            SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%' " : "";
            SelectString = (SelectString.Length > 1) ? " where " + SelectString + " ORDER BY [PriceID]" : "";

            SqlDataSource2.SelectCommand += SelectString;
            GridView2.DataSource = (DataTable)Session["DataTable"];
            GridView2.DataBind();

        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT * FROM [Pro_Resource] ORDER BY [PriceID]";
            GridView2.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label Complex = (Label)e.Row.FindControl("Complex");
               
                string com = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();

                Complex.Text =  com == null ? (Complex.Text = "無"):com == "1" ? (Complex.Text = "有") : com == "" ? (Complex.Text = "無") : com == "0" ? (Complex.Text = "無") : "無";


            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ImageButton Complex = (ImageButton)e.Row.FindControl("Complex");
                DropDownList Kind = (DropDownList)e.Row.FindControl("Kind");
                Kind.SelectedValue = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString();
                string com = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();

                Complex.Visible = com == null ? (Complex.Visible = false) : com == "1" ? (Complex.Visible = true) : com == "" ? (Complex.Visible = false) : com == "0" ? (Complex.Visible = false) : false;
               

            }
        }
    }
}