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
    public partial class BidJointE : System.Web.UI.Page
    {
        string add_SQLString = "bid,FID,JBItem,JBPrice";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (Session["Bid"] !=null)
            {
            SqlDataSource1.SelectCommand = "SELECT Bid_Joint.Fid,Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID where Bid_Joint.bid= " + Session["Bid"].ToString() + "";
            
            }SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = "SELECT * from FirmM";
        }
        protected void LBtn_Add_Click(object sender, EventArgs e)
        {
            if ((Panel1.Visible == true))
            { Panel1.Visible = false; }
            else { Panel1.Visible = true; }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Update")
            {
                string JBItem = ((TextBox)GridView1.Rows[ID_class].FindControl("JBItem")).Text.Trim();
                string JBPrice = Convert.ToDecimal(((TextBox)GridView1.Rows[ID_class].FindControl("JBPrice")).Text).ToString("N0").Trim();
               
                DropDownList DDL = (DropDownList)GridView1.Rows[ID_class].FindControl("Name");

                GridView1.DataSourceID = "SqlDataSource1";

                SqlDataSource1.UpdateCommand = "Update Bid_Joint SET JBItem='" + JBItem + "', JBPrice='" + decimal.Parse(JBPrice) + "', FID=" + DDL.SelectedValue + " FROM Bid_Joint  where JBID=@JBID";

            }
            if (e.CommandName == "delete")
            {
                SqlDataSource1.DeleteCommand = "delete Bid_Joint WHERE [JBID] = @JBID";
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label JBPrice = (Label)e.Row.FindControl("JBPrice");
                //TextBox JBPrice = (TextBox)e.Row.FindControl("JBPrice1");
                //JBPrice.Text = Convert.ToDecimal(JBPrice.Text).ToString("N0");
            }

        }
         //取得建入資料
         protected DataTable GetDataBox_add()
         {

             DataTable DataTableBox = new DataTable();

             foreach (string DataName in add_SQLString.Split(','))
             {
                 DataTableBox.Columns.Add(DataName, typeof(string));
             }


             //後台功能，必需要有的欄位名稱               

             DataRow DataTableDr = DataTableBox.NewRow();

             #region 內容設定
             if (Session["bid"] != null)
             {
                 DataTableDr["bid"] = Session["bid"].ToString();
                 DataTableDr["FID"] = DropDownList9.SelectedItem.Value;                 
                 DataTableDr["JBItem"] = TxJBItem.Text;
                 DataTableDr["JBPrice"] = TxJBPrice.Text;
              


                 DataTableBox.Rows.Add(DataTableDr);
             #endregion


             }
             else
             {
                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
             }
             return DataTableBox;
         }
      
       
        protected void add_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ErrorString = "";
            string _TableNameadd = "Bid_Joint";
            //檢查標題文字
            ErrorString += (TxJBItem.Text) == string.Empty ? "共同投標項目請填入!!\\n" : "";
            ErrorString += (TxJBPrice.Text) == string.Empty ? "共同投標金額請填入!!\\n" : "";



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

                    WebModel.SaveAction_BID(database, _TableNameadd, GetDataBox_add());

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    GridView1.DataBind();
                    TxJBItem.Text = "";
                    TxJBPrice.Text = "";
                }
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }
    }
}