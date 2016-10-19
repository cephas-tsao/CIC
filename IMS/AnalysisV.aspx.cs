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
    public partial class AnalysisV : System.Web.UI.Page
    {
        protected string ParentID;
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        string WUID = (SystemSet.GetRequestSet("UID") != "") ? SystemSet.GetRequestSet("UID") : "";

        protected void Page_Load(object sender, EventArgs e)
        {
             
            LoadContent();
           
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (WUID != "" && PriceID!="")
            {
                //SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on  a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where  a.ParentID=" + PriceID + "or b.PriceID= " + PriceID + " and c.PriceID=" +PriceID+ " and c.UID="+WUID+" and b.BID=" + Session["bid"].ToString() + " and a.WUID= "+WUID+"order by A.SortNum";
               // Select  DISTINCT a.SortNum,  *  from Bid_AnaRelation a left join Bid_Library  b on  a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=52 or b.PriceID=52 and b.BID=9 and c.PriceID=52 and c.UID=115 Order by A.SortNum
               // SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on  a.KidID=b.PriceID where a.ParentID=" + PriceID + " or b.PriceID=" + PriceID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
                SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
                //SqlDataSource1.SelectCommand = "select * from Bid_WBS a left join Bid_Library b on a.PriceID=b.PriceID left join Bid_AnaRelation c on b.PriceID=c.KidID where a.BID=" + Session["bid"].ToString() + " and a.PriceID=" + PriceID + " and a.UID=" + WUID + "order by A.SortNum";
            }
            else
            {

                //SqlDataSource1.SelectCommand = "select * from Bid_WBS a left join Bid_Library b on a.PriceID=b.PriceID left join Bid_AnaRelation c on b.PriceID=c.KidID where a.BID=9 and a.PriceID=52 " + ParentID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
                SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
            }
        }
        protected void LoadContent()
        {
               string database = Session["DatabaseName"].ToString();
               if (PriceID != "" && WUID == "")
               {
                   string SQLString = "Select  *  from  Bid_Library b  where PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";
                   DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                   if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                   {
                       foreach (DataRow row in DataTableBox.Rows)
                       {

                         
                           LbName.Text = row["ItemName"].ToString();
                           LbUnit.Text = row["Unit"].ToString();
                           LbCode.Text = row["Code"].ToString();
                           LbAnaNumber.Text = row["AnaNumber"].ToString();
                           ParentID = row["PriceID"].ToString();
                       }
                   }
               }
               else
               {
                   string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.UID='" + WUID + "'";
                   DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                   string Bid;
                   if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                   {
                       foreach (DataRow row in DataTableBox.Rows)
                       {
                           Bid = row["Bid"].ToString();
                           string SQL = "Select  *  from Bid_WBS Where bid=" +Bid;
                           DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQL);
                           int[] UID = new int[DataTableBox1.Rows.Count];
                           int[] UpperUID = new int[DataTableBox1.Rows.Count];
                           string[] ItemOrder = new string[DataTableBox1.Rows.Count];
                           if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                           {
                               int count = 0;
                               foreach (DataRow rows in DataTableBox1.Rows)
                               {
                                   UID[count] = int.Parse(rows["UID"].ToString());
                                   ItemOrder[count] = rows["ItemOrder"].ToString();
                                   if (rows["UpperUID"].ToString() == "")
                                   {
                                       UpperUID[count] = 0;
                                   }
                                   else
                                   {
                                       UpperUID[count] = int.Parse(rows["UpperUID"].ToString());
                                   }
                                   //UpperUID[count]=(row["UpperUID"]==null)?0:int.Parse(row["UpperUID"].ToString());
                                   count++;
                               }
                           }

                           //LbItemOrder.Text = row["ItemOrder"].ToString();
                           LbName.Text = row["ItemName"].ToString();
                           LbUnit.Text = row["Unit"].ToString();
                           LbCode.Text = row["Code"].ToString();
                           LbAnaNumber.Text = row["AnaNumber"].ToString();
                           ParentID = row["PriceID"].ToString();
                           LbItemOrder.Text = WebModel.gen_OrderCode(int.Parse(Session["uid"].ToString()), UID, UpperUID, ItemOrder);
                          
                       }
                   }
                   
               }
       
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Number = (Label)e.Row.FindControl("Number");              
                Label Price =(Label)e.Row.FindControl("Price");
                Label CPrice = (Label)e.Row.FindControl("CPrice");
                Label BPrice = (Label)e.Row.FindControl("BPrice");
                Label BCPrice = (Label)e.Row.FindControl("BCPrice");
                ImageButton Complex = (ImageButton)e.Row.FindControl("Complex");
                ImageButton Complex1 = (ImageButton)e.Row.FindControl("Complex");

                Number.Text = (Number.Text != "") ? Number.Text : "0";               
                Price.Text = (Price.Text != "") ? Price.Text : "0";
                BPrice.Text = (BPrice.Text != "") ? BPrice.Text : "0";
                CPrice.Text = Convert.ToString((int)double.Parse(Number.Text) * (int)double.Parse(Price.Text));
                BCPrice.Text = Convert.ToString((int)double.Parse(Number.Text) * (int)double.Parse(BPrice.Text));
      
           
            }
           
        }
        public void OpenNewWindow(string url)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=1000,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', '{1}');</script>", url, winFeatures));
        }
        //protected void Complex_Click(object sender, ImageClickEventArgs e)
        //{
        //    string UID = (SystemSet.GetRequestSet("UID") != "") ? SystemSet.GetRequestSet("uid") : "";
        //    ImageButton ImgAnalyst = (ImageButton)sender;
        //    //string tempID = ImgAnalyst.ID.Substring(10);
        //    Label UUID = (Label)GridView1.Rows[1].FindControl("UID");
        //    Session["uid"] = UUID.Text;
        //    OpenNewWindow("AnalysisV.aspx");
        //}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "select")
            {
              
                Label UUID = (Label)GridView1.Rows[ID_class].FindControl("UID");
                Label PriceID =(Label)GridView1.Rows[ID_class].FindControl("PriceID");
                Session["uid"] = UUID.Text;
                Session["PriceID"] = PriceID.Text;
                //OpenNewWindow("AnalysisV.aspx?PriceID=" + PriceID.Text+"");
                Response.Write("<script>window.open('AnalysisV.aspx?PriceID=" + PriceID.Text + "')</script>");
               
            }
        }
    }
}