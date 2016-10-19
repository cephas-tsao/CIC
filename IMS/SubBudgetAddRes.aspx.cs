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
    public partial class SubBudgetAddRes : System.Web.UI.Page
    {
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
                SqlDataSource2.SelectCommand = "SELECT * FROM EBudget_WBS WHERE ResourceNY=1 and PID=" + Session["ProjectCode"].ToString();
                

            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        }
        protected void ImageButton52_Click(object sender, ImageClickEventArgs e)
        {
            Pnl_SourceList.Visible = true;
            //Pnl_SourcePack.Visible = false;
            //Pnl_SourcePack1.Visible = false;
        }

        protected void ImageButton84_Click(object sender, ImageClickEventArgs e)
        {
            //Pnl_ItemPack.Visible = true;
            //Pnl_Analysis.Visible = false;
        }
        protected void ImageButton115_Click(object sender, ImageClickEventArgs e)
        {
            Pnl_SourceList.Visible = false;
            //Pnl_SourcePack.Visible = false;
            //Pnl_SourcePack1.Visible = true;
        }
        protected void ImageButton136_Click(object sender, ImageClickEventArgs e)
        {
            Pnl_SourceList.Visible = false;
            //Pnl_SourcePack.Visible = true;
            //Pnl_SourcePack1.Visible = false;
        }
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
              
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
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("trID");
                string a = tr.ClientID;
                string b = tr.ID;
                string c = tr.UniqueID;
                tr.ID = "task-" + LbEWID.Text;
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
            BtnSaveSub.Enabled = true;
            if (e.CommandName == "SelectFList")
            {
                Repeater6.Controls.Clear();
                Pnl_SourceList.Visible = true;
                LbEwid.Text = EWID;
                //SqlDataSource8.SelectCommand = "Select * From EBudget_WBS Where EWID =" + EWID + "  Order By EWID";
                LbRiItemName1.Text = ((Label)e.Item.FindControl("LbItemName")).Text;
                LbRiUnit1.Text = ((Label)e.Item.FindControl("LbUnit")).Text;
                LbRiAmount.Text = ((Label)e.Item.FindControl("LbEAmount")).Text;
                EUnitPrice.Text = ((Label)e.Item.FindControl("LbEPrice")).Text;
                string LbResourceCode = ((Label)e.Item.FindControl("LbResourceCode")).Text;
                string SQLSelect = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "and EWID=" + LbEwid.Text;
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
                    BtnSaveSub.Enabled = false;
                }

            }
        }
        protected void BtnSaveSub_Click(object sender, EventArgs e)
        {

            if (RadioButtonList3.SelectedValue != "")
            {
                string SQLString = "EWID,ItemOrder,ItemName,Unit,ENumber,EUnitPrice,LastSubNumber";
                DataTable DataTableBox = new DataTable();
                string ErrorString = "";
                //string RiPrice = "";
                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }
                if (ViewState["Datatable"] != null)
                {
                    DataTableBox = (DataTable)ViewState["Datatable"];
                }
                string database = Session["DatabaseName"].ToString();

                //後台功能，必需要有的欄位名稱               

                DataRow DataTableDr;
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

                }
                else
                {

                    foreach (RepeaterItem item in Repeater6.Items)
                    {
                        //DataTableDr = DataTableBox.NewRow();
                        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                        {
                            CheckBox CheckBox11 = item.FindControl("CheckBox11") as CheckBox;
                            //Label LbBKID = item.FindControl("LbBKID") as Label;
                            Label LbItemOrder = item.FindControl("LbItemOrder") as Label;
                            Label LbItemName = item.FindControl("LbItemName") as Label;
                            Label LbUnit = item.FindControl("LbUnit") as Label;
                            //Label LbRiWorkRate = item.FindControl("LbRiWorkRate") as Label;
                            Label LbEwid = item.FindControl("LbEwid") as Label;
                            Label LbItemAmount = item.FindControl("LbItemAmount") as Label;
                            Label LbRemain = item.FindControl("LbRemain") as Label;
                            TextBox TxSubQuantity = item.FindControl("TxSubQuantity") as TextBox;
                            //string SQLselect="Select * from EBudget_ResourceBK where WiEWID="+LbEwid.Text+"";
                            LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : LbItemAmount.Text;
                            if (CheckBox11.Checked)
                            {
                                ErrorString += (TxSubQuantity.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
                                TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
                                ErrorString += decimal.Parse(TxSubQuantity.Text) > decimal.Parse(LbRemain.Text) ? "分包用量不得超過工程用量!!!\\n" : "";
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
                                    LbRemain.Text = (decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString("N0");
                                    //DataTableDr["Remain"] = LbRemain.Text;
                                    EUnitPrice.Text = EUnitPrice.Text != "" ? EUnitPrice.Text : "0";
                                    DataTableDr["EUnitPrice"] = EUnitPrice.Text;
                                    DataTableDr["LastSubNumber"] = (decimal.Parse(TxSubQuantity.Text) * decimal.Parse(EUnitPrice.Text)).ToString("N0");

                                    DataTableBox.Rows.Add(DataTableDr);
                                    #endregion
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                                }


                            }
                        }
                    }
                }
                ViewState["Datatable"] = DataTableBox;
                //Repeater3.DataSource = DataTableBox;
                //Repeater3.DataBind();
                Session["Datatable"] = DataTableBox;
                Pnl_SourceList.Visible = false;
                ScriptManager.RegisterStartupScript(this, typeof(string), "script", "<script type=text/javascript>parent.location.href = parent.location.href;</script>", false);
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先選擇資源分包項目!!!');", true);
            }
        }

        protected void BtnClearSubList_Click(object sender, EventArgs e)
        {
            SqlDataSource8.SelectCommand = "";
            Repeater6.DataBind();
        }
        protected void Repeater6_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                string database = Session["DatabaseName"].ToString();
                Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");
                Label LbEwid = (Label)e.Item.FindControl("LbEwid");
                Label LbItemAmount = (Label)e.Item.FindControl("LbItemAmount");
                Label LbRemain = (Label)e.Item.FindControl("LbRemain");

                TextBox TxSubQuantity = (TextBox)e.Item.FindControl("TxSubQuantity");
                TxSubQuantity.Text = TxSubQuantity.Text != "" ? TxSubQuantity.Text : "0";
                LbRemain.Text = LbRemain.Text != "" ? LbRemain.Text : (decimal.Parse(LbItemAmount.Text) - decimal.Parse(TxSubQuantity.Text)).ToString();
                string SQLselect1 = "Select * from EBudget_WBS where EWID=" + LbEwid.Text + "";

                LbItemOrder.Text = WebModel.SItemName(database, SQLselect1, "ItemOrder");

            }
        }

        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from EBudget_WBS where EWID=" + ViewState["EWID"].ToString();
            if (RadioButtonList3.SelectedValue == "2")
            {

                string ResourceCode = WebModel.SItemName(database, SQLSelect, "ResourceCode");
                SqlDataSource8.SelectCommand = "Select * from EBudget_WBS where ResourceCode='" + ResourceCode + "'";
            }
            else if (RadioButtonList3.SelectedValue == "1")
            {

                SqlDataSource8.SelectCommand = "";
                Repeater6.DataBind();

            }
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
    }
}