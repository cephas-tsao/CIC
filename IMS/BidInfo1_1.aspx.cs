using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;
using Utility;

namespace IMS
{
    public partial class BidInfo1 : System.Web.UI.Page
    {
        string _TableName = "BidM0";
      
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
               
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from BidM0 ";       
               
            }

            
        }
        protected void Page_Init()
        {
            //設定SqlDataSource連線及Select命令
            sqlEmployees.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            sqlEmployees.SelectCommand = "Select * from BidM0 a left join  BidM1 b on a.bID = b.bid where BidName=@BidName";//

            Repeater1.DataSourceID = sqlEmployees.ID;

        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                   
            
                    TextBox ltName = (TextBox)e.Item.FindControl("ltName");
                    DropDownList DropDownList2 = (DropDownList)e.Item.FindControl("DropDownList2");
                    TextBox ltForecastPrice = (TextBox)e.Item.FindControl("ltForecastPrice");
                    TextBox ltForecastBiddingDate = (TextBox)e.Item.FindControl("ltForecastBiddingDate");
                    TextBox ltNotes = (TextBox)e.Item.FindControl("ltNotes");

                    foreach (string DataName in Unitlist.GetBid().Split(','))
                    {
                        DropDownList2.Items.Add(new ListItem(DataName));
                        DropDownList2.SelectedItem.Text = vsDr["Status"].ToString();

                    } 
                  
                    ltName.Text = vsDr["BidName"].ToString();
                    Session["bid"] = vsDr["BID"].ToString();
                    ltForecastPrice.Text = vsDr["ForecastPrice"].ToString();
                    ltForecastBiddingDate.Text = vsDr["ForecastBiddingDate"].ToString();
                    ltNotes.Text = vsDr["Notes"].ToString();                  
                 
                }
                
            }

     
   

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
            if (e.CommandName == "edit")
            {
                string ltName = ((TextBox)e.Item.FindControl("ltName")).Text;
                string bid = Session["BID"].ToString();
                string DropDownList2 = ((DropDownList)e.Item.FindControl("DropDownList2")).Text;
                string ltForecastPrice = ((TextBox)e.Item.FindControl("ltForecastPrice")).Text;
                string ltForecastBiddingDate = ((TextBox)e.Item.FindControl("ltForecastBiddingDate")).Text;
                string ltNotes = ((TextBox)e.Item.FindControl("ltNotes")).Text;
                SqlDataAdapter adp = new SqlDataAdapter("Update BidM0 set BidName= @BidName, Status=@Status where BId = @BId", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                SqlDataAdapter adp1 = new SqlDataAdapter("Update BidM1 set ForecastPrice=@ForecastPrice,ForecastBiddingDate=@ForecastBiddingDate,Notes=@Notes where BId = @BId", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                adp.SelectCommand.Parameters.AddWithValue("@BidName", ltName);
                adp.SelectCommand.Parameters.AddWithValue("@Status", DropDownList2);
                adp.SelectCommand.Parameters.AddWithValue("@Bid", bid);
                adp1.SelectCommand.Parameters.AddWithValue("@ForecastPrice", ltForecastPrice);
                adp1.SelectCommand.Parameters.AddWithValue("@ForecastBiddingDate", ltForecastBiddingDate);
                adp1.SelectCommand.Parameters.AddWithValue("@Notes", ltNotes);
                adp1.SelectCommand.Parameters.AddWithValue("@Bid", bid);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                adp1.Fill(ds);
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);
                Repeater1.DataBind();
               
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            if (DropDownList1.SelectedItem != null)
            {
                string bid = Session["BID"].ToString();
                string InString = "BID,BidName,Status," +
                                   "(select ForecastPrice from BidM1 where Bid =" + bid + ") as ForecastPrice," +
                                   "(select ForecastBiddingDate from BidM1 where Bid =" + bid + ") as ForecastBiddingDate," +
                                   "(select Notes from BidM1 where Bid =" + bid + ") as Notes";
                string SelectSQL = "select " + InString + " from " + _TableName + " where Bid=" + bid + "";

                DataTable DataTableBox = WebModel.LoadSetContentData(database,SelectSQL);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                   /// Repeater1.DataSource = DataTableBox;
                    Repeater1.DataBind();
                }
            }
        }
       
    }
}