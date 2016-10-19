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
    public partial class BidDurationV : System.Web.UI.Page
    {
    

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                LoadData();
               
            }
             string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
             SqlDataSource1.ConnectionString = datasource;
             SqlDataSource1.SelectCommand = "Select * from BidM_DurationPunish where BID=" + Session["bid"].ToString() + "";
             Repeater1.DataBind();
        }

        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null || Session["bid"] == null)
            {
                Response.Redirect("~/login.aspx");
            }

            string SQLString = "select * from BidM3 where Bid=" + Session["bid"].ToString() + "";
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                //Repeater1.DataSource = DataTableBox;
                //Repeater1.DataBind();
                this.finish.Style.Add("visibility", "Visible");
                this.duration.Style.Add("visibility", "Visible");

                foreach (DataRow row in DataTableBox.Rows  )
                {
                    LtStartDeadline.Text = row["StartDeadline"].ToString();
                    LtCompletionEscDeadline.Text = row["CompletionEscDeadline"].ToString() != "" ? "完工後" + row["CompletionEscDeadline"].ToString() + "天內提報" : "";
                    LtDelayEscDeadline.Text = row["DelayEscDeadline"].ToString() != "" ? "事件發生後" + row["DelayEscDeadline"].ToString() + "天內提報" : "";

                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                //finish.Visible = true;
                //duration.Visible = true;
              

                Literal LtStageName = (Literal)e.Item.FindControl("LtStageName");
                Literal LtDuration = (Literal)e.Item.FindControl("LtDuration");
                Literal LtPunish = (Literal)e.Item.FindControl("LtPunish");
                Literal LtNotes = (Literal)e.Item.FindControl("LtNotes");

                LtStageName.Text = vsDr["StageName"].ToString();
                LtDuration.Text = vsDr["Duration"].ToString();
                LtStageName.Text = vsDr["StageName"].ToString();
                LtDuration.Text = vsDr["Duration"].ToString();
                Session["bid"] = vsDr["BID"].ToString();

               

            }
        }
    }
}