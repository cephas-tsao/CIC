using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class PurchaseView : System.Web.UI.Page
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
                SqlDataSource1.SelectCommand = " SELECT * FROM SubContract_Main a INNER JOIN FirmM b ON a.FirmID = b.UID RIGHT OUTER JOIN SubBudgetList c ON a.SC_Code = c.SC_Code WHERE (a.PID = " + Session["ProjectCode"].ToString() + ")";

            }
          
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
           
            if (!IsPostBack)
            {
                string SQLSelect = "Select max(Edition) as id  from SubContract_Change";
                int Cedittion = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "id") !=""?int.Parse(WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "id")):0;

                if (ViewState["edition"] == null)
                {
                    for (int i = 1; i <= Cedittion; i++)
                    {
                        CheckBoxList1.Items.Add(new ListItem("第" + i.ToString() + "次追加減", i.ToString()));

                    }

                }
                ViewState["edition"] = true;
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
        protected void LinkButton34_Click(object sender, EventArgs e)
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
        protected void LinkButton35_Click(object sender, EventArgs e)
        {
            if ((Pnl_file0.Visible == true))
            {
                Pnl_file0.Visible = false;
            }
            else
            {
                Pnl_file0.Visible = true;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_InviteQ.Visible == true))
            {
                Pnl_InviteQ.Visible = false;
            }
            else
            {
                Pnl_InviteQ.Visible = true;
            }
        }
        protected void LinkButton36_Click(object sender, EventArgs e)
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
        protected void Button44_Click(object sender, EventArgs e)
        {
            MultiView.Visible = true;
        }
        protected void Button42_Click(object sender, EventArgs e)
        {
            Pnl_Detail.Visible = true;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSrSubName.Text));

            #region 搜尋條件
            string SelectString = ""; 

            //SelectString = (DDL_Sub.SelectedValue != "") ? "SC_Name like '%" + KeyWord + "%' " : "";
            SelectString = (KeyWord != "") ? "" + DDL_Sub.SelectedValue + " like '%" + KeyWord + "%' " : "";
           
            if (KeyWord != "" && DDL_Firm.SelectedValue != "0")
            {
                SelectString += DDL_Op1.SelectedValue;
            }
            if (DDL_Firm.SelectedValue != "0")
            {
                SelectString += " FirmID=" + DDL_Firm.SelectedValue;
            }

            SelectString = (SelectString.Length > 1) ? SelectString : "";
         
            SqlDataSource1.SelectCommand += (SelectString.Length > 1) ? " and " + SelectString + " and a.pid=" + Session["ProjectCode"].ToString() : "";


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
                string SBID = ((Label)GridView1.Rows[ID_class].FindControl("SBID")).Text.Trim();
                LbSCID.Text = ((Label)GridView1.Rows[ID_class].FindControl("SCID")).Text.Trim();
                LbSB_Code.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Code")).Text.Trim();
                LbSB_Name.Text = ((Label)GridView1.Rows[ID_class].FindControl("SB_Name")).Text.Trim();             
                LbBookInTime.Text = ((Label)GridView1.Rows[ID_class].FindControl("BookInTime")).Text.Trim();
                LbBudgetPrice.Text = ((Label)GridView1.Rows[ID_class].FindControl("BudgetPrice")).Text.Trim();
                SqlDataSource6.SelectCommand = "SELECT * FROM [SubContract_Item] WHERE [SCID] = " + LbSCID.Text;
                SqlDataSource4.SelectCommand = "SELECT * FROM [SubContract_File] WHERE SCID=" + LbSCID.Text;
                SqlDataSource2.SelectCommand = "SELECT [UID], [Name], [Type], [Path] FROM [SubRFQ_File] where SBID=" + SBID;
                SqlDataSource3.SelectCommand = "SELECT FirmM.Name, FirmM.UID, SubRFQ_Firm.FirmID, SubRFQ_Firm.SBID, SubRFQ_Firm.Sort, SubRFQ_Firm.TotalPrice, SubRFQ_Firm.GetNY, SubBudgetList.RFQ_ReplyDate FROM FirmM INNER JOIN SubRFQ_Firm ON FirmM.UID = SubRFQ_Firm.FirmID INNER JOIN SubBudgetList ON SubRFQ_Firm.SBID = SubBudgetList.SBID WHERE (SubRFQ_Firm.SBID =" + SBID + ") ORDER BY SubRFQ_Firm.Sort";
                string SQLSelect = "SELECT * FROM SubContract_Main a INNER JOIN FirmM b ON a.FirmID = b.UID RIGHT OUTER JOIN SubBudgetList c ON a.SC_Code = c.SC_Code WHERE (a.PID = " + Session["ProjectCode"].ToString() + " and a.SCID=" + LbSCID.Text + ")";
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        LbContractWay.Text = row["ContractWay"].ToString();
                        LbWorkManName.Text = row["WorkManName"].ToString();
                        LbBookContractDate.Text = DateTime.Parse(row["BookContractDate"].ToString()).ToString("yyyy-MM-dd");
                        LbLastContractDate.Text = DateTime.Parse(row["LastContractDate"].ToString()).ToString("yyyy-MM-dd");
                        LbBudgetPrice.Text = row["BudgetPrice"].ToString() !=""?decimal.Parse(row["BudgetPrice"].ToString()).ToString("N0"):"";

                        LbBookInTime1.Text = DateTime.Parse(row["BookInTime"].ToString()).ToString("yyyy-MM-dd");
                        LbContractWay1.Text = row["ContractWay"].ToString();
                        LbWorkManName1.Text = row["WorkManName"].ToString();
                        LbBookContractDate1.Text = DateTime.Parse(row["BookContractDate"].ToString()).ToString("yyyy-MM-dd");
                        LbLastContractDate1.Text = DateTime.Parse(row["LastContractDate"].ToString()).ToString("yyyy-MM-dd");
                        LbBudgetPrice1.Text = row["BudgetPrice"].ToString() != "" ? decimal.Parse(row["BudgetPrice"].ToString()).ToString("N0") : "";
                        LbSB_Code1.Text = row["SB_Code"].ToString();
                        LbSB_Name1.Text = row["SB_Name"].ToString();
                        LbRFQ_ReplyDate.Text = DateTime.Parse(row["RFQ_ReplyDate"].ToString()).ToString("yyyy-MM-dd");
                        LbRFQ_Warranty.Text = row["RFQ_Warranty"].ToString();
                        LbRFQ_Notes.Text = row["RFQ_Notes"].ToString();

                        CheckBox1.Checked = row["RFQ_Attach1"].ToString() == "1" ? true : false;
                        CheckBox2.Checked = row["RFQ_Attach2"].ToString() == "1" ? true : false;
                        CheckBox3.Checked = row["RFQ_Attach3"].ToString() == "1" ? true : false;
                        CheckBox4.Checked = row["RFQ_Attach4"].ToString() == "1" ? true : false;
                        CheckBox5.Checked = row["RFQ_Attach5"].ToString() == "1" ? true : false;
                        CheckBox6.Checked = row["RFQ_Attach6"].ToString() == "1" ? true : false;
                        CheckBox7.Checked = row["RFQ_AttachOther"].ToString() == "1" ? true : false;

                        LbFirm.Text = row["Name"].ToString();
                        LbTotalPrice1.Text = row["TotalPrice"].ToString();
                        LbLastTotalPrice.Text = row["LastTotalPrice"].ToString();
                        LbSC_Code.Text = row["SC_Code"].ToString();
                        LbSC_Name.Text = row["SC_Name"].ToString();
                        LbContractType.Text = row["ContractType"].ToString();
                        LbBookInTime2.Text = DateTime.Parse(row["BookInTime"].ToString()).ToString("yyyy-MM-dd");
                        LbGuaranteeWay.Text = row["GuaranteeWay"].ToString();
                        LbSubmitPercent.Text = row["SubmitPercent"].ToString();
                        LbRequestNum.Text = row["RequestNum"].ToString();
                        LbRequestDate.Text = row["RequestDate"].ToString();
                        LbPayDate.Text=row["PayDate"].ToString();
                        LbDurationRule.Text = row["DurationRule"].ToString();
                        LbPunishType.Text = row["PunishType"].ToString() + row["Punish"].ToString();
                        LbWarrantyYear.Text = row["WarrantyYear"].ToString();
                        LbScope.Text = row["Scope"].ToString();
                        LbTaxPercent.Text = row["TaxPercent"].ToString();
                        LbContractNote.Text = row["ContractNote"].ToString();
                        LbLastEdition.Text = row["LastEdition"].ToString();

                        LbPrepayPercent.Text = row["PrepayPercent"].ToString();
                        LbPrepayCash.Text = row["PrepayCash"].ToString();
                        LbPrepayCheck.Text = row["PrepayCheck"].ToString();
                        LbPrepayCheckDay.Text = row["PrepayCheckDay"].ToString();
                        LbPrepayGuarantee.Text = row["PrepayGuarantee"].ToString();
                        LbFundCash.Text = row["FundCash"].ToString();
                        LbFundCheck.Text = row["FundCheck"].ToString();
                        LbFundCheckDay.Text = row["FundCheckDay"].ToString();
                        LbRetentionPercent.Text = row["RetentionPercent"].ToString();
                        LbRetentionCash.Text = row["RetentionCash"].ToString();
                        LbRetentionCheck.Text = row["RetentionCheck"].ToString();
                        LbRetentionCheckDay.Text=row["RetentionCheckDay"].ToString();
                        LbWarrantyPercent.Text = row["WarrantyPercent"].ToString();
                        LbWarrantyCash.Text = row["WarrantyCash"].ToString();
                        LbWarrantyCheck.Text = row["WarrantyCheck"].ToString();
                        LbWarrantyCheckDay.Text = row["WarrantyCheckDay"].ToString();
                        LbWarrantyWay.Text = row["WarrantyWay"].ToString();

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
                LbBPrice.Text = LbBPrice.Text != "" ? decimal.Parse(LbBPrice.Text).ToString("N0") : "";
                LbBComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(LbBPrice.Text)).ToString("N0");


            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView2.PageSize;
            int UID = (int)GridView2.DataKeys[ID_class].Value;

            Label Path = (Label)GridView2.Rows[ID_class].FindControl("Path");
            Label Name = (Label)GridView2.Rows[ID_class].FindControl("Name");
            Label SCID = (Label)GridView2.Rows[ID_class].FindControl("SCID");
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

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView3.PageSize;
            string database = Session["DatabaseName"].ToString();
          
            Label SBID = (Label)GridView3.Rows[ID_class].FindControl("SBID");
            Label FirmID = (Label)GridView3.Rows[ID_class].FindControl("FirmID");
            Label UID = (Label)GridView3.Rows[ID_class].FindControl("UID");
           
            if (e.CommandName == "Select")
            {
                string SQLSelect = "Select * From SubRFQ_Firm a left join FirmM b on a.FirmID=b.UID Where a.SBID = " + SBID.Text + " And a.FirmID=" + FirmID.Text;
                SqlDataSource7.SelectCommand = "SELECT * FROM SubRFQ_Material A LEFT JOIN SubBudget_Item B ON A.SBID=B.SBID AND A.SB_MID=B.SB_MID WHERE A.[SBID] = " + SBID.Text + " and A.FirmID=" + FirmID.Text;
          
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        LbFrim.Text = row["Name"].ToString();
                        LbExpiretionDate.Text = row["ExpiretionDate"].ToString();
                        LbTotalPrice.Text = row["TotalPrice"].ToString() !=""?decimal.Parse(row["TotalPrice"].ToString()).ToString("N0"):"";
                        LbDisTotalPrice.Text = row["DisTotalPrice"].ToString() !=""?decimal.Parse(row["DisTotalPrice"].ToString()).ToString("N0"):"";
                        LbGetNY.Text = row["GetNY"].ToString() == "1" ? "是" : "否";
                        LbTax.Text = row["Tax"].ToString() !=""? decimal.Parse(row["Tax"].ToString()).ToString("N0"):"";
                        LbDisContent.Text = row["DiscountPercent"].ToString() + "-" + row["DiscountTotal"].ToString()+"元";


                    }

                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label LbUnitPrice = (Label)e.Item.FindControl("LbUnitPrice");
                Label LbComplexPrice = (Label)e.Item.FindControl("LbComplexPrice");
                Label LbDisUnitPrice = (Label)e.Item.FindControl("LbDisUnitPrice");
                Label LbDisComplexPrice = (Label)e.Item.FindControl("LbDisComplexPrice");
                LbUnitPrice.Text = LbUnitPrice.Text != "" ? decimal.Parse(LbUnitPrice.Text).ToString("N0") : "";
                LbComplexPrice.Text = LbComplexPrice.Text != "" ? decimal.Parse(LbComplexPrice.Text).ToString("N0") : "";
                LbDisUnitPrice.Text = LbDisUnitPrice.Text != "" ? decimal.Parse(LbDisUnitPrice.Text).ToString("N0") : "";
                LbDisComplexPrice.Text = LbDisComplexPrice.Text != "" ? decimal.Parse(LbDisComplexPrice.Text).ToString("N0") : "";


            }
        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView4.PageSize;
            int UID = (int)GridView4.DataKeys[ID_class].Value;

            Label Path = (Label)GridView4.Rows[ID_class].FindControl("Path");
            Label Name = (Label)GridView4.Rows[ID_class].FindControl("Name");
            //Label SCID = (Label)GridView4.Rows[ID_class].FindControl("SCID");
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

        protected void BtnReload_Click(object sender, EventArgs e)
        {
            StringBuilder tmpStr = new StringBuilder();
            StringBuilder tmpStr1 = new StringBuilder();
           
            string database = Session["DatabaseName"].ToString();
            string tmpListStr = "";
            string tmpListStr1 = "";
            string tmpListStr2 = "";
            string tmpListStr3 = "";
            tmpListStr = @"  <tr><td class=""auto-style102"" rowspan=""2"">執行項次</td>
                                  <td class=""auto-style102"" rowspan=""2"">工料名稱</td>
                                   <td class=""auto-style102"" rowspan=""2"">單位</td>                                    
                                    <td class=""auto-style102"" rowspan=""2"">單價</td>
                                    ";
            tmpStr.AppendLine(string.Format(tmpListStr));
            var totalcount = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();
            foreach (ListItem item1 in CheckBoxList1.Items)
            {
             
                if (item1.Selected == true)
                {

                    if (item1.Value == "0")
                    {
                        tmpListStr1 = @"  <td class=""auto-style102"" colspan=""{0}"">原分包合約預算</td>  ";
                        tmpStr.AppendLine(string.Format(tmpListStr1, totalcount));
                    }
                    else 
                    {
                       
                        tmpListStr2 = @"  <td class=""auto-style102"" colspan=""{1}"">第{0}次追加減</td>  ";
                        tmpStr.AppendLine(string.Format(tmpListStr2, item1.Value, totalcount));
                    }
                   
                }
                
            }
            tmpListStr3 += @"</tr><tr>";
            foreach (ListItem item1 in CheckBoxList1.Items)
            {
                if (item1.Selected == true)
                {
                    tmpListStr3 += CheckBoxList2.Items[0].Selected == true ? @"<td class=""auto-style102"">數量</td>" : "";
                    tmpListStr3 += CheckBoxList2.Items[1].Selected == true ? @"<td class=""auto-style102"">複價</td>" : "";
                    tmpListStr3 += CheckBoxList2.Items[2].Selected == true ? @"<td class=""auto-style102"">備註</td>" : "";
                  
                }
            }
                    tmpListStr3 += @"</tr>";
                    tmpStr1.AppendLine(string.Format(tmpListStr3));
         
                    Literal1.Text = tmpStr.ToString() + tmpStr1.ToString();
                    DataContent();
        }
        protected void DataContent()
        {
            string database = Session["DatabaseName"].ToString();
            string vsSql = "";                      
          
            //Stopwatch stopwatch = new Stopwatch();
            //stopwatch.Start();

            string ListStr1 = @"<tr><td class=""auto-style105"">
                                        <asp:Label ID=""Label738"" runat=""server"" Font-Names=""微軟正黑體"" Font-Size=""Medium"" >{2}</asp:Label>
                                    </td><td class=""auto-style105"">
                                        <asp:Label ID=""Label736"" runat=""server"" Font-Size=""Medium"" Height=""25px"">{0}</asp:Label>
                                    </td><td class=""auto-style103"">
                                        <asp:Label ID=""Label737"" runat=""server"" Font-Size=""Medium"" Height=""25px"" Width=""50px"">{1}</asp:Label>
                                    </td>  <td class=""auto-style106"">{3}</td>";

                string selectedValue = "";


                StringBuilder tmpStr1 = new StringBuilder();           
          
                var totalcount1 = CheckBoxList1.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList1被選擇之數量(欄位選擇)
                var totalcount2 = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList2被選擇之數量(變更次別)
                foreach (ListItem item1 in CheckBoxList1.Items)
                {

                    if (item1.Selected == true)
                    {
                        selectedValue += item1.Value + ",";
                    }
                }
                DataTable vsDt = new DataTable();
                vsSql = @"Select * From SubContract_Item  Where SCID=" + LbSCID.Text + "";
                vsDt = WebModel.LoadSetContentData(database, vsSql);


                if (vsDt.Rows.Count > 0)
                {

                    for (int i = 0; i < vsDt.Rows.Count; i++)
                    {

                        DataRow vsDr = vsDt.Rows[i];
                        string SC_MID = vsDr["SC_MID"].ToString();
                        string ItemName = vsDr["ItemName"].ToString();
                        string Unit = vsDr["Unit"].ToString();
                        string BelongItem = vsDr["BelongItem"].ToString();
                        string UnitPrice = vsDr["UnitPrice"].ToString();
                        string SCNumber = vsDr["SCNumber"].ToString() != "" ? vsDr["SCNumber"].ToString() : "0";
                        string ComplexPrice = vsDr["ComplexPrice"].ToString() != "" ? decimal.Parse(vsDr["ComplexPrice"].ToString()).ToString("N0") : "0";
                        string Note = vsDr["Note"].ToString();

                        tmpStr1.AppendLine(string.Format(ListStr1, ItemName, Unit, BelongItem, UnitPrice));

                foreach (ListItem item in CheckBoxList1.Items)
                {
                  
                    if (item.Selected == true)
                    {
                                if (item.Value == "0")
                                {
                                    if (CheckBoxList2.Items[0].Selected == true)
                                    {
                                        tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", SCNumber));

                                    }
                                    if (CheckBoxList2.Items[1].Selected == true)
                                    {
                                        tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", ComplexPrice));

                                    }
                                    if (CheckBoxList2.Items[2].Selected == true)
                                    {
                                        tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", Note));

                                    }
                                }
                                else
                                {
                                       
                                   
                                        DataTable Addvalue = SubContract.LoadContentData_CB(database, LbSCID.Text, selectedValue);
                                        if (Addvalue.Rows.Count > 0)
                                        {
                                            DataRow vsDr1 = Addvalue.Rows[i];
                                            string LbUnitPrice = vsDr1["UnitPrice"].ToString() != "" ? vsDr1["UnitPrice"].ToString() : "0";
                                            string LbChNumber = vsDr1["ChNumber" + item.Value + ""].ToString() != "" ? vsDr1["ChNumber" + item.Value + ""].ToString() : "0";
                                            string LbNote = vsDr1["Note" + item.Value + ""].ToString();
                                            string LbEComplex = (decimal.Parse(LbChNumber) * decimal.Parse(LbUnitPrice)).ToString("N0");

                                         
                                                if (CheckBoxList2.Items[0].Selected == true)
                                                {
                                                    tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", LbChNumber));

                                                }

                                                if (CheckBoxList2.Items[1].Selected == true)
                                                {
                                                    tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", LbEComplex));

                                                }
                                                if (CheckBoxList2.Items[2].Selected == true)
                                                {
                                                    tmpStr1.AppendLine(string.Format("<td class=\"auto-style106\">{0}</td>", LbNote));
                                                }
                                            }
                                                                             
                                        }
                               
                                    }

                
                            }
                            tmpStr1.AppendLine(string.Format("</tr>"));
                        }


                    Literal2.Text = tmpStr1.ToString();
                //stopwatch.Stop();              
                //Console.WriteLine("Time elapsed: {0}", stopwatch.Elapsed);
            }
        }
               
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label BookInTime = (Label)e.Row.FindControl("BookInTime");
                Label BudgetPrice = (Label)e.Row.FindControl("BudgetPrice");


                BookInTime.Text = BookInTime.Text != "" ? DateTime.Parse(BookInTime.Text).ToString("yyyy-MM-dd") : "";
                BudgetPrice.Text = BudgetPrice.Text != "" ? decimal.Parse(BudgetPrice.Text).ToString("N0") : "";

            }
        }
    }
}