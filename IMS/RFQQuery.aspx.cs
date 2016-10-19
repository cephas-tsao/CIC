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
    public partial class RFQQuery : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (SystemSet.GetRequestSet("RFQ_Code") != "")
            {
                SqlDataSource1.SelectCommand = "SELECT [Name], [Type], [Path], [UID] FROM [RFQ_File] where RFQ_Code ='" + SystemSet.GetRequestSet("RFQ_Code") + "' ORDER BY [UID]";
            }
            Loadcontent();
        }
        protected void Loadcontent()
        {
            string database = Session["DatabaseName"].ToString();
            string priceid = SystemSet.GetRequestSet("PriceID");
            if (SystemSet.GetRequestSet("RFQ_Code") != "")
            {
                string SQLString = "select DISTINCT RFQ_Code,Name,ReplyDate,Warranty,Location,WorkManDep,WorkManName,Notes from [RFQ] where RFQ_Code='" + SystemSet.GetRequestSet("RFQ_Code") + "'";//left join RFQ_Material c  on b.PriceID=c.PriceID
                string SQLSelect = "select a.Name,b.*,c.*,d.*,e.BID,e.BidName from FirmM a left join RFQ b on a.UID=b.FirmID left join RFQ_Material c on b.FirmID = c.FirmID left join Bid_Library d on c.RFQ_Code=d.RFQ_Code left join BidM0 e on d.BID=e.BID where b.RFQ_Code='" + SystemSet.GetRequestSet("RFQ_Code") + "' and c.RFQ_Code='" + SystemSet.GetRequestSet("RFQ_Code") + "' and c.PriceID='" + SystemSet.GetRequestSet("PriceID") + "' and d.PriceID='" + SystemSet.GetRequestSet("PriceID") + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQLSelect);
            
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        RFQ_Code.Text = row["RFQ_Code"].ToString();
                        LbName.Text = row["Name"].ToString();
                        ReplyDate.Text = row["ReplyDate"].ToString();
                        Warranty.Text = row["Warranty"].ToString();
                        Location.Text = row["Location"].ToString();
                        WorkManName.Text = row["WorkManName"].ToString();
                        Notes.Text = row["Notes"].ToString();

                    }

                    //if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                    //{
                    //    foreach (DataRow row in DataTableBox1.Rows)
                    //    {

                    //        LbName.Text = row["Name"].ToString();
                    //        ExpiretionDate.Text = row["ExpiretionDate"].ToString();
                    //        ReplyDate.Text = row["ReplyDate"].ToString();
                    //        Warranty.Text = row["Warranty"].ToString();
                    //        Location.Text = row["Location"].ToString();
                    //        WorkManName.Text = row["WorkManName"].ToString();
                    //        Notes.Text = row["Notes"].ToString();

                    //    }
                    //}
                    Repeater1.DataSource = DataTableBox1;
                    Repeater1.DataBind();
                    Session["DataTable"] = DataTableBox1;
                }
            }
        }
        int i = 0;
       
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label LbName = (Label)e.Item.FindControl("LbName");
                Label ExpiretionDate = (Label)e.Item.FindControl("ExpiretionDate");
                Label QuoteNY = (Label)e.Item.FindControl("QuoteNY");
                Label DiscountPercent = (Label)e.Item.FindControl("DiscountPercent");
                Label TotalPrice = (Label)e.Item.FindControl("TotalPrice");
                Label Tax = (Label)e.Item.FindControl("Tax");
                Label BidName = (Label)e.Item.FindControl("BidName");
                Label PriceID = (Label)e.Item.FindControl("PriceID");
                Label ItemName = (Label)e.Item.FindControl("ItemName");
                Label Unit = (Label)e.Item.FindControl("Unit");
                Label Amount = (Label)e.Item.FindControl("Amount");
                Label UnitPrice = (Label)e.Item.FindControl("UnitPrice");
                Label DiscountPrice = (Label)e.Item.FindControl("DiscountPrice");
                Label ComplexPrice = (Label)e.Item.FindControl("ComplexPrice");
                Label ClearWay = (Label)e.Item.FindControl("ClearWay");
                Label Explan = (Label)e.Item.FindControl("Explan");
                Label Note = (Label)e.Item.FindControl("Note");
                Label Quatation = (Label)e.Item.FindControl("Quatation");


                LbName.Text = vsDr["Name"].ToString();
                ExpiretionDate.Text = vsDr["ExpiretionDate"].ToString();
                QuoteNY.Text = vsDr["QuoteNY"].ToString() =="1"?"是":"否";
                if (vsDr["DiscountPercent"].ToString() !="")
                {
                    DiscountPercent.Text = vsDr["DiscountPercent"].ToString();
                }
                else if (vsDr["DiscountTotal"].ToString() != "")
                {
                    DiscountPercent.Text = vsDr["DiscountPercent"].ToString();
                }
                TotalPrice.Text = vsDr["TotalPrice"].ToString() !=""? decimal.Parse(vsDr["TotalPrice"].ToString()).ToString("N0"):"";
                Tax.Text = vsDr["Tax"].ToString();
                BidName.Text = vsDr["BidName"].ToString();
                PriceID.Text = vsDr["Code"].ToString();
                ItemName.Text = vsDr["ItemName"].ToString();
                Unit.Text = vsDr["Unit"].ToString();
                Amount.Text = vsDr["Amount"].ToString();
                UnitPrice.Text = vsDr["UnitPrice"].ToString();
                DiscountPrice.Text = vsDr["DiscountPrice"].ToString();
                ComplexPrice.Text = vsDr["ComplexPrice"].ToString() !=""?decimal.Parse(vsDr["ComplexPrice"].ToString()).ToString("N0"):"";
                ClearWay.Text = vsDr["ClearWay"].ToString();
                Explan.Text = vsDr["Explan"].ToString();
                Note.Text = vsDr["Note"].ToString();
                //for (int i = 1; i < Repeater1.Items.Count + 1; i++)
                //{
                    Quatation.Text = (i +1).ToString();
                //}

                    i++;
            }
          
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView5.PageSize;
            if (e.CommandName == "DownLoad")
            {

                int UID = (int)GridView5.DataKeys[ID_class].Value;

                Label Path = (Label)GridView5.Rows[ID_class].FindControl("Path");
                Button DownLoad = (Button)GridView5.Rows[ID_class].FindControl("DownLoad");
                if (Path != null && Path.Text != "")
                {
                    string[] name = Path.Text.Split('_');
                    string realname = name[1];

                    Response.AppendHeader("content-disposition", "attachment; filename=" + realname);
                    Response.TransmitFile(Path.Text);
                    Response.End();
                }
            }
        }
    }
}