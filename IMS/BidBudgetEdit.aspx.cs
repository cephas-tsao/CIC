using DAL;
using Pechkin;
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
    public partial class BidBudgetEdit : System.Web.UI.Page
    {
        protected string javauid;
        protected string ShowString;
        protected string LbLayerNum;
        protected string value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            LoadContentView();
            if (SystemSet.GetRequestSet("Bid") != "")
            {
                if (DDL_BidSelect == null || DDL_BidSelect.SelectedValue == "")
                {
                    DDL_BidSelect.DataBind();
                }
                Session["Bid"] = SystemSet.GetRequestSet("Bid");
                DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
                //PlaceHolder1.Controls.Clear();
                DDL_BidSelect_SelectedIndexChanged(this, null);
            }
            if (Session["Itemadd"] != null)
            {
                DDL_BidSelect.DataBind();
                DDL_BidSelect.AutoPostBack = true;
                DDL_BidSelect.SelectedItem.Value = Session["Itemadd"].ToString();
                DDL_BidSelect_SelectedIndexChanged(this, null);

            }
            if (Session["BidBudgetPEdit"] != null)
            {
                if (DDL_BidSelect == null || DDL_BidSelect.SelectedValue == "")
                {
                    DDL_BidSelect.DataBind();
                }
                DDL_BidSelect.AutoPostBack = true;
                DDL_BidSelect.SelectedItem.Value = Session["BidBudgetPEdit"].ToString();
                DDL_BidSelect_SelectedIndexChanged(this, null);

            }
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
            if (!IsPostBack)
            {
                if (DDL_BidSelect == null || DDL_BidSelect.SelectedValue == "")
                {
                    DDL_BidSelect.DataBind();
                }
                ListItem LI = new ListItem();
                LI.Text = "-請選擇-";
                LI.Value = "0";
                DDL_BidSelect.Items.Insert(0, LI);
                DDL_BidSelect.SelectedIndex = 0;
                Session["ResourceLinkPriceID"] = null;
                Session["Itemadd"] = null;
                Session["BidBudgetPEdit"] = null;


            }

        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        public void OpenNewWindow1(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=800";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void ImageButton197_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                Session["AddNew"] = "1";
                //OpenNewWindow("AddNewItem.aspx", "1", "height = 500, width = 800");
                ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('AddNewItem.aspx', 'window','height=500,width=1200');</script>"));
            }
        }
        protected void ImageButton196_Click(object sender, ImageClickEventArgs e)
        {
            if ((Display.ToolTip == "顯示缺漏項(目前隱藏)"))
            {
                Display.ImageUrl = "~/img/See.png";
                Display.ToolTip = "隱藏缺漏項(目前顯示)";
                Page.RegisterStartupScript("Show", "<script language=JavaScript>show_tr();</script>");
            }
            else
            {
                Display.ImageUrl = "~/img/UnSee.png";
                Display.ToolTip = "顯示缺漏項(目前隱藏)";
                Page.RegisterStartupScript("Hide", "<script language=JavaScript>hide_tr();</script>");
            }
        }
        protected void ImageButton214_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidSum.aspx', 'window','height=450,width=1500');</script>"));
            }
        }
        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            //OpenNewWindow("AnalysisQEdit.aspx", ImageButton7.ID);
        }
        protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Clear();
            DDL_LayerSelect.Items.Clear();
            Session["BID"] = DDL_BidSelect.SelectedItem.Value;
            DDL_BidSelect.SelectedValue = DDL_BidSelect.SelectedItem.Value;
            if (SystemSet.GetRequestSet("Bid") != "")
            {
                DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
            }
            Pnl_ALL.Visible = true;
            //ViewState["i"] = 0;
            //ViewState["ADDView"] = null;
            LoadContentView();
            if (Session["bid"] != null)
            {
                string database = Session["DatabaseName"].ToString();

                string SQLLayer = "Select max(LayerNum) as layer from Bid_WBS where bid=" + Session["bid"].ToString();
                string Layer = WebModel.SItemName(database, SQLLayer, "layer");
                if (Layer != "")
                {
                    DDL_LayerSelect.Items.Add("-請選擇-");
                    for (int i = 1; i <= int.Parse(Layer); i++)
                    {                        
                        DDL_LayerSelect.Items.Add(i.ToString());
                    }
                }
                else
                {
                    DDL_LayerSelect.Items.Clear();

                }
            }
        }
        protected void Display_Click(object sender, EventArgs e)
        {
            if (Session["BID"] != null)
            {

                string Num = ViewState["rowNum"].ToString();
                if ((Display.ToolTip == "顯示缺漏項(目前隱藏)"))
                {
                    for (int i = 0; i < int.Parse(Num); i++)
                    {
                        Label NewItem = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("NewItem" + i.ToString());
                        Label uid = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("uid" + i.ToString());

                        if (NewItem.Text == "1")
                        {

                            javauid = "tr" + i;
                            ShowString += javauid + ",";
                            //trid.Add(javauid);

                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Show", "<script language=JavaScript> var result_style = document.getElementById('"+ javauid + "').style;result_style.display = 'table-row';document.getElementById(''"+ javauid + "').className = 'TableNew';</script>");
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Show", "<script language=JavaScript>show_tr();</script>");
                            Display.ToolTip = "隱藏缺漏項(目前顯示)";
                        }
                    }
                }
                else if ((Display.ToolTip == "隱藏缺漏項(目前顯示)"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Hide", "<script language=JavaScript>hide_tr();</script>");
                    Display.ToolTip = "顯示缺漏項(目前隱藏)";
                }
            }
            else
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");

            }

        }
        protected void LoadContentView()
        {
            //OTotal.Text = "";
            //BTotal.Text = "";
            //CTotal.Text = "";
            if (Session["BID"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLStringNum = "Select  MAX(LayerNum) as id  from Bid_WBS where BID='" + Session["BID"].ToString() + "'";
                string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.BID='" + Session["BID"].ToString() + "' order by order_Num";
                //DDLDtlLayer.SelectedValue
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString);
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringNum);
                DataTable Tablebox = GetDataBox();
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbLayerNum = row["id"].ToString();

                    }

                    ViewState["rowNum"] = DataTableBox1.Rows.Count;
                    if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                    {
                        //PlaceHolder1.Controls.Clear();  //先清除所有子控制項
                        int count = 0;
                        decimal x1 = 0;
                        decimal x2 = 0;
                        decimal x3 = 0;
                        decimal x4 = 0;
                        decimal TempC = 0;
                        decimal tempCP = 0;
                        decimal TempBP = 0;
                        decimal sumC = 0;
                        decimal sumO = 0;
                        decimal Rate = 0;
                        if (LbOTotal.Text != "" && LbOTotal.Text != "0")
                        {
                            Rate = decimal.Parse(LbCTotal.Text) / decimal.Parse(LbOTotal.Text);
                        }
                        foreach (DataRow row in DataTableBox1.Rows)
                        {


                            Label Texbox = new Label();
                            //Texbox.Width = 50;
                            string layer = row["LayerNum"].ToString();
                            string UpperUID = row["UpperUID"].ToString();
                            string order_Num = row["order_Num"].ToString();
                            string UID1 = row["UID"].ToString();
                            string SortNum = row["SortNum"].ToString();
                            if (layer == "")
                            {
                                PlaceHolder1.Controls.Add(new LiteralControl(" <tr id=tr" + count.ToString() + " class=\"TableSingle\"><td class=\"autoCenter\">"));
                                PlaceHolder1.Controls.Add(Texbox);
                                PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                            }
                            else
                            {

                                int sort = count + 1;
                                if (layer == "1")
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " style=\"background-color:white\" class=\"treegrid-" + sort.ToString() + "\">"));

                                }
                                else
                                {
                                    string Find_order_Num = BidLayerCodeSort.Get_Order(database, Session["BID"].ToString(), UID1, UpperUID, order_Num, SortNum);

                                    PlaceHolder1.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " style=\"background-color:white\" class=\"treegrid-" + sort.ToString() + " treegrid-parent-" + Find_order_Num + "\">"));

                                }
                                ImageButton edit = new ImageButton();
                                edit.ID = "Edit" + count.ToString();
                                edit.ImageUrl = "~/img/Edit.png";
                                edit.ToolTip = "逐項編輯";
                                edit.Width = 27;
                                edit.Style.Add("padding-left", "15px");
                                edit.Style.Add("Float", "right");
                                edit.Click += edit_Click;

                                ImageButton Delete = new ImageButton();
                                Delete.ID = "Delete" + count.ToString();
                                Delete.ImageUrl = "~/img/Delete.png";
                                Delete.ToolTip = "刪除";
                                Delete.Width = 27;
                                Delete.Style.Add("padding-left", "15px");
                                Delete.Style.Add("Float", "right");
                                Delete.Click += delete_Click;
                                Delete.OnClientClick = "return confirm('確定是否刪除?');";
                                //Delete.Attributes.Add("OnClientClick", "javaScript: return confirm('確定是否刪除?');");
                                //Delete.OnClientClick+=
                                if (edit == null)
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("<td ></td>"));
                                }
                                else
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("<td style='padding-left:10px;width:160px'>"));
                                    PlaceHolder1.Controls.Add(edit);
                                    PlaceHolder1.Controls.Add(Delete);
                                    PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                                }
                                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>"));

                                }
                                int x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;
                                PlaceHolder1.Controls.Add(new LiteralControl("<td colspan= " + x + ">"));
                                PlaceHolder1.Controls.Add(Texbox);
                                if (x == 0)
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                                }
                                else
                                {
                                    PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                                }
                            }

                            Label UID = new Label();
                            UID.ID = "UID" + count.ToString();
                            UID.Visible = false;
                            Label NewItem = new Label();
                            PlaceHolder1.Controls.Add(NewItem);
                            NewItem.Visible = false;
                            NewItem.ID = "NewItem" + count.ToString();
                            PlaceHolder1.Controls.Add(UID);
                            Texbox.ID = "Tx" + count.ToString();

                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"autoLeft\" style=\"width:30%\">"));
                            Label ItemName1 = new Label();
                            //ItemName1.Width = 350;
                            ItemName1.Style.Add("Width", "500px");
                            ItemName1.ID = "Name" + count.ToString();
                            PlaceHolder1.Controls.Add(ItemName1);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                            Label Unit = new Label();
                            Unit.ID = "Unit" + count.ToString();
                            PlaceHolder1.Controls.Add(Unit);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"auto-style43\">"));
                            ImageButton ImgAnalyst = new ImageButton();
                            ImgAnalyst.Click += ImgAnalyst_Click;
                            ImgAnalyst.ID = "ImgAnalyst" + count.ToString();
                            ImgAnalyst.Visible = (row["Complex"].ToString() == "1") ? true : false;
                            ImgAnalyst.ImageUrl = "~/img/Ana.jpg";

                            PlaceHolder1.Controls.Add(ImgAnalyst);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                            Label ItemKind = new Label();
                            ItemKind.ID = "ItemKind" + count.ToString();

                            TextBox Number = new TextBox();
                            Number.CssClass = "TBshort";
                            Number.Style.Add("float", "right");
                            Number.Style.Add("text-align", "right");
                            Number.ID = "Num" + count.ToString();
                            PlaceHolder1.Controls.Add(Number);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label UnitPrice = new Label();
                            UnitPrice.ID = "UnitPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(UnitPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label Complexprice = new Label();
                            Complexprice.ID = "Complexprice" + count.ToString();
                            PlaceHolder1.Controls.Add(Complexprice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            TextBox CNumber = new TextBox();
                            CNumber.CssClass = "TBshort";
                            CNumber.Style.Add("text-align", "right");
                            CNumber.ID = "CNumber" + count.ToString();
                            PlaceHolder1.Controls.Add(CNumber);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label CPrice = new Label();
                            CPrice.ID = "CPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(CPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label BNumber = new Label();
                            BNumber.ID = "BNumber" + count.ToString();
                            PlaceHolder1.Controls.Add(BNumber);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label BUnitPrice = new Label();
                            BUnitPrice.ID = "BUnitPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(BUnitPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td style='text-align:right'>"));
                            Label BCPrice = new Label();
                            BCPrice.ID = "BCPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(BCPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                            Label Notes = new Label();
                            Notes.ID = "Notes" + count.ToString();
                            PlaceHolder1.Controls.Add(Notes);
                            // PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));

                            PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));

                            ItemKind.Text = row["ItemKind"].ToString();
                            if (ItemKind.Text == "mainitem")
                            {
                                Number.Visible = false;
                                CNumber.Visible = false;
                                UnitPrice.Visible = false;
                                Complexprice.Visible = false;
                                CPrice.Visible = false;
                                BNumber.Visible = false;
                                BUnitPrice.Visible = false;
                                BCPrice.Visible = false;
                            }
                            ItemName1.Text = row["ItemName"].ToString();
                            Unit.Text = row["Unit"].ToString();
                            UnitPrice.Text = (row["Price"].ToString().Trim() != "") ? row["Price"].ToString().Trim() : "-";
                            //原標單數量
                            if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") != "")
                            {
                                decimal n1 = (row["Number"].ToString() != "") ? decimal.Parse(row["Number"].ToString()) : 0;
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));

                                Number.Text = (Number.Text != "0") ? Math.Round(n1, x).ToString("N" + x) : "-";

                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "1")
                            {
                                Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Number"].ToString()))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "2")
                            {
                                Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["Number"].ToString()))).ToString("N") : "-";

                            }
                            else
                            {
                                Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Number"].ToString()))).ToString("N") : "-";

                            }

                            //校核後數量
                            if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") != "")
                            {
                                decimal n1 = (row["CNumber"].ToString() != "") ? decimal.Parse(row["CNumber"].ToString()) : 0;
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));
                                CNumber.Text = (CNumber.Text != "0") ? Math.Round(n1, x).ToString("N" + x) : "-";

                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "1")
                            {
                                CNumber.Text = (row["CNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CNumber"].ToString()))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "2")
                            {
                                CNumber.Text = (row["CNumber"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["CNumber"].ToString()))).ToString("N") : "-";

                            }
                            else
                            {
                                CNumber.Text = (row["CNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CNumber"].ToString()))).ToString("N") : "-";

                            }
                            //CNumber.Text = (row["CNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CNumber"].ToString()))).ToString("#,#") : "-";


                            //原標單單價
                            if (SystemSet.GetRequestSet("RBLRuleValue2") == "0")
                            {
                                decimal n1 = (row["Price"].ToString() != "") ? decimal.Parse(row["Price"].ToString()) : 0;
                                int x = SystemSet.GetRequestSet("TxDecmal2") != "" ? int.Parse(SystemSet.GetRequestSet("TxDecmal2")) : 0;
                                UnitPrice.Text = Math.Round(n1, x).ToString("N" + x);

                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "1")
                            {
                                UnitPrice.Text = (row["Price"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Price"].ToString()))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "2")
                            {
                                UnitPrice.Text = (row["Price"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["Price"].ToString()))).ToString("N") : "-";

                            }
                            else
                            {
                                UnitPrice.Text = (row["Price"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Price"].ToString()))).ToString("N") : "-";

                            }
                            //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";
                            Texbox.Text = row["ItemOrder"].ToString();
                            UID.Text = row["uid"].ToString();
                            //Number.Text = (Number.Text != "-" && Number.Text != "") ? Number.Text : "0";
                            //UnitPrice.Text = (UnitPrice.Text != "-" && UnitPrice.Text !="") ? UnitPrice.Text : "0";
                            //原複價總和
                            decimal Complexprice1 = (decimal.Parse((Number.Text != "-" && Number.Text != "") ? Number.Text : "0") * decimal.Parse((UnitPrice.Text != "-" && UnitPrice.Text != "") ? UnitPrice.Text : "0"));

                            //原標單複價
                            if (SystemSet.GetRequestSet("RBLRuleValue3") == "0" && SystemSet.GetRequestSet("TxDecmal3") != "")
                            {
                                //decimal n1 = decimal.Parse(Number.Text);
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                                Number.Text = (Number.Text != "-") ? Number.Text : "0";
                                UnitPrice.Text = (UnitPrice.Text != "-") ? UnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(Number.Text) * decimal.Parse(UnitPrice.Text));
                                Complexprice.Text = Math.Round(n1, x).ToString("N" + x);
                                //Complexprice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,#");

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "1")
                            {
                                Number.Text = (Number.Text != "-") ? Number.Text : "0";
                                UnitPrice.Text = (UnitPrice.Text != "-") ? UnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(Number.Text) * decimal.Parse(UnitPrice.Text));
                                Complexprice.Text = Math.Ceiling(n1).ToString("N");

                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "2")
                            {
                                Number.Text = (Number.Text != "-") ? Number.Text : "0";
                                UnitPrice.Text = (UnitPrice.Text != "-") ? UnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(Number.Text) * decimal.Parse(UnitPrice.Text));
                                Complexprice.Text = Math.Floor(n1).ToString("N");

                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else
                            {
                                Number.Text = (Number.Text != "-") ? Number.Text : "0";
                                UnitPrice.Text = (UnitPrice.Text != "-") ? UnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(Number.Text) * decimal.Parse(UnitPrice.Text));
                                Complexprice.Text = Math.Ceiling(n1).ToString("N");

                            }
                            //Complexprice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,#");
                            decimal CPrice1 = (decimal.Parse((CNumber.Text != "-" && CNumber.Text != "") ? CNumber.Text : "0")) * (decimal.Parse((UnitPrice.Text != "-" && UnitPrice.Text != "") ? UnitPrice.Text : "0"));
                            //CPrice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(CNumber.Text ) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,#");

                            if (Complexprice.Text != "")
                            {
                                tempCP = decimal.Parse(Complexprice.Text);

                            }
                            //校核後複價
                            if (SystemSet.GetRequestSet("RBLRuleValue3") == "0" && SystemSet.GetRequestSet("TxDecmal3") != "")
                            {
                                //decimal n1 = decimal.Parse(Number.Text);
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                                CNumber.Text = (CNumber.Text != "-" && (CNumber.Text != "")) ? CNumber.Text : "0";
                                decimal n1 = (decimal.Parse(CNumber.Text) * decimal.Parse(UnitPrice.Text));
                                CPrice.Text = Math.Round(n1, x).ToString("N" + x);
                                //CPrice.Text = (decimal.Parse(CNumber.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0"))).ToString("#,#");

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "1")
                            {
                                CNumber.Text = (CNumber.Text != "-" && CNumber.Text != "") ? CNumber.Text : "0";
                                decimal n1 = (decimal.Parse(CNumber.Text) * decimal.Parse(UnitPrice.Text));
                                CPrice.Text = Math.Ceiling(n1).ToString("N");

                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "2")
                            {
                                CNumber.Text = (CNumber.Text != "-" && CNumber.Text != "") ? CNumber.Text : "0";
                                decimal n1 = (decimal.Parse(CNumber.Text) * decimal.Parse(UnitPrice.Text));
                                CPrice.Text = Math.Floor(n1).ToString("N");
                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else
                            {
                                CNumber.Text = (CNumber.Text != "-" && CNumber.Text != "") ? CNumber.Text : "0";
                                decimal n1 = (decimal.Parse(CNumber.Text) * decimal.Parse(UnitPrice.Text));
                                CPrice.Text = Math.Ceiling(n1).ToString("N");

                            }


                            if (CPrice.Text != "" && CPrice.Text != "0")
                            {
                                TempC = decimal.Parse(CPrice.Text);

                            }

                            //投標預算數量
                            if (SystemSet.GetRequestSet("RBLNum") == "0")
                            {
                                //decimal n1 = (row["BNumber"].ToString() != "") ? decimal.Parse(row["BNumber"].ToString()) : 0;
                                //int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));
                                //BNumber.Text = Math.Round(n1, x).ToString("N" + x);
                                BNumber.Text = Number.Text;
                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLNum") == "1")
                            {
                                //BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BNumber"].ToString()))).ToString("N") : "-";
                                //BNumber.Text = Number.Text;
                                if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") != "")
                                {
                                    decimal n1 = (Number.Text != "") ? decimal.Parse(Number.Text) : 0;
                                    int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));
                                    BNumber.Text = (BNumber.Text != "0") ? Math.Round(n1, x).ToString("N" + x) : "-";

                                    // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                                }
                                else if (SystemSet.GetRequestSet("RBLRuleValue1") == "1")
                                {
                                    BNumber.Text = (Number.Text != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text))).ToString("N") : "-";

                                }
                                else if (SystemSet.GetRequestSet("RBLRuleValue1") == "2")
                                {
                                    BNumber.Text = (Number.Text != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(Number.Text))).ToString("N") : "-";

                                }
                                else
                                {
                                    BNumber.Text = (Number.Text != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text))).ToString("N") : "-";

                                }
                            }

                            //投標預算單價
                            string SQLSelect = "Select * from Bid_WBS where UID=" + UID.Text;
                            string PriceID = WebModel.SItemName(database, SQLSelect, "PriceID");
                            string SelectSQL1 = "Select * from Bid_Library where PriceID=" + PriceID;
                            string APrice = WebModel.SItemName(database, SelectSQL1, "APrice");
                            if (SystemSet.GetRequestSet("RBLPrice") == "0")
                            {

                                BUnitPrice.Text = UnitPrice.Text;
                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLPrice") == "1" && SystemSet.GetRequestSet("RBLRuleValue2") == "0")
                            {


                                int x = SystemSet.GetRequestSet("TxDecmal2") != "" ? int.Parse(SystemSet.GetRequestSet("TxDecmal2")) : 0;
                                //if (APrice != "")
                                //{
                                //    decimal n1 = (APrice != "") ? decimal.Parse(APrice) : 0;
                                //    BUnitPrice.Text = (APrice != "0") ? Math.Round(n1, x).ToString("N" + x) : "-";
                                //    sumC += decimal.Parse(BUnitPrice.Text) * decimal.Parse(Number.Text);
                                //}
                                if (Number.Text != "" && decimal.Parse(Number.Text) != 0 && APrice == "")
                                {
                                    decimal n1 = (UnitPrice.Text != "") ? decimal.Parse(UnitPrice.Text) : 0;
                                    string TempBPrice = (UnitPrice.Text != "0") ? Math.Round(n1, x).ToString("N" + x) : "0";
                                    sumO = decimal.Parse(TempBPrice) * decimal.Parse(Number.Text);
                                    // 計算剩餘複價平分於個別單價     
                                    LbATotal.Text = Session["APrice"].ToString();
                                    BUnitPrice.Text = TempBPrice != "0" ? (Math.Round(Rate * decimal.Parse(TempBPrice), x)).ToString() : "0";
                                }
                                else if (APrice != "")
                                {
                                    BUnitPrice.Text = Math.Round(Rate * decimal.Parse(APrice), x).ToString();

                                }
                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }

                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "1")
                            {
                                BUnitPrice.Text = (UnitPrice.Text != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(UnitPrice.Text))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "2")
                            {
                                BUnitPrice.Text = (UnitPrice.Text != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(UnitPrice.Text))).ToString("N") : "-";

                            }


                            //decimal tempTotal = sumO - sumC;


                            decimal BCPrice1 = (decimal.Parse((BNumber.Text != "-" && BNumber.Text != "") ? BNumber.Text : "0")) * (decimal.Parse((BUnitPrice.Text != "-" && BUnitPrice.Text != "") ? BUnitPrice.Text : "0"));
                            //BCPrice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text))).ToString("#,#");
                            //投標預算複價
                            if (SystemSet.GetRequestSet("RBLRuleValue3") == "0" && SystemSet.GetRequestSet("TxDecmal3") != "")
                            {
                                //decimal n1 = decimal.Parse(Number.Text);
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                                BNumber.Text = (BNumber.Text != "-" && BNumber.Text != "") ? BNumber.Text : "0";
                                BUnitPrice.Text = (BUnitPrice.Text != "-" && BUnitPrice.Text != "") ? BUnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text));
                                BCPrice.Text = Math.Round(n1, x).ToString("N" + x);
                                //CPrice.Text = (decimal.Parse(CNumber.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0"))).ToString("#,#");

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "1")
                            {
                                BNumber.Text = (BNumber.Text != "-" && BNumber.Text != "") ? BNumber.Text : "0";
                                BUnitPrice.Text = (BUnitPrice.Text != "-" && BUnitPrice.Text != "") ? BUnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text));
                                BCPrice.Text = Math.Ceiling(n1).ToString("N");

                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "2")
                            {
                                BNumber.Text = (BNumber.Text != "-" && BNumber.Text != "") ? BNumber.Text : "0";
                                BUnitPrice.Text = (BUnitPrice.Text != "-" && BUnitPrice.Text != "") ? BUnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text));
                                BCPrice.Text = Math.Floor(n1).ToString("N");
                                //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";

                            }
                            else
                            {
                                BNumber.Text = (BNumber.Text != "-" && BNumber.Text != "") ? BNumber.Text : "0";
                                BUnitPrice.Text = (BUnitPrice.Text != "-" && BUnitPrice.Text != "") ? BUnitPrice.Text : "0";
                                decimal n1 = (decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text));
                                BCPrice.Text = Math.Ceiling(n1).ToString("N");

                            }

                            if (BCPrice.Text != "")
                            {
                                TempBP = decimal.Parse(BCPrice.Text);


                            }
                            Notes.Text = row["Notes"].ToString();
                            NewItem.Text = row["NewItem"].ToString();

                            if (NewItem.Text == "1")
                            {
                                javauid = "tr" + count;
                                ShowString += javauid + ",";


                                Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "<script language=JavaScript>hide_tr();</script>");
                            }


                            //int x = SystemSet.GetRequestSet("TxDecmal2") != "" ? int.Parse(SystemSet.GetRequestSet("TxDecmal2")) : 0;
                            if (APrice != "")
                            {

                                sumC = decimal.Parse(APrice) * decimal.Parse(Number.Text);
                            }

                            //x1 += Complexprice1;
                            //x2 += CPrice1;
                            //x3 += BCPrice1;
                            x1 += TempC;
                            x2 += TempBP;
                            x3 += tempCP;
                            x4 += sumC;
                            count++;
                            LbCTotal.Text = x1.ToString("N0");
                            LbBTotal.Text = x2.ToString("N0");
                            LbOTotal.Text = x3.ToString("N0");
                            LbATotal.Text = x4.ToString("N0");

                            this.ViewState["ADDView"] = true;
                            //if (SystemSet.GetRequestSet("RBLRuleValue4") == "0" && SystemSet.GetRequestSet("TxDecmal4") != "")
                            //{
                            //    //decimal n1 = decimal.Parse(Number.Text);
                            //    int x = int.Parse(SystemSet.GetRequestSet("TxDecmal4"));
                            //    //OTotal.Text = Math.Round(x1, x).ToString("N" + x);
                            //    //CTotal.Text = Math.Round(x2, x).ToString("N" + x);
                            //    //BTotal.Text = Math.Round(x3, x).ToString("N" + x);

                            //}
                            //else if (SystemSet.GetRequestSet("RBLRuleValue4") == "1")
                            //{
                            //    //int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                            //    //OTotal.Text = Convert.ToInt32(Math.Ceiling(x1)).ToString("N");
                            //    //CTotal.Text = Convert.ToInt32(Math.Ceiling(x2)).ToString("N");
                            //    //BTotal.Text = Convert.ToInt32(Math.Ceiling(x3)).ToString("N");

                            //}
                            //else if (SystemSet.GetRequestSet("RBLRuleValue4") == "2")
                            //{
                            //    //OTotal.Text = Convert.ToInt32(Math.Floor(x1)).ToString("N");
                            //    //CTotal.Text = Convert.ToInt32(Math.Floor(x2)).ToString("N");
                            //    //BTotal.Text = Convert.ToInt32(Math.Floor(x3)).ToString("N");

                            //}
                            //else
                            //{
                            //    //OTotal.Text = Convert.ToInt32(Math.Ceiling(x1)).ToString("N");
                            //    //CTotal.Text = Convert.ToInt32(Math.Ceiling(x2)).ToString("N");
                            //    //BTotal.Text = Convert.ToInt32(Math.Ceiling(x3)).ToString("N");

                            //}

                            //for (int i = 0; i < DataTableBox1.Rows.Count; i++)
                            //{
                            DataRow DataTableDr = Tablebox.NewRow();
                            //DataTableDr["bid"] = Session["bid"].ToString();

                            DataTableDr["UID"] = UID.Text;
                            DataTableDr["ItemOrder"] = Texbox.Text;
                            DataTableDr["NewItem"] = NewItem.Text;
                            DataTableDr["Name"] = ItemName1.Text;
                            DataTableDr["Unit"] = Unit.Text;
                            DataTableDr["Complex"] = ImgAnalyst.Visible;
                            DataTableDr["Number"] = Number.Text;
                            DataTableDr["UnitPrice"] = UnitPrice.Text;
                            DataTableDr["Complexprice"] = Complexprice.Text;
                            DataTableDr["CNumber"] = CNumber.Text;
                            DataTableDr["CPrice"] = CPrice.Text;
                            DataTableDr["BNumber"] = BNumber.Text;
                            DataTableDr["BUnitPrice"] = BUnitPrice.Text;
                            DataTableDr["BCPrice"] = BCPrice.Text;
                            DataTableDr["Notes"] = Notes.Text;


                            Tablebox.Rows.Add(DataTableDr);


                        }
                        Session["PlaceHolder"] = Tablebox;
                        // DataTableBox.Dispose(); //釋放Table資源
                    }

                }
                // foreach 作法
                //foreach (DataGridViewRow row in PlaceHolder1.)
                //{
                //    int index = dgv.Rows.IndexOf(row);
                //    if (index % 2 == 0)
                //    {
                //        row.DefaultCellStyle.BackColor = Color.DarkGray;
                //    }
                //    else
                //    {
                //        row.DefaultCellStyle.BackColor = Color.DarkOliveGreen;
                //    }
                //}
                Session["APrice"] = LbATotal.Text;
            }
            //Session["Itemadd"] = null;
            //Session["BidBudgetPEdit"] = null;

        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string SQLString = "UID,ItemOrder,NewItem,Name,Unit,Complex,Number,UnitPrice,Complexprice,CNumber,CPrice,BNumber,BUnitPrice,BCPrice,Notes";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            //DataRow DataTableDr = DataTableBox.NewRow();

            //string TopWBS = DDLTop.SelectedValue;
            //string Next = DDLNext.SelectedValue;
            //string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            //string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            #region 內容設定
            //if (Session["bid"] != null)
            //{
            //    for (int i = 0; i < DataTableBox.Rows.Count; i++)
            //    {

            //        //DataTableDr["bid"] = Session["bid"].ToString();

            //        DataTableDr["UID"] = DDLLayer.SelectedValue;
            //        DataTableDr["NewItem"] = DDLTop.SelectedValue;
            //        DataTableDr["Name"] = DDLNext.SelectedValue;
            //        DataTableDr["Unit"] = ItemName;
            //        DataTableDr["Complex"] = Notes;


            //        DataTableBox.Rows.Add(DataTableDr);
            //    }
            #endregion


            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            //}
            return DataTableBox;
        }
        private void ImgAnalyst_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(10);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Session["uid"] = UUID.Text;

            Response.Write("<script>window.open('AnalysisV.aspx?UId=" + UUID.Text + "', 'window', config='height=500,width=1300')</script>");

        }
        private void edit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(4);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Session["uid"] = UUID.Text;

            Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
        }
        private void delete_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(6);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            string SQLSelectUpperUID = "Select * from Bid_WBS where UpperUID=" + UUID.Text;
            string SelectUpperUID = WebModel.SItemName(database, SQLSelectUpperUID, "UpperUID");
            ViewState["uid"] = UUID.Text;
            if (SelectUpperUID != "")
            {
                Page.ClientScript.RegisterStartupScript(typeof(string), "BtnDelayer_Click", "var retValue=confirm('該階層有項目，是否刪除???');" + "if (retValue) {document.getElementById('" + LinkButtonDel.ClientID + "').click();};", true);
            }
            else
            {
                string Select = "Select * from Bid_WBS where UID=" + UUID.Text;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperUID = WebModel.SItemName(database, Select, "UpperUID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");

                string DelSQL = "Delete Bid_WBS where UID=" + UUID.Text;
                bool result = WebModel.SQLAction(database, DelSQL);
                string SQLUpdateSort = "update Bid_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperUID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and bid=" + Session["Bid"].ToString();
                result = WebModel.SQLAction(database, SQLUpdateSort);
                //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
                string select1 = "Select * from BidM0 where bid=" + Session["bid"].ToString();
                string BidNumType = WebModel.SItemName(database, select1, "BidNumType");
                string UpdateItemOrder;
                if (BidNumType == "0")
                {
                    bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                    UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                    bool update = WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                }
                else if (BidNumType == "1")
                {
                    bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                    UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                    result = WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                }
                if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除成功');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除失敗');", true);
                }
                DDL_BidSelect.DataBind();
                DDL_BidSelect.AutoPostBack = true;
                DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
                DDL_BidSelect_SelectedIndexChanged(this, null);

            }

        }
        //if there is a upperUID ,delete all
        protected void LinkButtonDel_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            bool result = false;
            int UPPID = int.Parse(ViewState["uid"].ToString());
            string[] uid = checkfun.BWBS_UpperUID(database, UPPID);
            foreach (string uuu in uid)//使用foreach迴圈撈出陣列值
            {
                string Select = "Select * from Bid_WBS where UID=" + uuu;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperUID = WebModel.SItemName(database, Select, "UpperUID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");

                string DelSQL = "Delete Bid_WBS where UID=" + uuu;


                result = WebModel.SQLAction(database, DelSQL);
                string SQLUpdateSort = "update Bid_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperUID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and bid=" + Session["Bid"].ToString();
                result = WebModel.SQLAction(database, SQLUpdateSort);
            }
            string DelSQL1 = "Delete Bid_WBS where UID=" + ViewState["uid"].ToString();
            result = WebModel.SQLAction(database, DelSQL1);
            //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
            string select1 = "Select * from BidM0 where bid=" + Session["bid"].ToString();
            string BidNumType = WebModel.SItemName(database, select1, "BidNumType");
            string UpdateItemOrder;
            if (BidNumType == "0")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                bool update = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            }
            else if (BidNumType == "1")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = LayerOrder.OrderName from Bid_WBSLayer join BID_WBS on BID_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                result = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
            }
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除成功');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除失敗');", true);
            }
            DDL_BidSelect.DataBind();
            DDL_BidSelect.AutoPostBack = true;
            DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
            DDL_BidSelect_SelectedIndexChanged(this, null);
        }
        protected void callback_Click(object sender, EventArgs e)
        {

            //Response.Redirect("BidBudgetEdit.aspx");

        }

        protected void ImgSave_Click(object sender, ImageClickEventArgs e)
        {

            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                string SQLWBS = "UID,Number,CNumber,BNumber";
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = new DataTable();

                if (Session["Bid"].ToString() != "")
                {
                    bool result1 = false;
                    string SlectNUmn = "Select count (*) as num from Bid_WBS where bid=" + Session["Bid"].ToString();
                    string TotalNum = WebModel.SItemName(database, SlectNUmn, "num");
                    string[] amount = DAL.PriceAnalysis.Bid_Library_Amount(database, Session["Bid"].ToString());
                    string PriceIDSearch = DAL.PriceAnalysis.Bid_WBS_PriceID(database, Session["Bid"].ToString());
                    string[] PIDAll = Utility.str_process.str2array(PriceIDSearch.Substring(0, PriceIDSearch.Length - 1));
                    string UPdateClear = "Update Bid_Library set  Amount=0,CAmount=0 where bid=" + Session["Bid"].ToString();
                    bool clearResult = WebModel.SQLAction(database, UPdateClear);
                    //string SQLUpdate = "UPDATE m SET m.Amount = f.valsum FROM Bid_Library m INNER JOIN (SELECT  PriceID, SUM(Number) valsum  FROM Bid_WBS  where BID=" + Session["Bid"].ToString() + "  GROUP BY  PriceID) f ON m.PriceID = f.PriceID";
                    //string SQLUpdate1 = "UPDATE m SET m.CAmount = f.valsum FROM Bid_Library m INNER JOIN (SELECT  PriceID, SUM(CNumber) valsum  FROM Bid_WBS  where BID=" + Session["Bid"].ToString() + "  GROUP BY  PriceID) f ON m.PriceID = f.PriceID";
                    string SQLUpdate = "UPDATE  Bid_Library SET  Bid_Library.Amount = 0,Bid_Library.CAmount = 0,Temp_Amount=0,Temp_CAmount=0  where BID=" + Session["Bid"].ToString() + "";

                    string SQLUpdate1 = "UPDATE  Bid_Library SET  Bid_Library.CAmount = ''  where a.BID=" + Session["Bid"].ToString() + "";
                    result1 = WebModel.SQLAction(database, SQLUpdate);
                    //result1 = WebModel.SQLAction(database, SQLUpdate1);
                    //string SQLUpdate2 = "UPDATE m SET m.Temp_Amount = f.valsum FROM Bid_Library m INNER JOIN (SELECT  PriceID, SUM(Number) valsum  FROM Bid_WBS  where BID=" + Session["Bid"].ToString() + "  GROUP BY  PriceID) f ON m.PriceID = f.PriceID";
                    //string SQLUpdate3 = "UPDATE m SET m.Temp_CAmount = f.valsum FROM Bid_Library m INNER JOIN (SELECT  PriceID, SUM(CNumber) valsum  FROM Bid_WBS  where BID=" + Session["Bid"].ToString() + "  GROUP BY  PriceID) f ON m.PriceID = f.PriceID";
                    string SQLUpdate2 = "UPDATE  Bid_Library SET  Bid_Library.Temp_Amount = b.Number FROM  Bid_Library a INNER JOIN Bid_WBS b ON a.PriceID = b.PriceID  where a.BID=" + Session["Bid"].ToString() + "";

                    string SQLUpdate3 = "UPDATE  Bid_Library SET  Bid_Library.Temp_CAmount = b.Number FROM  Bid_Library a INNER JOIN Bid_WBS b ON a.PriceID = b.PriceID  where a.BID=" + Session["Bid"].ToString() + "";
                    result1 = WebModel.SQLAction(database, SQLUpdate2);
                    result1 = WebModel.SQLAction(database, SQLUpdate3);
                    //for(int k=0; k<= amount.Length; K++)
                    //decimal TAmount = 0;
                    //decimal TCAmount = 0;
                    //decimal Amount1 = 0;
                    //decimal TCAmount1 = 0;
                    //if (amount[0] != "0")
                    //{
                    //    //for (int k = 0; k < amount.Length; k++)
                    //    //{
                    //    string[] PID = Utility.str_process.str2array(amount[0].Substring(0,amount[0].Length - 1));
                    //    string[] Amount = Utility.str_process.str2array(amount[1].Substring(0,amount[1].Length - 1));
                    //    string[] CAmount = Utility.str_process.str2array(amount[2].Substring(0,amount[2].Length - 1));

                    //    //foreach (string j in PIDAll)
                    //    for (int k = 0; k < PID.Length; k++)
                    //    {
                    //        string Pid = PID[k];
                    //        TAmount=  decimal.Parse(Amount[k]);
                    //        TCAmount = decimal.Parse(CAmount[k]);
                    //        //foreach (string j in PID)
                    //        for (int L = 0; L < PIDAll.Length; L++)
                    //        {

                    //            if (Pid == PIDAll[L])
                    //            {
                    //                Amount1 =  decimal.Parse(Amount[L]);
                    //                TCAmount1 = decimal.Parse(CAmount[L]);

                    //                TAmount = TAmount + Amount1;
                    //                TCAmount = TCAmount + TCAmount1;

                    //        }

                    //        }

                    //    }

                    //    //}
                    //}
                    foreach (string DataName in SQLWBS.Split(','))
                    {
                        DataTableBox.Columns.Add(DataName, typeof(string));
                    }
                    for (int i = 0; i < int.Parse(TotalNum); i++)
                    {
                        Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                        TextBox Num = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                        TextBox CNumber = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("CNumber" + i.ToString());
                        Label BNumber = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BNumber" + i.ToString());
                        Label BUnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BUnitPrice" + i.ToString());
                        Label UnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UnitPrice" + i.ToString());

                        bool result = false;
                        string SelectSQL = "Select * from Bid_WBS where UID=" + UID.Text;
                        string PriceID = WebModel.SItemName(database, SelectSQL, "PriceID");
                        if (PriceID != "" && PriceID != "0")
                        {
                            string SelectAPrice = "Select * from Bid_Library where PriceID=" + PriceID;
                            string APrice = WebModel.SItemName(database, SelectAPrice, "APrice");
                            if (APrice != "" && APrice != "0")
                            {

                                string UpdateAPriceToBPrice = "Update Bid_Library set BPrice=" + APrice + " where PriceID=" + PriceID;
                                result = WebModel.SQLAction(database, UpdateAPriceToBPrice);

                            }
                            else
                            {
                                string UupdateBPrice = "Update Bid_Library set BPrice=" + BUnitPrice.Text + " where PriceID=" + PriceID;
                                result = WebModel.SQLAction(database, UupdateBPrice);
                            }
                            //計算Amount
                            if (result1)
                            {

                                string SelectSQL2 = "Select Complex from Bid_Library where PriceID=" + PriceID;
                                string Complex = WebModel.SItemName(database, SelectSQL2, "Complex");
                                if (Num.Text != "" && decimal.Parse(Num.Text) != 0)
                                {
                                    bool addResult = DAL.PriceAnalysis.Sort_Resource(database, int.Parse(PriceID), UID.Text, Session["Bid"].ToString(), Num.Text, CNumber.Text);


                                }

                            }

                        }


                        //foreach (string ia in amount)
                        //{

                        //    string PID1 = ia[0].ToString();
                        //    decimal Amount2 =decimal.Parse(ia[1].ToString());
                        //    decimal CAmount3 = decimal.Parse(ia[2].ToString());

                        //}
                        //後台功能，必需要有的欄位名稱               

                        DataRow DataTableDr = DataTableBox.NewRow();

                        #region 內容設定

                        DataTableDr["UID"] = UID.Text;
                        //DataTableDr["PID"] = Session["ProjectCode"].ToString();
                        DataTableDr["Number"] = decimal.Parse(Num.Text);
                        DataTableDr["CNumber"] = decimal.Parse(CNumber.Text);
                        DataTableDr["BNumber"] = decimal.Parse(BNumber.Text);
                        DataTableBox.Rows.Add(DataTableDr);


                        #endregion


                        result1 = WebModel.EditAction(database, "Bid_WBS", UID.Text, DataTableBox);
                        DataTableBox.Rows.Clear();

                    }
                    if (result1)
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 存檔成功');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 存檔失敗');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請選擇標案');", true);
                }
            }
        }

        protected void ImgRecovery_Click(object sender, ImageClickEventArgs e)
        {
            PlaceHolder1.Controls.Clear();
            LoadContentView();
        }

        protected void ImgExcel_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                string SQLBidName = "Select * from BidM0 where Bid=" + Session["Bid"].ToString();
                string ProjectName = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLBidName, "BidName");
                Response.Expires = 0;
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + ProjectName + ".xls");
                Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");

                string l_str2 = "";
                //l_str2 +=@"<table border=""1"" class=""Table1""><tr class=""TableTop"">";
                l_str2 += @"<table id=""BidBudget"" class=""Sht100"" border=""1"" >
                            <tr class=""ShtRowTop"">                           
                                <td class=""ShtCellCC"" colspan=""<%=LbLayerNum %>"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                              
                                <td class=""ShtCellCC"" colspan=""3"">原標單</td>
                                <td class=""ShtCellCC"" colspan=""2"">校核後</td>
                                <td class=""ShtCellCC"" colspan=""3"">投標預算</td>
                                <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                            </tr>
                            <tr class=""ShtRowTop"">
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">複價</td>
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>
                            </tr>";
                if (Session["Bid"].ToString() != "")
                {
                    string database = Session["DatabaseName"].ToString();
                    string SlectNUmn = "Select count (*) as num from Bid_WBS where bid=" + Session["Bid"].ToString();
                    string TotalNum = WebModel.SItemName(database, SlectNUmn, "num");

                    for (int i = 0; i < int.Parse(TotalNum); i++)
                    {
                        Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                        Label Texbox = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                        Label Name = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                        Label Unit = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                        TextBox Num = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                        Label UnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UnitPrice" + i.ToString());
                        Label Complexprice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Complexprice" + i.ToString());

                        TextBox CNumber = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("CNumber" + i.ToString());
                        Label CPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("CPrice" + i.ToString());
                        Label BNumber = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BNumber" + i.ToString());
                        Label BUnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BUnitPrice" + i.ToString());
                        Label BCPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BCPrice" + i.ToString());
                        Label Notes = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                        l_str2 += @"<tr border=""1""><td class=""ShtCellCC"">" + Texbox.Text + "</td><td>" + Name.Text + "</td><td>" + Unit.Text + "</td><td>" + Num.Text + "</td><td>" + UnitPrice.Text + "</td><td>" + Complexprice.Text + "</td><td>" + CNumber.Text + "</td><td>" + CPrice.Text + "</td><td>" + BNumber.Text + "</td><td>" + BUnitPrice.Text + "</td><td>" + BCPrice.Text + "</td><td>" + Notes.Text + "</td></tr>";

                    }
                }
                l_str2 += @"</table>";
                Response.Write(l_str2);
                Response.End();

            }
        }

        protected void ImgPdf_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                string SQLBidName = "Select * from BidM0 where Bid=" + Session["Bid"].ToString();
                string ProjectName = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLBidName, "BidName");
                string l_str2 = "";
                l_str2 += @"<table id=""BidBudget"" class=""Sht100"" border=""1"" >
                            <tr class=""ShtRowTop"">                           
                                <td class=""ShtCellCC"" colspan=""<%=LbLayerNum %>"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                              
                                <td class=""ShtCellCC"" colspan=""3"">原標單</td>
                                <td class=""ShtCellCC"" colspan=""2"">校核後</td>
                                <td class=""ShtCellCC"" colspan=""3"">投標預算</td>
                                <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                            </tr>
                            <tr class=""ShtRowTop"">
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">複價</td>
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>
                            </tr>";
                if (Session["Bid"].ToString() != "")
                {
                    string database = Session["DatabaseName"].ToString();
                    string SlectNUmn = "Select count (*) as num from Bid_WBS where bid=" + Session["Bid"].ToString();
                    string TotalNum = WebModel.SItemName(database, SlectNUmn, "num");

                    for (int i = 0; i < int.Parse(TotalNum); i++)
                    {
                        Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                        Label Texbox = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                        Label Name = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                        Label Unit = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                        TextBox Num = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                        Label UnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UnitPrice" + i.ToString());
                        Label Complexprice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Complexprice" + i.ToString());

                        TextBox CNumber = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("CNumber" + i.ToString());
                        Label CPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("CPrice" + i.ToString());
                        Label BNumber = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BNumber" + i.ToString());
                        Label BUnitPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BUnitPrice" + i.ToString());
                        Label BCPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("BCPrice" + i.ToString());
                        Label Notes = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                        l_str2 += @"<tr border=""1""><td class=""ShtCellCC"">" + Texbox.Text + "</td><td>" + Name.Text + "</td><td>" + Unit.Text + "</td><td>" + Num.Text + "</td><td>" + UnitPrice.Text + "</td><td>" + Complexprice.Text + "</td><td>" + CNumber.Text + "</td><td>" + CPrice.Text + "</td><td>" + BNumber.Text + "</td><td>" + BUnitPrice.Text + "</td><td>" + BCPrice.Text + "</td><td>" + Notes.Text + "</td></tr>";

                    }
                }
                l_str2 += @"</table>";
                string html = l_str2.ToString();

                using (IPechkin pechkin = Factory.Create(new GlobalConfig()))
                {

                    var pdf = pechkin.Convert(new ObjectConfig()
                            .SetLoadImages(true).SetZoomFactor(1.5)
                            .SetPrintBackground(true)
                            .SetScreenMediaType(true)
                            .SetAffectPageCounts(true)
                            .SetCreateExternalLinks(true), html);




                    Response.Clear();

                    Response.ClearContent();
                    Response.ClearHeaders();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", string.Format("attachment;filename=" + ProjectName + ".pdf; size={0}", pdf.Length));
                    Response.BinaryWrite(pdf);

                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void IBtn_PriceFill_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');</script>");


            }
            else
            {
                Session["BidBudgetEdit"] = Session["Bid"].ToString();
                Response.Redirect("BidBudgetPEdit.aspx");
            }
        }

        protected void DDL_LayerSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
         
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Select(" + DDL_LayerSelect.SelectedValue + ");", true);//ajax 新增階層碼
           

        }



    }
}