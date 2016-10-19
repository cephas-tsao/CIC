using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class RFQM : System.Web.UI.Page
    {
        string MID;
        decimal cp;//複價之總和
        decimal tax;
        decimal sum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "select [RFQ_Code], [UID],[Location], [ReplyDate], [WorkManDep], [WorkManName], [Name],[Sort] FROM [RFQ] where [RFQ_Code]=[RFQ_Code] and [Sort]=1";
            if (!IsPostBack)
            {
                SqlDataSource2.SelectCommand = Sql;
                SqlDataSource4.SelectCommand = Sql1;
                //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
                //DDL.Visible = false;
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;

            }
            //SqlDataSource1.SelectCommand = "SELECT  [RFQ_Code], [UID],[Location], [ReplyDate], [WorkManDep], [WorkManName], [Name] FROM [RFQ] WHERe RFQ_Code in (SELECT DISTINCT [RFQ_Code],[Sort] from RFQ)";  
            //SqlDataSource1.SelectCommand = "select DISTINCT b.FirmID,b.PriceID,a.[UID],a.[RFQ_Code], a.[Location], a.[ReplyDate], a.[WorkManDep], a.[WorkManName], a.[Name],b.RFQ_Code from RFQ a left join RFQ_Material b  on a.RFQ_Code=b.RFQ_Code where b.RFQ_Code=a.RFQ_Code and b.FirmID =a.FirmID and a.UID=b.UID ";
          
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                    return "";
                }
                else
                {
                    return ViewState["Sql"].ToString();
                }
            }
            set
            {
                ViewState["Sql"] = value;
            }
        }
        protected string Sql1
        {
            get
            {
                if (ViewState["Sql1"] == null)
                {
                    return "";
                }
                else
                {
                    return ViewState["Sql1"].ToString();
                }
            }
            set
            {
                ViewState["Sql1"] = value;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Pnl_Detail.Visible = true;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView1.PageSize;
                if (e.CommandName == "Select")
                {
                    Pnl_Firm.Visible = true;
                    Pnl_Detail.Visible = false;
                    int UID = (int)GridView1.DataKeys[ID_class].Value;                  
                  
                    RFQCode.Text = ((Label)GridView1.Rows[ID_class].FindControl("RFQ_Code")).Text.Trim();
                    RFQName.Text = ((Label)GridView1.Rows[ID_class].FindControl("Name")).Text.Trim();
                   
                    SqlDataSource2.SelectCommand = "select b.name as Comname,a.* from RFQ a inner join FirmM b on a.FirmID=b.UID where a.RFQ_Code='" + RFQCode.Text + "'";
                    Sql = SqlDataSource2.SelectCommand;
                    SqlDataSource3.SelectCommand = "SELECT [UID], [Name], [Type], [Path] FROM [RFQ_File] WHERE [RFQ_Code] ='" + RFQCode.Text + "'";
                }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView2.PageSize;

            int UID = (int)GridView2.DataKeys[ID_class].Value;
            string FirmID = ((Label)GridView2.Rows[ID_class].FindControl("FirmID")).Text.Trim();
            string RFQ_Code = ((Label)GridView2.Rows[ID_class].FindControl("RFQ_Code")).Text.Trim();
            SqlDataSource4.SelectCommand = "select * from RFQ a inner join FirmM b on a.FirmID=b.UID inner join RFQ_Material c on a.FirmID=c.FirmID and a.RFQ_Code=c.RFQ_Code inner join Bid_Library d on c.PriceID=d.PriceID where a.RFQ_Code='" + RFQ_Code + "' and c.FirmID ='" + FirmID + "'";
            Sql1 = SqlDataSource4.SelectCommand ;
            if (e.CommandName == "Select")
            {
                Pnl_Detail.Visible = true;
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                //SqlDataSource4.SelectCommand = "SELECT * FROM FirmM a INNER JOIN RFQ b ON a.UID = b.FirmID left join RFQ_Material c on b.RFQ_Code=c.RFQ_Code and b.FirmID=c.FirmID INNER JOIN [Bid_Library] d ON c.PriceID=d.PriceID WHERE  b.FirmID=" + FirmID + "";
                //SelectCommand="SELECT RFQ.RFQ_Code, RFQ.Sort, FirmM.Name, RFQ.DiscountPercent, RFQ.TotalPrice, RFQ.QuoteNY FROM FirmM INNER JOIN RFQ ON FirmM.UID = RFQ.FirmID WHERE (RFQ.RFQ_Code = @RFQ_Code)"

                LbCompany.Text = ((Label)GridView2.Rows[ID_class].FindControl("Name")).Text.Trim();
                string TPrice = ((Label)GridView2.Rows[ID_class].FindControl("TotalPrice")).Text.Trim();
              
                LbTprice.Text = TPrice!=""? Convert.ToInt32(TPrice).ToString("#,0"):"0";
                LoadContent();
            }
            if (e.CommandName == "Export")
            {
                
                if (Repeater1.Items.Count == 0)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先選擇匯出廠商');", true);
                }
                else
                {
                    DataTable Repeater = WebModel.LoadSetContentData(database, SqlDataSource4.SelectCommand);
                    exportToExcel(Repeater);
                }
            }
        }
        string TotalPrice;
        string Tax;
        int TaxTotal;
        //匯出 Excel (直接從資料來源 DataTable 產生 Excel。 此種 Excel 可加入自訂記錄列) 
        private void exportToExcel(System.Data.DataTable pDataTable)
        {
            string database = Session["DatabaseName"].ToString();
            string SelectSQL = SqlDataSource4.SelectCommand;
            int tRowCount = pDataTable.Rows.Count;
            int tColumnCount = pDataTable.Columns.Count;
            int colspan = tColumnCount - 1;
            string filename = LbCompany.Text+"報價單";
            string company = LbCompany.Text;
            string date = TxLimitDate.Text;
            string Bid = WebModel.BID(database, SelectSQL);
            string SelectSQL1 = "select * from BidM0 where bid=" + Bid + "";
            string BidName = WebModel.BidName(database, SelectSQL1);
           

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
            Response.Write("\n<th style='font-size:16.0pt;' colspan='8'  align=\"center\" x:num>");      //抬頭背景為淺黃色，文字橫向為置中對齊 
            Response.Write("機關/公司名稱:" + company + " ");
            Response.Write("\n</th>");
            Response.Write("<TR ><td style='font-size:16.0pt;' colspan='8'  align=\"center\" x:num>");
            Response.Write("廠  商  報  價  單");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:16.0pt;' colspan='8'  align=\"Left\" x:num>");
            Response.Write("工程名稱:" + BidName + "");
            Response.Write("</td>\n</TR>");
            //Response.Write("<tr><td align='center' valign='middle'>自訂表頭訊息</td></tr>"); 
            Response.Write("\n<TR  align=\"center\" x:num>");
            Response.Write("<td>項次</td><td style='width:400px'>作業項目</td><td>單位</td><td>數量</td><td style='width:100px'>單價</td><td style='width:100px'>複價</td><td>結算方式</td><td style='width:200px'>備註</td>\n </td>");
            Response.Write("\n </TR>");
          
            string l_str2 = "";
            int i = 1;
           
            foreach (DataRow l_dr in pDataTable.Rows)  //滙出表格資料我
            {//若有數字或日期在滙出時要注意資料型態，我是在TABLE中就設定好了

                //l_str2 = "<tr><td>" + l_dr["UID"].ToString() + "";
                l_str2 = "<tr><td>" + i.ToString() + "";

                l_str2 += "</td><td>" + l_dr["ItemName"].ToString() + "";

                l_str2 += "</td><td>" + l_dr["Unit"].ToString() + "";

                l_str2 += "</td><td>" + (Convert.ToInt32(l_dr["Amount"])).ToString("N0") + "";

                l_str2 += "</td><td>" + (Convert.ToInt32(l_dr["DiscountPrice"])).ToString("N0") + "";
                l_str2 += "</td><td>" + (Convert.ToInt32(l_dr["Complexprice"])).ToString("N0") + "";
                l_str2 += "</td><td>" + (l_dr["ClearWay"].ToString()) + "";

                l_str2 += "</td><td>" + l_dr["Notes"].ToString() + "";
               
                l_str2 += "</td></tr>";
               
                TotalPrice = l_dr["TotalPrice"].ToString() !=""?l_dr["TotalPrice"].ToString():"0";
                Tax = l_dr["Tax"].ToString() !=""?l_dr["Tax"].ToString():"0";
                TaxTotal = int.Parse(TotalPrice) + int.Parse(Tax);
                Response.Write(l_str2);
                i++;

            }
          
            Response.Write("<tr></tr><tr></tr>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("總價新台幣（未稅）：</td><td>" + Convert.ToInt32(TotalPrice).ToString("N0") + "</td><td>元 </td><td colspan='2'></td >");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("營業稅：</td><td>" + Convert.ToInt32(Tax).ToString("N0") + "</td><td>元 </td><td colspan='2'></td >");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:12.0pt;' colspan='3'  align=\"center\" x:num></td><td>");
            Response.Write("總價新台幣（含稅）：</td><td>" + TaxTotal.ToString("N0") + "</td><td>元 </td><td colspan='2'></td >");
            Response.Write("</td>\n</TR>");
           
            Response.Write("</Table>");
            Response.End();


            //Response.Write("<tr><td align='center' valign='middle'>自訂表尾訊息</td></tr>"); 



            if (pDataTable != null)
                pDataTable.Dispose();       //註記已可釋放此 DataTable         
        } 
        protected void LoadContent()
        {
            
            string database = Session["DatabaseName"].ToString();

            string SQLString = Sql;

            string SQLString1 = Sql1;
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString1);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                     
                        LbTax.Text = (row["Tax"].ToString() != "")? Convert.ToInt32(row["Tax"]).ToString("#,0"):"0";
                                           
                    }
                }
                if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox1.Rows)
                    {
                        if (row["DisCountType"].ToString() != "")
                        {
                            if (row["DisCountType"].ToString() == "1")
                            {
                                RadioButton1.Checked = true;
                                TxDiscount.Text = row["DiscountPercent"].ToString();

                            }
                            else if (row["DisCountType"].ToString() == "2")
                            {
                                RadioButton2.Checked = true;
                                TxDiscount.Text = row["DiscountTotal"].ToString();
                            }
                        }
                        UIDCom.Text = row["UID"].ToString();
                        TxLimitDate.Text = row["ExpiretionDate"].ToString();
                        LbTprice.Text = row["TotalPrice"].ToString() != "" ? Convert.ToInt32(row["TotalPrice"]).ToString("N0") : "0";
                        LbTax.Text = row["Tax"] .ToString() != "" ? Convert.ToInt32(row["Tax"]).ToString("N0") : "0";
                      
                    }
                }
           }
        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView3.PageSize;
            if (e.CommandName == "DownLoad")
            {

                int UID = (int)GridView3.DataKeys[ID_class].Value;

                Label Path = (Label)GridView3.Rows[ID_class].FindControl("Path");
                Label Name = (Label)GridView3.Rows[ID_class].FindControl("Name");

                if (Path != null && Path.Text != "")
                {
                    string[] name = Path.Text.Split('_');
                    string realname = name[1];
                    Response.AppendHeader("content-disposition", "attachment; filename=" + realname);
                    if (File.Exists(realname))
                    {
                        Response.TransmitFile(Path.Text);
                        Response.End();
                    }
                }
            }
        }

        protected void BtnCal_Click(object sender, EventArgs e)
        {
          
            string database = Session["DatabaseName"].ToString();

            decimal OP;//原單價之總和

            string ID = UIDCom.Text;
            decimal Discount;
            decimal dispercent;
            bool result = false;
            TxDiscount.Text = TxDiscount.Text != "" ? TxDiscount.Text : "0";
           
           

            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label LbNumber = item.FindControl("LbNumber") as Label;//總工程用量
                    TextBox TxQuate = item.FindControl("TxQuate") as TextBox;//報價單價
                    Label LbDPrice = item.FindControl("LbDPrice") as Label;//折扣單價
                    Label LbCPrice = item.FindControl("LbCPrice") as Label;//複價
                    TextBox TxClearWay = item.FindControl("TxClearWay") as TextBox;
                    Label uid = (Label)item.FindControl("uid") as Label;
                    Label PriceID = (Label)item.FindControl("PriceID") as Label;
                    Session["uid"] = uid.Text;
                    OP = decimal.Parse(TxQuate.Text);  
                    if (RadioButton1.Checked == true)
                    {
                        Discount = decimal.Parse(TxDiscount.Text) / 100;
                        string SQLRFQUpDate = "Update RFQ SET DiscountPercent=" + Discount + ",ExpiretionDate='" + TxLimitDate.Text + "' where UID=" + uid.Text + "";
                      result= WebModel.SQLAction(database, SQLRFQUpDate);
                    }
                    else if (RadioButton2.Checked == true)
                    {
                        Discount = decimal.Parse(TxDiscount.Text);
                        string SQLRFQUpDate = "Update RFQ SET  DiscountTotal=" + Discount + ",ExpiretionDate='" + TxLimitDate.Text + "' where UID=" + uid.Text + "";
                    result=  WebModel.SQLAction(database, SQLRFQUpDate);
                    }

                     TxQuate.Text = TxQuate.Text != "" ? TxQuate.Text : "0";
                     string SQLString = "Select *,b.UID as MID from RFQ a inner join RFQ_Material b on a.FirmID=b.FirmID and a.RFQ_Code=b.RFQ_Code where a.UID=" + uid.Text + "and PriceID =" + PriceID.Text + "";
                     MID = WebModel.MID(database, SQLString);        

                    if (RadioButton1.Checked == true)
                    {
                     
                        string SelectString = "";
                        SelectString += TxQuate.Text != "" ? "[UnitPrice]=" + decimal.Parse(TxQuate.Text) +"": "";
                        SelectString += TxClearWay.Text != "" ? " ,[ClearWay] = '" + TxClearWay.Text + "'" : "";
                        SelectString = (SelectString.Length > 1) ? "" + SelectString + "" : "";
                        string SQLRFQMUpDate = "UPDATE [RFQ_Material] SET " + SelectString + " WHERE [UID] ='" + MID + "'";                                              
                     result=   WebModel.SQLAction(database, SQLRFQMUpDate);
                        OP = decimal.Parse(TxQuate.Text);

                        Discount = decimal.Parse(TxDiscount.Text) / 100;
                        //string dis = (Convert.ToDecimal(TxDiscount.Text) / 100).ToString(); ;
                        decimal TOTAL = Convert.ToDecimal(TxQuate.Text) * (Convert.ToDecimal(Discount));
                        LbDPrice.Text = TOTAL.ToString();
                        LbCPrice.Text = (Convert.ToDecimal(LbNumber.Text) * TOTAL).ToString();
                        string RFQUpdate = "UPDATE [RFQ_Material] Set DisCountType=1,[DiscountPrice]=" + decimal.Parse(LbDPrice.Text) + ",[ComplexPrice]=" + decimal.Parse(LbCPrice.Text) + " WHERE [UID] ='" + MID + "'";
                        result=  WebModel.SQLAction(database, RFQUpdate);
                        sum += decimal.Parse(LbCPrice.Text);
                    }
                   else if (RadioButton2.Checked ==true)
                    {
                        Discount = decimal.Parse(TxDiscount.Text);
                        //LbCPrice.Text= (int.Parse(LbNumber.Text) *Discount).ToString();
                        string SelectString = "";
                        SelectString += TxQuate.Text != "" ? "[UnitPrice]=" + decimal.Parse(TxQuate.Text) + "" : "";
                        SelectString += TxClearWay.Text != "" ? " ,[ClearWay] = '" + TxClearWay.Text + "'" : "";
                        SelectString = (SelectString.Length > 1) ? " SET " + SelectString + "" : "";
                     

                        string SQLRFQMUpDate = "UPDATE [RFQ_Material] " + SelectString + " WHERE [UID] ='" + MID + "'";
                        result=  WebModel.SQLAction(database, SQLRFQMUpDate);

                        LbCPrice.Text = (OP * decimal.Parse(LbNumber.Text)).ToString();
                        cp += decimal.Parse(LbCPrice.Text);
                       
                    }
                                    
                }

            }
            if (RadioButton2.Checked == true)
            {
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        Label LbNumber = item.FindControl("LbNumber") as Label;//總工程用量
                        TextBox TxQuate = item.FindControl("TxQuate") as TextBox;//報價單價
                        Label LbDPrice = item.FindControl("LbDPrice") as Label;//折扣單價
                        Label LbCPrice = item.FindControl("LbCPrice") as Label;//複價
                        TextBox TxClearWay = item.FindControl("TxClearWay") as TextBox;
                        Label uid = (Label)item.FindControl("uid") as Label;
                        Label PriceID = (Label)item.FindControl("PriceID") as Label;
                        OP = decimal.Parse(TxQuate.Text);
                        string SQLString = "Select *,b.UID as MID from RFQ a inner join RFQ_Material b on a.FirmID=b.FirmID and a.RFQ_Code=b.RFQ_Code where a.UID=" + uid.Text + "and PriceID =" + PriceID.Text + "";
                        MID = WebModel.MID(database, SQLString);
                    
                        if (cp !=0)
                        {
                        dispercent = (decimal.Parse(TxDiscount.Text) / cp);
                        LbDPrice.Text = Math.Floor(decimal.Parse(TxQuate.Text) * dispercent).ToString();
                        LbCPrice.Text = Math.Floor(decimal.Parse(LbDPrice.Text) * decimal.Parse(LbNumber.Text)).ToString();
                        }

                        string SQLRFQMUpDate1 = "UPDATE [RFQ_Material] SET DisCountType=2,[DiscountPrice]= " + decimal.Parse(LbDPrice.Text) + " ,[ComplexPrice] = " + decimal.Parse(LbCPrice.Text) + " WHERE [UID] ='" + MID + "'";
                        result=  WebModel.SQLAction(database, SQLRFQMUpDate1);
                        sum += decimal.Parse(LbCPrice.Text);
                    }
                }
            }
            
            tax = (sum * 5) / 100;
            if (Session["uid"] != null && Session["uid"].ToString() !="")
            {
                string SQLRFQUpDate2 = "UPDATE [RFQ] SET [TotalPrice]= " + sum + " ,[Tax] = " + tax + " WHERE [UID] ='" + Session["uid"].ToString() + "'";
                result = WebModel.SQLAction(database, SQLRFQUpDate2);
            }
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已存檔');", true);
            LoadContent();
        }

        protected void BtnQuate_Click(object sender, EventArgs e)
        {            
              string database = Session["DatabaseName"].ToString();
                string SQLUpDate = "Update RFQ SET  QuoteNY=1 where UID=" + UIDCom.Text + "";
                string SelectSQL = "Select * from RFQ where UID=" + UIDCom.Text + "";
                string RFQ_Code = WebModel.SItemName(database, SelectSQL, "RFQ_Code");
                string UpdateOthercode = "Update RFQ SET  QuoteNY=0 where RFQ_Code='" + RFQ_Code+"'";
                bool result = WebModel.SQLAction(database, UpdateOthercode);
               result= WebModel.SQLAction(database, SQLUpDate);
               if (result)
               {
                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已引用此廠商之報價');", true);
               }
               else
               {
                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 引用失敗');", true);
               }
       
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                RadioButton2.Checked = false;
                UnitP.Text = "(%)";
                
            }
          
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
           if (RadioButton2.Checked)
            {
                RadioButton1.Checked = false;
                UnitP.Text = "(元)";              
              
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
             
                
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                Label UID = (Label)e.Item.FindControl("UID");
                Label PriceID = (Label)e.Item.FindControl("PriceID");
                Label LbCode = (Label)e.Item.FindControl("LbCode");
                Label LbProductName = (Label)e.Item.FindControl("LbProductName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbNumber = (Label)e.Item.FindControl("LbNumber");
                Label LbDPrice = (Label)e.Item.FindControl("LbDPrice");
                Label LbCPrice = (Label)e.Item.FindControl("LbCPrice");

                TextBox TxQuate = (TextBox)e.Item.FindControl("TxQuate");
                TextBox TxClearWay = (TextBox)e.Item.FindControl("TxClearWay");
                Label LbBrand = (Label)e.Item.FindControl("LbBrand");
                Label LbNote = (Label)e.Item.FindControl("LbNote");

                UID.Text = vsDr["UID"].ToString();
                PriceID.Text = vsDr["PriceID"].ToString();
                LbCode.Text = vsDr["Code"].ToString();
                LbProductName.Text = vsDr["ItemName"].ToString();              
                LbUnit.Text = vsDr["Unit"].ToString();

                LbNumber.Text = vsDr["Amount"].ToString() != ""? Convert.ToInt32(vsDr["Amount"]).ToString("N0"):"0";
                LbDPrice.Text = vsDr["DiscountPrice"].ToString() !=""? Convert.ToInt32(vsDr["DiscountPrice"]).ToString("N0"):"0";
                LbCPrice.Text = vsDr["ComplexPrice"].ToString()!=""? Convert.ToInt32(vsDr["ComplexPrice"]).ToString("N0"):"0";
                TxQuate.Text =  vsDr["UnitPrice"].ToString() !=""?Convert.ToInt32(vsDr["UnitPrice"]).ToString("N0"):"0";
                TxClearWay.Text = vsDr["ClearWay"].ToString();
                LbBrand.Text = vsDr["Explan"].ToString();
                LbNote.Text = vsDr["Note"].ToString();
            }
        }
    }
}