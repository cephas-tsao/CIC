using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class BidBudgetQEdit : System.Web.UI.Page
    {

        protected string LbLayerNum;
        protected string javauid;
        protected string ShowString;
        //protected string SQLString;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
            LoadContent();
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            //OpenNewWindow("AnalysisQEdit.aspx", ImageButton7.ID);
        }
        protected void Button18_Click(object sender, EventArgs e)
        {
            Session["AddNew"] = "1";
            OpenNewWindow("AddNewItem.aspx", "1");
        }
        protected void DDL_BidSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            PlaceHolder2.Controls.Clear();
            Session["BID"] = DDL_BidSelect.SelectedValue;
            Pnl_ALL.Visible = true;           
            ViewState["i"] = 0;
            ViewState["ADDView"] = null;
            LoadContent();
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
            //if (Session["BID"] != null)
            //{

            //    string Num = ViewState["rowNum"].ToString();
            //    if ((Display.Text == "顯示缺漏項"))
            //    {
            //        for (int i = 0; i < int.Parse(Num); i++)
            //        {
            //            Label NewItem = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("NewItem" + i.ToString());
            //            Label uid = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("uid" + i.ToString());

            //            if (NewItem.Text == "1")
            //            {

            //                javauid = "tr" + i;
            //                SQLString += javauid + ",";
            //                //trid.Add(javauid);

            //                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Show", "<script language=JavaScript> var result_style = document.getElementById('"+ javauid + "').style;result_style.display = 'table-row';document.getElementById(''"+ javauid + "').className = 'TableNew';</script>");
            //                Page.ClientScript.RegisterStartupScript(this.GetType(), "Show", "<script language=JavaScript>show_tr();</script>");
            //                Display.Text = "隱藏缺漏項";
            //            }
            //        }
            //    }
            //    else if ((Display.Text == "隱藏缺漏項"))
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "Hide", "<script language=JavaScript>hide_tr();</script>");
            //        Display.Text = "顯示缺漏項";
            //    }
            //}
        }
        protected void LoadContent()
        {
            if (Session["BID"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLStringNum = "Select  MAX(LayerNum) as id  from Bid_WBS where BID='" + Session["BID"].ToString() + "'";
                string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.BID='" + Session["BID"].ToString() + "' order by LayerCode";
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


                        foreach (DataRow row in DataTableBox1.Rows)
                        {


                            Label Texbox = new Label();
                            //Texbox.Width = 50;
                            string layer = row["LayerNum"].ToString();
                            if (layer == "")
                            {
                                PlaceHolder2.Controls.Add(new LiteralControl(" <tr id=" + count.ToString() + " class=\"TableSingle\"><td class=\"autoCenter\">"));
                                PlaceHolder2.Controls.Add(Texbox);
                                PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                            }
                            else
                            {
                                PlaceHolder2.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " class=\"TableSingle\">"));
                               
                                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>"));

                                }
                                //int x = int.Parse(LbLayerNum) - int.Parse(layer);
                                int x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;
                                PlaceHolder2.Controls.Add(new LiteralControl("<td colspan= " + x + ">"));
                                PlaceHolder2.Controls.Add(Texbox);
                                //if (x == 0)
                                //{
                                //    PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                                //}
                                //else
                                //{
                                //    PlaceHolder2.Controls.Add(new LiteralControl("</td><td colspan= " + x + " >"));
                                //}
                                if (x == 0)
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                                }
                                else
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                                }
                            }

                            Label UID = new Label();
                            UID.ID = "UID" + count.ToString();
                            UID.Visible = false;
                            Label NewItem = new Label();
                            PlaceHolder2.Controls.Add(NewItem);
                            NewItem.Visible = false;
                            NewItem.ID = "NewItem" + count.ToString();
                            PlaceHolder2.Controls.Add(UID);
                            Texbox.ID = "Tx" + count.ToString();

                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td class=\"autoLeft\">"));
                            Label ItemName1 = new Label();
                            ItemName1.Width = 350;
                            ItemName1.ID = "Name" + count.ToString();
                            PlaceHolder2.Controls.Add(ItemName1);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            Label Unit = new Label();
                            Unit.ID = "Unit" + count.ToString();
                            PlaceHolder2.Controls.Add(Unit);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td class=\"auto-style43\">"));
                            ImageButton ImgAnalyst = new ImageButton();
                            ImgAnalyst.Click += ImgAnalyst_Click;
                            ImgAnalyst.ID = "ImgAnalyst" + count.ToString();
                            ImgAnalyst.Visible = (row["Complex"].ToString() == "1") ? true : false;
                            ImgAnalyst.ImageUrl = "~/img/Ana.jpg";
                           
                            PlaceHolder2.Controls.Add(ImgAnalyst);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            Label TxNumber1 = new Label();
                            TxNumber1.ID = "Num" + count.ToString();
                            PlaceHolder2.Controls.Add(TxNumber1);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            TextBox CNumber = new TextBox();
                            CNumber.ID = "CNumber" + count.ToString();
                            PlaceHolder2.Controls.Add(CNumber);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            TextBox Notes = new TextBox();
                            Notes.ID = "Notes" + count.ToString();
                            PlaceHolder2.Controls.Add(Notes);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td></tr>"));


                            ItemName1.Text = row["ItemName"].ToString();
                            Unit.Text = row["Unit"].ToString();
                            CNumber.Text = row["CNumber"].ToString();
                            TxNumber1.Text = row["Number"].ToString();
                            Texbox.Text = row["ItemOrder"].ToString();
                            UID.Text = row["uid"].ToString();
                            Notes.Text = row["Notes"].ToString();
                            NewItem.Text = row["NewItem"].ToString();

                            if (NewItem.Text == "1")
                            {
                                javauid = "tr" + count;
                                ShowString += javauid + ",";


                                Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "<script language=JavaScript>hide_tr();</script>");
                            }
                            count++;
                        }

                        this.ViewState["ADDView"] = true;
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

            Response.Write("<script>window.open('AnalysisQEdit.aspx?UId=" + UUID.Text + "','_blank')</script>");

        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            string Num = ViewState["rowNum"].ToString();
            string SQLWBS = "UID,BID,ItemOrder,ItemName,Unit,ImgAnalyst,Number,CNumber,Notes";
            DataTable DataTableBox = new DataTable();
            foreach (string DataName in SQLWBS.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }



            for (int i = 0; i < int.Parse(Num); i++)
            {
                Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                Label item = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                Label ItemName = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                Label Unit = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                ImageButton ImgAnalyst = (ImageButton)Master.FindControl("ContentPlaceHolder1").FindControl("ImgAnalyst" + i.ToString());
                Label Number = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                TextBox CNumber = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("CNumber" + i.ToString());
                TextBox Notes = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                //後台功能，必需要有的欄位名稱               

                DataRow DataTableDr = DataTableBox.NewRow();

                #region 內容設定
                if (Session["bid"] != null)
                {
                    DataTableDr["UID"] = UID.Text;
                    DataTableDr["BID"] = Session["BID"].ToString();
                    DataTableDr["ItemOrder"] = item.Text;
                    DataTableDr["ItemName"] = ItemName.Text;
                    DataTableDr["Unit"] = Unit.Text;
                    DataTableDr["ImgAnalyst"] = (ImgAnalyst.Visible == true) ? 1 : 2;
                    DataTableDr["Number"] = (Number.Text != "") ? Number.Text : "";
                    DataTableDr["CNumber"] = CNumber.Text;
                    DataTableDr["Notes"] = Notes.Text;

                    DataTableBox.Rows.Add(DataTableDr);


                #endregion
                    string update = (CNumber.Text != "") ? ",[CNumber]='" + CNumber.Text + "' " : "";                
                    update += (Notes.Text != "") ? ",[Notes]=" + Notes.Text + " " : "";
                    string SQLUpdate = "Update Bid_WBS SET [Bid]=" + Session["BID"].ToString() + update + "  WHERE [UID] =" + UID.Text + "";
                    WebModel.SQLAction(database, SQLUpdate);
                }
            }
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('全部工項已存檔');", true);
            PlaceHolder2.Controls.Clear();
            LoadContent();
        }

        protected void Recovery_Click(object sender, EventArgs e)
        {
            PlaceHolder2.Controls.Clear();
            LoadContent();
        }
    }
}