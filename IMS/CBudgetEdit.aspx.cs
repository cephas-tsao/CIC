using DAL;
using Pechkin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace IMS
{
    public partial class CBudgetEdit : System.Web.UI.Page
    {
        protected string LbLayerNum;
        protected int SortNum;
        protected bool layernum;
        //string SQLString = "PID,LayerNum,UpperWID,SortNum,ItemKind,ItemName,Unit,Notes";
        //string SQLUpdateSort;
        //int y;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
         
            if (!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                ViewState["i"] = 0;
                string SQLlayer = "select max(LayerNum) as LayerNum from Bid_WBSLayer where PID=" + Session["ProjectCode"].ToString();
                if (WebModel.SItemName(database, SQLlayer, "LayerNum") != "")
                {
                    int layer = int.Parse(WebModel.SItemName(database, SQLlayer, "LayerNum"));
                    ViewState["i"] = layer;
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先設定階層及編號');", true);
                }
                LoadContent();
                string SQLLock="Select * from ProjectM0 where PID="+Session["ProjectCode"].ToString();
                string Lock = WebModel.SItemName(database, SQLLock, "CBudgetLock");
                if (Lock=="1")
                {
                    IBtn_Import.Visible = false;
                    IBtn_LayerSet.Visible = false;
                    IBtn_AddNewItem.Visible = false;
                    IBtn_PriceFill.Visible = false;
                    IBtn_Caculate.Visible = false;
                    IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                }
                if (Session["projectCode"] != null)
                {

                    string SQLLayer = "Select max(LayerNum) as layer from CBudget_WBS where PID=" + Session["projectCode"].ToString();
                    string Layer = WebModel.SItemName(database, SQLLayer, "layer");
                    if (Layer != "")
                    {
                        //DDL_LayerSelect.Items.Add("-請選擇-");
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
            if (ViewState["ADD"] != null && (bool)this.ViewState["ADD"] == true)
            {

                //AddLayer();

            }


            if (ViewState["ADDView"] != null && (bool)this.ViewState["ADDView"] == true)
            {
                //PlaceHolder2 = (PlaceHolder)Session["PlaceHolder2"];
                PlaceHolder2.Controls.Clear();
                LoadContent();

            }
            //if (ViewState["layer"] == null)
            //{
            //    AddLayer();
            //}


            //AddLayer();
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
     
        protected void ImageButton214_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("CTotalPriceAdjest.aspx", "A");
        }
        protected void ImageButton178_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("CBudgetLayerSet.aspx", IBtn_LayerSet.ID);
        }
        protected void ImageButton175_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("CBudgetImport.aspx", IBtn_LayerSet.ID);
        }
        protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            bool result=false;
            if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg"))
            {
                string SQLDel = "Delete EBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
                bool result5 = WebModel.SQLAction(database, SQLDel);
                string SQLUpdate = "Update ProjectM0 Set CBudgetLock=1 where PID=" + Session["ProjectCode"].ToString() + "";
                string SQLInsert = "INSERT INTO  EBudget_WBS(CWID,PID,LayerCode,LayerNum,UpperWID,SortNum,PriceID,ItemOrder,ItemName,Unit,ItemKind,order_Num,ENumber,LastENumber) SELECT CWID,PID,LayerCode,LayerNum,UpperWID,SortNum,PriceID,ItemOrder,ItemName,Unit,ItemKind,order_Num,CNumber,CNumber   FROM CBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
                bool result1 = WebModel.SQLAction(database, SQLInsert);
                string SQLUpdateResourceNY = "Update EBudget_WBS SET ResourceNY=  CASE WHEN (ItemKind ='mainitem')  then 0 ELSE 1 END";
                bool result4 = WebModel.SQLAction(database, SQLUpdateResourceNY);
              //將upperwid轉換為現有的專案的upperwid
                bool result2 = CBudgetDisp.update_EWBS_Upperwid(database, Session["ProjectCode"].ToString());
                string SQLUpdatePrice = "Update EBudget_WBS set EBudget_WBS.EUnitPrice=Pro_Resource.CPrice from Pro_Resource join EBudget_WBS on EBudget_WBS.PriceID=Pro_Resource.PriceID where EBudget_WBS.PID=0";
                bool result3 = WebModel.SQLAction(database, SQLUpdatePrice);
                IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                IBtn_Lock.ToolTip = "預算已鎖定(點選解除鎖定)";
                IBtn_Import.Visible = false;
                IBtn_LayerSet.Visible = false;
                IBtn_AddNewItem.Visible = false;
                IBtn_PriceFill.Visible = false;
                IBtn_Caculate.Visible = false;
                IBtn_Reload.Visible = false;
                IBtn_Save.Visible = false;
                result = WebModel.SQLAction(database, SQLUpdate);
                if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('預算鎖定成功');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('預算鎖定失敗');", true);

                }
            }
            //else if (IBtn_Lock.ImageUrl == "~/img/Lock.jpg")
            //{
            //    IBtn_Lock.OnClientClick = "return confirm('已經鎖定無法解鎖!!');";

            //}

            else if ((IBtn_Lock.ImageUrl == "~/img/Lock.jpg"))
            {
                IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
                IBtn_Lock.ToolTip = "預算尚未鎖定(點選鎖定預算)";
                IBtn_Import.Visible = true;
                IBtn_LayerSet.Visible = true;
                IBtn_AddNewItem.Visible = true;
                IBtn_PriceFill.Visible = true;
                IBtn_Caculate.Visible = true;
                IBtn_Reload.Visible = true;
                IBtn_Save.Visible = true;
            }
        }
        protected void LoadContent()
        {
            if (Session["ProjectCode"].ToString() != "")
            {
                string database = Session["DatabaseName"].ToString();
                string SQLStringNum = "Select  MAX(LayerNum) as id  from CBudget_WBS where PID=" + Session["ProjectCode"] + "";
                string SQLString = "Select  *  from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.PID=" + Session["ProjectCode"] + " order by order_Num";
                //DDLDtlLayer.SelectedValue
                decimal TTPRICE = 0;
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

                            string UpperUID = row["UpperWID"].ToString();
                            string order_Num = row["order_Num"].ToString();
                            string UID1 = row["CWID"].ToString();
                            string SortNum = row["SortNum"].ToString();
                            string Find_order_Num = CBLayerCodeSort.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);
                            if (layer == "")
                            {
                                PlaceHolder2.Controls.Add(new LiteralControl(" <tr  class=\"ShtRowSingle\"><td>"));
                                PlaceHolder2.Controls.Add(Texbox);
                                PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                            }
                            else
                            {
                                int sort = count + 1;
                                if (layer == "1")
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " style=\"background-color:white\" class=\"treegrid-" + sort.ToString() + "\">"));

                                }
                                else
                                {
                                    //Find_order_Num = CBLayerCodeSort.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);

                                    PlaceHolder2.Controls.Add(new LiteralControl("<tr id=tr" + count.ToString() + " style=\"background-color:white\" class=\"treegrid-" + sort.ToString() + " treegrid-parent-" + Find_order_Num + "\">"));

                                }
                                //PlaceHolder2.Controls.Add(new LiteralControl("<tr class=\"ShtRowSingle\">"));
                                //PlaceHolder2.Controls.Add(new LiteralControl("<td class=\"ShtCellCC\">"));
                                ImageButton edit = new ImageButton();
                                edit.ID = "Edit" + count.ToString();
                                edit.ImageUrl = "~/img/Edit.png";
                                edit.ToolTip = "逐項編輯";
                                edit.Width = 27;
                                edit.Style.Add("padding-left", "15px");
                                edit.Style.Add("float", "right");
                                edit.Click += edit_Click;

                                ImageButton Delete = new ImageButton();
                                Delete.ID = "Delete" + count.ToString();
                                Delete.ImageUrl = "~/img/Delete.png";
                                Delete.ToolTip = "刪除";
                                Delete.Width = 27;
                                Delete.Style.Add("padding-left", "15px");
                                Delete.Style.Add("float", "right");
                                Delete.Click += delete_Click;
                                Delete.OnClientClick = "return confirm('確定是否刪除?');";
                                //Delete.Attributes.Add("OnClientClick", "javaScript: return confirm('確定是否刪除?');");
                                //Delete.OnClientClick+=
                                if (edit == null)
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("<td ></td>"));
                                }
                                else
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("<td style='padding-left:10px;width:170px'>"));
                                    PlaceHolder2.Controls.Add(edit);
                                    PlaceHolder2.Controls.Add(Delete);
                                    PlaceHolder2.Controls.Add(new LiteralControl("</td>"));
                                }

                                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                                {
                                    PlaceHolder2.Controls.Add(new LiteralControl("<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>"));

                                }
                                int x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;
                                PlaceHolder2.Controls.Add(new LiteralControl("<td  colspan= " + x + ">"));
                                PlaceHolder2.Controls.Add(Texbox);
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
                            //Label NewItem = new Label();
                            //PlaceHolder2.Controls.Add(NewItem);
                            //NewItem.Visible = false;
                            //NewItem.ID = "NewItem" + count.ToString();
                            PlaceHolder2.Controls.Add(UID);
                            Label PriceID = new Label();
                            PriceID.ID = "PriceID" + count.ToString();
                            PriceID.Visible = false;
                            PlaceHolder2.Controls.Add(PriceID);

                            Texbox.ID = "Tx" + count.ToString();
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCL\">"));
                            Label ItemName1 = new Label();
                            //ItemName1.Width = 500;
                            ItemName1.Style.Add("Width", "500px");
                            
                            ItemName1.ID = "Name" + count.ToString();
                            ItemName1.Style.Add("text-align", "left");
                            PlaceHolder2.Controls.Add(ItemName1);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            Label Unit = new Label();
                            Unit.ID = "Unit" + count.ToString();
                            Unit.Width = 55;
                            Unit.Style.Add("text-align", "center");
                            PlaceHolder2.Controls.Add(Unit);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td class=\"ShtCellCC\">"));
                            ImageButton ImgAnalyst = new ImageButton();
                            ImgAnalyst.Click += ImgAnalyst_Click;
                            ImgAnalyst.ID = "ImgAnalyst" + count.ToString();
                            //ImgAnalyst.Visible = (row["Complex"].ToString() == "1") ? true : false;
                            ImgAnalyst.ImageUrl = "~/img/Ana.jpg";

                            PlaceHolder2.Controls.Add(ImgAnalyst);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            TextBox TxNumber = new TextBox();
                            TxNumber.ID = "Num" + count.ToString();
                            TxNumber.Width = 100;
                            TxNumber.Style.Add("text-align", "right");
                            PlaceHolder2.Controls.Add(TxNumber);
                          
                          
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            Label Price = new Label();
                            Price.ID = "Price" + count.ToString();
                            Price.Width = 100;
                            Price.Style.Add("text-align", "right");
                            PlaceHolder2.Controls.Add(Price);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            Label ComplexPrice = new Label();
                            ComplexPrice.ID = "ComplexPrice" + count.ToString();
                            ComplexPrice.Width = 100;
                            ComplexPrice.Style.Add("text-align", "right");
                            PlaceHolder2.Controls.Add(ComplexPrice);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            TextBox Notes = new TextBox();
                            Notes.ID = "Notes" + count.ToString();
                            if (Notes.Text == "")
                            {
                                //Notes.Width = 50;
                                Notes.Style.Add("Width", "30px");
                                //PlaceHolder2.Controls.Add(new LiteralControl("</td><td>"));
                            }
                            else if (row["Notes"].ToString().Length > 100)
                            {
                                //Notes.Width = 80;
                                Notes.Style.Add("Width", "60px");
                                //PlaceHolder2.Controls.Add(new LiteralControl("</td><td width='100px'>"));
                            }
                            PlaceHolder2.Controls.Add(Notes);
                            PlaceHolder2.Controls.Add(new LiteralControl("</td></tr>"));

                            //Button Link = new Button();
                            ////Link.Click += ImgAnalyst_Click;
                            //Link.Click += Link_Click;
                            //Link.ID = "Link" + count.ToString();
                            //Link.Width = 100;
                            //Link.Text = "設定工料連結";
                            //Link.Visible = (row["ItemKind"].ToString() == "workitem") ? true : false;
                            //PlaceHolder2.Controls.Add(Link);
                            //PlaceHolder2.Controls.Add(new LiteralControl("</td></tr>"));

                            ItemName1.Text = row["ItemName"].ToString();
                            Unit.Text = row["Unit"].ToString();
                            TxNumber.Text = row["CNumber"].ToString();
                            Texbox.Text = row["ItemOrder"].ToString();
                            UID.Text = row["CWid"].ToString();
                            Notes.Text = row["Notes"].ToString();
                           
                            PriceID.Text = row["PriceID"].ToString();
                            Price.Text = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "";
                            ImgAnalyst.Visible = row["Complex"].ToString() == "1" ? true : row["Complex"].ToString() == "0" ? false : row["Complex"].ToString() == "" ? false : false;
                            decimal price = Price.Text != "" ? decimal.Parse(Price.Text) : 0;
                            decimal Num = TxNumber.Text != "" ? decimal.Parse(TxNumber.Text) : 0;
                            ComplexPrice.Text = (Num * price).ToString("N0");
                            //原標單數量
                            if (SystemSet.GetRequestSet("RBLRuleValue1") == "0" && SystemSet.GetRequestSet("TxDecmal1") != "")
                            {
                                decimal n1 = (TxNumber.Text != "") ? decimal.Parse(TxNumber.Text) : 0;
                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal1"));

                                TxNumber.Text = (TxNumber.Text != "0") ? Math.Round(n1, x).ToString("N" + x) : "-";

                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "1")
                            {
                                TxNumber.Text = (TxNumber.Text != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(TxNumber.Text))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue1") == "2")
                            {
                                TxNumber.Text = (TxNumber.Text != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(TxNumber.Text))).ToString("N") : "-";

                            }
                            //原標單單價
                            if (SystemSet.GetRequestSet("RBLRuleValue2") == "0")
                            {
                                decimal n1 = (row["CPrice"].ToString() != "") ? decimal.Parse(row["CPrice"].ToString()) : 0;
                                int x = SystemSet.GetRequestSet("TxDecmal2") != "" ? int.Parse(SystemSet.GetRequestSet("TxDecmal2")) : 0;
                                Price.Text = Math.Round(n1, x).ToString("N" + x);

                                // Number.Text = (row["Number"].ToString() != "") ? Convert.ToInt32(Math.Round(decimal.Parse(row["Number"].ToString()), int.Parse(SystemSet.GetRequestSet("TxDecmal1")))).ToString() : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "1")
                            {
                                Price.Text = (row["CPrice"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CPrice"].ToString()))).ToString("N") : "-";

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue2") == "2")
                            {
                                Price.Text = (row["CPrice"].ToString() != "") ? Convert.ToInt32(Math.Floor(decimal.Parse(row["CPrice"].ToString()))).ToString("N") : "-";

                            }
                            //原標單複價
                            if (SystemSet.GetRequestSet("RBLRuleValue3") == "0" && SystemSet.GetRequestSet("TxDecmal3") != "")
                            {

                                int x = int.Parse(SystemSet.GetRequestSet("TxDecmal3"));
                                TxNumber.Text = (TxNumber.Text != "-" && (TxNumber.Text != "")) ? TxNumber.Text : "0";
                                decimal n1 = (decimal.Parse(TxNumber.Text) * decimal.Parse(Price.Text));
                                ComplexPrice.Text = Math.Round(n1, x).ToString("N" + x);                          

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "1")
                            {
                                TxNumber.Text = (TxNumber.Text != "-" && TxNumber.Text != "") ? TxNumber.Text : "0";
                                decimal n1 = (decimal.Parse(TxNumber.Text) * decimal.Parse(Price.Text));
                                ComplexPrice.Text = Math.Ceiling(n1).ToString("N");                          

                            }
                            else if (SystemSet.GetRequestSet("RBLRuleValue3") == "2")
                            {
                                TxNumber.Text = (TxNumber.Text != "-" && TxNumber.Text != "") ? TxNumber.Text : "0";
                                decimal n1 = (decimal.Parse(TxNumber.Text) * decimal.Parse(Price.Text));
                                ComplexPrice.Text = Math.Floor(n1).ToString("N");
                               

                            }
                            TTPRICE += Convert.ToDecimal(ComplexPrice.Text);
                            count++;
                            //LbTTPRICE.Text = TTPRICE.ToString("N0");
                        }
                        LbSum.Text = TTPRICE.ToString("N0");
                        this.ViewState["ADDView"] = true;
                        // DataTableBox.Dispose(); //釋放Table資源


                    }

                }

                //AddLayer();
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先選擇專案');", true);
            }

        }
        private void edit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(4);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Session["uid"] = UUID.Text;

            Response.Write("<script>window.open('CItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
        }
        private void delete_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(6);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            string SQLSelectUpperUID = "Select * from CBudget_WBS where UpperWID=" + UUID.Text;
            string SelectUpperUID = WebModel.SItemName(database, SQLSelectUpperUID, "UpperWID");
            ViewState["uid"] = UUID.Text;
            if (SelectUpperUID != "")
            {
                Page.ClientScript.RegisterStartupScript(typeof(string), "BtnDelayer_Click", "var retValue=confirm('該階層有項目，是否刪除???');" + "if (retValue) {document.getElementById('" + LinkButtonDel.ClientID + "').click();};", true);
            }
            else
            {
                string Select = "Select * from CBudget_WBS where CWID=" + UUID.Text;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperUID = WebModel.SItemName(database, Select, "UpperWID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");
                string SQLUpdateSort = "";
                string DelSQL = "Delete CBudget_WBS where CWID=" + UUID.Text;
                bool result = WebModel.SQLAction(database, DelSQL);
                if (SortNum == "1")
                {
                    SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
                }
                else
                {
                    SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

                }
                
              
                result = WebModel.SQLAction(database, SQLUpdateSort);
                //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
                string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
                string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
                string UpdateItemOrder;
                if (CBudgetNumType == "0")
                {
                    bool result3 = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                    UpdateItemOrder = "update CBudget_WBS set CBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                    bool update = WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                }
                else if (CBudgetNumType == "1")
                {
                    bool result3 = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                    UpdateItemOrder = "update CBudget_WBS set CBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
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
                //DDL_BidSelect.DataBind();
                //DDL_BidSelect.AutoPostBack = true;
                //DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
                //DDL_BidSelect_SelectedIndexChanged(this, null);

            }
            PlaceHolder2.Controls.Clear();
            LoadContent();
        }
        //if there is a upperUID ,delete all
        protected void LinkButtonDel_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            bool result = false;
            string SQLUpdateSort ="";
            int UPPID = int.Parse(ViewState["uid"].ToString());
            string[] uid = checkfun.check_num(database, UPPID);
            foreach (string uuu in uid)//使用foreach迴圈撈出陣列值
            {
                string Select = "Select * from CBudget_WBS where CWID=" + uuu;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperUID = WebModel.SItemName(database, Select, "UpperWID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");

                string DelSQL = "Delete EBudget_WBS where EWID=" + uuu;


                result = WebModel.SQLAction(database, DelSQL);
                if (SortNum == "1")
                {
                    SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
                }
                else
                {
                    SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

                }
                //string SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();
                result = WebModel.SQLAction(database, SQLUpdateSort);
            }
            string DelSQL1 = "Delete CBudget_WBS where CWID=" + ViewState["uid"].ToString();
            result = WebModel.SQLAction(database, DelSQL1);
            //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
            string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
            string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
            string UpdateItemOrder;
            if (CBudgetNumType == "0")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update CBudget_WBS set CBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                bool update = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            }
            else if (CBudgetNumType == "1")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update CBudget_WBS set CBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
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
            //DDL_BidSelect.DataBind();
            //DDL_BidSelect.AutoPostBack = true;
            //DDL_BidSelect.SelectedItem.Value = Session["Bid"].ToString();
            //DDL_BidSelect_SelectedIndexChanged(this, null);
            PlaceHolder2.Controls.Clear();
            LoadContent();
        }
        protected void callback_Click(object sender, EventArgs e)
        {

        

        }     
        private void ImgAnalyst_Click(object sender, ImageClickEventArgs e)
        {

            ImageButton ImgAnalyst = (ImageButton)sender;
            string tempID = ImgAnalyst.ID.Substring(10);
            Label UUID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Label PriceID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("PriceID" + tempID);

            Session["uid"] = PriceID.Text;

            //Response.Write("<script>window.open('AnalysisV_BWBS.aspx?PriceId=" + PriceID.Text + "', 'window', config='height=560,width=1500')</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('AnalysisV_BWBS.aspx?PriceId=" + PriceID.Text + "&CWID=" + UUID.Text + "', 'window','height=570,width=1200');</script>"));
        }
        private void Link_Click(object sender, EventArgs e)
        {
            Button Link = (Button)sender;
            string tempID = Link.ID.Substring(4);
            Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + tempID);
            Label PriceID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("PriceID" + tempID);

            Session["UID"] = UID.Text;
            string linkUrl;
            linkUrl = UID.Text != "" ? "UID=" + UID.Text + "&" : "";
            linkUrl += PriceID.Text != "" ? "PriceID=" + PriceID.Text : "";
            //Response.Write("<script>window.open('BWBS_ResourceLink.aspx?" + linkUrl + "','_blank')</script>");
            Response.Write("<script>window.open('ProResourceLink.aspx?" + linkUrl + "', 'window', config='height=560,width=1500')</script>");

        }
      
        protected void SaveCheck_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string Num = ViewState["rowNum"].ToString();
            string SQLWBS = "CWID,PID,ItemOrder,ItemName,Unit,ImgAnalyst,CNumber,Notes";


            DataTable DataTableBox = new DataTable();
            foreach (string DataName in SQLWBS.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            for (int i = 0; i < int.Parse(Num); i++)
            {
                CheckBox check = (CheckBox)Master.FindControl("ContentPlaceHolder1").FindControl("check" + i.ToString());
                Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                Label item = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                TextBox ItemName = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                TextBox Unit = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                ImageButton ImgAnalyst = (ImageButton)Master.FindControl("ContentPlaceHolder1").FindControl("ImgAnalyst" + i.ToString());
                TextBox Number = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                TextBox Notes = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                if (check.Checked == true)
                {


                    //後台功能，必需要有的欄位名稱               

                    DataRow DataTableDr = DataTableBox.NewRow();

                    #region 內容設定

                    DataTableDr["CWID"] = UID.Text;
                    DataTableDr["PID"] = Session["ProjectCode"].ToString();
                    DataTableDr["ItemOrder"] = item.Text;
                    DataTableDr["ItemName"] = ItemName.Text;
                    DataTableDr["Unit"] = Unit.Text;
                    DataTableDr["ImgAnalyst"] = (ImgAnalyst.Visible == true) ? 1 : 2;
                    DataTableDr["CNumber"] = (Number.Text != "") ? Number.Text : "";
                    DataTableDr["Notes"] = Notes.Text;

                    DataTableBox.Rows.Add(DataTableDr);


                    #endregion


                    //string update = (item.Text != "") ? ",[ItemOrder]='" + item.Text + "' " : "";
                    string update = (ItemName.Text != "") ? ",[ItemName]='" + ItemName.Text + "' " : "";
                    update += (Number.Text != "") ? ",[CNumber]=" + Number.Text + " " : "";
                    update += (Notes.Text != "") ? ",[Notes]=" + Notes.Text + " " : ",[Notes]=''";
                    string SQLUpdate = "Update CBudget_WBS SET [pid]=" + Session["ProjectCode"].ToString() + update + "  WHERE [CWID] =" + UID.Text + "";
                    WebModel.SQLAction(database, SQLUpdate);

                }
            }
            PlaceHolder2.Controls.Clear();
            LoadContent();
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('選取工項已存檔');", true);
        }

        protected void DelCheck_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string Num = ViewState["rowNum"].ToString();
            string SQLWBS = "CWID,PID,ItemOrder,ItemName,Unit,ImgAnalyst";
            DataTable DataTableBox = new DataTable();
            foreach (string DataName in SQLWBS.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            for (int i = 0; i < int.Parse(Num); i++)
            {
                CheckBox check = (CheckBox)Master.FindControl("ContentPlaceHolder1").FindControl("check" + i.ToString());
                Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());


                if (check.Checked == true)
                {


                    //後台功能，必需要有的欄位名稱               

                    DataRow DataTableDr = DataTableBox.NewRow();

                    #region 內容設定

                    DataTableDr["CWID"] = UID.Text;
                    DataTableDr["PID"] = Session["ProjectCode"].ToString();


                    DataTableBox.Rows.Add(DataTableDr);


                    #endregion


                    string SQLUpdate = "Delete CBudget_WBS WHERE [CWID] =" + UID.Text + "";
                    WebModel.SQLAction(database, SQLUpdate);


                }
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            PlaceHolder2.Controls.Clear();
            LoadContent();
            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('選取工項已刪除');", true);
        }

        protected void WBSClear_Click(object sender, EventArgs e)
        {
            PlaceHolder2.Controls.Clear();
        }

        protected void Can_check_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string Num = ViewState["rowNum"].ToString();
            string SQLWBS = "CWID,PID,ItemOrder,ItemName,Unit,ImgAnalyst";
            DataTable DataTableBox = new DataTable();
            foreach (string DataName in SQLWBS.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            for (int i = 0; i < int.Parse(Num); i++)
            {
                CheckBox check = (CheckBox)Master.FindControl("ContentPlaceHolder1").FindControl("check" + i.ToString());
                Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());


                if (check.Checked == true)
                {


                    check.Checked = false;

                }
            }
            PlaceHolder2.Controls.Clear();
            LoadContent();

        }

        protected void ResourceList_Click(object sender, EventArgs e)
        {
            // OpenNewWindow("CResourceList.aspx", "A");
            Response.Redirect("CResourceList.aspx");
        }

        protected void IBtn_Save_Click(object sender, ImageClickEventArgs e)
        {

            if (Session["ProjectCode"] !=null)
            {
            string database = Session["DatabaseName"].ToString();
            string SQLselect = "Select count(CWID) as CWID from CBudget_WBS where pid=" + Session["ProjectCode"].ToString();
            string num = WebModel.SItemName(database, SQLselect, "CWID");
            for (int i = 0; i < int.Parse(num); i++)
            {
                Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                //Label item = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                Label ItemName = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                //TextBox Unit = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
              
                TextBox Number = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                TextBox Notes = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                bool quantity = SystemSet.IsNumber(Number.Text);
                //if (Number.Text != "")
                //{
                string update = (Number.Text != "") && quantity==true ? ",[CNumber]=" + Number.Text + " " : "";
                update += (Notes.Text != "") ? ",[Notes]='" + Notes.Text + "' " : ",[Notes]=''";
                string SQLUpdate = "Update CBudget_WBS SET [pid]=" + Session["ProjectCode"].ToString() + update + "  WHERE [CWID] =" + UID.Text + "";
                bool result = WebModel.SQLAction(database, SQLUpdate);
                if (! quantity && Number.Text != "")
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請輸入數字');", true);
                    }
                 
                //}

            }

            }
        }

        protected void IBtn_Reload_Click(object sender, ImageClickEventArgs e)
        {
            PlaceHolder2.Controls.Clear();
            LoadContent();
        }

        protected void ImgExcel_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案');</script>");


            }
            else
            {
                string SQLBidName = "Select * from ProjectM0 where pid=" + Session["ProjectCode"].ToString();
                string ProjectName = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLBidName, "ProjectName");
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
                              
                                <td class=""ShtCellCC"" colspan=""3"">合約預算</td>                               
                                <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                            </tr>
                            <tr class=""ShtRowTop"">
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>                              
                            </tr>";
                if (Session["ProjectCode"].ToString() != "")
                {
                    string database = Session["DatabaseName"].ToString();
                    string SlectNUmn = "Select count (*) as num from CBudget_WBS where pid=" + Session["ProjectCode"].ToString();
                    string TotalNum = WebModel.SItemName(database, SlectNUmn, "num");

                    for (int i = 0; i < int.Parse(TotalNum); i++)
                    {
                        Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                        Label Texbox = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                        Label Name = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                        Label Unit = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                        TextBox Num = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                        Label Price = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Price" + i.ToString());
                        Label ComplexPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("ComplexPrice" + i.ToString());

                        TextBox Notes = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                        l_str2 += @"<tr border=""1""><td class=""ShtCellCC"">" + Texbox.Text + "</td><td>" + Name.Text + "</td><td>" + Unit.Text + "</td><td>" + Num.Text + "</td><td>" + Price.Text + "</td><td>" + ComplexPrice.Text + "</td><td>" + Notes.Text + "</td></tr>";

                    }
                }
                l_str2 += @"</table>";
                Response.Write(l_str2);
                Response.End();

            }
        }

        protected void ImgPDF_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案');</script>");


            }
            else
            {
                string SQLBidName = "Select * from ProjectM0 where pid=" + Session["ProjectCode"].ToString();
                string ProjectName = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLBidName, "ProjectName");
                string l_str2 = "";
                l_str2 += @"<table id=""BidBudget"" class=""Sht100"" border=""1"" >
                            <tr class=""ShtRowTop"">                           
                                <td class=""ShtCellCC"" colspan=""<%=LbLayerNum %>"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                              
                                <td class=""ShtCellCC"" colspan=""3"">合約預算</td>                               
                                <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                            </tr>
                            <tr class=""ShtRowTop"">
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>                              
                            </tr>";
                if (Session["ProjectCode"].ToString() != "")
                {
                    string database = Session["DatabaseName"].ToString();
                    string SlectNUmn = "Select count (*) as num from CBudget_WBS where pid=" + Session["ProjectCode"].ToString();
                    string TotalNum = WebModel.SItemName(database, SlectNUmn, "num");

                    for (int i = 0; i < int.Parse(TotalNum); i++)
                    {
                        Label UID = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("UID" + i.ToString());
                        Label Texbox = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Tx" + i.ToString());
                        Label Name = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Name" + i.ToString());
                        Label Unit = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Unit" + i.ToString());
                        TextBox Num = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Num" + i.ToString());
                        Label Price = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("Price" + i.ToString());
                        Label ComplexPrice = (Label)Master.FindControl("ContentPlaceHolder1").FindControl("ComplexPrice" + i.ToString());

                        TextBox Notes = (TextBox)Master.FindControl("ContentPlaceHolder1").FindControl("Notes" + i.ToString());

                        l_str2 += @"<tr border=""1""><td class=""ShtCellCC"">" + Texbox.Text + "</td><td>" + Name.Text + "</td><td>" + Unit.Text + "</td><td>" + Num.Text + "</td><td>" + Price.Text + "</td><td>" + ComplexPrice.Text + "</td><td>" + Notes.Text + "</td></tr>";

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
        protected void DDL_LayerSelect_SelectedIndexChanged(object sender, EventArgs e)
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Select(" + DDL_LayerSelect.SelectedValue + ");", true);//ajax 新增階層碼


        }
        protected void ImgCal_Click(object sender, ImageClickEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('CTuneDecimal.aspx', 'window','height=450,width=1500');</script>"));
        }
    }
}