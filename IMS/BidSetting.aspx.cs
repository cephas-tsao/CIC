using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using System.Data.SqlClient;

namespace IMS
{
    public partial class BidSetting : System.Web.UI.Page
    {
        string ErrorString = "";
        string _TableName = "BidPreItem";
        string SQLString = "ItemName,ResponseDept";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());

            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (RadioButtonList1.SelectedIndex)
            {
                case 0:
                    Pnl_PreItem.Visible = true;
                    Pnl_Foundation.Visible = false;
                    Pnl_Retaining.Visible = false;
                    break;
                case 1:
                    Pnl_PreItem.Visible = false;
                    Pnl_Foundation.Visible = true;
                    Pnl_Retaining.Visible = false;
                    break;
                case 2:
                    Pnl_PreItem.Visible = false;
                    Pnl_Foundation.Visible = false;
                    Pnl_Retaining.Visible = true;
                    break;
            }
            Session["option"]=RadioButtonList1.SelectedValue;
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字

            ErrorString += (DropDownList4.SelectedIndex) == 0 ? "承辦部門請選擇!!\\n" : "";
            ErrorString += (TxItemName.Text) == "" ? "項目名稱請填入!!\\n" : "";
          


            //確認是否全選
            if (ErrorString == "")
            {
               
                  

                        WebModel.SaveAction(database, _TableName, GetDataBox());
                        GridView1.DataBind();
                        DropDownList4.SelectedIndex = 0;
                        TxItemName.Text = "" ;
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);

                       
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
            //if (Session["bid"] != null)
            //{
                //DataTableDr["BID"] = Session["bid"].ToString();
                DataTableDr["ResponseDept"] = DropDownList4.SelectedItem.Value;
                DataTableDr["ItemName"] = TxItemName.Text;
              



                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            return DataTableBox;
        }
      
        protected void Search_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ItemName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
        

            #region 搜尋條件
            string SelectString = "";
            SelectString = (ItemName != "") ? "ItemName like '%" + ItemName + "%' " + DDL_Op1.SelectedValue + "" : "";
       
            if (ItemName == "")
            {
                if (DDL_Op1.SelectedValue == "and")
                {
                    SelectString += "";
                }
                else if (DDL_Op1.SelectedValue == "or")
                {
                    SelectString += "";
                }
                else if (DDL_Op1.SelectedValue == "and NOT")
                {
                    SelectString += "not";
                }
            }
         
            SelectString += (DropDownList5.SelectedItem.Value != "0") ? " ResponseDept = '" + DropDownList5.SelectedValue + "'" : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString : "";
            #endregion

            SqlDataSource2.SelectCommand += SelectString;
            GridView1.DataBind();            
           
        }

        protected void ALL_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();       
        }

        protected void Fd_Add_Click(object sender, EventArgs e)
        {
           
            ErrorString += (TxFoundationName.Text) == "" ? "基礎型式名稱請填入!!\\n" : "";

            string database = Session["DatabaseName"].ToString();
            string FoundationName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFoundationName.Text));
            string SQLString = "INSERT INTO Foundation ([FoundationName]) VALUES ('" + FoundationName + "')";
          
            if (ErrorString == "")
            {

                WebModel.SQLAction(database, SQLString);
                GridView2.DataBind();

                TxFoundationName.Text = "";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);

              
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void FdSearch_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFdSearch.Text));
            
            string SelectString = "";
            SelectString = (FdSearch != "") ? "FoundationName like '%" + FdSearch + "%' " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString : "";
          
            SqlDataSource4.SelectCommand += SelectString;
            GridView2.DataBind();            
        }

        protected void FdALL_Click(object sender, EventArgs e)
        {
            GridView2.DataBind();       
        }

        protected void BtRetaining_Click(object sender, EventArgs e)
        {
            ErrorString += (TxRetainingWall.Text) == "" ? "基礎型式名稱請填入!!\\n" : "";

            string database = Session["DatabaseName"].ToString();
            string Retaining = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetainingWall.Text));
            string SQLString = "INSERT INTO Retaining ([RetainingName]) VALUES ('" + Retaining + "')";
         
            //確認是否全選
            if (ErrorString == "")
            {

                WebModel.SQLAction(database, SQLString);
                GridView3.DataBind();

                TxRetainingWall.Text = "";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);


            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void BtRetainingSearch_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string Retaining = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxRetaining.Text));

            string SelectString = "";
            SelectString = (Retaining != "") ? "RetainingName like '%" + Retaining + "%' " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString : "";

            SqlDataSource3.SelectCommand += SelectString;
            GridView3.DataBind();            
        }

        protected void RetainingAll_Click(object sender, EventArgs e)
        {
            GridView3.DataBind();
        }
    }
}