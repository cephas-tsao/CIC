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
    public partial class BidBudgetOutput : System.Web.UI.Page
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
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            LoadContentView();
            if (SystemSet.GetRequestSet("Bid") != "")
            {
                Session["Bid"] = SystemSet.GetRequestSet("Bid");
                DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
                //PlaceHolder1.Controls.Clear();
                DDL_BidSelect_SelectedIndexChanged(this,null);
            }
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
        }

        protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        PlaceHolder1.Controls.Clear();
        Session["BID"] = DDL_BidSelect.SelectedItem.Value;
        DDL_BidSelect.SelectedValue = DDL_BidSelect.SelectedItem.Value;
        if (SystemSet.GetRequestSet("Bid")!= "")
            {
                DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
            }
        Pnl_ALL.Visible = true;
        //ViewState["i"] = 0;
        //ViewState["ADDView"] = null;
        LoadContentView();
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
            string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.BID='" + Session["BID"].ToString() + "' order by LayerCode";
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
                 
                    foreach (DataRow row in DataTableBox1.Rows)
                    {


                        Label Texbox = new Label();
                        //Texbox.Width = 50;
                        string layer = row["LayerNum"].ToString();
                        if (layer == "")
                        {
                            PlaceHolder1.Controls.Add(new LiteralControl(" <tr id=" + count.ToString() + " class=\"TableSingle\"><td class=\"autoCenter\">"));
                            PlaceHolder1.Controls.Add(Texbox);
                            PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                        }
                        else
                        {
                            PlaceHolder1.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " class=\"TableSingle\">"));

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

                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td class=\"autoLeft\">"));
                        Label ItemName1 = new Label();
                        ItemName1.Width = 350;
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
                        Label Number = new Label();
                        Number.ID = "Num" + count.ToString();
                        PlaceHolder1.Controls.Add(Number);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label UnitPrice = new Label();
                        UnitPrice.ID = "UnitPrice" + count.ToString();
                        PlaceHolder1.Controls.Add(UnitPrice);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label Complexprice = new Label();
                        Complexprice.ID = "Complexprice" + count.ToString();
                        PlaceHolder1.Controls.Add(Complexprice);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label CNumber = new Label();
                        CNumber.ID = "CNumber" + count.ToString();
                        PlaceHolder1.Controls.Add(CNumber);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label CPrice = new Label();
                        CPrice.ID = "CPrice" + count.ToString();
                        PlaceHolder1.Controls.Add(CPrice);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label BNumber = new Label();
                        BNumber.ID = "BNumber" + count.ToString();
                        PlaceHolder1.Controls.Add(BNumber);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
                        Label BUnitPrice = new Label();
                        BUnitPrice.ID = "BUnitPrice" + count.ToString();
                        PlaceHolder1.Controls.Add(BUnitPrice);
                        PlaceHolder1.Controls.Add(new LiteralControl("</td><td>"));
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
                        UnitPrice.Text = (row["UnitPrice"].ToString().Trim() != "") ? row["UnitPrice"].ToString().Trim() : "-";
                        //原標單數量
                        if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") !="" )
                        {
                            decimal n1 = (row["Number"].ToString() !="" )?decimal.Parse(row["Number"].ToString()) :0;
                            int x =int.Parse(SystemSet.GetRequestSet("TxDecmal1"));
                           
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
                            CNumber.Text = (CNumber.Text != "0") ? Math.Round(n1, x).ToString("N"+ x) : "-";

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
                        if (SystemSet.GetRequestSet("RBLRuleValue2") == "0" && SystemSet.GetRequestSet("TxDecmal2") != "")
                        {
                            decimal n1 = (row["UnitPrice"].ToString() != "") ? decimal.Parse(row["UnitPrice"].ToString()) : 0;
                            int x = int.Parse(SystemSet.GetRequestSet("TxDecmal2"));
                            UnitPrice.Text = Math.Round(n1, x).ToString("N" + x);

                            // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue2") == "1")
                        {
                            UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue2") == "2")
                        {
                            UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["UnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        else
                        {
                            UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        //UnitPrice.Text = (row["UnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["UnitPrice"].ToString()))).ToString("#,#") : "-";
                        Texbox.Text = row["ItemOrder"].ToString();
                        UID.Text = row["uid"].ToString();
                        //Number.Text = (Number.Text != "-" && Number.Text != "") ? Number.Text : "0";
                        //UnitPrice.Text = (UnitPrice.Text != "-" && UnitPrice.Text !="") ? UnitPrice.Text : "0";
                        decimal Complexprice1 = (decimal.Parse((Number.Text != "-" && Number.Text != "") ? Number.Text : "0") * decimal.Parse((UnitPrice.Text != "-" && UnitPrice.Text !="") ? UnitPrice.Text : "0"));
                       
                       
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
                        decimal CPrice1 = (decimal.Parse((CNumber.Text != "-" && CNumber.Text !="") ? CNumber.Text : "0")) * (decimal.Parse((UnitPrice.Text != "-" && UnitPrice.Text !="" ) ? UnitPrice.Text : "0"));
                        //CPrice.Text = Convert.ToInt32(Math.Ceiling(decimal.Parse(CNumber.Text ) * (decimal.Parse((UnitPrice.Text != "-") ? UnitPrice.Text : "0")))).ToString("#,#");
                       
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
                        
                   

                        //投標預算數量
                        if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") != "")
                        {
                            decimal n1 = (row["BNumber"].ToString() != "") ? decimal.Parse(row["BNumber"].ToString()) : 0;
                            int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));
                            BNumber.Text = Math.Round(n1, x).ToString("N" + x);

                            // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue1") == "1")
                        {
                            BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BNumber"].ToString()))).ToString("N") : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue1") == "2")
                        {
                            BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["BNumber"].ToString()))).ToString("N") : "-";

                        }
                        else
                        {
                            BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BNumber"].ToString()))).ToString("N") : "-";

                        }
                        //BNumber.Text = (row["BNumber"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BNumber"].ToString()))).ToString("#,#") : "-";

                        //投標預算單價
                        if (SystemSet.GetRequestSet("RBLRuleValue2") == "0" && SystemSet.GetRequestSet("TxDecmal2") != "")
                        {
                            decimal n1 = (row["BUnitPrice"].ToString() != "") ? decimal.Parse(row["BUnitPrice"].ToString()) : 0;
                            int x = int.Parse(SystemSet.GetRequestSet("TxDecmal2"));
                            BUnitPrice.Text = Math.Round(n1, x).ToString("N" + x);

                            // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue2") == "1")
                        {
                            BUnitPrice.Text = (row["BUnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BUnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        else if (SystemSet.GetRequestSet("RBLRuleValue2") == "2")
                        {
                            BUnitPrice.Text = (row["BUnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["BUnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        else
                        {
                            BUnitPrice.Text = (row["BUnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BUnitPrice"].ToString()))).ToString("N") : "-";

                        }
                        //BUnitPrice.Text = (row["BUnitPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["BUnitPrice"].ToString()))).ToString("#,#") : "-";
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
                     
                        Notes.Text = row["Notes"].ToString();
                        NewItem.Text = row["NewItem"].ToString();

                        if (NewItem.Text == "1")
                        {
                            javauid = "tr" + count;
                            ShowString += javauid + ",";


                            Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "<script language=JavaScript>hide_tr();</script>");
                        }

                        x1 += Complexprice1;
                        x2 += CPrice1;
                        x3 += BCPrice1;

                        count++;
                     

                    this.ViewState["ADDView"] = true;
                    if (SystemSet.GetRequestSet("RBLRuleValue4") == "0" && SystemSet.GetRequestSet("TxDecmal4") != "")
                    {
                        //decimal n1 = decimal.Parse(Number.Text);
                        int x = int.Parse(SystemSet.GetRequestSet("TxDecmal4"));
                        OTotal.Text = Math.Round(x1, x).ToString("N" + x);
                        CTotal.Text = Math.Round(x2, x).ToString("N" + x);
                        BTotal.Text = Math.Round(x3, x).ToString("N" + x);                       
                       
                    }
                    else if (SystemSet.GetRequestSet("RBLRuleValue4") == "1")
                    {
                        //int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                        OTotal.Text = Convert.ToInt32(Math.Ceiling(x1)).ToString("N");
                        CTotal.Text = Convert.ToInt32(Math.Ceiling(x2)).ToString("N");
                        BTotal.Text = Convert.ToInt32(Math.Ceiling(x3)).ToString("N"); 
                      
                     }
                    else if (SystemSet.GetRequestSet("RBLRuleValue4") == "2")
                    {
                        OTotal.Text = Convert.ToInt32(Math.Floor(x1)).ToString("N");
                        CTotal.Text = Convert.ToInt32(Math.Floor(x2)).ToString("N");
                        BTotal.Text = Convert.ToInt32(Math.Floor(x3)).ToString("N"); 
                      
                    }
                    else
                    {
                        OTotal.Text = Convert.ToInt32(Math.Ceiling(x1)).ToString("N");
                        CTotal.Text = Convert.ToInt32(Math.Ceiling(x2)).ToString("N");
                        BTotal.Text = Convert.ToInt32(Math.Ceiling(x3)).ToString("N"); 
                      
                    }
                 
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
                    //}
                   

                    }
                    Session["PlaceHolder"] = Tablebox;
                    // DataTableBox.Dispose(); //釋放Table資源
                }

            }


        }

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

        Response.Write("<script>window.open('AnalysisV.aspx?UId=" + UUID.Text + "','_blank')</script>");

    }
    public void OpenNewWindow1(string url, string Tgr,string height, string width)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    public void OpenNewWindow2(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        //OpenNewWindow2("AnalysisV.aspx", ImageButton7.ID);
    }
    protected void Button19_Click(object sender, EventArgs e)
    {
        if ((Display.Text == "顯示缺漏項"))
        {
            Page.RegisterStartupScript("Show", "<script language=JavaScript>show_tr();</script>");
            Display.Text = "隱藏缺漏項";
        }
        else if ((Display.Text == "隱藏缺漏項"))
        {
            Page.RegisterStartupScript("Hide", "<script language=JavaScript>hide_tr();</script>");
            Display.Text = "顯示缺漏項";
        }
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        OpenNewWindow1("BidSum.aspx", "A","400","1200");
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        OpenNewWindow1("BidOutputSetting.aspx", "A", "600", "1200");
    }
        }
    }
