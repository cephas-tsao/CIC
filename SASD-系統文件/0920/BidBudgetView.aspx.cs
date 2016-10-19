using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.WebControl
{
    public partial class BidBudgetView : System.Web.UI.Page
    {
        protected string javauid;
        protected string ShowString;
        protected string LbLayerNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //Loadcontent();
            LoadContentView();
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;

        }
        protected void Display_Click(object sender, EventArgs e)
        {
            if (Session["BID"] != null)
            {

                string Num = ViewState["rowNum"].ToString();
                if ((Display.Text == "顯示缺漏項"))
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
                            Display.Text = "隱藏缺漏項";
                        }
                    }
                }
                else if ((Display.Text == "隱藏缺漏項"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Hide", "<script language=JavaScript>hide_tr();</script>");
                    Display.Text = "顯示缺漏項";
                }
            }
        }
        protected void LoadContentView()
        {
            OTotal.Text = "";
            BTotal.Text = "";
            CTotal.Text = "";
            if (Session["BID"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLStringNum = "Select  MAX(LayerNum) as id  from Bid_WBS where BID='" + Session["BID"].ToString() + "'";
                string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.BID='" + Session["BID"].ToString() + "' order by order_Num";
                //DDLDtlLayer.SelectedValue
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLString);
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringNum);
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

                        foreach (DataRow row in DataTableBox1.Rows)
                        {


                            Label Texbox = new Label();
                            //Texbox.Width = 50;
                            string layer = row["LayerNum"].ToString();
                            if (layer == "")
                            {
                                PlaceHolder1.Controls.Add(new LiteralControl(" <tr id=" + count.ToString() + " class=\"ShtRowSingle\"><td class=\"ShtCellCR\">"));
                                PlaceHolder1.Controls.Add(Texbox);
                                PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                            }
                            else
                            {
                                PlaceHolder1.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " class=\"ShtRowSingle\">"));

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

                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCL\">"));
                            Label ItemName1 = new Label();
                            ItemName1.Style.Add("width", "15%");
                            ItemName1.Style.Add("padding-left", "5px");
                            ItemName1.ID = "Name" + count.ToString();
                            PlaceHolder1.Controls.Add(ItemName1);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                            Label Unit = new Label();
                            Unit.ID = "Unit" + count.ToString();
                            PlaceHolder1.Controls.Add(Unit);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCC\">"));
                            ImageButton ImgAnalyst = new ImageButton();
                            ImgAnalyst.Click += ImgAnalyst_Click;
                            ImgAnalyst.ID = "ImgAnalyst" + count.ToString();
                            ImgAnalyst.Visible = (row["Complex"].ToString() == "1") ? true : false;
                            ImgAnalyst.ImageUrl = "~/img/Ana.jpg";

                            PlaceHolder1.Controls.Add(ImgAnalyst);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label Number = new Label();
                            Number.ID = "Num" + count.ToString();
                            PlaceHolder1.Controls.Add(Number);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label UnitPrice = new Label();
                            UnitPrice.ID = "UnitPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(UnitPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label Complexprice = new Label();
                            Complexprice.ID = "Complexprice" + count.ToString();
                            PlaceHolder1.Controls.Add(Complexprice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label CNumber = new Label();
                            CNumber.ID = "CNumber" + count.ToString();
                            PlaceHolder1.Controls.Add(CNumber);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label CPrice = new Label();
                            CPrice.ID = "CPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(CPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label BNumber = new Label();
                            BNumber.ID = "BNumber" + count.ToString();
                            PlaceHolder1.Controls.Add(BNumber);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label BUnitPrice = new Label();
                            BUnitPrice.ID = "BUnitPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(BUnitPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCR\">"));
                            Label BCPrice = new Label();
                            BCPrice.ID = "BCPrice" + count.ToString();
                            PlaceHolder1.Controls.Add(BCPrice);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                            Label Notes = new Label();
                            Notes.ID = "Notes" + count.ToString();
                            PlaceHolder1.Controls.Add(Notes);
                           // PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));

                            PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));


                            ItemName1.Text = row["ItemName"].ToString();
                            Unit.Text = row["Unit"].ToString();
                            UnitPrice.Text = (row["Price"].ToString() != "") ? row["Price"].ToString() : "-";
                            Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Number"].ToString()))).ToString("#,0") : "-";
                            CNumber.Text = (row["CNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CNumber"].ToString()))).ToString("#,0") : "-";
                            UnitPrice.Text = (row["Price"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Price"].ToString()))).ToString("#,0") : "-";
                            Texbox.Text = row["ItemOrder"].ToString();
                            UID.Text = row["uid"].ToString();
                            decimal Complexprice1 = (decimal.Parse((Number.Text !="-")?Number.Text:"0")) * (decimal.Parse((UnitPrice.Text !="-")?UnitPrice.Text:"0"));
                            if (Number.Text != "-")
                            {
                                Complexprice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,0");
                            }
                            else
                            {
                                Number.Text = "0";
                                Complexprice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,0");
                            }
                            Complexprice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(Number.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,0");
                            decimal CPrice1 = (decimal.Parse((CNumber.Text != "-") ? CNumber.Text : "0")) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0"));
                            //CPrice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(CNumber.Text ) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,#");
                            if (CNumber.Text != "-")
                            {
                                CPrice.Text = (decimal.Parse(CNumber.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0"))).ToString("#,0");
                            }
                            else
                            {
                                CNumber.Text = "0";
                                CPrice.Text = (decimal.Parse(CNumber.Text) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0"))).ToString("#,0");
                            }
                            BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BNumber"].ToString()))).ToString("#,0") : "-";
                            BUnitPrice.Text = (row["BPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BPrice"].ToString()))).ToString("#,0") : "-";
                            decimal BCPrice1 =  (decimal.Parse((BNumber.Text !="-")?BNumber.Text:"0")) * (decimal.Parse((BUnitPrice.Text !="-")?BUnitPrice.Text:"0"));                            
                            //BCPrice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(BNumber.Text) * decimal.Parse(BUnitPrice.Text))).ToString("#,#");
                            if (BNumber.Text != "-")
                            {
                                decimal BUnitPrice1=(decimal.Parse((BUnitPrice.Text !="-")?BUnitPrice.Text:"0"));
                                BCPrice.Text = (Convert.ToInt32(Math.Ceiling(decimal.Parse(BNumber.Text))) * BUnitPrice1).ToString("#,0");
                            }
                            else
                            {
                                BNumber.Text = "0";
                                decimal BUnitPrice1 = (decimal.Parse((BUnitPrice.Text != "-") ? BUnitPrice.Text : "0"));
                                BCPrice.Text = (Convert.ToInt32(Math.Ceiling(decimal.Parse(BNumber.Text))) * BUnitPrice1).ToString("#,0");
                            }
                            Notes.Text = row["Notes"].ToString();
                            NewItem.Text = row["NewItem"].ToString();

                            if (NewItem.Text == "1")
                            {
                                javauid = "tr" + count;
                                ShowString += javauid + ",";


                                Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "<script language=JavaScript>hide_tr();</script>");
                            }

                            x1 +=  Complexprice1;
                            x2 += CPrice1;
                            x3 += BCPrice1;
                           
                            count++;
                        }

                        this.ViewState["ADDView"] = true;
                        OTotal.Text = Convert.ToInt32(Math.Ceiling(x1)).ToString("#,0");
                        CTotal.Text = Convert.ToInt32(Math.Ceiling(x2)).ToString("#,0");
                        BTotal.Text = Convert.ToInt32(Math.Ceiling(x3)).ToString("#,0");
                        // DataTableBox.Dispose(); //釋放Table資源
                    }

                }


            }

        }
        private void ImgAnalyst_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(10);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Session["uid"] = UUID.Text;

            Response.Write("<script>window.open('AnalysisV.aspx?UId=" + UUID.Text + "','_blank')</script>");

        }
        //protected void Button19_Click(object sender, EventArgs e)
        //{
        //    if ((Button19.Text == "顯示缺漏項"))
        //    {
        //        Page.RegisterStartupScript("Show", "<script language=JavaScript>show_tr();</script>");
        //        Button19.Text = "隱藏缺漏項";
        //    }
        //    else if ((Button19.Text == "隱藏缺漏項"))
        //    {
        //        Page.RegisterStartupScript("Hide", "<script language=JavaScript>hide_tr();</script>");
        //        Button19.Text = "顯示缺漏項";
        //    }
        //}
        protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            PlaceHolder1.Controls.Clear();
            Session["BID"] = DDL_BidSelect.SelectedValue;
            Pnl_ALL.Visible = true;
            ViewState["i"] = 0;
            ViewState["ADDView"] = null;
            LoadContentView();
        }
        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            //OpenNewWindow("AnalysisV.aspx", ImageButton7.ID);
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
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
                TextBox TxPrice = (TextBox)e.Item.FindControl("TxPrice");

                ImageButton ImageButtonAdd = (ImageButton)e.Item.FindControl("ImageButtonAdd");
                ImageButton ImageButtonCal = (ImageButton)e.Item.FindControl("ImageButtonCal");
                ImageButton ImageButtonReQ = (ImageButton)e.Item.FindControl("ImageButtonReQ");

                id.Text = vsDr["PriceID"].ToString();
                LbCode.Text = vsDr["Code"].ToString();
                //NewItem.Text = vsDr["NewItem"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                Session["bid"] = vsDr["BID"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbAmount.Text = vsDr["Amount"].ToString();
                LbCAmount.Text = vsDr["CAmount"].ToString() != "0"?vsDr["CAmount"].ToString():"-";
                LbAPrice.Text = vsDr["APrice"].ToString();
                TxPrice.Text = vsDr["Price"].ToString();
                ImageButtonAdd.Visible = (vsDr["ItemKind"].ToString() != "variableSumPercentage") ? true : false;
                ImageButtonCal.Visible = (vsDr["CAmount"].ToString() != "") ? true : false;
                ImageButtonReQ.Visible = (vsDr["RFQ_Code"].ToString() != "") ? true : false;
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}