using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class AnalysisQEdit : System.Web.UI.Page
    {
        protected string ParentID;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            LoadContent();

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on  a.KidID=b.PriceID where  a.ParentID=" + PriceID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
            }
            else if (ParentID != "")
            {
                SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
            }
            LoadTxCNumber();
            //Repeater1.DataSource = SqlDataSource1;
            //Repeater1.DataBind();
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ImgAnalyst = (ImageButton)sender;
          
            string tempID = ImgAnalyst.ID.Substring(11);
         
            Label UUID = (Label)Repeater1.Items[int.Parse(ImgAnalyst.CommandArgument)].FindControl("id");
            Label PriceID = (Label)Repeater1.Items[int.Parse(ImgAnalyst.CommandArgument)].FindControl("PriceID");
        
            Session["uid"] = UUID.Text;
            Session["PriceID"] = PriceID.Text;

            Response.Write("<script>window.open('AnalysisQEdit.aspx?PriceID=" + PriceID.Text + "','_blank')</script>");
         
        }
        protected void Button18_Click(object sender, EventArgs e)
        {
            Session["AddNew"] = "2";
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                OpenNewWindow("AddNewItem.aspx?PriceID=" + SystemSet.GetRequestSet("PriceID")+"", "1");
            }
            else if (SystemSet.GetRequestSet("UID") != "")
            {
                OpenNewWindow("AddNewItem.aspx?UID=" + SystemSet.GetRequestSet("UID") + "", "1");
            }
           
        }
        public void OpenNewWindow(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                string SQLString = "Select  *  from  Bid_Library where PriceID ='" + Session["PriceID"] + "'";
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
                if (Session["uid"] != null)
                {
                    string SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.UID='" + Session["uid"].ToString() + "'";
                    DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                    if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                    {
                        foreach (DataRow row in DataTableBox.Rows)
                        {

                            LbName.Text = row["ItemName"].ToString();
                            LbUnit.Text = row["Unit"].ToString();
                            LbCode.Text = row["Code"].ToString();
                            LbAnaNumber.Text = row["Number"].ToString();
                            ParentID = row["PriceID"].ToString();
                        }
                    }
                }
            }

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label id = (Label)e.Item.FindControl("id");
                Label UID = (Label)e.Item.FindControl("UID");
                Label LbKind = (Label)e.Item.FindControl("LbKind");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit1 = (Label)e.Item.FindControl("LbUnit1");
                Label LbCode1 = (Label)e.Item.FindControl("LbCode1");
                Label LbNumber = (Label)e.Item.FindControl("Number");
                TextBox TxCNumber = (TextBox)e.Item.FindControl("TxCNumber");
                Label LbNote = (Label)e.Item.FindControl("LbNote");
                Label PriceID = (Label)e.Item.FindControl("PriceID");
                ImageButton ImageButton8 = (ImageButton)e.Item.FindControl("ImageButton8");

                id.Text = vsDr["UID"].ToString();
                UID.Text = vsDr["SortNum"].ToString();
                //LbKind.Text = vsDr["StageName"].ToString();
                LbItemName.Text = vsDr["ItemName"].ToString();
                Session["bid"] = vsDr["BID"].ToString();
                LbUnit1.Text = vsDr["Unit"].ToString();
                LbCode1.Text = vsDr["Code"].ToString();
                LbNote.Text = vsDr["Notes"].ToString();
                TxCNumber.Text = vsDr["CNumber"].ToString();
                ImageButton8.Visible = (vsDr["Complex"].ToString() == "1") ? true : false;
                PriceID.Text = vsDr["PriceID"].ToString();
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //if (e.CommandName == "Update")
            //{


            //    //string PunishID = ((TextBox)e.Item.FindControl("PunishID")).Text.Trim();
            //    string StageName = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxStageName")).Text.Trim();
            //    string Duration = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxDuration")).Text.Trim();
            //    string Punish = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxPunish")).Text.Trim();
            //    string Notes = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxNotes")).Text.Trim();
            //    SqlDataAdapter adp = new SqlDataAdapter("Update BidM_DurationPunish set StageName= @StageName, Duration=@Duration, Punish=@Punish,Notes=@Notes where PunishID = " + e.CommandArgument + " ", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            //    adp.SelectCommand.Parameters.AddWithValue("@StageName", StageName);
            //    adp.SelectCommand.Parameters.AddWithValue("@Duration", Duration);
            //    adp.SelectCommand.Parameters.AddWithValue("@Punish", Punish);
            //    adp.SelectCommand.Parameters.AddWithValue("@Notes", Notes);


            //    DataSet ds = new DataSet();
            //    adp.Fill(ds);

            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);
            //}
            //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            //{
            //    int ID_class = Convert.ToInt32(e.CommandArgument);
            //    if (e.CommandName == "select")
            //    {

            //        Label UUID = (Label)GridView1.Rows[ID_class].FindControl("UID");
            //        Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
            //        Session["uid"] = UUID.Text;
            //        Session["PriceID"] = PriceID.Text;
            //        //OpenNewWindow("AnalysisV.aspx?PriceID=" + PriceID.Text+"");
            //        Response.Write("<script>window.open('AnalysisQEdit.aspx?PriceID=" + PriceID.Text + "','_blank')</script>");

            //    }
            //}
        }
        protected void LoadTxCNumber()
        {
         
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label id = item.FindControl("id") as Label;
                    TextBox TxCNumber = (TextBox)item.FindControl("TxCNumber") as TextBox;
                }
            }

        }
        protected void Save_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if(item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                   
                    Label id = item.FindControl("id") as Label;
                    TextBox TxCNumber = (TextBox)item.FindControl("TxCNumber") as TextBox;
                    int Number = 0;

                    bool output = int.TryParse(TxCNumber.Text, out Number);
                    if (output)
                    {
                        //if (TxCNumber.Text != "")
                        //{
                        string ID = id.Text;
                        string number = TxCNumber.Text;
                        SqlDataAdapter adp = new SqlDataAdapter("UPDATE Bid_AnaRelation SET CNumber= @CNumber  WHERE [UID] ='" + id.Text + "'", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
                      
                        adp.SelectCommand.Parameters.AddWithValue("@CNumber", number);
                       
                        DataSet ds = new DataSet();
                        adp.Fill(ds);

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);
                        //}
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請輸入數字');", true);
                    }
                }
            }
        }

        protected void Recovery_Click(object sender, EventArgs e)
        {
          
            Repeater1.DataBind();
        }
    }
}