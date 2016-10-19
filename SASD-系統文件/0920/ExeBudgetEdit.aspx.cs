using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DAL;
using System.Text;
using System.Xml;
using Pechkin;
using System.Data.SqlClient;


namespace IMS
{
    public partial class ExeBudgetEdit : System.Web.UI.Page
    {
        protected string LbLayerNum;
        decimal CToatal = 0;
        decimal ETotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null ||Session["ProjectCode"] =="")
            {
               // Response.Redirect("Main.aspx");
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);
               
            }
            else
            {
               
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "SELECT a.*,b.*,C.PriceID,c.PID,C.ItemName as RiName,C.Unit as RiUnit,C.Complex,C.AnaNumber,C.CPrice,C.EPrice,C.Notes FROM EBudget_WBS a left join CBudget_WBS b on a.CWID=b.CWID left join Pro_Resource c on b.PriceID=c.PriceID WHERE a.PID =" + Session["ProjectCode"].ToString() + " and a.EEdition=0 Order By a.order_Num";//And ExecuteNY=1
                //Repeater1.DataSourceID = "SqlDataSource1";
                //Repeater1.DataBind();
            }
            //IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
            //IBtn_Lock.ToolTip = "尚未鎖定，點選即可鎖定";
            if (!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                int BLock = WebModel.BudgetLock(database, "ProjectM0", Session["ProjectCode"].ToString(), "EBudgetLock");
                if (BLock == 1)
                {
                    IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                    IBtn_Lock.ToolTip = "執行預算已鎖定";
                    //IBtn_Lock.Enabled = false;
                    ImgBtnAdd.Visible = false;
                    IBtn_PriceFill.Visible = false;
                    //IBtn_Reload.Visible = false;
                    ImgSave.Visible = false;                  

                }
                string SQLCheck="Select LayerCode from EBudget_WBS where PID="+Session["ProjectCode"].ToString();
                DataTable check=WebModel.LoadSetContentData(database,SQLCheck);
                foreach (DataRow row in check.Rows)
                    {
                        object value = row["LayerCode"];
                        if (value == DBNull.Value)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                            bool result = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                        }                    
                       
                }
             

            }
           

            if (ViewState["LbLayerNum"] != null)
            {
                LbLayerNum = ViewState["LbLayerNum"].ToString();
            }
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            //OpenNewWindow("BudgetAnalysisV.aspx", ImageButton7.ID);
        }
        int j = 0;
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            int maxlayer = WebModel.MaxValue(database, "EBudget_WBS", "LayerNum");
            LbLayerNum = maxlayer.ToString();
            ViewState["LbLayerNum"] = LbLayerNum;
            decimal Total = 0;
            decimal Sum = 0;
            decimal CSum = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

              
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label Lbwid = (Label)e.Item.FindControl("Lbwid");
                Label LbPriceID = (Label)e.Item.FindControl("LbPriceID");
                Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");              
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbCNumber = (Label)e.Item.FindControl("LbCNumber");
                Label LbCPrice = (Label)e.Item.FindControl("LbCPrice");
                Label LbCComplex = (Label)e.Item.FindControl("LbCComplex");
                TextBox LbENumber = (TextBox)e.Item.FindControl("LbENumber");
                Label LbEPrice = (Label)e.Item.FindControl("LbEPrice");
                Label LbEComplex = (Label)e.Item.FindControl("LbEComplex");
                TextBox LbNotes = (TextBox)e.Item.FindControl("LbNotes");
                Literal Literal1 = (Literal)e.Item.FindControl("Literal1");
                Label LbItemKind = (Label)e.Item.FindControl("LbItemKind");
                Label LbLayerCode = (Label)e.Item.FindControl("LbLayerCode");
                Label LbRiName = (Label)e.Item.FindControl("LbRiName");
                Label LbRiUnit = (Label)e.Item.FindControl("LbRiUnit");
                Label LbAnaNumber = (Label)e.Item.FindControl("LbAnaNumber");
                Label LbExecuteKind = (Label)e.Item.FindControl("LbExecuteKind");

                //ImageButton ImageButtonAna = (ImageButton)e.Item.FindControl("ImageButtonAna");
                ImageButton ImgBtnRlon = (ImageButton)e.Item.FindControl("ImgBtnRlon");
                ImageButton ImgBtnNumBD = (ImageButton)e.Item.FindControl("ImgBtnNumBD");
                //ImageButton ImgBtnDel = (ImageButton)e.Item.FindControl("ImgBtnDel");
                CheckBox check = (CheckBox)e.Item.FindControl("check");
          
                check.AutoPostBack = true;
                
                Lbwid.Text = vsDr["EWID"].ToString();
                check.ID = "checkbox_" + Lbwid.Text;
                LbPriceID.Text = vsDr["PriceID"].ToString();
                string Order= vsDr["ItemOrder"].ToString(); 
                //LbItemOrder.Text = vsDr["ItemOrder"].ToString();                           
                LbItemName.Text = vsDr["ItemName"].ToString();               
                LbUnit.Text = vsDr["Unit"].ToString();
                LbCNumber.Text = vsDr["CNumber"].ToString()!=""?vsDr["CNumber"].ToString():"0";
                LbCPrice.Text = vsDr["CPrice"].ToString()!=""?vsDr["CPrice"].ToString():"0";
                LbCComplex.Text = (decimal.Parse(LbCNumber.Text) * decimal.Parse(LbCPrice.Text)).ToString("N0");
                LbCNumber.Style.Add("float", "right");
                LbCPrice.Style.Add("float", "right");
                LbCComplex.Style.Add("float", "right");
                LbENumber.Style.Add("text-align", "right");
                LbEPrice.Style.Add("float", "right");
                LbEComplex.Style.Add("float", "right");
              
                string ItemKind = vsDr["ItemKind"].ToString();
                int[] uid = checkfun.Sort_LayerCode(database, Session["ProjectCode"].ToString(), int.Parse(Lbwid.Text));
                          
                if (vsDr["ExecuteKind"].ToString() == "NP")
                {
                    
                    foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                    {

                        string SQLSelect = "Select * from EBudget_WBS where EWID=" + uuu;
                        string ENum = WebModel.SItemName(database, SQLSelect, "ENumber") !=""?WebModel.SItemName(database, SQLSelect, "ENumber"):"0";
                        Total += decimal.Parse(ENum);

                    }
                    LbENumber.Text = Total.ToString();
                }
                else
                {
                    LbENumber.Text = (vsDr["ENumber"].ToString() != "") ? (vsDr["ENumber"].ToString()) : "0";
                }
                if (ItemKind == "mainitem")
                {
                    LbCNumber.Text = "1";
                    LbENumber.Text = "1";
                    LbENumber.Enabled = false;
                }

                foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                {

                    string SQLSelect = "Select * from EBudget_WBS where EWID=" + uuu;
                    string ENum = WebModel.SItemName(database, SQLSelect, "ENumber") != "" ? WebModel.SItemName(database, SQLSelect, "ENumber") : "0";
                    string EUnitPrice = WebModel.SItemName(database, SQLSelect, "EUnitPrice") != "" ? WebModel.SItemName(database, SQLSelect, "EUnitPrice") : "0";
                    Sum += decimal.Parse(ENum)*decimal.Parse(EUnitPrice);
                    LbEComplex.Text = Sum.ToString("N0");
                }
                string SQLCWID = "SELECT a.*,b.*,C.PriceID,c.PID,C.ItemName as RiName,C.Unit as RiUnit,C.Complex,C.AnaNumber,C.CPrice,C.EPrice,C.Notes FROM EBudget_WBS a left join CBudget_WBS b on a.CWID=b.CWID left join Pro_Resource c on b.PriceID=c.PriceID WHERE a.PID =" + Session["ProjectCode"].ToString() + " and a.EEdition=0 and a.EWID=" + Lbwid.Text + " Order By a.order_Num";

                string CWID = WebModel.SItemName(database, SQLCWID, "CWID");
                if (CWID != "")
                {
                    int[] cuid = checkfun.Sort_CBudget(database, Session["ProjectCode"].ToString(), int.Parse(CWID));
                    foreach (int uuu in cuid)//使用foreach迴圈撈出陣列值
                    {

                        string SQLSelect = "Select * from CBudget_WBS where CWID=" + uuu;
                        string CNum = WebModel.SItemName(database, SQLSelect, "CNumber") != "" ? WebModel.SItemName(database, SQLSelect, "CNumber") : "0";
                        string PriceID = WebModel.SItemName(database, SQLSelect, "PriceID") != "" ? WebModel.SItemName(database, SQLSelect, "PriceID") : "0";
                        string SQLSelect1 = "Select * from Pro_Resource where PriceID=" + PriceID;
                        string CPrice = WebModel.SItemName(database, SQLSelect1, "CPrice") != "" ? WebModel.SItemName(database, SQLSelect1, "CPrice") : "0";
                        CSum += decimal.Parse(CNum) * decimal.Parse(CPrice);
                        LbCComplex.Text = CSum.ToString("N0");
                    }
                }
                //LbENumber.Enabled = vsDr["ExecuteKind"].ToString() == "NP" ? false :vsDr["ExecuteKind"].ToString() == "RK" ? false: true;
                LbEPrice.Text = vsDr["EUnitPrice"].ToString() != "" ? vsDr["EUnitPrice"].ToString() : "0";
                //LbEComplex.Text = (decimal.Parse(LbENumber.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");
                LbNotes.Text = vsDr["Notes"].ToString();
                if (LbNotes.Text == "")
                {
                    //note.Width = "50";
                    note.Style.Add("Width", "50px");
                    note.Style.Add("margin-right", "0");
                    LbNotes.Style.Add("Width", "50px");
                }
                else
                {
                                     
                    int length = System.Text.Encoding.Default.GetBytes(LbNotes.Text).Length;
                    note.Width = (length < 1 ? 20 : length * 6 + 20).ToString();
                    note.Style.Add("margin-right", "0");
                    LbNotes.Width = (length < 1 ? 20 : length * 6 + 20);
                }
                LbLayerCode.Text = vsDr["LayerCode"].ToString();
                LbItemKind.Text = vsDr["ItemKind"].ToString();
                //LbENumber.Visible = LbItemKind.Text == "workitem" || LbItemKind.Text == "formula" ? true : false;
                LbRiName.Text = vsDr["RiName"].ToString();
                LbRiUnit.Text = vsDr["RiUnit"].ToString();
                LbAnaNumber.Text = vsDr["AnaNumber"].ToString();
                LbExecuteKind.Text = vsDr["ExecuteKind"].ToString();

                //ImageButtonAdd.Visible = (vsDr["ItemKind"].ToString() != "variableSumPercentage") ? true : false;
                //ImageButtonAna.Visible = (vsDr["Complex"].ToString() == "1") ? true : false;
                ImgBtnRlon.Visible = (vsDr["ItemKind"].ToString() == "workitem" && vsDr["ExecuteKind"].ToString() == "") ? true : (vsDr["ExecuteKind"].ToString() == "NK") ? true : (vsDr["ExecuteKind"].ToString() == "NKRP") ? true : (vsDr["ExecuteKind"].ToString() == "RP") ? true : (vsDr["ExecuteKind"].ToString() == "Nk2") ? true : false;
                ImgBtnNumBD.Visible = (vsDr["ItemKind"].ToString() == "workitem" && vsDr["ExecuteKind"].ToString() == "") ? true : (vsDr["ExecuteKind"].ToString() == "NP") ? true : (vsDr["ExecuteKind"].ToString() == "NK") ? false : (vsDr["ExecuteKind"].ToString() == "NKRP") ? false : false;
                //ImgBtnDel.Visible = (vsDr["ExecuteKind"].ToString() == "NK") ? true : (vsDr["ExecuteKind"].ToString() == "NKRP") ? true : (vsDr["ExecuteKind"].ToString() == "RK") ? true : (vsDr["NewItem"].ToString() == "1") ? true : false;
               
                check.Visible = (vsDr["ItemKind"].ToString() == "workitem") ? true : false;
                check.Checked = (vsDr["ActivityUseNY"].ToString() == "1") ? true : false;

              
                string layer = vsDr["LayerNum"].ToString()!=""?vsDr["LayerNum"].ToString():"0";
                int x = int.Parse(LbLayerNum) - int.Parse(layer) +1;//- int.Parse(layer)
               
                for (int i = 1; i <= int.Parse(layer)-1 ; i++)
                {
                    Literal1.Text += @"<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                }
                if (layer == "1")
                {

                    CToatal += Convert.ToDecimal(LbCComplex.Text);
                    LbCTotal.Text = CToatal.ToString("N0");
                    ETotal += Convert.ToDecimal(LbEComplex.Text);
                    LbETotal.Text = ETotal.ToString("N0");
                }
                Literal1.Text += @"<td  colspan= " + x + ">" + Order + "</td>";
                //if (check.Checked)
                //{

                //    string[] uid = checkfun.check_num(database, Lbwid.Text);


                //}
                j++;
            }
        }
        public void OpenNewWindow(string url, string Tgr, string width, string height)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string SQLUpdateSort = "";
            string SQLLayerNum="";
            string UpperWID = "";
            string LayerNum = "";
            
            int SortNum = 0;
            if (e.CommandName == "Relocation")
            {
                string WID = ((Label)e.Item.FindControl("LbWid")).Text;

                OpenNewWindow("EReallocation.aspx?CWID=" + WID + "", "A", "1500", "800");
            }

            if (e.CommandName == "NumBD")
            {
                string WID = ((Label)e.Item.FindControl("LbWid")).Text;

                OpenNewWindow("ENumberBD.aspx?CWID=" + WID + "", "B", "1500", "400");
            }
            if (e.CommandName == "Delete")
            {
                string database = Session["DatabaseName"].ToString();
                string WID = ((Label)e.Item.FindControl("LbWid")).Text;
                string ExecuteKind = WebModel.ExecuteKind(database, "EBudget_WBS", WID);
                string DelEBudget = "Delete FROM [EBudget_WBS] WHERE [EWID] = " + WID + "";
                UpperWID = WebModel.UpperWID(database, "EBudget_WBS", WID);
                string SQLSelectUpperUID = "Select * from CBudget_WBS where UpperWID=" + WID;
                string SelectUpperUID = WebModel.SItemName(database, SQLSelectUpperUID, "UpperWID");
                SQLLayerNum = "Select * From EBudget_WBS where EWID=" + WID;
                LayerNum = WebModel.SItemName(database, SQLLayerNum, "LayerNum");
                SortNum =int.Parse(WebModel.SItemName(database, SQLLayerNum, "SortNum"));
                string SQLSelectUpperWID = "Select * from EBudget_WBS where EWID=" + WID;
                string SelectUpperwid = WebModel.SItemName(database, SQLSelectUpperWID, "UpperWID");
                string SQLSel = "Select count(EWID) as EWID from EBudget_WBS where UpperWID=" + SelectUpperwid;
                string UpperNY = WebModel.SItemName(database, SQLSel, "EWID");
                if (SelectUpperUID != "")
                {
                    Page.ClientScript.RegisterStartupScript(typeof(string), "BtnDelayer_Click", "var retValue=confirm('該階層有項目，是否刪除???');" + "if (retValue) {document.getElementById('" + LinkButtonDel.ClientID + "').click();};", true);
                }
            else
            {
                if (UpperNY == "1")
                {
                    string SQLUpdate = "Update EBudget_WBS set ExecuteKind=null where EWID=" + UpperWID;
                    WebModel.SQLAction(database, SQLUpdate);

                }
                    if (ExecuteKind == "NP" || ExecuteKind == "RP")
                {
                    string priceid = WebModel.EPriceId(database, "EBudget_WBS", WID);
                    string DelRes = "Delete From Pro_Resource Where PriceID=" + priceid+"";                       
                    string DelAna = "Delete From Pro_Analysis where ParentID=" + UpperWID + "";
                    string SQLUpdate = "Update EBudget_WBS set ExecuteKind=null where EWID=" + UpperWID;
                    WebModel.SQLAction(database, DelRes);
                    WebModel.SQLAction(database, DelAna);
                    WebModel.SQLAction(database, SQLUpdate);
                }
                else if (ExecuteKind == "NKRP")
                {
                    string priceid = WebModel.EPriceId(database, "EBudget_WBS", WID);
                    string DelRes = "Delete From Pro_Resource Where PriceID=" + priceid + "";
                    string DelAna = "Delete From Pro_Analysis where ParentID=" + UpperWID + "";
                    string SQLUpdate = "Update EBudget_WBS set ExecuteKind='NK' where EWID=" + UpperWID;
                    WebModel.SQLAction(database, DelRes);
                    WebModel.SQLAction(database, DelAna);
                    WebModel.SQLAction(database, SQLUpdate);

                }
                if (SortNum == 1)
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
                }
                else
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

                }
                //SQLUpdateSort = "update EBudget_WBS set sortnum=SortNum-1 where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >=" + (SortNum-1) + "";
                WebModel.SQLAction(database, DelEBudget);
                WebModel.SQLAction(database, SQLUpdateSort);
                
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已刪除');", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                //Repeater1_ItemDataBound(this, null);
                Repeater1.DataSourceID = "SqlDataSource1";
                Repeater1.DataBind();

            }
        }
            if (e.CommandName == "Analyst")
            {
                string PriceID = ((Label)e.Item.FindControl("LbPriceID")).Text;
                string WID = ((Label)e.Item.FindControl("LbWid")).Text;
                OpenNewWindow("AnalysisV_EWBS.aspx?PriceID=" + PriceID + "&ewid=" + WID, "A", "1500", "800");
            }
        }
        //if there is a upperUID ,delete all
        protected void LinkButtonDel_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            bool result = false;
            string SQLUpdateSort = "";
            int UPPID = int.Parse(ViewState["uid"].ToString());
            string[] uid = EBudgetDisp.check_Enum(database, UPPID);
            foreach (string uuu in uid)//使用foreach迴圈撈出陣列值
            {
                string Select = "Select * from EBudget_WBS where CWID=" + uuu;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperWID = WebModel.SItemName(database, Select, "UpperWID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");

                string DelSQL = "Delete EBudget_WBS where CWID=" + uuu;


                result = WebModel.SQLAction(database, DelSQL);
                if (SortNum == "1")
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
                }
                else
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

                }
                //string SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();
                result = WebModel.SQLAction(database, SQLUpdateSort);
            }
            string DelSQL1 = "Delete EBudget_WBS where EWID=" + ViewState["uid"].ToString();
            result = WebModel.SQLAction(database, DelSQL1);
            //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
            string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
            string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
            string UpdateItemOrder;
            if (CBudgetNumType == "0")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                bool update = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            }
            else if (CBudgetNumType == "1")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
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
          
           
        }
        protected void ImgBtnAdd_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("AddNewEItem.aspx", "A", "1500", "300");
        }

        protected void ImgCheckIn_Click(object sender, ImageClickEventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label wid = item.FindControl("wid") as Label;
                    CheckBox check = (CheckBox)item.FindControl("check") as CheckBox;

                    check.Checked = true;
                }
            }
        }

        protected void ImgCheckOut_Click(object sender, ImageClickEventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label wid = item.FindControl("wid") as Label;
                    CheckBox check = (CheckBox)item.FindControl("check") as CheckBox;

                    check.Checked = false;
                }
            }
        }

        protected void ImgExcel_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            Response.Expires = 0;
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "utf-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename="+ProjectName+".xls");
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");
          
            int titlecolspan = int.Parse(LbLayerNum) + 9;
            HttpContext.Current.Response.Write("<Table><tr><td colspan='" + titlecolspan + "' align=\"center\" style='font-size:16.0pt;'>" + ProjectName + "</td></tr><TR ><td style='font-size:16.0pt;'>合約預算總價:" + LbCTotal.Text + "</td><td style='font-size:16.0pt;'>   執行預算總價:" + LbETotal.Text + "</td></tr></Table>" +
             "<Table border='1' bgColor='#ffffff' " +
             "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
             "style='font-size:10.0pt; background:white;'>");
                    
            Response.Write("\n</th>");
           
           
            Response.Write("\n<tr bgcolor=#fff8dc  align=\"center\" x:num>");
            Response.Write("<td colspan='" + LbLayerNum + "' rowspan=\"2\">項次</td><td rowspan=\"2\">工項名稱</td>" +
                                "<td  rowspan=\"2\">單位</td><td  colspan=\"3\">合約預算</td><td  colspan=\"3\">執行預算</td>"+
                                "<td  rowspan=\"2\">備註</td></td></tr>"+
                            "<tr ><td >數量</td><td>單價</td><td >複價</td><td >數量</td><td >單價</td><td >複價</td></tr>");
                       
            Response.Write("\n </TR>");

            string l_str2 = "";
            foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    Label wid = item.FindControl("wid") as Label;
                    CheckBox check = (CheckBox)item.FindControl("check") as CheckBox;

                    Label Lbwid = (Label)item.FindControl("Lbwid");
                    Literal Literal1 = (Literal)item.FindControl("Literal1");
                    Label LbItemName = (Label)item.FindControl("LbItemName");
                    Label LbUnit = (Label)item.FindControl("LbUnit");
                    Label LbCNumber = (Label)item.FindControl("LbCNumber");
                    Label LbCPrice = (Label)item.FindControl("LbCPrice");
                    Label LbCComplex = (Label)item.FindControl("LbCComplex");
                    TextBox LbENumber = (TextBox)item.FindControl("LbENumber");
                    Label LbEPrice = (Label)item.FindControl("LbEPrice");
                    Label LbEComplex = (Label)item.FindControl("LbEComplex");
                    TextBox LbNotes = (TextBox)item.FindControl("LbNotes");
                  
                
                    l_str2 = "<tr>" + Literal1.Text + "";
                    l_str2 += "<td>" + LbItemName.Text + "";
                    l_str2 += "</td><td>" + LbUnit.Text + "";                  
                    l_str2 += "</td><td>" + LbCNumber.Text + "";
                    l_str2 += "</td><td>" + LbCPrice.Text + "";
                    l_str2 += "</td><td>" + LbCComplex.Text + "";
                    l_str2 += "</td><td>" + LbENumber.Text + "";
                    l_str2 += "</td><td>" + LbEPrice.Text + "";
                    l_str2 += "</td><td>" + LbEComplex.Text + "";
                    l_str2 += "</td><td>" + LbNotes.Text + "";
                  
                    l_str2 += "</td></tr>";

                    Response.Write(l_str2);
                }
            }

            Response.Write("</Table>");
            Response.End(); 
        }
      

        protected void ImgPDF_Click(object sender, ImageClickEventArgs e)
        {
            
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            int titlecolspan = int.Parse(LbLayerNum) + 9;
            string l_str1 = "";
            l_str1 += "<Table><tr><td colspan='" + titlecolspan + "' align=\"center\" style='font-size:16.0pt;'>" + ProjectName + "</td></tr><TR ><td style='font-size:16.0pt;'>合約預算總價:" + LbCTotal.Text + "</td><td style='font-size:16.0pt;'>   執行預算總價:" + LbETotal.Text + "</td></tr></Table>" +
             "<Table border='1' bgColor='#ffffff' " +
             "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
             "style='font-size:10.0pt; background:white;'>";

            l_str1 += "\n</th>";


            l_str1 += "\n<tr bgcolor=#fff8dc  align=\"center\" x:num>";
            l_str1 += "<td colspan='" + LbLayerNum + "' rowspan=\"2\">項次</td><td rowspan=\"2\">工項名稱</td>" +
                                "<td  rowspan=\"2\">單位</td><td  colspan=\"3\">合約預算</td><td  colspan=\"3\">執行預算</td>" +
                                "<td  rowspan=\"2\">備註</td></td></tr>" +
                            "<tr ><td >數量</td><td>單價</td><td >複價</td><td >數量</td><td >單價</td><td >複價</td></tr>";

            l_str1 += "\n </TR>";

           
            foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    Label wid = item.FindControl("wid") as Label;
                    CheckBox check = (CheckBox)item.FindControl("check") as CheckBox;

                    Label Lbwid = (Label)item.FindControl("Lbwid");
                    Literal Literal1 = (Literal)item.FindControl("Literal1");
                    Label LbItemName = (Label)item.FindControl("LbItemName");
                    Label LbUnit = (Label)item.FindControl("LbUnit");
                    Label LbCNumber = (Label)item.FindControl("LbCNumber");
                    Label LbCPrice = (Label)item.FindControl("LbCPrice");
                    Label LbCComplex = (Label)item.FindControl("LbCComplex");
                    TextBox LbENumber = (TextBox)item.FindControl("LbENumber");
                    Label LbEPrice = (Label)item.FindControl("LbEPrice");
                    Label LbEComplex = (Label)item.FindControl("LbEComplex");
                    TextBox LbNotes = (TextBox)item.FindControl("LbNotes");


                    l_str1 += "<tr>" + Literal1.Text + "";
                    l_str1 += "<td>" + LbItemName.Text + "";
                    l_str1 += "</td><td>" + LbUnit.Text + "";
                    l_str1 += "</td><td>" + LbCNumber.Text + "";
                    l_str1 += "</td><td>" + LbCPrice.Text + "";
                    l_str1 += "</td><td>" + LbCComplex.Text + "";
                    l_str1 += "</td><td>" + LbENumber.Text + "";
                    l_str1 += "</td><td>" + LbEPrice.Text + "";
                    l_str1 += "</td><td>" + LbEComplex.Text + "";
                    l_str1 += "</td><td>" + LbNotes.Text + "";

                    l_str1 += "</td></tr>";

                    //Response.Write(l_str2);
                }
            }
            l_str1 += "</Table>";

          
            string html = l_str1.ToString();
            //SautinSoft.PdfMetamorphosis p = new SautinSoft.PdfMetamorphosis();

            string url = html;


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
        public static DataTable Analysis(string database, string Pid,string ParentID, string WID)
        {
            DataTable DataTableBox = null;

            try
            {
                DataTableBox = new DataTable();

                string SQLAna = "Select * From Pro_Resource a left join Pro_Analysis b on a.PriceID=b.KidID where b.ParentID=" + ParentID + " a.PriceID=" + WID;
                //string SQLAna1 = "Select * From Pro_Resource  where PriceID=" + WID;

                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLAna, L_Conn))
                    {
                        //SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);

                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
        public static DataTable Analysis1(string database, string Pid, string ParentID, string WID)
        {
            DataTable DataTableBox = null;

            try
            {
                DataTableBox = new DataTable();

                //string SQLAna = "Select * From Pro_Resource a left join Pro_Analysis b on a.PriceID=b.KidID where b.ParentID=" + ParentID + " a.PriceID=" + WID;
                string SQLAna1 = "Select * From Pro_Resource  where PriceID=" + WID;

                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLAna1, L_Conn))
                    {
                        //SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);

                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
     
        protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "return confirm('確認要鎖定嗎?(鎖定後原工項不能刪增，須以預算變更處理!')", true);//ajax 新增階層碼
            string SQLUpdate = "Update ProjectM0 Set EBudgetLock=1 where PID="+Session["ProjectCode"].ToString()+"";
            //string SQLDel = "Delete from EBudget_ResourceBK where PID="+Session["ProjectCode"].ToString()+"";
            string database = Session["DatabaseName"].ToString();
            //string SQLString = "PID,ItemKind,WiEWID,WiLayerCode,WiName,WiUnit,ItemAmount,LastAmount,RiPriceID,RiPrice,RiName,RiUnit,AnaNumber,RiUpperBKID,WorkRate,RiLayer";
            //DataTable DataTableBox = new DataTable();

            //foreach (string DataName in SQLString.Split(','))
            //{
            //    DataTableBox.Columns.Add(DataName, typeof(string));
            //}
            bool result = false;

            //後台功能，必需要有的欄位名稱               

            //DataRow DataTableDr = DataTableBox.NewRow();
            if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg"))
            {
                IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                IBtn_Lock.ToolTip = "執行預算已鎖定";
                IBtn_Lock.Enabled = false;
                ImgBtnAdd.Visible = false;
                IBtn_PriceFill.Visible = false;
                //IBtn_Reload.Visible = false;
                ImgSave.Visible = false;
                result= WebModel.SQLAction(database, SQLUpdate);
                //WebModel.SQLAction(database, SQLDel);

                //foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
                //{
                //    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                //    {
                     
                //        //Label wid = item.FindControl("wid") as Label;
                     
                //        Label Lbwid = (Label)item.FindControl("Lbwid");
                //        Label LbPriceID = (Label)item.FindControl("LbPriceID");
                //        LbPriceID.Text = LbPriceID.Text != "" ? LbPriceID.Text : "0";
                //        //DataTable Pro_Analysis = Analysis(database, Session["ProjectCode"].ToString(), Lbwid.Text);
                //        int[] num = GetWiRiTable.GetKidID(database, Session["ProjectCode"].ToString(), int.Parse(LbPriceID.Text));
                //        int[] layer = GetWiRiTable.Get_layer(database, Session["ProjectCode"].ToString(), int.Parse(LbPriceID.Text));
                //        //Literal Literal1 = (Literal)item.FindControl("Literal1");
                //        Label LbItemName = (Label)item.FindControl("LbItemName");
                //        Label LbUnit = (Label)item.FindControl("LbUnit");
                //        Label LbCNumber = (Label)item.FindControl("LbCNumber");
                //        Label LbCPrice = (Label)item.FindControl("LbCPrice");
                //        Label LbCComplex = (Label)item.FindControl("LbCComplex");
                //        TextBox LbENumber = (TextBox)item.FindControl("LbENumber");
                //        Label LbEPrice = (Label)item.FindControl("LbEPrice");
                //        Label LbEComplex = (Label)item.FindControl("LbEComplex");
                //        TextBox LbNotes = (TextBox)item.FindControl("LbNotes");
                //        Label LbItemKind = (Label)item.FindControl("LbItemKind");
                //        Label LbLayerCode = (Label)item.FindControl("LbLayerCode");
                //        Label LbRiName = (Label)item.FindControl("LbRiName");
                //        Label LbRiUnit = (Label)item.FindControl("LbRiUnit");
                //        Label LbAnaNumber = (Label)item.FindControl("LbAnaNumber");
                //        Label LbExecuteKind = (Label)item.FindControl("LbExecuteKind");

                //        DataTableDr["pid"] = Session["ProjectCode"].ToString();
                //        DataTableDr["ItemKind"] = LbItemKind.Text == "workitem" ? LbExecuteKind.Text : LbItemKind.Text;
                //        DataTableDr["WiEWID"] = Lbwid.Text;
                //        DataTableDr["WiLayerCode"] = LbLayerCode.Text;
                //        DataTableDr["WiName"] = LbItemName.Text;                       
                //        DataTableDr["WiUnit"] = LbUnit.Text;
                //        DataTableDr["ItemAmount"] = LbENumber.Text != "0" ? decimal.Parse(LbENumber.Text) : 1;
                //        DataTableDr["LastAmount"] = LbENumber.Text != "0" ? decimal.Parse(LbENumber.Text) : 1;
                //        DataTableDr["RiPriceID"] = LbPriceID.Text;
                //        DataTableDr["RiPrice"] = LbEPrice.Text !=""?LbEPrice.Text:"0";
                //        DataTableDr["RiName"] = LbRiName.Text;
                //        DataTableDr["RiUnit"] = LbRiUnit.Text;
                //        DataTableDr["AnaNumber"] = LbAnaNumber.Text != "" ? decimal.Parse(LbAnaNumber.Text) : 0;
                //        DataTableDr["WorkRate"] =  0;
                    
                //        DataTableBox.Rows.Add(DataTableDr);
                //        WebModel.SaveAction(database, "EBudget_ResourceBK", DataTableBox);
                //        DataTableBox.Rows.Clear();
                //        int count = 0;
                      
                //            for (int uuu = 1; uuu < num.Length; uuu++)
                //            {

                //                int nowuid = num[uuu];
                //                //int[] num1 = GetWiRiTable.GetKidID(database, Session["ProjectCode"].ToString(), nowuid);

                //                DataTable Pro_Analysis = Analysis(database, Session["ProjectCode"].ToString(), LbPriceID.Text, nowuid.ToString());
                //                DataTable Pro_Analysis1 = Analysis1(database, Session["ProjectCode"].ToString(), LbPriceID.Text, nowuid.ToString());
                //                //CheckBox chk = (CheckBox)Repeater1.Controls[nowuid].FindControl("check");
                //                if (Pro_Analysis != null && Pro_Analysis.Rows.Count > 0)
                //                {
                //                    for (int i = 0; i < Pro_Analysis.Rows.Count; i++)
                //                    {
                //                        DataRow vsDr = Pro_Analysis.Rows[i];
                //                        DataTableDr["pid"] = Session["ProjectCode"].ToString();
                //                        DataTableDr["ItemKind"] = LbItemKind.Text == "workitem" ? LbExecuteKind.Text : LbItemKind.Text;
                //                        DataTableDr["WiEWID"] = Lbwid.Text;
                //                        DataTableDr["WiLayerCode"] = LbLayerCode.Text;
                //                        DataTableDr["WiName"] = LbItemName.Text;
                //                        DataTableDr["WiUnit"] = LbUnit.Text;
                //                        DataTableDr["RiPriceID"] = LbPriceID.Text;
                //                        DataTableDr["RiPrice"] = LbEPrice.Text !=""?LbEPrice.Text:"0";

                //                        string RiPriceID = vsDr["PriceID"].ToString();
                //                        string ParentID = LbPriceID.Text;
                //                        string KidID = nowuid.ToString();
                //                        string SQLWorkRate = "Select * from Pro_Analysis where ParentID=" + ParentID + " and KidID=" + KidID;
                //                        string WorkRate = WebModel.SItemName(database, SQLWorkRate, "WorkRate");
                //                        string RiName = vsDr["ItemName"].ToString();
                //                        string RiUnit = vsDr["Unit"].ToString();
                //                        string AnaNumber = vsDr["AnaNumber"].ToString();
                //                        string ItemKind = vsDr["ItemKind"].ToString();
                //                        string SQLAna_ParentID = "Select * from Pro_Analysis where KidID=" + nowuid.ToString();
                //                        string Ana_ParentID = WebModel.SItemName(database, SQLAna_ParentID, "ParentID");
                //                        string SQLRiUpperBKID = "Select * from EBudget_ResourceBK where RiPriceID=" + Ana_ParentID;
                //                        string RiUpperBKID = WebModel.SItemName(database, SQLRiUpperBKID, "BKID");

                //                        DataTableDr["RiUpperBKID"] = RiUpperBKID;
                //                        DataTableDr["WorkRate"] = WorkRate != "" ? decimal.Parse(WorkRate) : 0;
                //                        DataTableDr["RiPriceID"] = RiPriceID;
                //                        DataTableDr["RiName"] = RiName;
                //                        DataTableDr["RiUnit"] = RiUnit;
                //                        DataTableDr["AnaNumber"] = AnaNumber != "" ? decimal.Parse(AnaNumber) : 0;
                //                        DataTableDr["ItemKind"] = ItemKind;

                //                        for (int layernum = 0; layernum < layer.Length; layernum++)
                //                        {

                //                            if (layernum == uuu)
                //                            {
                //                                int nowlayer = layer[layernum];
                //                                DataTableDr["RiLayer"] = nowlayer;
                                              
                //                                //if (nowlayer == 0)
                //                                //{
                //                                //    DataTableDr["ItemAmount"] = decimal.Parse(LbENumber.Text);
                //                                //    DataTableDr["LastAmount"] = decimal.Parse(LbENumber.Text);
                //                                //}
                //                                //else if (nowlayer != 0)
                //                                //{
                //                                //    DataTableDr["ItemAmount"]=

                //                                //}
                //                            }
                //                        }
                //                        DataTableDr["ItemAmount"] = LbENumber.Text != "" && WorkRate != "" && AnaNumber != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(LbAnaNumber.Text) : 0;
                //                        DataTableDr["LastAmount"] = LbENumber.Text != "" && WorkRate != "" && AnaNumber != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(LbAnaNumber.Text) : 0;
                //                        decimal ItemAmount = LbENumber.Text != "" && WorkRate != "" && AnaNumber != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(AnaNumber) : 0;
                //                        DataTableBox.Rows.Add(DataTableDr);
                //                        WebModel.SaveAction(database, "EBudget_ResourceBK", DataTableBox);
                //                        DataTableBox.Rows.Clear();
                //                        count++;
                //                    }
                //                }
                //                else if (Pro_Analysis1 != null && Pro_Analysis1.Rows.Count > 0)
                //                {
                //                    Pro_Analysis1.Columns.Add("WorkRate");
                //                    Pro_Analysis1.Columns.Add("KidID");
                //                    Pro_Analysis1.Columns.Add("ParentID");
                //                    for (int i = 0; i < 1; i++)
                //                    {
                //                        DataRow vsDr = Pro_Analysis1.Rows[i];
                //                        DataTableDr["pid"] = Session["ProjectCode"].ToString();
                //                        DataTableDr["ItemKind"] = LbItemKind.Text == "workitem" ? LbExecuteKind.Text : LbItemKind.Text;
                //                        DataTableDr["WiEWID"] = Lbwid.Text;
                //                        DataTableDr["WiLayerCode"] = LbLayerCode.Text;
                //                        DataTableDr["WiName"] = LbItemName.Text;
                //                        DataTableDr["WiUnit"] = LbUnit.Text;
                //                        DataTableDr["RiPriceID"] = LbPriceID.Text;

                //                        string RiPriceID = vsDr["PriceID"].ToString();
                //                        string ParentID = LbPriceID.Text;
                //                        string KidID = nowuid.ToString();
                //                        string SQLWorkRate = "Select * from Pro_Analysis where ParentID=" + ParentID + " and KidID=" + KidID;
                //                        string WorkRate = WebModel.SItemName(database, SQLWorkRate, "WorkRate");
                //                        string RiPrice = vsDr["EPrice"].ToString() !=""?vsDr["EPrice"].ToString():"0";
                                       
                //                        string RiName = vsDr["ItemName"].ToString();
                //                        string RiUnit = vsDr["Unit"].ToString();
                //                        string AnaNumber = vsDr["AnaNumber"].ToString();
                //                        string ItemKind = vsDr["ItemKind"].ToString();
                //                        //以nowuid搜尋UpperBKID
                //                        string SQLAna_ParentID = "Select * from Pro_Analysis where KidID=" + nowuid.ToString();
                //                        string Ana_ParentID = WebModel.SItemName(database, SQLAna_ParentID, "ParentID");
                //                        string SQLRiUpperBKID = "Select * from EBudget_ResourceBK where RiPriceID=" + Ana_ParentID;
                //                        string RiUpperBKID = WebModel.SItemName(database, SQLRiUpperBKID, "BKID");
                                       
                //                        DataTableDr["RiUpperBKID"] = RiUpperBKID;
                //                        DataTableDr["WorkRate"] = WorkRate != "" ? decimal.Parse(WorkRate) : 0;
                //                        DataTableDr["RiPriceID"] = RiPriceID;
                //                        DataTableDr["RiName"] = RiName;
                //                        DataTableDr["RiUnit"] = RiUnit;
                //                        DataTableDr["AnaNumber"] = AnaNumber != "" ? decimal.Parse(AnaNumber) : 0;
                //                        DataTableDr["ItemKind"] = ItemKind;
                //                        DataTableDr["RiPrice"] = RiPrice;
                //                        for (int layernum = 0; layernum < layer.Length; layernum++)
                //                        {

                //                            if (layernum == uuu)
                //                            {
                //                                int nowlayer = layer[layernum];
                //                                DataTableDr["RiLayer"] = nowlayer;
                                               
                //                            }
                //                        }
                //                        DataTableDr["ItemAmount"] = LbENumber.Text != "" && WorkRate != "" && LbAnaNumber.Text != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(LbAnaNumber.Text) : 0;
                //                        DataTableDr["LastAmount"] = LbENumber.Text != "" && WorkRate != "" && LbAnaNumber.Text != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(LbAnaNumber.Text) : 0;
                //                        decimal ItemAmount = LbENumber.Text != "" && WorkRate != "" && AnaNumber != "" ? (decimal.Parse(LbENumber.Text) * decimal.Parse(WorkRate)) / decimal.Parse(AnaNumber) : 0;
                //                        DataTableBox.Rows.Add(DataTableDr);
                //                        WebModel.SaveAction(database, "EBudget_ResourceBK", DataTableBox);
                //                        DataTableBox.Rows.Clear();

                                    //}
                                 
                                //}
                            //}
                        //}
                       
                //}
                if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 執行預算鎖定完成');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 執行預算鎖定失敗');", true);

                }
            }
           
               else if ((IBtn_Lock.ImageUrl == "~/img/Lock.jpg"))
            {

                string SQLUpdate1 = "Update ProjectM0 Set EBudgetLock=0 where PID=" + Session["ProjectCode"].ToString() + "";
                IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
                IBtn_Lock.ToolTip = "預算尚未鎖定(點選鎖定預算)";              
                IBtn_PriceFill.Visible = true;               
                //IBtn_Reload.Visible = true;
                IBtn_Lock.Enabled = true;
                ImgBtnAdd.Visible = true;
                ImgSave.Visible = true;
                result = WebModel.SQLAction(database, SQLUpdate1);
                if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 執行預算解鎖完成');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 執行預算解鎖失敗');", true);

                }
            }
        }

     
        protected void ImgSave_Click(object sender, ImageClickEventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    //Label wid = item.FindControl("wid") as Label;
                    CheckBox check = (CheckBox)item.FindControl("check") as CheckBox;

                    Label Lbwid = (Label)item.FindControl("Lbwid");                   
                    TextBox LbENumber = (TextBox)item.FindControl("LbENumber");               
                    TextBox LbNotes = (TextBox)item.FindControl("LbNotes");
                    string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(LbNotes.Text));

                    decimal EnuM = 0;

                    decimal.TryParse(LbENumber.Text, out EnuM);
                     
                           string database = Session["DatabaseName"].ToString();
                           string insert = "";
                           insert += check.Checked == true ? " ActivityUseNY =1 ," : "ActivityUseNY =0 ,";
                           insert += LbENumber.Text != "" ? " ENumber =" + EnuM + "" : "";
                           insert += (LbENumber.Text != "" && Notes != "") ? " ," : "";
                           insert += Notes !="" ?" Notes='" +Notes+ "'":"";
                           if (insert != "")
                           {
                               string SQLUpdate = "Update EBudget_WBS set " + insert + " where EWID= " + Lbwid.Text + "";
                               WebModel.SQLAction(database, SQLUpdate);
                               ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已儲存項目');", true);
                             
                           }
                      
                       //else
                       //{
                       //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請輸入數字');", true);
                       //}

                    }

            }
            Repeater1.DataSourceID = "SqlDataSource1";
            Repeater1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Repeater1.DataSourceID = "SqlDataSource1";
            Repeater1.DataBind();
            Response.Redirect("ExeBudgetEdit.aspx");
        }

        protected void IBtn_PriceFill_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ExeBudgetPEdit.aspx");
        }

        protected void IBtn_Reload_Click(object sender, ImageClickEventArgs e)
        {
           
            Page.ClientScript.RegisterStartupScript(typeof(string), "LBtnConfirm_Click", "var retValue=confirm('請再次確認是否將已輸入之執行預算全數刪除?');" + "if (retValue) {document.getElementById('" + LBtnConfirm.ClientID + "').click();};", true);
        }

        protected void check_CheckedChanged(object sender, EventArgs e)
        {
              string database = Session["DatabaseName"].ToString();
             
                      
                      CheckBox check = (CheckBox)sender;
                 
                                    
                      RepeaterItem item = (RepeaterItem)check.NamingContainer;
                        int index = item.ItemIndex;

                        Label Lbwid = (Label)item.FindControl("Lbwid");
                      //int[] uid = checkfun.Sort_LayerCode(database,Session["ProjectCode"].ToString(),int.Parse(Lbwid.Text));
                        int[] uid = checkfun.Sort_EBudget(database, Session["ProjectCode"].ToString(), int.Parse(Lbwid.Text));
            

               foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                {
                   
                    foreach (RepeaterItem item1 in Repeater1.Items)  
                    {
                        if (item1.ItemType == ListItemType.Item || item1.ItemType == ListItemType.AlternatingItem)
                        {
                            Label Lbwid1 = (Label)item1.FindControl("Lbwid");
                            CheckBox chb = (CheckBox)item1.FindControl("Check");
                             if(check.Checked==true)
                                {
                            if (Lbwid1.Text == uuu.ToString())
                            {
                                chb.Checked = true;
                            }
                             }
                             else if (check.Checked == false)
                                 if (Lbwid1.Text == uuu.ToString())
                            {
                                chb.Checked = false;

                            }
                        }
                    }
                }
              
                          
                      }
           //使用for迴圈撈出陣列值
                      //for (int uuu = 0; uuu < uid.Length; uuu++)
                      //{
                      //    int nowuid = uid[uuu];
                        
                      //        CheckBox chk = (CheckBox)Repeater1.Controls[nowuid].FindControl("check");

                      //}

        protected void callback_Click(object sender, EventArgs e)
        {

            Response.Redirect("ExeBudgetEdit.aspx");

        }

        protected void LBtnConfirm_Click(object sender, EventArgs e)
        {
            if (Session["ProjectCode"] != null)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLDel_EB = "Delete  from EBudget_WBS where PID=" + Session["ProjectCode"].ToString();
                //string SQLDel_PR = "Delete  from Pro_Resource where PID="+Session["ProjectCode"].ToString();
                WebModel.SQLAction(database, SQLDel_EB);
                //WebModel.SQLAction(database, SQLDel_PR);

                string sqlImport = "INSERT INTO EBudget_WBS ([CWID],[PID],[LayerCode],[LayerNum],[UpperWID],[SortNum],[ItemOrder],[PriceID] ,[ItemName],[Unit],[ItemKind],[order_Num],[ActivityUseNY],[ENumber],[LastENumber]) SELECT CWID,PID,[LayerCode],[LayerNum],[UpperWID],[SortNum],[ItemOrder],[PriceID] ,[ItemName],[Unit],[ItemKind],order_Num,0,[CNumber],[LastCNumber] FROM CBudget_WBS where PID=" + Session["ProjectCode"].ToString() + "";
                bool result = WebModel.SQLAction(database, sqlImport);
                string SQLImport1 = "update EBudget_WBS set EBudget_WBS.EUnitPrice = Pro_Resource.CPrice from Pro_Resource join EBudget_WBS on EBudget_WBS.PriceID=Pro_Resource.PriceID where EBudget_WBS.pid=" + Session["ProjectCode"].ToString() + "";
                bool result1 = WebModel.SQLAction(database, SQLImport1);
                //將upperwid轉換為現有的專案的upperwid
                bool result2 = CBudgetDisp.update_EWBS_Upperwid(database, Session["ProjectCode"].ToString());
                Repeater1.DataBind();
                if (result && result1)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 項目已經匯入完成');", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 項目匯入失敗');", true);

                }
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇專案');", true);
            }
        }     
    }
}