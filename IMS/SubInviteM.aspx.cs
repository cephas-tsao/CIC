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
    public partial class SubInviteM : System.Web.UI.Page
    {
        string TotalPrice;
        string Tax;
        int TaxTotal;
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
                SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code,RFQ_ReplyDate,RFQ_Warranty,RFQ_Attach1,RFQ_Attach2,RFQ_Attach3,RFQ_Attach4,RFQ_Attach5,RFQ_Attach6,RFQ_AttachOther,RFQ_Notes FROM SubBudgetList WHERE PID = " + Session["ProjectCode"].ToString() + " AND (BudgetLockNY = 0)";

            }
           

                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());               
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource10.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());

            if (!IsPostBack)
            {

                SqlDataSource6.SelectCommand = "";
               
            }
         
          
          
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
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Material.Visible == true))
            {
                Pnl_Material.Visible = false;
            }
            else
            {
                Pnl_Material.Visible = true;
            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if ((Pnl_attach.Visible == true))
            {
                Pnl_attach.Visible = false;
            }
            else
            {
                Pnl_attach.Visible = true;
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
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if ((Pnl_firm.Visible == true))
            {
                Pnl_firm.Visible = false;
            }
            else
            {
                Pnl_firm.Visible = true;
            }
        }
        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_kind.SelectedItem.Text == "其他"))
            {
                TextBox84.Visible = true;
                TextBox84.Text = "";
            }
            else
            {
                TextBox84.Visible = false;
            }
        }
        protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
        {
            if ((CheckBox7.Checked == true))
            {
                TextBox6.Visible = true;
                TextBox6.Text = "";
            }
            else
            {
                TextBox6.Visible = false;
            }
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
        protected void Button38_Click(object sender, EventArgs e)
        {
            Pnl_InviteQ.Visible = true;
            Pnl_InviteE.Visible = false;
        }
        protected void Button41_Click(object sender, EventArgs e)
        {
            Pnl_InviteE.Visible = true;
            Pnl_InviteQ.Visible = false;
        }
        protected void Button42_Click(object sender, EventArgs e)
        {
            Pnl_Detail.Visible = true;
        }
        
        protected void LoadContent()
        {
            foreach (GridViewRow row in GridView4.Rows)
            {
                CheckBox CheckBoxSF = (CheckBox)row.FindControl("CheckBoxSF");

                CheckBoxSF.Checked = false;
            }
           string database = Session["DatabaseName"].ToString();
           string SQLSelect = "Select FirmID from SubRFQ_Firm where SBID=" + LbSBID.Text;
           DataTable dtvs = WebModel.LoadSetContentData(database, SQLSelect);
           if (dtvs != null && dtvs.Rows.Count > 0)
           {
              
               for (int i = 0; i < dtvs.Rows.Count; i++)
               {
                   DataRow vsDr = dtvs.Rows[i];
                   string Fid = vsDr["FirmID"].ToString();


                   foreach (GridViewRow row in GridView4.Rows)
                   {
                       CheckBox CheckBoxSF = (CheckBox)row.FindControl("CheckBoxSF");
                       string check = WebModel.SItemName(database, SQLSelect, "FirmID");
                       Label UID = (Label)row.FindControl("UID");
                       //CheckBoxSF.Checked = false;
                       if (UID.Text == Fid)
                       {

                           CheckBoxSF.Checked = true;
                       }
                      
                   }

               }

           }
          
        }
        protected void LoadContent1()
        {
           
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from SubBudgetList where SBID=" + LbSBID.Text;
            DataTable dtvs = WebModel.LoadSetContentData(database, SQLSelect);
            if (dtvs != null && dtvs.Rows.Count > 0)
            {

                for (int i = 0; i < dtvs.Rows.Count; i++)
                {
                    DataRow vsDr = dtvs.Rows[i];
                    TxRFQ_ReplyDate.Text = vsDr["RFQ_ReplyDate"].ToString();
                    TxRFQ_Warranty.Text = vsDr["RFQ_Warranty"].ToString();
                    TxRFQ_Notes.Text = vsDr["RFQ_Notes"].ToString();

                    CheckBox1.Checked = vsDr["RFQ_Attach1"].ToString() == "1" ? true : false;
                    CheckBox2.Checked = vsDr["RFQ_Attach2"].ToString() == "1" ? true : false;
                    CheckBox3.Checked = vsDr["RFQ_Attach3"].ToString() == "1" ? true : false;
                    CheckBox4.Checked = vsDr["RFQ_Attach4"].ToString() == "1" ? true : false;
                    CheckBox5.Checked = vsDr["RFQ_Attach5"].ToString() == "1" ? true : false;
                    CheckBox6.Checked = vsDr["RFQ_Attach6"].ToString() == "1" ? true : false;
                    TextBox6.Text = vsDr["RFQ_AttachOther"].ToString();
                }

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
            SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList  ";
            SqlDataSource1.SelectCommand += (SelectString.Length > 1) ? "WHERE " + SelectString + " and PID = " + Session["ProjectCode"].ToString() + "" : " WHERE PID = " + Session["ProjectCode"].ToString() + "";


            #endregion

            GridView1.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList where pid= " + Session["ProjectCode"].ToString();
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
                Label BookContractDate = (Label)e.Row.FindControl("BookContractDate");
                Label LastContractDate = (Label)e.Row.FindControl("LastContractDate");
                Label BudgetPrice = (Label)e.Row.FindControl("BudgetPrice");



                BookInTime.Text = BookInTime.Text!=""?DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd"):"";
                BookContractDate.Text = BookContractDate.Text!=""?DateTime.Parse(BookContractDate.Text).ToString("yyyy-MM-dd"):"";
                LastContractDate.Text = LastContractDate.Text != "" ? DateTime.Parse(LastContractDate.Text).ToString("yyyy-MM-dd") : "";
                BudgetPrice.Text=BudgetPrice.Text !=""?decimal.Parse(BudgetPrice.Text).ToString("N0"):"";


            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            string database = Session["DatabaseName"].ToString();
            SqlDataSource6.SelectCommand = "";
            Repeater2.DataBind();
            if (e.CommandName == "select")
            {
                LbSBID.Text = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                LbSB_Code1.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                LbSB_Name1.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Name")).Text.Trim();
                //SqlDataSource10.SelectCommand = "SELECT FirmM.Name, FirmM.UID, SubRFQ_Firm.FirmID, SubRFQ_Firm.SBID, SubRFQ_Firm.Sort, SubRFQ_Firm.TotalPrice, SubRFQ_Firm.GetNY, SubBudgetList.RFQ_ReplyDate FROM FirmM INNER JOIN SubRFQ_Firm ON FirmM.UID = SubRFQ_Firm.FirmID INNER JOIN SubBudgetList ON SubRFQ_Firm.SBID = SubBudgetList.SBID WHERE (SubRFQ_Firm.SBID =" + LbSBID.Text+ " ) ORDER BY SubRFQ_Firm.Sort";
                SqlDataSource10.SelectCommand = "SELECT b.UID as FUID,a.Name, a.UID, b.FirmID, b.SBID, b.Sort, b.TotalPrice, b.GetNY, c.RFQ_ReplyDate FROM FirmM a INNER JOIN SubRFQ_Firm b ON a.UID = b.FirmID INNER JOIN SubBudgetList c ON b.SBID = c.SBID WHERE (c.SBID =" + LbSBID.Text + " ) ORDER BY b.Sort";
                
                SqlDataSource9.SelectCommand = "SELECT * FROM [SubRFQ_File] where SBID=" + LbSBID.Text;
                ViewState["SBID"] = LbSBID.Text;
            }
            if (e.CommandName == "edit")
            {
               
                LbSBID.Text = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                LbSB_Code.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                LbSB_Name.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Name")).Text.Trim();
                LbContractWay.Text = ((Label)GridView1.Rows[ID_class].FindControl("ContractWay")).Text.Trim();
                LbWorkManName.Text = ((Label)GridView1.Rows[ID_class].FindControl("WorkManName")).Text.Trim();
                LbBookInTime.Text = ((Label)GridView1.Rows[ID_class].FindControl("BookInTime")).Text.Trim();
                LbBookContractDate.Text = ((Label)GridView1.Rows[ID_class].FindControl("BookContractDate")).Text.Trim();
                LbBudgetPrice.Text = ((Label)GridView1.Rows[ID_class].FindControl("BudgetPrice")).Text.Trim();
                string SBID = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                string SQLSelect = SqlDataSource1.SelectCommand + " and SBID=" + LbSBID.Text + "";
                DataTable datatablebox = WebModel.LoadSetContentData(database, SQLSelect);
                if (datatablebox != null && datatablebox.Rows.Count != 0)
                {
                    foreach (DataRow row in datatablebox.Rows)
                    {


                        TxRFQ_ReplyDate.Text = row["RFQ_ReplyDate"].ToString();
                        TxRFQ_Warranty.Text = row["RFQ_Warranty"].ToString();
                        TxRFQ_Notes.Text = row["RFQ_Notes"].ToString();
                        CheckBox1.Checked = row["RFQ_Attach1"].ToString() == "1" ? true : false;
                        CheckBox2.Checked = row["RFQ_Attach2"].ToString() == "1" ? true : false;
                        CheckBox3.Checked = row["RFQ_Attach3"].ToString() == "1" ? true : false;
                        CheckBox4.Checked = row["RFQ_Attach4"].ToString() == "1" ? true : false;
                        CheckBox5.Checked = row["RFQ_Attach5"].ToString() == "1" ? true : false;
                        CheckBox6.Checked = row["RFQ_Attach6"].ToString() == "1" ? true : false;
                        TextBox6.Text = row["RFQ_AttachOther"].ToString();

                    }

                }
                SqlDataSource5.SelectCommand = "Select * from SubBudget_Item where SBID=" + SBID;
                SqlDataSource2.SelectCommand = "SELECT * FROM [SubRFQ_File] where SBID=" + SBID;
                LoadContent();
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
             

                LbBComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(LbBPrice.Text)).ToString("N0");


            }
        }
        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView4.PageSize;
            int UID = (int)GridView4.DataKeys[ID_class].Value;

           
            if (e.CommandName == "Select")
            {

                Response.Write("<script>window.open('FirmData.aspx?UID=" + UID + "', 'window','height=570,width=1500')</script>");
            }
        }
        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            String savepath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
            string ProjectCode = Session["ProjectCode"].ToString();
            //string RFQ_Code = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNo.Text));
            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;

                fileName = DateTime.Now.ToString("yyyy-MM-dd-HHmmss") + "_" + fileName;
                string Name = AttachName.Text;
                savepath += fileName;
                string kind = DDL_kind.SelectedValue;
                FileUpload1.SaveAs(savepath);
                // FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath(savepath)); //上傳檔案


                string[] name = fileName.Split('_');
                string realname = name[1];

                Response.Write("<script>alert('" + kind + "" + realname + "已上傳');</script>");
                string SQLInsert = "SBID,Name,Type,Path";
                DataTable DataTableBox = new DataTable();
                foreach (string DataName in SQLInsert.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                DataRow DataTableDr = DataTableBox.NewRow();


                DataTableDr["SBID"] = LbSBID.Text;
                DataTableDr["Name"] = Name;
                DataTableDr["Type"] = kind;
                DataTableDr["Path"] = savepath;

                DataTableBox.Rows.Add(DataTableDr);

                string insert = WebModel.SaveAction(database, "SubRFQ_File", DataTableBox);
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
        protected void BtnFSearch_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPro.Text));

            #region 搜尋條件
            string SelectString = "";

            SelectString = (DDL_Select2.SelectedValue != "0") ? "Type like '%" + DDL_Select2.SelectedValue + "%' " : "";

            SelectString += (ItemName != "") ? "" + DDL_Op2.SelectedValue + " SupportItem like '%" + ItemName + "%' " : "";

            SelectString = (SelectString.Length > 1) ? SelectString : "";
            #endregion
            SqlDataSource4.SelectCommand = (SelectString.Length > 1) ? SqlDataSource4.SelectCommand.Substring(0, SqlDataSource4.SelectCommand.Length) : SqlDataSource4.SelectCommand;
            SqlDataSource4.SelectCommand += " where " + SelectString + "";
            GridView4.DataBind();
        }

        protected void BtnFAll_Click(object sender, EventArgs e)
        {
            GridView4.DataBind();
        }

        protected void GridView10_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             int ID_class = Convert.ToInt32(e.CommandArgument);
             ID_class = ID_class % GridView10.PageSize;
            string database = Session["DatabaseName"].ToString();
            SqlDataSource6.SelectCommand = "";
            if (e.CommandName == "Select")
            {
                LbUID.Text = ((Label)GridView10.Rows[ID_class].FindControl("FUID")).Text.Trim();
                LbFirmID.Text = ((Label)GridView10.Rows[ID_class].FindControl("FirmID")).Text.Trim();
                LbFName.Text = ((Label)GridView10.Rows[ID_class].FindControl("Name")).Text.Trim();
                LbQutation.Text = ((Label)GridView10.Rows[ID_class].FindControl("TotalPrice")).Text.Trim();
                LbQutation.Text = LbQutation.Text != "" ? (decimal.Parse(LbQutation.Text)).ToString("N0") : "";
                LbTax.Text = LbQutation.Text!=""?(double.Parse(LbQutation.Text) * 0.05).ToString("N0"):"0";
                string SQLSelect="Select * from SubRFQ_Firm where UID="+LbUID.Text;
                string getfirm= WebModel.SItemName(database, SQLSelect, "GetNY");
                LbGetFirm.Text = getfirm =="1"?"是":"否";
                //SqlDataSource10.SelectCommand = "SELECT FirmM.Name, FirmM.UID, SubRFQ_Firm.FirmID, SubRFQ_Firm.SBID, SubRFQ_Firm.Sort, SubRFQ_Firm.TotalPrice, SubRFQ_Firm.GetNY, SubBudgetList.RFQ_ReplyDate FROM FirmM INNER JOIN SubRFQ_Firm ON FirmM.UID = SubRFQ_Firm.FirmID INNER JOIN SubBudgetList ON SubRFQ_Firm.SBID = SubBudgetList.SBID WHERE (SubRFQ_Firm.SBID =" + LbSBID.Text+ " ) ORDER BY SubRFQ_Firm.Sort";
                //SqlDataSource10.SelectCommand = "SELECT b.UID as FUID,a.Name, a.UID, b.FirmID, b.SBID, b.Sort, b.TotalPrice, b.GetNY, c.RFQ_ReplyDate FROM FirmM a INNER JOIN SubRFQ_Firm b ON a.UID = b.FirmID INNER JOIN SubBudgetList c ON b.SBID = c.SBID WHERE (c.SBID =" + LbSBID.Text + " ) ORDER BY b.Sort";
                SqlDataSource9.SelectCommand = "SELECT * FROM [SubRFQ_File] where SBID=" + LbSBID.Text;
                //SqlDataSource6.SelectCommand = "SELECT * FROM [SubRFQ_Material] a left join SubBudget_Item b on a.SBID=b.SBID where a.SBID=" + LbSBID.Text + " and FirmID=" + LbFirmID.Text;
                SqlDataSource6.SelectCommand = "SELECT * FROM SubRFQ_Material a left join SubBudget_Item b on a.SB_MID=b.SB_MID where a.SBID=" + LbSBID.Text + " and a.FirmID=" + LbFirmID.Text;
                //SqlDataSource6.SelectCommand = "SELECT a.*,b.[UID],b.[SBID] as MSBID,b.[FirmID],b.[SB_MID],b.[PriceID],b.[UnitPrice],b.[ComplexPrice],b.[DisUnitPrice],b.[DisComplexPrice],b.[Explan],b.[Note] FROM [SubBudget_Item] a left join [SubRFQ_Material] b on a.SB_MID=b.SB_MID where a.SBID=" + LbSBID.Text;     
            }
            if (e.CommandName == "Export")
            {
                LbUID.Text = ((Label)GridView10.Rows[ID_class].FindControl("FUID")).Text.Trim();
                LbFirmID.Text = ((Label)GridView10.Rows[ID_class].FindControl("FirmID")).Text.Trim();
                LbFName.Text = ((Label)GridView10.Rows[ID_class].FindControl("Name")).Text.Trim();
                LbQutation.Text = ((Label)GridView10.Rows[ID_class].FindControl("TotalPrice")).Text.Trim();
                LbTax.Text = LbQutation.Text != "" ? (double.Parse(LbQutation.Text) * 0.05).ToString("N0") : "0";
                //string SBID = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                string SQLSelect = "select * from [SubRFQ_Firm] a left join SubRFQ_Material b on a.FirmID=b.FirmID left join SubBudget_Item c on b.SB_MID=c.SB_MID where a.SBID=" + ViewState["SBID"].ToString() + " and a.FirmID=" + LbFirmID.Text + "";
                DataTable Repeater = WebModel.LoadSetContentData(database, SQLSelect);
                exportToExcel(Repeater);
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;


                Label SB_MID = (Label)e.Item.FindControl("SB_MID");
                Label SBID = (Label)e.Item.FindControl("SBID");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                //Label LbBitem = (Label)e.Item.FindControl("LbBitem");
                Label LbQuantity = (Label)e.Item.FindControl("LbQuantity");
                Label LbComplex = (Label)e.Item.FindControl("LbComplex");
                Label LbDisPrice = (Label)e.Item.FindControl("LbDisPrice");
                Label LbDisComplex = (Label)e.Item.FindControl("LbDisComplex");
                TextBox TxQPrice = (TextBox)e.Item.FindControl("TxQPrice");

                SB_MID.Text = vsDr["SB_MID"].ToString();
                SBID.Text = vsDr["SBID"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                //LbBitem.Text = vsDr["BelongItem"].ToString();
                LbQuantity.Text = vsDr["SCNumber"].ToString() !=""?vsDr["SCNumber"].ToString():"0";
                //LbItemName.Text = vsDr["ItemName"].ToString();
                TxQPrice.Text = vsDr["UnitPrice"].ToString() != "" ? vsDr["UnitPrice"].ToString() : "0";
                LbComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(TxQPrice.Text)).ToString("N0");


            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLUpdateM = "";
            string SQLUpdateF = "";
            string insert = "";
            bool result = false;
            foreach (RepeaterItem item in Repeater2.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    //Label LbUID = item.FindControl("LbUID") as Label;
                    Label SB_MID = item.FindControl("SB_MID") as Label;
                    Label SBID = item.FindControl("SBID") as Label;
                    TextBox TxQPrice = (TextBox)item.FindControl("TxQPrice") as TextBox;
                    TextBox TxBrand = (TextBox)item.FindControl("TxBrand") as TextBox;
                    TextBox TxNotes = (TextBox)item.FindControl("TxNotes") as TextBox;
                    TxQPrice.Text = TxQPrice.Text != "" ? decimal.Parse(TxQPrice.Text).ToString() : "";
                    LbQutation.Text = LbQutation.Text != "" ? decimal.Parse(LbQutation.Text).ToString() : "";
                    LbTax.Text = LbTax.Text != "" ? decimal.Parse(LbTax.Text).ToString() : "";
                    string SQLUIDM = "Select * from SubRFQ_Material where SBID=" + SBID.Text + " and SB_MID=" + SB_MID.Text + " and FirmID=" + LbFirmID.Text+ "";
                    string UIDM = WebModel.SItemName(database, SQLUIDM, "UID");
                    if (UIDM != "")
                    {
                        SQLUpdateM = "Update SubRFQ_Material set UnitPrice='" + TxQPrice.Text + "',ComplexPrice='" + LbQutation.Text + "',Explan='" + TxBrand.Text + "',Note='" + TxNotes.Text + "' where UID=" + UIDM;
                        SQLUpdateF = "Update SubRFQ_Firm set ExpiretionDate='" + TxExdate.Text + "',TotalPrice='" + LbQutation.Text + "' ,Tax='" + LbTax.Text + "' where UID=" + LbUID.Text;//LbUID為SubRFQ_Firm所屬

                        result = WebModel.SQLAction(database, SQLUpdateM);
                        result = WebModel.SQLAction(database, SQLUpdateF);
                    }
                    else
                    {
                        string SQLInsert = "SBID,FirmID,SB_MID,PriceID,UnitPrice,ComplexPrice,Explan,Note";
                        SQLUpdateF = "Update SubRFQ_Firm set ExpiretionDate='" + TxExdate.Text + "',TotalPrice='" + LbQutation.Text + "' ,Tax='" + LbTax.Text + "' where UID=" + LbUID.Text;//LbUID為SubRFQ_Firm所屬
                        DataTable DataTableBox = new DataTable();
                        foreach (string DataName in SQLInsert.Split(','))
                        {
                            DataTableBox.Columns.Add(DataName, typeof(string));
                        }

                        DataRow DataTableDr = DataTableBox.NewRow();


                        DataTableDr["SBID"] = LbSBID.Text;
                        DataTableDr["FirmID"] = LbFirmID.Text;
                        DataTableDr["SB_MID"] = SB_MID.Text;
                        DataTableDr["UnitPrice"] = TxQPrice.Text;
                        DataTableDr["ComplexPrice"] = LbQutation.Text;
                        //DataTableDr["DisUnitPrice"] = savepath;
                        //DataTableDr["DisComplexPrice"] = savepath;
                        DataTableDr["Explan"] = TxBrand.Text;
                        DataTableDr["Note"] = TxNotes.Text;

                        DataTableBox.Rows.Add(DataTableDr);

                        insert = WebModel.SaveAction(database, "SubRFQ_Material", DataTableBox);
                        result = WebModel.SQLAction(database, SQLUpdateF);
                    }
                   

                }


            }
            if (insert == "1" || result)
            {
                Response.Write("<script>alert('已存檔');</script>");
            }
            else
            {
                Response.Write("<script>alert('存檔失敗');</script>");
            }
        }

        protected void TxQPrice_TextChanged(object sender, EventArgs e)
        {
            decimal total=0;
            foreach (RepeaterItem item in Repeater2.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label LbQuantity = (Label)item.FindControl("LbQuantity");
                    Label LbComplex = (Label)item.FindControl("LbComplex");
                    TextBox TxQPrice = (TextBox)item.FindControl("TxQPrice");

                    LbComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(TxQPrice.Text)).ToString("N0");
                    total +=decimal.Parse(LbComplex.Text);
                }
               
            }
            LbQutation.Text = total.ToString("N0");
            LbTax.Text = (double.Parse(total.ToString()) * (0.05)).ToString("N0");
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView5.PageSize;
            int UID = (int)GridView5.DataKeys[ID_class].Value;

            Label Path = (Label)GridView5.Rows[ID_class].FindControl("Path");
            Label Name = (Label)GridView5.Rows[ID_class].FindControl("Name");
            Label SBID = (Label)GridView5.Rows[ID_class].FindControl("SBID");
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

                SqlDataSource2.DeleteCommand = "Delete  From  [SubRFQ_File] where SBID=" + SBID.Text;
                GridView5.DataBind();
                Response.Write("<script>alert('刪除成功');</script>");
            }
        }

        protected void GridView7_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView7.PageSize;
            int UID = (int)GridView7.DataKeys[ID_class].Value;

            Label Path = (Label)GridView7.Rows[ID_class].FindControl("Path");
            Label Name = (Label)GridView7.Rows[ID_class].FindControl("Name");
            Label SBID = (Label)GridView7.Rows[ID_class].FindControl("SBID");
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
        }

        protected void BtnChange_Click(object sender, EventArgs e)
        {
            string ErrorString = "";
            string insert = "";
            string insert1 = "";
            string ReplyDate = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRFQ_ReplyDate.Text));
            string Warranty = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRFQ_Warranty.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRFQ_Notes.Text));
            string database = Session["DatabaseName"].ToString();

            //檢查標題文字

            ErrorString += (ReplyDate) == string.Empty ? "報價回覆期限請填入!!\\n" : "";


            //確認是否全選
            if (ErrorString == "")
            {
                string SQLInsertMaterial = "SBID,FirmID,SB_MID,PriceID,UnitPrice,ComplexPrice,Explan,Note";
                string SQLStringFirm = "SBID,Sort,FirmID,ExpiretionDate";
                string SQLUdSubBudgetList = "SBID,RFQ_ReplyDate,RFQ_Warranty,RFQ_Attach1,RFQ_Attach2,RFQ_Attach3,RFQ_Attach4,RFQ_Attach5,RFQ_Attach6,RFQ_AttachOther,RFQ_Notes";
                DataTable DataTableBoxM = new DataTable();
                DataTable DataTableBoxF = new DataTable();
                DataTable DataTableBoxS = new DataTable();

                foreach (string DataName in SQLInsertMaterial.Split(','))
                {
                    DataTableBoxM.Columns.Add(DataName, typeof(string));
                }

                foreach (string DataName in SQLStringFirm.Split(','))
                {
                    DataTableBoxF.Columns.Add(DataName, typeof(string));
                }
                foreach (string DataName in SQLUdSubBudgetList.Split(','))
                {
                    DataTableBoxS.Columns.Add(DataName, typeof(string));
                }
                DataRow DataTableDrS = DataTableBoxS.NewRow();

                DataTableDrS["SBID"] = LbSBID.Text;
                DataTableDrS["RFQ_ReplyDate"] = TxRFQ_ReplyDate.Text;
                DataTableDrS["RFQ_Warranty"] = TxRFQ_Warranty.Text != "" ? decimal.Parse(TxRFQ_Warranty.Text) : 0;
                DataTableDrS["RFQ_Attach1"] = CheckBox1.Checked ? 1 : 0;
                DataTableDrS["RFQ_Attach2"] = CheckBox2.Checked ? 1 : 0;
                DataTableDrS["RFQ_Attach3"] = CheckBox3.Checked ? 1 : 0;
                DataTableDrS["RFQ_Attach4"] = CheckBox4.Checked ? 1 : 0;
                DataTableDrS["RFQ_Attach5"] = CheckBox5.Checked ? 1 : 0;
                DataTableDrS["RFQ_Attach6"] = CheckBox6.Checked ? 1 : 0;
                DataTableDrS["RFQ_AttachOther"] = TextBox6.Text;
                DataTableDrS["RFQ_Notes"] = TxRFQ_Notes.Text;

                DataTableBoxS.Rows.Add(DataTableDrS);
                bool j = WebModel.EditAction_Anyid(database, "SubBudgetList", "SBID", LbSBID.Text, DataTableBoxS);

                //int i = 1;
                foreach (GridViewRow row in GridView4.Rows)
                {
                    CheckBox CheckBoxSF = (CheckBox)row.FindControl("CheckBoxSF");
                    Label UID = (Label)row.FindControl("UID");
                    DataRow DataTableDr1 = DataTableBoxF.NewRow();
                    string SQLFirm = "Select * from [SubRFQ_Firm] where SBID=" + LbSBID.Text + " and FirmID=" + UID.Text;
                    string check = WebModel.SItemName(database, SQLFirm, "FirmID");
                    if (CheckBoxSF.Checked == false)
                    {

                        if (check != "")
                        {
                            string SQLDel = "Delete from SubRFQ_Firm where  SBID=" + LbSBID.Text + " and FirmID=" + UID.Text;
                            WebModel.SQLAction(database, SQLDel);
                        }


                    }
                    if (CheckBoxSF.Checked == true)
                    {

                        //DataTableDr1["Sort"] = i;
                        DataTableDr1["SBID"] = LbSBID.Text;
                        DataTableDr1["FirmID"] = UID.Text;
                        DataTableDr1["ExpiretionDate"] = TxRFQ_ReplyDate.Text;
                        //DataTableDr1["Notes"] = TxRFQ_Notes.Text;
                       
                        //check = WebModel.SItemName(database, SQLFirm, "FirmID");
                        if (check == "")
                        {

                            DataTableBoxF.Rows.Add(DataTableDr1);
                            insert1 = WebModel.SaveAction(database, "SubRFQ_Firm", DataTableBoxF);
                            DataTableBoxF.Rows.Clear();
                            //i++;

                            string SQLUpdateSort = "update SubRFQ_Firm set Sort=id From(Select  Sort,ROW_NUMBER()OVER (ORDER BY UID) AS id  FROM SubRFQ_Firm Where SBID=" + LbSBID.Text + ") SubRFQ_Firm";
                            WebModel.SQLAction(database, SQLUpdateSort);
                            foreach (RepeaterItem item in Repeater1.Items)
                            {
                                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                                {
                                    Label LbSB_MID = (Label)item.FindControl("LbSB_MID") as Label;
                                    Label LbBPrice = (Label)item.FindControl("LbBPrice") as Label;
                                    Label LbItemName = (Label)item.FindControl("LbItemName") as Label;
                                    Label LbUnit = (Label)item.FindControl("LbUnit") as Label;
                                    Label LbQuantity = (Label)item.FindControl("LbQuantity") as Label;
                                    Label LbBComplex = (Label)item.FindControl("LbBComplex") as Label;



                                    DataRow DataTableDr = DataTableBoxM.NewRow();



                                    DataTableDr["SBID"] = LbSBID.Text;
                                    DataTableDr["SB_MID"] = LbSB_MID.Text;
                                    DataTableDr["UnitPrice"] = decimal.Parse(LbBPrice.Text);
                                    DataTableDr["FirmID"] = UID.Text;
                                    DataTableDr["ComplexPrice"] = decimal.Parse(LbBComplex.Text);
                                    DataTableDr["Note"] = TxRFQ_Notes.Text;

                                    DataTableBoxM.Rows.Add(DataTableDr);
                                    insert = WebModel.SaveAction(database, "SubRFQ_Material", DataTableBoxM);
                                    DataTableBoxM.Rows.Clear();


                                 
                                }

                            }
                        }
                    }

                }
                if (insert != "1" && insert1 != "1" && j != true) //
                {
                    Response.Write("<script>alert('資料庫更新失敗');</script>");
                }
                else
                {
                    Response.Write("<script>alert('存檔成功');</script>");

                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
           
            LoadContent();
            LoadContent1();
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();            
            //string SQLdel = "Delete from  SubBudgetList where SBID=" + LbSBID.Text;
            //string SQLDel1 = "Delete from SubRFQ_Firm where SBID=" + LbSBID.Text + " and FirmID=";
            //WebModel.SQLAction(database, SQLdel);
            foreach (GridViewRow row in GridView4.Rows)
            {
                CheckBox CheckBoxSF = (CheckBox)row.FindControl("CheckBoxSF");
                Label UID = (Label)row.FindControl("UID");               
               
                if (CheckBoxSF.Checked == true)
                {


                    string SQLDel = "Delete from SubRFQ_Firm where  SBID=" + LbSBID.Text + " and FirmID=" + UID.Text;
                    string SQLDel1 = "Delete from SubRFQ_Material where  SBID=" + LbSBID.Text + " and FirmID=" + UID.Text;
                    WebModel.SQLAction(database, SQLDel);
                    WebModel.SQLAction(database, SQLDel1);
                    string SQLUpdateSort = "update SubRFQ_Firm set Sort=id From(Select  Sort,ROW_NUMBER()OVER (ORDER BY UID) AS id  FROM SubRFQ_Firm Where SBID=" + LbSBID.Text + ") SubRFQ_Firm";
                    WebModel.SQLAction(database, SQLUpdateSort);

                }
            }
        }
        //匯出 Excel (直接從資料來源 DataTable 產生 Excel。 此種 Excel 可加入自訂記錄列) 
        private void exportToExcel(System.Data.DataTable pDataTable)
        {
            string database = Session["DatabaseName"].ToString();
            string SelectSQL = SqlDataSource4.SelectCommand;
            int tRowCount = pDataTable.Rows.Count;
            int tColumnCount = pDataTable.Columns.Count;
            int colspan = tColumnCount - 1;
            string filename = LbFName.Text + "報價單";
            string company = LbFName.Text;
            string date = TxExdate.Text;
            //string Bid = WebModel.BID(database, SelectSQL);
            string SelectSQL1 = "select * from ProjectM0 where pid=" + Session["ProjectCode"].ToString() + "";
            string PidName = WebModel.SItemName(database, SelectSQL1, "ProjectName");


            Response.Expires = 0;
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "utf-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".xls");
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");
            //Response.Write("<Table borderColor=black border=1 font-family:'" + DDL_font.SelectedItem.Text + "'>");
            HttpContext.Current.Response.Write("<Table border='1' bgColor='#ffffff' " +
             "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
             "style='font-size:10.0pt; font-family:細明體; background:white;'>");
            Response.Write("\n<th style='font-size:16.0pt;' colspan='7'  align=\"center\" x:num>");      //抬頭背景為淺黃色，文字橫向為置中對齊 
            Response.Write("機關/公司名稱:" + company + " ");
            Response.Write("\n</th>");
            Response.Write("<TR ><td style='font-size:16.0pt;' colspan='7'  align=\"center\" x:num>");
            Response.Write("廠  商  報  價  單");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:16.0pt;' colspan='7'  align=\"Left\" x:num>");
            Response.Write("工程名稱:" + PidName + "");
            Response.Write("</td>\n</TR>");
            //Response.Write("<tr><td align='center' valign='middle'>自訂表頭訊息</td></tr>"); 
            Response.Write("\n<TR  align=\"center\" x:num>");
            Response.Write("<td>項次</td><td style='width:400px'>作業項目</td><td>單位</td><td>數量</td><td style='width:100px'>單價</td><td style='width:100px'>複價</td><td style='width:200px'>備註</td>\n </td>");
            Response.Write("\n </TR>");

            string l_str2 = "";
            int i = 1;

            foreach (DataRow l_dr in pDataTable.Rows)  //滙出表格資料我
            {//若有數字或日期在滙出時要注意資料型態，我是在TABLE中就設定好了

                //l_str2 = "<tr><td>" + l_dr["UID"].ToString() + "";
                l_str2 = "<tr><td>" + i.ToString() + "";

                l_str2 += "</td><td>" + l_dr["ItemName"].ToString() + "";

                l_str2 += "</td><td>" + l_dr["Unit"].ToString() + "";

                l_str2 += "</td><td>" + (Convert.ToInt32(l_dr["SCNumber"])).ToString("N0") + "";
                string UnitPrice = l_dr["UnitPrice"].ToString() != "" ? l_dr["UnitPrice"].ToString() : "0";
                l_str2 += "</td><td>" + (decimal.Parse(UnitPrice)).ToString("N0") + "";
                string ComplexPrice = l_dr["ComplexPrice"].ToString() != "" ? l_dr["ComplexPrice"].ToString() : "0";
                l_str2 += "</td><td>" + (decimal.Parse(ComplexPrice)).ToString("N0") + "";
                //l_str2 += "</td><td>" + (l_dr["ClearWay"].ToString()) + "";

                l_str2 += "</td><td>" + l_dr["Note"].ToString() + "";

                l_str2 += "</td></tr>";

                TotalPrice = l_dr["TotalPrice"].ToString() != "" ? l_dr["TotalPrice"].ToString() : "0";
                Tax = l_dr["Tax"].ToString() != "" ? l_dr["Tax"].ToString() : "0";
                TaxTotal = int.Parse(TotalPrice) + int.Parse(Tax);
                Response.Write(l_str2);
                i++;

            }

            Response.Write("<tr></tr><tr></tr>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("總價新台幣（未稅）：</td><td>" + Convert.ToInt32(TotalPrice).ToString("N0") + "</td><td>元 </td><td colspan='1'></td >");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("營業稅：</td><td>" + Convert.ToInt32(Tax).ToString("N0") + "</td><td>元 </td><td colspan='1'></td >");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("總價新台幣（含稅）：</td><td>" + TaxTotal.ToString("N0") + "</td><td>元 </td><td colspan='1'></td >");
            Response.Write("</td>\n</TR>");

            Response.Write("</Table>");
            Response.End();


            //Response.Write("<tr><td align='center' valign='middle'>自訂表尾訊息</td></tr>"); 



            if (pDataTable != null)
                pDataTable.Dispose();       //註記已可釋放此 DataTable         
        }

        protected void GridView10_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label TotalPrice = (Label)e.Row.FindControl("TotalPrice");

                TotalPrice.Text = TotalPrice.Text != "" ? decimal.Parse(TotalPrice.Text).ToString("N0") : "";
              
            }
        }
    }
}