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
    public partial class ENumberBD1 : System.Web.UI.Page
    {
        protected string CWID = "";
        string SQLStringEBg = "Select  *  from EBudget_WBS where EWID=" + SystemSet.GetRequestSet("CWid") + "";
        string SQLStringCBg = "";
        string ErrorString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CWID = SystemSet.GetRequestSet("CWid");
            string database = Session["DatabaseName"].ToString();
            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                Session["DataTable"] = null;
                string CWID1 = WebModel.SItemName(database, SQLStringEBg, "CWID");
                SQLStringCBg = "Select  *  from CBudget_WBS where CWID=" + CWID1 + "";
                LbCNumber.Text = WebModel.SItemName(database, SQLStringCBg, "CNumber");

                string SQLselect = "Select [PID],[LayerCode],[LayerNum],[UpperWID],[SortNum],[ItemOrder],[ItemName],[Unit],[ItemKind],[ENumber],[EUnitPrice],[ExecuteKind],[EEdition],[ResourceCode] from EBudget_WBS where pid=" + Session["ProjectCode"].ToString() + " and UpperWID=" + CWID;
                DataTable dt = WebModel.LoadSetContentData(database, SQLselect);
                Session["DataTable"] = dt;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            LoadContent();
            if (Session["DataTable"] != null)
            {
                Repeater1.DataSource = (DataTable)Session["DataTable"];
            }
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLStringEBg);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {
                  
                    LbItemOrder.Text = row["ItemOrder"].ToString();
                    LbUPItemName.Text = row["ItemName"].ToString();
                    LbUPUnit.Text = row["Unit"].ToString();
                    LbENumber.Text = row["ENumber"].ToString();
                    //ExecuteKind = row["ExecuteKind"].ToString();
                    LbPrice.Text = row["EUnitPrice"].ToString();
                }

            }
        }
     

        protected void ImgAdd_Click(object sender, ImageClickEventArgs e)
        {
            
            DataTable DataTableBox = (DataTable)Session["DataTable"];
            DataTableBox.Rows.Clear();
            //if (Session["DataTable"] != null)
            //{
            //    DataTableBox = (DataTable)Session["DataTable"];
            //}
            //if (DataTableBox.Rows.Count == 0)
            //{

            //    DataTableBox = GetDataBox(0);
            //}
            //else
            //{
            //    DataTableBox = (DataTable)Session["DataTable"];
            //}
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    TextBox TxItemName = (TextBox)item.FindControl("TxItemName");
                    Label DDLUnit = (Label)item.FindControl("DDLUnit");
                    TextBox TxQuantity = (TextBox)item.FindControl("TxQuantity");
                    DataRow Row = DataTableBox.NewRow();

                    Row["PID"] = Session["ProjectCode"].ToString();
                    Row["ItemName"] = TxItemName.Text;
                    Row["Unit"] = DDLUnit.Text;
                    Row["ENumber"] = TxQuantity.Text !=""?decimal.Parse(TxQuantity.Text):0;
                    Row["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;

                    DataTableBox.Rows.Add(Row);
                }

            }
            //DataTable DataTableBox = (DataTable)Session["DataTable"];
            Session["DataTable"] = DataTableBox;
            DataRow newRow = DataTableBox.NewRow();
            
            DataTableBox = GetDataBox(0);
          
            Repeater1.DataSource = DataTableBox;
            //Repeater1.DataSource = Session["DataTable"];
            Repeater1.DataBind();
        }
        //新增空白資料
        protected DataTable GetDataBox(int status)
        {
           
            string SQLString = "Pid,ItemKind,ItemName,Unit,WorkRate,ENumber,EUnitPrice,UpperWID,SortNum,ExecuteKind,ResourceNY,ResourceCode,EEdition";
            DataTable DataTableBox = new DataTable();
            DataTableBox = (DataTable)Session["DataTable"];

            if (DataTableBox.Rows.Count != 0)
            {

                DataTableBox = (DataTable)Session["DataTable"];
            }
            else if (DataTableBox.Columns.Count==0)
            {
                foreach (string DataName in SQLString.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }
            }
          
          
            //後台功能，必需要有的欄位名稱               


            #region 內容設定


            if (status == 0)
            {

                DataRow DataTableDr = DataTableBox.NewRow();

                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                DataTableDr["ItemKind"] = "";
                DataTableDr["ItemName"] = LbUPItemName.Text;
                DataTableDr["Unit"] = LbUPUnit.Text;
                DataTableDr["ENumber"] = 0;
                //DataTableDr["WorkRate"] = "";
                DataTableDr["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;

                DataTableBox.Rows.Add(DataTableDr);
                Session["DataTable"] = DataTableBox;
            }
            #endregion

            return DataTableBox;
        }
      

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            DataTable DataTableBox = (DataTable)Session["DataTable"];
            if (e.CommandName == "Delete")
            {
                //DataTable DataTableBox = (DataTable)Session["DataTable"];

                DataTableBox.Rows.RemoveAt(ID_class);

                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();


            }
            if (e.CommandName == "Up")
            {
                DataTableBox.Rows.Clear();
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        TextBox TxItemName = (TextBox)item.FindControl("TxItemName");
                        DropDownList DDLUnit = (DropDownList)item.FindControl("DDLUnit");
                        TextBox TxQuantity = (TextBox)item.FindControl("TxQuantity");
                        DataRow Row = DataTableBox.NewRow();

                        Row["PID"] = Session["ProjectCode"].ToString();
                        Row["ItemName"] = TxItemName.Text;
                        Row["Unit"] = DDLUnit.SelectedValue;
                        Row["ENumber"] = TxQuantity.Text;
                        Row["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;

                        DataTableBox.Rows.Add(Row);
                    }

                }
                //DataTable DataTableBox = (DataTable)Session["DataTable"];

                DataRow newRow = DataTableBox.NewRow();


                DataRow rows = DataTableBox.Rows[ID_class];
                newRow.ItemArray = rows.ItemArray;
                DataTableBox.Rows.RemoveAt(ID_class);

                DataTableBox.Rows.InsertAt(newRow, ID_class - 1);

                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();
            }
            if (e.CommandName == "Down")
            {
                //DataTable DataTableBox = (DataTable)Session["DataTable"];
                DataTableBox.Rows.Clear();
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        TextBox TxItemName = (TextBox)item.FindControl("TxItemName");
                        DropDownList DDLUnit = (DropDownList)item.FindControl("DDLUnit");
                        TextBox TxQuantity = (TextBox)item.FindControl("TxQuantity");
                        DataRow Row = DataTableBox.NewRow();

                        Row["PID"] = Session["ProjectCode"].ToString();
                        Row["ItemName"] = TxItemName.Text;
                        Row["Unit"] = DDLUnit.SelectedValue;
                        Row["ENumber"] = TxQuantity.Text;
                        Row["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;

                        DataTableBox.Rows.Add(Row);
                    }

                }
                DataRow newRow = DataTableBox.NewRow();


                DataRow rows = DataTableBox.Rows[ID_class];
                newRow.ItemArray = rows.ItemArray;
                DataTableBox.Rows.RemoveAt(ID_class);

                DataTableBox.Rows.InsertAt(newRow, ID_class + 1);

                Repeater1.DataSource = DataTableBox;
                Session["DataTable"] = DataTableBox;
                Repeater1.DataBind();
            }
        }
    
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.Item.ItemIndex);
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                ImageButton ImgUP = (ImageButton)e.Item.FindControl("ImgUP");
                ImageButton ImgDown = (ImageButton)e.Item.FindControl("ImgDown");
                if (ID_class == 0)
                {
                    ImgUP.Visible = false;
                    ImgDown.Visible = true;
                }
                if (e.Item.ItemIndex != 0 && e.Item.ItemIndex != Repeater1.Items.Count - 1)
                {
                    ImgUP.Visible = true;
                    ImgDown.Visible = true;
                }
                if (e.Item.ItemIndex == Repeater1.Items.Count - 1)
                {
                    ImgUP.Visible = true;
                    ImgDown.Visible = false;
                }
            }
        }
        protected void BtnDivide_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ExecuteKind = "";
            string ResourceNY = "";
            string LayerNum = "";
            int count = 1;
            string SQLSelect = "";
            decimal EUnitPrice = 0;
            if (CWID != "")
            {
                string SQLDel = "Delete EBudget_WBS where UpperWID=" + CWID;
                bool result = WebModel.SQLAction(database, SQLDel);
                SQLSelect = "Select * from EBudget_WBS where EWID=" + CWID;
                ExecuteKind = WebModel.SItemName(database, SQLSelect, "ExecuteKind");
                ResourceNY = WebModel.SItemName(database, SQLSelect, "ResourceNY");
                LayerNum = WebModel.SItemName(database, SQLSelect, "LayerNum");
                EUnitPrice = WebModel.SItemName(database, SQLSelect, "EUnitPrice") != "" ? decimal.Parse(WebModel.SItemName(database, SQLSelect, "EUnitPrice")) : 0;
            }
            if (Repeater1.Items.Count == 0)
            {
                string SQLDel = "Delete EBudget_WBS  where UpperWID=" + CWID;
                bool result = WebModel.SQLAction(database, SQLDel);

                string SQLUpdate = "Update EBudget_WBS set ExecuteKind=NULL,ResourceNY=1 where EWID=" + CWID + "";
                bool result1 = WebModel.SQLAction(database, SQLUpdate);

            }
            else
            {
                string SQLDel = "Delete EBudget_WBS  where UpperWID=" + CWID;
                bool result = WebModel.SQLAction(database, SQLDel);
               
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        TextBox TxItemName = (TextBox)item.FindControl("TxItemName");
                        Label DDLUnit = (Label)item.FindControl("DDLUnit");
                        TextBox TxQuantity = (TextBox)item.FindControl("TxQuantity");


                        ErrorString += (TxQuantity.Text) == string.Empty ? "請輸入工項類型!!\\n" : "";

                        ErrorString += (TxItemName.Text) == string.Empty ? "請輸入名稱!!\\n" : "";


                        //確認是否全選
                        if (ErrorString == "")
                        {
                            DataTable DataTableBox1 = GetDataBox(1);
                            DataTableBox1.Rows.Clear();
                            DataRow DataTableDr = DataTableBox1.NewRow();
                            int maxid = WebModel.MaxID(database, "EBudget_WBS");

                            DataTableDr["pid"] = Session["ProjectCode"].ToString();
                            DataTableDr["ItemKind"] = "workitem";
                            DataTableDr["ItemName"] = TxItemName.Text;
                            DataTableDr["Unit"] = DDLUnit.Text;
                            DataTableDr["ENumber"] = decimal.Parse(TxQuantity.Text);
                            //DataTableDr["WorkRate"] = "";
                            DataTableDr["UpperWID"] = CWID;
                            DataTableDr["SortNum"] = count;
                            DataTableDr["LayerNum"] = int.Parse(LayerNum) + 1;
                            DataTableDr["ExecuteKind"] = "NK";
                            //DataTableDr["ResourceNY"] = 0;
                            DataTableDr["EUnitPrice"] = EUnitPrice;
                            DataTableDr["EEdition"] = LbVersion.Text != "" ? int.Parse(LbVersion.Text) : 0;
                            DataTableDr["ResourceCode"] = Session["ProjectCode"].ToString() + "_" + maxid + "";

                            count++;
                            DataTableBox1.Rows.Add(DataTableDr);
                            string result2 = WebModel.SaveAction(database, "EBudget_WBS", DataTableBox1);
                            string SQLUpdate = "Update EBudget_WBS set ExecuteKind='NP',ResourceNY=1 where  EWID=" + CWID;
                            bool result1 = WebModel.SQLAction(database, SQLUpdate);
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
                        }

                    }

                }
                string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
                string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
                string UpdateItemOrder;
                //if (CBudgetNumType == "0")
                //{
                    bool result3 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                    UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=0";
                    bool result4 = WebModel.SQLAction(database, UpdateItemOrder);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
                //}
                //else if (CBudgetNumType == "1")
                //{
                //    bool result2 = DAL.LayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());

                //    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
                //}
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
            }
        }

    }
}