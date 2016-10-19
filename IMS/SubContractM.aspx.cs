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
    public partial class SubContractM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                SqlDataSource1.SelectCommand = "SELECT * FROM SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE SubContract_Main.PID =" + Session["ProjectCode"].ToString();

            }
       
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlDataSource1.SelectCommand = "SELECT SubContract_Main.SC_Code AS 分包合約編號, SubContract_Main.SC_Name AS 分包合約名稱, SubContract_Main.TotalPrice AS 分包合約總價, SubContract_Main.BookInTime AS 預定進場時間, FirmM.Name AS 得標廠商名稱 FROM SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE (SubContract_Main.PID = @PID)";
                //SqlDataSource1.SelectCommand = "SELECT * FROM SubBudgetList a INNER JOIN SubRFQ_Firm b ON a.SBID = b.SBID AND a.GetFirmID = b.FirmID INNER JOIN FirmM ON b.FirmID = FirmM.UID WHERE (a.GetFirmID <>0) and (a.SC_Code IS NULL) AND a.PID=" + Session["ProjectCode"].ToString();
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
           
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_main.Visible == true))
            {
                Pnl_main.Visible = false;
            }
            else
            {
                Pnl_main.Visible = true;
            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if ((Pnl_pay.Visible == true))
            {
                Pnl_pay.Visible = false;
            }
            else
            {
                Pnl_pay.Visible = true;
            }
        }
        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_ContractType.SelectedItem.Text == "其他"))
            {
                TextBox84.Visible = true;
                TextBox84.Text = "";
            }
            else
            {
                TextBox84.Visible = false;
            }
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if ((Pnl_file.Visible == true))
            {
                Pnl_file.Visible = false;
            }
            else
            {
                Pnl_file.Visible = true;
            }
        }
        protected void Button42_Click(object sender, EventArgs e)
        {
            Pnl_Contract.Visible = true;
        }

        protected void DropDownList9_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if ((DDL_ContractType.SelectedValue == "工程合約"))
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
            else if ((DDL_ContractType.SelectedValue == "買賣合約"))
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
        void Warranty()
        {
            DDL_Warranty.Items.Clear();
            DDL_Warranty.Items.Add(new ListItem("-請選擇-", ""));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工日期"));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("合約規定完工工作天數"));
            DDL_Warranty.Items.Add(new ListItem("工地通知起算日曆天數"));
            DDL_Warranty.Items.Add(new ListItem("協商完工期限"));
            DDL_Warranty.Items.Add(new ListItem("縣市政府特殊條款"));
            DDL_Warranty.SelectedIndex = 2;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubBudget.Text));

            #region 搜尋條件
            string SelectString = "";

            SelectString = (KeyWord != "") ? "SC_Name like '%" + KeyWord + "%' " : "";
            //if (TxDate1.Text != "")
            //{
            if (KeyWord != "" && DDL_Firm.SelectedValue != "0")
            {
                SelectString += DDL_Op1.SelectedValue;
            }
            if (DDL_Firm.SelectedValue != "0")
            {
                SelectString += " FirmID=" + DDL_Firm.SelectedValue;
            }

            SelectString = (SelectString.Length > 1) ? SelectString : "";
            //SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList  ";
            SqlDataSource1.SelectCommand += (SelectString.Length > 1) ? " and " + SelectString + " and SubContract_Main.pid=" + Session["ProjectCode"].ToString() : "";


            #endregion

            GridView1.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            string database = Session["DatabaseName"].ToString();

            if (e.CommandName == "select")
            {
               SCID.Text = ((Label)GridView1.Rows[ID_class].FindControl("SCID")).Text.Trim();
                LbGetFirm.Text = ((Label)GridView1.Rows[ID_class].FindControl("Name")).Text.Trim();            
                //TxSubNum.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                TxSubName.Text = ((Label)GridView1.Rows[ID_class].FindControl("SC_Name")).Text.Trim();              
                LbBookInTime.Text = ((Label)GridView1.Rows[ID_class].FindControl("BookInTime")).Text.Trim();
                TxBookInTime.Text = ((Label)GridView1.Rows[ID_class].FindControl("BookInTime")).Text.Trim();
                SqlDataSource3.SelectCommand="SELECT * FROM [SubContract_File] WHERE [SCID] = "+SCID.Text;
                string SQLSelect = "Select * from SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE SubContract_Main.SCID =" + SCID.Text;
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        TxSubNum.Text = row["SC_Code"].ToString();
                        //DDL_ContractType.AutoPostBack = true;
                        //this.DDL_ContractType.SelectedIndexChanged += new EventHandler(DropDownList9_SelectedIndexChanged1);
                        DDL_ContractType.SelectedValue = row["ContractType"].ToString() !=""?row["ContractType"].ToString():"0";
                        DropDownList9_SelectedIndexChanged1(this, null);
                        DDL_GuaranteeWay.SelectedValue = row["GuaranteeWay"].ToString()!=""?row["GuaranteeWay"].ToString():"0";
                        TxSubmitPercent.Text = row["SubmitPercent"].ToString() !=""?decimal.Parse(row["SubmitPercent"].ToString()).ToString("N0"):"";
                        TxRequestNum.Text = row["RequestNum"].ToString();
                        TxRequestDate.Text = row["RequestDate"].ToString();
                        TxPayDate.Text = row["PayDate"].ToString();
                        DDL_Warranty.SelectedValue = row["DurationRule"].ToString();
                        if (row["PunishType"].ToString() == "千分之")
                        {
                            RadioButton1.Checked = true;
                            TxPType1.Text = row["Punish"].ToString();
                        }
                        else if (row["PunishType"].ToString() == "一天")
                        {
                            RadioButton2.Checked = true;
                            TxPType2.Text = row["Punish"].ToString();
                        }
                        TxBookInTime.Text = row["BookInTime"].ToString() !=""? DateTime.Parse(row["BookInTime"].ToString()).ToString("yyyy-MM-dd"):"";
                        TxWarrantyYear.Text = row["WarrantyYear"].ToString() !=""?decimal.Parse(row["WarrantyYear"].ToString()).ToString("N0"):"";
                        TxScope.Text = row["Scope"].ToString();
                        TxTaxPercent.Text = row["TaxPercent"].ToString() !=""?decimal.Parse(row["TaxPercent"].ToString()).ToString("N0"):"";
                        TxContractNote.Text = row["ContractNote"].ToString();
                        TxPrepayPercent.Text =row["PrepayPercent"].ToString()!=""?decimal.Parse(row["PrepayPercent"].ToString()).ToString("N0"):"";
                        TxPrepayCash.Text = row["PrepayCash"].ToString() !=""?decimal.Parse(row["PrepayCash"].ToString()).ToString("N0"):"";
                        TxPrepayCheck.Text = row["PrepayCheck"].ToString();
                        TxPrepayCheckDay.Text = row["PrepayCheckDay"].ToString() !=""?decimal.Parse(row["PrepayCheckDay"].ToString()).ToString("N0"):"";
                        DDL_PrepayGuarantee.SelectedValue = row["PrepayGuarantee"].ToString() !=""?row["PrepayGuarantee"].ToString():"0";
                        TxFundCash.Text = row["FundCash"].ToString() !=""?decimal.Parse(row["FundCash"].ToString()).ToString("N0"):"";
                        TxFundCheck.Text = row["FundCheck"].ToString();
                        TxFundCheckDay.Text = row["FundCheckDay"].ToString();
                        TxRetentionPercent.Text = row["RetentionPercent"].ToString() !=""?decimal.Parse(row["RetentionPercent"].ToString()).ToString("N0"):"";
                        TxRetentionCash.Text = row["RetentionCash"].ToString() !=""?decimal.Parse(row["RetentionCash"].ToString()).ToString("N0"):"";
                        TxRetentionCheck.Text = row["RetentionCheck"].ToString();
                        TxRetentionCheckDay.Text = row["RetentionCheckDay"].ToString();
                        TxWarrantyPercent.Text = row["WarrantyPercent"].ToString() !=""?decimal.Parse(row["WarrantyPercent"].ToString()).ToString("N0"):"";
                        TxWarrantyCash.Text = row["WarrantyCash"].ToString() !=""?decimal.Parse(row["WarrantyCash"].ToString()).ToString("N0"):"";
                        TxWarrantyCheck.Text = row["WarrantyCheck"].ToString();
                        TxWarrantyCheckDay.Text = row["WarrantyCheckDay"].ToString();
                        DDL_WarrantyWay.SelectedValue = row["WarrantyWay"].ToString() !=""?row["WarrantyWay"].ToString():"0";
                    }


                }

            }
        }
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton2.Checked = !RadioButton1.Checked;

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton1.Checked = !RadioButton2.Checked;
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView5.PageSize;
            int UID = (int)GridView5.DataKeys[ID_class].Value;

            Label Path = (Label)GridView5.Rows[ID_class].FindControl("Path");
            Label Name = (Label)GridView5.Rows[ID_class].FindControl("Name");
            Label SCID = (Label)GridView5.Rows[ID_class].FindControl("SCID");
            if (e.CommandName == "DownLoad")
            {

                if (Path != null && Path.Text != "")
                {
                    string[] name = Path.Text.Split('_');
                    string realname = name[1];
                    Response.AppendHeader("content-disposition", "attachment; filename=" + realname);
                    Response.TransmitFile(Path.Text);
                    Response.End();
                }
            }
            if (e.CommandName == "Delete")
            {

                SqlDataSource3.DeleteCommand = "Delete  From  [SubContract_File] where UID=" + UID;
                GridView5.DataBind();
                Response.Write("<script>alert('刪除成功');</script>");
            }
        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            String savepath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
            string ProjectCode = Session["ProjectCode"].ToString();
            //string SCID = SCID.Text;
            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;

                fileName = DateTime.Now.ToString("yyyy-MM-dd-HHmmss") + "_" + fileName;
                string Name = AttachName.Text;
                savepath += fileName;
                string kind = DDL_kind.SelectedItem.Text;
                FileUpload1.SaveAs(savepath);
                // FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath(savepath)); //上傳檔案


                string[] name = fileName.Split('_');
                string realname = name[1];

                Response.Write("<script>alert('" + kind + "" + realname + "已上傳');</script>");
                string SQLInsert = "SCID,Name,Type,Path";
                DataTable DataTableBox = new DataTable();
                foreach (string DataName in SQLInsert.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                DataRow DataTableDr = DataTableBox.NewRow();


                DataTableDr["SCID"] = SCID.Text;
                DataTableDr["Name"] = Name;
                DataTableDr["Type"] = DDL_kind.SelectedValue;
                DataTableDr["Path"] = savepath;

                DataTableBox.Rows.Add(DataTableDr);

                string insert = WebModel.SaveAction(database, "SubContract_File", DataTableBox);
                GridView5.DataBind();
                if (insert != "1")
                {
                    Response.Write("<script>alert('" + kind + "" + realname + "已上傳，資料庫更新失敗');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('圖說" + FileUpload1.FileName + "上傳失敗');</script>");
            }
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {

            string SQLString = "PID,SC_Code,SC_Name,BookInTime,ContractType,GuaranteeWay,SubmitPercent,RequestNum,RequestDate,PayDate,DurationRule,PunishType,Punish,WarrantyYear,TaxPercent,Scope,ContractNote,PrepayPercent" +
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
            //string MaintainYear = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxMaintainYear.Text));
            //string ReWarrantyYear = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxReWarrantyYear.Text));
            string TaxPercent = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxTaxPercent.Text));
            string Scope = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxScope.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxContractNote.Text));
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
                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                DataTableDr["SC_Code"] = TxSubNum.Text;
                DataTableDr["SC_Name"] = TxSubName.Text;
                DataTableDr["BookInTime"] = TxBookInTime.Text;
                DataTableDr["ContractType"] = DDL_ContractType.SelectedValue;
                DataTableDr["GuaranteeWay"] = DDL_GuaranteeWay.SelectedValue;
                DataTableDr["SubmitPercent"] = SubmitPercent != "" ? decimal.Parse(SubmitPercent) : 0;
                DataTableDr["RequestNum"] = int.Parse(RequestNum);
                DataTableDr["RequestDate"] = RequestDate;
                DataTableDr["PayDate"] = PayDate;
                DataTableDr["DurationRule"] = DDL_Warranty.SelectedValue;
                if (RadioButton1.Checked)
                {

                    DataTableDr["PunishType"] = "千分之";
                    DataTableDr["Punish"] = PType1;
                }
                else if (RadioButton2.Checked)
                {
                    DataTableDr["PunishType"] = "一天";
                    DataTableDr["Punish"] = PType2;
                }

                //DataTableDr["FirmID"] = int.Parse(LbFirmID.Text);
                DataTableDr["WarrantyYear"] = WarrantyYear != "" ? decimal.Parse(WarrantyYear) : 0;
                //DataTableDr["MaintainYear"] = MaintainYear != "" ? decimal.Parse(MaintainYear) : 0;
                //DataTableDr["ReWarrantyYear"] = ReWarrantyYear != "" ? decimal.Parse(ReWarrantyYear) : 0;
                DataTableDr["TaxPercent"] = TaxPercent != "" ? decimal.Parse(TaxPercent) : 0;
                DataTableDr["Scope"] = Scope;
                DataTableDr["ContractNote"] = Notes;
                DataTableDr["PrepayPercent"] = PrepayPercent != "" ? decimal.Parse(PrepayPercent) : 0;
                DataTableDr["PrepayCash"] = PrepayCash != "" ? decimal.Parse(PrepayCash) : 0;
                DataTableDr["PrepayCheck"] = PrepayCheck != "" ? decimal.Parse(PrepayCheck) : 0;
                DataTableDr["PrepayCheckDay"] = PrepayCheckDay != "" ? int.Parse(PrepayCheckDay) : 0;
                DataTableDr["PrepayGuarantee"] = DDL_PrepayGuarantee.SelectedValue;
                DataTableDr["FundCash"] = FundCash != "" ? decimal.Parse(FundCash) : 0;
                DataTableDr["FundCheck"] = FundCheck != "" ? decimal.Parse(FundCheck) : 0;
                DataTableDr["FundCheckDay"] = FundCheckDay != "" ? int.Parse(FundCheckDay) : 0;
                DataTableDr["RetentionPercent"] = RetentionPercent != "" ? decimal.Parse(RetentionPercent) : 0;
                DataTableDr["RetentionCash"] = RetentionCash != "" ? decimal.Parse(RetentionCash) : 0;
                DataTableDr["RetentionCheck"] = RetentionCheck != "" ? decimal.Parse(RetentionCheck) : 0;
                DataTableDr["RetentionCheckDay"] = RetentionCheckDay != "" ? int.Parse(RetentionCheckDay) : 0;
                DataTableDr["WarrantyPercent"] = WarrantyPercent != "" ? decimal.Parse(WarrantyPercent) : 0;
                DataTableDr["WarrantyCash"] = WarrantyCash != "" ? decimal.Parse(WarrantyCash) : 0;
                DataTableDr["WarrantyCheck"] = WarrantyCheck != "" ? decimal.Parse(WarrantyCheck) : 0;
                DataTableDr["WarrantyCheckDay"] = WarrantyCheckDay != "" ? int.Parse(WarrantyCheckDay) : 0;
                DataTableDr["WarrantyWay"] = DDL_WarrantyWay.SelectedValue;


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
            string ErrorString = "";
            if (!SystemSet.IsNatural_Number(TxSubNum.Text) && TxSubNum.Text == "")
            {
                ErrorString += "分包合約編號請填英文+數字!!!!\\n";
            }
            if (TxSubName.Text == "")
            {
                ErrorString += "分包合約名稱請填入!!!!\\n";
            }
            //if (!SystemSet.IsDate1(TxBookInTime.Text) || TxBookInTime.Text =="")
            //{
            //    ErrorString += "預定進場日期請填日期!!!!\\n";
            //}
            // if (DDL_ContractType.SelectedValue=="0")
            //{
            //    ErrorString += "合約種類請選擇!!!!\\n";
            //}
            if (!SystemSet.IsNumber(TxSubmitPercent.Text) && TxSubmitPercent.Text != "")
            {
                ErrorString += "出廠證明提送請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxRequestNum.Text) && TxRequestNum.Text != "")
            {
                ErrorString += "請款次數請填數字!!!!\\n";
            }
            if (TxRequestDate.Text == "" && TxRequestDate.Text != "")
            {
                ErrorString += "請款日請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxPayDate.Text) && TxPayDate.Text != "")
            {
                ErrorString += "付款日請填數字!!!!\\n";
            }
            if (RadioButton1.Checked == true)
            {
                if (!SystemSet.IsNumber(TxPType1.Text) || TxPType1.Text == "")
                {
                    ErrorString += "逾罰請填數字!!!!\\n";
                }
            }
            if (RadioButton2.Checked)
            {
                if (!SystemSet.IsNumber(TxPType2.Text) || TxPType2.Text == "")
                {
                    ErrorString += "逾罰請填數字!!!!\\n";
                }
            }

            if (!SystemSet.IsNumber(TxWarrantyYear.Text) && TxWarrantyYear.Text != "")
            {
                ErrorString += "保固年限請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxTaxPercent.Text) && TxTaxPercent.Text != "")
            {
                ErrorString += "稅額百分比請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxPrepayPercent.Text) && TxPrepayPercent.Text != "")
            {
                ErrorString += "預付款百分比請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxPrepayCash.Text) && TxPrepayCash.Text != "")
            {
                ErrorString += "預付款現金百分比請填數字!!!!\\n";
            }
           
            if (!SystemSet.IsNumber(TxPrepayCheckDay.Text) && TxPrepayCheckDay.Text != "")
            {
                ErrorString += "預付款期票天數請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxFundCash.Text) && TxFundCash.Text != "")
            {
                ErrorString += "工程款現金百分比請填數字!!!!\\n";
            }
            //if (!SystemSet.IsNumber(TxFundCheckDay.Text) || TxFundCheckDay.Text == "")
            //{
            //    ErrorString += "工程款期票天數請填數字!!!!\\n";
            //}
            if (!SystemSet.IsNumber(TxRetentionPercent.Text) && TxRetentionPercent.Text != "")
            {
                ErrorString += "保留款百分比請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxRetentionCash.Text) && TxRetentionCash.Text != "")
            {
                ErrorString += "保留款現金百分比請填數字!!!!\\n";
            }
         
            if (!SystemSet.IsNumber(TxRetentionCheckDay.Text) && TxRetentionCheckDay.Text != "")
            {
                ErrorString += "保留款期票天數請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxWarrantyPercent.Text) && TxWarrantyPercent.Text != "")
            {
                ErrorString += "保固金百分比請填數字!!!!\\n";
            }
            if (!SystemSet.IsNumber(TxWarrantyCash.Text) && TxWarrantyCash.Text != "")
            {
                ErrorString += "保固金現金百分比請填數字!!!!\\n";
            }
           
            if (!SystemSet.IsNumber(TxWarrantyCheckDay.Text) && TxWarrantyCheckDay.Text != "")
            {
                ErrorString += "保固金期票天數請填數字!!!!\\n";
            }
            if (ErrorString == "")
            {
                string database = Session["DatabaseName"].ToString();
             
                bool result = WebModel.EditAction_Anyid(database, "SubContract_Main","SCID",SCID.Text, GetDataBox());
                //bool edit = WebModel.EditAction(database, "SubRFQ_Firm", LbSBID.Text, GetDataBox());
                if (result)
                {
                    Response.Write("<script>alert('已存檔!!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('存檔失敗!!');</script>");
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();            

            string SQLSelect = "Select * from SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE SubContract_Main.SCID =" + SCID.Text;
            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
            if (Dtvs != null && Dtvs.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs.Rows)
                {
                    TxSubNum.Text = row["SC_Code"].ToString();
                    //DDL_ContractType.AutoPostBack = true;
                    //this.DDL_ContractType.SelectedIndexChanged += new EventHandler(DropDownList9_SelectedIndexChanged1);
                    DDL_ContractType.SelectedValue = row["ContractType"].ToString();
                    DropDownList9_SelectedIndexChanged1(this, null);
                    DDL_GuaranteeWay.SelectedValue = row["GuaranteeWay"].ToString();
                    TxSubmitPercent.Text = row["SubmitPercent"].ToString();
                    TxRequestNum.Text = row["RequestNum"].ToString();
                    TxRequestDate.Text = row["RequestDate"].ToString();
                    TxPayDate.Text = row["PayDate"].ToString();
                    DDL_Warranty.SelectedValue = row["DurationRule"].ToString();
                    if (row["PunishType"].ToString() == "千分之")
                    {
                        RadioButton1.Checked = true;
                        TxPType1.Text = row["Punish"].ToString();
                    }
                    else if (row["PunishType"].ToString() == "一天")
                    {
                        RadioButton2.Checked = true;
                        TxPType2.Text = row["Punish"].ToString();
                    }
                    TxWarrantyYear.Text = row["WarrantyYear"].ToString();
                    TxScope.Text = row["Scope"].ToString();
                    TxTaxPercent.Text = row["TaxPercent"].ToString();
                    TxContractNote.Text = row["ContractNote"].ToString();
                    TxPrepayPercent.Text = row["PrepayPercent"].ToString();
                    TxPrepayCash.Text = row["PrepayCash"].ToString();
                    TxPrepayCheck.Text = row["PrepayCheck"].ToString();
                    TxPrepayCheckDay.Text = row["PrepayCheckDay"].ToString();
                    DDL_PrepayGuarantee.SelectedValue = row["PrepayGuarantee"].ToString();
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
                    DDL_WarrantyWay.SelectedValue = row["WarrantyWay"].ToString();
                }


            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();            
            string SQLDelete = "Delete from SubContract_Main where SCID=" + SCID.Text;
            string SQLDelete1 = "Delete from SubContract_Item where SCID=" + SCID.Text;
            string SQLDelete2 = "Delete from SubContract_File where SCID=" + SCID.Text;
            string Update = "Update SubBudgetList set SCID=null where SCID=" + SCID.Text;//SBID如何得?
         bool result= WebModel.SQLAction(database, SQLDelete);
              result= WebModel.SQLAction(database,SQLDelete1);
              result = WebModel.SQLAction(database, SQLDelete2);
              result = WebModel.SQLAction(database, Update);
         if (result)
         {
             Response.Write("<script>alert('已刪除!!');</script>");
         }
         else
         {
             Response.Write("<script>alert('刪除失敗!!');</script>");
         }
        }

        protected void TxPrepayCheck_TextChanged(object sender, EventArgs e)
        {
            TxPrepayCheck.Text = (100 - decimal.Parse(TxPrepayCash.Text)).ToString();
            TxFundCheck.Text = (100 - decimal.Parse(TxFundCash.Text)).ToString();
            TxRetentionCheck.Text = (100 - decimal.Parse(TxRetentionCash.Text)).ToString();
            TxWarrantyCheck.Text = (100 - decimal.Parse(TxWarrantyCash.Text)).ToString();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
             

                BookInTime.Text = BookInTime.Text != "" ? DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd") : "";
             
            }
        }
    }
}