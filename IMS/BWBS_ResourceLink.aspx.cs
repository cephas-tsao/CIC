using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS
{
    public partial class BWBS_ResourceLink : System.Web.UI.Page
    {
        protected string ParentID = "";
        protected string MaxSortNum;
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";

        protected void Page_Load(object sender, EventArgs e)
        {
                  

            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["ProjectCode"] == null)))
            {
                Response.Redirect("Main.aspx");
            }
            string database = Session["DatabaseName"].ToString();
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                //Session["search"] = false;
                SqlDataSource1.SelectCommand = Sql;
              
                LoadContent();
                if (PriceID == "")
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 目前尚未連結工料，是否新增連結?');", true);
                }
            }
           

       
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                SqlDataSource1.SelectCommand = "select * from  Pro_Resource where  PID=" + Session["ProjectCode"].ToString() + " AND PriceID not in (select KidID from Pro_Analysis where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";
                Sql = SqlDataSource1.SelectCommand;
            }
            else
            {
                //SqlDataSource1.SelectCommand = "Select  *  from Bid_AnaRelation a left join Bid_Library b on a.KidID=b.PriceID left join Bid_WBS c on b.PriceID=c.PriceID where a.ParentID=" + PriceID + " and b.BID=" + Session["bid"].ToString() + " order by A.SortNum";
                SqlDataSource1.SelectCommand = "Select  *  from Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID left join EBudget_WBS c on b.PriceID=c.PriceID where  b.PID=" + Session["ProjectCode"].ToString() + " order by A.SortNum";
            }
           
            string FdSearch = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSearch.Text));
            SqlDataSource1.SelectCommand = Sql;
        }

        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString;
            if (SystemSet.GetRequestSet("PriceID") != "")
            {
                SQLString = "select * from  Pro_Resource where PriceID=" + PriceID + "";
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
                        //string PriceID1 = row["PriceID"].ToString();
                       
                    }
                }
              
            }
            else
            {
                if (SystemSet.GetRequestSet("UID") != "")
                {
                    SQLString = "Select  *  from EBudget_WBS a left join  Pro_Resource b on a.PriceID = b.PriceID where a.WID=" + SystemSet.GetRequestSet("UID") + "";
                }
                else
                {
                    SQLString = "";
                }
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
            SqlDataSource1.SelectCommand = "select * from  Pro_Resource where  PID=" + Session["ProjectCode"].ToString() + " AND PriceID not in (select KidID from Pro_Analysis where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";
            Sql = SqlDataSource1.SelectCommand;
           
            //SqlDataSource1.SelectCommand = "select * from  Pro_Resource where  PID=" + Session["ProjectCode"].ToString() + " AND PriceID not in (select KidID from Pro_Analysis where ParentID=" + PriceID + ") and PriceID<>" + PriceID + "";
            SelectString = (DDL_Res.SelectedValue == "1") ? "Complex = " + DDL_Res.SelectedValue + " " : "Complex != 1 ";
            SelectString += (FdSearch != "") ? "" + DDL_Op2.SelectedValue + " ItemName like '%" + FdSearch + "%' " : "";
            SelectString = (SelectString.Length > 1) ? " and " + SelectString + " " : "";

            Sql += SelectString;
            SqlDataSource1.SelectCommand = Sql;
            GridView1.DataBind();
        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            Session["search"] = false;
            //SqlDataSource1.SelectCommand = "";
            //GridView1.DataBind();
            //ViewState["all"] = true;
            Sql = "select * from  Pro_Resource where  PID=" + Session["ProjectCode"].ToString() + " AND PriceID not in (select KidID from Pro_Analysis where ParentID=" + ParentID + ") and PriceID<>" + ParentID + "";
            //SqlDataSource1.SelectCommand = Sql;
            //Response.Redirect("ResourceLink.aspx?PriceID=" + PriceID + "");
            GridView1.DataBind();
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null)
                {
                    return "select * from  Pro_Resource where  PID=" + Session["ProjectCode"].ToString() + " ";

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
            int NewSortNum = 0;
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Select")
            {

                int UID = (int)GridView1.DataKeys[ID_class].Value;
                string PriceID = ((Label)GridView1.Rows[ID_class].FindControl("PriceID")).Text.Trim();
                Label ItemName = (Label)GridView1.Rows[ID_class].FindControl("ItemName");
                Session["PriceID"] = PriceID + "ξ" + ItemName.Text;

                if (ParentID != "")
                {
                    string SQLMaxSort = "Select MAX(SortNum) as SortNum  from  Pro_Resource a left join Pro_Analysis b on a.PriceID=b.KidID where  a.PID=" + Session["ProjectCode"].ToString() + " and b.ParentID =" + ParentID + "";

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
                
               
                if (ParentID != "")
                {
                    string SQLString = "insert into  Pro_Analysis  ([SortNum],[ParentID],[KidID]) VALUES(" + NewSortNum + "," + ParentID + ", " + PriceID + ")";
                    WebModel.SQLAction(database, SQLString);
                }
                else if (ParentID == "" && SystemSet.GetRequestSet("UID") !="")
                {
                    string SQLUdL = "Update Pro_Resource set Complex=1 where PriceID=" + PriceID + "";
                    string SQLUdWBS = "Update EBudget_WBS set PriceID=" + PriceID + " where UID=" + SystemSet.GetRequestSet("UID") + "";
                    WebModel.SQLAction(database, SQLUdL);
                    WebModel.SQLAction(database, SQLUdWBS);
                }
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已新增連結');", true);
          
                Response.Write("<script>window.opener.document.getElementById('callback').click();</script>");
                Response.Write("<script> window.close();</script>");   
            }
            if (e.CommandName == "analyst")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                Response.Write("<script>window.open('AnalysisV_BWBS.aspx?PriceId=" + UID + "','_blank')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Button Complex = (Button)e.Row.FindControl("Complex");
               
                    string Complex1 = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();
                    Complex.Visible = Complex1 == "1" ? Complex.Visible = true : Complex1 == "" ? (Complex.Visible == false) : Complex1 == "0" ? (Complex.Visible == false) : false;
                
            }
        }
        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    GridView1.DataBind();
        //}

    }
}