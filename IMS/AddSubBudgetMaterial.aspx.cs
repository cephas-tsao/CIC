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
    public partial class AddSubBudgetMaterial : System.Web.UI.Page
    {
        protected string LbLayerNum;
        int x = 0;
        bool flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

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
                SqlDataSource1.SelectCommand = "SELECT * FROM EBudget_WBS  WHERE PID =" + Session["ProjectCode"].ToString() + " Order By order_Num";//And ExecuteNY=1
                SqlDataSource2.SelectCommand = "SELECT * FROM EBudget_WBS WHERE ResourceNY=1 and PID=" + Session["ProjectCode"].ToString();


            }
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
             

          
            if (ViewState["LbLayerNum"] != null)
            {
                LbLayerNum = ViewState["LbLayerNum"].ToString();

            }
        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList2.SelectedIndex == 0))
            {
                Pnl_WBS.Visible = true;
                Pnl_Resource.Visible = false;
            }
            else if ((RadioButtonList2.SelectedIndex == 1))
            {
                Pnl_WBS.Visible = false;
                Pnl_Resource.Visible = true;
            }

        }
        protected void ImageButton25_Click(object sender, ImageClickEventArgs e)
        {
            //Pnl_Analysis.Visible = true;
        }
        protected void ImageButton52_Click(object sender, ImageClickEventArgs e)
        {
            Pnl_SourceList.Visible = true;
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
                ImageButton ImgRItem = (ImageButton)e.Item.FindControl("ImgRItem");



                //Lbwid.Text = vsDr["EWID"].ToString();


                string Order = vsDr["ItemOrder"].ToString();
                LbItemOrder.Text = vsDr["ItemOrder"].ToString();
                Lbwid.Text = vsDr["EWID"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbENum.Text = vsDr["ENumber"].ToString();
                LbEPrice.Text = vsDr["EUnitPrice"].ToString();
                LbLastSubNumber.Text = vsDr["LastSubNumber"].ToString();

                
                string layer = vsDr["LayerNum"].ToString();
                x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;//- int.Parse(layer)

                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                {
                    Literal1.Text += @"<td class='itemframe'  style='min-width:10px;border-left-style:none' ></td>";

                }

                Literal1.Text += @"<td  colspan= " + x + ">" + Order + "</td>";

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
                LbENum = LbENum != "" ? LbENum : "0";
                if (LbSubNum != "0")
                {


                    if (decimal.Parse(LbSubNum) > decimal.Parse(LbENum))
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('分包用量不得超過執行數量!!!');", true);

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
                        ViewState["Datatable"] = DataTableBox;
                        Session["itemWi"] = DataTableBox;
                        //Repeater3.DataSource = DataTableBox;
                        //Repeater3.DataBind();
                        LbLastSubNumber = LbLastSubNumber != "" ? LbLastSubNumber : LbENum;
                        decimal LSNum = decimal.Parse(LbLastSubNumber) - decimal.Parse(LbSubNum);
                        string SQLUpdate = "Update EBudget_WBS set LastSubNumber=" + LSNum + " where EWID=" + EWID;
                        bool result1 = WebModel.SQLAction(database, SQLUpdate);
                    }

                    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('分包用量不得為零!!!');", true);

                }
          
            }
        }
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
          
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                string database = Session["DatabaseName"].ToString();
                Label LbEWID = (Label)e.Item.FindControl("LbEWID");
                Label LbCode = (Label)e.Item.FindControl("LbCode");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbEAmount = (Label)e.Item.FindControl("LbEAmount");
                Label LbEPrice = (Label)e.Item.FindControl("LbEPrice");

                //ImageButton ImgRiSub = (ImageButton)e.Item.FindControl("ImgRiSub");
                ImageButton ImgPList = (ImageButton)e.Item.FindControl("ImgPList");

                LbEWID.Text = vsDr["EWID"].ToString();
                LbCode.Text = vsDr["ResourceCode"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbEPrice.Text = vsDr["EUnitPrice"].ToString();
                LbEAmount.Text = vsDr["ENumber"].ToString();

              
            }
        }
        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            decimal ENmum = 0;
            decimal EAmount = 0;
            decimal LastSubNumber = 0;
            decimal TotalLastSubNumber = 0;
            int ID_class = Convert.ToInt32(e.CommandArgument);
            string EWID = ((Label)e.Item.FindControl("LbEWID")).Text;
            ViewState["EWID"] = EWID;
            BtnAddRi.Enabled = true;
                                    

            if (e.CommandName == "SelectFList")
            {
               
                Repeater4.Controls.Clear();
                Pnl_SourceList.Visible = true;
                LbEwid.Text = EWID;
                //SqlDataSource4.SelectCommand = "Select * From EBudget_WBS Where EWID =" + EWID + "  Order By EWID";
                LbRiItemName1.Text = ((Label)e.Item.FindControl("LbItemName")).Text;
                LbRiUnit1.Text = ((Label)e.Item.FindControl("LbUnit")).Text;
                LbRiAmount.Text = ((Label)e.Item.FindControl("LbEAmount")).Text;
                EUnitPrice.Text = ((Label)e.Item.FindControl("LbEPrice")).Text;

                string LbResourceCode = ((Label)e.Item.FindControl("LbResourceCode")).Text;
                string SQLSelect = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
                DataTable DT1 = WebModel.LoadSetContentData(database, SQLSelect);


                for (int i = 0; i < DT1.Rows.Count; i++)
                {

                    string ResourceCode = DT1.Rows[i]["ResourceCode"].ToString();
                    if (ResourceCode == LbResourceCode && ResourceCode != "")
                    {

                        ENmum = DT1.Rows[i]["ENumber"].ToString() != "" ? decimal.Parse(DT1.Rows[i]["ENumber"].ToString()) : 0;
                        //Amount = Amount != "" ? Amount : "0";
                        EAmount += (ENmum);
                        LbRiAmount.Text = EAmount.ToString();
                        //ViewState[LbResourceCode.Text] = false;
                        LastSubNumber = DT1.Rows[i]["LastSubNumber"].ToString() != "" ? decimal.Parse(DT1.Rows[i]["LastSubNumber"].ToString()) : ENmum;
                        TotalLastSubNumber += LastSubNumber;
                    }

                }
                if (TotalLastSubNumber == 0)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('該工項已經分包完畢!!!');", true);
                    BtnAddRi.Enabled = false;
                }
              
            }
        }

        //protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
        //{
        //    foreach (RepeaterItem item in Repeater3.Items)
        //    {
        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {

        //            CheckBox CheckBox1 = (CheckBox)item.FindControl("CheckBox1");
        //            if (CheckBox9.Checked)
        //            {

        //                CheckBox1.Checked = true;
        //            }
        //            else
        //            {

        //                CheckBox1.Checked = false;
        //            }

        //        }

        //    }
        //}

        //protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
        //{
        //    foreach (RepeaterItem item in Repeater4.Items)
        //    {
        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {

        //            CheckBox CheckBox1 = (CheckBox)item.FindControl("CheckBox1");
        //            if (CheckBox10.Checked)
        //            {

        //                CheckBox1.Checked = true;
        //            }
        //            else
        //            {

        //                CheckBox1.Checked = false;
        //            }

        //        }

        //    }
        //}

        //protected void BtnAddWi1_Click(object sender, EventArgs e)
        //{
        //    DataTable DataTableBox = new DataTable();
        //    DataRow DataTableDr;
        //    string database = Session["DatabaseName"].ToString();
        //    string SQLString = "BKID,SB_MID,SBID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,UnitPrice,DelTemp,AddTemp";

        //    string ErrorString = "";
        //    foreach (string DataName in SQLString.Split(','))
        //    {
        //        DataTableBox.Columns.Add(DataName, typeof(string));
        //    }
        //    foreach (RepeaterItem item in Repeater3.Items)
        //    {
        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {

        //            CheckBox CheckBox1 = (CheckBox)item.FindControl("CheckBox1");

        //            if (CheckBox1.Checked)
        //            {
        //                Label LbBKID = (Label)item.FindControl("LbBKID");
        //                Label LbRiItemKind = (Label)item.FindControl("LbRiItemKind");
        //                Label LbRiItemName = (Label)item.FindControl("LbRiItemName");
        //                Label LbRiUnit = (Label)item.FindControl("LbRiUnit");
        //                Label LbRiWorkRate = (Label)item.FindControl("LbRiWorkRate");
        //                Label LbRiPrice = (Label)item.FindControl("LbRiPrice");
        //                Label LbRiRemain = (Label)item.FindControl("LbRiRemain");
        //                Label LbRiQuantity = (Label)item.FindControl("LbRiQuantity");
        //                TextBox TxSubQuantity = (TextBox)item.FindControl("TxSubQuantity");
        //                if (TxSubQuantity.Text=="")
        //                {
        //                    Response.Write("<script>alert('請輸入分包用量');</script>");

        //                }
        //             else  if (decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRiRemain.Text))
        //                {

        //                    Response.Write("<script>alert('分包用量不得大於剩餘用量');</script>");
        //                }
        //                else
        //                {
                           

        //                    ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //                    //後台功能，必需要有的欄位名稱               

        //                    DataTableDr = DataTableBox.NewRow();
        //                    if (ErrorString == "")
        //                    {
        //                        #region 內容設定
        //                        string SQLSlect = "Select * from EBudget_ResourceBK where BKID=" + LbBKID.Text;
        //                        //string RiUpperBKID = WebModel.SItemName(database, SQLSlect, "RiUpperBKID");
        //                        //int[] num = GetWiRiTable.GetParentID(database, Session["ProjectCode"].ToString(), int.Parse(RiUpperBKID));

        //                        DataTableDr["BKID"] = LbBKID.Text;
        //                        DataTableDr["ItemName"] = LbRiItemName.Text;
        //                        DataTableDr["Unit"] = LbRiUnit.Text;
        //                        DataTableDr["BelongItem"] = LbWItemName.Text;
        //                        DataTableDr["SCNumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //                        DataTableDr["UnitPrice"] = LbRiPrice.Text;
        //                        //DataTableDr["Remain"] = decimal.Parse(LbLastAmount.Text) - decimal.Parse(TxSubQuantity.Text);
        //                        //DataTableDr["WiComplex"] = (decimal.Parse(LbWQuantity1.Text) * decimal.Parse(LbWPrice1.Text)).ToString("N0");

        //                        DataTableBox.Rows.Add(DataTableDr);
        //                        #endregion
        //                        Session["itemWi"] = DataTableBox;
        //                    }
        //                    else
        //                    {

        //                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //                    }
                       

        //                }
        //            }


        //        }

        //    }
        //    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        //}

        //protected void BtnClearWi_Click(object sender, EventArgs e)
        //{
        //    LbWItemName1.Text = "";
        //    LbWUnit1.Text = "";
        //    LbLastAmount.Text = "";
        //    LbWQuantity1.Text = "";
        //    LbWPrice1.Text = "";
        //    TxSubQuantity.Text = "";
        //    //SqlDataSource3.SelectCommand = "";
        //    //Repeater3.DataBind();
        //}
        //取得分包預算內容
        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from EBudget_WBS where EWID=" + ViewState["EWID"].ToString();
            if (RadioButtonList3.SelectedValue == "2")
            {

                string ResourceCode = WebModel.SItemName(database, SQLSelect, "ResourceCode");
                SqlDataSource4.SelectCommand = "Select * from EBudget_WBS where ResourceCode='" + ResourceCode + "'";
            }
            else if (RadioButtonList3.SelectedValue == "1")
            {

                SqlDataSource4.SelectCommand = SQLSelect;

            }
        }
        protected void BtnAddRi_Click(object sender, EventArgs e)
        {
               if (RadioButtonList3.SelectedValue != "")
            {
            DataTable DataTableBox = new DataTable();
            DataRow DataTableDr;
            string database = Session["DatabaseName"].ToString();
            //string SQLString = "SB_MID,SBID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,UnitPrice,DelTemp,AddTemp";
            string SQLString = "EWID,ItemOrder,ItemName,Unit,ENumber,EUnitPrice,LastSubNumber";
            string ErrorString = "";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            if (RadioButtonList3.SelectedValue == "1")
            {
                #region 內容設定
                DataTableDr = DataTableBox.NewRow();

                DataTableDr["EWID"] = LbEwid.Text;
                DataTableDr["ItemName"] = LbRiItemName1.Text;
                DataTableDr["Unit"] = LbRiUnit1.Text;
                DataTableDr["ItemOrder"] = "全工項";

                if (LbRiAmount.Text.Trim() != "")
                {

                    DataTableDr["ENumber"] = decimal.Parse(LbRiAmount.Text).ToString("N0");
                }
                else
                {
                    LbRiAmount.Text = "0";
                    DataTableDr["ENumber"] = LbRiAmount.Text;
                }
                //LbRemain.Text = (decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
                //DataTableDr["Remain"] = LbRemain.Text;
                EUnitPrice.Text = EUnitPrice.Text != "" ? EUnitPrice.Text : "0";
                DataTableDr["EUnitPrice"] = EUnitPrice.Text;
                DataTableDr["LastSubNumber"] = (decimal.Parse(LbRiAmount.Text) * decimal.Parse(EUnitPrice.Text)).ToString("N0");

                DataTableBox.Rows.Add(DataTableDr);
                #endregion
                Session["itemRi"] = DataTableBox;
            }
            else
            {
                foreach (RepeaterItem item in Repeater4.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        CheckBox CheckBox1 = (CheckBox)item.FindControl("CheckBox1");

                        if (CheckBox1.Checked)
                        {
                            //Label LbBKID = (Label)item.FindControl("LbBKID");
                            Label LbItemOrder = (Label)item.FindControl("LbItemOrder");
                            Label LbItemName = (Label)item.FindControl("LbItemName");
                            Label LbUnit = (Label)item.FindControl("LbUnit");
                            Label LbItemAmount = (Label)item.FindControl("LbItemAmount");
                            Label LbRemain = (Label)item.FindControl("LbRemain");
                            LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : "0";
                            TextBox TxSubQuantity = (TextBox)item.FindControl("TxSubQuantity");
                            if (TxSubQuantity.Text == "")
                            {
                                Response.Write("<script>alert('請輸入分包用量');</script>");

                            }
                            else if (decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbItemAmount.Text) - decimal.Parse(LbRemain.Text))
                            {

                                Response.Write("<script>alert('分包用量不得大於剩餘用量');</script>");
                            }
                            else
                            {


                                ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
                                //後台功能，必需要有的欄位名稱               

                                DataTableDr = DataTableBox.NewRow();
                                if (ErrorString == "")
                                {
                                    #region 內容設定
                                    //string SQLSlect = "Select * from EBudget_ResourceBK where BKID=" + LbBKID.Text;


                                    //DataTableDr["BKID"] = LbBKID.Text;
                                    DataTableDr["ItemName"] = LbItemName.Text;
                                    DataTableDr["Unit"] = LbUnit.Text;
                                    DataTableDr["ItemOrder"] = LbRiItemName1.Text;
                                    DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
                                    DataTableDr["EUnitPrice"] = EUnitPrice.Text;

                                    DataTableBox.Rows.Add(DataTableDr);
                                    #endregion
                                    Session["itemRi"] = DataTableBox;
                                }
                                else
                                {

                                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                                }
                            }
                        }
                    }
                }
            }
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
            }
               else
               {

                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先選擇資源分包項目!!!');", true);
               }
        }

        protected void BtnClearRi1_Click(object sender, EventArgs e)
        {
            LbRiItemName1.Text = "";
            LbRiUnit1.Text = "";
            LbRiAmount.Text = "";
            EUnitPrice.Text = "";
         
            SqlDataSource4.SelectCommand = "";
            Repeater4.DataBind();
        }
        //protected void TxSubQuantity_TextChanged(object sender, EventArgs e)
        //{
        //    LbLastAmount.Text = (decimal.Parse(LbLastAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
        //}
        //protected void BtnSaveWi_Click(object sender, EventArgs e)
        //{

        //    //GetDataBox();
        //    if (decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbWQuantity1.Text))
        //    {

        //        Response.Write("<script>alert('分包用量不得大於剩餘用量');</script>");
        //    }
        //    else
        //    {
        //    Session["Dtvs1"] = GetDataBox1();
        //    //Repeater3.DataSource = ViewState["items"];
        //    //Repeater3.DataBind();
        //    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        //    }
        //}
        //protected DataTable GetDataBox1()
        //{
        //    string database = Session["DatabaseName"].ToString();
        //    string SQLString = "BKID,SB_MID,SBID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,UnitPrice,DelTemp,AddTemp";
        //    DataTable DataTableBox = new DataTable();
        //    string ErrorString = "";
        //    foreach (string DataName in SQLString.Split(','))
        //    {
        //        DataTableBox.Columns.Add(DataName, typeof(string));
        //    }

        //    ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
        //    //後台功能，必需要有的欄位名稱               

        //    DataRow DataTableDr = DataTableBox.NewRow();
        //    if (ErrorString == "")
        //    {
        //        #region 內容設定
        //        string SQLSlect = "Select * from EBudget_ResourceBK where BKID=" + LbBKID.Text;
        //        string RiUpperBKID = WebModel.SItemName(database, SQLSlect, "RiUpperBKID");
        //        int[] num = GetWiRiTable.GetParentID(database, Session["ProjectCode"].ToString(), int.Parse(RiUpperBKID));

        //        DataTableDr["BKID"] = LbBKID.Text;
        //        DataTableDr["ItemName"] = LbWItemName1.Text;
        //        DataTableDr["Unit"] = LbWUnit1.Text;
        //        DataTableDr["BelongItem"] = "全工項分包";
        //        DataTableDr["SCNumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
        //        DataTableDr["UnitPrice"] = LbWPrice1.Text;
        //        //DataTableDr["Remain"] = decimal.Parse(LbLastAmount.Text) - decimal.Parse(TxSubQuantity.Text);
        //        //DataTableDr["WiComplex"] = (decimal.Parse(LbWQuantity1.Text) * decimal.Parse(LbWPrice1.Text)).ToString("N0");

        //        DataTableBox.Rows.Add(DataTableDr);
        //        #endregion
        //        ViewState["items"] = DataTableBox;
        //    }
        //    else
        //    {

        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //    }
        //    return DataTableBox;


        //}
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
            return DataTableBox;
        }
        //protected void BtnRiSub_Click(object sender, EventArgs e)
        //{
        //    //string SQLString = "BKID,WiEWID,WiName,WiUnit,BWI,WiQuantity,WiPrice,WiComplex,ItemAmount,Remain";
        //    string SQLString = "BKID,SB_MID,SBID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,UnitPrice,DelTemp,AddTemp";
        //    DataTable DataTableBox = new DataTable();

        //    foreach (string DataName in SQLString.Split(','))
        //    {
        //        DataTableBox.Columns.Add(DataName, typeof(string));
        //    }


        //    //後台功能，必需要有的欄位名稱               

        //    DataRow DataTableDr;
        //    //foreach (RepeaterItem item in Repeater5.Items)
        //    //{
        //        DataTableDr = DataTableBox.NewRow();
        //        //if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        //{

        //            //Label LbBKID = item.FindControl("LbBKID") as Label;
        //            //Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
        //            //Label LbItemName = item.FindControl("LbItemName") as Label;
        //            //Label LbUnit = item.FindControl("LbUnit") as Label;
        //            //Label LbRiPrice = item.FindControl("LbRiPrice") as Label;
        //            //Label LbItemAmount = item.FindControl("LbItemAmount") as Label;
        //            //Label LbRemain = item.FindControl("LbRemain") as Label;

        //            DataTableDr["BKID"] = LbBKID.Text;
        //            DataTableDr["ItemName"] = LbRiItemname.Text;
        //            DataTableDr["Unit"] = LbRiUnit.Text;
        //            DataTableDr["BelongItem"] = "全資源分包";
        //            DataTableDr["SCNumber"] = LbRemain.Text !=""?decimal.Parse(LbRemain.Text).ToString("N0"):"0";

        //            DataTableDr["UnitPrice"] = LbRiPrice.Text !=""?LbRiPrice.Text:"0";
                 
        //            DataTableBox.Rows.Add(DataTableDr);
                  
        //    //    }
        //    //}
        //    Session["itemRiAll"] = DataTableBox;
          
        //    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
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

        //protected void BtnClearWi1_Click(object sender, EventArgs e)
        //{
        //    LbWItemName.Text = "";
        //    LbWUnit.Text = "";
        //    LbAnalyst.Text = "";
        //    LbWQuantity.Text = "";
        //    LbWPrice.Text = "";
        //    TextBox16.Text = "";
        //    SqlDataSource3.SelectCommand = "";
        //    Repeater3.DataBind();
        //}

        protected void BtnClearRi_Click(object sender, EventArgs e)
        {
            LbRiItemName1.Text = "";
            LbRiUnit1.Text = "";
            LbRiAmount.Text = "";
            EUnitPrice.Text = "";
            SqlDataSource4.SelectCommand = "";
            Repeater4.DataBind();
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        }
    }
}