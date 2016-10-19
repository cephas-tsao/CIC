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
    public partial class BidItemAdd : System.Web.UI.Page
    {
        string SQLString = "BID,LayerNum,UpperUID,SortNum,Unit,ItemName,ItemKind,Notes,PriceID";
        protected string LbLayerNum;
        protected int SortNum;
        string SQLUpdateSort;
        string PriceID;
        string ItermName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');self.close();</script>");
           

            }
            if (!IsPostBack)
            {

                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataBind();
                ListItem LI2 = new ListItem();
                LI2.Text = "-請選擇-";
                LI2.Value = "0";
                DDL_Unit.Items.Insert(0, LI2);
                Button17.Enabled = false;
                LoadContent();
                Session["DDLLayer"] = null;
                Session["DDLDtUpper"] = null;
                Session["DDLNext"] = null;
                Session["DDLKind"] = null;
                Session["TxItemName"] = null;
                Session["DDL_Unit"] = null;
                Session["PriceID"] = null;
                Session["ResourceLinkPriceID"] = null;
                ItemName.Text = "";
            }

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (Session["ResourceLinkPriceID"] != null && Session["ResourceLinkPriceID"] != "")
            {

                string PriceIDArray = Session["ResourceLinkPriceID"].ToString();

                PriceID = PriceIDArray.Split('ξ')[0];
                Session["thisID"] = PriceID;
                ItemName.Text = PriceIDArray.Split('ξ')[1];
                if (Session["DDLLayer"] != null && Session["DDLLayer"].ToString() !="")
                {
                    DDLLayer.SelectedValue = Session["DDLLayer"].ToString();
                }
                if (Session["DDLDtUpper"] != null && Session["DDLDtUpper"] !="")
               {
                   DDLDtUpper.SelectedValue = Session["DDLDtUpper"].ToString();
               }
                if (Session["DDLNext"] != null)
               {
                   DDLNext.SelectedValue = Session["DDLNext"].ToString();
               }
                if (Session["DDLKind"] !=null && Session["DDLKind"] !="")
              {
                  DDLKind.SelectedValue = Session["DDLKind"].ToString();
              }
                if (Session["TxItemName"] != null && Session["TxItemName"] !="")
               {
                   TxItemName.Text = Session["TxItemName"].ToString();
               }
                if (Session["DDL_Unit"] != null && Session["DDL_Unit"] !="")
                {
                    DDL_Unit.SelectedValue = Session["DDL_Unit"].ToString();
                }             
              
                LoadContent();
                Session["DDLLayer"] = null;
                Session["DDLDtUpper"] = null;
                Session["DDLNext"] = null;
                Session["DDLKind"] = null;
                Session["TxItemName"] = null;
                Session["DDL_Unit"] = null;
                Session["PriceID"] = null;
            }
        }
        protected void Button17_Click(object sender, EventArgs e)
        {
            Session["DDLLayer"] = DDLLayer.SelectedValue;
            Session["DDLDtUpper"] = DDLDtUpper.SelectedValue;
            Session["DDLNext"] = DDLNext.SelectedValue;
            Session["DDLKind"] = DDLKind.SelectedValue;
            Session["TxItemName"] = TxItemName.Text;
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
            string SQLStringNum = "Select  MAX(LayerNum) as id  from Bid_WBSLayer where BID=" + Session["BID"] + "";
            string SQLString1 = "";
            if (Session["thisID"] != null)
            {
                SQLString1 = "Select  *  from  Bid_Library  where PriceID=" + Session["thisID"].ToString() + "";
            }
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringNum);
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);

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
                if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox1.Rows)
                    {

                        ItemName.Text = row["ItemName"].ToString();

                    }

                }
            }
            ViewState["addLayer"] = true;
            if (Session["EItemName"] != null)
                TxItemName.Text = Session["EItemName"].ToString();

        }
        //protected void DropDownList29_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //if ((DropDownList29.SelectedValue == "workitem"))
        //    //{ Button1.Enabled = true; }
        //    //else
        //    //{ Button1.Enabled = false; }
        //}
        protected void DDLLayer_SelectedIndexChanged(object sender, EventArgs e)
        {

            DDLDtUpper.Items.Clear();
            DDLNext.Items.Clear();
            string database = Session["DatabaseName"].ToString();
            DDLDtUpper.DataSourceID = "SqlDataSource1";
            //for (int i=0; i<= int.Parse(ViewState["i"].ToString()); i++)
            //{
            //DDLLayer.SelectedValue = i.ToString();
            if (Session["bid"] != null && Session["bid"].ToString() != "")
            {
                int layer = int.Parse(DDLLayer.SelectedValue);

                //layer = layer >= 0 ? layer - 1 : 0;
                //}
                if (layer == 1)
                {
                    string MaxLayer = "Select  count(SortNum) as SortNum from [NTUST].[dbo].[Bid_WBS] where BID="+ Session["BID"] +"and  LayerNum=1 ";
                    string NextNum = WebModel.SItemName(database, MaxLayer, "SortNum");
                    SqlDataSource1.SelectCommand = "";
                    DDLDtUpper.Enabled = false;
                    for (int i = 1; i <= int.Parse(NextNum)+1; i++)
                    {
                        DDLNext.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    }
                    //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('無上層工項');", true);

                }

                else
                {

                    DDLDtUpper.Enabled = true;
                    SqlDataSource1.SelectCommand = "Select * from Bid_WBS where LayerNum =" + (layer-1) + " and  ItemName is not null and Bid=" + Session["Bid"].ToString() + "";
                    DDLDtUpper.DataTextField = "ItemName";
                    DDLDtUpper.DataValueField = "UID";
                    DDLDtUpper.AutoPostBack = true;
                    DDLDtUpper.DataBind();
                    //ListItem LI1 = new ListItem();
                    //LI1.Text = "--";
                    //LI1.Value = "0";
                    //DDLTop.Items.Insert(0, LI1);
                }
                ListItem LI2 = new ListItem();
                LI2.Text = "-請選擇-";
                LI2.Value = "0";
                DDLNext.Items.Insert(0, LI2);
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
                DataTableDr["SortNum"] = int.Parse(DDLNext.SelectedValue) !=0?int.Parse(DDLNext.SelectedValue):1;
                DataTableDr["ItemKind"] = DDLKind.SelectedValue;
                DataTableDr["ItemName"] = ItemName;
                DataTableDr["Unit"] = DDL_Unit.SelectedValue;
                DataTableDr["PriceID"] = PriceID;

                SortNum = int.Parse(DDLNext.SelectedValue);
                DataTableBox.Rows.Add(DataTableDr);
            #endregion

                SQLUpdateSort = "update Bid_WBS set sortnum=SortNum+1 where LayerNum=" + DDLLayer.SelectedValue + " and UpperUID=" + DDLDtUpper.SelectedValue + " and SortNum >=" + DDLNext.SelectedValue + " and Bid="+Session["Bid"].ToString();
               bool result= WebModel.SQLAction(database, SQLUpdateSort);
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
            ErrorString += (DDLNext.SelectedValue) == "0" ? "請輸入項次!!\\n" : "";
            ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
            //ErrorString += (RadioButtonList2.SelectedIndex == -1) ? "請選擇項次編號方式!!\\n" : "";

            if (DDLKind.SelectedValue == "workitem")
            {
                ErrorString += (DDL_Unit.SelectedValue) == "0" ? "請輸入單位!!\\n" : "";
            }
            //確認是否全選
            if (ErrorString == "")
            {
                string database = Session["DatabaseName"].ToString();
                string datatable = "Bid_WBS";
                string select = "Select * from BidM0 where bid=" + Session["bid"].ToString();
                string BidNumType = WebModel.SItemName(database, select, "BidNumType");
                if (BidNumType != "")
                {
                  
                    string UpdateItemOrder = "";
                    string result4 = WebModel.SaveAction(database, datatable, GetDataBox());
               
                  
                    if (BidNumType == "0")
                    {
                        bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                        UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";

                        bool result = WebModel.SQLAction(database, UpdateItemOrder);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已儲存完畢');", true);

                    }
                    else if (BidNumType == "1")
                    {
                        bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                        UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                        bool result = WebModel.SQLAction(database, UpdateItemOrder);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已儲存完畢');", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先設定階層');", true);
                }



                TxItemName.Text = "";
                //DDLLayer.SelectedValue = "0";
                //DDLDtUpper.SelectedValue = "0";
                //DDLNext.SelectedValue = "0";
              
               

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
            Session["Itemadd"] = Session["bid"].ToString();
          
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");

        }
        protected void DDLTop_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLNext.Items.Clear();
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

            Num = int.Parse(MAXSortNum) + 1;           
         
            for (int i = 0; i < Num; i++)
            {
               
                DDLNext.Items.Insert(i, (i + 1).ToString());
            }

            ListItem LI2 = new ListItem();
            LI2.Text = "-請選擇-";
            LI2.Value = "0";
            DDLNext.Items.Insert(0, LI2);
            DDL_Unit.Items.Insert(0, LI2);
        }
        protected void callback_Click(object sender, EventArgs e)
        {
            //Response.Redirect("BidBudgetEdit.aspx");
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            DDLLayer.SelectedValue = "0";
            DDLDtUpper.SelectedValue = "0";
            DDLNext.SelectedValue = "0";
            DDLKind.SelectedValue = "0";
            TxItemName.Text = "";
            ItemName.Text = "";
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
    }
}