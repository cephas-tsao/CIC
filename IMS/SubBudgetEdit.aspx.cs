using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class SubBudgetEdit : System.Web.UI.Page
    {
        bool flag;
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

                SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList WHERE PID = " + Session["ProjectCode"].ToString();//And ExecuteNY=1

            }
           
                string database = Session["DatabaseName"].ToString();

                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());              

        
            if (!IsPostBack)
            {
                 
                DropDownList7.DataSourceID = "SqlDataSource5";
                DropDownList7.DataBind();
                DropDownList8.DataSourceID = "SqlDataSource6";
                DropDownList8.DataBind();
                //DropDownList8.AutoPostBack = true;

                string SQLETotal = "select SUM(ETotal) as total from EBUDGET where Pid=" + Session["ProjectCode"].ToString();
                if (WebModel.SItemName(database, SQLETotal, "total") !="")
                {
                LbExeTatal.Text = decimal.Parse(WebModel.SItemName(database, SQLETotal, "total")).ToString("N0");
                //string SQLItemAmount = "select SUM(ItemAmount) as total from EBudget_ResourceBK where Pid=" + Session["ProjectCode"].ToString();
                string SQLSubTotal = "select SUM(LastAmount) as total from EBudget_ResourceBK where Pid=" + Session["ProjectCode"].ToString();

                LbSubTotal.Text = decimal.Parse(WebModel.SItemName(database, SQLSubTotal, "total")).ToString("N0");
                }
                ViewState["Dtvs"] = "";
                Session["Dtvs1"] = "";
                flag = false;
            }
          
        }
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList8.Items.Clear();
            DropDownList8.Items.Add("-請選擇部門人員-");
        }
       
        protected void Button38_Click(object sender, EventArgs e)
        {
            Pnl_SC.Visible = true;
          
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            string database = Session["DatabaseName"].ToString();                

            if (e.CommandName == "Select")
            {
                Pnl_SC.Visible = true;
                int UID = (int)GridView1.DataKeys[ID_class].Value;

                Label SBID = (Label)GridView1.Rows[ID_class].FindControl("SBID");
                Label SB_MID = (Label)GridView1.Rows[ID_class].FindControl("SB_MID");
                Label SB_Code = (Label)GridView1.Rows[ID_class].FindControl("SB_Code");
                Label SB_Name = (Label)GridView1.Rows[ID_class].FindControl("SB_Name");
                Label BookInTime = (Label)GridView1.Rows[ID_class].FindControl("BookInTime");
                Label BookContractDate = (Label)GridView1.Rows[ID_class].FindControl("BookContractDate");
                Label LastContractDate = (Label)GridView1.Rows[ID_class].FindControl("LastContractDate");
                Label BudgetPrice = (Label)GridView1.Rows[ID_class].FindControl("BudgetPrice");
                Label ContractWay = (Label)GridView1.Rows[ID_class].FindControl("ContractWay");
                Label LbWorkManDep = (Label)GridView1.Rows[ID_class].FindControl("LbWorkManDep");
                Label LbWorkManName = (Label)GridView1.Rows[ID_class].FindControl("LbWorkManName");
                Label LbBudgetPrice1 = (Label)GridView1.Rows[ID_class].FindControl("LbBudgetPrice1");

                
                RadioButtonList1.SelectedValue = ContractWay.Text;
                TxSubNum.Text = SB_Code.Text;
                TxSubItemName.Text = SB_Name.Text;
                LbSBID.Text = SBID.Text;
                //DropDownList7.DataSourceID = "SqlDataSource5";
                //DropDownList7.DataBind();
                DropDownList7.DataBind();
                DropDownList7.SelectedValue = LbWorkManDep.Text;
                //DropDownList8.AutoPostBack = true;
                DropDownList8.DataSourceID = "SqlDataSource6";
                DropDownList8.DataBind();
               
                
          
                TxBookInTime.Text = BookInTime.Text;
                TxBookContractDate.Text = BookContractDate.Text;
                TxLastContractDate.Text = LastContractDate.Text;
                LbBudgetPrice.Text = LbBudgetPrice1.Text !=""?decimal.Parse(LbBudgetPrice1.Text).ToString("N0"):"";
                DropDownList8.SelectedValue = LbWorkManName.Text.Trim();
                SqlDataSource2.SelectCommand = "Select * From SubBudget_Item Where SBID=" + SBID.Text + " And DelTemp=0";
                ViewState["SqlDataSource2"] = SqlDataSource2.SelectCommand;
                
                DataTable Dtvs = WebModel.LoadSetContentData(database, SqlDataSource2.SelectCommand);
                Dtvs.Columns.Add("BKID");
                ViewState["Dtvs"] = Dtvs;
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                //Label BKID = (Label)e.Item.FindControl("BKID");
                Label LbQuantity = (Label)e.Item.FindControl("LbQuantity");
                Label LbBPrice = (Label)e.Item.FindControl("LbBPrice");
                Label LbBComplex = (Label)e.Item.FindControl("LbBComplex");
                //BKID.Text = vsDr["BKID"].ToString();
                LbBComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(LbBPrice.Text)).ToString("N0");

            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Delete")
            {
                //Repeater1.Controls.RemoveAt(ID_class);
                DataTable Dtvs = (DataTable)ViewState["Dtvs"];
                //DataRow DataTableDr;
                Dtvs.Rows.RemoveAt(ID_class);
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();
            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();    
            DataTable Dtvs = WebModel.LoadSetContentData(database, ViewState["SqlDataSource2"].ToString());
            ViewState["Dtvs"] = Dtvs;
            Repeater1.DataSource = Dtvs;
            Repeater1.DataBind();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string SubNum = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubNum.Text));
            string SubItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubItemName.Text));
            string database = Session["DatabaseName"].ToString();
            string SQLUpdate = "Update SubBudgetList set SB_Code='" + SubNum + "',SB_Name='" + SubItemName + "',ContractWay='" + RadioButtonList1.SelectedValue + "',BookInTime='" + TxBookInTime.Text + "',BookContractDate='" + TxBookContractDate.Text + "',LastContractDate='" + TxLastContractDate.Text + "',WorkManDep='" + DropDownList7.SelectedValue + "',WorkManName='" + DropDownList8.SelectedValue + "' where SBID=" + LbSBID.Text;
            bool result=  WebModel.SQLAction(database, SQLUpdate);
            string result2 = "";
            string SQLDel = "Delete from SubBudget_Item where SBID=" + LbSBID.Text;
            bool result1 = WebModel.SQLAction(database, SQLDel);
            string SQLString = "SBID,ItemName,Unit,BelongItem,SCNumber,UnitPrice";
            DataTable DataTableBox = new DataTable();
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataRow DataTableDr = DataTableBox.NewRow();
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    Label BKID = item.FindControl("BKID") as Label;
                    Label SBID = item.FindControl("SBID") as Label;
                    Label LbSB_MID = item.FindControl("LbSB_MID") as Label;
                    Label LbItemName = item.FindControl("LbItemName") as Label;
                    Label LbUnit = item.FindControl("LbUnit") as Label;
                    Label LbBItem = item.FindControl("LbBItem") as Label;
                    Label LbQuantity = item.FindControl("LbQuantity") as Label;
                    Label LbBPrice = item.FindControl("LbBPrice") as Label;
                    Label LbBComplex = item.FindControl("LbBComplex") as Label;

                    //string SelectSQL = "Select * from SubBudget_Item where SB_MID=" + LbSB_MID.Text;
                    //string id = WebModel.SItemName(database, SelectSQL, "SB_MID");
                    //if (id == "")
                    //{
                        //string SQLSave = "insert into SubBudget_Item  ([SBID],[ItemName],[Unit],[BelongItem],[SCNumber],[UnitPrice]) VALUES('" + SBID.Text + "','" + LbItemName.Text + "', '" + LbUnit.Text + "','" + LbBItem.Text + "','" + LbQuantity.Text + "','" + LbBPrice.Text + "')";
                        DataTableDr["SBID"] = SBID.Text;
                        DataTableDr["ItemName"] = LbItemName.Text;
                        DataTableDr["Unit"] = LbUnit.Text;
                        DataTableDr["BelongItem"] = LbBItem.Text;
                        DataTableDr["SCNumber"] = decimal.Parse(LbQuantity.Text);
                        DataTableDr["UnitPrice"] = decimal.Parse(LbBPrice.Text);

                        DataTableBox.Rows.Add(DataTableDr);
                        result2 = WebModel.SaveAction(database, "SubBudget_Item", DataTableBox);
                        //bool result = WebModel.SQLAction(database, SQLSave);
                        //string SQLselect="Select * from EBudget_ResourceBK where BKID="+BKID.Text;
                        //string LastAmount = WebModel.SItemName(database, SQLselect, "LastAmount");
                        //LastAmount = LastAmount != "" ? LastAmount : "0";
                        //decimal Remain = decimal.Parse(LastAmount) - decimal.Parse(LbQuantity.Text);
                        //string SQLUDRBK = "Update EBudget_ResourceBK set LastAmount=" + Remain + " where BKID=" + BKID.Text;
                        //bool result1 = WebModel.SQLAction(database, SQLUDRBK);
                     
                    //}
                }

                DataTableBox.Rows.Clear();
            }
            if (result2 == "1")
            {
                Response.Write("<script>alert('存檔成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('存檔失敗');</script>");
            }

            GridView1.DataBind();
            //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完畢!');", true);

        }

        protected void BtnDelSub_Click(object sender, EventArgs e)
        {
            
            string database = Session["DatabaseName"].ToString();
            string SQLDel = "Delete SubBudgetList where SBID=" + LbSBID.Text;
            string SQLDel1 = "Delete SubBudget_Item where SBID=" + LbSBID.Text;
            WebModel.SQLAction(database, SQLDel);
            WebModel.SQLAction(database, SQLDel1);

            GridView1.DataBind();
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('刪除完畢!');", true);
        }
      
        protected void BtnAddSub_Click(object sender, EventArgs e)
        {
            
            Response.Write("<script>window.open('AddSubBudgetMaterial.aspx', 'window', config='height=1500,width=1500')</script>");
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxKeyWord.Text));

            #region 搜尋條件
            string SelectString = "";

            SelectString = (KeyWord != "") ? "SB_Name like '%" + KeyWord + "%' " : "";
            if (KeyWord != "" && DDL_Op3.SelectedValue != "")
            {
                SelectString += DDL_Op1.SelectedValue+" ";
            }
            SelectString += (DDL_Op3.SelectedValue != "") ? " BudgetLockNY = " + DDL_Op3.SelectedValue + "" : "";

            SelectString = (SelectString.Length > 1) ? SelectString : "";
            SqlDataSource1.SelectCommand = "";
            SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList  "; 
            SqlDataSource1.SelectCommand = (SelectString.Length > 1) ? SqlDataSource1.SelectCommand.Substring(0, SqlDataSource1.SelectCommand.Length) : SqlDataSource1.SelectCommand;
            SqlDataSource1.SelectCommand += (SelectString.Length > 1) ? "WHERE " + SelectString + " and PID = " + Session["ProjectCode"].ToString() + "" : " WHERE PID = " + Session["ProjectCode"].ToString() + "";


            #endregion

            GridView1.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList WHERE PID = " + Session["ProjectCode"].ToString();//And ExecuteNY=1
            GridView1.DataBind();
        }

      
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
                Label BookContractDate = (Label)e.Row.FindControl("BookContractDate");
                Label LastContractDate = (Label)e.Row.FindControl("LastContractDate");
                Label BudgetPrice = (Label)e.Row.FindControl("BudgetPrice");



                BookInTime.Text = BookInTime.Text != "" ? DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd") : "";
                BookContractDate.Text = BookContractDate.Text != "" ? DateTime.Parse(BookContractDate.Text).ToString("yyyy-MM-dd") : "";
                LastContractDate.Text = LastContractDate.Text!=""?DateTime.Parse(LastContractDate.Text).ToString("yyyy-MM-dd"):"";
                BudgetPrice.Text = BudgetPrice.Text != "" ? decimal.Parse(BudgetPrice.Text).ToString("N0") : "";
              

            }
      
        }
   
        protected void Self_Click(object sender, EventArgs e)
             {
                 //Response.Redirect("SubBudgetEdit.aspx");
                 DataTable DtVs;        
                 DtVs = (DataTable)ViewState["Dtvs"];
                    
               
                 if (Session["itemRiAll"] != "" && Session["itemRiAll"] != null)
                 {
                  
                     if ((DataTable)ViewState["Dtvs"] != null)
                     {


                         DataTable DtVs1 = (DataTable)Session["itemRiAll"];
                         DataRow DataTableDr;

                         if (DtVs1 != null && DtVs1.Rows.Count > 0)
                         {

                             foreach (DataRow row in DtVs1.Rows)
                             {
                                 DataTableDr = DtVs.NewRow();
                                 string BKID = row["BKID"].ToString();                                 
                                 string ItemName = row["ItemName"].ToString();
                                 string Unit = row["Unit"].ToString();
                                 string SCNumber = row["SCNumber"].ToString();
                                 string UnitPrice = row["UnitPrice"].ToString();
                                 string BelongItem = row["BelongItem"].ToString();

                                 DataTableDr["BKID"] = BKID;
                                 DataTableDr["SB_MID"] = "0";
                                 DataTableDr["SBID"] = LbSBID.Text;
                                 DataTableDr["ItemName"] = ItemName;
                                 DataTableDr["BelongItem"] = BelongItem;
                                 DataTableDr["Unit"] = Unit;
                                 DataTableDr["SCNumber"] = SCNumber;
                                 DataTableDr["UnitPrice"] = UnitPrice;
                                 DataTableDr["DelTemp"] = 0;
                                 DataTableDr["AddTemp"] = 0;
                                 //DataTableDr["UnitPrice"] = UnitPrice;

                                 DtVs.Rows.Add(DataTableDr);
                             }
                             DtVs1.Dispose();
                         }
                     }
                     Repeater1.DataSource = DtVs;
                     Repeater1.DataBind();
                     DtVs.Dispose();
                     Session["itemRiAll"] = "";
                 }
                 if (Session["itemRi"] != "" && Session["itemRi"] != null)
                 {
                     //DataTable DtVs = (DataTable)ViewState["Dtvs"];
                     //DtVs.Columns.Add("BKID");
                     if ((DataTable)ViewState["Dtvs"] != null)
                     {


                         DataTable DtVs1 = (DataTable)Session["itemRi"];
                         DataRow DataTableDr;

                         if (DtVs1 != null && DtVs1.Rows.Count > 0)
                         {

                             foreach (DataRow row in DtVs1.Rows)
                             {
                                 DataTableDr = DtVs.NewRow();
                                 //string BKID = row["BKID"].ToString();        
                                 string ItemName = row["ItemName"].ToString();
                                 string Unit = row["Unit"].ToString();
                                 string SCNumber = row["ENumber"].ToString();
                                 string UnitPrice = row["EUnitPrice"].ToString();
                                 string BelongItem = row["ItemOrder"].ToString();

                                 //DataTableDr["BKID"] = BKID;
                                 DataTableDr["SB_MID"] = "0";
                                 DataTableDr["SBID"] = LbSBID.Text;
                                 DataTableDr["ItemName"] = ItemName;
                                 DataTableDr["Unit"] = Unit;
                                 DataTableDr["SCNumber"] = SCNumber;
                                 DataTableDr["UnitPrice"] = UnitPrice !=""?decimal.Parse(UnitPrice):0;
                                 DataTableDr["BelongItem"] = BelongItem;
                                 DataTableDr["DelTemp"] = 0;
                                 DataTableDr["AddTemp"] = 0;
                                 //DataTableDr["UnitPrice"] = UnitPrice;

                                 DtVs.Rows.Add(DataTableDr);
                             }
                             DtVs1.Dispose();
                         }
                     }
                     Repeater1.DataSource = DtVs;
                     Repeater1.DataBind();
                     DtVs.Dispose();
                     Session["itemRi"] = "";
                 }
                 if (Session["itemWi"] != "" && Session["itemWi"] != null)
                 {
                       //DataTable DtVs = (DataTable)ViewState["Dtvs"];
                       //DtVs.Columns.Add("BKID");
                     if ((DataTable)ViewState["Dtvs"] != null)
                     {


                         DataTable DtVs1 = (DataTable)Session["itemWi"];
                         DataRow DataTableDr;

                         if (DtVs1 != null && DtVs1.Rows.Count > 0)
                         {

                             foreach (DataRow row in DtVs1.Rows)
                             {
                                 DataTableDr = DtVs.NewRow();
                                 //string BKID = row["BKID"].ToString();        
                                 string ItemName = row["ItemName"].ToString();
                                 string Unit = row["Unit"].ToString();
                                 string ENumber = row["ENumber"].ToString();
                                 string EUnitPrice = row["EUnitPrice"].ToString()!=""?row["EUnitPrice"].ToString():"0";
                                 
                                 //DataTableDr["BKID"] = BKID;
                                 DataTableDr["SB_MID"] = "0" ;
                                 DataTableDr["SBID"] = LbSBID.Text;
                                 DataTableDr["ItemName"] = ItemName;
                                 DataTableDr["Unit"] = Unit;
                                 DataTableDr["SCNumber"] =decimal.Parse(ENumber);
                                 DataTableDr["UnitPrice"] =decimal.Parse(EUnitPrice);
                                 DataTableDr["DelTemp"] = 0;
                                 DataTableDr["AddTemp"] = 0;
                                 //DataTableDr["UnitPrice"] = UnitPrice;

                                 DtVs.Rows.Add(DataTableDr);
                             }
                             DtVs1.Dispose();
                         }
                     }
                     Repeater1.DataSource = DtVs;
                     Repeater1.DataBind();
                     DtVs.Dispose();
                     Session["itemWi"] = "";
                 }

                 if (Session["Dtvs1"] != "" && Session["Dtvs1"] != null)
                 {
                     //DataTable DtVs = (DataTable)ViewState["Dtvs"];
                     //DtVs.Columns.Add("BKID");
                     if ((DataTable)ViewState["Dtvs"] != null)
                     {


                         DataTable DtVs1 = (DataTable)Session["Dtvs1"];
                         DataRow DataTableDr;

                         if (DtVs1 != null && DtVs1.Rows.Count > 0)
                         {

                             foreach (DataRow row in DtVs1.Rows)
                             {
                                 DataTableDr = DtVs.NewRow();
                                 string BKID = row["BKID"].ToString();        
                                 string ItemName = row["ItemName"].ToString();
                                 string Unit = row["Unit"].ToString();
                                 string SCNumber = row["SCNumber"].ToString();
                                 string UnitPrice = row["UnitPrice"].ToString();
                                 string BelongItem = row["BelongItem"].ToString();

                                 DataTableDr["BKID"] = BKID;
                                 DataTableDr["SB_MID"] = "0";
                                 DataTableDr["SBID"] = LbSBID.Text;
                                 DataTableDr["ItemName"] = ItemName;
                                 DataTableDr["BelongItem"] = BelongItem;
                                 DataTableDr["Unit"] = Unit;
                                 DataTableDr["SCNumber"] = SCNumber;
                                 DataTableDr["UnitPrice"] = UnitPrice;
                                 DataTableDr["DelTemp"] = 0;
                                 DataTableDr["AddTemp"] = 0;
                                 //DataTableDr["UnitPrice"] = UnitPrice;

                                 DtVs.Rows.Add(DataTableDr);
                             }
                             DtVs1.Dispose();
                         }
                     }
                     Repeater1.DataSource = DtVs;
                     Repeater1.DataBind();
                     DtVs.Dispose();
                     Session["Dtvs1"] = "";
                 }
                
             }
    }
}