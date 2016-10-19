using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class BidBudgetPEdit1 : System.Web.UI.Page
    {
        protected string ShowString;
        protected string javauid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //Display_Click(this, null);
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
            if (Session["BidBudgetEdit"] != null)
            {
                DDL_BidSelect.DataBind();
                DDL_BidSelect.AutoPostBack = true;
                DDL_BidSelect.SelectedItem.Value = Session["BidBudgetEdit"].ToString();
                DDL_BidSelect_SelectedIndexChanged(this, null);

            }
            if (!IsPostBack)
            {
                DDL_BidSelect.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "-請選擇-";
                LI.Value = "0";
                DDL_BidSelect.Items.Insert(0, LI);
                DDL_BidSelect.SelectedIndex = 0;
                Session["BidBudgetEdit"] = null;
            }
        
           
        }
        protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["BID"] = DDL_BidSelect.SelectedValue;
            if (Session["Bid"] != null)
            {
                SqlDataSource2.SelectCommand = "select DISTINCT b.KidID,b.NewItem,a.* from [Bid_Library] a left join Bid_AnaRelation b on a.PriceID =b.KidID where a.BID=" + Session["BID"].ToString() + " and a.ItemKind<>'拆工拆料項'";
            }
            //Pnl_ALL.Visible = true;
        }
        protected void Display_Click(object sender, EventArgs e)
        {
            if (Session["BID"] != null)
            {

                //string Num = ViewState["rowNum"].ToString();
                if ((Display.ToolTip == "顯示缺漏項(目前隱藏)"))
                {
                    foreach (RepeaterItem item in Repeater1.Items)
                    {
                        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                        {

                            Label NewItem = item.FindControl("NewItem") as Label;
                            Label uid = (Label)item.FindControl("uid") as Label;
                            HtmlTableRow trID = (HtmlTableRow)item.FindControl("trID");

                            if (NewItem.Text == "1")
                            {
                                trID.Attributes.Add("style", "display:''");
                                trID.Attributes.Add("style", "background-color:#FF5809");
                                trID.Visible = true;
                                //javauid = trID.ClientID;
                                //ShowString += javauid + ",";

                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Show", "<script language=JavaScript>show_tr();</script>");
                                Display.ToolTip = "隱藏缺漏項(目前顯示)";
                            }
                        }
                    }
                }
                else if ((Display.ToolTip == "隱藏缺漏項(目前顯示)"))
                {
                    foreach (RepeaterItem item in Repeater1.Items)
                    {
                        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                        {

                            HtmlTableRow trID = (HtmlTableRow)item.FindControl("trID");
                            Label NewItem = item.FindControl("NewItem") as Label;
                            if (NewItem.Text == "1")
                            {
                                trID.Visible = false;
                                //trID.Attributes.Add("style", "display:none");
                                //trID.Attributes.Add("style", "background-color:#FFFFFF");
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Hide", "<script language=JavaScript>hide_tr();</script>");
                            }
                        }
                    }
                    Display.ToolTip = "顯示缺漏項(目前隱藏)";
                }
            }
        }
        protected void ImageButton51_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("ResourcePriceAdjest.aspx", "A", "1200", "500");
        }
        public void OpenNewWindow(string url, string Tgr, string width, string height)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }

    
        protected void ImageButton125_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("PFill.aspx", "A", "1200", "700");
        }
      

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label id = (Label)e.Item.FindControl("Uid");
                Label NewItem = (Label)e.Item.FindControl("NewItem");
                Label LbCode = (Label)e.Item.FindControl("LbCode");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbAmount = (Label)e.Item.FindControl("LbAmount");
                Label LbCAmount = (Label)e.Item.FindControl("LbCAmount");
                Label LbAPrice = (Label)e.Item.FindControl("LbAPrice");
                Label RFQ_Code = (Label)e.Item.FindControl("RFQ_Code");
                TextBox TxPrice = (TextBox)e.Item.FindControl("TxPrice");
                HtmlTableRow trID = (HtmlTableRow)e.Item.FindControl("trID");

                ImageButton ImageButtonAdd = (ImageButton)e.Item.FindControl("ImageButtonAdd");
                ImageButton ImageButtonCal = (ImageButton)e.Item.FindControl("ImageButtonCal");
                ImageButton ImageButtonReQ = (ImageButton)e.Item.FindControl("ImageButtonReQ");

                id.Text = vsDr["PriceID"].ToString();
                LbCode.Text = vsDr["Code"].ToString();
                NewItem.Text = vsDr["NewItem"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                Session["bid"] = vsDr["BID"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbAmount.Text = vsDr["Amount"].ToString();
                LbCAmount.Text = vsDr["CAmount"].ToString();
                LbAPrice.Text = vsDr["APrice"].ToString();
                TxPrice.Text = (vsDr["Price"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(vsDr["Price"].ToString()))).ToString("#,#") : "";
                RFQ_Code.Text = vsDr["RFQ_Code"].ToString();
                //ImageButtonAdd.Visible = (vsDr["ItemKind"].ToString() != "variableSumPercentage") ? true : false;
                ImageButtonAdd.Visible = (vsDr["RFQ_Code"].ToString() == "") || (vsDr["RFQ_Code"].ToString() == null) ? true : false;
                ImageButtonCal.Visible = (vsDr["CAmount"].ToString() != "" && vsDr["CAmount"].ToString() != vsDr["Amount"].ToString() && vsDr["CAmount"].ToString() != "0") ? true : false;
                ImageButtonReQ.Visible = (vsDr["RFQ_Code"].ToString() != "") ? true : false;

                if (NewItem.Text == "1")
                {
                    //( e.Item.FindControl("tdhideItem"), HtmlTableRow).Visible = False  

                    trID.Visible = false;
                    trID.Attributes.Add("style", "display:none");
                    javauid = trID.ClientID;
                    ShowString += javauid + ",";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "<script language=JavaScript>hide_tr();</script>");
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
                string database = Session["DatabaseName"].ToString();
            
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label id = (Label)item.FindControl("UID") as Label;
                    TextBox TxPrice = (TextBox)item.FindControl("TxPrice") as TextBox;
                    int Number = 0;
                    //強制轉換為數字
                    if (TxPrice.Text != "")
                    {
                        bool output = int.TryParse(TxPrice.Text, out Number);
                        if (output)
                        {

                            string ID = id.Text;
                            string number = TxPrice.Text;
                            SqlDataAdapter adp = new SqlDataAdapter("UPDATE Bid_Library SET Price= @Price  WHERE [PriceID] ='" + id.Text + "'", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));

                            adp.SelectCommand.Parameters.AddWithValue("@Price", number);

                            DataSet ds = new DataSet();
                            adp.Fill(ds);

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請輸入數字');", true);
                        }
                    }
                    bool UopdatePrice = DAL.PriceAnalysis.Resource_Update_Price(database,int.Parse(id.Text));
                }

            }
        }

        protected void Recovery_Click(object sender, EventArgs e)
        {
            Repeater1.DataBind();
            DDL_BidSelect_SelectedIndexChanged(this, null);
            DDL_BidSelect.SelectedValue = Session["BID"].ToString();

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "require")
            {
                string PriceID = ((Label)e.Item.FindControl("UID")).Text;

                OpenNewWindow("ResourcePriceAdjest.aspx?PriceID=" + PriceID + "", "A", "1200", "400");
            }

            if (e.CommandName == "add")
            {
                string PriceID = ((Label)e.Item.FindControl("UID")).Text;
                string RFQ_Code = ((Label)e.Item.FindControl("RFQ_Code")).Text;
                OpenNewWindow("RFQAdd.aspx?RFQ_Code=" + RFQ_Code + "&PriceID=" + PriceID + "", "A", "1500", "1400");
            }
            if (e.CommandName == "ReQ")
            {
                string PriceID = ((Label)e.Item.FindControl("UID")).Text;
                string RFQ_Code = ((Label)e.Item.FindControl("RFQ_Code")).Text;
                OpenNewWindow("RFQQuery.aspx?RFQ_Code=" + RFQ_Code + "&PriceID=" + PriceID + "", "A", "1200", "800");
            }
        }

        protected void IBtn_PriceFill_Click(object sender, ImageClickEventArgs e)
        {
            Session["BidBudgetPEdit"] = Session["Bid"].ToString() ;
            Response.Redirect("BidBudgetEdit.aspx");
        }
      
    }
}