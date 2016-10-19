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
    public partial class AnalysisV_EWBS : System.Web.UI.Page
    {
        
        protected string ParentID;
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        string WUID = (SystemSet.GetRequestSet("UID") != "") ? SystemSet.GetRequestSet("UID") : "";
        string EWID = (SystemSet.GetRequestSet("ewid") != "") ? SystemSet.GetRequestSet("ewid") : "";

        protected void Page_Load(object sender, EventArgs e)
        {

            LoadContent();

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (PriceID != "")
            {

                SqlDataSource1.SelectCommand = "Select  *  from Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID left join EBudget_WBS c on b.PriceID=c.PriceID where a.ParentID=" + ParentID + " and b.PID=" + Session["ProjectCode"].ToString() + " order by A.SortNum";
                
            }
            else
            {


                SqlDataSource1.SelectCommand = "Select  *  from Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID left join EBudget_WBS c on b.PriceID=c.PriceID where b.PID=" + Session["ProjectCode"].ToString() + " order by A.SortNum";
            }
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
           
            if (PriceID != "" && WUID == "" && EWID == "")
            {
                string SQLString = "Select  *  from  Pro_Resource  where PriceID ='" + SystemSet.GetRequestSet("PriceID") + "'";
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
            else if (PriceID != "" && EWID != "")
            {
                string SQLString = "Select  *  from EBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.EWID=" + EWID;

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

            else
            {
                string SQLString = "Select  *  from EBudget_WBS a left join  Pro_Resource b on a.PriceID = b.PriceID where a.EWID='" + WUID + "'";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                string Pid;
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Pid = row["Pid"].ToString();
                        string SQL = "Select  *  from EBudget_WBS Where Pid=" + Pid;
                        DataTable DataTableBox1 = WebModel.LoadSetContentData(database, SQL);
                        int[] UID = new int[DataTableBox1.Rows.Count];
                        int[] UpperUID = new int[DataTableBox1.Rows.Count];
                        string[] ItemOrder = new string[DataTableBox1.Rows.Count];
                        if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
                        {
                            int count = 0;
                            foreach (DataRow rows in DataTableBox1.Rows)
                            {
                                UID[count] = int.Parse(rows["EWID"].ToString());
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
                Label ItemName = (Label)e.Row.FindControl("ItemName");
               
                ImageButton Complex = (ImageButton)e.Row.FindControl("Complex");
                ImageButton Complex1 = (ImageButton)e.Row.FindControl("Complex1");

                Number.Text = (Number.Text != "") ? Number.Text : "0";
                Number.Style.Add("float", "right");
                ItemName.Style.Add("float", "left");
                string com = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString();
                //string com1 = DataBinder.Eval(e.Row.DataItem, "ItemKind").ToString();

                Complex.Visible = com == "拆工拆料項" ? Complex.Visible = true : false;
                Complex1.Visible = com != "拆工拆料項" ? Complex1.Visible = true : com == "" ? (Complex1.Visible == true) : false;
              

            }

        }
        public void OpenNewWindow(string url)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=700,width=1200";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', '{1}');</script>", url, winFeatures));
        }
      
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "select")
            {

                Label UID = (Label)GridView1.Rows[ID_class].FindControl("UID");
                Label PriceID = (Label)GridView1.Rows[ID_class].FindControl("PriceID");
                Session["EWid"] = UID.Text;
                Session["PriceID"] = PriceID.Text;
                OpenNewWindow("AnalysisV_EWBS.aspx?PriceID=" + PriceID.Text + "");

                //Response.Write("<script>window.open('AnalysisV_EWBS.aspx?PriceID=" + PriceID.Text + "')</script>");

            }
        }
       
    }
}