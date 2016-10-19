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
    public partial class BidInfo11 : System.Web.UI.Page
    {
        string _TableName = "Bid_PreData";
        string ErrorString = "";
        string SQLString = "ForecastName,ForecastPrice,ForecastBiddingDate,Notes";
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "SELECT * FROM [Bid_PreData] where status =0 ORDER BY [UID] DESC";
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Delete")
            {
                SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView1.DataBind();
            }
            if (e.CommandName == "Update")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;

                TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlDataSource1.UpdateCommand = "UPDATE [Bid_PreData] SET [ForecastName] = @ForecastName, [ForecastPrice] = @ForecastPrice, [ForecastBiddingDate] = @ForecastBiddingDate, [Notes] = @Notes WHERE [UID] = @UID";
            }
            if (e.CommandName == "New")
            {
                //int ID_class = Convert.ToInt32(e.CommandArgument);
                //string ForecastName = ((TextBox)GridView1.Rows[ID_class].FindControl("ForecastName")).Text.Trim();
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                Session["UID"] = UID;
                OpenNewWindow("BidPreAdd.aspx");
            
            }
        }

     
        #region 新增投標廠商明細
        protected void add_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            //檢查標題文字
            ErrorString += (ForecastName.Text) == string.Empty ? "預估名稱請填入!!\\n" : "";
         


            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
             
                   // WebModel.SaveAction(database, _TableName, GetDataBox_add());

                SQLString = "insert into " + _TableName + " (ForecastName,ForecastPrice,ForecastBiddingDate,Notes,status) values(@ForecastName,@ForecastPrice,@ForecastBiddingDate,@Notes,@status)";
                       

                             string data = Utility.DBconnection.connect_string(database);
                             using (SqlConnection L_Conn = new SqlConnection(data))
                             {
                                 using (SqlCommand SQLAction = new SqlCommand(SQLString, L_Conn))
                                 {

                                     SQLAction.Parameters.Add("@ForecastName", System.Data.SqlDbType.VarChar).Value = ForecastName.Text;
                                     SQLAction.Parameters.Add("@ForecastPrice", System.Data.SqlDbType.VarChar).Value = ForecastPrice.Text;
                                     SQLAction.Parameters.Add("@ForecastBiddingDate", System.Data.SqlDbType.VarChar).Value = ForecastBiddingDate.Text;
                                     SQLAction.Parameters.Add("@Notes", System.Data.SqlDbType.VarChar).Value = Notes.Text;
                                     SQLAction.Parameters.Add("@status", System.Data.SqlDbType.VarChar).Value = 0;
                                     SQLAction.CommandType = CommandType.Text;
                                     L_Conn.Open();
                                     SQLAction.ExecuteNonQuery();

                                 }
                             }
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    GridView1.DataBind();
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    ForecastName.Text = "";
                    ForecastPrice.Text = "";
                    ForecastBiddingDate.Text = "";
                    Notes.Text = "";
              
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

       
        #endregion

        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=250,width=1050";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void New_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            ForecastName.Text = "";
            ForecastPrice.Text = "";
            ForecastBiddingDate.Text = "";
            Notes.Text = "";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
                {
                    Label LbForecastBiddingDate = (Label)e.Row.FindControl("LbForecastBiddingDate");
                    // TextBox TxForecastBiddingDate = (TextBox)e.Row.FindControl("LbForecastBiddingDate");

                    LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                }

            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
            //    {
            //        Label groupID = (Label)e.Row.FindControl("idgroup");
            //        LinkButton myLink = (LinkButton)e.Row.FindControl("groupLink");
            //        myLink.Attributes.Add("rel", groupID.Text);
            //    }
            //}
            //if (e.Row.RowType == DataControlRowType.DataRow  && e.Row.RowState == DataControlRowState.Edit)
            //{
            //    // ...
            //}
            //else if (e.Row.RowType == DataControlRowType.Footer && e.Row.RowState == DataControlRowState.Edit)
            //{
            //    // ...
            //}
        }
    }
}