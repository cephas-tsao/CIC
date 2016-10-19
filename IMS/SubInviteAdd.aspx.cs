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
    public partial class SubInviteAdd : System.Web.UI.Page
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
                SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code,RFQ_ReplyDate,RFQ_Warranty,RFQ_Attach1,RFQ_Attach2,RFQ_Attach3,RFQ_Attach4,RFQ_Attach5,RFQ_Attach6,RFQ_AttachOther,RFQ_Notes FROM SubBudgetList WHERE PID = " + Session["ProjectCode"].ToString() + " AND (BudgetLockNY = 0)";

            }
         

                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());              
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
         
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
            Pnl_IAdd.Visible = true;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            string database = Session["DatabaseName"].ToString();
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "select")
            {
                LbSBID.Text = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                LbSB_Code.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                LbSB_Name.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Name")).Text.Trim();
                LbContractWay.Text = ((Label)GridView1.Rows[ID_class].FindControl("ContractWay")).Text.Trim();
                LbWorkManName.Text =((Label)GridView1.Rows[ID_class].FindControl("WorkManName")).Text.Trim();
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
                        CheckBox1.Checked = row["RFQ_Attach1"].ToString() == "True" ? true : false;
                        CheckBox2.Checked = row["RFQ_Attach2"].ToString() == "True" ? true : false;
                        CheckBox3.Checked = row["RFQ_Attach3"].ToString() == "True" ? true : false;
                        CheckBox4.Checked = row["RFQ_Attach4"].ToString() == "True" ? true : false;
                        CheckBox5.Checked = row["RFQ_Attach5"].ToString() == "True" ? true : false;
                        CheckBox6.Checked = row["RFQ_Attach6"].ToString() == "True" ? true : false;
                        TextBox6.Text = row["RFQ_AttachOther"].ToString();

                    }

                }
                Pnl_Material.Visible = true;
                Pnl_attach.Visible = true;
                Pnl_file.Visible = true;
                Pnl_firm.Visible = true;
                SqlDataSource5.SelectCommand = "Select * from SubBudget_Item where SBID=" + SBID;
                SqlDataSource2.SelectCommand = "SELECT * FROM [SubRFQ_File] where SBID="+SBID;
                
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

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSubBudget.Text));

            #region 搜尋條件
            string SelectString = "";

            SelectString = (KeyWord != "") ? "SB_Name like '%" + KeyWord + "%' "  : "";
            if (TxDate1.Text !="")
            {
                SelectString += DDL_Op1.SelectedValue;
            if (DDL_date.SelectedValue == "BookInTime" && DDL_Op3.SelectedValue != "Between")
            {
                SelectString += " BookInTime " + DDL_Op3.SelectedValue + " '" +DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd")+"'";
            }
            else if (DDL_date.SelectedValue == "BookInTime" && DDL_Op3.SelectedValue == "Between")
            {
                SelectString += " BookInTime " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") +"' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd")+"'";

            }
            if (DDL_date.SelectedValue == "BookContractDate" && DDL_Op3.SelectedValue != "Between")
            {
                SelectString += " BookContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd")+"'";
            }
            else if (DDL_date.SelectedValue == "BookContractDate" && DDL_Op3.SelectedValue == "Between")
            {
                SelectString += " BookContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") +"' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd")+"'";

            }
            if (DDL_date.SelectedValue == "LastContractDate" && DDL_Op3.SelectedValue != "Between")
            {
                SelectString += " LastContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd")+"'";
            }
            else if (DDL_date.SelectedValue == "LastContractDate" && DDL_Op3.SelectedValue == "Between")
            {
                SelectString += " LastContractDate " + DDL_Op3.SelectedValue + "'" + DateTime.Parse(TxDate1.Text).ToString("yyyy-MM-dd") + "' and " + "'" + DateTime.Parse(TxDate2.Text).ToString("yyyy-MM-dd")+"'";

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
            SqlDataSource1.SelectCommand = "SELECT SBID, PID, SB_Code, SB_Name, BookInTime, BookContractDate, LastContractDate, ContractWay, WorkManDep, WorkManName, BudgetPrice, BudgetLockNY, SC_Code FROM SubBudgetList where pid= "+Session["ProjectCode"].ToString();
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
                Label BookContractDate = (Label)e.Row.FindControl("BookContractDate");
                Label LastContractDate = (Label)e.Row.FindControl("LastContractDate");



                BookInTime.Text = BookInTime.Text != "" ? DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd") : "";
                BookContractDate.Text = BookContractDate.Text != "" ? DateTime.Parse(BookContractDate.Text).ToString("yyyy-MM-dd") : "";
                LastContractDate.Text = LastContractDate.Text!=""?DateTime.Parse(LastContractDate.Text).ToString("yyyy-MM-dd"):"";

              

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

        protected void BtnRequire_Click(object sender, EventArgs e)
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
                string SQLInsertMaterial = "SBID,FirmID,SB_MID,PriceID,Explan,Note";
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
                DataTableDrS["RFQ_Warranty"] =TxRFQ_Warranty.Text!=""?decimal.Parse(TxRFQ_Warranty.Text):0;
                DataTableDrS["RFQ_Attach1"] = CheckBox1.Checked ? true : false;
                DataTableDrS["RFQ_Attach2"] = CheckBox2.Checked ? true : false;
                DataTableDrS["RFQ_Attach3"] = CheckBox3.Checked ? true : false;
                DataTableDrS["RFQ_Attach4"] = CheckBox4.Checked ? true : false;
                DataTableDrS["RFQ_Attach5"] = CheckBox5.Checked ? true : false;
                DataTableDrS["RFQ_Attach6"] = CheckBox6.Checked ? true : false;
                DataTableDrS["RFQ_AttachOther"] = TextBox6.Text; 
                DataTableDrS["RFQ_Notes"] = TxRFQ_Notes.Text;

                DataTableBoxS.Rows.Add(DataTableDrS);
                bool j = WebModel.EditAction_Anyid(database, "SubBudgetList", "SBID", LbSBID.Text, DataTableBoxS);

                int i = 1;
                foreach (GridViewRow row in GridView4.Rows)
                {
                    CheckBox CheckBoxSF = (CheckBox)row.FindControl("CheckBoxSF");
                    Label UID = (Label)row.FindControl("UID");
                    DataRow DataTableDr1 = DataTableBoxF.NewRow();


                    if (CheckBoxSF.Checked == true)
                    {

                        DataTableDr1["Sort"] = i;
                        DataTableDr1["SBID"] = LbSBID.Text;                        
                        DataTableDr1["FirmID"] = UID.Text;                      
                        DataTableDr1["ExpiretionDate"] = TxRFQ_ReplyDate.Text;
                        //DataTableDr1["Notes"] = TxRFQ_Notes.Text;

                        DataTableBoxF.Rows.Add(DataTableDr1);
                        insert1 = WebModel.SaveAction(database, "SubRFQ_Firm", DataTableBoxF);
                        DataTableBoxF.Rows.Clear();
                        i++;
                    
              
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

                        //foreach (GridViewRow row in GridView4.Rows)
                        //{
                        //    

                        //    CheckBox CheckBox3 = (CheckBox)row.FindControl("CheckBox3");
                        //    Label UID = (Label)row.FindControl("UID");

                            //if (CheckBox3.Checked == true)
                            //{


                                DataTableDr["SBID"] = LbSBID.Text;
                                DataTableDr["SB_MID"] = LbSB_MID.Text;
                                //DataTableDr["UnitPrice"] = "";                              
                                DataTableDr["FirmID"] = UID.Text;
                                //DataTableDr["ComplexPrice"] = "";
                                DataTableDr["Note"] = TxRFQ_Notes.Text;

                                DataTableBoxM.Rows.Add(DataTableDr);
                                insert = WebModel.SaveAction(database, "SubRFQ_Material", DataTableBoxM);
                                DataTableBoxM.Rows.Clear();


                            //}
                            //string SQLLibrary = "Update Bid_Library Set RFQ_Code='" + RFQ_Code + "' where PriceID= " + LbPrice.Text + "";
                            //WebModel.SQLAction(database, SQLLibrary);
                        }

                    }
                    }

                }
                if (insert != "1" && insert1 != "1" && j !=true)
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

              
    }
}