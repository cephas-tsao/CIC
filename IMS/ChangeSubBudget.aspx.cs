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
    public partial class ChangeSubBudget : System.Web.UI.Page
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
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
               
      
            if (!IsPostBack)
            {
                string SQLSelect = "Select LastEdition as id  from SubContract_Main  where pid=" + Session["ProjectCode"].ToString();
                string id = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "id");
                if (id != "")
                {
                    int Cedittion = int.Parse(WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "id")) + 1;

                    if (ViewState["edition"] == null)
                    {
                        for (int i = 1; i <= Cedittion; i++)
                        {
                            CheckBoxList1.Items.Add(new ListItem("第" + i.ToString() + "次追加減", i.ToString()));

                        }

                    }
                
                }
                ViewState["edition"] = true;
                ViewState["Dtvs_c"] = "";
                Session["itemWi"] = "";
                ViewState["first"] = false;
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
        protected void Button42_Click(object sender, EventArgs e)
        {
            Pnl_SubContract.Visible = true;
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
                LbSubName.Text = ((Label)GridView1.Rows[ID_class].FindControl("SC_Name")).Text.Trim();
             
                //SqlDataSource3.SelectCommand = "SELECT * FROM [SubContract_File] WHERE [SCID] = " + SCID.Text;
                string SQLSelect = "Select * from SubContract_Main INNER JOIN FirmM ON SubContract_Main.FirmID = FirmM.UID WHERE SubContract_Main.SCID =" + SCID.Text;
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        LbSubNum.Text = row["SC_Code"].ToString();
                        LbContractType.Text = row["ContractType"].ToString();

                        LbGuaranteeWay.Text = row["GuaranteeWay"].ToString();
                        LbSubmitPercent.Text = row["SubmitPercent"].ToString();
                        LbRequestNum.Text = row["RequestNum"].ToString();
                        LbRequestDate.Text = row["RequestDate"].ToString();
                        LbPayDate.Text = row["PayDate"].ToString();
                        LbDurationRule.Text = row["DurationRule"].ToString();
                        LbPunishType.Text = row["PunishType"].ToString() + row["Punish"].ToString()+"元";                    
                          
                      
                       
                        LbWarrantyYear.Text = row["WarrantyYear"].ToString();
                        LbScope.Text = row["Scope"].ToString();
                        LbTaxPercent.Text = row["TaxPercent"].ToString();
                        LbContractNote.Text = row["ContractNote"].ToString();
                        LbWarrantyYear.Text = row["WarrantyYear"].ToString();
                        LbRequestDate.Text = row["RequestDate"].ToString();
                        LbPayDate.Text = row["PayDate"].ToString();
                        string SQLSelect1="Select * from SubContract_Main where SCID="+SCID.Text;
                        LbLastEdition.Text =(int.Parse(WebModel.SItemName(database, SQLSelect1, "LastEdition"))+1).ToString();
                        BtnReload_Click(this, null);
                    }


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
            tmpListStr = @"  <tr>  
                                    <td class=""auto-style102"" rowspan=""2"">&nbsp;</td>
                                    <td class=""auto-style102"" rowspan=""2"">執行項次</td>
                                    <td class=""auto-style102"" rowspan=""2"">工料名稱</td>
                                    <td class=""auto-style102"" rowspan=""2"">單位</td>
                                   
                                    <td class=""auto-style102"" rowspan=""2"">單價</td>
                                    ";
            tmpStr.AppendLine(string.Format(tmpListStr));
            if ((bool)ViewState["first"] == false)
            {
                CheckBoxList1.Items[int.Parse(LbLastEdition.Text)].Selected = true;
                ViewState["first"] = true;

            }
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

            string ListStr1 = @"<tr>  <td class=""auto-style103"">
                                  <a href=""{4}"" target=_blank   ><img src="" ../img/Edit.png"" alt=""檢視單價分析""  style=""Width:27px"" ></a>
                                    </td><td class=""auto-style105"">
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
       
            int max=0;
            foreach (ListItem item1 in CheckBoxList1.Items)
            {

                if (item1.Selected == true)
                {
                    selectedValue += item1.Value + ",";
                  
                    if(max<int.Parse(item1.Value))
                    {
                     max = int.Parse(item1.Value);
                    }
                }
            }
            DataTable vsDt = new DataTable();
            vsSql = @"Select * From SubContract_Item  Where SCID=" + SCID.Text + "";
            vsDt = WebModel.LoadSetContentData(database, vsSql);
            //vsDt.Columns.Add("BKID");
            vsDt.Columns.Add("ChNumber" + LbLastEdition.Text);
            DataRow DtRow;
            ViewState["DtVs"] = vsDt;
            if (ViewState["Dtvs_c"] != "" && ViewState["Dtvs_c"] !=null)
            {
                DataTable Vsdt1 = (DataTable)ViewState["Dtvs_c"];            

             
                for (int i=0; i< Vsdt1.Rows.Count;i++)
                {
                    
                    DataRow row = Vsdt1.Rows[i];
                    if (Vsdt1.Rows[i]["SC_MID"].ToString() == "0")
                    {
                        DtRow = vsDt.NewRow();
                        //DtRow["BKID"] = Vsdt1.Rows[i]["BKID"].ToString();
                        DtRow["SC_MID"] = Vsdt1.Rows[i]["SC_MID"].ToString();
                        DtRow["SCID"] = Vsdt1.Rows[i]["SCID"].ToString();
                        DtRow["ItemName"] = Vsdt1.Rows[i]["ItemName"].ToString();
                        DtRow["Unit"] = Vsdt1.Rows[i]["Unit"].ToString();
                        DtRow["BelongEWID"] = Vsdt1.Rows[i]["BelongEWID"].ToString() != "" ? Vsdt1.Rows[i]["BelongEWID"].ToString() : "0";
                        DtRow["BelongItem"] = Vsdt1.Rows[i]["BelongItem"].ToString();
                        DtRow["SCNumber"] = Vsdt1.Rows[i]["SCNumber"].ToString() != "" ? Vsdt1.Rows[i]["SCNumber"].ToString() : "0";
                        DtRow["ChNumber" + LbLastEdition.Text] = Vsdt1.Rows[i]["ChNumber" + LbLastEdition.Text].ToString();
                        DtRow["UnitPrice"] = Vsdt1.Rows[i]["UnitPrice"].ToString();
                        DtRow["ComplexPrice"] = Vsdt1.Rows[i]["ComplexPrice"].ToString() != "" ? decimal.Parse(Vsdt1.Rows[i]["ComplexPrice"].ToString()) : 0;
                        DtRow["LastComplexPrice"] = Vsdt1.Rows[i]["LastComplexPrice"].ToString() != "" ? decimal.Parse(Vsdt1.Rows[i]["LastComplexPrice"].ToString()) : 0;
                        DtRow["LastEdition"] = Vsdt1.Rows[i]["LastEdition"].ToString() != "" ? decimal.Parse(Vsdt1.Rows[i]["LastEdition"].ToString()) : 0;
                        DtRow["Note"] = Vsdt1.Rows[i]["Note"].ToString();
                        vsDt.Rows.Add(DtRow);

                    }
                    else
                    {
                        vsDt.Rows[i]["ChNumber" + LbLastEdition.Text] = row["ChNumber" + LbLastEdition.Text].ToString();
                        //DataTableBox.Rows[j]["Note" + DataName + ""] = Note;
                    }
                   }
                 
            
               
                //vsDt =(DataTable) ViewState["Dtvs_c"];
                ViewState["DtVs"] = vsDt;
                //Vsdt1.Clear();
            }
            //SubContract_Change追加預算的版次
            DataTable Addvalue = SubContract.LoadContentData_CB(database, SCID.Text, selectedValue);
            //DataRow DataTableDr = Addvalue.Rows.;
              DataRow DataTableDr;
              if (Addvalue.Rows.Count > 0)
              {
                  if (Addvalue.Rows.Count < vsDt.Rows.Count)
                  {
                      int num = vsDt.Rows.Count - Addvalue.Rows.Count;
                      for (int j = Addvalue.Rows.Count; j < vsDt.Rows.Count; j++)
                      {
                          //DataTableDr = Addvalue.Rows[j];
                          DataTableDr = Addvalue.NewRow();
                          Addvalue.Columns["SCID"].AllowDBNull = true;
                          Addvalue.Columns["LastEdition"].AllowDBNull = true;
                          DataTableDr["SCID"] = SCID.Text;
                          DataTableDr["UnitPrice"] = vsDt.Rows[j]["UnitPrice"].ToString();
                          if (max == int.Parse(LbLastEdition.Text))
                          {
                              DataTableDr["ChNumber" + LbLastEdition.Text] = vsDt.Rows[j]["ChNumber" + LbLastEdition.Text].ToString();
                          }
                          //Addvalue.Columns.Add("ChNumber" + LbLastEdition.Text);vsDr["SCNumber" + LbLastEdition.Text];
                          Addvalue.Rows.Add(DataTableDr);
                      }
                  }
              }
            if (vsDt.Rows.Count > 0)
            {

                for (int i = 0; i < vsDt.Rows.Count; i++)
                {

                    DataRow vsDr = vsDt.Rows[i];
                    //string BKID = vsDr["BKID"].ToString();
                    string SC_MID = vsDr["SC_MID"].ToString();
                    string ItemName = vsDr["ItemName"].ToString();
                    string Unit = vsDr["Unit"].ToString();
                    string BelongItem = vsDr["BelongItem"].ToString();
                    string BelongEWID = vsDr["BelongEWID"].ToString();
                    string UnitPrice = vsDr["UnitPrice"].ToString();
                    string SCNumber = vsDr["SCNumber"].ToString() != "" ? vsDr["SCNumber"].ToString() : "0";
                    string ComplexPrice = "";
                    if (vsDr["ComplexPrice"].ToString() != "")
                    {
                         ComplexPrice = decimal.Parse(vsDr["ComplexPrice"].ToString()).ToString("N0");
                    }
                    else if (vsDr["ComplexPrice"].ToString() == "")
                    {

                        ComplexPrice = (decimal.Parse(UnitPrice) * decimal.Parse(SCNumber)).ToString("N0");

                    }
                  

                    string Note = vsDr["Note"].ToString();
                    string Link = "SubChangeDetail.aspx?EWID=" + BelongEWID + "&SC_MID=" + SC_MID + "&edition=" + LbLastEdition.Text;

                    tmpStr1.AppendLine(string.Format(ListStr1, ItemName, Unit, BelongItem, UnitPrice, Link));
                  
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
                            else if (Addvalue.Rows.Count>0)
                            {

                            
                                   DataTableDr=Addvalue.Rows[i];
                                   string SCNumber1 = "ChNumber" + LbLastEdition.Text + "";
                                   if (vsDt.Columns[SCNumber1] != null && Addvalue.Columns["ChNumber" + LbLastEdition.Text] != null)
                                   {
                                       vsDt.Columns["LastEdition"].AllowDBNull = true;
                                       //Addvalue.Rows[i]["ChNumber" + LbLastEdition.Text] = vsDt.Rows[i]["ChNumber" + LbLastEdition.Text].ToString();
                                       //Addvalue.Rows[i]["LastEdition"] = vsDt.Rows[i]["LastEdition"].ToString();
                                       if (vsDt.Rows[i]["ChNumber" + LbLastEdition.Text].ToString() != "")
                                       {
                                           Addvalue.Rows[i]["ChNumber" + LbLastEdition.Text] = vsDt.Rows[i]["ChNumber" + LbLastEdition.Text].ToString();
                                           Addvalue.Rows[i]["LastEdition"] = vsDt.Rows[i]["LastEdition"].ToString();
                                       }
                                       if (Addvalue.Rows[i]["ChNumber" + LbLastEdition.Text] != "")
                                       {
                                           vsDt.Rows[i]["ChNumber" + LbLastEdition.Text] = Addvalue.Rows[i]["ChNumber" + LbLastEdition.Text].ToString();
                                           vsDt.Rows[i]["LastEdition"] = Addvalue.Rows[i]["LastEdition"];

                                       }

                                    
                                   }
                                    //vsDr = Addvalue.Rows[i];
                                    string LbUnitPrice = DataTableDr["UnitPrice"].ToString() != "" ? DataTableDr["UnitPrice"].ToString() : "0";
                                    string LbChNumber = DataTableDr["ChNumber" + item.Value + ""].ToString() != "" ? DataTableDr["ChNumber" + item.Value + ""].ToString() : "0";
                                    string LbNote = DataTableDr["Note" + item.Value + ""].ToString();
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

                ViewState["DtVs"] = vsDt;
                Literal2.Text = tmpStr1.ToString();
                //stopwatch.Stop();              
                //Console.WriteLine("Time elapsed: {0}", stopwatch.Elapsed);
            //}
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('SubChangeAddMaterial.aspx?SCID=" + SCID.Text + "', 'window', config='height=1560,width=1500')</script>");

        }

        protected void Self_Click(object sender, EventArgs e)
        {
            //string ErrorString = ""; 
            DataTable DtVs=new DataTable();
             //DataRow Dr = DtVs.NewRow();
             if (ViewState["DtVs"] == null)
             {
                 string SQLString = "BKID,SC_MID,SCID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,ChNumber" + LbLastEdition.Text + ",UnitPrice,ComplexPrice,LastComplexPrice,LastEdition,Note";


                 foreach (string DataName in SQLString.Split(','))
                 {
                     DtVs.Columns.Add(DataName, typeof(string));
                 }

             }
             else
             {

                 DtVs = (DataTable)ViewState["DtVs"];
             }
            if (Session["OrItem"] != "" && Session["OrItem"] != null)
            {

                if ((DataTable)ViewState["DtVs"] != null)
                {


                    DataTable DtVs1 = (DataTable)Session["OrItem"];
                    //DtVs1.Columns.Add("BKID");
                 
                    DataRow DataTableDr;
                    if (DtVs.Columns["ChNumber" + LbLastEdition.Text] == null)
                    {
                    DtVs.Columns.Add("ChNumber" + LbLastEdition.Text);

                    }
                    if (DtVs1 != null && DtVs1.Rows.Count > 0)
                    {
                        for (int i = 0; i < DtVs.Rows.Count; i++)
                        //foreach (DataRow row in DtVs1.Rows)
                        {
                            DataTableDr = DtVs.Rows[i];
                            for (int j = 0; j < DtVs1.Rows.Count; j++)
                            {
                                DataRow row = DtVs1.Rows[j];
                                string SC_MID = row["SC_MID"].ToString();
                                if (SC_MID == DataTableDr["SC_MID"].ToString())
                                {

                                    //string BKID = row["BKID"].ToString();
                                    string ItemName = row["ItemName"].ToString();
                                    string Unit = row["Unit"].ToString();
                                    decimal LastSCNumber = decimal.Parse(DataTableDr["LastSCNumber"].ToString());
                                    string ChNumber = "";
                                    if (row["ChNumber" + LbLastEdition.Text] != "")
                                    {
                                        ChNumber = (decimal.Parse(row["ChNumber" + LbLastEdition.Text].ToString()) + LastSCNumber).ToString();
                                        DataTableDr["ChNumber" + LbLastEdition.Text] = ChNumber;
                                    }
                                    string UnitPrice = row["UnitPrice"].ToString();
                                    //string SC_MID = row["SC_MID"].ToString();
                                    string Edition = row["LastEdition"].ToString();                                 
                                    //DataTableDr["UnitPrice"] = UnitPrice;
                                    DataTableDr["LastEdition"] = Edition;
                                   
                                }
                            }
                        }
                        DtVs1.Dispose();
                    }
                }
                ViewState["Dtvs_c"] = DtVs;
                DataContent();
              
                DtVs.Dispose();
            }

            if (Session["itemRiAll"] != "" && Session["itemRiAll"] != null)
            {

                //if ((DataTable)ViewState["Dtvs"] != null)
                //{


                    DataTable DtVs1 = (DataTable)Session["itemRiAll"];
                    DataRow DataTableDr;

                    if (DtVs1 != null && DtVs1.Rows.Count > 0)
                    {

                        foreach (DataRow row in DtVs1.Rows)
                        {
                            DataTableDr = DtVs.NewRow();
                            string BKID = row["BKID"].ToString();
                            string ItemName = row["WiName"].ToString();
                            string Unit = row["WiUnit"].ToString();
                            string SCNumber = row["WiQuantity"].ToString();
                            string UnitPrice = row["WiPrice"].ToString();
                            string BWI = row["BWI"].ToString();
                            string ComplexPrice = row["WiComplex"].ToString();
                           
                            
                            DataTableDr["SCNumber"] = SCNumber;
                            DataTableDr["UnitPrice"] = UnitPrice;
                            DataTableDr["BKID"] = BKID;
                            DataTableDr["SC_MID"] = "0";
                            DataTableDr["SCID"] = SCID.Text;
                            DataTableDr["ItemName"] = ItemName;
                            DataTableDr["Unit"] = Unit;
                            DataTableDr["ChNumber" + LbLastEdition.Text] = SCNumber;
                            DataTableDr["ComplexPrice"] = ComplexPrice;
                            DataTableDr["LastEdition"] = LbLastEdition.Text;
                            DataTableDr["BelongItem"] = BWI;
                            
                          
                            DtVs.Rows.Add(DataTableDr);
                        }
                        DtVs1.Dispose();
                    }
                //}
                ViewState["Dtvs_c"] = DtVs;
                BtnReload_Click(this, null);

                DtVs.Dispose();
                Session["itemRiAll"] = "";
              
            }
            if (Session["itemRi"] != "" && Session["itemRi"] != null)
            {
               
                    DataTable DtVs1 = (DataTable)Session["itemRi"];
                    DataRow DataTableDr;

                    if (DtVs1 != null && DtVs1.Rows.Count > 0)
                    {

                        foreach (DataRow row in DtVs1.Rows)
                        {
                            DataTableDr = DtVs.NewRow();
                            //string BKID = row["BKID"].ToString();
                            string ItemName = row["ItemName"].ToString();
                            string Unit = row["Unit"].ToString();
                            string ENumber = row["ENumber"].ToString();
                            //string ChNumber = row["SCNumber" + LbLastEdition.Text].ToString();
                            string UnitPrice = row["EUnitPrice"].ToString();
                            string BWI = row["ItemOrder"].ToString();
                            string ComplexPrice = row["LastSubNumber"].ToString();

                          
                            DataTableDr["UnitPrice"] = UnitPrice;
                            //DataTableDr["BKID"] = BKID;
                            DataTableDr["SC_MID"] = "0";
                            DataTableDr["SCID"] = SCID.Text;
                            DataTableDr["ItemName"] = ItemName;
                            DataTableDr["Unit"] = Unit;
                            DataTableDr["SCNumber"] = ENumber;
                            //DataTableDr["ChNumber" + LbLastEdition.Text] = ChNumber;
                            DataTableDr["ComplexPrice"] = ComplexPrice;
                            DataTableDr["LastEdition"] = LbLastEdition.Text;
                            DataTableDr["BelongItem"] = BWI;
                            //DataTableDr["UnitPrice"] = UnitPrice;

                            DtVs.Rows.Add(DataTableDr);
                        }
                        DtVs1.Dispose();
                    }
                //}
                    ViewState["Dtvs_c"] = DtVs;
                    BtnReload_Click(this, null);

                    DtVs.Dispose();
                    Session["itemRi"] = "";
            }
            if (Session["itemWi"] != "" && Session["itemWi"] != null)
            {
                //DataTable DtVs = (DataTable)ViewState["Dtvs"];
                //DtVs.Columns.Add("BKID");
                //if ((DataTable)ViewState["DtVs"] != null)
                //{


                    DataTable DtVs1 = (DataTable)Session["itemWi"];
                    DataRow DataTableDr;
                    if (DtVs.Columns["ChNumber" + LbLastEdition.Text] == null)
                    {
                        DtVs.Columns.Add("ChNumber" + LbLastEdition.Text);
                    }
                    if (DtVs1 != null && DtVs1.Rows.Count > 0)
                    {

                        foreach (DataRow row in DtVs1.Rows)
                        {
                            DataTableDr = DtVs.NewRow();
                            //string BKID = row["BKID"].ToString();
                            string ItemName = row["ItemName"].ToString();
                            string Unit = row["Unit"].ToString();
                            string SCNumber = row["ENumber"].ToString();
                            //string ChNumber = row["SCNumber" + LbLastEdition.Text].ToString();
                            string UnitPrice = row["EUnitPrice"].ToString();
                            string BWI = row["ItemOrder"].ToString();
                            string ComplexPrice = row["LastSubNumber"].ToString();

                            //DataTableDr["BKID"] = BKID;
                            DataTableDr["SC_MID"] = "0";
                            DataTableDr["SCID"] = SCID.Text;
                            DataTableDr["ItemName"] = ItemName;
                            DataTableDr["Unit"] = Unit;
                            DataTableDr["SCNumber"] = SCNumber;
                            //DataTableDr["ChNumber" + LbLastEdition.Text] = ChNumber;
                            DataTableDr["UnitPrice"] = UnitPrice;
                            DataTableDr["LastEdition"] = LbLastEdition.Text;
                            DataTableDr["ComplexPrice"] = decimal.Parse(SCNumber) * decimal.Parse(UnitPrice);
                            DataTableDr["LastEdition"] = LbLastEdition.Text;
                            DataTableDr["BelongItem"] = BWI;

                            DtVs.Rows.Add(DataTableDr);
                        }
                        DtVs1.Dispose();
                    //}
                }
                ViewState["Dtvs_c"] = DtVs;
                BtnReload_Click(this, null);
                
                DtVs.Dispose();
                Session["itemWi"] = "";
            }

            if (Session["Dtvs1"] != "" && Session["Dtvs1"] != null)
            {
                //DataTable DtVs = (DataTable)ViewState["Dtvs"];
                //DtVs.Columns.Add("BKID");
                //if ((DataTable)ViewState["DtVs"] != null)
                //{


                    DataTable DtVs1 = (DataTable)Session["Dtvs1"];
                    DataRow DataTableDr;

                    if (DtVs1 != null && DtVs1.Rows.Count > 0)
                    {

                        foreach (DataRow row in DtVs1.Rows)
                        {
                            DataTableDr = DtVs.NewRow();
                            string BKID = row["BKID"].ToString();
                            string ItemName = row["ItemName"].ToString();
                            string Unit = row["Unit"].ToString();
                            string SCNumber = row["SCNumber" + LbLastEdition.Text].ToString();
                            string UnitPrice = row["UnitPrice"].ToString();
                            string BelongItem = row["BelongItem"].ToString();

                            DataTableDr["BKID"] = BKID;
                            DataTableDr["SC_MID"] = "0";
                            DataTableDr["SCID"] = SCID.Text;
                            DataTableDr["ItemName"] = ItemName;
                            DataTableDr["BelongItem"] = BelongItem;
                            DataTableDr["SCNumber"] = row["SCNumber"].ToString();
                            DataTableDr["Unit"] = Unit;
                            DataTableDr["ChNumber" + LbLastEdition.Text] = SCNumber;
                            DataTableDr["UnitPrice"] = UnitPrice;
                            DataTableDr["LastEdition"] = LbLastEdition.Text;
                            DataTableDr["ComplexPrice"] = decimal.Parse(SCNumber) * decimal.Parse(UnitPrice);
                        

                            DtVs.Rows.Add(DataTableDr);
                        }
                        DtVs1.Dispose();
                    }
              
                ViewState["Dtvs_c"] = DtVs;
               
                BtnReload_Click(this, null);
                //DataContent();             
                DtVs.Dispose();
                Session["Dtvs1"] = "";
          
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //Label test = (Label)Page.Master.FindControl("SC_MID");
            //Literal Duration = (Literal)Page.Master.FindControl("ContentPlaceHolder1").FindControl("SC_MID");
            //var literal = (Literal)FindControl("ContentPlaceHolder1").FindControl("SC_MID");
            //literal.Text = sb.ToString();
            string database = Session["DatabaseName"].ToString();
            bool result =false;
            string result1 ="0";
            bool result2 = false;
            DataTable DtVs;
            DataTable DataTableBox = new DataTable();
            DataRow DataTableDr;
            string SQLString = "SCID,SC_MID,ChNumber,Edition";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataTableDr = DataTableBox.NewRow();
            DtVs = (DataTable)ViewState["DtVs"];
            if (DtVs != null && DtVs.Rows.Count >0)
            {
                foreach (DataRow row in DtVs.Rows)
                {
                    string BKID = row["BKID"].ToString();
                    string SC_MID = row["SC_MID"].ToString();
                     string ItemName = row["ItemName"].ToString();
                     string Unit = row["Unit"].ToString();
                    decimal SCNumber = row["SCNumber"].ToString()!=""?decimal.Parse(row["SCNumber"].ToString()):0;
                    decimal UnitPrice =row["UnitPrice"].ToString()!=""?decimal.Parse(row["UnitPrice"].ToString()):0;
                     string BelongItem = row["BelongItem"].ToString();
                     string BelongEWID = row["BelongEWID"].ToString();
                    decimal LastAmount=0;
                    decimal ComplexPrice =row["ComplexPrice"].ToString() !=""?decimal.Parse(row["ComplexPrice"].ToString()):0;
                     if (SC_MID !="0")
                    {
                                      
                    decimal ChNumber = 0;
                    //if (DtVs.Columns["ChNumber" + LbLastEdition.Text] !=null)
                    //{
                    //    if (row["ChNumber" + LbLastEdition.Text].ToString() != "")
                    //    {
                    if (SC_MID !="0")
                         {
                            ChNumber = row["ChNumber" + LbLastEdition.Text].ToString() != "" ? decimal.Parse(row["ChNumber" + LbLastEdition.Text].ToString()) : 0;
                            decimal LastComplexPrice = (UnitPrice) * (ChNumber);
                            string SQLUpdate = "Update SubContract_Item Set LastSCNumber='" + ChNumber + "' ,LastComplexPrice='" + LastComplexPrice + "', LastEdition='" + LbLastEdition.Text + "'";
                            //string SQLInsert = "Insert into SubContract_Change (SCID,SC_MID,ChNumber,Edition) Values ('" + SCID.Text + "','" + SC_MID + "','" + ChNumber + "','" + LbLastEdition.Text + "')";
                            DataTableDr["SCID"] = SCID.Text;
                            DataTableDr["SC_MID"] = SC_MID;
                            DataTableDr["ChNumber"] = ChNumber;
                            DataTableDr["Edition"] = LbLastEdition.Text;
                            LastAmount=SCNumber-ChNumber;
                            if (BKID !="")
                        {
                            string SQLUpdatBk = "Update EBudget_ResourceBK Set LastAmount='" + LastAmount + "' where BKID=" + BKID;
                            result2 = WebModel.SQLAction(database, SQLUpdatBk);
                            
                        }
                            result = WebModel.SQLAction(database, SQLUpdate);
                            result1 = WebModel.SaveAction(database, "SubContract_Change", DataTableBox);
                        }
                  
                   
                    }
                    else
                    {
                     
                        
                        int SC_MID1 = WebModel.MaxID(database, "SubContract_Item");
                        decimal ChNumber = 0;
                        string SQLInsert = "SCID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,LastSCNumber,UnitPrice,ComplexPrice,LastComplexPrice,LastEdition";
                        string SQLInsert1 = "SCID,SC_MID,ChNumber,Edition";
                        DataTable DataTableBox1=new DataTable();
                        DataTable DataTableBox2 = new DataTable();                      

                        foreach (string DataName in SQLInsert.Split(','))
                        {
                            DataTableBox1.Columns.Add(DataName, typeof(string));
                        }
                        foreach (string DataName in SQLInsert1.Split(','))
                        {
                            DataTableBox2.Columns.Add(DataName, typeof(string));
                        }
                        DataRow DataTableDr1 = DataTableBox1.NewRow();
                        DataRow DataTableDr2 = DataTableBox2.NewRow();
                        if (DtVs.Columns["ChNumber" + LbLastEdition.Text] != null)
                        {
                            if (row["ChNumber" + LbLastEdition.Text].ToString() != "")
                            {
                            ChNumber = row["ChNumber" + LbLastEdition.Text].ToString()!=""? decimal.Parse(row["ChNumber" + LbLastEdition.Text].ToString()):0;
                            decimal LastComplexPrice = (UnitPrice) * (ChNumber);
                            //string SQLInsert = "Insert into SubContract_Item (SCID,ItemName,Unit,BelongEWID,BelongItem,SCNumber,LastSCNumber,UnitPrice,ComplexPrice,LastComplexPrice,LastEdition) Values (" + SCID.Text + ",'" + ItemName + "','" + Unit + "','" + BelongEWID + "','" + BelongItem + "','" + SCNumber + "','" + ChNumber + "' ,'" + UnitPrice + "','" + ComplexPrice + "','" + LastComplexPrice + "', '" + LbLastEdition.Text+"')";
                            //string SQLInsert1 = "Insert into SubContract_Change (SCID,SC_MID,ChNumber,Edition) Values ('" + SCID.Text + "','" + SC_MID1 + "','" + ChNumber + "','" + LbLastEdition.Text + "')";
                            DataTableDr1["SCID"] = SCID.Text;
                            DataTableDr1["ItemName"] = ItemName;
                            DataTableDr1["Unit"] = Unit;
                            DataTableDr1["BelongItem"] = BelongItem;
                            DataTableDr1["BelongEWID"] = BelongEWID;
                            DataTableDr1["SCNumber"] = SCNumber;
                            DataTableDr1["LastSCNumber"] = ChNumber;
                            DataTableDr1["UnitPrice"] = UnitPrice;
                            DataTableDr1["ComplexPrice"] = ComplexPrice;
                            DataTableDr1["LastComplexPrice"] = LastComplexPrice;
                            DataTableDr1["LastEdition"] = LbLastEdition.Text;
                            DataTableBox1.Rows.Add(DataTableDr1);

                            DataTableDr2["SCID"] = SCID.Text;
                            DataTableDr2["SC_MID"] = SC_MID1;
                            DataTableDr2["ChNumber"] = ChNumber;
                            DataTableDr2["Edition"] = LbLastEdition.Text;
                            DataTableBox2.Rows.Add(DataTableDr2);
                          
                                LastAmount = SCNumber - ChNumber;
                            if (BKID != "")
                            {
                                string SQLUpdatBk = "Update EBudget_ResourceBK Set LastAmount='" + LastAmount + "' where BKID=" + BKID;
                                result2 = WebModel.SQLAction(database, SQLUpdatBk);
                            }
                            result1 = WebModel.SaveAction(database, "SubContract_Item", DataTableBox1);
                            result1 = WebModel.SaveAction(database, "SubContract_Change", DataTableBox2);
                            }
                        }
                       
                    }
                    
                }
                if (result && result1 == "1")
                {
                    Response.Write("<script>alert('存檔成功');</script>");

                }
                else
                {
                    Response.Write("<script>alert('存檔失敗');</script>");

                }
            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            ViewState["Dtvs_c"] = null;
            BtnReload_Click(this, null);
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