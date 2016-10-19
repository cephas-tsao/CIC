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
    public partial class BidItemEdit1 : System.Web.UI.Page
    {
        string SQLString = "BID,LayerNum,UpperUID,SortNum,ItemName,Unit,ItemKind,PriceID,Notes";
        protected string LbLayerNum;
        protected int SortNum;
        string SQLUpdateSort;
        string PriceID;
        string ItermName;
        string UID = SystemSet.GetRequestSet("UId");
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案');location.href='Main.aspx';</script>");

            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {

                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataBind();

               
                LoadContent();
                Session["DDLLayer"] = null;
                Session["DDLDtUpper"] = null;
                Session["DDLNext"] = null;
                Session["DDLKind"] = null;
                Session["TxItemName"] = null;
                Session["DDL_Unit"] = null;
                Session["PriceID"] = null;
                Session["ResourceLinkPriceID"] = null;
                ListItem LI2 = new ListItem();
                LI2.Text = "-請選擇-";
                LI2.Value = "0";
                DDL_Unit.Items.Insert(0, LI2);
                if (UID != "")
                {
                    string database = Session["DatabaseName"].ToString();
                    string SQLString1 = "Select * from Bid_WBS where UId=" + UID;
                    DataTable DataTable = WebModel.LoadSetContentData(database, SQLString1);
                    foreach (DataRow row in DataTable.Rows)
                    {
                        
                        //DDLLayer.DataBind();
                        //DDLLayer.AutoPostBack = true;
                        DDLLayer.SelectedValue = row["LayerNum"].ToString().Trim();
                        DDLLayer_SelectedIndexChanged(this, null);
                        DDLDtUpper.AutoPostBack = true;
                        DDLDtUpper.DataSourceID = "SqlDataSource1";
                        DDLDtUpper.DataBind();
                        DDLDtUpper.SelectedValue = row["UpperUID"].ToString();
                        DDLTop_SelectedIndexChanged(this, null);
                        DDLNext.DataBind();
                        DDLNext.SelectedValue = row["SortNum"].ToString();
                        DDLKind.SelectedValue = row["ItemKind"].ToString();
                        TxItemName.Text = row["ItemName"].ToString();
                        DDL_Unit.DataBind();
                        DDL_Unit.SelectedValue = row["Unit"].ToString();
                        string PriceID = row["PriceID"].ToString();
                        if (PriceID != "")
                        {
                            string SQLSelectString = "Select * from Bid_Library where PriceID=" + PriceID;
                            ItemName.Text = WebModel.SItemName(database, SQLSelectString, "ItemName");
                        }
                        if (row["ItemKind"].ToString() == "workitem")
                        {
                            Button17.Enabled = true;
                        }
                        else
                        {

                            Button17.Enabled = false;
                        }


                    }


                }
               
            }


            //if (Session["PriceID"] != null && Session["PriceID"] != "")
            //{

            //    string PriceIDArray = Session["PriceID"].ToString();

            //    PriceID = PriceIDArray.Split('ξ')[0];
            //    Session["thisID"] = PriceID;
            //    ItemName.Text = PriceIDArray.Split('ξ')[1];
            //    DDLLayer.SelectedValue = Session["DDLLayer"].ToString();
            //    DDLDtUpper.SelectedValue = Session["DDLDtUpper"].ToString();
            //    DDLNext.SelectedValue = Session["DDLNext"].ToString();
            //    DDLKind.SelectedValue = Session["DDLKind"].ToString();
            //    TxItemName.Text = Session["TxItemName"].ToString();
            //    DDL_Unit.SelectedValue = Session["DDL_Unit"].ToString();
            //    LbPriceID.Text = PriceID;
            //    LoadContent();
            //    Session["DDLLayer"] = null;
            //    Session["DDLDtUpper"] = null;
            //    Session["DDLNext"] = null;
            //    Session["DDLKind"] = null;
            //    Session["TxItemName"] = null;
            //    Session["DDL_Unit"] = null;
            //    Session["PriceID"] = null;
            //}
            if (Session["ResourceLinkPriceID"] != null && Session["ResourceLinkPriceID"] != "")
            {
                string PriceIDArray = Session["ResourceLinkPriceID"].ToString();
                string database = Session["DatabaseName"].ToString();
                PriceID = PriceIDArray.Split('ξ')[0];
                Session["thisID"] = PriceID;
                ItemName.Text = PriceIDArray.Split('ξ')[1];
                DDLLayer.SelectedValue = Session["DDLLayer"].ToString();
                DDLDtUpper.SelectedValue = Session["DDLDtUpper"].ToString();
                DDLNext.SelectedValue = Session["DDLNext"].ToString();
                DDLKind.SelectedValue = Session["DDLKind"].ToString();
                TxItemName.Text = Session["TxItemName"].ToString();
                DDL_Unit.SelectedValue = Session["DDL_Unit"].ToString();
                LbPriceID.Text = PriceID;
                LoadContent();

                string SQLString1 = "Select  *  from  Bid_Library  where PriceID=" + PriceID + "";
               DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
               if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
               {
                   foreach (DataRow row in DataTableBox1.Rows)
                   {

                       ItemName.Text = row["ItemName"].ToString();

                   }

               }
                Session["DDLLayer"] = null;
                Session["DDLDtUpper"] = null;
                Session["DDLNext"] = null;
                Session["DDLKind"] = null;
                Session["TxItemName"] = null;
                Session["DDL_Unit"] = null;
                Session["PriceID"] = null;


                Session["ResourceLinkPriceID"] = null;

            }
          
        }
        protected void Button17_Click(object sender, EventArgs e)
        {
             Session["DDLLayer"] = DDLLayer.SelectedValue;
             Session["DDLDtUpper"] = DDLDtUpper.SelectedValue;
             Session["DDLNext"] = DDLNext.SelectedValue;
             Session["DDLKind"] = DDLKind.SelectedValue;
             Session["TxItemName"] = TxItemName.Text;
             Session["PriceID"] = LbPriceID.Text;
             Session["DDL_Unit"] = DDL_Unit.SelectedValue;
            OpenNewWindow("ResourceLink.aspx?PriceID=", Button17.ID);
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLStringNum = "Select  MAX(LayerNum) as id  from Bid_WBS where BID=" + Session["BID"] + "";
            //string SQLString1 = "";
            //if (Session["thisID"] != null)
            //{
            //    SQLString1 = "Select  *  from  Bid_Library  where PriceID=" + Session["thisID"].ToString() + "";
            //}
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringNum);
          

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    LbLayerNum = row["id"].ToString();

                }
                if (ViewState["addLayer"] == null)
                {
                    LbLayerNum = LbLayerNum != "" ? LbLayerNum : "1";
                    for (int i = 1; i <= int.Parse(LbLayerNum); i++)
                    {
                        DDLLayer.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    }
                }
               
            }
            ViewState["addLayer"] = true;
            if (Session["EItemName"] != null)
                TxItemName.Text = Session["EItemName"].ToString();
       
        }
     
        protected void DDLLayer_SelectedIndexChanged(object sender, EventArgs e)
        {

            DDLDtUpper.Items.Clear();
            DDLNext.Items.Clear();
            DDLDtUpper.DataSourceID = "SqlDataSource1";
            //for (int i=0; i<= int.Parse(ViewState["i"].ToString()); i++)
            //{
            //DDLLayer.SelectedValue = i.ToString();
            if (Session["bid"] != null && Session["bid"].ToString() != "")
            {
                int layer = int.Parse(DDLLayer.SelectedValue)-1;

                //}
                if (layer == 0)
                {
                    SqlDataSource1.SelectCommand = "";
                    //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('無上層工項');", true);

                }

                else
                {


                    SqlDataSource1.SelectCommand = "Select * from Bid_WBS where LayerNum =" + layer + " and  ItemName is not null and Bid=" + Session["Bid"].ToString() + "";
                    DDLDtUpper.DataTextField = "ItemName";
                    DDLDtUpper.DataValueField = "UID";
                    DDLDtUpper.AutoPostBack = true;
                    DDLDtUpper.DataBind();
                   
                }
                ListItem LI2 = new ListItem();
                LI2.Text = "--";
                LI2.Value = "0";

                DDLDtUpper.Items.Insert(0, LI2);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇標案');", true);
            }
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

            string TopWBS = DDLDtUpper.SelectedValue;
            string Next = DDLNext.SelectedValue;
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            //string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            #region 內容設定
            if (Session["bid"] != null)
            {
                DataTableDr["bid"] = Session["bid"].ToString();

                DataTableDr["LayerNum"] = DDLLayer.SelectedValue;
                DataTableDr["UpperUID"] = DDLDtUpper.SelectedValue;
                DataTableDr["SortNum"] = DDLNext.SelectedValue;
                DataTableDr["ItemKind"] = DDLKind.SelectedValue;
                DataTableDr["ItemName"] = ItemName;
                DataTableDr["PriceID"] = LbPriceID.Text;
                DataTableDr["Unit"] = DDL_Unit.SelectedValue;
                //DataTableDr["Notes"] = Notes;

                SortNum = int.Parse(DDLNext.SelectedValue);
                DataTableBox.Rows.Add(DataTableDr);
            #endregion

                SQLUpdateSort = "update Bid_WBS set sortnum=SortNum+1 where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum >=" + DDLNext.SelectedValue + "";
                WebModel.SQLAction(database, SQLUpdateSort);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }

        //GetDataBox for edit function 
        protected DataTable GetDataBox1()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable();
            string SQLString1 = "UID,BID,LayerNum,UpperUID,SortNum,ItemName,ItemKind,PriceID,Notes";
            foreach (string DataName in SQLString1.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            bool result = false;
            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            string TopWBS = DDLDtUpper.SelectedValue;
            string Next = DDLNext.SelectedValue;
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            //string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            #region 內容設定
            if (Session["bid"] != null)
            {
                DataTableDr["bid"] = Session["bid"].ToString();
                DataTableDr["Uid"] = UID;
                DataTableDr["LayerNum"] = DDLLayer.SelectedValue;
                DataTableDr["UpperUID"] = DDLDtUpper.SelectedValue;
                DataTableDr["SortNum"] = DDLNext.SelectedValue;
                DataTableDr["ItemKind"] = DDLKind.SelectedValue;
                DataTableDr["ItemName"] = ItemName;
                DataTableDr["PriceID"] = LbPriceID.Text;

                //DataTableDr["Notes"] = Notes;

                SortNum = int.Parse(DDLNext.SelectedValue);
                DataTableBox.Rows.Add(DataTableDr);
            #endregion
                string SQLSelect="Select * from Bid_WBS where UID="+UID+" and bid="+Session["Bid"].ToString();
                string OriSort = WebModel.SItemName(database, SQLSelect, "SortNum");
                if (int.Parse(OriSort) < int.Parse(DDLNext.SelectedValue))
                {
                    int d = int.Parse(DDLNext.SelectedValue) - int.Parse(OriSort);
                    SQLUpdateSort = "update Bid_WBS set sortnum=" + DDLNext.SelectedValue + " where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum =" + OriSort + " and bid="+Session["Bid"].ToString();
                    result = WebModel.SQLAction(database, SQLUpdateSort);

                    if (int.Parse(OriSort) >=1)
                   {
                       SQLUpdateSort = "update Bid_WBS set sortnum= (SortNum -1) where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum BETWEEN " + (int.Parse(OriSort) + 1).ToString() + " and " + (int.Parse(DDLNext.SelectedValue)).ToString() + " and bid=" + Session["bid"].ToString() + " and sortnum<>1";
                    result = WebModel.SQLAction(database, SQLUpdateSort);
                   }
                    //SQLUpdateSort = "update Bid_WBS set sortnum=(SortNum - 1) where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum >" + (int.Parse(DDLNext.SelectedValue)).ToString() + "";
                    // result = WebModel.SQLAction(database, SQLUpdateSort);

                }
                else
                {
                    SQLUpdateSort = "update Bid_WBS set sortnum=SortNum+1 where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum >=" + DDLNext.SelectedValue + " and bid="+Session["Bid"].ToString();
                     result = WebModel.SQLAction(database, SQLUpdateSort);

                }
             
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            string ErrorString = "";

            ErrorString += (DDLLayer.SelectedValue) == "0" ? "請輸入階層!!\\n" : "";
            ErrorString += (DDLKind.SelectedValue) == "0" ? "請輸入工項類型!!\\n" : "";
            //ErrorString += (DDLDtUpper.SelectedValue) == "0" ? "請輸入上層工項!!\\n" : "";
            ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
            //ErrorString += (RadioButtonList2.SelectedIndex == -1) ? "請選擇項次編號方式!!\\n" : "";


            //確認是否全選
            if (ErrorString == "")
            {
                string database = Session["DatabaseName"].ToString();
                string datatable = "Bid_WBS";
                string UpdateItemOrder = "";
                if(UID !="")
                {
                    bool result = WebModel.EditAction(database, "Bid_WBS", UID, GetDataBox1());
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已修改完畢');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 修改失敗');", true);
                    }
                }
                else
                {
                WebModel.SaveAction(database, datatable, GetDataBox());
                }
                string select = "Select * from BidM0 where bid=" + Session["bid"].ToString() ;
                string BidNumType = WebModel.SItemName(database, select, "BidNumType");
             
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
                    bool result = WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                }


                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已儲存完畢');", true);

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼

                //TxItemName.Text = "";
                //DDLLayer.SelectedValue = "1";
                //DDLDtUpper.SelectedValue = "1";
                //DDLNext.SelectedValue = "1";
                //DDLKind.SelectedValue = "0";
                //TxNotes.Text = "";


                //DDL_BidSelect.DataSourceID = "SqlDataSource2";
                //DDL_BidSelect.DataBind();
                //DDL_BidSelect_SelectedIndexChanged(this, null);
                //DDL_BidSelect.SelectedValue = Session["Bid"].ToString();
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }
        protected void DDLTop_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            string database = Session["DatabaseName"].ToString();
            string MAXSortNum = "";
            int Num;
            string MaxUID;
            string MaxID;
            string SQLUPPER = "Select  MAX(SortNum) as SortNum  from Bid_WBS where UpperUID=" + DDLDtUpper.SelectedValue + "";
            string MaxId = "Select  MAX(SortNum) as id  from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
            string MaxUId = "Select  MAX(UID) as uid  from Bid_WBS";
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, MaxId);
            if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox1.Rows)
                {

                    MaxID = row["id"].ToString();

                }
            }
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLUPPER);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    MAXSortNum = (row["SortNum"].ToString() == "") ? "0" : row["SortNum"].ToString();

                }
            }
            DataTable DataTableBox2 = WebModel.LoadSetContentData(database, MaxUId);
            if (DataTableBox2 != null && DataTableBox2.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox2.Rows)
                {

                    MaxUID = row["uid"].ToString();

                }
            }
            if (MAXSortNum!="")
           {
            Num = int.Parse(MAXSortNum);
            //int MaxUID1 = int.Parse(MaxUID) + 1;
            for (int i = 0; i < Num; i++)
            {

                DDLNext.Items.Insert(i, (i+1).ToString());
            }
           }
        }
        protected void callback_Click(object sender, EventArgs e)
        {
            //Response.Redirect("BidItemEdit.aspx");
        }

        protected void DDLKind_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLKind.SelectedValue != "workitem")
            {
                Button17.Enabled = false;
            }
            else
            {
                Button17.Enabled = true;
            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            Response.Redirect("BidItemEdit.aspx?uid=" + SystemSet.GetRequestSet("UId"));
        }
    }
}