using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

namespace IMS
{
    public partial class AddNewItem : System.Web.UI.Page
    {
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        string UID = (SystemSet.GetRequestSet("UID") != "") ? SystemSet.GetRequestSet("UID") : "";
        protected string ParentID;
        protected string UpperUID;
        protected string SortNum;
        protected string LayerNum;
        protected string InsetSortNum;
    
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["Bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "SELECT UID,LayerCode, ItemOrder , ItemName AS FullName FROM Bid_WBS where bid=" + Session["Bid"].ToString() + " ORDER BY LayerCode";
            if (ParentID != "")
            {
                SqlDataSource2.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + ParentID + ") and PriceID<>" + ParentID + " ORDER BY [PriceID]";
            }
                if (!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                DDL_EdUnit.DataSource = Utility.Unitlist.UnitList();
                DDL_EdUnit.DataBind();

                DataTable dt = WebModel.LoadSetContentData(database,SqlDataSource1.SelectCommand);
                dt.Columns.Add("FullName1", typeof(string), "ItemOrder + '-' + FullName");

                //DDLItemNmae.DataSourceID = "SqlDataSource1";
                DDLItemName.DataValueField = "UID";


                DDLItemName.DataSource = dt;
                DDLItemName.DataTextField = "FullName1";
                DDLItemName.DataBind();
            }
            if ((Session["AddNew"].ToString() == "1"))
            {
                Pnl_WBS.Visible = true;
                Pnl_Analysis.Visible = false;
                Pnl_Import.Visible = false;
            }
            else if ((Session["AddNew"].ToString() == "2"))
            {
                Pnl_WBS.Visible = false;
                Pnl_Analysis.Visible = true;
                LoadContent();
            }

           
            //string database = Session["DatabaseName"].ToString();
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));

