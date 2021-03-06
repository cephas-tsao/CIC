﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS
{
    public partial class CChangeAdd : System.Web.UI.Page
    {
        string PriceID;
        string ItemName;
        protected string LbLayerNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + " and EEdition<>0";
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                ViewState["i"] = 0;
                ViewState["ADD"] = null;
                //Session["layer"] = 0;
                //Session["PriceID"] = null;
                //Session["ItemName"] = null;
                //Session["Notes"] = null;
                //Session["Quantity"] = null;
                LoadContent();
                DDL_Unit.DataSource = Utility.Unitlist.UnitList();
                DDL_Unit.DataBind();
              
            }
            if (Session["PriceID"] != null)
            {

                string PriceIDArray = Session["PriceID"].ToString();
                // var vals = valueStr.Split(',')[0];
                PriceID = PriceIDArray.Split('ξ')[0];
                Session["thisID"] = PriceID;
                ItemName = PriceIDArray.Split('ξ')[1];
                LoadContent();
            }
        
           
                //TxItemName.Attributes.Add("value", TxItemName.Text);
                if (Session["ItemName"] != null)
                    TxItemName.Text = Session["ItemName"].ToString();
                if (Session["Quantity"] != null)
                    TxQuantity.Text = Session["Quantity"].ToString();
                if (Session["stock"] != null)
                    TxNotes.Text = Session["Notes"].ToString();  

            //ViewState["ItemName"] = TxItemName.Text;
            //ViewState["Notes"] = TxNotes.Text;
          

        }
      
        protected void LoadContent()
        {
            string SQLString="";
            string database = Session["DatabaseName"].ToString();
           
         

            ViewState["i"] = WebModel.MaxLayerSNum(Session["DatabaseName"].ToString(), "EBudget_WBS", Session["ProjectCode"].ToString());
            LbEdition.Text = (WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition")).ToString();
            if (ViewState["addLayer"] == null)
            {
              
                for (int i = 1; i <= int.Parse(ViewState["i"].ToString()); i++)
                {
                    DDLLayer.Items.Add(new ListItem(i.ToString(), i.ToString()));

                }
            }
            if (Session["thisID"] !=null)
            {
             SQLString = "Select  *  from  Pro_Resource  where PriceID=" + Session["thisID"].ToString() + "";
                 Pnl_ExeAdd.Visible = true;
            }  
              
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

             
                    if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                    {
                        foreach (DataRow row in DataTableBox.Rows)
                        {

                            ReItemName.Text = row["ItemName"].ToString();

                        }

                }
                    ViewState["addLayer"] = true;
        }
        protected void Button17_Click(object sender, EventArgs e)
        {
            Session["ItemName"] = TxItemName.Text;
            Session["Notes"] = TxNotes.Text;
            Session["Quantity"] = TxQuantity.Text;
            OpenNewWindow("BWBS_ResourceLink.aspx", Button17.ID);
        }
        protected void callback_Click(object sender, EventArgs e)
        {
         
            Response.Redirect("CChangeAdd.aspx");
           
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_ExeAdd.Visible == false))
            {
                Pnl_ExeAdd.Visible = true;
            }
            else
            {
                Pnl_ExeAdd.Visible = false;
            }
      
         
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
          
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Select")
            {

                int UID = (int)GridView1.DataKeys[ID_class].Value;
                //string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                Label Unit = (Label)GridView1.Rows[ID_class].FindControl("Unit");
                TxItemName.Text = ItemName.Text;
                DDL_Unit.SelectedValue = Unit.Text;
                //Session["PriceID"] = PriceID + "," + ItemName.Text;
                Session["ItemName"] = TxItemName.Text;
               
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
               if (e.Row.RowType == DataControlRowType.DataRow)
            {

                 string database = Session["DatabaseName"].ToString();
                 //Label UpItemName = (Label)e.Row.FindControl("UpItemName");
                 Label ItemKind = (Label)e.Row.FindControl("ItemKind");
                string upWID = DataBinder.Eval(e.Row.DataItem, "UpperWID").ToString();
                string SQLString="Select * from EBudget_WBS where CWID="+upWID;
                //UpItemName.Text = WebModel.SItemName(database, SQLString, "ItemName");
                ItemKind.Text = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString() == "mainitem" ? "統計項目" : DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString() == "workitem" ? "明細項目" : "";
                   
               


            }
        
        }
        protected void DDLLayer_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLTop.Items.Clear();
            DDLNext.Items.Clear();
            DDLTop.DataSourceID = "SqlDataSource4";

            if (Session["ProjectCode"] != null && Session["ProjectCode"].ToString() != "")
            {
                int layer = int.Parse(DDLLayer.SelectedValue) - 1;

                //}
                if (layer == 0)
                {
                    SqlDataSource4.SelectCommand = "";
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('無上層工項');", true);

                }

                else
                {


                    SqlDataSource4.SelectCommand = "Select * from CBudget_WBS where LayerNum =" + layer + " and  ItemName is not null and Pid=" + Session["ProjectCode"].ToString() + "";
                    DDLTop.DataTextField = "ItemName";
                    DDLTop.DataValueField = "CWID";
                    DDLTop.AutoPostBack = true;
                    DDLTop.DataBind();
                 
                }
                ListItem LI2 = new ListItem();
                LI2.Text = "--";
                LI2.Value = "0";

                DDLTop.Items.Insert(0, LI2);
             
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請重新選擇專案');", true);
            }
        }

        protected void DDLTop_SelectedIndexChanged(object sender, EventArgs e)
        {

            DDLNext.Items.Clear();
            //DDLDtUpper.Items.Clear();
            string database = Session["DatabaseName"].ToString();
            string MAXSortNum = "";
            int Num;
            string MaxUID;
            string MaxID;
            string SQLUPPER = "Select  MAX(SortNum) as SortNum  from CBudget_WBS where UpperWID=" + DDLTop.SelectedValue + "";
            string MaxId = "Select  MAX(SortNum) as id  from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + "";
            string MaxUId = "Select  MAX(WID) as wid  from CBudget_WBS";
            DataTable DataTableBox1 = WebModel.LoadSetContentData(database, MaxId);
            if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox1.Rows)
                {

                    MaxID = row["id"].ToString();

                }
            }
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLUPPER);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    MAXSortNum = (row["SortNum"].ToString() == "") ? "0" : row["SortNum"].ToString();

                }
            }
            DataTable DataTableBox2 = WebModel.LoadSetContentData(database, MaxUId);
            if (DataTableBox2 != null && DataTableBox2.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox2.Rows)
                {

                    MaxUID = row["wid"].ToString();

                }
            }

            Num = int.Parse(MAXSortNum) + 1;
            //int MaxUID1 = int.Parse(MaxUID) + 1;
            for (int i = 0; i < Num; i++)
            {

                DDLNext.Items.Insert(i, (i + 1).ToString());
            }
          
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable();

            string SQLString = "PID,LayerNum,UpperWID,SortNum,PriceID,ItemName,Unit,ItemKind,LastCNumber,Notes,CEdition";
          
            string SQLUpdateSort;
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
           

            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();
      

            string TopWBS = DDLTop.SelectedValue;
            string Next = DDLNext.SelectedValue;
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxItemName.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxNotes.Text));
            int Number = 0;

            bool output = int.TryParse(TxQuantity.Text, out Number);
            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                DataTableDr["LayerNum"] = DDLLayer.SelectedValue;
                DataTableDr["UpperWID"] = DDLTop.SelectedValue;
                DataTableDr["SortNum"] = DDLNext.SelectedValue;
                DataTableDr["Unit"] = DDL_Unit.SelectedValue;
                DataTableDr["ItemName"] = ItemName;
                DataTableDr["LastCNumber"] = Number;
                DataTableDr["ItemKind"] = DDL_ItemKind.SelectedValue;
                DataTableDr["PriceId"] = Session["thisID"].ToString();
                DataTableDr["Notes"] = Notes;
                DataTableDr["CEdition"] = LbEdition.Text;

                //SortNum = int.Parse(DDLNext.SelectedValue);
                DataTableBox.Rows.Add(DataTableDr);
            #endregion


                SQLUpdateSort = "update CBudget_WBS set sortnum=SortNum+1 where LayerNum=" + DDLLayer.SelectedValue + " and UpperWID=" + DDLTop.SelectedValue + " and SortNum >=" + DDLNext.SelectedValue + "";
                WebModel.SQLAction(database, SQLUpdateSort);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        //Insert CBudget_Change_Detail
        protected DataTable GetDataDetail()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox1 = new DataTable();
            string SQLDetail = "PID,CWID,CEdition,Response,Reason";
            foreach (string DataName in SQLDetail.Split(','))
            {
                DataTableBox1.Columns.Add(DataName, typeof(string));
            }
            DataRow DTDr = DataTableBox1.NewRow();
            if (Session["ProjectCode"] != null)
            {
                DTDr["PID"] = Session["ProjectCode"].ToString();
                DTDr["CWID"] = WebModel.MaxID(database, "CBudget_WBS")-1;
                DTDr["CEdition"] = LbEdition.Text;
                DTDr["Response"] = DDLResponse.SelectedValue;
                DTDr["Reason"] = DDLReason.SelectedValue;
                DataTableBox1.Rows.Add(DTDr);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            
            return DataTableBox1;

        }
        //javascript 動作
        protected static void AjaxMsg(UpdatePanel id, string str)
        {
            ScriptManager.RegisterStartupScript(id, id.GetType(), "edit", str, true);
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            string database = Session["DatabaseName"].ToString();
            string ErrorString="";
            ErrorString += (DDLLayer.SelectedValue) == "0" ? "請輸入階層!!\\n" : "";
            ErrorString += (DDL_ItemKind.SelectedValue) == "0" ? "請輸入工項類型!!\\n" : "";
            ErrorString += (DDLTop.SelectedValue) == "0" ? "請輸入上層工項!!\\n" : "";
            ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";
         //確認是否全選
                if (ErrorString == "")
                {
                    //ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "submit", "ShowLoading()");
                  string result= WebModel.SaveAction(database, "CBudget_WBS", GetDataBox());
                 string result1= WebModel.SaveAction(database, "CBudget_Change_Detail", GetDataDetail());
                    bool result2 = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                    Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_LinkButton1').click();</script>");
                    if (result == "1" && result1 == "1")
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

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }

        }

        protected void TxItemName_TextChanged(object sender, EventArgs e)
        {
            Session["ItemName"] = null;
            Session["Notes"] = null;
            Session["Quantity"] = null;
        }
    }
}