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
    public partial class SubBudgetAddWBS : System.Web.UI.Page
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
             

            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        

            if (ViewState["LbLayerNum"] != null)
            {
                LbLayerNum = ViewState["LbLayerNum"].ToString();
            }
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
                LbItemOrder.Text = vsDr["ItemOrder"].ToString();
                Lbwid.Text = vsDr["EWID"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbENum.Text = vsDr["LastENumber"].ToString() != "" ? vsDr["LastENumber"].ToString() : "0";
                LbEPrice.Text = vsDr["EUnitPrice"].ToString() != "" ? vsDr["EUnitPrice"].ToString() : "0";

                LbLastSubNumber.Text = vsDr["LastSubNumber"].ToString() != "" ? vsDr["LastSubNumber"].ToString() : vsDr["LastENumber"].ToString();
                //LbRiUpperBKID.Text = vsDr["RiUpperBKID"].ToString();
                if (LbENum.Text == "")
                {
                    LbENum.Text = vsDr["ENumber"].ToString();

                }
                if (vsDr["ItemKind"].ToString() == "mainitem" && decimal.Parse(LbENum.Text) == 0)
                {
                    LbENum.Text = "1";
                    LbLastSubNumber.Text = vsDr["LastSubNumber"].ToString() != "" ? vsDr["LastSubNumber"].ToString() : "1";
                }
             

                string layer = vsDr["LayerNum"].ToString() != "" ? vsDr["LayerNum"].ToString() : "0";
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
                  
                    //Repeater3.DataSource = DataTableBox;
                    //Repeater3.DataBind();
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
        protected void check_CheckedChanged(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();


            CheckBox check = (CheckBox)sender;


            RepeaterItem item = (RepeaterItem)check.NamingContainer;
            int index = item.ItemIndex;

            Label Lbwid = (Label)item.FindControl("Lbwid");
            int[] uid = checkfun.Sort_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(Lbwid.Text));


            foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
            {

                foreach (RepeaterItem item1 in Repeater1.Items)
                {
                    if (item1.ItemType == ListItemType.Item || item1.ItemType == ListItemType.AlternatingItem)
                    {
                        Label Lbwid1 = (Label)item1.FindControl("Lbwid");
                        CheckBox chb = (CheckBox)item1.FindControl("checkSub");
                        if (check.Checked == true)
                        {
                            if (Lbwid1.Text == uuu.ToString())
                            {
                                chb.Checked = true;
                            }
                        }
                        else if (check.Checked == false)
                            if (Lbwid1.Text == uuu.ToString())
                            {
                                chb.Checked = false;

                            }
                    }
                }
            }


        }
        protected void ImgSubRItem_Click(object sender, ImageClickEventArgs e)
        {
            //if (RadioButtonList2.SelectedValue == "1")
            //{

                string SQLString = "EWID,ItemOrder,ItemName,Unit,ENumber,EUnitPrice,LastSubNumber";
                DataTable DataTableBox = new DataTable();
                string ErrorString = "";
                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                string database = Session["DatabaseName"].ToString();
                //後台功能，必需要有的欄位名稱               

                DataRow DataTableDr;


                foreach (RepeaterItem item in Repeater1.Items)
                {
                    DataTableDr = DataTableBox.NewRow();
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        CheckBox CheckBox1 = item.FindControl("checkSub") as CheckBox;
                        Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
                        Label LbItemName = item.FindControl("LbItemName") as Label;
                        Label LbUnit = item.FindControl("LbUnit") as Label;
                        Label LbENum = item.FindControl("LbENum") as Label;

                        Label LbEwid = item.FindControl("Lbwid") as Label;
                        Label LbEPrice = item.FindControl("LbEPrice") as Label;
                        Label LbRemain = item.FindControl("LbLastSubNumber") as Label;
                        TextBox TxSubQuantity = item.FindControl("LbSubNum") as TextBox;
                        string SQLselect = "Select * from EBudget_WBS where EWID=" + LbEwid.Text;
                        string ItemKind = WebModel.SItemName(database, SQLselect, "ItemKind");
                        if (CheckBox1.Checked)
                        {
                            ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
                            LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : LbENum.Text;
                            TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
                            ErrorString += decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRemain.Text) ? "分包用量不得超過工程用量!!!\\n" : "";

                            bool checkEnum = checkfun.Sub_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));
                            if (ItemKind != "mainitem")
                            {

                                //check是否下層已有分包
                                if (!checkEnum)
                                {

                                    if (ErrorString == "")
                                    {
                                        #region 內容設定
                                        DataTableDr = DataTableBox.NewRow();

                                        DataTableDr["EWID"] = LbEwid.Text;
                                        DataTableDr["ItemName"] = LbItemName.Text;
                                        DataTableDr["Unit"] = LbUnit.Text;
                                        DataTableDr["ItemOrder"] = LbItemOrder.Text;

                                        if (TxSubQuantity.Text.Trim() != "")
                                        {

                                            DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
                                        }
                                        else
                                        {
                                            TxSubQuantity.Text = "0";
                                            DataTableDr["ENumber"] = TxSubQuantity.Text;
                                        }
                                        LbRemain.Text = (decimal.Parse(LbENum.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
                                        //DataTableDr["Remain"] = LbRemain.Text;
                                        LbEPrice.Text = LbEPrice.Text != "" ? LbEPrice.Text : "0";
                                        DataTableDr["EUnitPrice"] = LbEPrice.Text;
                                        DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");

                                        DataTableBox.Rows.Add(DataTableDr);
                                        #endregion
                                        ViewState["Datatable"] = DataTableBox;
                                        Session["Datatable"] = DataTableBox;
                                        //Repeater3.DataSource = DataTableBox;
                                        //Repeater3.DataBind();
                                        ScriptManager.RegisterStartupScript(this, typeof(string), "script","<script type=text/javascript>parent.location.href = parent.location.href;</script>", false);
                                        //Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                                    }
                                }
                                else
                                {
                                    LbRemain.Text = LbENum.Text;
                                    CheckBox1.Checked = false;
                                    TxSubQuantity.Text = "0";
                                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);

                                }
                            }
                            else if (ItemKind == "mainitem")
                            {
                                if (!checkEnum)
                                {

                                    if (ErrorString == "")
                                    {
                                        #region 內容設定
                                        DataTableDr = DataTableBox.NewRow();

                                        DataTableDr["EWID"] = LbEwid.Text;
                                        DataTableDr["ItemName"] = LbItemName.Text;
                                        DataTableDr["Unit"] = LbUnit.Text;
                                        DataTableDr["ItemOrder"] = LbItemOrder.Text;

                                        if (TxSubQuantity.Text.Trim() != "")
                                        {

                                            DataTableDr["ENumber"] = decimal.Parse(TxSubQuantity.Text).ToString("N0");
                                        }
                                        else
                                        {
                                            TxSubQuantity.Text = "0";
                                            DataTableDr["ENumber"] = TxSubQuantity.Text;
                                        }
                                        LbRemain.Text = (decimal.Parse(LbENum.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
                                        //DataTableDr["Remain"] = LbRemain.Text;
                                        LbEPrice.Text = LbEPrice.Text != "" ? LbEPrice.Text : "0";
                                        DataTableDr["EUnitPrice"] = LbEPrice.Text;
                                        DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");

                                        DataTableBox.Rows.Add(DataTableDr);
                                        #endregion
                                        ViewState["Datatable"] = DataTableBox;
                                        //Repeater3.DataSource = DataTableBox;
                                        //Repeater3.DataBind();
                                        Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
                                    }

                                }
                                else
                                {
                                    LbRemain.Text = LbENum.Text;
                                    CheckBox1.Checked = false;
                                    TxSubQuantity.Text = "0";
                                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);

                                }
                            }


                        }
                        //else if (RadioButtonList2.SelectedValue == "2")
                        //{



                        //}
                    }
                }

             //}
        }
        protected void LbSubNum_TextChanged(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            foreach (RepeaterItem item in Repeater1.Items)
            {

                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox CheckBox1 = item.FindControl("checkSub") as CheckBox;
                    Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
                    Label LbItemName = item.FindControl("LbItemName") as Label;
                    Label LbUnit = item.FindControl("LbUnit") as Label;
                    Label LbENum = item.FindControl("LbENum") as Label;

                    Label LbEwid = item.FindControl("Lbwid") as Label;
                    Label LbEPrice = item.FindControl("LbEPrice") as Label;
                    Label LbRemain = item.FindControl("LbLastSubNumber") as Label;
                    TextBox TxSubQuantity = item.FindControl("LbSubNum") as TextBox;
                    string SQLselect = "Select * from EBudget_WBS where EWID=" + LbEwid.Text;
                    string ItemKind = WebModel.SItemName(database, SQLselect, "ItemKind");
                    if (CheckBox1.Checked)
                    {


                        bool checkEnum = checkfun.Sub_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));
                        if (ItemKind == "mainitem")
                        {

                            //check是否下層已有分包
                            TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";

                            if (LbENum.Text == TxSubQuantity.Text)
                            {
                                if (!checkEnum)
                                {
                                    //RepeaterItem item = (RepeaterItem)check.NamingContainer;
                                    //int index = item.ItemIndex;

                                    //Label Lbwid = (Label)item.FindControl("Lbwid");
                                    int[] uid = checkfun.Sort_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(LbEwid.Text));


                                    foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                                    {

                                        foreach (RepeaterItem item1 in Repeater1.Items)
                                        {
                                            if (item1.ItemType == ListItemType.Item || item1.ItemType == ListItemType.AlternatingItem)
                                            {
                                                Label Lbwid1 = (Label)item1.FindControl("Lbwid");
                                                CheckBox chb = (CheckBox)item1.FindControl("checkSub");
                                                Label LbENum1 = item1.FindControl("LbENum") as Label;
                                                TextBox TxSubQuantity1 = item1.FindControl("LbSubNum") as TextBox;
                                                if (chb.Checked)
                                                {
                                                    TxSubQuantity1.Text = LbENum1.Text;
                                                }

                                            }
                                        }
                                    }


                                }
                                else
                                {
                                    LbRemain.Text = "";
                                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]已有分包，不能整包分包!!!');", true);


                                }
                            }

                            else if (decimal.Parse(LbENum.Text) < decimal.Parse(TxSubQuantity.Text))
                            {

                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('資源項目[" + LbItemName.Text + "]分包用量不得超過執行數量!!!');", true);

                            }

                        }

                    }

                }
            }
        }
   }
}