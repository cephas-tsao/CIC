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
    public partial class AnalysisV_BWBS : System.Web.UI.Page
    {
        protected string ParentID;
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        string WUID = (SystemSet.GetRequestSet("UID") != "") ? SystemSet.GetRequestSet("UID") : "";
        string CWID = (SystemSet.GetRequestSet("CWID") != "") ? SystemSet.GetRequestSet("CWID") : "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            LoadContent();

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (WUID != "" && PriceID != "")
            {

                SqlDataSource1.SelectCommand = "Select  *  from Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID left join CBudget_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.PID=" + Session["ProjectCode"].ToString() + " order by A.SortNum";
                
            }
            else
            {


                SqlDataSource1.SelectCommand = "Select  *  from Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID left join CBudget_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.PID=" + Session["ProjectCode"].ToString() + " order by A.SortNum";
            }
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            if (PriceID != "" && WUID == "" && CWID !="")
            {
                string SQLString = "Select  *  from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.CWID ='" + SystemSet.GetRequestSet("CWID") + "' and b.PriceID='" + SystemSet.GetRequestSet("PriceID") + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbItemOrder.Text = row["ItemOrder"].ToString();
                        LbName.Text = row["ItemName"].ToString();
                        LbUnit.Text = row["Unit"].ToString();
                        LbCode.Text = row["Code"].ToString();
                        LbAnaNumber.Text = row["AnaNumber"].ToString();
                        ParentID = row["PriceID"].ToString();
                    }
                }
            }
            else if (PriceID != "" && WUID == "")
            {
                string SQLString = "Select  *  from Pro_Resource  where PriceID='" + SystemSet.GetRequestSet("PriceID") + "'";
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
                string SQLString = "Select  *  from CBudget_WBS a left join  Pro_Resource b on a.PriceID = b.PriceID where a.UID='" + WUID + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                string Pid;
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Pid = row["Pid"].ToString();
                        string SQL = "Select  *  from CBudget_WBS Where Pid=" + Pid;
                        DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQL);
                        int[] UID = new int[DataTableBox1.Rows.Count];
                        int[] UpperUID = new int[DataTableBox1.Rows.Count];
                        string[] ItemOrder = new string[DataTableBox1.Rows.Count];
                        if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                        {
                            int count = 0;
                            foreach (DataRow rows in DataTableBox1.Rows)
                            {
                                UID[count] = int.Parse(rows["WID"].ToString());
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
                        LbAnaNumber.Text = row["Number"].ToString();
                        ParentID = row["PriceID"].ToString();
                        LbItemOrder.Text = row["ItemOrder"].ToString();
                        //LbItemOrder.Text = WebModel.gen_OrderCode(int.Parse(Session["Wid"].ToString()), UID, UpperUID, ItemOrder);

                    }
                }

            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Number = (Label)e.Row.FindControl("Number");
               
                ImageButton Complex = (ImageButton)e.Row.FindControl("Complex");
                ImageButton Complex1 = (ImageButton)e.Row.FindControl("Complex1");

                Number.Text = (Number.Text != "") ? Number.Text : "0";
               
                string com = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();
                string com1 = DataBinder.Eval(e.Row.DataItem, "Complex").ToString();

               
                Complex.Visible = com == "1" ? Complex.Visible = true : com == "" ? (Complex.Visible = false) : com == "0" ? (Complex.Visible = false) : false;
                Complex1.Visible = com1 == "0" ? Complex1.Visible = true : com1 == "" ? (Complex1.Visible = true) : com1 == "1" ? (Complex1.Visible = false) : false;
              

            }

        }
        public void OpenNewWindow(string url)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=1000,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', '{1}');</script>", url, winFeatures));
        }
      
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "select")
            {

                Label UUID = (Label)GridView1.Rows[ID_class].FindControl("WID");
                Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                if (UUID != null)
                {
                    Session["Wid"] = UUID.Text;
                }
                if (PriceID != null)
                {
                    Session["PriceID"] = PriceID.Text;
                }
            
                Response.Write("<script>window.open('AnalysisV_BWBS.aspx?PriceID=" + PriceID.Text + "', 'window','height=570,width=1200')</script>");
                //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
            }
        }
       
    }
}