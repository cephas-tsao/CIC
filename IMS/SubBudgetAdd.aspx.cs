using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class SubBudgetAdd : System.Web.UI.Page
    {
        protected string LbLayerNum;
        int x = 0;
        bool flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
           if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");
            
            }
            else 
            {
                SqlDataSource1.SelectCommand = "SELECT * FROM EBudget_WBS  WHERE PID =" + Session["ProjectCode"].ToString() + " Order By order_Num";//And ExecuteNY=1
                SqlDataSource2.SelectCommand = "SELECT * FROM EBudget_WBS WHERE ResourceNY=1 and PID=" + Session["ProjectCode"].ToString();
           
            }   
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                
            if (ViewState["LbLayerNum"] != null)
            {
                LbLayerNum = ViewState["LbLayerNum"].ToString();
            }
            if (!IsPostBack)
            {
                ViewState["searcher"] = Request.Form["searcher"];
                //if (Request.Form["searcher"] !=null)
                //{
                //string search = Request.Form["searcher"].ToString();
                ////this.Request.Form["searcher"].Attributes.Add("value", this.Request.Form["searcher"]);
                //}
                //search.Attributes.Add("readonly", "readonly");
                string database = Session["DatabaseName"].ToString();
                string SQLETotal = "select SUM(ETotal) as total from EBUDGET where Pid=" + Session["ProjectCode"].ToString();
                if (WebModel.SItemName(database, SQLETotal, "total") != "")
                {
                    LbExeTatal.Text = decimal.Parse(WebModel.SItemName(database, SQLETotal, "total")).ToString("N0");
                   
                    string SQLItemAmount = "select SUM(ItemAmount) as total from EBudget_ResourceBK where Pid=" + Session["ProjectCode"].ToString();
                    string SQLSubTotal = "select SUM(LastAmount) as total from EBudget_ResourceBK where Pid=" + Session["ProjectCode"].ToString();
                    string test = WebModel.SItemName(database, SQLItemAmount, "total");
                    if (test != "")
                    {
                    decimal total = decimal.Parse(WebModel.SItemName(database, SQLItemAmount, "total")) - decimal.Parse(WebModel.SItemName(database, SQLSubTotal, "total"));
                    LbSubTotal.Text = (total).ToString("N0");
                    }

                }

                if (Session["Datatable"] != null)
                {
                    Repeater3.DataSource = Session["Datatable"];

                    Repeater3.DataBind();
                }
            }
            //BtnRiSub.Text = "全資源存入分包工料";
            //if (ViewState["searcher"] != null)
            //    Request.Form["searcher"] = ViewState["searcher"].ToString();
         
            //BtnRiSub.Enabled = true;
        }
        protected void callback_Click(object sender, EventArgs e)
        {
            //Response.Redirect("BidBudgetEdit.aspx");
        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            //if ((CheckBox1.Checked == true))
            //{
            //    CheckBox7.Checked = true;
            //    CheckBox8.Checked = true;
            //    CheckBox7.Enabled = false;
            //    CheckBox8.Enabled = false;
            //    TextBox9.Text = "";
            //    TextBox10.Text = "";
            //    TextBox9.Enabled = false;
            //    TextBox10.Enabled = false;
            //}
            //else
            //{
            //    CheckBox7.Checked = false;
            //    CheckBox8.Checked = false;
            //    CheckBox7.Enabled = true;
            //    CheckBox8.Enabled = true;
            //    TextBox9.Enabled = true;
            //    TextBox10.Enabled = true;
            //}

        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            if ((RadioButtonList2.SelectedIndex == 0))
            {
               
                Pnl_WBS.Visible = true;
                Pnl_Resource.Visible = false;
                WBSSearch.Visible = true;
                ResourceSearch.Visible = false;
              
            }
            else if ((RadioButtonList2.SelectedIndex == 1))
            {
                Pnl_WBS.Visible = false;
                Pnl_Resource.Visible = true;
                WBSSearch.Visible = false;
                ResourceSearch.Visible = true;
                WBSSearch.Visible = false;
            }
        }
        protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
        {
            //Pnl_Analysis.Visible = true;
            //Pnl_ItemPack.Visible = false;
        }
        //protected void ImageButton52_Click(object sender, ImageClickEventArgs e)
        //{
        //    Pnl_SourceList.Visible = true;
        //    //Pnl_SourcePack.Visible = false;
        //    //Pnl_SourcePack1.Visible = false;
        //}

        //protected void ImageButton84_Click(object sender, ImageClickEventArgs e)
        //{
        //    //Pnl_ItemPack.Visible = true;
        //    //Pnl_Analysis.Visible = false;
        //}
        //protected void ImageButton115_Click(object sender, ImageClickEventArgs e)
        //{
        //    Pnl_SourceList.Visible = false;
        //    //Pnl_SourcePack.Visible = false;
        //    //Pnl_SourcePack1.Visible = true;
        //}
        //protected void ImageButton136_Click(object sender, ImageClickEventArgs e)
        //{
        //    Pnl_SourceList.Visible = false;
        //    //Pnl_SourcePack.Visible = true;
        //    //Pnl_SourcePack1.Visible = false;
        //}
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDL_Staff.Items.Clear();
            DDL_Staff.Items.Add("-請選擇部門人員-");
        }
     
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            int maxlayer = WebModel.MaxValue(database, "EBudget_WBS", "LayerNum");
            LbLayerNum = maxlayer.ToString();
            ViewState["LbLayerNum"] = LbLayerNum;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label Lbwid = (Label)e.Item.FindControl("Lbwid");
                //Label LbRiUpperBKID = (Label)e.Item.FindControl("LbRiUpperBKID");
              
                Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbENum = (Label)e.Item.FindControl("LbENum");
                Label LbEPrice = (Label)e.Item.FindControl("LbEPrice");
                Label LbLastSubNumber = (Label)e.Item.FindControl("LbLastSubNumber");
                Literal Literal1 = (Literal)e.Item.FindControl("Literal1");
                //ImageButton ImgSubC = (ImageButton)e.Item.FindControl("ImgSubC");
                //ImageButton ImgRItem = (ImageButton)e.Item.FindControl("ImgRItem");
                CheckBox checkSub = (CheckBox)e.Item.FindControl("checkSub");
                checkSub.AutoPostBack = true;

                //Lbwid.Text = vsDr["EWID"].ToString();
             
               
                string Order = vsDr["ItemOrder"].ToString();
                LbItemOrder.Text=vsDr["ItemOrder"].ToString();
                Lbwid.Text = vsDr["EWID"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbENum.Text = vsDr["LastENumber"].ToString()!=""?vsDr["LastENumber"].ToString():"0";
                LbEPrice.Text = vsDr["EUnitPrice"].ToString() !=""?vsDr["EUnitPrice"].ToString():"0";
                
                LbLastSubNumber.Text = vsDr["LastSubNumber"].ToString() != "" ? vsDr["LastSubNumber"].ToString() : vsDr["LastENumber"].ToString();
                //LbRiUpperBKID.Text = vsDr["RiUpperBKID"].ToString();
                if (LbENum.Text == "")
                {
                    LbENum.Text=vsDr["ENumber"].ToString();

                }
                if (vsDr["ItemKind"].ToString() == "mainitem" && decimal.Parse(LbENum.Text)==0)
                {
                    LbENum.Text = "1";
                    LbLastSubNumber.Text = vsDr["LastSubNumber"].ToString() != "" ? vsDr["LastSubNumber"].ToString() : "1";
                }
                //ImageButtonAdd.Visible = (vsDr["ItemKind"].ToString() != "variableSumPercentage") ? true : false;
                //if (vsDr["ItemKind"].ToString() == "mainitem")
                //{
                //    //ImgSubC.Visible = true;
                //}
                //else if (vsDr["ItemKind"].ToString() == "workitem" && vsDr["ExecuteKind"].ToString() == "NP" || vsDr["ExecuteKind"].ToString() == "NKRP")
                //{
                //    //ImgSubC.Visible = true;
                //    //ImgRItem.Visible = false;
                //}
                //else if (vsDr["ItemKind"].ToString() == "subtotal")
                //{
                //     //ImgSubC.Visible = false;
                //     ImgRItem.Visible = false;
                //}
                //if (vsDr["ItemKind"].ToString() == "mainitem" || vsDr["ExecuteKind"].ToString() == "NP" || vsDr["ExecuteKind"].ToString() == "RP" || vsDr["ExecuteKind"].ToString() == "NKRP")
                //{
                //    ImgRItem.Visible = false;
                //}
                //else if (vsDr["ExecuteKind"].ToString() == null || vsDr["ExecuteKind"].ToString() == "" || vsDr["ExecuteKind"].ToString() == "Nk" || vsDr["ExecuteKind"].ToString() == "Rk")
                //{
                //    ImgRItem.Visible = true;
                //}
                //ImgSubC.Visible = (vsDr["ItemKind"].ToString() == "workitem" || vsDr["ExecuteKind"].ToString() == "NP" || vsDr["ExecuteKind"].ToString() == "RP" || vsDr["ExecuteKind"].ToString() == "NKRP") ? true : false;
                //ImgRItem.Visible = (vsDr["ExecuteKind"].ToString() == null || vsDr["ExecuteKind"].ToString() == "" || vsDr["ExecuteKind"].ToString() == "Nk" || vsDr["ExecuteKind"].ToString() == "Rk") ? true : false;
                //string SQLselect = "Select * from EBudget_ResourceBK where WiEWID=" + Lbwid.Text + " and RiLayer=0";
                //decimal Remain = WebModel.SItemName(database, SQLselect, "LastAmount") != "" ? decimal.Parse(WebModel.SItemName(database, SQLselect, "LastAmount")) : 0;
                //if (Remain == 0)
                //{
                //    //ImgSubC.Enabled = false;
                //    //ImgSubC.Visible = false;
                //    //trID.Style.Add("Background-color", "Red");
                //}
                //int[] num;
                //string SQLSelect1 = "Select * from EBudget_ResourceBK where WiEWID=" + Lbwid.Text + "";
              
                //string PriceID = WebModel.SItemName(database, SQLSelect1, "RiPriceID");
                //bool result = false;
                //if (PriceID != "")
                //{
                //    num = GetWiRiTable.GetKidID(database, Session["ProjectCode"].ToString(), int.Parse(PriceID));


                //    for (int uuu = 0; uuu < num.Length; uuu++)
                //    {

                //        int nowuid = num[uuu];
                //        //id += nowuid.ToString() + ",";
                //        string SQLSelect2 = "Select * from EBudget_ResourceBK where WiEWID=" + Lbwid.Text + " and RiPriceID =" + nowuid;
                //        decimal LastAmount = WebModel.SItemName(database, SQLSelect2, "LastAmount") != "" ? decimal.Parse(WebModel.SItemName(database, SQLSelect2, "LastAmount")) : 0;
                //        if (LastAmount != 0)
                //        {
                //            //ImgRItem.Visible = true;
                //            //trID.Style.Add("Background-color", "Red");
                //            result = true;
                //            break;
                //        }


                //    }
                //    if (!result)
                //    {
                //        ImgRItem.Visible = false;
                //        //trID.Style.Add("Background-color", "Red");
                //    }
                //}
             
                string layer = vsDr["LayerNum"].ToString() !=""?vsDr["LayerNum"].ToString():"0";
                 x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;//- int.Parse(layer)
             
                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                {
                    Literal1.Text += @"<td class='itemframe'  style='min-width:10px;border-left-style:none' ></td>";

                }

                Literal1.Text += @"<td  colspan= " + x + ">" + Order + "</td>";
              
            }

        }
        //protected void check_CheckedChanged(object sender, EventArgs e)
        //{
        //    string database = Session["DatabaseName"].ToString();


        //    CheckBox check = (CheckBox)sender;


        //    RepeaterItem item = (RepeaterItem)check.NamingContainer;
        //    int index = item.ItemIndex;

        //    Label Lbwid = (Label)item.FindControl("Lbwid");
        //    int[] uid = checkfun.Sort_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(Lbwid.Text));


        //    foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
        //    {

        //        foreach (RepeaterItem item1 in Repeater1.Items)
        //        {
        //            if (item1.ItemType == ListItemType.Item || item1.ItemType == ListItemType.AlternatingItem)
        //            {
        //                Label Lbwid1 = (Label)item1.FindControl("Lbwid");
        //                CheckBox chb = (CheckBox)item1.FindControl("checkSub");
        //                if (check.Checked == true)
        //                {
        //                    if (Lbwid1.Text == uuu.ToString())
        //                    {
        //                        chb.Checked = true;
        //                    }
        //                }
        //                else if (check.Checked == false)
        //                    if (Lbwid1.Text == uuu.ToString())
        //                    {
        //                        chb.Checked = false;

        //                    }
        //            }
        //        }
        //    }


        //}
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("trID"); 
                //bool result = false;
                string database = Session["DatabaseName"].ToString();
                Label LbEWID = (Label)e.Item.FindControl("LbEWID");
                Label LbCode = (Label)e.Item.FindControl("LbCode");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbEAmount = (Label)e.Item.FindControl("LbEAmount");
                Label LbEPrice = (Label)e.Item.FindControl("LbEPrice");
                Label LbResourceCode = (Label)e.Item.FindControl("LbResourceCode");

                LbResourceCode.Text = vsDr["ResourceCode"].ToString();
                //ImageButton ImgRiSub = (ImageButton)e.Item.FindControl("ImgRiSub");
                ImageButton ImgPList = (ImageButton)e.Item.FindControl("ImgPList");

                LbEWID.Text = vsDr["EWID"].ToString();
                LbCode.Text = vsDr["ResourceCode"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbEPrice.Text = vsDr["EUnitPrice"].ToString();
                LbEAmount.Text = vsDr["ENumber"].ToString();

              
                if (LbResourceCode.Text != "")
                {
                    if (ViewState[LbResourceCode.Text] == null)
                    {
                        tr.Visible = true;
                        ViewState[LbResourceCode.Text] = true;
                        //break;
                    }
                    else
                    {
                        tr.Visible = false;
                    }
                }
                //按扭是否顯示
                //string SQLRs = "Select * From EBudget_ResourceBK where pid=" + Session["ProjectCode"].ToString();
                //string pid = WebModel.SItemName(database, SQLRs, "PID");
                //if (pid != "")
                //{
                //    string SQLSelect = "Select * From EBudget_ResourceBK Where RiPriceID =" + LbPriceID.Text + "  Order By BKID";
                //    DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                //    if (Dtvs != null && Dtvs.Rows.Count > 0)
                //    {
                //        foreach (DataRow row in Dtvs.Rows)
                //        {
                //            decimal LastAmount = decimal.Parse(row["LastAmount"].ToString());
                //            if (LastAmount > 0)
                //            {
                //                result = true;

                //                break;
                //            }

                //        }
                //    }
                //    if (!result)
                //    {
                //        ImgRiSub.Visible = false;
                //        ImgPList.Visible = false;
                //        //trID.Style.Add("Background-color", "Red");
                //    }
                //}
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = GetDataBox();

            if (ViewState["Datatable"] != null)
           {
               DataTableBox = (DataTable)ViewState["Datatable"];
           }
            if (e.CommandName == "Select")
            {
                string EWID = ((Label)e.Item.FindControl("LbWid")).Text;
                string LbItemOrder = ((Label)e.Item.FindControl("LbItemOrder")).Text;
                string LbItemName = ((Label)e.Item.FindControl("LbItemName")).Text;
                string LbUnit = ((Label)e.Item.FindControl("LbUnit")).Text;
                string LbENum = ((Label)e.Item.FindControl("LbENum")).Text;
                string LbEPrice = ((Label)e.Item.FindControl("LbEPrice")).Text;
                string LbLastSubNumber = ((Label)e.Item.FindControl("LbLastSubNumber")).Text;
                string LbSubNum = ((TextBox)e.Item.FindControl("LbSubNum")).Text;
                 LbSubNum = LbSubNum != "" ? LbSubNum : "0";
                LbENum=LbENum!=""?LbENum:"0";
                LbLastSubNumber = LbLastSubNumber != "" ? LbLastSubNumber : LbENum;
                if (decimal.Parse(LbSubNum) > decimal.Parse(LbENum))
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('分包用量不得超過剩餘數量!!!');", true);

                }
                else
                {
                    DataRow DataTableDr = DataTableBox.NewRow();

                    DataTableDr["ItemOrder"] = LbItemOrder;
                    DataTableDr["EWID"] = EWID;
                    DataTableDr["ItemName"] = LbItemName;
                    DataTableDr["Unit"] = LbUnit;
                    DataTableDr["ENumber"] = LbSubNum;
                    DataTableDr["EUnitPrice"] = LbEPrice;
                    DataTableDr["LastSubNumber"] = LbLastSubNumber;
                    
                    DataTableBox.Rows.Add(DataTableDr);
                   
                    decimal LSNum = decimal.Parse(LbLastSubNumber) - decimal.Parse(LbSubNum);
                    ((Label)e.Item.FindControl("LbLastSubNumber")).Text = LSNum.ToString();

                    ViewState["Datatable"] = DataTableBox;
                    Repeater3.DataSource = DataTableBox;
                    Repeater3.DataBind();
                }
            }

        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString = "EWID,ItemOrder,ResourceCode,ItemName,Unit,ItemKind,ENumber,EUnitPrice,LastSubNumber";
            DataTable DataTableBox = new DataTable();
            //string ErrorString = "";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            //ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();
            //if (ErrorString == "")
            //{
            //    #region 內容設定
            //    //string SQLSlect = "Select * from EBudget_ResourceBK where BKID=" + LbBKID.Text;
            //    //string RiUpperBKID = WebModel.SItemName(database, SQLSlect, "RiUpperBKID");
            //    //int[] num = GetWiRiTable.GetParentID(database, Session["ProjectCode"].ToString(), int.Parse(RiUpperBKID));

            //    //DataTableDr["BKID"] = LbBKID.Text;
            //    //DataTableDr["WiName"] = LbWItemName1.Text;
            //    //DataTableDr["WiUnit"] = LbWUnit1.Text;
            //    //DataTableDr["BWI"] = "全工項分包";
            //    //DataTableDr["WiQuantity"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
            //    //DataTableDr["WiPrice"] = LbWPrice1.Text;
            //    //DataTableDr["Remain"] =decimal.Parse(LbLastAmount.Text) - decimal.Parse(TxSubQuantity.Text);
            //    //DataTableDr["WiComplex"] = (decimal.Parse(LbWQuantity1.Text) * decimal.Parse(LbWPrice1.Text)).ToString("N0");

            //    DataTableBox.Rows.Add(DataTableDr);
            //    #endregion
            //    ViewState["items"] = DataTableBox;
            //}
            //else
            //{

            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            //}
            return DataTableBox;
        }
        //取得分包預算內容
        protected DataTable GetDataBox1()
        {
          
            string SQLString = "SB_Code,PID,SB_Name,BookInTime,BookContractDate,LastContractDate,ContractWay,WorkManDep,WorkManName";
            DataTable DataTableBox1 = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox1.Columns.Add(DataName, typeof(string));
            }
         
          
                //後台功能，必需要有的欄位名稱               

                DataRow DataTableDr = DataTableBox1.NewRow();

                #region 內容設定

                DataTableDr["SB_Code"] = TxSubNo.Text;
                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                DataTableDr["SB_Name"] = TxSubName.Text;
                DataTableDr["BookInTime"] = TxWD.Text;
                DataTableDr["BookContractDate"] = TxFSub.Text;
                DataTableDr["LastContractDate"] = TxLSub.Text;
                DataTableDr["ContractWay"] = RadioButtonList1.SelectedValue;
                DataTableDr["WorkManDep"] = DDL_Dep.SelectedValue;
                DataTableDr["WorkManName"] = DDL_Staff.SelectedValue;
                //DataTableDr["DisCountRecord"] = (decimal.Parse(LbWQuantity1.Text) * decimal.Parse(LbWPrice1.Text)).ToString("N0");


                DataTableBox1.Rows.Add(DataTableDr);
                #endregion
             
           
            return DataTableBox1;
        }
        protected void BtnSaveWi_Click(object sender, EventArgs e)
        {

            //if (decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbWQuantity1.Text))
            //{
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('分包用量不得超過工程用量!!!');", true);
            //}
            //else
            //{
            //    GetDataBox();
            //    Repeater3.DataSource = ViewState["items"];
            //    Repeater3.DataBind();
            //}
            //Pnl_ItemPack.Visible = false;
        }

        protected void BtnClearWi_Click(object sender, EventArgs e)
        {
            //LbWItemName1.Text = "";
            //LbWUnit1.Text = "";
            //LbLastAmount.Text = "";
            //LbWQuantity1.Text = "";
            //LbWPrice1.Text = "";
        }
        protected  bool checkItem()
        {
            string database = Session["DatabaseName"].ToString();
           
            foreach (RepeaterItem item in Repeater3.Items)
            {
                Label LbBKID = item.FindControl("LbBKID") as Label;

                string SQL = "Select * from EBudget_ResourceBK where BKID=" + LbBKID.Text;

                string TotalAmount = WebModel.SItemName(database, SQL, "ItemAmount");
                if(decimal.Parse(TotalAmount)<=0)
                {
                    return false;
                    break;
                }
                
            }

            return true;
        }
        protected void BtnAddSub_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            
            string result1="";
            string ErrorString = "";
            decimal LSNum = 0;
            string SQLUpdate ="";
            ErrorString += (TxSubNo.Text) == string.Empty ? "請輸入分包預算編號!!\\n" : "";
            ErrorString += (TxSubName.Text) == string.Empty ? "請輸入分包預算名稱!!\\n" : "";

            string SQLString = "SBID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,UnitPrice,DelTemp,AddTemp,DisCountRecord";
            DataTable DataTableBox = new DataTable();
           
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


                if (ErrorString == "")
                {
                    string result = WebModel.SaveAction(database, "SubBudgetList", GetDataBox1());

                    foreach (RepeaterItem item in Repeater3.Items)
                    {

                        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                        {


                            DataRow DataTableDr = DataTableBox.NewRow();

                            Label EWID = item.FindControl("EWID") as Label;
                            Label LbItemName = item.FindControl("LbItemName") as Label;
                            Label LbUnit = item.FindControl("LbUnit") as Label;
                            Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
                            Label LbENumber = item.FindControl("LbENumber") as Label;
                            Label LbEUnitPrice = item.FindControl("LbEUnitPrice") as Label;
                            Label LbRemain = item.FindControl("LbRemain") as Label;

                          
                            string SQLSelect = "  Select MAX(SBID) as id  FROM [SubBudgetList]";
                            string SBID = WebModel.SItemName(database, SQLSelect, "id");
                            DataTableDr["SBID"] = SBID;
                            DataTableDr["BelongEWID"] = EWID.Text;
                            DataTableDr["ItemName"] = LbItemName.Text;
                            DataTableDr["Unit"] = LbUnit.Text;
                            DataTableDr["BelongItem"] = LbItemOrder.Text;
                            DataTableDr["SCNumber"] = LbENumber.Text != "" ? decimal.Parse(LbENumber.Text) : 0;
                            DataTableDr["UnitPrice"] = LbEUnitPrice.Text != "" ? decimal.Parse(LbEUnitPrice.Text) : 0;

                            DataTableBox.Rows.Add(DataTableDr);
                            result1 = WebModel.SaveAction(database, "SubBudget_Item", DataTableBox);

                            DataTableBox.Rows.Clear();

                            //bool result2 = WebModel.SQLAction(database, SQLUpdate);

                            string SQLSelect1 = "Select * from EBudget_WBS where Ewid=" + EWID.Text;
                            string DbLastSubNumber = WebModel.SItemName(database, SQLSelect1, "LastSubNumber") != "" ? WebModel.SItemName(database, SQLSelect1, "LastSubNumber") : "0";
                            string DbENumber = WebModel.SItemName(database, SQLSelect1, "ENumber") != "" ? WebModel.SItemName(database, SQLSelect1, "ENumber") : "0";
                            string ResourceCode = WebModel.SItemName(database, SQLSelect1, "ResourceCode") != "" ? WebModel.SItemName(database, SQLSelect1, "ResourceCode") : "0";
                            if (LbItemOrder.Text == "全工項")
                            {
                                SQLUpdate = "Update EBudget_WBS set LastSubNumber=0 where ResourceCode='" + ResourceCode+"'";
                                bool result2 = WebModel.SQLAction(database, SQLUpdate);

                            }
                            else
                            {
                                if (DbLastSubNumber != "0")
                                {
                                    LSNum = decimal.Parse(DbLastSubNumber) - decimal.Parse(LbENumber.Text);
                                }
                                else
                                {
                                    LSNum = decimal.Parse(DbENumber) - decimal.Parse(LbENumber.Text);
                                }
                           
                              SQLUpdate = "Update EBudget_WBS set LastSubNumber=" + LSNum + " where EWID=" + EWID.Text;
                            bool result2 = WebModel.SQLAction(database, SQLUpdate);
                            }
                            TxSubNo.Text = "";
                            TxSubName.Text = "";
                            TxWD.Text = "";
                            TxFSub.Text = "";
                            TxLSub.Text = "";
                            if (result1 == "1")
                            {
                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔成功');", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);

                            }
                        }
                    }

                }

                else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }
            //}
        }

        protected void BtnClearSub_Click(object sender, EventArgs e)
        {
            ViewState["Datatable"] = null;
            Repeater3.DataSource = "";
            Repeater3.DataBind();
            //Repeater1.DataBind();
        }

        protected void TxSubQuantity_TextChanged(object sender, EventArgs e)
        {
            //LbLastAmount.Text = (decimal.Parse(LbLastAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Delete")
            {
                //Repeater1.Controls.RemoveAt(ID_class);
                DataTable Dtvs=new DataTable();
                if (ViewState["Datatable"] != null)
                {
                     Dtvs = (DataTable)ViewState["Datatable"];
                }
                else if (Session["Datatable"] != null)
                {
                     Dtvs = (DataTable)Session["Datatable"];
                }
                //DataRow DataTableDr;
                Dtvs.Rows.RemoveAt(ID_class);
                Repeater3.DataSource = Dtvs;
                Repeater3.DataBind();
                  
                    //Repeater3.Controls.RemoveAt(ID_class);
                  

                //}
                //Repeater3.DataBind();
            }
        }

      
        //protected void BtnRiSave_Click(object sender, EventArgs e)
        //{
        //    string SQLString = "BKID,WiEWID,WiName,WiUnit,BWI,WiQuantity,WiPrice,WiComplex,Remain";
        //    DataTable DataTableBox = new DataTable();
        //    string ErrorString = "";
        //    foreach (string DataName in SQLString.Split(','))
        //    {
        //        DataTableBox.Columns.Add(DataName, typeof(string));
        //    }


        //    //後台功能，必需要有的欄位名稱               

        //    DataRow DataTableDr ;

            
        //          foreach (RepeaterItem item in Repeater1.Items)
        //          {
        //              DataTableDr = DataTableBox.NewRow();
        //              if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //              {
        //                  CheckBox CheckBox1 = item.FindControl("CheckBox1") as CheckBox;
        //                  Label LbBKID = item.FindControl("LbBKID") as Label;
        //                  Label LbRiItemKind = item.FindControl("LbRiItemKind") as Label;
        //                  Label LbRiItemName = item.FindControl("LbRiItemName") as Label;
        //                  Label LbRiUnit = item.FindControl("LbRiUnit") as Label;
        //                  Label LbRiWorkRate = item.FindControl("LbRiWorkRate") as Label;
        //                  Label LbRiPrice = item.FindControl("LbRiPrice") as Label;
        //                  Label LbRiQuantity = item.FindControl("LbRiQuantity") as Label;
        //                  Label LbRiRemain = item.FindControl("LbRiRemain") as Label;
        //                  TextBox TxSubQuantity = item.FindControl("TxSubQuantity") as TextBox;
                  
        //                  if (CheckBox1.Checked)
        //                  {
                            
                      
        //                          ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //                          ErrorString += decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRiRemain.Text) ? "分包用量不得超過工程用量!!!\\n" : "";

        //                          if (ErrorString == "")
        //                          {
        //                      #region 內容設定

        //                      DataTableDr["BKID"] = LbBKID.Text;
        //                      DataTableDr["WiName"] = LbRiItemName.Text;
        //                      DataTableDr["WiUnit"] = LbRiUnit.Text;
        //                      //DataTableDr["BWI"] = LbWItemName.Text;
        //                      if (TxSubQuantity.Text.Trim() != "")
        //                      {

        //                          DataTableDr["WiQuantity"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //                      }
        //                      else
        //                      {
        //                          TxSubQuantity.Text = "0";
        //                          DataTableDr["WiQuantity"] = TxSubQuantity.Text;
        //                      }
        //                      LbRiRemain.Text = (decimal.Parse(LbRiQuantity.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //                      DataTableDr["Remain"] = LbRiRemain.Text;
        //                      DataTableDr["WiPrice"] = LbRiPrice.Text;
        //                      DataTableDr["WiComplex"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(LbRiPrice.Text)).ToString("N0");

        //                      DataTableBox.Rows.Add(DataTableDr);
        //                      #endregion
        //                      Repeater3.DataSource = DataTableBox;
        //                      Repeater3.DataBind();
        //                  }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //    }
                        


        //                  }
        //              }
             
        //          }

        //          //Pnl_Analysis.Visible = false;
        //}

        protected void BtnRiClear_Click(object sender, EventArgs e)
        {
            //SqlDataSource6.SelectCommand= "";
            //Repeater4.DataBind();
        }

        //protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    decimal ENmum = 0;
        //    decimal EAmount = 0;
        //    decimal LastSubNumber = 0;
        //    decimal TotalLastSubNumber = 0;
        //    int ID_class = Convert.ToInt32(e.CommandArgument);
        //    string EWID = ((Label)e.Item.FindControl("LbEWID")).Text;
        //    ViewState["EWID"] = EWID;
        //    BtnSaveSub.Enabled = true;
        //    if (e.CommandName == "SelectFList")
        //    {
        //        Repeater6.Controls.Clear();
        //        Pnl_SourceList.Visible = true;
        //        LbEwid.Text = EWID;
        //        //SqlDataSource8.SelectCommand = "Select * From EBudget_WBS Where EWID =" + EWID + "  Order By EWID";
        //        LbRiItemName1.Text = ((Label)e.Item.FindControl("LbItemName")).Text;
        //        LbRiUnit1.Text = ((Label)e.Item.FindControl("LbUnit")).Text;
        //        LbRiAmount.Text = ((Label)e.Item.FindControl("LbEAmount")).Text;
        //        EUnitPrice.Text = ((Label)e.Item.FindControl("LbEPrice")).Text;
        //        string LbResourceCode = ((Label)e.Item.FindControl("LbResourceCode")).Text;
        //        string SQLSelect = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "and EWID="+ LbEwid.Text;
        //        DataTable DT1 = WebModel.LoadSetContentData(database, SQLSelect);


        //        for (int i = 0; i < DT1.Rows.Count; i++)
        //        {

        //            string ResourceCode = DT1.Rows[i]["ResourceCode"].ToString();
        //            if (ResourceCode == LbResourceCode && ResourceCode != "")
        //            {
                     
        //                ENmum = DT1.Rows[i]["ENumber"].ToString() != "" ? decimal.Parse(DT1.Rows[i]["ENumber"].ToString()) : 0;
        //                //Amount = Amount != "" ? Amount : "0";
        //                EAmount += (ENmum);
        //                LbRiAmount.Text = EAmount.ToString();
        //                //ViewState[LbResourceCode.Text] = false;
        //                LastSubNumber = DT1.Rows[i]["LastSubNumber"].ToString() != "" ? decimal.Parse(DT1.Rows[i]["LastSubNumber"].ToString()) : ENmum;
        //                TotalLastSubNumber += LastSubNumber;
        //            }

        //        }
        //        if (TotalLastSubNumber==0)
        //        {
        //            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('該工項已經分包完畢!!!');", true);
        //            BtnSaveSub.Enabled = false;
        //        }

        //    }
        //}

        //protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
           
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
        //        string database = Session["DatabaseName"].ToString();
        //        Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");
        //        Label LbEwid = (Label)e.Item.FindControl("LbEwid");
        //        Label LbItemAmount = e.Item.FindControl("LbItemAmount") as Label;
        //        Label LbRemain = e.Item.FindControl("LbRemain") as Label;

        //        string SQLselect1 = "Select * from EBudget_WBS where EWID=" + LbEwid.Text + "";
        //        LbItemOrder.Text = WebModel.SItemName(database, SQLselect1, "ItemOrder");
        //        if (flag == false)
        //        {
        //            BtnRiSub.Text = "全資源存入分包工料";
        //            BtnRiSub.Enabled = true;
        //        }
        //        if (decimal.Parse(LbItemAmount.Text) != decimal.Parse(LbRemain.Text))
        //        {
        //            BtnRiSub.Text = "此資源已有其他分包，無法進行全資源分包";
        //            BtnRiSub.Enabled = false;
        //            flag = true;
        //        }
        //    }
        //}

        //protected void BtnRiSub_Click(object sender, EventArgs e)
        //{
        //    string SQLString = "BKID,WiEWID,WiName,WiUnit,BWI,WiQuantity,WiPrice,WiComplex,ItemAmount,Remain";
        //    DataTable DataTableBox = new DataTable();
         
        //    foreach (string DataName in SQLString.Split(','))
        //    {
        //        DataTableBox.Columns.Add(DataName, typeof(string));
        //    }
        //    string ErrorString = "";
        //    ErrorString += (LbTQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //    //後台功能，必需要有的欄位名稱               

        //        DataRow DataTableDr;
        //        //foreach (RepeaterItem item in Repeater5.Items)
        //        //{
        //        DataTableDr = DataTableBox.NewRow();
        //        //    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        //    {

        //        //        Label LbBKID = item.FindControl("LbBKID") as Label;
        //        //        Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
        //        //        Label LbItemName = item.FindControl("LbItemName") as Label;
        //        //        Label LbUnit = item.FindControl("LbUnit") as Label;                 
        //        //        Label LbRiPrice = item.FindControl("LbRiPrice") as Label;
        //        //        Label LbItemAmount = item.FindControl("LbItemAmount") as Label;
        //        //        Label LbRemain = item.FindControl("LbRemain") as Label;

        //        //DataTableDr["BKID"] = LbBKID.Text;
        //        DataTableDr["WiName"] = LbRiItemname.Text;
        //        DataTableDr["WiUnit"] = LbRiUnit.Text;
        //        DataTableDr["BWI"] = "全資源分包";
        //        LbTQuantity.Text = LbTQuantity.Text != "" ? decimal.Parse(LbTQuantity.Text).ToString("N0") : "0";
        //        DataTableDr["WiQuantity"] = LbTQuantity.Text != "" ? decimal.Parse(LbTQuantity.Text).ToString("N0") : "0";
        //        LbRiPrice.Text = LbRiPrice.Text != "" ? LbRiPrice.Text : "0";
        //        DataTableDr["WiPrice"] = LbRiPrice.Text;
        //        //DataTableDr["Remain"] = LbRemain.Text;
        //        DataTableDr["WiComplex"] = (decimal.Parse(LbTQuantity.Text) * decimal.Parse(LbRiPrice.Text)).ToString("N0");

        //        DataTableBox.Rows.Add(DataTableDr);

        //        Repeater3.DataSource = DataTableBox;
        //        Repeater3.DataBind();
           
        //    //    }
        //    //}
        //    //Repeater3.DataSourceID = "SqlDataSource5";
        //    //SqlDataSource5.SelectCommand = ViewState["SQL7"].ToString();
        //    //Repeater3.DataBind();
        //        Pnl_SourcePack.Visible = false;
        //}

        //protected void BtnSaveSub_Click(object sender, EventArgs e)
        //{

        //    if (RadioButtonList3.SelectedValue != "")
        //    {
        //        string SQLString = "EWID,ItemOrder,ItemName,Unit,ENumber,EUnitPrice,LastSubNumber";
        //        DataTable DataTableBox = new DataTable();
        //        string ErrorString = "";
        //        //string RiPrice = "";
        //        foreach (string DataName in SQLString.Split(','))
        //        {
        //            DataTableBox.Columns.Add(DataName, typeof(string));
        //        }
        //        if (ViewState["Datatable"] != null)
        //        {
        //            DataTableBox = (DataTable)ViewState["Datatable"];
        //        }
        //        string database = Session["DatabaseName"].ToString();

        //        //後台功能，必需要有的欄位名稱               

        //        DataRow DataTableDr;
        //        if (RadioButtonList3.SelectedValue == "1")
        //        {
        //            #region 內容設定
        //            DataTableDr = DataTableBox.NewRow();

        //            DataTableDr["EWID"] = LbEwid.Text;
        //            DataTableDr["ItemName"] = LbRiItemName1.Text;
        //            DataTableDr["Unit"] = LbRiUnit1.Text;
        //            DataTableDr["ItemOrder"] = "全工項";

        //            if (LbRiAmount.Text.Trim() != "")
        //            {

        //                DataTableDr["ENumber"] = decimal.Parse(LbRiAmount.Text).ToString("N0");
        //            }
        //            else
        //            {
        //                LbRiAmount.Text = "0";
        //                DataTableDr["ENumber"] = LbRiAmount.Text;
        //            }
        //            //LbRemain.Text = (decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //            //DataTableDr["Remain"] = LbRemain.Text;
        //            EUnitPrice.Text = EUnitPrice.Text != "" ? EUnitPrice.Text : "0";
        //            DataTableDr["EUnitPrice"] = EUnitPrice.Text;
        //            DataTableDr["LastSubNumber"] = (decimal.Parse(LbRiAmount.Text) * decimal.Parse(EUnitPrice.Text)).ToString("N0");

        //            DataTableBox.Rows.Add(DataTableDr);
        //            #endregion

        //        }
        //        else
        //        {

        //            foreach (RepeaterItem item in Repeater6.Items)
        //            {
        //                //DataTableDr = DataTableBox.NewRow();
        //                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //                {
        //                    CheckBox CheckBox11 = item.FindControl("CheckBox11") as CheckBox;
        //                    //Label LbBKID = item.FindControl("LbBKID") as Label;
        //                    Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
        //                    Label LbItemName = item.FindControl("LbItemName") as Label;
        //                    Label LbUnit = item.FindControl("LbUnit") as Label;
        //                    //Label LbRiWorkRate = item.FindControl("LbRiWorkRate") as Label;
        //                    Label LbEwid = item.FindControl("LbEwid") as Label;
        //                    Label LbItemAmount = item.FindControl("LbItemAmount") as Label;
        //                    Label LbRemain = item.FindControl("LbRemain") as Label;
        //                    TextBox TxSubQuantity = item.FindControl("TxSubQuantity") as TextBox;
        //                    //string SQLselect="Select * from EBudget_ResourceBK where WiEWID="+LbEwid.Text+"";
        //                    LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : LbItemAmount.Text;
        //                    if (CheckBox11.Checked)
        //                    {
        //                        ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //                        TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
        //                        ErrorString += decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRemain.Text) ? "分包用量不得超過工程用量!!!\\n" : "";
        //                        if (ErrorString == "")
        //                        {


        //                            #region 內容設定
        //                            DataTableDr = DataTableBox.NewRow();

        //                            DataTableDr["EWID"] = LbEwid.Text;
        //                            DataTableDr["ItemName"] = LbItemName.Text;
        //                            DataTableDr["Unit"] = LbUnit.Text;
        //                            DataTableDr["ItemOrder"] = LbItemOrder.Text;

        //                            if (TxSubQuantity.Text.Trim() != "")
        //                            {

        //                                DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //                            }
        //                            else
        //                            {
        //                                TxSubQuantity.Text = "0";
        //                                DataTableDr["ENumber"] = TxSubQuantity.Text;
        //                            }
        //                            LbRemain.Text = (decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //                            //DataTableDr["Remain"] = LbRemain.Text;
        //                            EUnitPrice.Text = EUnitPrice.Text != "" ? EUnitPrice.Text : "0";
        //                            DataTableDr["EUnitPrice"] = EUnitPrice.Text;
        //                            DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(EUnitPrice.Text)).ToString("N0");

        //                            DataTableBox.Rows.Add(DataTableDr);
        //                            #endregion
        //                        }
        //                        else
        //                        {
        //                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //                        }


        //                    }
        //                }
        //            }
        //        }
        //        ViewState["Datatable"] = DataTableBox;
        //        Repeater3.DataSource = DataTableBox;
        //        Repeater3.DataBind();
        //        Pnl_SourceList.Visible = false;
        //    }
        //    else
        //    {

        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先選擇資源分包項目!!!');", true);
        //    }
        //}

        //protected void BtnClearSubList_Click(object sender, EventArgs e)
        //{
        //    SqlDataSource8.SelectCommand = "";
        //    Repeater6.DataBind();
        //}

        //protected void Repeater6_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
            
        //        string database = Session["DatabaseName"].ToString();
        //        Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");
        //        Label LbEwid = (Label)e.Item.FindControl("LbEwid");
        //        Label LbItemAmount = (Label)e.Item.FindControl("LbItemAmount");
        //        Label LbRemain = (Label)e.Item.FindControl("LbRemain");
              
        //        TextBox TxSubQuantity = (TextBox)e.Item.FindControl("TxSubQuantity");
        //        TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
        //        LbRemain.Text = LbRemain.Text !=""?LbRemain.Text:(decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString();
        //        string SQLselect1 = "Select * from EBudget_WBS where EWID=" + LbEwid.Text + "";

        //        LbItemOrder.Text = WebModel.SItemName(database, SQLselect1, "ItemOrder");
              
        //    }
        //}

        //protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    string SQLSelect = "Select * from EBudget_WBS where EWID=" + ViewState["EWID"].ToString();
        //    if (RadioButtonList3.SelectedValue=="2")
        //    {
              
        //        string ResourceCode = WebModel.SItemName(database, SQLSelect, "ResourceCode");
        //        SqlDataSource8.SelectCommand = "Select * from EBudget_WBS where ResourceCode='" + ResourceCode+"'";
        //    }
        //    else if(RadioButtonList3.SelectedValue=="1")
        //    {

        //        SqlDataSource8.SelectCommand = "";
        //        Repeater6.DataBind();

        //    }
        //}

        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                
                //string database = Session["DatabaseName"].ToString();
                Label LbENumber = (Label)e.Item.FindControl("LbENumber");
                Label LbEUnitPrice = (Label)e.Item.FindControl("LbEUnitPrice");
                Label LbComplex = (Label)e.Item.FindControl("LbComplex");
                
                LbENumber.Text = LbENumber.Text != "" ? LbENumber.Text : "0";
                LbEUnitPrice.Text = LbEUnitPrice.Text != "" ? LbEUnitPrice.Text : "0";
                //string SQLselect1 = "Select * from EBudget_WBS where EWID=" + LbEwid.Text + "";
                LbComplex.Text = (decimal.Parse(LbENumber.Text) * decimal.Parse(LbEUnitPrice.Text)).ToString("N0");
               

            }
        }

        //protected void ImgSubRItem_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (RadioButtonList2.SelectedValue == "1")
        //    {

        //        string SQLString = "EWID,ItemOrder,ItemName,Unit,ENumber,EUnitPrice,LastSubNumber";
        //        DataTable DataTableBox = new DataTable();
        //        string ErrorString = "";
        //        foreach (string DataName in SQLString.Split(','))
        //        {
        //            DataTableBox.Columns.Add(DataName, typeof(string));
        //        }

        //        string database = Session["DatabaseName"].ToString();
        //        //後台功能，必需要有的欄位名稱               

        //        DataRow DataTableDr;


        //        foreach (RepeaterItem item in Repeater1.Items)
        //        {
        //            DataTableDr = DataTableBox.NewRow();
        //            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //            {
        //                CheckBox CheckBox1 = item.FindControl("checkSub") as CheckBox;
        //                Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
        //                Label LbItemName = item.FindControl("LbItemName") as Label;
        //                Label LbUnit = item.FindControl("LbUnit") as Label;
        //                Label LbENum = item.FindControl("LbENum") as Label;

        //                Label LbEwid = item.FindControl("Lbwid") as Label;
        //                Label LbEPrice = item.FindControl("LbEPrice") as Label;
        //                Label LbRemain = item.FindControl("LbLastSubNumber") as Label;
        //                TextBox TxSubQuantity = item.FindControl("LbSubNum") as TextBox;
        //                string SQLselect = "Select * from EBudget_WBS where EWID=" + LbEwid.Text;
        //                string ItemKind = WebModel.SItemName(database, SQLselect, "ItemKind");
        //                if (CheckBox1.Checked)
        //                {
        //                    ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //                    LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : LbENum.Text;
        //                    TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
        //                    ErrorString += decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRemain.Text) ? "分包用量不得超過工程用量!!!\\n" : "";

        //                    bool checkEnum = checkfun.Sub_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));
        //                    if (ItemKind != "mainitem")
        //                    {

        //                        //check是否下層已有分包
        //                        if (!checkEnum)
        //                        {

        //                            if (ErrorString == "")
        //                            {
        //                                #region 內容設定
        //                                DataTableDr = DataTableBox.NewRow();

        //                                DataTableDr["EWID"] = LbEwid.Text;
        //                                DataTableDr["ItemName"] = LbItemName.Text;
        //                                DataTableDr["Unit"] = LbUnit.Text;
        //                                DataTableDr["ItemOrder"] = LbItemOrder.Text;

        //                                if (TxSubQuantity.Text.Trim() != "")
        //                                {

        //                                    DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //                                }
        //                                else
        //                                {
        //                                    TxSubQuantity.Text = "0";
        //                                    DataTableDr["ENumber"] = TxSubQuantity.Text;
        //                                }
        //                                LbRemain.Text = (decimal.Parse(LbENum.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //                                //DataTableDr["Remain"] = LbRemain.Text;
        //                                LbEPrice.Text = LbEPrice.Text != "" ? LbEPrice.Text : "0";
        //                                DataTableDr["EUnitPrice"] = LbEPrice.Text;
        //                                DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");

        //                                DataTableBox.Rows.Add(DataTableDr);
        //                                #endregion
        //                                ViewState["Datatable"] = DataTableBox;
        //                                Repeater3.DataSource = DataTableBox;
        //                                Repeater3.DataBind();
        //                            }
        //                            else
        //                            {
        //                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //                            }
        //                        }
        //                        else
        //                        {
        //                            LbRemain.Text = LbENum.Text;
        //                            CheckBox1.Checked = false;
        //                            TxSubQuantity.Text = "0";
        //                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);

        //                        }
        //                    }
        //                    else if (ItemKind == "mainitem")
        //                    {
        //                        if (!checkEnum)
        //                        {

        //                            if (ErrorString == "")
        //                            {
        //                                #region 內容設定
        //                                DataTableDr = DataTableBox.NewRow();

        //                                DataTableDr["EWID"] = LbEwid.Text;
        //                                DataTableDr["ItemName"] = LbItemName.Text;
        //                                DataTableDr["Unit"] = LbUnit.Text;
        //                                DataTableDr["ItemOrder"] = LbItemOrder.Text;

        //                                if (TxSubQuantity.Text.Trim() != "")
        //                                {

        //                                    DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //                                }
        //                                else
        //                                {
        //                                    TxSubQuantity.Text = "0";
        //                                    DataTableDr["ENumber"] = TxSubQuantity.Text;
        //                                }
        //                                LbRemain.Text = (decimal.Parse(LbENum.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //                                //DataTableDr["Remain"] = LbRemain.Text;
        //                                LbEPrice.Text = LbEPrice.Text != "" ? LbEPrice.Text : "0";
        //                                DataTableDr["EUnitPrice"] = LbEPrice.Text;
        //                                DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");

        //                                DataTableBox.Rows.Add(DataTableDr);
        //                                #endregion
        //                                ViewState["Datatable"] = DataTableBox;
        //                                Repeater3.DataSource = DataTableBox;
        //                                Repeater3.DataBind();
        //                            }

        //                        }
        //                        else
        //                        {
        //                            LbRemain.Text = LbENum.Text;
        //                            CheckBox1.Checked = false;
        //                            TxSubQuantity.Text = "0";
        //                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);

        //                        }
        //                    }


        //                }
        //                //else if (RadioButtonList2.SelectedValue == "2")
        //                //{



        //                //}
        //            }
        //        }

        //    }
        //}

        //protected void LbSubNum_TextChanged(object sender, EventArgs e)
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    foreach (RepeaterItem item in Repeater1.Items)
        //    {

        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            CheckBox CheckBox1 = item.FindControl("checkSub") as CheckBox;
        //            Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
        //            Label LbItemName = item.FindControl("LbItemName") as Label;
        //            Label LbUnit = item.FindControl("LbUnit") as Label;
        //            Label LbENum = item.FindControl("LbENum") as Label;

        //            Label LbEwid = item.FindControl("Lbwid") as Label;
        //            Label LbEPrice = item.FindControl("LbEPrice") as Label;
        //            Label LbRemain = item.FindControl("LbLastSubNumber") as Label;
        //            TextBox TxSubQuantity = item.FindControl("LbSubNum") as TextBox;
        //            string SQLselect = "Select * from EBudget_WBS where EWID=" + LbEwid.Text;
        //            string ItemKind = WebModel.SItemName(database, SQLselect, "ItemKind");
        //            if (CheckBox1.Checked)
        //            {


        //                bool checkEnum = checkfun.Sub_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));
        //                if (ItemKind == "mainitem")
        //                {

        //                    //check是否下層已有分包
        //                    TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";

        //                    if (LbENum.Text == TxSubQuantity.Text)
        //                    {
        //                        if (!checkEnum)
        //                        {
        //                            //RepeaterItem item = (RepeaterItem)check.NamingContainer;
        //                            //int index = item.ItemIndex;

        //                            //Label Lbwid = (Label)item.FindControl("Lbwid");
        //                            int[] uid = checkfun.Sort_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));


        //                            foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
        //                            {

        //                                foreach (RepeaterItem item1 in Repeater1.Items)
        //                                {
        //                                    if (item1.ItemType == ListItemType.Item || item1.ItemType == ListItemType.AlternatingItem)
        //                                    {
        //                                        Label Lbwid1 = (Label)item1.FindControl("Lbwid");
        //                                        CheckBox chb = (CheckBox)item1.FindControl("checkSub");
        //                                        Label LbENum1 = item1.FindControl("LbENum") as Label;
        //                                        TextBox TxSubQuantity1 = item1.FindControl("LbSubNum") as TextBox;
        //                                        if (chb.Checked)
        //                                        {
        //                                            TxSubQuantity1.Text = LbENum1.Text;
        //                                        }

        //                                    }
        //                                }
        //                            }


        //                        }
        //                        else
        //                        {
        //                            LbRemain.Text = "";
        //                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);


        //                        }
        //                    }

        //                    else if (decimal.Parse(LbENum.Text) < decimal.Parse(TxSubQuantity.Text))
        //                    {

        //                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]分包用量不得超過執行數量!!!');", true);

        //                    }

        //                }

        //            }

        //        }
        //    }
        //}

      
        //protected void BtnSearch_Click(object sender, EventArgs e)
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    string wbs = String.Format("{0}", Request.Form["colors"]);
        //    string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(wbs));
        //    SqlDataSource1.SelectCommand = "";
        //    string Sql = "";
        //    Sql = "SELECT * FROM EBudget_WBS  WHERE PID =" + Session["ProjectCode"].ToString() + " ";
        //    if (Session["ProjectCode"] != null)
        //    {
        //        string SelectString = "";
        //        //SelectString = (DDL_WBS.SelectedValue != "0") ? "Code like '%" + DDL_WBS.SelectedValue + "%' " + DDL_Op2.SelectedValue + "" : "";
        //        SelectString += (FdSearch != "") ? "ItemName like '%" + FdSearch + "%'  Order By order_Num" : "";
               
             
        //        if (SelectString != "")
        //        {
        //            SqlDataSource1.SelectCommand = Sql + " and " + SelectString;
        //        }
        //        else
        //        {
        //            SqlDataSource1.SelectCommand = Sql;
        //        }

        //        Sql = SqlDataSource1.SelectCommand;
        //        //GridView2.DataSource = (DataTable)Session["DataTable"];
        //        Repeater1.DataBind();
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇專案');", true);
        //    }
        //}

    }
}