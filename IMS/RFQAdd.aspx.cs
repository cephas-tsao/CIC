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
    public partial class RFQAdd : System.Web.UI.Page
    {
        protected string insert;
        protected string insert1;
        string ErrorString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                Session["DataTable"] = null;
                Loadcontent();
                
                Repeater1.DataBind();
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
          
            if (Session["bid"] != null)
            {
            SqlDataSource4.SelectCommand = "SELECT PriceID, ItemName, Unit, Amount, Code FROM Bid_Library WHERE (BID = " + Session["bid"].ToString() + ")  ORDER BY Code DESC";//AND (ResourceNY = @ResourceNY) AND (ItemKind =@ItemKind) AND (PriceID= @PriceID)
            SqlDataSource5.SelectCommand = "SELECT A.PriceID, A.ItemName, A.Unit, A.Amount, A.Code, B.BidName,A.BID FROM Bid_Library A LEFT JOIN BidM0 B ON A.BID = B.BID WHERE A.BID !=" + Session["Bid"].ToString() + " ";// AND (Bid_Library.ResourceNY = @ResourceNY) AND (Bid_Library.ItemKind &lt;&gt; @ItemKind) AND (Bid_Library.Code = @Code)
            SqlDataSource8.SelectCommand = "Select  *  from BidM0 a left join  Bid_Library b on a.bid=b.bid where PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";// AND (Bid_Library.ResourceNY = @ResourceNY) AND (Bid_Library.ItemKind &lt;&gt; @ItemKind) AND (Bid_Library.Code = @Code)
           
            }
            if (SystemSet.GetRequestSet("RFQ_Code") != "")
            {
                SqlDataSource9.SelectCommand = "SELECT [Name], [Type], [Path], [UID] FROM [RFQ_File] where RFQ_Code='" + SystemSet.GetRequestSet("RFQ_Code") + "' ORDER BY [UID]";
            }
             if (Session["DataTable"] != null)
           {
            Repeater1.DataSource = (DataTable)Session["DataTable"];
           }
                      
     }
        protected void Loadcontent()
        {
            string database = Session["DatabaseName"].ToString();
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                string SQLString = "Select a.*,b.* from BidM0 a left join  Bid_Library b on a.bid=b.bid  where b.PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";//left join RFQ_Material c  on b.PriceID=c.PriceID
                string SQLSelect = "Select PriceID,ItemName,Unit,Code,Amount from Bid_Library where  PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";
                //string SQLSelect = "SELECT DISTINCT a.PriceID, a.ItemName, a.Unit, a.Amount, a.Code,b.Explan,b.Note FROM Bid_Library a left join RFQ_Material b on a.PriceID=b.PriceID WHERE  a.BID  =" +Session["BID"].ToString() + " and b.PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLSelect);
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbBidName.Text = row["BidName"].ToString();
                        BidName.Text = row["BidName"].ToString();
                        //LbItemName.Text = row["ItemName"].ToString();
                        //LbUnit.Text = row["Unit"].ToString();
                        //LbCode.Text = row["Code"].ToString();
                        //LbNumber.Text = row["AnaNumber"].ToString();
                       
                    }
                   
                    Repeater1.DataSource = DataTableBox1;
                    Repeater1.DataBind();
                    Session["DataTable"] = DataTableBox1;
                }
            }
        }
        protected void ItemAdd_Click(object sender, EventArgs e)
        {
           

            foreach (GridViewRow row in GridView2.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                Session["check"] = cb;
                Label PriceID = (Label)row.FindControl("PriceID");
                Label ItemName = (Label)row.FindControl("ItemName");
                Label Unit = (Label)row.FindControl("Unit");
               // Label Complex = (Label)row.FindControl("Complex");
                Label Code = (Label)row.FindControl("Code");

                if (cb.Checked)
                {
                    ListItem myList = new ListItem();
                    //string[] myList = new string[3];

                    myList.Text = ItemName.Text;
                    myList.Value = PriceID.Text + "|" + ItemName.Text + " | " + Unit.Text + " | " + Code.Text;

                    ListBox1.Items.Add(myList);

                }

                else if (cb.Checked == false)
                {
                    ListBox1.Items.Remove(ItemName.Text);
                }
            }
        }

        protected void ItemDel_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem.Text != "")
            {
                int[] indices = ListBox1.GetSelectedIndices();
                for (int i = indices.Length - 1; i >= 0; i--)
                {
                    ListBox1.Items.RemoveAt(indices[i]);
                }
                //ListBox1.Items.Remove(ListBox1.SelectedItem);
            }
        }
        protected void ItemAdd1_Click(object sender, EventArgs e)
        {


            foreach (GridViewRow row in GridView3.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox2");
                Session["check"] = cb;
                Label PriceID = (Label)row.FindControl("PriceID");
                Label BidName = (Label)row.FindControl("BidName");
                Label ItemName = (Label)row.FindControl("ItemName");
                Label Unit = (Label)row.FindControl("Unit");
                Label Amount = (Label)row.FindControl("Amount");
                Label Code = (Label)row.FindControl("Code");

                if (cb.Checked)
                {
                    ListItem myList = new ListItem();
                    //string[] myList = new string[3];

                    myList.Text = ItemName.Text;
                    myList.Value = PriceID.Text + " | " + ItemName.Text + " | " + Unit.Text + " | " + Code.Text + " | " + Amount.Text;

                    ListBox2.Items.Add(myList);

                }

                else if (cb.Checked == false)
                {
                    ListBox2.Items.Remove(ItemName.Text);
                }
            }
        }

        protected void ItemDel1_Click(object sender, EventArgs e)
        {
            if (ListBox2.SelectedItem.Text != "")
            {
                int[] indices = ListBox2.GetSelectedIndices();
                for (int i = indices.Length - 1; i >= 0; i--)
                {
                    ListBox2.Items.RemoveAt(indices[i]);
                }
              
            }
        }
        protected void ClearAll_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
        }
        protected void ClearAll1_Click(object sender, EventArgs e)
        {
            ListBox2.Items.Clear();
        }
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList8.Items.Clear();
            DropDownList8.Items.Add("-請選擇部門人員-");
        }
        protected void Button16_Click(object sender, EventArgs e)
        {
            Pnl_OtherItem.Visible = true;
            Pnl_OtherBid.Visible = false;
        }
        protected void Button17_Click(object sender, EventArgs e)
        {
            Pnl_OtherBid.Visible = true;
            Pnl_OtherItem.Visible = false;
        }
        protected void Button25_Click(object sender, EventArgs e)
        {
           // DataTable DataTableBox =(DataTable) Session["DataTable"];
            DataTable DataTableBox =new DataTable();
            if (Session["DataTable"] != null)
            {
                DataTableBox = (DataTable)Session["DataTable"];
            }
           
            for (int i = 0; i < ListBox1.Items.Count; i++ )
            {
                 
                string ListValue = ListBox1.Items[i].Value;
                string[] strArray = ListValue.Split('|');  
             
                DataRow DataTableDr = DataTableBox.NewRow();
                
                    DataTableDr["PriceID"] = strArray[0].ToString();
                    DataTableDr["ItemName"] = strArray[1].ToString();
                    DataTableDr["Unit"] = strArray[2].ToString();
                    DataTableDr["Code"] = strArray[3].ToString();
                    //DataTableDr["Explan"] = "";
                    //DataTableDr["Note"] = "";

                    //DataTableDr["Amount"] = strArray[5].ToString();

                    DataTableBox.Rows.Add(DataTableDr);                 
             
            }

            Repeater1.DataSource = Session["DataTable"];
            //Session["DataTable"] = DataTableBox;
            Repeater1.DataSource = DataTableBox;
           
                 
            Repeater1.DataBind();
            Session["DataTable"] = Repeater1.DataSource;
            Pnl_OtherItem.Visible = false;
        }
        protected void Button28_Click(object sender, EventArgs e)
        {
            DataTable DataTableBox = (DataTable)Session["DataTable"];
           

            for (int i = 0; i < ListBox2.Items.Count; i++)
            {

                string ListValue = ListBox2.Items[i].Value;
                string[] strArray = ListValue.Split('|');
               
                DataRow DataTableDr = DataTableBox.NewRow();

                DataTableDr["PriceID"] = strArray[0].ToString();
                DataTableDr["ItemName"] = strArray[1].ToString();
                DataTableDr["Unit"] = strArray[2].ToString();
                DataTableDr["Code"] = strArray[3].ToString();
                DataTableDr["Amount"] = (strArray[4].ToString() != " ")?Decimal.Parse(strArray[4].ToString()):0;
                //DataTableDr["Explan"] = "";
                //DataTableDr["Note"] = "";

                DataTableBox.Rows.Add(DataTableDr);
               
            }

            //Repeater1.DataSource = Session["DataTable"];
            //Session["DataTable"] = DataTableBox;
            Repeater1.DataSource = DataTableBox;


            Repeater1.DataBind();
            Session["DataTable"] = Repeater1.DataSource;
            Pnl_OtherBid.Visible = false;
        }
        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if ((DDL_kind.SelectedItem.Text == "其他"))
            //{
            //    TextBox84.Visible = true;
            //}
            //else
            //{
            //    TextBox84.Visible = false;
            //}
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
             if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label LbPrice = (Label)e.Item.FindControl("LbPrice");
                Label LbCode = (Label)e.Item.FindControl("LbCode");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbNumber = (Label)e.Item.FindControl("LbNumber");
                TextBox TxBrand = (TextBox)e.Item.FindControl("TxBrand");
                TextBox TxNote = (TextBox)e.Item.FindControl("TxNote");

                LbPrice.Text = vsDr["PriceID"].ToString();
                LbCode.Text = vsDr["Code"].ToString();              
                LbItemName.Text = vsDr["ItemName"].ToString();             
                LbUnit.Text = vsDr["Unit"].ToString();
                LbNumber.Text = vsDr["Amount"].ToString();
                //TxBrand.Text = vsDr["Explan"].ToString();
                //TxNote.Text = vsDr["Note"].ToString();
               
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (Session["Bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxPro.Text));

                #region 搜尋條件
                string SelectString = "";

                SelectString = (DDL_Select2.SelectedValue != "0") ? "Type like '%" + DDL_Select2.SelectedValue + "%' " : "";

                SelectString += (ItemName != "") ? "" + DDL_Op2.SelectedValue + " SupportItem like '%" + ItemName + "%' " : "";

                SelectString = (SelectString.Length > 1) ?  SelectString : "";
                #endregion
                SqlDataSource6.SelectCommand = (SelectString.Length > 1) ? SqlDataSource6.SelectCommand.Substring(0, SqlDataSource6.SelectCommand.Length) : SqlDataSource6.SelectCommand;             
                SqlDataSource6.SelectCommand += " where " + SelectString + "";
                GridView4.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請選擇標案');", true);
            }
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            GridView4.DataBind();
        }

        protected void UpLoad_Click(object sender, EventArgs e)
        {
             string database = Session["DatabaseName"].ToString();
            String savepath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
            string ProjectCode = Session["ProjectCode"].ToString();
            string RFQ_Code=SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNo.Text));
            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;

                fileName =DateTime.Now.ToString("yyyy-MM-dd-HHmmss")+ "_" + fileName ;
                string Name = AttachName.Text;
                savepath += fileName;
                string kind = DDL_kind.SelectedItem.Text;
                FileUpload1.SaveAs(savepath);
               // FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath(savepath)); //上傳檔案

               
                string[] name = fileName.Split('_');
                string realname = name[1];
               
                Response.Write("<script>alert('"+kind+"" + realname + "已上傳');</script>");
                string SQLInsert = "RFQ_Code,Name,Type,Path";
                DataTable DataTableBox = new DataTable();
             foreach (string DataName in SQLInsert.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

                  DataRow DataTableDr = DataTableBox.NewRow();
             
               
                DataTableDr["RFQ_Code"] = RFQ_Code;
                DataTableDr["Name"] = Name;
                DataTableDr["Type"] = kind;
                DataTableDr["Path"] = savepath;    

                DataTableBox.Rows.Add(DataTableDr);

              string insert= WebModel.SaveAction(database, "RFQ_File", DataTableBox);
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

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView5.PageSize;
            if (e.CommandName == "DownLoad")
            {

                int UID = (int)GridView5.DataKeys[ID_class].Value;

                Label Path = (Label)GridView5.Rows[ID_class].FindControl("Path");
                LinkButton Name = (LinkButton)GridView5.Rows[ID_class].FindControl("Name");

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

        protected void BtnRequire_Click(object sender, EventArgs e)
        {
            string RFQ_Code = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNo.Text));
            string Name = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxName.Text));
            string ReplyDate = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxDate.Text));
            string Warranty = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxWarranty.Text));
            string county = DropDownList4.SelectedItem.Text;
            string WorkManDep = DropDownList7.SelectedItem.Text;
            string staff = DropDownList8.SelectedItem.Text;
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            string database = Session["DatabaseName"].ToString();

            //檢查標題文字

            ErrorString += (RFQ_Code) == string.Empty ? "詢價單編號請填入!!\\n" : "";
            ErrorString += (Name) == string.Empty ? "詢價單名稱請填入!!\\n" : "";
            ErrorString += (ReplyDate) == string.Empty ? "報價回覆期限請填入!!\\n" : "";
            ErrorString += (DropDownList4.SelectedItem.Value) == "0" ? "工程所在縣市請選擇!!\\n" : "";
            ErrorString += (DropDownList7.SelectedItem.Value) == "0" ? "經辦人請選擇!!\\n" : "";
            ErrorString += (DropDownList8.SelectedItem.Value) == "0" ? "部門人員請選擇!!\\n" : "";

            //確認是否全選
            if (ErrorString == "")
            {
                string SQLInsert = "BID,PriceID,RFQ_Code,FirmID,Explan,Note";
                string SQLString = "RFQ_Code,Sort,Name,FirmID,Location,ReplyDate,Warranty,WorkManDep,WorkManName,Notes";
               
                DataTable DataTableBox = new DataTable();
                DataTable DataTableBox1 = new DataTable();
                //Repeater1.DataSource = Session["DataTable"];
                //Repeater1.DataBind();
                foreach (string DataName in SQLInsert.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox1.Columns.Add(DataName, typeof(string));
                }
               
                int i=1;
                foreach (GridViewRow row in GridView4.Rows)
                {
                    CheckBox CheckBox3 = (CheckBox)row.FindControl("CheckBox3");
                    Label UID = (Label)row.FindControl("UID");
                    DataRow DataTableDr1 = DataTableBox1.NewRow();

                 
                    if (CheckBox3.Checked == true)
                    {
                       
                        DataTableDr1["Sort"]= i;
                        DataTableDr1["RFQ_Code"] = RFQ_Code;
                        DataTableDr1["Name"] = TxName.Text;
                        DataTableDr1["FirmID"] = UID.Text;
                        DataTableDr1["Location"] = county;
                        DataTableDr1["ReplyDate"] = ReplyDate;
                        DataTableDr1["Warranty"] = Warranty;
                        DataTableDr1["WorkManDep"] = WorkManDep;
                        DataTableDr1["WorkManName"] = staff;
                        DataTableDr1["Notes"] = Notes;

                        DataTableBox1.Rows.Add(DataTableDr1);
                        insert1 = WebModel.SaveAction(database, "RFQ", DataTableBox1);
                        DataTableBox1.Rows.Clear();
                        i++;
                    }
                }
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        Label LbPrice = (Label)item.FindControl("LbPrice") as Label;
                        Label LbCode = (Label)item.FindControl("LbCode") as Label;
                        Label LbItemName = (Label)item.FindControl("LbItemName") as Label;
                        Label LbUnit = (Label)item.FindControl("LbUnit") as Label;
                        Label LbNumber = (Label)item.FindControl("LbNumber") as Label;
                        TextBox TxBrand = (TextBox)item.FindControl("TxBrand") as TextBox;
                        TextBox TxNote = (TextBox)item.FindControl("TxNote") as TextBox;

                       

                        foreach (GridViewRow row in GridView4.Rows)
                        {
                            DataRow DataTableDr = DataTableBox.NewRow();
                          
                            CheckBox CheckBox3 = (CheckBox)row.FindControl("CheckBox3");
                            Label UID = (Label)row.FindControl("UID");

                            if (CheckBox3.Checked == true)
                            {


                                DataTableDr["Bid"] = Session["Bid"].ToString();
                                DataTableDr["PriceID"] = LbPrice.Text;
                                DataTableDr["RFQ_Code"] = RFQ_Code;
                                DataTableDr["FirmID"] = UID.Text;
                                DataTableDr["Explan"] = TxBrand.Text;
                                DataTableDr["Note"] = TxNote.Text;

                                DataTableBox.Rows.Add(DataTableDr);
                                insert = WebModel.SaveAction(database, "RFQ_Material", DataTableBox);
                                DataTableBox.Rows.Clear();
                               
                              
                                }
                                string SQLLibrary = "Update Bid_Library Set RFQ_Code='" + RFQ_Code + "' where PriceID= " + LbPrice.Text + "";
                              bool result=  WebModel.SQLAction(database, SQLLibrary);
                        }
                        
                    }


                }
                if (insert != "1" && insert1 != "1")
                {
                    Response.Write("<script>alert('資料庫更新失敗');</script>");
                }
                else
                {
                    Response.Write("<script>alert('存檔成功');self.close();</script>");

                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }
    }
}