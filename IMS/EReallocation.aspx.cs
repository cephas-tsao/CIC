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
    public partial class EReallocation : System.Web.UI.Page
    {
        protected string CWID = "";
        string ErrorString = "";       
        string priceid = "";
        string ExecuteKind = "";       
        string SQLStringEBg = "Select  *  from EBudget_WBS where EWID=" + SystemSet.GetRequestSet("CWid") + "";
        string SQLStringCBg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CWID = SystemSet.GetRequestSet("CWid");
            string database = Session["DatabaseName"].ToString();
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                SqlDataSource1.SelectCommand = Sql;
                Session["DataTable"] = null;
                if (CWID != "")
                {
                    string CWID1 = WebModel.SItemName(database, SQLStringEBg, "CWID");
                    SQLStringCBg = "Select  *  from CBudget_WBS where CWID=" + CWID1 + "";
                    priceid = WebModel.SItemName(database, SQLStringCBg, "PriceID");
                    if (priceid!="")
                    {
                        //SqlDataSource1.SelectCommand = "Select * From Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID Where a.ParentID=" + priceid + "";
                        SqlDataSource1.SelectCommand = "Select * From PrivateResource ";
                    }
                }
                string SQLselect = "Select [PID],[LayerCode],[LayerNum],[UpperWID],[SortNum],[ItemOrder],[PriceID],[ItemName],[Unit],[ItemKind],[ENumber],[LastENumber],[EUnitPrice],[Notes],[ExecuteKind],[EEdition],[order_Num],[ResourceCode] from EBudget_WBS where pid=" + Session["ProjectCode"].ToString() + " and UpperWID=" + CWID;
                DataTable dt = WebModel.LoadSetContentData(database, SQLselect);
                Session["DataTable"] = dt;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                //SqlDataSource1.SelectCommand = "Select * From PrivateResource ";
             
            }
            LoadContent();
            if (Session["DataTable"] != null)
            {
                Repeater1.DataSource = (DataTable)Session["DataTable"];

            }
            SqlDataSource1.SelectCommand = Sql;
            SqlDataSource2.SelectCommand = Sql1;
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringEBg);          

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {
                    priceid = row["PriceID"].ToString();
                    Session["PRICEID"] = priceid;
                    LbItemOrder.Text = row["ItemOrder"].ToString();
                    LbUPItemName.Text = row["ItemName"].ToString();
                    LbUPUnit.Text = row["Unit"].ToString();
                    LbUPENumber.Text = row["ENumber"].ToString();
                    ExecuteKind = row["ExecuteKind"].ToString();
                    LbPrice.Text = row["EUnitPrice"].ToString();
                }
              
            }
        }
        protected void Radio_Ref_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((Radio_Ref.SelectedValue == "Private"))
            {
                Pnl_Execute.Visible = false;
                Pnl_Private.Visible = true;
                SqlDataSource1.SelectCommand = "Select * From PrivateResource ";
            }
            else if ((Radio_Ref.SelectedValue == "Execute"))
            {
                Pnl_Execute.Visible = true;
                Pnl_Private.Visible = false;
            }
        }
        protected void ImgAdd_Click(object sender, ImageClickEventArgs e)
        {
            Repeater1.DataSource = GetDataBox(0);
            Repeater1.DataSource = Session["DataTable"];
            Repeater1.DataBind();
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
          
          
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
            
                string CWID1 = WebModel.SItemName(database, SQLStringCBg, "CWID");
                SQLStringCBg = "Select  *  from CBudget_WBS where CWID=" + CWID1 + "";
                priceid = WebModel.SItemName(database, SQLStringCBg, "PriceID");

                //Label LbWorkRate = (Label)e.Item.FindControl("LbWorkRate");
              
               
               
                //string WorkRate = vsDr["WorkRate"].ToString();
                //string AnaNumber = vsDr["AnaNumber"].ToString();

                //LbWorkRate.Text = AnaNumber != "" && WorkRate !=""? (decimal.Parse(WorkRate) / decimal.Parse(AnaNumber)).ToString() : "0";



            }
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.Item.ItemIndex);
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                ImageButton ImgUP = (ImageButton)e.Item.FindControl("ImgUP");
                ImageButton ImgDown = (ImageButton)e.Item.FindControl("ImgDown");
                if (ID_class == 0)
                {
                    ImgUP.Visible = false;
                    ImgDown.Visible = true;
                }
                if (e.Item.ItemIndex != 0 && e.Item.ItemIndex != Repeater1.Items.Count - 1)
                {
                    ImgUP.Visible = true;
                    ImgDown.Visible = true;
                }
                if (e.Item.ItemIndex == Repeater1.Items.Count-1)
                {
                    ImgUP.Visible = true;
                    ImgDown.Visible = false;
                }   
            }
        }
        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                DataTable DataTableBox = GetDataBox(1);

                //string ItemKind = ((Label)e.Item.FindControl("LbItemKind")).Text;
                string ItemName = ((Label)e.Item.FindControl("LbItemName")).Text;
                string Unit = ((Label)e.Item.FindControl("LbUnit")).Text;
                //string WorkRate = ((Label)e.Item.FindControl("LbWorkRate")).Text;

                DataRow DataTableDr = DataTableBox.NewRow();
                //DataTableDr["PID"] = Session["ProjectCode"].ToString();
                //DataTableDr["ItemKind"] = ItemKind;                
                //DataTableDr["ItemName"] = ItemName;
                DataTableDr["ItemName"] = ItemName;
                DataTableDr["Unit"] = Unit;             
                //DataTableDr["WorkRate"] = WorkRate;
                //DataTableDr["ENumber"] = 0;
                //DataTableDr["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;

                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;
          
                Repeater1.DataSource = DataTableBox;

                Repeater1.DataBind();
            }
        }
        //新增空白資料
        protected DataTable GetDataBox(int status)
        {

            string SQLString = "pid,ItemKind,ItemName,Unit,WorkRate,ENumber,UpperWID,SortNum,ExecuteKind,ResourceNY";
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
          

            if (status == 0)
            {
                
                DataRow DataTableDr = DataTableBox.NewRow();

                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                //DataTableDr["ItemKind"] = "";
                DataTableDr["ItemName"] = LbUPItemName.Text;
                DataTableDr["Unit"] = LbUPUnit.Text;
                DataTableDr["ENumber"] = 0;
                DataTableDr["EEdition"] = LbVersion.Text !=""?int.Parse(LbVersion.Text):0;
                //DataTableDr["WorkRate"] = "";
                
                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;
            }
            #endregion

            return DataTableBox;
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];
              
                DataTableBox.Rows.RemoveAt(ID_class);
               
                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();


            }
            if (e.CommandName == "Up")
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];
              
                DataRow newRow = DataTableBox.NewRow();

              
                DataRow rows = DataTableBox.Rows[ID_class];
                newRow.ItemArray = rows.ItemArray;
                DataTableBox.Rows.RemoveAt(ID_class);

                DataTableBox.Rows.InsertAt(newRow, ID_class - 1);               

                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();
            }
            if (e.CommandName == "Down")
            {
                DataTable DataTableBox = (DataTable)Session["DataTable"];

                DataRow newRow = DataTableBox.NewRow();


                DataRow rows = DataTableBox.Rows[ID_class];
                newRow.ItemArray = rows.ItemArray;
                DataTableBox.Rows.RemoveAt(ID_class);

                DataTableBox.Rows.InsertAt(newRow, ID_class + 1);

                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();
            }
        }
        protected DataTable GetDataBox1()
        {

            string SQLString = "pid,ItemKind,ItemName,Unit,WorkRate,ENumber,EUnitPrice,UpperWID,SortNum,LayerNum,ExecuteKind,ResourceNY,ResourceCode";
            DataTable DataTableBox = new DataTable();



            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
                    


            return DataTableBox;
        }
        protected DataTable GetDataBox2()
        {

            string SQLString = "Pid,PriceID,ItemName,Unit,ENumber,EEdition,ResourceCode";
            DataTable DataTableBox = new DataTable();



            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }



            return DataTableBox;
        }
        protected void BtnDivide_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ExecuteKind = "";
            string ResourceNY = "";
            string LayerNum = "";
            string UpperWID = "";
            int count = 1;
            string SQLSelect = "";
            decimal EUnitPrice = 0;
            if (CWID!="")
            {
            string SQLDel = "Delete EBudget_WBS where UpperWID=" + CWID;
            bool result = WebModel.SQLAction(database, SQLDel);
            SQLSelect = "Select * from EBudget_WBS where EWID=" + CWID;
            ExecuteKind = WebModel.SItemName(database, SQLSelect, "ExecuteKind");
            ExecuteKind = WebModel.SItemName(database, SQLSelect, "ExecuteKind");
            ResourceNY = WebModel.SItemName(database, SQLSelect, "ResourceNY");
            LayerNum = WebModel.SItemName(database, SQLSelect, "LayerNum");
            UpperWID = WebModel.SItemName(database, SQLSelect, "UpperWID");
            EUnitPrice=WebModel.SItemName(database,SQLSelect,"EUnitPrice") !=""?decimal.Parse(WebModel.SItemName(database,SQLSelect,"EUnitPrice")):0;
            }
            //拆工料全部清空時
            if (Repeater1.Items.Count == 0)
            {
                string SQLDel = "Delete EBudget_WBS  where UpperWID=" + CWID;
                bool result = WebModel.SQLAction(database, SQLDel);
                string UpperWid = WebModel.SItemName(database, SQLSelect, "UpperWID");
                string SQLSearch = "Select * from EBudget_WBS where UpperWID=" + UpperWid + " and ExecuteKind=NKRP";
                string UPExecuteKind = WebModel.SItemName(database, SQLSearch, "ExecuteKind");//上層wid的ExecuteKind
                if (UPExecuteKind != "")
                {

                    string SQLUpdate = "Update EBudget_WBS set ResourceNY=0 where EWID=" + CWID;
                    bool result1 = WebModel.SQLAction(database, SQLUpdate);

                }
                else
                {
                    string SQLUpdate = "Update EBudget_WBS set ResourceNY=1 where EWID=" + CWID;
                    bool result1 = WebModel.SQLAction(database, SQLUpdate);

                }
                if (ExecuteKind == "NKRP")
                {
                    string SQLUpdate = "Update EBudget_WBS set ExecuteKind=NK,ResourceNY=0 where EWID=" + CWID;
                    bool result1 = WebModel.SQLAction(database, SQLUpdate);

                }
                else if (ExecuteKind == "RP")
                {
                    string SQLUpdate = "Update EBudget_WBS set ExecuteKind=NULL,ResourceNY=0 where EWID=" + CWID;
                    bool result1 = WebModel.SQLAction(database, SQLUpdate);

                }

            }
            //有拆工料時
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        TextBox TxItemName = (TextBox)item.FindControl("TxItemName");
                        DropDownList DDLUnit = (DropDownList)item.FindControl("DDLUnit");
                        TextBox TxQuantity = (TextBox)item.FindControl("TxQuantity");
                        Label LbResourceCode = (Label)item.FindControl("LbResourceCode");


                        ErrorString += (TxQuantity.Text) == string.Empty ? "請輸入工項類型!!\\n" : "";
                     
                        ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
          

                    //確認是否全選
                    if (ErrorString == "")
                    {
                        DataTable DataTableBox1 = GetDataBox1();
                        DataRow DataTableDr = DataTableBox1.NewRow();
                        int maxid = WebModel.MaxID(database, "EBudget_WBS");
                        DataTableDr["pid"] = Session["ProjectCode"].ToString();
                        DataTableDr["ItemKind"] = "workitem";
                        DataTableDr["ItemName"] = TxItemName.Text;
                        DataTableDr["Unit"] = DDLUnit.SelectedValue;
                        DataTableDr["ENumber"] =decimal.Parse(TxQuantity.Text);
                        DataTableDr["EUnitPrice"] = EUnitPrice;
                        DataTableDr["WorkRate"] = "";
                        DataTableDr["UpperWID"] = CWID;
                        DataTableDr["SortNum"] = count;
                        DataTableDr["LayerNum"] = int.Parse(LayerNum) + 1;
                        if (LbResourceCode.Text != "")
                        {
                            DataTableDr["ResourceCode"] = LbResourceCode.Text;
                        }
                        else
                        {
                            DataTableDr["ResourceCode"] = Session["ProjectCode"].ToString() + "_" + maxid + "";
                        }

                        count++;

                        DataTableBox1.Columns.Remove("WorkRate");


                        //使用ResourceNY判斷
                        //if (ResourceNY == "0" && ExecuteKind == "")
                        if (ExecuteKind == "")
                        {
                            DataTableDr["ExecuteKind"] = "RK";
                            DataTableDr["ResourceNY"] = 1;

                            DataTableBox1.Rows.Add(DataTableDr);
                            string result = WebModel.SaveAction(database, "EBudget_WBS", DataTableBox1);
                            string SQLUpdate = "Update EBudget_WBS set ExecuteKind='RP',ResourceNY=0 where  EWID=" + CWID;
                            bool result1 = WebModel.SQLAction(database, SQLUpdate);

                        }
                     
                        //else if (ResourceNY == "1")
                        //{
                            //if (ExecuteKind == "" || ExecuteKind == "RP")
                            //{
                            //    DataTableDr["ExecuteKind"] = "RK";
                            //    DataTableDr["ResourceNY"] = 1;

                            //    DataTableBox1.Rows.Add(DataTableDr);
                            //    string result = WebModel.SaveAction(database, "EBudget_WBS", DataTableBox1);
                            //    string SQLUpdate = "Update EBudget_WBS set ExecuteKind='RP', ResourceNY=0 where  EWID=" + CWID;
                            //    bool result1 = WebModel.SQLAction(database, SQLUpdate);
                            //}
                        //else if (ExecuteKind == "NK" || ExecuteKind == "NKRP")
                        else if (ExecuteKind == "NK" || ExecuteKind == "NK2" || ExecuteKind == "NKRP")
                            {
                                DataTableDr["ExecuteKind"] = "RK";
                                DataTableDr["ResourceNY"] = 1;

                                DataTableBox1.Rows.Add(DataTableDr);
                                string result = WebModel.SaveAction(database, "EBudget_WBS", DataTableBox1);
                                string SQLUpdate = "Update EBudget_WBS set ExecuteKind='NKRP',ResourceNY=0 where EWID=" + CWID;//父項update_ExecuteKind
                                string SQLGUpperID = "Update EBudget_WBS set ExecuteKind='NPRGP',ResourceNY=0 where EWID=" + UpperWID;//祖父項update_ExecuteKind
                                string SQLOtherItem = "Update EBudget_WBS set ExecuteKind='Nk2',ResourceNY=1 where UpperWID=" + UpperWID + " and  EWID <>" + CWID;//相同upperwid子項要能填列單價
                                bool result1 = WebModel.SQLAction(database, SQLUpdate);
                                bool result2 = WebModel.SQLAction(database, SQLGUpperID);
                                bool result5 = WebModel.SQLAction(database, SQLOtherItem);
                            }
                        //}
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
                    }
                }
               
            }
                string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
                string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
                string UpdateItemOrder;
                //if (CBudgetNumType == "0")
                //{
                    bool result3 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                    UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=0";
                   bool result4= WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                //}
                //else if (CBudgetNumType == "1")
                //{
                //    bool result2 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());

                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                //}
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null )
                {

                   return "SELECT [PriceID], [ItemName], [Unit] FROM [PrivateResource] " ;
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

                    return "SELECT DISTINCT [ResourceCode],[Pid],[EWID],[PriceID], [ItemName], [Unit],[ItemKind] FROM [EBudget_WBS] where ItemKind <>'mainitem'  and Pid=" + Session["ProjectCode"].ToString() + "";

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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            DataTable DataTableBox = (DataTable)Session["DataTable"];
            if (DataTableBox.Rows.Count == 0)
             {

                 DataTableBox = GetDataBox2();
             }
             else
             {
                 DataTableBox = (DataTable)Session["DataTable"];
             }
           
          
            DataRow DataTableDr ;
            if (e.CommandName == "Select")
            {
               
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");              
                Label Unit = (Label)GridView1.Rows[ID_class].FindControl("Unit");

            
                DataTableDr = DataTableBox.NewRow();

                DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                DataTableDr["ItemName"] = ItemName.Text;
                DataTableDr["Unit"] = Unit.Text;
                DataTableDr["PriceID"] = PriceID.Text;
                DataTableDr["ENumber"] = 0;
                DataTableDr["EEdition"] = LbVersion.Text != "" ? LbVersion.Text : "0";
              

                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;

                Repeater1.DataSource = DataTableBox;

                Repeater1.DataBind();

            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView2.PageSize;
            //DataTable DataTableBox = GetDataBox2();
            DataTable DataTableBox = (DataTable)Session["DataTable"];
            if (DataTableBox.Rows.Count == 0)
            {

                DataTableBox = GetDataBox2();
            }
            else
            {
                DataTableBox = (DataTable)Session["DataTable"];
            }
            DataRow DataTableDr;
            if (e.CommandName == "Select")
            {

                int UID = (int)GridView2.DataKeys[ID_class].Value;
                Label EWID = (Label)GridView2.Rows[ID_class].FindControl("EWID");
                Label PriceID = (Label)GridView2.Rows[ID_class].FindControl("PriceID");
                Label ItemName = (Label)GridView2.Rows[ID_class].FindControl("ItemName");
                Label Unit = (Label)GridView2.Rows[ID_class].FindControl("Unit");
                Label LbResourceCode = (Label)GridView2.Rows[ID_class].FindControl("LbResourceCode");


                DataTableDr = DataTableBox.NewRow();

                DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                DataTableDr["ItemName"] = ItemName.Text;
                DataTableDr["Unit"] = Unit.Text!=""?Unit.Text:"0";
                DataTableDr["PriceID"] = PriceID.Text !=""?int.Parse(PriceID.Text):0;
                DataTableDr["ENumber"] = 0;
                DataTableDr["ResourceCode"] = LbResourceCode.Text;
                DataTableDr["EEdition"] = LbVersion.Text!=""?LbVersion.Text:"0";

                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;

                Repeater1.DataSource = DataTableBox;

                Repeater1.DataBind();

            }
        }

        protected void BtnSearchRe_Click(object sender, EventArgs e)
        {
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxReItamName.Text));

            string SQRstring = "";

            SQRstring += (ItemName != "") ? "and ItemName like '%" + ItemName + "%' " : "";
       
            string SqlSelect = (SQRstring.Length > 1) ? Sql1 + SQRstring + "" : "";
            SqlDataSource1.SelectCommand = SqlSelect;
            Sql = SqlSelect;
            ViewState["Sql"] = SqlSelect;
            GridView1.DataBind();
        }

        protected void BtnWBSSearch_Click(object sender, EventArgs e)
        {
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWBSSearch.Text));

            //string Sql = "Select * from PrivateResource";
            string SQRstring = "";

            SQRstring += (ItemName != "") ? "and ItemName like '%" + ItemName + "%'" : "";

            string SqlSelect = (SQRstring.Length > 1) ? Sql1 + SQRstring + "" : "";
            SqlDataSource2.SelectCommand = SqlSelect;
            Sql1 = SqlSelect;
            ViewState["Sql1"] = SqlSelect;
            GridView2.DataBind();
        }

        protected void BtnWBSAll_Click(object sender, EventArgs e)
        {
            string SqlSelect = "SELECT DISTINCT [ResourceCode],[EWID],[PriceID], [ItemName], [Unit],[ItemKind] FROM [EBudget_WBS] where ItemKind <>'mainitem' and Pid=" + Session["ProjectCode"].ToString() + "";
            SqlDataSource2.SelectCommand = SqlSelect;
            Sql1 = SqlSelect;
            ViewState["Sql1"] = SqlSelect;
            GridView2.DataBind();
        }

        protected void BtnReAll_Click(object sender, EventArgs e)
        {
            string SqlSelect = "SELECT [PriceID], [ItemName], [Unit] FROM [PrivateResource]";
            SqlDataSource1.SelectCommand = SqlSelect;
            Sql = SqlSelect;
            ViewState["Sql"] = SqlSelect;
            GridView1.DataBind();
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
         
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int index = e.Row.RowIndex;
                index = index % GridView2.PageSize;
                e.Row.Visible = true;
                Label LbResourceCode = (Label)e.Row.FindControl("LbResourceCode");

                if (LbResourceCode.Text != "")
                {
                    if (ViewState[LbResourceCode.Text] == null)
                    {
                        
                        e.Row.Visible = true;
                       
                        ViewState[LbResourceCode.Text] = 1;
                        //break;
                    }
                    else
                    {
                        e.Row.Visible = false;
                        //GridView2.Rows[index].Visible = false;
                     
                    }
                }
              

            }
        }

      
    }
}