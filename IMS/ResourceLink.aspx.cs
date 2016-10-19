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
    public partial class ResourceLink : System.Web.UI.Page
    {
        protected string ParentID="0";
        protected string MaxSortNum;
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["Bid"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                //Session["search"] = false;
                SqlDataSource1.SelectCommand = Sql;
                LoadContent();
            }
           
          
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                SqlDataSource1.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";
                        
            }
            else
            {
                //SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=" + PriceID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
                //SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where  b.BID=" + Session["bid"].ToString() + "and b.ItemKind='拆工拆料項' or b.ItemKind='連工帶料項' order by A.SortNum";
                SqlDataSource1.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + "";
            }
            string database = Session["DatabaseName"].ToString();
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
            //SqlDataSource sql = new SqlDataSource();
            SqlDataSource1.SelectCommand = Sql;
                   
        }

        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString="";
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                 SQLString = "select * from  Bid_Library where PriceID=" + PriceID + "";
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
                if (SystemSet.GetRequestSet("UID") != "")
                {
                    SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID where a.UID=" + SystemSet.GetRequestSet("UID") + "";
                }
                //else
                //{
                //     SQLString = "Select  *  from Bid_WBS a left join  Bid_Library b on a.PriceID = b.PriceID ";
                //}
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
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //ViewState["all"] = false;
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
            //Session["FdSearch"] = FdSearch;
            Sql = "";
            string SelectString = "";
            if (PriceID == "")
            {
                PriceID = "0";
            }
            SqlDataSource1.SelectCommand = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";
            Sql = SqlDataSource1.SelectCommand;
            //Sql = SqlDataSource1.SelectCommand;
            //SelectString = (DDL_Res.SelectedValue == "1") ? "Complex = " + DDL_Res.SelectedValue + " " : "Complex != 1 ";
            //SelectString += (FdSearch != "") ? "" + DDL_Op2.SelectedValue + " ItemName like '%" + FdSearch + "%' " : "";
            //SelectString = (SelectString.Length > 1) ? " and " + SelectString + " " : "";
            SelectString = (DDL_Res.SelectedItem.Text != "" && DDL_Res.SelectedItem.Text != "-請選擇-") ? "ItemKind like '%" + DDL_Res.SelectedItem.Text + "%'" : "";
            if ((DDL_Res.SelectedItem.Text != "" && DDL_Res.SelectedItem.Text != "-請選擇-") && FdSearch == "")
            {
                SelectString += "";
            }
            else if ((DDL_Res.SelectedItem.Text != "" && DDL_Res.SelectedItem.Text != "-請選擇-") && FdSearch != "")
            {
                SelectString += DDL_Op2.SelectedValue + " ItemName like '%" + FdSearch + "%'";
            }
            else if ((DDL_Res.SelectedItem.Text == "" || DDL_Res.SelectedItem.Text == "-請選擇-") && FdSearch != "" && DDL_Op2.SelectedValue == "and NOT")
            {
                SelectString += (FdSearch != "") ? "not ItemName like '%" + FdSearch + "%'" : "";
            }
            else if ((DDL_Res.SelectedItem.Text == "" || DDL_Res.SelectedItem.Text == "-請選擇-") && FdSearch != "")
            {
                SelectString += (FdSearch != "") ? " ItemName like '%" + FdSearch + "%'" : "";
            }
            //Sql += SelectString;
            if (SelectString != "")
            {
                SqlDataSource1.SelectCommand = Sql + " and " + SelectString;
            }
            else
            {
                SqlDataSource1.SelectCommand = Sql;
            }
            //Session["search"] = true;
            Sql = SqlDataSource1.SelectCommand;
            //Response.Redirect("ResourceLink.aspx?PriceID=" + PriceID+"");
            GridView1.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            Session["search"] = false;
            //SqlDataSource1.SelectCommand = "";
            //GridView1.DataBind();
            //ViewState["all"] = true;
            Sql = "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + ParentID + ") and PriceID<>" + ParentID + "";
            SqlDataSource1.SelectCommand = Sql;
            //Response.Redirect("ResourceLink.aspx?PriceID=" + PriceID + "");
            GridView1.DataBind();
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                    return "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + ParentID + ") and PriceID<>" + ParentID + "";

                }
                else
                {
                    return ViewState["Sql"].ToString();
                }
            }
            set
            {
                ViewState["Sql"] = value;
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            int NewSortNum=0;
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Select")
            {
               
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                if (ParentID != "")
                {
                    string SQLMaxSort = "Select MAX(SortNum) as SortNum  from  Bid_Library a left join Bid_AnaRelation b on a.PriceID=b.KidID where  a.BID=" + Session["Bid"].ToString() + " and b.ParentID =" + ParentID + "";

                    DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLMaxSort);
                    if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                    {
                        foreach (DataRow row in DataTableBox.Rows)
                        {

                            MaxSortNum = row["SortNum"].ToString();

                        }

                    }
                    NewSortNum = MaxSortNum != "" ? int.Parse(MaxSortNum) + 1 : 1;
                }
               
                //ParentID = ParentID != "" ? ParentID : "0";
                if (ParentID !="")
                {
                string SQLString = "insert into  Bid_AnaRelation  ([SortNum],[ParentID],[KidID]) VALUES(" + NewSortNum + "," + ParentID + ", " + PriceID + ")";
                WebModel.SQLAction(database, SQLString);
                }
                //else if (ParentID =="")
                //{
                //string SQLUdL = "Update Bid_Library set Complex=1 where PriceID="+ PriceID + "";
                //string SQLUdWBS = "Update Bid_WBS set PriceID=" + PriceID + " where UID=" + SystemSet.GetRequestSet("UID")+"";                
                //WebModel.SQLAction(database, SQLUdL);
                //WebModel.SQLAction(database, SQLUdWBS);
                //}
               
                    //int UID = (int)GridView1.DataKeys[ID_class].Value;
                    //string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                    //Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                Session["ResourceLinkPriceID"] = PriceID + "ξ" + ItemName.Text;
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已新增連結');", true);
                Response.Write("<script>window.opener.document.getElementById('callback').click();</script>");
                Response.Write("<script> window.close();</script>");
            }
            if (e.CommandName == "analyst")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                Response.Write("<script>window.open('AnalysisV.aspx?PriceId=" + UID + "','_blank')</script>");
            }
        }
    }
}