            if (ViewState["all"] != null && (bool)this.ViewState["all"] == true)
            {
                BtnAll_Click(this, null);
            }
            if (PriceID !="")
               {
                string SelectString = "";
                SelectString = (Session["Bid"] != null) ? "Bid=" + Session["Bid"].ToString() + " and " : "";
                SelectString = (DDL_WBS.SelectedValue != "0") ? "Code like '%" + DDL_WBS.SelectedValue + "%' " + DDL_Op2.SelectedValue + "" : "";
                SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%' " : "";
                SelectString = (SelectString.Length > 1) ? " and " + SelectString + " ORDER BY [PriceID]" : "";
                SqlDataSource2.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";


                SqlDataSource2.SelectCommand += SelectString;
               }
          
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                string SQLString = "Select  *  from  Bid_Library where PriceID ='" + PriceID + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbName.Text = row["ItemName"].ToString();
                        LbUnit.Text = row["Unit"].ToString();
                        //LbCode.Text = row["Code"].ToString();
                        //LbAnaNumber.Text = row["AnaNumber"].ToString();
                        ParentID = row["PriceID"].ToString();
                        Session["ParentID"] = ParentID;
                    }
                }
                SqlDataSource2.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["ParentID"].ToString() + ") and PriceID<>" + Session["ParentID"].ToString() + "";

            }
            else if (SystemSet.GetRequestSet("UID") != "")
            {
                string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.UID='" + UID + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbName.Text = row["ItemName"].ToString();
                        LbUnit.Text = row["Unit"].ToString();
                        //LbCode.Text = row["Code"].ToString();
                        //LbAnaNumber.Text = row["Number"].ToString();
                        ParentID = row["PriceID"].ToString();
                        Session["ParentID"] = ParentID;
                    }
                }
                SqlDataSource2.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["ParentID"].ToString() + ") and PriceID<>" + Session["ParentID"].ToString() + "";

            }
           
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
         
            //ViewState["search"] = true;
        
            GridView1.DataBind();
           
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            //ViewState["search"] = false;
            DDL_Op2.SelectedValue = "0";
            TxSearch.Text = "";
            SqlDataSource2.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["ParentID"].ToString() + ") and PriceID<>" + Session["ParentID"].ToString() + " ORDER BY [PriceID]";

            GridView1.DataBind();
            ViewState["all"] = true;
        }
        //新增空白資料
        protected DataTable GetDataBox(int status)
        {

            string SQLString = "PriceID,SortNum,Kind,ItemName,Unit,Complex,Code,Number,Notes";
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
                DataRow DataTableDr = DataTableBox.NewRow();
             
                DataTableDr["BID"] = Session["BID"].ToString();
                DataTableDr["ItemName"] = "";
                DataTableDr["Unit"] = "M";
                DataTableDr["Complex"] = "2";
                DataTableDr["Code"] = "";              
                DataTableDr["Notes"] = "";


                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;
            }
            #endregion

            return DataTableBox;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["BID"] != null)
            {
                int ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView1.PageSize;
                if (e.CommandName == "Select")
                {
                   
                    int UID = (int)GridView1.DataKeys[ID_class].Value;
                 
                    Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                    Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                    Label Code = (Label)GridView1.Rows[ID_class].FindControl("Code");
                    Label Unit = (Label)GridView1.Rows[ID_class].FindControl("Unit");
                    Button Complex = (Button)GridView1.Rows[ID_class].FindControl("Complex");
                    LossComplex.Visible = GridView1.Rows[ID_class].FindControl("Complex").Visible;

                    LossName.Text = ItemName.Text;
                    LossUnit.Text = Unit.Text;
                    LossComplex.Text = (LossComplex.Visible == true) ? "有單價分析" :  (LossComplex.Visible == false) ?"無單價分析":"";
                    LbPrice.Text = PriceID.Text;
                   
                }
                if (e.CommandName == "analyst")
                {
                    int UID = (int)GridView1.DataKeys[ID_class].Value;
                    Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                    if (PriceID.Text != "")
                    {
                        //OpenNewWindow("AnalysisV.aspx?PriceID=" + PriceID.Text + "", "1");
                        Response.Write("<script>window.open('AnalysisV.aspx?PriceID=" + PriceID.Text + "','_blank')</script>");
                    }
                    else if (SystemSet.GetRequestSet("UID") != "")
                    {
                        OpenNewWindow("AnalysisV.aspx?UID=" + SystemSet.GetRequestSet("UID") + "", "1");
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇標案');", true);
            }
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }

        protected void AddLoss_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string UpdateItemOrder = "";
            string item = DDLItemName.SelectedValue;
            string EditItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemLoss.Text));
            string Unit = DDL_EdUnit.SelectedValue;
            //string complex = DDL_Res.SelectedValue;

            string SQLString ="select * from Bid_WBS where bid=" +Session["Bid"].ToString() +" and uid="+ item +"";

                 DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                 if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                 {
                     foreach (DataRow row in DataTableBox.Rows)
                     {

                         SortNum = row["SortNum"].ToString();
                         string LayerCode = row["LayerCode"].ToString();
                         LayerNum = row["LayerNum"].ToString();
                         UpperUID = row["UpperUID"].ToString();


                     }
                 }
              
                   int NewSortNum = int.Parse(SortNum) + 1;
                   string SQLInsert = "insert into  Bid_WBS  ([Bid],[LayerNum],[UpperUID],[ItemName],[Unit],[SortNum],[NewItem]) VALUES(" + Session["Bid"].ToString() + "," + LayerNum + "," + UpperUID + ",'" + EditItemName + "','" + Unit + "', " + NewSortNum + ",1)";
                  bool result= WebModel.SQLAction(database, SQLInsert);

                   int i = 1;
                   string SQLTotalSort = "Select * from  Bid_WBS a left join  where  BID=" + Session["Bid"].ToString() + "and UpperUID=" + UpperUID + " and SortNum >= " + NewSortNum + " and UID <> (select MAX(UID) from Bid_WBS)";
                   DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLTotalSort);
                   if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                   {
                      foreach (DataRow row in DataTableBox1.Rows)
                     {
                           string uid = row["uid"].ToString();
                           int num = int.Parse(NewSortNum.ToString()) + i;
                           string SQLUpdateSort = "Update Bid_WBS SET  SortNum=" + num + " where UID=" + uid + "";
                            result= WebModel.SQLAction(database, SQLUpdateSort);
                      
                           i++;
                      }
                   }
                   string select = "Select * from BidM0 where bid=" + Session["bid"].ToString();
                   string BidNumType = WebModel.SItemName(database, select, "BidNumType");
                   if (BidNumType!="")
            {
                   if (BidNumType == "0")
                   {
                       bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                       UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                       WebModel.SQLAction(database, UpdateItemOrder);
                       Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                   }
                   else if (BidNumType == "1")
                   {
                       bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                       UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                       bool result4 = WebModel.SQLAction(database, UpdateItemOrder);
                       Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                   }
                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已新增連結');", true);
                   //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先設定階層及編號!!!');", true);
            }
                 
        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {
            //Pnl_WBS.Visible = false; close
                  Response.Write("<script>self.close()</script>");
        }

        protected void InsertLoss_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string name = LossName.Text;
            string unit = LossUnit.Text;
            string InsPriceID = LbPrice.Text;
            string complex = LossComplex.Text;
            string sqlmax = "select MAX(SortNum) as SortNum  from [Bid_AnaRelation] where ParentID=" + ParentID + "";
            DataTable DataTableBox = WebModel.LoadSetContentData(database, sqlmax);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {
                   InsetSortNum = row["SortNum"].ToString();                   
                 
                }
            }
            int num = int.Parse(InsetSortNum.ToString()) + 1;
            string SQLInsert = "insert into  [Bid_AnaRelation]  ([SortNum],[ParentID],[KidID],[NewItem]) VALUES(" + num + "," + ParentID + "," + LbPrice.Text + ",'" + "1" + "')";
           bool result= WebModel.SQLAction(database, SQLInsert);

            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已新增缺漏項');", true);

        }
    }
}