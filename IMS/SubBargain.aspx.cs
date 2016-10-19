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
    public partial class SubBargain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);

            }
            else
            {

                Sql_SB.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                Sql_SB.SelectCommand = "SELECT [SBID], [PID], [SB_Name], [SB_Code], [BookInTime], [BookContractDate], [LastContractDate] FROM [SubBudgetList] WHERE [PID] =" + Session["ProjectCode"].ToString() + " ";
                Sql_Detail.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());


            }
            
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Price.Visible == true))
            {
                Pnl_Price.Visible = false;
            }
            else
            {
                Pnl_Price.Visible = true;
            }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_Contract.Visible == true))
            {
                Pnl_Contract.Visible = false;
            }
            else
            {
                Pnl_Contract.Visible = true;
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList1.SelectedIndex == 0))
            {
                TB_Bargain.Text = "";
                TB_Bargain.Visible = true;
                LB_Unit.Text = "元";
                LB_Unit.Visible = true;
            }
            else if ((RadioButtonList1.SelectedIndex == 1))
            {
                TB_Bargain.Text = "";
                TB_Bargain.Visible = true;
                LB_Unit.Text = "%";
                LB_Unit.Visible = true;
            }
            else
            {
                TB_Bargain.Visible = false;
                LB_Unit.Visible = false;
            }
        }
        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_Warranty.SelectedIndex == 1))
            {
                DDL_Warranty.Items.Clear();
                DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
                DDL_Warranty.Items.Add(new ListItem("合約規定完工日期"));
                DDL_Warranty.Items.Add(new ListItem("合約規定完工日曆天數"));
                DDL_Warranty.Items.Add(new ListItem("合約規定完工工作天數"));
                DDL_Warranty.Items.Add(new ListItem("工地通知起算日曆天數"));
                DDL_Warranty.Items.Add(new ListItem("協商完工期限"));
                DDL_Warranty.Items.Add(new ListItem("縣市政府特殊條款"));
            }
            else if ((DDL_Warranty.SelectedIndex == 2))
            {
                DDL_Warranty.Items.Clear();
                DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
                DDL_Warranty.Items.Add(new ListItem("合約規定交貨日期"));
                DDL_Warranty.Items.Add(new ListItem("合約規定交貨日曆天數"));
                DDL_Warranty.Items.Add(new ListItem("工地通知交貨起算日曆天數"));
                DDL_Warranty.Items.Add(new ListItem("協商交貨期限"));
                DDL_Warranty.Items.Add(new ListItem("另定"));
            }
            else
            {
                DDL_Warranty.Items.Clear();
                DDL_Warranty.Items.Add(new ListItem("-請先選擇合約種類-", ""));
            }

        }
        protected void Button44_Click(object sender, EventArgs e)
        {
            OpenNewWindow("BargainTable.aspx", "A");
        }
        protected void Button45_Click(object sender, EventArgs e)
        {
            Pnl_Bargain.Visible = true;
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,resize=yes,scrollbar=yes,location=center,height=800,width=2000";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void DDL_Op3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_Op3.SelectedIndex == 2))
            {
                TxDate2.Visible = true;
                TxDate2.Text = "";
            }
            else
            {
                TxDate2.Visible = false;
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubBudget.Text));

            #region 搜尋條件
            string SelectString = "";

            SelectString = (KeyWord != "") ? "SB_Name like '%" + KeyWord + "%' " : "";
            if (TxDate1.Text != "")
            {
                if (KeyWord != "" && TxDate1.Text != "")
                {
                    SelectString += DDL_Op1.SelectedValue;
                }
                if (DDL_date.SelectedValue == "BookInTime" && DDL_Op3.SelectedValue != "Between")
                {
                    SelectString += " BookInTime " + DDL_Op3.SelectedValue + " '" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "'";
                }
                else if (DDL_date.SelectedValue == "BookInTime" && DDL_Op3.SelectedValue == "Between")
                {
                    SelectString += " BookInTime " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd") + "'";

                }
                if (DDL_date.SelectedValue == "BookContractDate" && DDL_Op3.SelectedValue != "Between")
                {
                    SelectString += " BookContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "'";
                }
                else if (DDL_date.SelectedValue == "BookContractDate" && DDL_Op3.SelectedValue == "Between")
                {
                    SelectString += " BookContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd") + "'";

                }
                if (DDL_date.SelectedValue == "LastContractDate" && DDL_Op3.SelectedValue != "Between")
                {
                    SelectString += " LastContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "'";
                }
                else if (DDL_date.SelectedValue == "LastContractDate" && DDL_Op3.SelectedValue == "Between")
                {
                    SelectString += " LastContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd") + "'";

                }
            }
            else
            {
                SelectString += "";
            }
            SelectString = (SelectString.Length > 1) ? SelectString : "";
            Sql_SB.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList  ";
            Sql_SB.SelectCommand += (SelectString.Length > 1) ? "WHERE " + SelectString + " and PID = " + Session["ProjectCode"].ToString() + "" : " WHERE PID = " + Session["ProjectCode"].ToString() + "";


            #endregion

            GV_SB.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            Sql_SB.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList where pid= " + Session["ProjectCode"].ToString();
            GV_SB.DataBind();

        }

        protected void GV_SB_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GV_SB.PageSize;
            string database = Session["DatabaseName"].ToString();
           
            if (e.CommandName == "select")
            {
                string SBID = ((Label)GV_SB.Rows[ID_class].FindControl("SBID")).Text.Trim();
                //LbSB_Code1.Text = ((Label)GV_SB.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                //LbSB_Name1.Text = ((Label)GV_SB.Rows[ID_class].FindControl("SB_Name")).Text.Trim();
                Sql_Detail.SelectCommand = "SELECT a.UID, a.SBID, a.TotalPrice, a.GetNY, b.Name, a.DiscountPercent, a.DiscountTotal,a.ExpiretionDate,a.GetNY,a.FirmID FROM SubRFQ_Firm a INNER JOIN FirmM b ON a.FirmID = b.UID WHERE (a.SBID =" + SBID + ") AND (a.TotalPrice IS NOT NULL) ORDER BY a.Sort";
              
                //ViewState["SBID"] = LbSBID.Text;
            }
            if (e.CommandName == "edit")
            {
                string SBID = ((Label)GV_SB.Rows[ID_class].FindControl("SBID")).Text.Trim();
                Response.Write("<script>window.open('BargainTable.aspx?ID=" + SBID + "', 'window',config='height=1000,width=1900')</script>");
                //Response.Write("<script>window.open('AnalysisV.aspx?UId=" + UUID.Text + "','_blank')</script>");
            }
        }

        protected void GV_Firm_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GV_Firm.PageSize;
            string database = Session["DatabaseName"].ToString();

            if (e.CommandName == "select")
            {
                Pnl_Price.Visible = true;
                string SBID = ((Label)GV_Firm.Rows[ID_class].FindControl("SBID")).Text.Trim();
                LbUID.Text = ((Label)GV_Firm.Rows[ID_class].FindControl("UID")).Text.Trim();
                LbFirmID.Text = ((Label)GV_Firm.Rows[ID_class].FindControl("FirmID")).Text.Trim();
                LbTotalPrice.Text = decimal.Parse(((Label)GV_Firm.Rows[ID_class].FindControl("TotalPrice")).Text.Trim()).ToString("N0");                
                LbFirmName.Text = ((Label)GV_Firm.Rows[ID_class].FindControl("Name")).Text.Trim();
                string Get = ((Label)GV_Firm.Rows[ID_class].FindControl("GetNY")).Text.Trim();
                LbGetNY.Text = Get=="1"?"是":"否";
                LbExDate.Text = ((Label)GV_Firm.Rows[ID_class].FindControl("ExpiretionDate")).Text.Trim();
                string SQLSelect = "Select * from SubBudgetList where SBID=" + SBID;
                LbBPrice.Text = WebModel.SItemName(database, SQLSelect, "BudgetPrice") != "" ? decimal.Parse(WebModel.SItemName(database, SQLSelect, "BudgetPrice")).ToString("N0") : "0";
                //LbBPrice.Text = BPrice !=""?BPrice:"0";
                SqlDataSource1.SelectCommand = "Select * from SubBudget_Item a  left join SubRFQ_Material b on a.SB_MID=b.SB_MID where a.SBID=" + SBID + " and b.FirmID=" + LbFirmID.Text+"";
                string SQLSelect1 = "Select * from SubRFQ_Firm where SBID=" + SBID + " and FirmID=" + LbFirmID.Text;
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect1);
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        DDL_Warranty.SelectedValue = row["ContractType"].ToString() !=""?row["ContractType"].ToString():"0";
                        DDL_Garnty.SelectedValue = row["GuaranteeWay"].ToString() !=""?row["GuaranteeWay"].ToString():"0";
                        TxSubmitPercent.Text = row["SubmitPercent"].ToString();
                        TxRequestNum.Text = row["RequestNum"].ToString();
                        TxRequestDate.Text = row["RequestDate"].ToString();
                        TxPayDate.Text = row["PayDate"].ToString();
                        if (row["DurationRule"].ToString() == "-請先選擇合約種類-")
                        {
                            DDL_DurationRule.SelectedValue = "0";
                        }
                        else
                        {
                        DDL_DurationRule.SelectedValue = row["DurationRule"].ToString() !=""?row["DurationRule"].ToString():"0";
                        }
                        RadioButton1.Checked = false;
                        RadioButton2.Checked = false;
                        TxPType1.Text = "";
                        TxPType2.Text = "";
                        //RadioButton1.Checked =(row["PunishType"].ToString()) =="1"?true:false;
                        if (row["PunishType"].ToString()=="1")
                        {
                            RadioButton1.Checked = true;
                            TxPType1.Text = row["Punish"].ToString();
                        }
                        else if (row["PunishType"].ToString() == "2")
                        {

                            RadioButton2.Checked = true;
                            TxPType2.Text = row["Punish"].ToString();
                        }
                        TxWarrantyYear.Text = row["WarrantyYear"].ToString();
                        TxMaintainYear.Text = row["MaintainYear"].ToString();
                        TxReWarrantyYear.Text = row["ReWarrantyYear"].ToString();
                        TxTaxPercent.Text = row["TaxPercent"].ToString();
                        TxScope.Text = row["Scope"].ToString();
                        TxNotes.Text = row["ContractNote"].ToString();
                        TxPrepayPercent.Text = row["PrepayPercent"].ToString();
                        TxPrepayCash.Text = row["PrepayCash"].ToString();
                        TxPrepayCheck.Text = row["PrepayCheck"].ToString();
                        TxPrepayCheckDay.Text = row["PrepayCheckDay"].ToString();
                        DDL_PWanty.SelectedValue = row["PrepayGuarantee"].ToString() !=""?row["PrepayGuarantee"].ToString():"0";
                        TxFundCash.Text = row["FundCash"].ToString();
                        TxFundCheck.Text = row["FundCheck"].ToString();
                        TxFundCheckDay.Text = row["FundCheckDay"].ToString();
                        TxRetentionPercent.Text = row["RetentionPercent"].ToString();
                        TxRetentionCash.Text = row["RetentionCash"].ToString();
                        TxRetentionCheck.Text = row["RetentionCheck"].ToString();
                        TxRetentionCheckDay.Text = row["RetentionCheckDay"].ToString();
                        TxWarrantyPercent.Text = row["WarrantyPercent"].ToString();
                        TxWarrantyCash.Text = row["WarrantyCash"].ToString();
                        TxWarrantyCheck.Text = row["WarrantyCheck"].ToString();
                        TxWarrantyCheckDay.Text = row["WarrantyCheckDay"].ToString();
                        DDL_RType.SelectedValue = row["WarrantyWay"].ToString() !=""?row["WarrantyWay"].ToString():"0";

                    }
                }
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;


                Label LbQuantity = (Label)e.Item.FindControl("LbQuantity");
                Label LbBPrice = (Label)e.Item.FindControl("LbBPrice");
                Label LbBComplex = (Label)e.Item.FindControl("LbBComplex");
                Label LbDisPrice = (Label)e.Item.FindControl("LbDisPrice");
                Label LbDisComplex = (Label)e.Item.FindControl("LbDisComplex");
                LbQuantity.Text = LbQuantity.Text != "" ? LbQuantity.Text : "0";
                LbBPrice.Text = LbBPrice.Text != "" ? LbBPrice.Text : "0";
                LbBComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(LbBPrice.Text)).ToString("N0");
                LbDisPrice.Text = LbDisPrice.Text != "" ? (decimal.Parse(LbDisPrice.Text)).ToString("N0") : "0";
                LbDisComplex.Text = LbDisComplex.Text != "" ? decimal.Parse(LbDisComplex.Text).ToString("N0") : "0";

            }
        }

        protected void BtnCalSave_Click(object sender, EventArgs e)
        {
            string SQLUpdate = "";
            string SQLUpdate1 = "";
            string database = Session["DatabaseName"].ToString();

            if (RadioButtonList1.SelectedValue == "1")
            {
                LbDisPrice.Text=TB_Bargain.Text ;
                decimal DisPrice = (decimal.Parse(LbDisPrice.Text) / decimal.Parse(LbTotalPrice.Text));

                SQLUpdate = "Update SubRFQ_Firm set DiscountPercent='" + DisPrice + "',DiscountTotal='" + LbDisPrice.Text + "' where UID=" + LbUID.Text;
                  WebModel.SQLAction(database, SQLUpdate);
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {


                        Label LbSB_MID = item.FindControl("LbSB_MID") as Label;
                        Label LbSBID = item.FindControl("LbSBID") as Label;
                        Label LbBPrice = item.FindControl("LbBPrice") as Label;
                        Label LbBComplex = item.FindControl("LbBComplex") as Label;
                        Label LbDisPrice1 = item.FindControl("LbDisPrice") as Label;
                        Label LbDisComplex = item.FindControl("LbDisComplex") as Label;
                    
                         string SQLDisPrice= (decimal.Parse(LbBPrice.Text) * DisPrice).ToString();
                         string SQLDisComplex= (decimal.Parse(LbBComplex.Text) * DisPrice).ToString();
                        //string SQLUIDM = "Select * from SubRFQ_Material where SBID=" + SBID.Text + " and SB_MID=" + SB_MID.Text + " and FirmID=" + LbFirmID.Text + "";
                         LbDisPrice1.Text = decimal.Parse(SQLDisPrice).ToString("N0");
                         LbDisComplex.Text = decimal.Parse(SQLDisComplex).ToString("N0");

                        SQLUpdate1 = "Update SubRFQ_Material set DisUnitPrice='" + SQLDisPrice + "',DisComplexPrice='" + SQLDisComplex + "'  where SBID=" + LbSBID.Text + " and SB_MID=" + LbSB_MID.Text + " and FirmID=" + LbFirmID.Text + "";
                       
                        WebModel.SQLAction(database, SQLUpdate1);
                       
                    }                  
                
            }
                Response.Write("<script>alert('已存檔');</script>");
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {

                decimal SQLDisPrice1 = (decimal.Parse(TB_Bargain.Text)/100 * decimal.Parse(LbTotalPrice.Text));
                LbDisPrice.Text = SQLDisPrice1.ToString("N0");
                SQLUpdate = "Update SubRFQ_Firm set DiscountPercent='" + (decimal.Parse(TB_Bargain.Text) / 100) + "',DiscountTotal='" + SQLDisPrice1 + "' where UID=" + LbUID.Text;
                WebModel.SQLAction(database, SQLUpdate);
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        Label LbSB_MID = item.FindControl("LbSB_MID") as Label;
                        Label LbSBID = item.FindControl("LbSBID") as Label;
                        Label LbBPrice = item.FindControl("LbBPrice") as Label;
                        Label LbBComplex = item.FindControl("LbBComplex") as Label;
                        Label LbDisPrice1 = item.FindControl("LbDisPrice") as Label;
                        Label LbDisComplex = item.FindControl("LbDisComplex") as Label;

                        string SQLDisPrice= (decimal.Parse(LbBPrice.Text) * (decimal.Parse(TB_Bargain.Text)/100)).ToString();
                        string SQLDisComplex= (decimal.Parse(LbBComplex.Text) * (decimal.Parse(TB_Bargain.Text)/100)).ToString();
                        LbDisPrice1.Text = decimal.Parse(SQLDisPrice).ToString("N0");
                        LbDisComplex.Text = decimal.Parse(SQLDisComplex).ToString("N0");

                        SQLUpdate1 = "Update SubRFQ_Material set DisUnitPrice='" + SQLDisPrice + "',DisComplexPrice='" + SQLDisComplex + "' where SBID=" + LbSBID.Text + " and SB_MID=" + LbSB_MID.Text + " and FirmID=" + LbFirmID.Text + "";

                        WebModel.SQLAction(database, SQLUpdate1);
                        
                    }
                }
                Response.Write("<script>alert('已存檔');</script>");
            }
        }

        protected void TB_Bargain_TextChanged(object sender, EventArgs e)
        {
           
            if (RadioButtonList1.SelectedValue == "1")
            {
                LbDisPrice.Text = decimal.Parse(TB_Bargain.Text).ToString("N0");
                decimal DisPrice = decimal.Parse(LbDisPrice.Text) / decimal.Parse(TB_Bargain.Text);        
                
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {

                LbDisPrice.Text = TB_Bargain.Text!=""?(decimal.Parse(TB_Bargain.Text)/100 * decimal.Parse(LbTotalPrice.Text)).ToString("N0"):"";

            }
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
           
            string SQLString = "UID,ContractType,GuaranteeWay,SubmitPercent,RequestNum,RequestDate,PayDate,DurationRule,PunishType,Punish,WarrantyYear,MaintainYear,ReWarrantyYear,TaxPercent,Scope,ContractNote,PrepayPercent"+
      ",PrepayCash,PrepayCheck,PrepayCheckDay,PrepayGuarantee,FundCash,FundCheck,FundCheckDay,RetentionPercent,RetentionCash,RetentionCheck,RetentionCheckDay,WarrantyPercent,WarrantyCash,WarrantyCheck,WarrantyCheckDay,WarrantyWay";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            //string TopWBS = DDLTop.SelectedValue;
            //string Next = DDLNext.SelectedValue;
            string SubmitPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubmitPercent.Text));
            string RequestNum = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRequestNum.Text));
            string RequestDate = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRequestDate.Text));
            string PayDate = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPayDate.Text));
            string PType1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPType1.Text));
            string PType2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPType2.Text));
            string WarrantyYear = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarrantyYear.Text));
            string MaintainYear = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxMaintainYear.Text));
            string ReWarrantyYear = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxReWarrantyYear.Text));
            string TaxPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxTaxPercent.Text));
            string Scope = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxScope.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            string PrepayPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPrepayPercent.Text));
            string PrepayCash = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPrepayCash.Text));
            string PrepayCheck = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPrepayCheck.Text));
            string PrepayCheckDay = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPrepayCheckDay.Text));
            string FundCash = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFundCash.Text));
            string FundCheck = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFundCheck.Text));
            string FundCheckDay = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFundCheckDay.Text));
            string RetentionPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetentionPercent.Text));
            string RetentionCash = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetentionCash.Text));
            string RetentionCheck = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetentionCheck.Text));
            string RetentionCheckDay = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetentionCheckDay.Text));
            string WarrantyPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarrantyPercent.Text));
            string WarrantyCash = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarrantyCash.Text));
            string WarrantyCheck = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarrantyCheck.Text));
            string WarrantyCheckDay = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarrantyCheckDay.Text));

            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["UID"] = LbUID.Text;

                DataTableDr["ContractType"] = DDL_Warranty.SelectedValue;
                DataTableDr["GuaranteeWay"] = DDL_Garnty.SelectedValue;
                DataTableDr["SubmitPercent"] = SubmitPercent;
                DataTableDr["RequestNum"] =int.Parse(RequestNum);
                DataTableDr["RequestDate"] = RequestDate;
                DataTableDr["PayDate"] = PayDate;
                DataTableDr["DurationRule"] = DDL_DurationRule.SelectedValue;
                if (RadioButton1.Checked)
                {

                    DataTableDr["PunishType"] = "1";
                    DataTableDr["Punish"] = PType1;
                }
                else if (RadioButton2.Checked)
                {
                    DataTableDr["PunishType"] = "2";
                    DataTableDr["Punish"] = PType2;
                }
                DataTableDr["WarrantyYear"] = WarrantyYear!=""?decimal.Parse(WarrantyYear):0;
                DataTableDr["MaintainYear"] = MaintainYear!=""?decimal.Parse(MaintainYear):0;
                DataTableDr["ReWarrantyYear"] =ReWarrantyYear!=""?decimal.Parse(ReWarrantyYear):0;
                DataTableDr["TaxPercent"] = TaxPercent!=""?decimal.Parse(TaxPercent):0;
                DataTableDr["Scope"] = Scope;
                DataTableDr["ContractNote"] = Notes;
                DataTableDr["PrepayPercent"] = PrepayPercent!=""?decimal.Parse(PrepayPercent):0;
                DataTableDr["PrepayCash"] =PrepayCash!=""? decimal.Parse(PrepayCash):0;
                DataTableDr["PrepayCheck"] =PrepayCheck!=""? decimal.Parse(PrepayCheck):0;
                DataTableDr["PrepayCheckDay"] = PrepayCheckDay!=""?int.Parse(PrepayCheckDay):0;
                DataTableDr["PrepayGuarantee"] = DDL_PWanty.SelectedValue;
                DataTableDr["FundCash"] =FundCash!=""? decimal.Parse(FundCash):0;
                DataTableDr["FundCheck"] =FundCheck!=""? decimal.Parse(FundCheck):0;
                DataTableDr["FundCheckDay"] = FundCheckDay!=""?int.Parse(FundCheckDay):0;
                DataTableDr["RetentionPercent"] = RetentionPercent!=""?decimal.Parse(RetentionPercent):0;
                DataTableDr["RetentionCash"] = RetentionCash!=""?decimal.Parse(RetentionCash):0;
                DataTableDr["RetentionCheck"] =RetentionCheck!=""?decimal.Parse(RetentionCheck):0;
                DataTableDr["RetentionCheckDay"] =RetentionCheckDay!=""? int.Parse(RetentionCheckDay):0;
                DataTableDr["WarrantyPercent"] =WarrantyPercent!=""? decimal.Parse(WarrantyPercent):0;
                DataTableDr["WarrantyCash"] = WarrantyCash!=""?decimal.Parse(WarrantyCash):0;
                DataTableDr["WarrantyCheck"] = WarrantyCheck!=""?decimal.Parse(WarrantyCheck):0;
                DataTableDr["WarrantyCheckDay"] = WarrantyCheckDay!=""?int.Parse(WarrantyCheckDay):0;
                DataTableDr["WarrantyWay"] = DDL_RType.SelectedValue;

              
                DataTableBox.Rows.Add(DataTableDr);
            #endregion

             
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
          
           bool edit= WebModel.EditAction(database, "SubRFQ_Firm", LbUID.Text, GetDataBox());
           if (edit)
           {
               Response.Write("<script>alert('已存檔!!');</script>");
           }
           else
           {
               Response.Write("<script>alert('存檔失敗!!');</script>");
           }

        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {

        }
     
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton2.Checked = !RadioButton1.Checked;
           
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton1.Checked = !RadioButton2.Checked;
        }

        protected void GV_SB_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
                Label BookContractDate = (Label)e.Row.FindControl("BookContractDate");
                Label LastContractDate = (Label)e.Row.FindControl("LastContractDate");

                BookInTime.Text = BookInTime.Text != "" ? DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd") : "";
                BookContractDate.Text = BookContractDate.Text != "" ? DateTime.Parse(BookContractDate.Text).ToString("yyyy-MM-dd") : "";
                LastContractDate.Text = LastContractDate.Text != "" ? DateTime.Parse(LastContractDate.Text).ToString("yyyy-MM-dd") : "";
            }
        }

        protected void GV_Firm_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label TotalPrice = (Label)e.Row.FindControl("TotalPrice");
                Label DiscountTotal = (Label)e.Row.FindControl("DiscountTotal");

                TotalPrice.Text = TotalPrice.Text != "" ? decimal.Parse(TotalPrice.Text).ToString("N0") : "";
                DiscountTotal.Text = DiscountTotal.Text != "" ? decimal.Parse(DiscountTotal.Text).ToString("N0") : "";
               
            }
        }
    }
}