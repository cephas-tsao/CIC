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
    public partial class AddNewEItem : System.Web.UI.Page
    {
        protected int SortNum;
         protected string LbLayerNum;
         string SQLString = "PID,LayerNum,UpperWID,SortNum,ItemKind,ItemName,Unit,PriceID,Notes,NewItem,ResourceNY";
        string SQLUpdateSort;
         string ErrorString = "";
         string PriceID ;
         string ItermName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
               
                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataBind();
                LoadContent();
                Session["PriceID"] = null;
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (Session["PriceID"] !=null)
            {

                string  PriceIDArray = Session["PriceID"].ToString();
               // var vals = valueStr.Split(',')[0];
                PriceID = PriceIDArray.Split(',')[0];
                 Session["thisID"] = PriceID;
                ItermName = PriceIDArray.Split(',')[1];
                LoadContent();
            }
        }
        protected void LoadContent()
        {
             string database = Session["DatabaseName"].ToString();
             string SQLStringNum = "Select  MAX(LayerNum) as id  from EBudget_WBS where PID=" + Session["ProjectCode"] + "";
             string SQLString1 = "";
             if (Session["thisID"] !=null)
            {
             SQLString1 = "Select  *  from  Pro_Resource  where PriceID=" + Session["thisID"].ToString() + "";
            }  
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringNum);   
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);

                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbLayerNum = row["id"].ToString();

                    }
                    if (ViewState["addLayer"] == null )
                    {
                        LbLayerNum = LbLayerNum != "" ? LbLayerNum : "1";
                    for (int i = 1; i <= int.Parse(LbLayerNum)+1; i++)
                    {
                        DDLLayer.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    }
                    }
                    //if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                    //{
                    //    foreach (DataRow row in DataTableBox1.Rows)
                    //    {

                    //        ItemName.Text = row["ItemName"].ToString();

                    //    }

                    //}
                }
            ViewState["addLayer"]=true;
            if (Session["EItemName"] != null)
                TxItemName.Text = Session["EItemName"].ToString();
            //if (Session["DDLLayer"] != null)
            //    DDLLayer.SelectedValue = Session["DDLLayer"].ToString();
            //if (Session["DDLTop"] != null)
            //    DDLTop.SelectedValue = Session["DDLTop"].ToString();
        }
        //protected void Button17_Click(object sender, EventArgs e)
        //{
        //    OpenNewWindow("BWBS_ResourceLink.aspx", Button17.ID);
        //}
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void DDLLayer_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLTop.Items.Clear();
            //DDLNext.Items.Clear();
            DDLTop.DataSourceID = "SqlDataSource1";
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] != null && Session["ProjectCode"].ToString() != "")
            {
                int layer = int.Parse(DDLLayer.SelectedValue)-1 ;

                //}
                if (layer == 0)
                {
                    SqlDataSource1.SelectCommand = "";
                    //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('無上層工項');", true);
                    string SQLselect = "Select max(SortNum) as SortNum from EBudget_WBS where LayerNum =1 and pid=" + Session["ProjectCode"].ToString() + " ";
                    string MaxSortNum = WebModel.SItemName(database, SQLselect, "SortNum")!=""?WebModel.SItemName(database, SQLselect, "SortNum"):"0";
                    LbNext.Text = (int.Parse(MaxSortNum) + int.Parse("1")).ToString();
                }
              
                else
                {


                    SqlDataSource1.SelectCommand = "Select * from EBudget_WBS where LayerNum =" + layer + " and  ItemName is not null and Pid=" + Session["ProjectCode"].ToString() + " ";
                    DDLTop.DataTextField = "ItemName";
                    DDLTop.DataValueField = "EWID";
                    DDLTop.AutoPostBack = true;
                    DDLTop.DataBind();
                   
                }
                ListItem LI2 = new ListItem();
                LI2.Text = "--";
                LI2.Value = "0";

                DDLTop.Items.Insert(0, LI2);
                //DDLTop.Items.Insert(1, "1");
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇標案');", true);
            }
        }

        protected void DDLTop_SelectedIndexChanged(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            string MAXSortNum = "";
            int Num;
            string MaxUID="";
            string MaxID;
            string SQLUPPER = "Select  MAX(SortNum) as SortNum  from EBudget_WBS where UpperWID=" + DDLTop.SelectedValue + " and PID="+Session["ProjectCode"].ToString();
            string MaxId = "Select  MAX(SortNum) as id  from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + " and UpperWID="+ DDLTop.SelectedValue + "";
            string MaxUId = "Select  MAX(EWID) as wid  from EBudget_WBS";
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

                    MaxUID = row["wid"].ToString();

                }
            }

            Num = int.Parse(MAXSortNum) + 1;
            LbNext.Text = (Num).ToString();
            
            //for (int i = 0; i < Num; i++)
            //{

            //    DDLNext.Items.Insert(i, (i + 1).ToString());
            //}

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

            string TopWBS = DDLTop.SelectedValue;
            //string Next = DDLNext.SelectedValue;
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                LbNext.Text = LbNext.Text != "" ? LbNext.Text : "1";
                DataTableDr["pid"] = Session["ProjectCode"].ToString();

                DataTableDr["LayerNum"] = DDLLayer.SelectedValue;
                DataTableDr["UpperWID"] = DDLTop.SelectedValue;
                DataTableDr["SortNum"] = LbNext.Text;
                DataTableDr["ItemKind"] = DDLKind.SelectedValue;
                DataTableDr["ItemName"] = ItemName;
                Session["thisID"] = Session["thisID"] != null ? Session["thisID"].ToString() : "";
                DataTableDr["PriceID"] = Session["thisID"].ToString() !=""?Session["thisID"].ToString():"";
                DataTableDr["Unit"] = DDL_Unit.SelectedValue;                
                DataTableDr["Notes"] = Notes;
                DataTableDr["NewItem"] = "1";
                DataTableDr["ResourceNY"] = "1";
                
                //SortNum = int.Parse(DDLNext.SelectedValue);
                DataTableBox.Rows.Add(DataTableDr);
            #endregion
                
                SQLUpdateSort = "update EBudget_WBS set sortnum=SortNum+1 where LayerNum=" + DDLLayer.SelectedValue + " and UpperWID=" + DDLTop.SelectedValue + " and SortNum >=" + LbNext.Text + "";
                WebModel.SQLAction(database, SQLUpdateSort);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            string UpdateItemOrder = "";
            string database = Session["DatabaseName"].ToString();
            string datatable = "EBudget_WBS";
            ErrorString += (DDLLayer.SelectedValue) == "0" ? "請輸入階層!!\\n" : "";
            ErrorString += (DDLKind.SelectedValue) == "0" ? "請輸入工項類型!!\\n" : "";
            //ErrorString += (DDLTop.SelectedValue) == "0" ? "請輸入上層工項!!\\n" : "";
            ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
          

            //確認是否全選
                if (ErrorString == "")
                {
                   
                    string select = "Select * from ProjectM0 where pid=" + Session["ProjectCode"].ToString();
                    string BidNumType = WebModel.SItemName(database, select, "CBudgetNumType");
                    //if (BidNumType != "")
                    //{
                        string result1 = WebModel.SaveAction(database, datatable, GetDataBox());
                        //LayerCodeSort.Sort_LayerCode(database, Session["ProjectCode"].ToString());
                        bool result = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                        
                        //if (BidNumType == "0")
                        //{
                            bool result2 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                            UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=0";
                            WebModel.SQLAction(database, UpdateItemOrder);
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                        //}
                        //else if (BidNumType == "1")
                        //{
                        //    bool result2 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                        //    //UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["ProjectCode"].ToString() + "";
                        //    //bool result4 = WebModel.SQLAction(database, UpdateItemOrder);
                        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                        //}
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已新增連結');", true);
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);
                    //}
                    //else
                    //{

                    //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先至合約預算建置編修，設定階層及編號!!!');", true);
                    //}
                    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_LinkButton1').click();</script>");
                    TxItemName.Text = "";
                    DDLLayer.SelectedValue = "0";
                    DDLTop.SelectedValue = "0";

                    DDLKind.SelectedValue = "0";
                    TxNotes.Text = "";
                    //ItemName.Text = "";
                }
                else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }           
                     
        }

        protected void callback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewEItem.aspx");
        }

        protected void TxItemName_TextChanged(object sender, EventArgs e)
        {
            Session["EItemName"] = TxItemName.Text;
            //Session["DDLLayer"] = DDLLayer.SelectedValue;
            //Session["DDLTop"] = DDLTop.SelectedValue;
        }
    }
}