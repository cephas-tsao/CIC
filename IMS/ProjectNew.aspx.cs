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
    public partial class ProjectNew : System.Web.UI.Page
    {
        string _TableName = "ProjectM0";
        string ErrorString = "";
        string SQLString = "ProjectCode,ProjectName,ProjectNickname,ProjectStatus,Note,FromBid,CodeName";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                // CreateDropDownList(); //建立下拉選項
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from BidM0 where ProjectCode='' ";
                DropDownList1.DataSourceID = "SqlDataSource1";
                DropDownList1.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DropDownList1.Items.Insert(0, LI);
                DropDownList1.SelectedIndex = 0;
               
            }
          
          
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList1.SelectedValue == "1"))
            {
                Pnl_1.Visible = true;
                Pnl_2.Visible = false;
            }
            else if ((RadioButtonList1.SelectedValue == "2"))
            {
                Pnl_1.Visible = false;
                Pnl_2.Visible = true;
            }
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            ErrorString += (TxProjectCode1.Text) == string.Empty ? "專案(工程)編號請填入!!\\n" : "";
            ErrorString += (TxProjectName1.Text) == string.Empty ? "專案(工程)名稱請填入!!\\n" : "";
            //ErrorString += (TxProjectNickname1.Text) == string.Empty ? "專案(工程)簡稱請填入!!\\n" : "";



            //確認是否全選
            if (ErrorString == "")
            {


               string result=WebModel.SaveAction_pro(database, _TableName, GetDataBox(), Session["ProjectCode"].ToString());
               if (result != "0")
               {

                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);

                   TxProjectCode1.Text = "";
                   TxProjectName1.Text = "";
                   TxProjectNickname1.Text = "";
                   TxNote1.Text = "";
               }
                else
               {
                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);

               }
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定


            DataTableDr["FromBid"] = Session["bid"];
            DataTableDr["ProjectCode"] = TxProjectCode1.Text;
            DataTableDr["ProjectName"] = TxProjectName1.Text;
            DataTableDr["ProjectNickname"] = TxProjectNickname1.Text;
            DataTableDr["Note"] = TxNote1.Text;
            DataTableDr["CodeName"] = TxProjectCode1.Text + "-" + TxProjectName1.Text;
            Session["ProjectCode"] = TxProjectCode1.Text;
            DataTableBox.Rows.Add(DataTableDr);
            #endregion

            return DataTableBox;
        }
        //儲存資料
        protected void SaveAction1(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字
            ErrorString += (DropDownList1.SelectedIndex) == 0 ? "標案請選擇!!\\n" : "";
            ErrorString += (TxProjectCode.Text) == string.Empty ? "專案(工程)編號請填入!!\\n" : "";
            ErrorString += (TxProjectName.Text) == string.Empty ? "專案(工程)名稱請填入!!\\n" : "";
            //ErrorString += (TxProjectNickname.Text) == string.Empty ? "專案(工程)簡稱請填入!!\\n" : "";



            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(Session["bid"].ToString()) == false)
                    {

                      string result=  WebModel.SaveAction_pro(database, _TableName, GetDataBox1(), Session["ProjectCode"].ToString());
                      if (result!="0")
                        {                       
                        string SQLPId = "Select MAX(PID) as pid from CBudget_WBS";
                        int PID =int.Parse(WebModel.SItemName(database, SQLPId, "pid"))+1;
                        string SQLUpdateWBS = "INSERT INTO CBudget_WBS (PID,LayerCode,LayerNum,UpperWID,SortNum,ItemOrder,ItemName,Unit,ItemKind,CNumber,order_Num) SELECT " + PID + " as PID ,LayerCode,LayerNum,UpperUID as UpperWID,SortNum,ItemOrder,ItemName,Unit,ItemKind,Number as CNumber,order_Num FROM Bid_WBS where bid=" + Session["Bid"].ToString();
                        //bool result1 = WebModel.SQLAction(database, SQLUpdateWBS);
                        string SQLUpdateResource = "INSERT INTO Pro_Resource (PID,ItemName,Unit,Code,Complex,AnaNumber,CPrice,ItemKind) SELECT " + PID + " as PID ,ItemName,Unit,Code,Complex,AnaNumber,Price as CPrice,ItemKind FROM Bid_Library where bid=" + Session["Bid"].ToString();
                        //bool result2 = WebModel.SQLAction(database, SQLUpdateResource);
                        bool result3 = CBudgetDisp.Transfer_PriceIDtoWBS(database, Session["Bid"].ToString());

                          ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                      }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }
                    }
                    else
                    {
                    bool result=  WebModel.EditAction_pro(database, _TableName, Session["bid"].ToString(), GetDataBox1());
                    if (result)
                        {
                            string SQLPId = "Select MAX(PID) as pid from CBudget_WBS";
                            int PID = int.Parse(WebModel.SItemName(database, SQLPId, "pid")) + 1;
                            string SQLUpdateWBS = "INSERT INTO CBudget_WBS (Temp_id,PID,LayerCode,LayerNum,UpperWID,SortNum,ItemOrder,ItemName,Unit,ItemKind,CNumber,order_Num) SELECT UID," + PID + " as PID ,LayerCode,LayerNum,UpperUID as UpperWID,SortNum,ItemOrder,ItemName,Unit,ItemKind,Number as CNumber,order_Num FROM Bid_WBS where bid=" + Session["Bid"].ToString();
                            bool result1 = WebModel.SQLAction(database, SQLUpdateWBS);
                            string SQLUpdateResource = "INSERT INTO Pro_Resource (Temp_id,PID,ItemName,Unit,Code,Complex,AnaNumber,CPrice,ItemKind) SELECT PriceID," + PID + " as PID ,ItemName,Unit,Code,Complex,AnaNumber,Price as CPrice,ItemKind FROM Bid_Library where bid=" + Session["Bid"].ToString();
                            //bool result2 = WebModel.SQLAction(database, SQLUpdateResource);
                            bool result3 = CBudgetDisp.Transfer_PriceIDtoWBS(database, Session["Bid"].ToString());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改失敗');", true);
                        }
                    }
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        //取得建入資料
        protected DataTable GetDataBox1()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["bid"] != null)
            {

                DataTableDr["FromBid"] = Session["bid"];
                DataTableDr["ProjectCode"] = TxProjectCode.Text;
                DataTableDr["ProjectName"] = TxProjectName.Text;
                DataTableDr["ProjectNickname"] = TxProjectNickname.Text;
                DataTableDr["Note"] = TxNote.Text;
                DataTableDr["CodeName"] = TxProjectCode.Text + "-" + TxProjectName.Text;
                Session["ProjectCode"] = TxProjectCode.Text;
                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

                string checkSQL = "Select * from ProjectM0 where ProjectName='" + TxProjectName.Text.Trim()+"'";
                bool result = WebModel.SQLAction(database, checkSQL);
                if (result)
                {

                    return true;
                }
                else
                {

                    return false;
                }

            }
            return false;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxProjectCode.Text = "";
            TxProjectName.Text = "";
            TxProjectNickname.Text = "";
            TxNote.Text = "";
            Session["bid"] = DropDownList1.SelectedItem.Value;

            //Load_Content();
        }
        protected void Load_Content()
        {
            if (DropDownList1.SelectedItem.Value != "0")
            {
                Session["bid"] = DropDownList1.SelectedItem.Value;
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        TxProjectCode.Text = row["ProjectCode"].ToString();
                        TxProjectName.Text = row["ProjectName"].ToString();
                        TxProjectNickname.Text = row["ProjectNickname"].ToString();
                        TxNote.Text = row["Note"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxProjectCode1.Text = "";
            TxProjectName1.Text = "";
            TxProjectNickname1.Text = "";
            TxNote1.Text = "";
        }

        protected void BtnClear1_Click(object sender, EventArgs e)
        {
            TxProjectCode.Text = "";
            TxProjectName.Text = "";
            TxProjectNickname.Text = "";
            TxNote.Text = "";
        }
    }
}